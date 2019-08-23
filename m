Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BCF679C6B3
	for <lists+dri-devel@lfdr.de>; Mon, 26 Aug 2019 02:19:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B85C86E15C;
	Mon, 26 Aug 2019 00:19:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from lb2-smtp-cloud7.xs4all.net (lb2-smtp-cloud7.xs4all.net
 [194.109.24.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 787FB6E06E
 for <dri-devel@lists.freedesktop.org>; Fri, 23 Aug 2019 12:21:04 +0000 (UTC)
Received: from tschai.fritz.box ([46.9.232.237])
 by smtp-cloud7.xs4all.net with ESMTPA
 id 18YtikrR6Thuu18Ywiozd6; Fri, 23 Aug 2019 14:21:03 +0200
From: Hans Verkuil <hverkuil-cisco@xs4all.nl>
To: linux-media@vger.kernel.org
Subject: [PATCHv10 0/2] cec: add the connector info API
Date: Fri, 23 Aug 2019 14:20:57 +0200
Message-Id: <20190823122059.5270-1-hverkuil-cisco@xs4all.nl>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-CMAE-Envelope: MS4wfKh+SZzZ2rShfi+p8vWdWdkw+bHyBRsIuueZcTujRPG5yVjmn4iotge5YX9orx7VYY7kWh5ODCpy2itE4U2kriexfTmLqTbCENn9vysS3vFjy4SyGKxn
 1K6Pb2YbKI65AtDzG9AgI4U3+vb2RIRlzs3Ljnlg5f+uetyGP5r2OzEyQLHCyM2Qa/pfnPNntYmps+JR4WvQzHtYCCh9eYi1VoyRs1Bcqc0R7zgbyd2Jagyj
 baD77Wx9p6MS9A0G6sj5bDXLad81vctZOnEl0luCHQU=
X-Mailman-Approved-At: Mon, 26 Aug 2019 00:18:57 +0000
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: Direct Rendering Infrastructure - Development
 <dri-devel.lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Cc: Dariusz Marcinkiewicz <darekm@google.com>, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

VGhlc2UgdHdvIHBhdGNoZXMgYWRkIHRoZSBDRUMgY29ubmVjdG9yIGluZm8gQVBJLgoKTm90ZSB0
aGF0IGNvbm5lY3RvciBpbmZvIGlzIGN1cnJlbnRseSBmb3IgZHJtIGNvbm5lY3RvcnMgb25seS4K
SW4gdGhlIGZ1dHVyZSBzdXBwb3J0IGZvciB2NGwyIGNvbm5lY3RvcnMgd2lsbCBiZSBhZGRlZCBh
cyB3ZWxsLApvbmNlIHdlIGFjdHVhbGx5IGtub3cgaG93IHRvIHVuaXF1ZWx5IGlkZW50aWZ5IGEg
SERNSSByZWNlaXZlcgpjb25uZWN0b3IuCgpSZWdhcmRzLAoKCUhhbnMKCkRhcml1c3ogTWFyY2lu
a2lld2ljeiAoMSk6CiAgY2VjOiBleHBvc2UgdGhlIG5ldyBjb25uZWN0b3IgaW5mbyBBUEkKCkhh
bnMgVmVya3VpbCAoMSk6CiAgY2VjOiBkb2N1bWVudCBDRUNfQURBUF9HX0NPTk5FQ1RPUl9JTkZP
IGFuZCBjYXBhYmlsaXR5CgogRG9jdW1lbnRhdGlvbi9tZWRpYS91YXBpL2NlYy9jZWMtZnVuY3Mu
cnN0ICAgIHwgICAxICsKIC4uLi9tZWRpYS91YXBpL2NlYy9jZWMtaW9jLWFkYXAtZy1jYXBzLnJz
dCAgICB8ICAgNiArLQogLi4uL3VhcGkvY2VjL2NlYy1pb2MtYWRhcC1nLWNvbm4taW5mby5yc3Qg
ICAgIHwgMTA1ICsrKysrKysrKysrKysrKysrKwogLi4uL21lZGlhL3VhcGkvY2VjL2NlYy1pb2Mt
ZHFldmVudC5yc3QgICAgICAgIHwgICA4ICsrCiBkcml2ZXJzL21lZGlhL2NlYy9jZWMtYWRhcC5j
ICAgICAgICAgICAgICAgICAgfCAgIDIgKwogZHJpdmVycy9tZWRpYS9jZWMvY2VjLWFwaS5jICAg
ICAgICAgICAgICAgICAgIHwgIDIwICsrKysKIGRyaXZlcnMvbWVkaWEvY2VjL2NlYy1jb3JlLmMg
ICAgICAgICAgICAgICAgICB8ICAgNSAtCiBpbmNsdWRlL21lZGlhL2NlYy5oICAgICAgICAgICAg
ICAgICAgICAgICAgICAgfCAgMzEgLS0tLS0tCiBpbmNsdWRlL3VhcGkvbGludXgvY2VjLmggICAg
ICAgICAgICAgICAgICAgICAgfCAgNDAgKysrKysrKwogOSBmaWxlcyBjaGFuZ2VkLCAxODEgaW5z
ZXJ0aW9ucygrKSwgMzcgZGVsZXRpb25zKC0pCiBjcmVhdGUgbW9kZSAxMDA2NDQgRG9jdW1lbnRh
dGlvbi9tZWRpYS91YXBpL2NlYy9jZWMtaW9jLWFkYXAtZy1jb25uLWluZm8ucnN0CgotLSAKMi4y
MC4xCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmkt
ZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6
Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
