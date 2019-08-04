Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A2B180A1B
	for <lists+dri-devel@lfdr.de>; Sun,  4 Aug 2019 11:41:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 283F189F92;
	Sun,  4 Aug 2019 09:41:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x244.google.com (mail-lj1-x244.google.com
 [IPv6:2a00:1450:4864:20::244])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7DF5F89F92
 for <dri-devel@lists.freedesktop.org>; Sun,  4 Aug 2019 09:41:47 +0000 (UTC)
Received: by mail-lj1-x244.google.com with SMTP id v24so76831262ljg.13
 for <dri-devel@lists.freedesktop.org>; Sun, 04 Aug 2019 02:41:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :mime-version:content-transfer-encoding;
 bh=Un84htxySnyq/oPIbkJczaEF16pCyxnlWEcyUuYZ++A=;
 b=tIOJBswu4CveBEw5eD1ejvVK7kdHrRTEeEtAyN2dDXI/XQGb/2r+g1cyFrijAE42At
 e97EBZuYO+loOm4zNkZRbfTHoxvrD4mFnEMQVqLacZ8hoiYKctV8vxZmUXoAckTJ/5Fz
 6IV+6Cusp+rjAiNq/z+vspE29lLYj1AK9L+MhDcORtnuyWf64Gxpcfys/L1C0Qk0TwfN
 hQBdlWnFCpQTk+IhMCTzejhVEK3PysYBVv85rpkJT0+bkB/8oZW9F1X+X6SHTcStw4De
 tZJlnPo0HagqrcaM7aALdhYmXHMgr2xXRq2cTIDDsD0RHCaqH/HhsXUQ48htYGf2lfjd
 GsEQ==
X-Gm-Message-State: APjAAAVc+kr300QUzdw0aGJ2RIu4o/VEuYscNbDJ7uk1ZBCgRClNs1Fs
 nxrnLt3l+jQjEtWSeSF1p7FMBhz92uY=
X-Google-Smtp-Source: APXvYqzzpOhTKGfm1bk8OZZm2/IS1cErWTCwTOeEnhiTZjQDyTQ18VytbKnA7vZ6lyAxy0HDDY4axw==
X-Received: by 2002:a2e:3604:: with SMTP id d4mr25146197lja.85.1564911705326; 
 Sun, 04 Aug 2019 02:41:45 -0700 (PDT)
Received: from saturn.lan (18.158-248-194.customer.lyse.net. [158.248.194.18])
 by smtp.gmail.com with ESMTPSA id
 25sm16230194ljn.62.2019.08.04.02.41.44
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Sun, 04 Aug 2019 02:41:44 -0700 (PDT)
From: Sam Ravnborg <sam@ravnborg.org>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v2 0/4] drm: drop drmP in tda998x, tegra, arm, armada
Date: Sun,  4 Aug 2019 11:41:28 +0200
Message-Id: <20190804094132.29463-1-sam@ravnborg.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Un84htxySnyq/oPIbkJczaEF16pCyxnlWEcyUuYZ++A=;
 b=snfJhpEwOpxTOv7rx5JXLprIOInh39GnEC269uJ06AxibCy3t9kvm8xoExQwOhQ31+
 8eL6s2/G5w3jYQxBZuHAWWUA7elVp9g5fst3fXLbz0olSN5Zg81A6ZFnZPc1kd09vvZH
 bwjPH9dgw42QiRUw6oKeM8WYVnQrlcZUcOOe4H/2PFv1HPbfg3E+GmVCQtdrS50gvRLf
 qSnBiGJFiecVEhWwa8qVHZpQvLmviBHjSn+8L0uyIRlY0RNZwY2ug/l9tvu2iXI7K7tj
 ep7lopCfJvmvdcTwkZHrz/K83mv+0hyYPpoXazj5/estMkFBQwfqDP6GD/P/mgvalTBw
 Hqxg==
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
Cc: David Airlie <airlied@linux.ie>, Liviu Dudau <liviu.dudau@arm.com>,
 Russell King <linux@armlinux.org.uk>, Jonathan Hunter <jonathanh@nvidia.com>,
 Thierry Reding <thierry.reding@gmail.com>, malidp@foss.arm.com,
 linux-tegra@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

