Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A596A21B092
	for <lists+dri-devel@lfdr.de>; Fri, 10 Jul 2020 09:53:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A07716EB7F;
	Fri, 10 Jul 2020 07:52:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x341.google.com (mail-wm1-x341.google.com
 [IPv6:2a00:1450:4864:20::341])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ED0F66E02A
 for <dri-devel@lists.freedesktop.org>; Thu,  9 Jul 2020 14:03:29 +0000 (UTC)
Received: by mail-wm1-x341.google.com with SMTP id j18so1941122wmi.3
 for <dri-devel@lists.freedesktop.org>; Thu, 09 Jul 2020 07:03:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=ciy3HDqvKk5PARaiKZGCtCw2SjWa+ryFuI+p7pTDJCM=;
 b=qUw4vwuSn+ptn4MbZwbW/4JcHgMoD6jfSrQjR2v5avUDM1fN1z5f4uplCFgKWNQsqS
 9aSMrqGg6d4qt8j0eitxmLT/3ywxOWQM76Vt5A3z+Ag+D2q4SDr3vNE+S46BDS2b9Be2
 p5D8baGzBdcaQyO8TRciSqYeuYLqn94NSm4twhD9ziglGI7ZcFB58mQwu2qAIo+EEdu+
 lms38xcgyOUDkJ9xnZ4/nLvXWMfCkA7dA9OkWy73/l3JO/RoNhesHEXRB6dITXHboR9Q
 m8+6N6pmfpBYorORnGQKIASx4qS+ecxsFpajjw/YQ0146QyzAuO5ExH1bD5iu9oHF3v2
 l1aw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ciy3HDqvKk5PARaiKZGCtCw2SjWa+ryFuI+p7pTDJCM=;
 b=OF9X4yF/kWy6cJGFxm+slk0hRXSWy5ZCSUyucFZZ0kMr8H65BAIZ8j5VNCIf12x8cz
 sMfsfEKis7hQaVT2DMNnvgDaf+7Xc9F06jx+xFTMg/zGTT+wJYDGRMJUQLwsiRQlYlP/
 7wUuPuDHuFFLLpcxCKHQWkFHO6QFNCZUbArEkzrJ9eHi39gQUYc0/DivJpNj/pKsU1uP
 hKqCAO/1+ggp30E4E6pdCxKuYFzRJ3F3x0M9R8PBajtPB9zbf+HbuDsm7aTp5WJXgT9b
 PhnPrdN/rjDA9tvDDaDoF2pTEa/r+qKs2BB5QbksfrCmRq7/F6LylkZIVH2Fl5Y2GRGU
 +Z/Q==
X-Gm-Message-State: AOAM530l7mqvHSf7k74DwmxH1zI3Gh8DTysHBkVUtWAfsaOZKuPO3xAw
 KJL4nqIZr/4gpq/Zto+Wpq8=
X-Google-Smtp-Source: ABdhPJxXQ2zcpVry+tBbqOjdH8BhqmMtk4qHHwoxi4Ph0toh3/O+Dx0OhluRkSrLaCze2KElp1CKFg==
X-Received: by 2002:a1c:4183:: with SMTP id o125mr134976wma.101.1594303408531; 
 Thu, 09 Jul 2020 07:03:28 -0700 (PDT)
Received: from clement-Latitude-7490.numericable.fr
 (213-245-241-245.rev.numericable.fr. [213.245.241.245])
 by smtp.gmail.com with ESMTPSA id s8sm5545256wru.38.2020.07.09.07.03.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 09 Jul 2020 07:03:27 -0700 (PDT)
From: =?UTF-8?q?Cl=C3=A9ment=20P=C3=A9ron?= <peron.clem@gmail.com>
To: Rob Herring <robh@kernel.org>, Tomeu Vizoso <tomeu.vizoso@collabora.com>,
 Steven Price <steven.price@arm.com>,
 Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>,
 Viresh Kumar <vireshk@kernel.org>, Nishanth Menon <nm@ti.com>,
 Stephen Boyd <sboyd@kernel.org>, Maxime Ripard <mripard@kernel.org>,
 Chen-Yu Tsai <wens@csie.org>
Subject: [PATCH v3 02/14] drm/panfrost: clean headers in devfreq
Date: Thu,  9 Jul 2020 16:03:10 +0200
Message-Id: <20200709140322.131320-3-peron.clem@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200709140322.131320-1-peron.clem@gmail.com>
References: <20200709140322.131320-1-peron.clem@gmail.com>
MIME-Version: 1.0
X-Mailman-Approved-At: Fri, 10 Jul 2020 07:52:58 +0000
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
