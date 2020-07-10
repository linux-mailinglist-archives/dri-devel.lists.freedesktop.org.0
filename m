Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id F325621E8FA
	for <lists+dri-devel@lfdr.de>; Tue, 14 Jul 2020 09:03:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E8CD06E926;
	Tue, 14 Jul 2020 07:02:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x343.google.com (mail-wm1-x343.google.com
 [IPv6:2a00:1450:4864:20::343])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 335086E082
 for <dri-devel@lists.freedesktop.org>; Fri, 10 Jul 2020 09:25:56 +0000 (UTC)
Received: by mail-wm1-x343.google.com with SMTP id w3so5162236wmi.4
 for <dri-devel@lists.freedesktop.org>; Fri, 10 Jul 2020 02:25:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=ciy3HDqvKk5PARaiKZGCtCw2SjWa+ryFuI+p7pTDJCM=;
 b=CS12xL4MC/BksNlaIwRvyjwByz6TExJ0myJwWurq4UfyGNLpbsSrkuNF/quq0IrCw0
 xRCpPjeHPg0vcncegyAUUCeWP1J4CIVCXwsjxoz6JtF1zhhsm+hCrJZhqUuMRR9bBhJX
 ba0Syb94q0gwzHGWJqAhCZbu1t67N7v6rFtiCR/o5Q7YANVO2fl0VjnrV/qewiMGABS2
 LC4Qu0DHz1muygT+uGpJrxahKYbuNbb8UT39MeH0vK+DpFcSG0CxtR+f3pfyxtCr2Wp6
 lbHyuEEI0ttwpwZSc8PYtlgzBElPlte8lwG9OfuL4QJnZBSV7p6DaSoWuIB2DrSAhe7u
 sBIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ciy3HDqvKk5PARaiKZGCtCw2SjWa+ryFuI+p7pTDJCM=;
 b=TTTZOgXvwWQpBLYbu1jORR1dLiLhKuhQSD6/IgVb0GqSBzp0SCk+e1nkrxLsH1RKem
 2iIC8rrsIg5zTC9AJASfOKOM5Qs2mVnkq2obYem5KJ2K5gn2jd3zQmFv57dAVUwGtHel
 c6p9hd8tQdNjd5oZWbb/FHBWbSBbsJ060sGtv1WRQ0S83nBpkUpfG2T7949ytWfL8jKM
 FMY7kenKdEYRXvnCXVK6eAsdN7qiMBPq7J2VgOcncGQVGfyCct2UJ9aDQIqkKVU0Fmm2
 qWwbVw3vGXSeI4QxQx8spCMGRPw5AQjTuqcTwhoVH+nJ2QGJ87TTZOSn6pgt3KCZlHY3
 ph+w==
X-Gm-Message-State: AOAM5302ZQtb7GjVRpiMX6KH0ZU8b88kZnPJlHGGlWgs9Ko2/KZSe5sF
 moyWbdprP+FDuQ1+nR/DU0Y=
X-Google-Smtp-Source: ABdhPJwyGsfKRK2ok2A3GZOj8rkfOYAVuUfKijampNPqAXAT3B9HhIiWfpDKg6V5bv2Bk2P0wHopUw==
X-Received: by 2002:a05:600c:2511:: with SMTP id
 d17mr4368631wma.127.1594373154688; 
 Fri, 10 Jul 2020 02:25:54 -0700 (PDT)
Received: from clement-Latitude-7490.numericable.fr
 (213-245-241-245.rev.numericable.fr. [213.245.241.245])
 by smtp.gmail.com with ESMTPSA id h23sm8179559wmb.3.2020.07.10.02.25.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 10 Jul 2020 02:25:54 -0700 (PDT)
From: =?UTF-8?q?Cl=C3=A9ment=20P=C3=A9ron?= <peron.clem@gmail.com>
To: Rob Herring <robh@kernel.org>, Tomeu Vizoso <tomeu.vizoso@collabora.com>,
 Steven Price <steven.price@arm.com>,
 Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>,
 Viresh Kumar <vireshk@kernel.org>, Nishanth Menon <nm@ti.com>,
 Stephen Boyd <sboyd@kernel.org>, Maxime Ripard <mripard@kernel.org>,
 Chen-Yu Tsai <wens@csie.org>
