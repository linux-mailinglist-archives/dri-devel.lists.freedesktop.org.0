Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4752821E8E0
	for <lists+dri-devel@lfdr.de>; Tue, 14 Jul 2020 09:03:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3997D6E8FC;
	Tue, 14 Jul 2020 07:02:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com
 [IPv6:2a00:1450:4864:20::330])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 23E316EBCB
 for <dri-devel@lists.freedesktop.org>; Fri, 10 Jul 2020 09:54:27 +0000 (UTC)
Received: by mail-wm1-x330.google.com with SMTP id o2so5273795wmh.2
 for <dri-devel@lists.freedesktop.org>; Fri, 10 Jul 2020 02:54:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=vGrB4C2EapNRMSvNvzwinnqh7atFRSmJOU/XyLZhEhE=;
 b=MMRQJYehw8ZQxxFT5CqPiRrGsbm364F4MVV/yZWQp1C+52h+7xpyjj46Xj+tgW0zyU
 AvB0zj5LduZikGya+Y2tPRfS2wzszgBc/5FP/xJQgtR0qrzyJYzBXJ3zhmUKmCSSQ0Mg
 Y0oowsdZX17mt+QREO7oYdJeLf4sN3ajCGwcQR9vhnpOvRKZ6mnWeEyUPTdSCUlHBhhb
 huZCxkWq6OVL3sipFjWcoIjtzlhr8ERlCkfkZRBSfRbtTriB1PwTZarV8WgMt+66xYfv
 d5u6NhGC1UyZrHSPqECxrYoXk4r5KMUVDkjlfni0Q15OzKegnU8jihN9CkckWWFLSTeM
 kRiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=vGrB4C2EapNRMSvNvzwinnqh7atFRSmJOU/XyLZhEhE=;
 b=JhZnDlLXsUeGV4CUyxwIQdqmU3OzwTlxKEpfd+h/B95ofxp0D+NRwILGfSdbYem/86
 2DqNFyNx0icm8L3xmsyrFm5cwnmlvAgwUM2pKzEdr56tr1eDCbiRWkExtFckSAq2pCLX
 qBEbS5AP+rBmxdQozkCflhVsyyib3PK0L1qY/BjY6longCu914Qun5ALe6rLdedbb33C
 zWFHwPXgF2bcMpfQImLG1gyav4Thb5B3Cpmmp5aTymhu+YvhPvAVPDRhfm1YjzUWVCEa
 v1VfT05vHRYdyVZL52wuvZcB96+m4Ypg0XR+uORP//hqeTNdmbzcUGglN9cS1K9fxnCJ
 sDuw==
X-Gm-Message-State: AOAM531VHK4VHng9GikBJybKSts+W96Wu7Oh9AirhBcCicuwiMl8dggE
 146qQnaik5TAPlFGpzxlqqM=
X-Google-Smtp-Source: ABdhPJxvOyxWrFrfdSeYFgEZW0vN3ESP+d6i5l29mIhd8ro9UaD9Zd651omuIzA2cece87Wv0D2yrA==
X-Received: by 2002:a1c:dfc5:: with SMTP id w188mr4526829wmg.182.1594374865613; 
 Fri, 10 Jul 2020 02:54:25 -0700 (PDT)
Received: from clement-Latitude-7490.numericable.fr
 (213-245-241-245.rev.numericable.fr. [213.245.241.245])
 by smtp.gmail.com with ESMTPSA id u23sm10176092wru.94.2020.07.10.02.54.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 10 Jul 2020 02:54:24 -0700 (PDT)
From: =?UTF-8?q?Cl=C3=A9ment=20P=C3=A9ron?= <peron.clem@gmail.com>
To: Rob Herring <robh@kernel.org>, Tomeu Vizoso <tomeu.vizoso@collabora.com>,
 Steven Price <steven.price@arm.com>,
 Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>,
 Viresh Kumar <vireshk@kernel.org>, Nishanth Menon <nm@ti.com>,
 Stephen Boyd <sboyd@kernel.org>, Maxime Ripard <mripard@kernel.org>,
 Chen-Yu Tsai <wens@csie.org>
Subject: [PATCH v5 11/14] arm64: defconfig: Enable devfreq cooling device
Date: Fri, 10 Jul 2020 11:54:06 +0200
Message-Id: <20200710095409.407087-12-peron.clem@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200710095409.407087-1-peron.clem@gmail.com>
References: <20200710095409.407087-1-peron.clem@gmail.com>
MIME-Version: 1.0
X-Mailman-Approved-At: Tue, 14 Jul 2020 07:02:08 +0000
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
Cc: =?UTF-8?q?Cl=C3=A9ment=20P=C3=A9ron?= <peron.clem@gmail.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

RGV2ZnJlcSBjb29saW5nIGRldmljZSBmcmFtZXdvcmsgaXMgdXNlZCBpbiBQYW5mcm9zdAp0byB0
aHJvdHRsZSBHUFUgaW4gb3JkZXIgdG8gcmVndWxhdGUgaXRzIHRlbXBlcmF0dXJlLgoKRW5hYmxl
IHRoaXMgZHJpdmVyIGZvciBBUk02NCBTb0MuCgpSZXZpZXdlZC1ieTogQWx5c3NhIFJvc2Vuendl
aWcgPGFseXNzYS5yb3Nlbnp3ZWlnQGNvbGxhYm9yYS5jb20+ClNpZ25lZC1vZmYtYnk6IENsw6lt
ZW50IFDDqXJvbiA8cGVyb24uY2xlbUBnbWFpbC5jb20+Ci0tLQogYXJjaC9hcm02NC9jb25maWdz
L2RlZmNvbmZpZyB8IDEgKwogMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspCgpkaWZmIC0t
Z2l0IGEvYXJjaC9hcm02NC9jb25maWdzL2RlZmNvbmZpZyBiL2FyY2gvYXJtNjQvY29uZmlncy9k
ZWZjb25maWcKaW5kZXggODk1MzhkOWUzOWU1Li44YTI5NWJjYjRkZDMgMTAwNjQ0Ci0tLSBhL2Fy
Y2gvYXJtNjQvY29uZmlncy9kZWZjb25maWcKKysrIGIvYXJjaC9hcm02NC9jb25maWdzL2RlZmNv
bmZpZwpAQCAtNTA0LDYgKzUwNCw3IEBAIENPTkZJR19TRU5TT1JTX0lOQTJYWD1tCiBDT05GSUdf
U0VOU09SU19JTkEzMjIxPW0KIENPTkZJR19USEVSTUFMX0dPVl9QT1dFUl9BTExPQ0FUT1I9eQog
Q09ORklHX0NQVV9USEVSTUFMPXkKK0NPTkZJR19ERVZGUkVRX1RIRVJNQUw9eQogQ09ORklHX1RI
RVJNQUxfRU1VTEFUSU9OPXkKIENPTkZJR19RT1JJUV9USEVSTUFMPW0KIENPTkZJR19TVU44SV9U
SEVSTUFMPXkKLS0gCjIuMjUuMQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRl
c2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8v
ZHJpLWRldmVsCg==
