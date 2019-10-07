Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 52095CEA20
	for <lists+dri-devel@lfdr.de>; Mon,  7 Oct 2019 19:08:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 194E589CAC;
	Mon,  7 Oct 2019 17:08:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CDC0889CAC
 for <dri-devel@lists.freedesktop.org>; Mon,  7 Oct 2019 17:08:11 +0000 (UTC)
Received: from pendragon.ideasonboard.com
 (modemcable118.64-20-96.mc.videotron.ca [96.20.64.118])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id BCFCFB2D;
 Mon,  7 Oct 2019 19:08:07 +0200 (CEST)
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 0/5] Fix SPI module alias for panels used by omapdrm
Date: Mon,  7 Oct 2019 20:07:56 +0300
Message-Id: <20191007170801.27647-1-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=ideasonboard.com; s=mail; t=1570468089;
 bh=4Gj4RhYZzKijpIuYmGJ34VXZSQIXNE9yD6ONdNHnMOk=;
 h=From:To:Cc:Subject:Date:From;
 b=Ax+Ja6FIQglE9Hsggbihu9uQmQTlGzRfdtO/sNVBUPQiBaBU9pW0ADfERjgBSytVM
 IKE4ILLfKW3FLfxeR5Qnq3phuLbzpX706EqVHDQZqabYlgvMS39i5nxoWlX+NN/n73
 +TaHpfANYIKtdSFhxmAfOfUb/3qZ6oi+ut7gAG3M=
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
Cc: linux-omap@vger.kernel.org, Tony Lindgren <tony@atomide.com>,
 "H. Nikolaus Schaller" <hns@goldelico.com>, Jyri Sarha <jsarha@ti.com>,
 Tomi Valkeinen <tomi.valkeinen@ti.com>, thierry.reding@gmail.com,
 letux-kernel@openphoenux.org, sam@ravnborg.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGVsbG8sCgpUaGlzIHBhdGNoIHNlcmllcyBmaXhlcyBhIG1vZHVsZSBhbGlhcyBpc3N1ZSB3aXRo
IHRoZSBmaXZlIHJlY2VudGx5CmFkZGVkIHBhbmVsIGRyaXZlcnMgdXNlZCBieSBvbWFwZHJtLgoK
QmVmb3JlIHRob3NlIHBhbmVsIGRyaXZlcnMsIG9tYXBkcm0gaGFkIGN1c3RvbSBkcml2ZXJzIGZv
ciB0aGUgcGFuZWxzLAphbmQgcHJlZml4ZWQgdGhlIE9GIGNvbXBhdGlibGUgc3RyaW5ncyB3aXRo
IGFuICJvbWFwZHNzLCIgcHJlZml4LiBUaGUKU1BJIGRldmljZSBJRHMgYXJlIGNvbnN0cnVjdGVk
IGJ5IHN0cmlwcGluZyB0aGUgT0YgY29tcGF0aWJsZSBzdHJpbmcKZnJvbSB0aGUgcHJlZml4LCBy
ZXN1bHRpbmcgaW4gdGhlICJvbWFwZHNzLCIgcHJlZml4IGJlaW5nIHJlbW92ZWQsIGJ1dAp0aGUg
c3Vic2VxdWVuY2UgT0YgdmVuZG9yIHByZWZpeCBiZWluZyBrZXB0LiBUaGUgU1BJIGRyaXZlcnMg
dGh1cyBoYWQKbW9kdWxlcyBhbGlhc2VzIHRoYXQgY29udGFpbmVkIHRoZSB2ZW5kb3IgcHJlZml4
LgoKTm93IHRoYXQgdGhlIHBhbmVscyBhcmUgc3VwcG9ydGVkIGJ5IHN0YW5kYXJkIGRyaXZlcnMg
YW5kIHRoZSAib21hcGRzcywiCnByZWZpeCBpcyByZW1vdmVkLCB0aGUgU1BJIGRldmljZSBJRHMg
YXJlIHN0cmlwcGVkIGZyb20gdGhlIE9GIHZlbmRvcgpwcmVmaXguIEFzIHRoZSBuZXcgcGFuZWwg
ZHJpdmVycyBjb3BpZWQgdGhlIG1vZHVsZSBhbGlhc2VzIGZyb20gdGhlCm9tYXBkcm0tc3BlY2lm
aWMgZHJpdmVycywgdGhleSBjb250YWluIHRoZSB2ZW5kb3IgcHJlZml4IGluIHRoZWlyIFNQSQpt
b2R1bGUgYWxpYXNlcywgYW5kIGFyZSB0aHVzIG5vdCBsb2FkZWQgYXV0b21hdGljYWxseS4KCkZp
eCB0aGlzIGJ5IHJlbW92aW5nIHRoZSB2ZW5kb3IgcHJlZml4IGZyb20gdGhlIFNQSSBtb2R1bGVz
IGFsaWFzZXMgaW4KdGhlIGRyaXZlcnMuIEZvciBjb25zaXN0ZW5jeSByZWFzb24sIHRoZSBtYW51
YWwgbW9kdWxlIGFsaWFzZXMgYXJlIGFsc28KbW92ZWQgdG8gdXNlIGFuIFNQSSBtb2R1bGUgdGFi
bGUuCgpUaGVzZSBwYXRjaGVzIGFyZSBiYXNlZCBvbiB0aGUgZHJtLW1pc2MtZml4ZXMgYnJhbmNo
IGFzIHRoZXkgZml4IHY1LjQKcmVncmVzc2lvbnMuCgpMYXVyZW50IFBpbmNoYXJ0ICg1KToKICBk
cm0vcGFuZWw6IGxnLWxiMDM1cTAyOiBGaXggU1BJIGFsaWFzCiAgZHJtL3BhbmVsOiBuZWMtbmw4
MDQ4aGwxMTogRml4IFNQSSBhbGlhcwogIGRybS9wYW5lbDogc29ueS1hY3g1NjVha206IEZpeCBT
UEkgYWxpYXMKICBkcm0vcGFuZWw6IHRwby10ZDAyOHR0ZWMxOiBGaXggU1BJIGFsaWFzCiAgZHJt
L3BhbmVsOiB0cG8tdGQwNDNtdGVhMTogRml4IFNQSSBhbGlhcwoKIGRyaXZlcnMvZ3B1L2RybS9w
YW5lbC9wYW5lbC1sZy1sYjAzNXEwMi5jICAgIHwgOSArKysrKysrKy0KIGRyaXZlcnMvZ3B1L2Ry
bS9wYW5lbC9wYW5lbC1uZWMtbmw4MDQ4aGwxMS5jIHwgOSArKysrKysrKy0KIGRyaXZlcnMvZ3B1
L2RybS9wYW5lbC9wYW5lbC1zb255LWFjeDU2NWFrbS5jIHwgOSArKysrKysrKy0KIGRyaXZlcnMv
Z3B1L2RybS9wYW5lbC9wYW5lbC10cG8tdGQwMjh0dGVjMS5jIHwgMyArLS0KIGRyaXZlcnMvZ3B1
L2RybS9wYW5lbC9wYW5lbC10cG8tdGQwNDNtdGVhMS5jIHwgOSArKysrKysrKy0KIDUgZmlsZXMg
Y2hhbmdlZCwgMzMgaW5zZXJ0aW9ucygrKSwgNiBkZWxldGlvbnMoLSkKCi0tIApSZWdhcmRzLAoK
TGF1cmVudCBQaW5jaGFydAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0
b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJp
LWRldmVs
