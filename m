Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CCA11DCE2D
	for <lists+dri-devel@lfdr.de>; Fri, 18 Oct 2019 20:38:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EF51A6EB9A;
	Fri, 18 Oct 2019 18:37:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from lb1-smtp-cloud8.xs4all.net (lb1-smtp-cloud8.xs4all.net
 [194.109.24.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1CA6F6E9FA
 for <dri-devel@lists.freedesktop.org>; Thu, 17 Oct 2019 07:28:47 +0000 (UTC)
Received: from tschai.fritz.box ([46.9.232.237])
 by smtp-cloud8.xs4all.net with ESMTPA
 id L0DCiNIhkPduvL0DGitUVh; Thu, 17 Oct 2019 09:28:46 +0200
From: Hans Verkuil <hverkuil-cisco@xs4all.nl>
To: linux-media@vger.kernel.org
Subject: [PATCHv9 0/2] drm: tda998x: use cec_notifier_conn_(un)register
Date: Thu, 17 Oct 2019 09:28:40 +0200
Message-Id: <20191017072842.16793-1-hverkuil-cisco@xs4all.nl>
X-Mailer: git-send-email 2.23.0
MIME-Version: 1.0
X-CMAE-Envelope: MS4wfGFAX9zU26r6wlHNsYbLI+OSAqNLGbGKkUn9xVdyWxOVKD4TD5psA+QsWHW2HCyNizsE4ILeAgH+Y4I5r7hgR9GYDZk7ZrgQoAgTHN+rxRqAilBBB2cJ
 EUHnL9WnsYDfBdxnPn5QskfzTTss4modadeWrlHXk76lv+sITN37JgdoRh2jre6EuQp7XNEZVnM23Zd+FOkQcFemDk5l5WWLdKWHvl/WDNUcBRkOLidhYAmz
 UDdmtW7hn5tpP7WPScLpRsrugTf4inzQWh9fc15f3fzTO43+NZ4vj8lCK6N+NWv4fGnkCwr5AiyP7LhevXI2O+2Xctfj7Umbf3/JVZw+CloZ5CBWU29OypOl
 fUSZ+YJgswsfpSQp3e7jjNXeuFe6AA==
X-Mailman-Approved-At: Fri, 18 Oct 2019 18:37:46 +0000
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
Cc: Dariusz Marcinkiewicz <darekm@google.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 dri-devel@lists.freedesktop.org, Russell King <linux@armlinux.org.uk>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

VGhpcyBzcGxpdHMgdGhlIHByZXZpb3VzIHY3LjIgcGF0Y2ggKDEpIGludG8gdHdvIHBhcnRzOiBv
bmUgdGhhdCByZXBsYWNlcwpjZWNfbm90aWZpZXJfZ2V0L3B1dCBieSBjZWNfbm90aWZpZXJfY29u
bl8odW4pcmVnaXN0ZXIsIGFuZCBvbmUgdGhhdApzZXRzIHRoZSBjb25uZWN0b3IgaW5mby4KClRo
YXQgc2Vjb25kIHBhdGNoIG1vdmVzIHRoZSBDRUMgbm90aWZpZXIgY29kZSB0byB0ZGE5OTh4X2Jy
aWRnZV9kZXRhY2gsCmJ1dCBMYXVyZW50IGlzIG1ha2luZyBjaGFuZ2VzIGluIHRoYXQgYXJlYSBh
bmQgcHJlZmVycyB0aGF0IHRoaXMgaXNuJ3QKaW1wbGVtZW50ZWQgeWV0LgoKRGFyaXVzeiwgY2Fu
IHlvdSBjb21tZW50IG9uIHRoZSB1c2Ugb2YgdGhlIG11dGV4IGluIHRoZSBzZWNvbmQgcGF0Y2g/
ClRoaXMgc2Vjb25kIHBhdGNoIHdvbid0IGJlIG1lcmdlZCBmb3IgdjUuNSBzbyB5b3UgY2FuIHRh
a2UgeW91ciB0aW1lIDotKQoKQnV0IHRoZSByZXBsYWNlbWVudCBvZiB0aGUgY2VjX25vdGlmaWVy
X2dldC9wdXQgZnVuY3Rpb25zIGlzIHNvbWV0aGluZwp0aGF0IG5lZWRzIHRvIGJlIGZpbmlzaGVk
IGZvciB2NS41LgoKQnkgc3BsaXR0aW5nIHRoaXMgcGF0Y2ggdXAgSSBjYW4gbWVyZ2UgdGhlIGZp
cnN0IGhhbGYsIGJ1dCBkZWxheSB0aGUKc2Vjb25kIGhhbGYuIFRoaXMgdGRhIGRyaXZlciBqdXN0
IHdvbid0IGJlIGFibGUgdG8gcmVwb3J0IHRoZSBjb25uZWN0b3IKaW5mb3JtYXRpb24gaW4gdGhl
IG1lYW50aW1lLgoKQ2hhbmdlcyBzaW5jZSB2ODoKCi0gTW92ZWQgdGhlIG11dGV4IGFkZGl0aW9u
IHRvIHRoZSBzZWNvbmQgcGF0Y2ggd2hlcmUgSSB0aGluayBpdCBhY3R1YWxseQogIGJlbG9uZ3Mu
CgpSZWdhcmRzLAoKCUhhbnMKCigxKSBodHRwczovL3BhdGNod29yay5saW51eHR2Lm9yZy9wYXRj
aC81ODQ2NC8KCkRhcml1c3ogTWFyY2lua2lld2ljeiAoMik6CiAgZHJtOiB0ZGE5OTh4OiB1c2Ug
Y2VjX25vdGlmaWVyX2Nvbm5fKHVuKXJlZ2lzdGVyCiAgZHJtOiB0ZGE5OTh4OiBzZXQgdGhlIGNv
bm5lY3RvciBpbmZvCgogZHJpdmVycy9ncHUvZHJtL2kyYy90ZGE5OTh4X2Rydi5jIHwgMzggKysr
KysrKysrKysrKysrKysrKysrKy0tLS0tLS0tLQogMSBmaWxlIGNoYW5nZWQsIDI3IGluc2VydGlv
bnMoKyksIDExIGRlbGV0aW9ucygtKQoKLS0gCjIuMjMuMAoKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2
ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21h
aWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