VGhpcyBzZXQgb2YgcGF0Y2hlcyBpcyBvbmUgb2YgdGhlIGZpbmFsIHN0ZXBzIGJlZm9yZQp3ZSBo
YXZlIHN1Y2NlZWRlZCB0byBzdG9wIHVzaW5nIGRybVAuaCBpbiBhbGwgb2YgZHJtLy4KClRoZXJl
IGlzIGEgZmV3IHBhdGNoZXMgaW4gZmxpZ2h0IHRocm91Z2ggb3RoZXIgdHJlZXMKYW5kIHRoZSBw
bGFuIGlzIHRoYXQgYWxsIHVzZXJzIHNoYWxsIGJlIGdvbmUgaW4gdGhlCnVwc3RyZWFtIGtlcm5l
bCBhZnRlciBuZXh0IG1lcmdlIHdpbmRvdy4KClRoZSBwYXRjaGVzIGhhcyBzZWVuIGJ1aWxkIHRl
c3Qgd2l0aCB2YXJpb3VzIGNvbmZpZ3MKd2l0aCB2YXJpb3VzIGFyY2hpdGVjdHVyZXMuCgpUaGUg
cGF0Y2hlcyBoYXMgYmVlbiBzZW50IGJlZm9yZSwgYnV0IHRvIG15IGJlc3Qga25vd2xlZGdlCnRo
ZXkgaGF2ZSBub3QgYmVlbiBhcHBsaWVkIGFueXdoZXJlLgpBbGwgZm91ciBwYXRjaGVzIGFyZSBi
YXNlZCBvbiBkcm0tbWlzYy1uZXh0LApidXQgSSBjaGVja2VkIHRoYXQgdGhlIHRkYTk5OHggcGF0
Y2ggY2FuIGJlIGFwcGxpZWQgdG8KdGhlIHRkYTk5OHggdHJlZS4KClRoZXJlIGFyZSBubyBkZXBl
bmRlbmNpZXMgYmV0d2VlbiB0aGUgcGF0Y2hlcy4KCnYyOgotIHJlYmFzZSBvbiB0b3Agb2YgZHJt
LW1pc2MtbmV4dAoKVG8gbWFpbnRhaW5lcnM6IChBc3N1bWluZyB0aGUgcGF0Y2ggYXJlIE9LKQpQ
bGVhc2UgbGV0IG1lIGtub3cgaWYgeW91IHRha2UgdGhlIHBhdGNoLCBvciByZXF1ZXN0Cm1lIHRv
IGFwcGx5IGl0IHRvIGRybS1taXNjLW5leHQuCk9yIGxldCBtZSBtZSBrbm93IGlmIHRoZSBwYXRj
aCBzaG91bGQgYmUgYmFzZWQgb24gYW5vdGhlciB0cmVlLgoKCVNhbQoKClNhbSBSYXZuYm9yZyAo
NCk6CiAgICAgIGRybS9pMmMvdGRhOTk4eDogZHJvcCB1c2Ugb2YgZHJtUC5oCiAgICAgIGRybS90
ZWdyYTogZHJvcCB1c2Ugb2YgZHJtUC5oCiAgICAgIGRybS9hcm1hZGE6IGRyb3AgdXNlIG9mIGRy
bVAuaAogICAgICBkcm0vYXJtOiBkcm9wIHVzZSBvZiBkcm1QLmgKCiBkcml2ZXJzL2dwdS9kcm0v
YXJtL2hkbGNkX2NydGMuYyAgICAgICAgfCAxMiArKysrKysrLS0tLS0KIGRyaXZlcnMvZ3B1L2Ry
bS9hcm0vaGRsY2RfZHJ2LmMgICAgICAgICB8ICA3ICsrKysrKy0KIGRyaXZlcnMvZ3B1L2RybS9h
cm0vbWFsaWRwX2NydGMuYyAgICAgICB8IDExICsrKysrKystLS0tCiBkcml2ZXJzL2dwdS9kcm0v
YXJtL21hbGlkcF9kcnYuYyAgICAgICAgfCAgOCArKysrKy0tLQogZHJpdmVycy9ncHUvZHJtL2Fy
bS9tYWxpZHBfZHJ2LmggICAgICAgIHwgIDcgKysrKy0tLQogZHJpdmVycy9ncHUvZHJtL2FybS9t
YWxpZHBfaHcuYyAgICAgICAgIHwgIDcgKysrKysrLQogZHJpdmVycy9ncHUvZHJtL2FybS9tYWxp
ZHBfbXcuYyAgICAgICAgIHwgIDUgKysrLS0KIGRyaXZlcnMvZ3B1L2RybS9hcm0vbWFsaWRwX3Bs
YW5lcy5jICAgICB8ICA0ICsrKy0KIGRyaXZlcnMvZ3B1L2RybS9hcm1hZGEvYXJtYWRhX2NydGMu
YyAgICB8IDEwICsrKysrKystLS0KIGRyaXZlcnMvZ3B1L2RybS9hcm1hZGEvYXJtYWRhX2RlYnVn
ZnMuYyB8ICA4ICsrKysrKy0tCiBkcml2ZXJzL2dwdS9kcm0vYXJtYWRhL2FybWFkYV9kcm0uaCAg
ICAgfCAgNSArKysrLQogZHJpdmVycy9ncHUvZHJtL2FybWFkYS9hcm1hZGFfZHJ2LmMgICAgIHwg
IDggKysrKysrKysKIGRyaXZlcnMvZ3B1L2RybS9hcm1hZGEvYXJtYWRhX2ZiLmMgICAgICB8ICAz
ICsrKwogZHJpdmVycy9ncHUvZHJtL2FybWFkYS9hcm1hZGFfZmJkZXYuYyAgIHwgIDMgKysrCiBk
cml2ZXJzL2dwdS9kcm0vYXJtYWRhL2FybWFkYV9nZW0uYyAgICAgfCAgNyArKysrKystCiBkcml2
ZXJzL2dwdS9kcm0vYXJtYWRhL2FybWFkYV9vdmVybGF5LmMgfCAgOCArKysrKy0tLQogZHJpdmVy
cy9ncHUvZHJtL2FybWFkYS9hcm1hZGFfcGxhbmUuYyAgIHwgIDQgKysrLQogZHJpdmVycy9ncHUv
ZHJtL2FybWFkYS9hcm1hZGFfdHJhY2UuaCAgIHwgIDUgKysrKy0KIGRyaXZlcnMvZ3B1L2RybS9p
MmMvdGRhOTk4eF9kcnYuYyAgICAgICB8ICAyICstCiBkcml2ZXJzL2dwdS9kcm0vdGVncmEvZGMu
YyAgICAgICAgICAgICAgfCAxMyArKysrKysrKystLS0tCiBkcml2ZXJzL2dwdS9kcm0vdGVncmEv
ZHBhdXguYyAgICAgICAgICAgfCAgNSArKystLQogZHJpdmVycy9ncHUvZHJtL3RlZ3JhL2RybS5j
ICAgICAgICAgICAgIHwgIDggKysrKysrKysKIGRyaXZlcnMvZ3B1L2RybS90ZWdyYS9kcm0uaCAg
ICAgICAgICAgICB8ICAzICstLQogZHJpdmVycy9ncHUvZHJtL3RlZ3JhL2RzaS5jICAgICAgICAg
ICAgIHwgIDggKysrKystLS0KIGRyaXZlcnMvZ3B1L2RybS90ZWdyYS9mYi5jICAgICAgICAgICAg
ICB8ICA2ICsrKystLQogZHJpdmVycy9ncHUvZHJtL3RlZ3JhL2dlbS5jICAgICAgICAgICAgIHwg
IDMgKysrCiBkcml2ZXJzL2dwdS9kcm0vdGVncmEvZ2VtLmggICAgICAgICAgICAgfCAgMSAtCiBk
cml2ZXJzL2dwdS9kcm0vdGVncmEvZ3IyZC5jICAgICAgICAgICAgfCAgMSArCiBkcml2ZXJzL2dw
dS9kcm0vdGVncmEvaGRtaS5jICAgICAgICAgICAgfCAgNSArKysrKwogZHJpdmVycy9ncHUvZHJt
L3RlZ3JhL2h1Yi5jICAgICAgICAgICAgIHwgIDMgKystCiBkcml2ZXJzL2dwdS9kcm0vdGVncmEv
aHViLmggICAgICAgICAgICAgfCAgMSAtCiBkcml2ZXJzL2dwdS9kcm0vdGVncmEvcGxhbmUuYyAg
ICAgICAgICAgfCAgMSArCiBkcml2ZXJzL2dwdS9kcm0vdGVncmEvc29yLmMgICAgICAgICAgICAg
fCAgMyArKysKIGRyaXZlcnMvZ3B1L2RybS90ZWdyYS92aWMuYyAgICAgICAgICAgICB8ICAxICsK
IDM0IGZpbGVzIGNoYW5nZWQsIDEzNyBpbnNlcnRpb25zKCspLCA0OSBkZWxldGlvbnMoLSkKCgpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwg
bWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0
cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
