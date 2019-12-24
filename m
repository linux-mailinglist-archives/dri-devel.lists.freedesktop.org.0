Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DD1A812A751
	for <lists+dri-devel@lfdr.de>; Wed, 25 Dec 2019 11:20:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 994D66E0C1;
	Wed, 25 Dec 2019 10:20:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net
 [217.70.183.196])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DBBEE89C69
 for <dri-devel@lists.freedesktop.org>; Tue, 24 Dec 2019 14:39:05 +0000 (UTC)
X-Originating-IP: 91.224.148.103
Received: from localhost.localdomain (unknown [91.224.148.103])
 (Authenticated sender: miquel.raynal@bootlin.com)
 by relay4-d.mail.gandi.net (Postfix) with ESMTPSA id 80D8FE0003;
 Tue, 24 Dec 2019 14:39:01 +0000 (UTC)
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 Sandy Huang <hjc@rock-chips.com>, Heiko Stuebner <heiko@sntech.de>,
 <linux-rockchip@lists.infradead.org>
Subject: [PATCH v2 00/11] Add PX30 LVDS support
Date: Tue, 24 Dec 2019 15:38:49 +0100
Message-Id: <20191224143900.23567-1-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-Mailman-Approved-At: Wed, 25 Dec 2019 10:19:18 +0000
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.29
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
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Maxime Chevallier <maxime.chevallier@bootlin.com>,
 Paul Kocialkowski <paul.kocialkowski@bootlin.com>,
 Rob Herring <robh+dt@kernel.org>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGVsbG8sCgpUaGlzIHNlcmllcyBhaW1zIGF0IHN1cHBvcnRpbmcgTFZEUyBvbiBQWDMwLgoKQSBm
aXJzdCBjb3VwbGUgb2YgcGF0Y2hlcyB1cGRhdGUgdGhlIGRvY3VtZW50YXRpb24gd2l0aCB0aGUg
bmV3CmNvbXBhdGlibGUgYW5kIHRoZSBwcmVzZW5jZSBvZiBhIFBIWS4gVGhlbiwgdGhlIGV4aXN0
aW5nIFJvY2tjaGlwCmRyaXZlciBpcyBjbGVhbmVkIGFuZCBleHRlbmRlZCB0byBzdXBwb3J0IFBY
MzAgc3BlY2lmaWNpdGllcy4gRmluYWxseSwKdGhlIFBYMzAgRFRTSSBpcyB1cGRhdGVkIHdpdGgg
Q1JUQyByb3V0ZXMsIHRoZSBEU0kgRFBIWSBhbmQgdGhlIExWRFMKSVAgaXRzZWxmLgoKQ2hlZXJz
LApNaXF1w6hsCgpDaGFuZ2VzIHNpbmNlIHYxOgoqIEFkZGVkIFJvYidzIEFjay4KKiBVc2VkICJt
dXN0IiBpbnN0ZWFkIG9mICJzaG91bGQiIGluIHRoZSBiaW5kaW5ncy4KKiBQcmVjaXNlZCB0aGF0
IHBoeS1uYW1lcyBpcyBhbiBvcHRpb25hbCBwcm9wZXJ0eSBpbiB0aGUgY2FzZSBvZgogIFBYMzAu
CiogUmVuYW1lZCB0aGUgV1JJVEVfRU4gbWFjcm8gaW50byBISVdPUkRfVVBEQVRFIHRvIGJlIGFs
aWduZWQgd2l0aAogIG90aGVyIGZpbGVzLgoqIFJlbW92ZWQgZXh0cmEgY29uZmlndXJhdGlvbiwg
bm90IG5lZWRlZCBmb3IgZ2VuZXJpYyBwYW5lbHMgKHNlZQogIFNhbmR5IEh1YW5nIGFuc3dlciku
CiogRHJvcHBlZCB0aGUgZGlzcGxheS1zdWJzeXN0ZW0gcm91dGVzICh1c2VsZXNzKS4KKiBNZXJn
ZWQgdHdvIHBhdGNoZXMgdG8gYXZvaWQgcGhhbmRsZSBpbnRlcmRlcGVuZGVuY2llcyBpbiBncmFw
aHMgYW5kCiAgaW50ZXJtZWRpYXRlIGJ1aWxkIGVycm9ycy4KCk1pcXVlbCBSYXluYWwgKDExKToK
ICBkdC1iaW5kaW5nczogZGlzcGxheTogcm9ja2NoaXAtbHZkczogRGVjbGFyZSBQWDMwIGNvbXBh
dGlibGUKICBkdC1iaW5kaW5nczogZGlzcGxheTogcm9ja2NoaXAtbHZkczogRG9jdW1lbnQgUFgz
MCBQSFkKICBkcm0vcm9ja2NoaXA6IGx2ZHM6IEZpeCBpbmRlbnRhdGlvbiBvZiBhICNkZWZpbmUK
ICBkcm0vcm9ja2NoaXA6IGx2ZHM6IEhhcm1vbml6ZSBmdW5jdGlvbiBuYW1lcwogIGRybS9yb2Nr
Y2hpcDogbHZkczogQ2hhbmdlIHBsYXRmb3JtIGRhdGEKICBkcm0vcm9ja2NoaXA6IGx2ZHM6IENy
ZWF0ZSBhbiBSSzMyODggc3BlY2lmaWMgcHJvYmUgZnVuY3Rpb24KICBkcm0vcm9ja2NoaXA6IGx2
ZHM6IEhlbHBlcnMgc2hvdWxkIHJldHVybiBkZWNlbnQgdmFsdWVzCiAgZHJtL3JvY2tjaGlwOiBs
dmRzOiBQYWNrIGZ1bmN0aW9ucyB0b2dldGhlcgogIGRybS9yb2NrY2hpcDogbHZkczogQWRkIFBY
MzAgc3VwcG9ydAogIGFybTY0OiBkdHM6IHJvY2tjaGlwOiBBZGQgUFgzMCBEU0kgRFBIWQogIGFy
bTY0OiBkdHM6IHJvY2tjaGlwOiBBZGQgUFgzMCBMVkRTCgogLi4uL2Rpc3BsYXkvcm9ja2NoaXAv
cm9ja2NoaXAtbHZkcy50eHQgICAgICAgIHwgICA0ICsKIGFyY2gvYXJtNjQvYm9vdC9kdHMvcm9j
a2NoaXAvcHgzMC5kdHNpICAgICAgICB8ICA0OCArKwogZHJpdmVycy9ncHUvZHJtL3JvY2tjaGlw
L3JvY2tjaGlwX2x2ZHMuYyAgICAgIHwgNDg2ICsrKysrKysrKysrKy0tLS0tLQogZHJpdmVycy9n
cHUvZHJtL3JvY2tjaGlwL3JvY2tjaGlwX2x2ZHMuaCAgICAgIHwgIDE5ICstCiA0IGZpbGVzIGNo
YW5nZWQsIDQwMSBpbnNlcnRpb25zKCspLCAxNTYgZGVsZXRpb25zKC0pCgotLSAKMi4yMC4xCgpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwg
bWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0
cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwK
