Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D4A9CDDB90
	for <lists+dri-devel@lfdr.de>; Sun, 20 Oct 2019 02:06:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5180589C25;
	Sun, 20 Oct 2019 00:06:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mo6-p01-ob.smtp.rzone.de (mo6-p01-ob.smtp.rzone.de
 [IPv6:2a01:238:20a:202:5301::12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8A1C96EBBA
 for <dri-devel@lists.freedesktop.org>; Fri, 18 Oct 2019 18:46:51 +0000 (UTC)
X-RZG-AUTH: ":JGIXVUS7cutRB/49FwqZ7WcJeFKiMhflhwDubTJ9o1mfYzBGHXH6F3CFF60="
X-RZG-CLASS-ID: mo00
Received: from iMac.fritz.box by smtp.strato.de (RZmta 44.28.1 DYNA|AUTH)
 with ESMTPSA id R0b2a8v9IIkVDLB
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (curve secp521r1 with
 521 ECDH bits, eq. 15360 bits RSA))
 (Client did not present a certificate);
 Fri, 18 Oct 2019 20:46:31 +0200 (CEST)
From: "H. Nikolaus Schaller" <hns@goldelico.com>
To: David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
 =?UTF-8?q?Beno=C3=AEt=20Cousson?= <bcousson@baylibre.com>,
 Tony Lindgren <tony@atomide.com>
Subject: [PATCH 0/7] ARM: DTS: OMAP: add child nodes describing the PVRSGX
 present in some OMAP SoC
Date: Fri, 18 Oct 2019 20:46:23 +0200
Message-Id: <cover.1571424390.git.hns@goldelico.com>
X-Mailer: git-send-email 2.19.1
MIME-Version: 1.0
X-Mailman-Approved-At: Sun, 20 Oct 2019 00:06:45 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 t=1571424409; 
 s=strato-dkim-0002; d=goldelico.com;
 h=Message-Id:Date:Subject:Cc:To:From:X-RZG-CLASS-ID:X-RZG-AUTH:From:
 Subject:Sender;
 bh=1QwlT7mxYs3pWYaMtPoVjC+h0W2w6mR5VlLH4l4Vwo4=;
 b=CGwHAHN9LZ5/ruLyea5RU9SSksW2AsiI3CJqWY5hswlOsyZxu7ORf7HHgVmrKzQR5s
 mL7mKlB0KTfxQl24yTztiIVX5/0cxIQZOpjYsLrPVO5IZFF91Nd30Bo7kj9+F44mRKcZ
 I1I0mz9jAhUBU+gYx1QpLLN8atMVRinpbanC4R1Y6qDwr0wfIvitXtu+rhfoB9aICUil
 9F3fT0tfmfD0gyWD+MTCV3vqdqGKrdRhE/pGChyb0M450v1oSRevFJBWqWFchylFFUg9
 TUbJa1ikKuXR2n1E+b1JWKlrSFGljvLoLmcWL5LcgueqOR5eYAu+zY2wnXUpHnPKuxAf
 9zSA==
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
Cc: devicetree@vger.kernel.org, linux-omap@vger.kernel.org,
 "H. Nikolaus Schaller" <hns@goldelico.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, kernel@pyra-handheld.com,
 letux-kernel@openphoenux.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

VGhpcyBwYXRjaCBzZXQgZGVmaW5lcyBjaGlsZCBub2RlcyBmb3IgdGhlIFNHWDV4eCBpbnRlcmZh
Y2UgaW5zaWRlCnRoZSBPTUFQIFNvQyBzbyB0aGF0IGEgZHJpdmVyIGNhbiBiZSBmb3VuZCBhbmQg
cHJvYmVkIGJ5IHRoZQpjb21wYXRpYmxlIHN0cmluZ3MgYW5kIGNhbiByZXRyaWV2ZSBpbmZvcm1h
dGlvbiBhYm91dCB0aGUgU0dYIHJldmlzaW9uCnRoYXQgaXMgaW5jbHVkZWQgaW4gYSBzcGVjaWZp
YyBTb0MuIEl0IGFsc28gZGVmaW5lcyB0aGUgaW50ZXJydXB0IG51bWJlcgphbmQgdGhlIHRpbWVy
IHRvIGJlIHVzZWQgYnkgdGhlIFNHWCBkcml2ZXIuCgpUaGVyZSBpcyBjdXJyZW50bHkgbm8gbWFp
bmxpbmUgZHJpdmVyIGZvciB0aGVzZSBHUFVzLCBidXQgYSBwcm9qZWN0IFsxXQppcyBvbmdvaW5n
IHdpdGggdGhlIGdvYWwgdG8gZ2V0IHRoZSBvcGVuLXNvdXJjZSBwYXJ0IGFzIHByb3ZpZGVkIGJ5
IFRJL0lNRwppbnRvIGRyaXZlcnMvc3RhZ2luZy9wdnIuCgpUaGUga2VybmVsIG1vZHVsZXMgYnVp
bHQgZnJvbSB0aGlzIHByb2plY3QgaGF2ZSBzdWNjZXNzZnVsbHkgZGVtb25zdHJhdGVkCnRvIHdv
cmsgd2l0aCB0aGUgRFRTIGRlZmluaXRpb25zIGZyb20gdGhpcyBwYXRjaCBzZXQgb24gQU0zMzV4
IEJlYWdsZUJvbmUKQmxhY2sgYW5kIE9NQVA1IFB5cmEuIFRoZXkgcGFydGlhbGx5IHdvcmtzIG9u
IERNMzczMCBhbmQgUGFuZGFCb2FyZCBFUyBidXQKdGhhdCBpcyBsaWtlbHkgYSBwcm9ibGVtIGlu
IHRoZSBrZXJuZWwgZHJpdmVyIG9yIHRoZSAobm9uLWZyZWUpIHVzZXItc3BhY2UKYmxvYnMuCgpU
aGVyZSBpcyBwb3RlbnRpYWwgdG8gZXh0ZW5kIHRoaXMgd29yayB0byBKWjQ3ODAgKENJMjAgYm9h
cmQpIGFuZApCYW5hbmFQaS1NMyAoQTgzKSBhbmQgZXZlbiBzb21lIEludGVsIFBvdWxzYm8gYW5k
IENlZGFyVmlldyBkZXZpY2VzLgoKWzFdOiBodHRwczovL2dpdGh1Yi5jb20vb3BlbnB2cnNneC1k
ZXZncm91cAoKSC4gTmlrb2xhdXMgU2NoYWxsZXIgKDcpOgogIGR0LWJpbmRpbmdzOiBncHU6IHB2
cnNneDogYWRkIGluaXRpYWwgYmluZGluZ3MKICBBUk06IERUUzogYW0zM3h4OiBhZGQgc2d4IGdw
dSBjaGlsZCBub2RlCiAgQVJNOiBEVFM6IGFtMzUxNzogYWRkIHNneCBncHUgY2hpbGQgbm9kZQog
IEFSTTogRFRTOiBvbWFwMzogYWRkIHNneCBncHUgY2hpbGQgbm9kZQogIEFSTTogRFRTOiBvbWFw
MzZ4eDogYWRkIHNneCBncHUgY2hpbGQgbm9kZQogIEFSTTogRFRTOiBvbWFwNDogYWRkIHNneCBn
cHUgY2hpbGQgbm9kZQogIEFSTTogRFRTOiBvbWFwNTogYWRkIHNneCBncHUgY2hpbGQgbm9kZQoK
IC4uLi9kZXZpY2V0cmVlL2JpbmRpbmdzL2dwdS9pbWcscHZyc2d4LnR4dCAgICB8IDc2ICsrKysr
KysrKysrKysrKysrKysKIGFyY2gvYXJtL2Jvb3QvZHRzL2FtMzN4eC5kdHNpICAgICAgICAgICAg
ICAgICB8IDExICsrLQogYXJjaC9hcm0vYm9vdC9kdHMvYW0zNTE3LmR0c2kgICAgICAgICAgICAg
ICAgIHwgMTMgKystLQogYXJjaC9hcm0vYm9vdC9kdHMvb21hcDM0eHguZHRzaSAgICAgICAgICAg
ICAgIHwgMTMgKystLQogYXJjaC9hcm0vYm9vdC9kdHMvb21hcDM2eHguZHRzaSAgICAgICAgICAg
ICAgIHwgMTMgKystLQogYXJjaC9hcm0vYm9vdC9kdHMvb21hcDQuZHRzaSAgICAgICAgICAgICAg
ICAgIHwgMTEgKystCiBhcmNoL2FybS9ib290L2R0cy9vbWFwNDQ3MC5kdHMgICAgICAgICAgICAg
ICAgfCAxNiArKysrCiBhcmNoL2FybS9ib290L2R0cy9vbWFwNS5kdHNpICAgICAgICAgICAgICAg
ICAgfCAxMiArKy0KIDggZmlsZXMgY2hhbmdlZCwgMTM4IGluc2VydGlvbnMoKyksIDI3IGRlbGV0
aW9ucygtKQogY3JlYXRlIG1vZGUgMTAwNjQ0IERvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5k
aW5ncy9ncHUvaW1nLHB2cnNneC50eHQKIGNyZWF0ZSBtb2RlIDEwMDY0NCBhcmNoL2FybS9ib290
L2R0cy9vbWFwNDQ3MC5kdHMKCi0tIAoyLjE5LjEKCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxp
c3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFu
L2xpc3RpbmZvL2RyaS1kZXZlbA==