Subject: [PATCH v4 02/14] drm/panfrost: clean headers in devfreq
Date: Fri, 10 Jul 2020 11:25:36 +0200
Message-Id: <20200710092548.316054-3-peron.clem@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200710092548.316054-1-peron.clem@gmail.com>
References: <20200710092548.316054-1-peron.clem@gmail.com>
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

RG9uJ3QgaW5jbHVkZSBub3QgcmVxdWlyZWQgaGVhZGVycyBhbmQgc29ydCB0aGVtLgoKUmV2aWV3
ZWQtYnk6IFN0ZXZlbiBQcmljZSA8c3RldmVuLnByaWNlQGFybS5jb20+ClJldmlld2VkLWJ5OiBB
bHlzc2EgUm9zZW56d2VpZyA8YWx5c3NhLnJvc2VuendlaWdAY29sbGFib3JhLmNvbT4KU2lnbmVk
LW9mZi1ieTogQ2zDqW1lbnQgUMOpcm9uIDxwZXJvbi5jbGVtQGdtYWlsLmNvbT4KLS0tCiBkcml2
ZXJzL2dwdS9kcm0vcGFuZnJvc3QvcGFuZnJvc3RfZGV2ZnJlcS5jIHwgOCArKy0tLS0tLQogMSBm
aWxlIGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygrKSwgNiBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQg
YS9kcml2ZXJzL2dwdS9kcm0vcGFuZnJvc3QvcGFuZnJvc3RfZGV2ZnJlcS5jIGIvZHJpdmVycy9n
cHUvZHJtL3BhbmZyb3N0L3BhbmZyb3N0X2RldmZyZXEuYwppbmRleCAxYjU2MGI5MDNlYTYuLmRm
N2I3MWRhOWE4NCAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL3BhbmZyb3N0L3BhbmZyb3N0
X2RldmZyZXEuYworKysgYi9kcml2ZXJzL2dwdS9kcm0vcGFuZnJvc3QvcGFuZnJvc3RfZGV2ZnJl
cS5jCkBAIC0xLDE4ICsxLDE0IEBACiAvLyBTUERYLUxpY2Vuc2UtSWRlbnRpZmllcjogR1BMLTIu
MAogLyogQ29weXJpZ2h0IDIwMTkgQ29sbGFib3JhIGx0ZC4gKi8KKworI2luY2x1ZGUgPGxpbnV4
L2Nsay5oPgogI2luY2x1ZGUgPGxpbnV4L2RldmZyZXEuaD4KICNpbmNsdWRlIDxsaW51eC9kZXZm
cmVxX2Nvb2xpbmcuaD4KICNpbmNsdWRlIDxsaW51eC9wbGF0Zm9ybV9kZXZpY2UuaD4KICNpbmNs
dWRlIDxsaW51eC9wbV9vcHAuaD4KLSNpbmNsdWRlIDxsaW51eC9jbGsuaD4KLSNpbmNsdWRlIDxs
aW51eC9yZWd1bGF0b3IvY29uc3VtZXIuaD4KIAogI2luY2x1ZGUgInBhbmZyb3N0X2RldmljZS5o
IgogI2luY2x1ZGUgInBhbmZyb3N0X2RldmZyZXEuaCIKLSNpbmNsdWRlICJwYW5mcm9zdF9mZWF0
dXJlcy5oIgotI2luY2x1ZGUgInBhbmZyb3N0X2lzc3Vlcy5oIgotI2luY2x1ZGUgInBhbmZyb3N0
X2dwdS5oIgotI2luY2x1ZGUgInBhbmZyb3N0X3JlZ3MuaCIKIAogc3RhdGljIHZvaWQgcGFuZnJv
c3RfZGV2ZnJlcV91cGRhdGVfdXRpbGl6YXRpb24oc3RydWN0IHBhbmZyb3N0X2RldmljZSAqcGZk
ZXYpCiB7Ci0tIAoyLjI1LjEKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNr
dG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2Ry
aS1kZXZlbAo=
