Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 92C7D59A1C
	for <lists+dri-devel@lfdr.de>; Fri, 28 Jun 2019 14:12:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4D2FD6E8FA;
	Fri, 28 Jun 2019 12:12:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bombadil.infradead.org (bombadil.infradead.org
 [IPv6:2607:7c80:54:e::133])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3BB526E8F9;
 Fri, 28 Jun 2019 12:12:39 +0000 (UTC)
Received: from [186.213.242.156] (helo=bombadil.infradead.org)
 by bombadil.infradead.org with esmtpsa (Exim 4.92 #3 (Red Hat Linux))
 id 1hgpk3-0005Bd-Cu; Fri, 28 Jun 2019 12:12:35 +0000
Received: from mchehab by bombadil.infradead.org with local (Exim 4.92)
 (envelope-from <mchehab@bombadil.infradead.org>)
 id 1hgpk0-0004zI-5t; Fri, 28 Jun 2019 09:12:32 -0300
From: Mauro Carvalho Chehab <mchehab+samsung@kernel.org>
To: Linux Doc Mailing List <linux-doc@vger.kernel.org>
Subject: [PATCH 0/9] Some doc fixes
Date: Fri, 28 Jun 2019 09:12:22 -0300
Message-Id: <cover.1561723736.git.mchehab+samsung@kernel.org>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt;
 c=relaxed/relaxed; 
 d=infradead.org; s=bombadil.20170209; h=Sender:Content-Transfer-Encoding:
 MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=Ptxuhcj9Nnd93IGVkYIIiqtv0theLtZeYCYEFYFjzcQ=; b=iJ2Q7DMrmIn6Encrs9rppRJsg
 FeL4mBoGRLfaKCHHXrV206GIZ3P/XJemOOMbKDJ1w3SXWtsq4LYO5EGt6J8qVs2Or4osVQfUxapi/
 zjd+hS2S4uaEf7v6XI6b4710tSuAp66i3CHlRgr2MfjGGDbZW1DEQ9gmDkjZxESSIYJlH8OZ9HlkK
 TFdqcGlGS1dlQlgTpXIwtU/CKPSGpMWA5VBUVqYCF/HlnncDfCbol6UXVluUS3GBn4xs2BOZRRdne
 WnPt1VQf1Pp7XWZUQVTsRumVGa7ZhQipl4HHUoDpeOm5kmiY37Rdd4l5z+9p+ucjFP48Xjx6y80vH
 qSast0vWA==;
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
Cc: Mark Rutland <mark.rutland@arm.com>, Ajay Gupta <ajayg@nvidia.com>,
 =?UTF-8?q?Radim=20Kr=C4=8Dm=C3=A1=C5=99?= <rkrcmar@redhat.com>,
 David Airlie <airlied@linux.ie>, dri-devel@lists.freedesktop.org,
 platform-driver-x86@vger.kernel.org, linux-i2c@vger.kernel.org,
 Pavel Machek <pavel@ucw.cz>,
 Mauro Carvalho Chehab <mchehab+samsung@kernel.org>, linux-leds@vger.kernel.org,
 kvm@vger.kernel.org, Jonathan Corbet <corbet@lwn.net>,
 Maxime Ripard <maxime.ripard@bootlin.com>, Darren Hart <dvhart@infradead.org>,
 devicetree@vger.kernel.org, intel-gfx@lists.freedesktop.org,
 Mauro Carvalho Chehab <mchehab@infradead.org>,
 Rob Herring <robh+dt@kernel.org>,
 Jacek Anaszewski <jacek.anaszewski@gmail.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, Thomas Gleixner <tglx@linutronix.de>,
 Sean Paul <sean@poorly.run>, linux-kernel@vger.kernel.org,
 Paolo Bonzini <pbonzini@redhat.com>, Andy Shevchenko <andy@infradead.org>,
 Dan Murphy <dmurphy@ti.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

VGhpcyBwYXRjaCBzZXJpZXMgaXMgYWdhaW5zdCBsaW51eC1uZXh0IChuZXh0LTIwMTkwNjI3KS4g
SSBkb3VidCB0aG9zZQp3b3VsZCBhcHBseSBjbGVhbmx5IGFnYWluc3QgZG9jcyBuZXh0IHRyZWUu
CgpTbywgcGxlYXNlIGFwcGx5IGl0IHZpYSB0aGUgc3Vic3lzdGVtIHRyZWVzLiBPdGhlcndpc2Us
IHRoZXkgY291bGQKYmUgcHVzaGVkIGJ5IHRoZSBlbmQgb2YgdGhlIG1lcmdlIHdpbmRvdyBvciBm
b3IgLXJjMSB2aWEgYSBkb2NzIHRyZWUuCgpNb3N0LCBpZiBub3QgYWxsIHdlcmUgSSBhbHJlYWR5
IHNlbnQuCgoKTWF1cm8gQ2FydmFsaG8gQ2hlaGFiICg5KToKICBocnRpbWVyOiBVc2UgYSBidWxs
ZXQgZm9yIHRoZSByZXR1cm5zIGJ1bGxldCBsaXN0CiAgZG9jczogdHJhY2U6IGZpeCBhIGJyb2tl
biBsYWJlbAogIGRvY3M6IHNpZ25hbDogZml4IGEga2VybmVsLWRvYyBtYXJrdXAKICBkdDogbGVk
cy1sbTM2Mjc0LnR4dDogZml4IGEgYnJva2VuIHJlZmVyZW5jZSB0byB0aS1sbXUudHh0CiAgZG9j
czogZml4IHNvbWUgYnJva2VuIHJlZmVyZW5jZXMgZHVlIHRvIHR4dC0+cnN0IHJlbmFtZXMKICBk
b2NzOiB2aXJ0dWFsOiB0aGVyZSBhcmUgdHdvIG9ycGhhbiBkb2NzIHRoZXJlCiAgZG9jczogZ3B1
OiBhZGQgbXNtLWNyYXNoLWR1bXAucnN0IHRvIHRoZSBpbmRleC5yc3QgZmlsZQogIGRybTogZml4
IGEgcmVmZXJlbmNlIGZvciBhIHJlbmFtZWQgZmlsZTogZmIvbW9kZWRiLnJzdAogIHBsYXRmb3Jt
OiB4ODY6IGdldCByaWQgb2YgYSBub24tZXhpc3RlbnQgZG9jdW1lbnQKCiBEb2N1bWVudGF0aW9u
L2RldmljZXRyZWUvYmluZGluZ3MvYXJtL2lkbGUtc3RhdGVzLnR4dCAgIHwgMiArLQogRG9jdW1l
bnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2xlZHMvbGVkcy1sbTM2Mjc0LnR4dCB8IDIgKy0K
IERvY3VtZW50YXRpb24vZ3B1L2RyaXZlcnMucnN0ICAgICAgICAgICAgICAgICAgICAgICAgICAg
fCAxICsKIERvY3VtZW50YXRpb24vZ3B1L21zbS1jcmFzaC1kdW1wLnJzdCAgICAgICAgICAgICAg
ICAgICAgfCAyIC0tCiBEb2N1bWVudGF0aW9uL3RyYWNlL2twcm9iZXRyYWNlLnJzdCAgICAgICAg
ICAgICAgICAgICAgIHwgMSArCiBEb2N1bWVudGF0aW9uL3ZpcnR1YWwva3ZtL2FtZC1tZW1vcnkt
ZW5jcnlwdGlvbi5yc3QgICAgIHwgMiArKwogRG9jdW1lbnRhdGlvbi92aXJ0dWFsL2t2bS92Y3B1
LXJlcXVlc3RzLnJzdCAgICAgICAgICAgICB8IDIgKysKIGRyaXZlcnMvZ3B1L2RybS9kcm1fbW9k
ZXMuYyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgfCAyICstCiBkcml2ZXJzL2dwdS9kcm0v
aTkxNS9pbnRlbF9ydW50aW1lX3BtLmggICAgICAgICAgICAgICAgIHwgMiArLQogZHJpdmVycy9p
MmMvYnVzc2VzL2kyYy1udmlkaWEtZ3B1LmMgICAgICAgICAgICAgICAgICAgICB8IDIgKy0KIGRy
aXZlcnMvcGxhdGZvcm0veDg2L0tjb25maWcgICAgICAgICAgICAgICAgICAgICAgICAgICAgfCAz
IC0tLQoga2VybmVsL3NpZ25hbC5jICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICB8IDIgKy0KIGtlcm5lbC90aW1lL2hydGltZXIuYyAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgfCA3ICsrKystLS0KIDEzIGZpbGVzIGNoYW5nZWQsIDE2IGluc2VydGlvbnMo
KyksIDE0IGRlbGV0aW9ucygtKQoKLS0gCjIuMjEuMAoKCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVs
QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWls
bWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
