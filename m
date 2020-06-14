Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4461C1F8FB3
	for <lists+dri-devel@lfdr.de>; Mon, 15 Jun 2020 09:28:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 65E536E2B4;
	Mon, 15 Jun 2020 07:27:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x144.google.com (mail-lf1-x144.google.com
 [IPv6:2a00:1450:4864:20::144])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0560389ED3
 for <dri-devel@lists.freedesktop.org>; Sun, 14 Jun 2020 20:01:43 +0000 (UTC)
Received: by mail-lf1-x144.google.com with SMTP id d27so3706585lfq.5
 for <dri-devel@lists.freedesktop.org>; Sun, 14 Jun 2020 13:01:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=eyeaYzeQX7ccLjnwiymvagyxejIqtIT2ra5PuWujjzM=;
 b=huWfunRd9o8izmq8clvCzaVTN/lEYRrSHD9pJ+wLb7vl0rdY72NAHw8wOmHniXhuDh
 amsqUmwpLcz+GON705A2GfRQG1iYBH2Twv/RioQ//2fGjFEcWniI5CEWPrm0wPePm+VD
 dcjgmUBX7+kWBXt+0B0zAFPNoFhyxJkGB8LSxiNjE8XH3m87IvGiaPQMJoMnSg0E1Eik
 A6nuQRbxkKOZFzGwNG9N/oGcpb7NVwPPrCFD3T7jTzsIFPS8HRgPs/DchYNJwk1mHXaU
 cJ3m203wFec2IkUbrtTQtg4L6SdvHRSBqwf5QHhr9Q/1ASpzM9T07wxc852GGu6kXbl6
 H9aQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=eyeaYzeQX7ccLjnwiymvagyxejIqtIT2ra5PuWujjzM=;
 b=DpCR8kFoyzF7KAlHCifooLDfAk+aNbzER247jX0M9cgv5hNRepNQgVRMIKIDWtN/Tl
 QDvK4IHnHRlpWejjpOu7Fs3szAx4uGs73VGu/VWYYNInoOQfAvwXTmzQ7uQNhBFgUkJs
 KZM6BLxz7drKHsY9eZRupvWpHC2vsHTu+VN8lHGq3QHbD08/aU/SaEJgxufKBgRyHRAG
 KKeXuorR2p8qF7UbK2HaSGLIx8Og0k3jL3MHOQqUFhjzxMYcMo1XEQGvB+cSVnpi8SBl
 HJzkgjt+iEXJvOde6/+0EzG4aEW8T1iYdaV/oN0UlSm8MBJGEORcR6nf7eTEwcELPfCF
 k/sw==
X-Gm-Message-State: AOAM531AeCxJKaOT63cgZ+t38lOcNn/hJ2xbQtQ4d6e3MOh1ajpdc9ph
 3dioFDJNIZJtDKXqC6LOs6I=
X-Google-Smtp-Source: ABdhPJywA20RCBGKn37WbaaGhZeic/ZVAiBmfPA7Mnftr3GiywM/pb5B6AVXLylwpr+0Vq3t9EQiyw==
X-Received: by 2002:a19:c3d5:: with SMTP id t204mr11970529lff.50.1592164901434; 
 Sun, 14 Jun 2020 13:01:41 -0700 (PDT)
Received: from localhost.localdomain (79-139-237-54.dynamic.spd-mgts.ru.
 [79.139.237.54])
 by smtp.gmail.com with ESMTPSA id 144sm1422105lfm.87.2020.06.14.13.01.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 14 Jun 2020 13:01:40 -0700 (PDT)
