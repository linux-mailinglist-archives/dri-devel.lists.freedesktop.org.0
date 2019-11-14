Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 45AB5FD79A
	for <lists+dri-devel@lfdr.de>; Fri, 15 Nov 2019 09:05:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0E6366E0EB;
	Fri, 15 Nov 2019 08:05:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x344.google.com (mail-wm1-x344.google.com
 [IPv6:2a00:1450:4864:20::344])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 231DE6E225
 for <dri-devel@lists.freedesktop.org>; Thu, 14 Nov 2019 13:24:49 +0000 (UTC)
Received: by mail-wm1-x344.google.com with SMTP id u18so5672450wmc.3
 for <dri-devel@lists.freedesktop.org>; Thu, 14 Nov 2019 05:24:49 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=mH8gSNIgKvgPetxbf7rz5MC4m16Vu7th8OeEJ1GZ3WA=;
 b=X0dziBIv2SHz8iywSVF7yOh3mGIKKYLX1zCvzFhSUE3dZTlASaIxeeHgyyo0HAzx8j
 rYPN25Lr6jT9QOFpO4umB7bMohcwYU6hQzjdchet0cYiMc5jOZOy4gdzsoxyycNYGwzM
 mkgJmvLy+0RMHDpIdzFmy7iQ6Nd8gtQxKvrAGepFNRFidAjHEpgUivsrkrElNIM6nbTv
 4ke35onWmd2ZLx7JEzllwk7SthUpYfGEcj+tyXPE9NKnmgLIegd7NaINFA6JQgs1V/OA
 DGYyiieMu4eJWmJS5Q0yDCXFhGWHzVlH3JfWrWgEsIahj9grN6wXAXssUSpPyON7GYJt
 WpGg==
X-Gm-Message-State: APjAAAXLM5+Zg8koaZ07KAgVuluLz/SrOb7uMmcDq93mJGSijD/t75YK
 u39KCD4c2kcLGBUH4dg5uAk=
X-Google-Smtp-Source: APXvYqy0OzeEgjEqEz2o9WYlfcRhLzpSJymbbl4yemx7SJZX9xmA8PesRQtNcL6r6/RyfFNg5SDURQ==
X-Received: by 2002:a1c:5fc4:: with SMTP id t187mr8347004wmb.142.1573737887726; 
 Thu, 14 Nov 2019 05:24:47 -0800 (PST)
Received: from localhost.localdomain ([197.254.95.38])
 by smtp.googlemail.com with ESMTPSA id a8sm5838054wme.11.2019.11.14.05.24.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 14 Nov 2019 05:24:46 -0800 (PST)
From: Wambui Karuga <wambui.karugax@gmail.com>
To: maarten.lankhorst@linux.intel.com, mripard@kernel.org, sean@poorly.run,
 airlied@linux.ie, daniel@ffwll.ch, hjc@rock-chips.com
Subject: [PATCH 0/2] add new DRM_DEV_WARN macro
Date: Thu, 14 Nov 2019 16:24:34 +0300
Message-Id: <20191114132436.7232-1-wambui.karugax@gmail.com>
X-Mailer: git-send-email 2.17.1
X-Mailman-Approved-At: Fri, 15 Nov 2019 08:05:26 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id;
 bh=mH8gSNIgKvgPetxbf7rz5MC4m16Vu7th8OeEJ1GZ3WA=;
 b=Bpr0h/OXlj7EmeJlqKo5Wxz48vyUoDHAdh0gSAeyCXdohmi5MPgIVj/TyCBuekAhF3
 gFp1ZwAyxRa3FeV7WaFB4OKxsHBcczf9n3bWeyGQocy/bQpENfSzWnxjFeLPkLUP7jZh
 oXApnfs7K0AeY1U4I6hYhIp5y1GAq+mMdoRjK7tzUcYNP0BghxA71HMGPkO9ouzmzmOk
 UgAOfc4VFrmZUladOiDb+8iL6BPdGlzmcCH2CRPNVHF5OY/2EoZBPhJRAaJWei+bhj1j
 Q25DDOekDlNrc0KXWe7VfOidfEK0JbYFGucPhFe/0fHohJAUZ/Sz5oOEHXwPXmvYmEMc
 +Mrw==
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
Cc: linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

VGhpcyBhZGRzIGEgbmV3IERSTV9ERVZfV0FSTiBoZWxwZXIgbWFjcm8gZm9yIHdhcm5pbmdzIGxv
ZyBvdXRwdXQgdGhhdCBpbmNsdWRlCmRldmljZSBwb2ludGVycy4gSXQgYWxzbyBpbmNsdWRlcyB0
aGUgdXNlIG9mIHRoZSBEUk1fREVWX1dBUk4gbWFjcm8gaW4KZHJtL3JvY2tjaGlwIHRvIHJlcGxh
Y2UgZGV2X3dhcm4uCgpXYW1idWkgS2FydWdhICgyKToKICBkcm0vcHJpbnQ6IGFkZCBEUk1fREVW
X1dBUk4gbWFjcm8KICBkcm0vcm9ja2NoaXA6IHVzZSBEUk1fREVWX1dBUk4gbWFjcm8gaW4gZGVi
dWcgb3V0cHV0CgogZHJpdmVycy9ncHUvZHJtL3JvY2tjaGlwL2lubm9faGRtaS5jIHwgMyArKy0K
IGluY2x1ZGUvZHJtL2RybV9wcmludC5oICAgICAgICAgICAgICB8IDkgKysrKysrKysrCiAyIGZp
bGVzIGNoYW5nZWQsIDExIGluc2VydGlvbnMoKyksIDEgZGVsZXRpb24oLSkKCi0tIAoyLjE3LjEK
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZl
bCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xp
c3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
