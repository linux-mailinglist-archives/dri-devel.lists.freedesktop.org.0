Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 29DFCF05F8
	for <lists+dri-devel@lfdr.de>; Tue,  5 Nov 2019 20:26:59 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 427A26EB60;
	Tue,  5 Nov 2019 19:26:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from andre.telenet-ops.be (andre.telenet-ops.be
 [IPv6:2a02:1800:120:4::f00:15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C41906EB44
 for <dri-devel@lists.freedesktop.org>; Tue,  5 Nov 2019 18:35:10 +0000 (UTC)
Received: from ramsan ([84.195.182.253]) by andre.telenet-ops.be with bizsmtp
 id NJb62100N5USYZQ01Jb6j8; Tue, 05 Nov 2019 19:35:08 +0100
Received: from rox.of.borg ([192.168.97.57]) by ramsan with esmtp (Exim 4.90_1)
 (envelope-from <geert@linux-m68k.org>)
 id 1iS3fW-0002sH-Ke; Tue, 05 Nov 2019 19:35:06 +0100
Received: from geert by rox.of.borg with local (Exim 4.90_1)
 (envelope-from <geert@linux-m68k.org>)
 id 1iS3fW-0005ah-I0; Tue, 05 Nov 2019 19:35:06 +0100
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
 Magnus Damm <magnus.damm@gmail.com>
Subject: [PATCH 0/3] dt-bindings: display: renesas: du: Add vendor prefix to
 vsps property
Date: Tue,  5 Nov 2019 19:35:01 +0100
Message-Id: <20191105183504.21447-1-geert+renesas@glider.be>
X-Mailer: git-send-email 2.17.1
X-Mailman-Approved-At: Tue, 05 Nov 2019 19:26:40 +0000
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
Cc: linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org,
 Geert Uytterhoeven <geert+renesas@glider.be>, dri-devel@lists.freedesktop.org
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

CUhpIGFsbCwKCldoZW4gdGhlIFJlbmVzYXMtc3BlY2lmaWMgInZzcHMiIHByb3BlcnR5IGZvciB0
aGUgUmVuZXNhcyBEaXNwbGF5IFVuaXQKd2FzIGludHJvZHVjZWQsIGl0IHdhcyBmb3Jnb3R0ZW4g
dG8gYWRkIGEgdmVuZG9yIHByZWZpeC4KCkhlbmNlIHRoaXMgcGF0Y2ggc2VyaWVzIGZpeGVzIHRo
YXQgaW4gRFQgYmluZGluZ3MsIExpbnV4IGRyaXZlciwgYW5kIERUCnNvdXJjZSBmaWxlcy4gIFRo
ZSBkcml2ZXIgcmV0YWlucyBiYWNrd2FyZCBjb21wYXRpYmlsaXR5IHdpdGggb2xkIERUQnMKYnkg
ZmFsbGluZyBiYWNrIHRvIHRoZSBvbGQgcHJvcGVydHkgbmFtZSB3aGVuIG5lZWRlZC4KClRoZSBm
aXJzdCB0d28gcGF0Y2hlcyBhcmUgYWdhaW5zdCBMYXVyZW50J3MgZHJtL2R1L25leHQgYnJhbmNo
LgpUaGUgbGFzdCBwYXRjaCBpcyBhZ2FpbnN0IHJlbmVzYXMtZGV2ZWwsIGFuZCBtdXN0IGJlIHBv
c3Rwb25lZCB1bnRpbCB0aGUKc2Vjb25kIHBhdGNoIGhhcyBsYW5kZWQgdXBzdHJlYW0uCgpUaGFu
a3MhCgpHZWVydCBVeXR0ZXJob2V2ZW4gKDMpOgogIGR0LWJpbmRpbmdzOiBkaXNwbGF5OiByZW5l
c2FzOiBkdTogQWRkIHZlbmRvciBwcmVmaXggdG8gdnNwcyBwcm9wZXJ0eQogIGRybTogcmNhci1k
dTogUmVjb2duaXplICJyZW5lc2FzLHZzcHMiIGluIGFkZGl0aW9uIHRvICJ2c3BzIgogIGFybTY0
OiBkdHM6IHJlbmVzYXM6IHJjYXItZ2VuMzogUmVwbGFjZSAidnNwcyIgYnkgInJlbmVzYXMsdnNw
cyIKCiAuLi4vZGV2aWNldHJlZS9iaW5kaW5ncy9kaXNwbGF5L3JlbmVzYXMsZHUudHh0ICB8IDEy
ICsrKysrKy0tLS0tLQogYXJjaC9hcm02NC9ib290L2R0cy9yZW5lc2FzL3I4YTc3NGExLmR0c2kg
ICAgICAgfCAgMiArLQogYXJjaC9hcm02NC9ib290L2R0cy9yZW5lc2FzL3I4YTc3NGIxLmR0c2kg
ICAgICAgfCAgMiArLQogYXJjaC9hcm02NC9ib290L2R0cy9yZW5lc2FzL3I4YTc3NGMwLmR0c2kg
ICAgICAgfCAgMyArKy0KIGFyY2gvYXJtNjQvYm9vdC9kdHMvcmVuZXNhcy9yOGE3Nzk1LWVzMS5k
dHNpICAgIHwgIDIgKy0KIGFyY2gvYXJtNjQvYm9vdC9kdHMvcmVuZXNhcy9yOGE3Nzk1LmR0c2kg
ICAgICAgIHwgIDMgKystCiBhcmNoL2FybTY0L2Jvb3QvZHRzL3JlbmVzYXMvcjhhNzc5Ni5kdHNp
ICAgICAgICB8ICAyICstCiBhcmNoL2FybTY0L2Jvb3QvZHRzL3JlbmVzYXMvcjhhNzc5NjUuZHRz
aSAgICAgICB8ICAyICstCiBhcmNoL2FybTY0L2Jvb3QvZHRzL3JlbmVzYXMvcjhhNzc5NzAuZHRz
aSAgICAgICB8ICAzICsrLQogYXJjaC9hcm02NC9ib290L2R0cy9yZW5lc2FzL3I4YTc3OTgwLmR0
c2kgICAgICAgfCAgMyArKy0KIGFyY2gvYXJtNjQvYm9vdC9kdHMvcmVuZXNhcy9yOGE3Nzk5MC5k
dHNpICAgICAgIHwgIDIgKy0KIGFyY2gvYXJtNjQvYm9vdC9kdHMvcmVuZXNhcy9yOGE3Nzk5NS5k
dHNpICAgICAgIHwgIDIgKy0KIGRyaXZlcnMvZ3B1L2RybS9yY2FyLWR1L3JjYXJfZHVfa21zLmMg
ICAgICAgICAgIHwgMTcgKysrKysrKysrKysrLS0tLS0KIDEzIGZpbGVzIGNoYW5nZWQsIDMzIGlu
c2VydGlvbnMoKyksIDIyIGRlbGV0aW9ucygtKQoKLS0gCjIuMTcuMQoKR3J7b2V0amUsZWV0aW5n
fXMsCgoJCQkJCQlHZWVydAoKLS0KR2VlcnQgVXl0dGVyaG9ldmVuIC0tIFRoZXJlJ3MgbG90cyBv
ZiBMaW51eCBiZXlvbmQgaWEzMiAtLSBnZWVydEBsaW51eC1tNjhrLm9yZwoKSW4gcGVyc29uYWwg
Y29udmVyc2F0aW9ucyB3aXRoIHRlY2huaWNhbCBwZW9wbGUsIEkgY2FsbCBteXNlbGYgYSBoYWNr
ZXIuIEJ1dAp3aGVuIEknbSB0YWxraW5nIHRvIGpvdXJuYWxpc3RzIEkganVzdCBzYXkgInByb2dy
YW1tZXIiIG9yIHNvbWV0aGluZyBsaWtlIHRoYXQuCgkJCQkJCQkgICAgLS0gTGludXMgVG9ydmFs
ZHMKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRl
dmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8v
bGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