From: Dmitry Osipenko <digetx@gmail.com>
To: Thierry Reding <thierry.reding@gmail.com>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Derek Basehore <dbasehore@chromium.org>, Sam Ravnborg <sam@ravnborg.org>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Sean Paul <sean@poorly.run>
Subject: [PATCH v2 0/5] 180 degrees rotation support for NVIDIA Tegra DRM
Date: Sun, 14 Jun 2020 23:01:16 +0300
Message-Id: <20200614200121.14147-1-digetx@gmail.com>
X-Mailer: git-send-email 2.26.0
MIME-Version: 1.0
X-Mailman-Approved-At: Mon, 15 Jun 2020 07:27:17 +0000
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
Cc: linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGVsbG8hCgpUaGlzIHNlcmllcyBhZGRzIDE4MMKwIGRpc3BsYXkgcGxhbmUgcm90YXRpb24gc3Vw
cG9ydCB0byB0aGUgTlZJRElBIFRlZ3JhCkRSTSBkcml2ZXIgd2hpY2ggaXMgbmVlZGVkIGZvciBk
ZXZpY2VzIHRoYXQgaGF2ZSBkaXNwbGF5IHBhbmVsIHBoeXNpY2FsbHkKbW91bnRlZCB1cHNpZGUt
ZG93biwgbGlrZSBOZXh1cyA3IHRhYmxldCBkZXZpY2UgZm9yIGV4YW1wbGUgWzFdLiBTaW5jZQpE
Uk0gcGFuZWwgcm90YXRpb24gaXMgYSBuZXcgdGhpbmcgZm9yIGEgdXNlcnNwYWNlLCBjdXJyZW50
bHkgb25seQpPcGVudGVncmEgWG9yZyBkcml2ZXIgaGFuZGxlcyB0aGUgcm90YXRlZCBkaXNwbGF5
IHBhbmVsIFsyXSwgYnV0IHRoaXMKaXMgZ29vZCBlbm91Z2ggZm9yIHRoZSBzdGFydC4KCk5vdGUg
dGhhdCBsYXRlciBvbiBpdCBzaG91bGQgYmUgcG9zc2libGUgdG8gaW1wbGVtZW50IGEgdHJhbnNw
YXJlbnQgMTgwwrAKZGlzcGxheSByb3RhdGlvbiBmb3IgVGVncmEgRFJNIGRyaXZlciB3aGljaCB3
aWxsIHJlbW92ZSB0aGUgbmVlZCB0byBoYXZlCmEgYmxlZWRpbmcgZWRnZSB1c2Vyc3BhY2UgdGhh
dCBrbm93cyBob3cgdG8gcm90YXRlIGRpc3BsYXkgcGxhbmVzIGFuZCBJJ20Kc2xvd2x5IHdvcmtp
bmcgb24gaXQuIEZvciB0aGUgc3RhcnRlciB3ZSBjYW4gZ28gd2l0aCB0aGUgbWluaW1hbCByb3Rh
dGlvbgpzdXBwb3J0LCBzbyBpdCdzIG5vdCBhIGJsb2NrZXIuCgpUaGlzIHNlcmllcyBpcyBiYXNl
ZCBvbiB0aGUgd29yayB0aGF0IHdhcyBtYWRlIGJ5IERlcmVrIEJhc2Vob3JlIGZvciB0aGUKTWVk
aWF0ZWsgZHJpdmVyIFszXSwgaGlzIHBhdGNoIGlzIGluY2x1ZGVkIGludG8gdGhpcyBwYXRjaHNl
dC4gSSBhZGRlZApteSB0ZXN0ZWQtYnkgdGFnIHRvIHRoZSBEZXJlaydzIHBhdGNoLgoKUGxlYXNl
IHJldmlldyBhbmQgYXBwbHksIHRoYW5rcyBpbiBhZHZhbmNlIQoKWzFdIGh0dHBzOi8vcGF0Y2h3
b3JrLm96bGFicy5vcmcvcHJvamVjdC9saW51eC10ZWdyYS9wYXRjaC8yMDIwMDYwNzE1NDMyNy4x
ODU4OS0zLWRpZ2V0eEBnbWFpbC5jb20vClsyXSBodHRwczovL2dpdGh1Yi5jb20vZ3JhdGUtZHJp
dmVyL3hmODYtdmlkZW8tb3BlbnRlZ3JhL2NvbW1pdC8yOGViMjBhMzk1OWJiZTViYzNhM2I2N2U1
NTk3NzA5M2ZkNTExNGNhClszXSBodHRwczovL2xrbWwub3JnL2xrbWwvMjAyMC8zLzUvMTExOQoK
Q2hhbmdlbG9nOgoKdjI6IC0gRHJvcHBlZCAiZHJtL3BhbmVsOiBTZXQgZGlzcGxheSBpbmZvIGlu
IHBhbmVsIGF0dGFjaCIgcGF0Y2gsIHdoaWNoCiAgICAgIHR1cm5lZCBvdXQgdG8gYmUgb2Jzb2xl
dGUgbm93LgoKICAgIC0gUmVuYW1lZCB0aGUgY292ZXItbGF0dGVyLCBob3BlZnVsbHkgdGhpcyB3
aWxsIGZpeCB0aGUgYm91bmNpbmcgZW1haWxzLgoKRGVyZWsgQmFzZWhvcmUgKDEpOgogIGRybS9w
YW5lbDogQWRkIGhlbHBlciBmb3IgcmVhZGluZyBEVCByb3RhdGlvbgoKRG1pdHJ5IE9zaXBlbmtv
ICg0KToKICBkcm0vcGFuZWw6IGx2ZHM6IFNldCB1cCBwYW5lbCBvcmllbnRhdGlvbgogIGRybS90
ZWdyYTogcGxhbmU6IFJlbmFtZSBib3R0b21fdXAgdG8gcmVmbGVjdF95CiAgZHJtL3RlZ3JhOiBw
bGFuZTogU3VwcG9ydCBob3Jpem9udGFsIHJlZmxlY3Rpb24gbW9kZQogIGRybS90ZWdyYTogcGxh
bmU6IFN1cHBvcnQgMTgwwrAgcm90YXRpb24KCiBkcml2ZXJzL2dwdS9kcm0vZHJtX3BhbmVsLmMg
ICAgICAgIHwgNDMgKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrCiBkcml2ZXJzL2dwdS9k
cm0vcGFuZWwvcGFuZWwtbHZkcy5jIHwgIDggKysrKysrCiBkcml2ZXJzL2dwdS9kcm0vdGVncmEv
ZGMuYyAgICAgICAgIHwgNDMgKysrKysrKysrKysrKysrKysrKysrKysrLS0tLS0tCiBkcml2ZXJz
L2dwdS9kcm0vdGVncmEvZGMuaCAgICAgICAgIHwgIDMgKystCiBkcml2ZXJzL2dwdS9kcm0vdGVn
cmEvcGxhbmUuYyAgICAgIHwgIDMgKystCiBkcml2ZXJzL2dwdS9kcm0vdGVncmEvcGxhbmUuaCAg
ICAgIHwgIDMgKystCiBpbmNsdWRlL2RybS9kcm1fcGFuZWwuaCAgICAgICAgICAgIHwgIDkgKysr
KysrKwogNyBmaWxlcyBjaGFuZ2VkLCAxMDEgaW5zZXJ0aW9ucygrKSwgMTEgZGVsZXRpb25zKC0p
CgotLSAKMi4yNi4wCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5v
cmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2
ZWwK
