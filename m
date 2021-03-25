Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C958734949F
	for <lists+dri-devel@lfdr.de>; Thu, 25 Mar 2021 15:52:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E67F46ED99;
	Thu, 25 Mar 2021 14:52:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x629.google.com (mail-ej1-x629.google.com
 [IPv6:2a00:1450:4864:20::629])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 421E56ED99
 for <dri-devel@lists.freedesktop.org>; Thu, 25 Mar 2021 14:52:01 +0000 (UTC)
Received: by mail-ej1-x629.google.com with SMTP id w3so3392777ejc.4
 for <dri-devel@lists.freedesktop.org>; Thu, 25 Mar 2021 07:52:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=H9BwsVXG91jgXFtlxcwsuCYPu/uAtylFJ/7wlB90EsM=;
 b=ThQwdbB6EHnVPFYmQLl0CNmYhnzSpjXXD3yQ+aMmVyDV64U7e1PFFNZSAJHxe7fRQi
 uO4tachQEOxeGXXeTm5h7K5lAtrcmKGGqeEXjtyN1jRymHgSLERjADD3ir9JV8q8FHkB
 emMkeUnHbQCRZhuTxZKkf8ER03AemaSTdASL6Bek0UeS/9sAhyyGt5CyVJgpkJdD3ntF
 Oo8SkUrpTw70vnnIdWc4mxjUKjLXMQ6D/Ya4U+HNCodLvkcabRpkl6JaBhxGf52aP8qE
 DgZ1tWWfU4jDcu2hpHHMPPN+z4R/6De84YlftsTFY1sLphq7n6Q0pdqxSokRKtm8AdU8
 4rrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=H9BwsVXG91jgXFtlxcwsuCYPu/uAtylFJ/7wlB90EsM=;
 b=OKaWy9smSjU4+E3kt+tnXSyppr4HSvLM/3EVYEpKGoQCwLAnsJfvFWhF/4btvecNgE
 n4GL5D0bLck0nEfx9dCUkWRN00OII/o+Icgd85xyRAgafrvKk3Yi1I6qUqS1VEdQ1NDV
 J5oiCfJhxUJFVpF+fD38gvmIW1UcdDb4G9AiEseZrTK8ua9dE6L1o8hBpxOuDPGGaDeo
 Sp+nhYgaBmmow2clARw8ptyJRb3A3Iku7RyZmDg7f4hiD3UWeMLzo3Zehc4xmv1xUDFa
 J62BJIkPxzSDnP1N+mCn3OlvsCRB1o9jeWSlVwD5ETvdEEtxAqKPzdVSEtyD9nQKnBkb
 j+NA==
X-Gm-Message-State: AOAM5332+qUpwDN7HvlcGNHAwCEmFZBj4gIHjU4RSME7/tPtnyphgwOb
 Z3Z+HoZI1k1zSb/ZjZhnszeN0YugLf06/Kdk
X-Google-Smtp-Source: ABdhPJzo2y8llq+CpVkAFkhymReAfRiHhRsSYjPAPr1zopkcSFAtgRWPDwGlOSIm3ab8DaN9HLC7HA==
X-Received: by 2002:a17:906:2dda:: with SMTP id
 h26mr9891858eji.163.1616683919867; 
 Thu, 25 Mar 2021 07:51:59 -0700 (PDT)
Received: from localhost.localdomain ([37.120.1.234])
 by smtp.gmail.com with ESMTPSA id si3sm2569953ejb.90.2021.03.25.07.51.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 25 Mar 2021 07:51:59 -0700 (PDT)
From: Robert Foss <robert.foss@linaro.org>
To: linux-kernel@vger.kernel.org, Maxime Ripard <maxime@cerno.tech>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Jernej Skrabec <jernej.skrabec@siol.net>,
 Andrzej Hajda <a.hajda@samsung.com>, Jonas Karlman <jonas@kwiboo.se>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
Subject: [PATCH v2] MAINTAINERS: Update Maintainers of DRM Bridge Drivers
Date: Thu, 25 Mar 2021 15:51:54 +0100
Message-Id: <20210325145154.1433060-1-robert.foss@linaro.org>
X-Mailer: git-send-email 2.31.0.30.g398dba342d.dirty
MIME-Version: 1.0
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
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Robert Foss <robert.foss@linaro.org>, dri-devel@lists.freedesktop.org,
 Neil Armstrong <narmstrong@baylibre.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

QWRkIG15c2VsZiBhcyBjby1tYWludGFpbmVyIG9mIERSTSBCcmlkZ2UgRHJpdmVycy4gUmVwb3Np
dG9yeQpjb21taXQgYWNjZXNzIGhhcyBhbHJlYWR5IGJlZW4gZ3JhbnRlZC4KCmh0dHBzOi8vZ2l0
bGFiLmZyZWVkZXNrdG9wLm9yZy9mcmVlZGVza3RvcC9mcmVlZGVza3RvcC8tL2lzc3Vlcy8zMzgK
CkNjOiBOZWlsIEFybXN0cm9uZyA8bmFybXN0cm9uZ0BiYXlsaWJyZS5jb20+CkNjOiBMYXVyZW50
IFBpbmNoYXJ0IDxsYXVyZW50LnBpbmNoYXJ0QGlkZWFzb25ib2FyZC5jb20+CkNjOiBKb25hcyBL
YXJsbWFuIDxqb25hc0Brd2lib28uc2U+CkNjOiBBbmRyemVqIEhhamRhIDxhLmhhamRhQHNhbXN1
bmcuY29tPgpDYzogSmVybmVqIMWga3JhYmVjIDxqZXJuZWouc2tyYWJlY0BzaW9sLm5ldD4KQ2M6
IERhbmllbCBWZXR0ZXIgPGRhbmllbEBmZndsbC5jaD4KU2lnbmVkLW9mZi1ieTogUm9iZXJ0IEZv
c3MgPHJvYmVydC5mb3NzQGxpbmFyby5vcmc+CkFja2VkLWJ5OiBOZWlsIEFybXN0cm9uZyA8bmFy
bXN0cm9uZ0BiYXlsaWJyZS5jb20+CkFja2VkLWJ5OiBNYXhpbWUgUmlwYXJkIDxtYXhpbWVAY2Vy
bm8udGVjaD4KQWNrZWQtYnk6IExhdXJlbnQgUGluY2hhcnQgPGxhdXJlbnQucGluY2hhcnRAaWRl
YXNvbmJvYXJkLmNvbT4KQWNrZWQtYnk6IEFuZHJ6ZWogSGFqZGEgPGEuaGFqZGFAc2Ftc3VuZy5j
b20+Ci0tLQoKQWRkIG1haW50YWluZXIgQWNrcy4KClN1Ym1pdHRlZCB0byBmb2xsb3cgcHJvcGVy
IGRpbSB3b3JrZmxvdy4KCiBNQUlOVEFJTkVSUyB8IDEgKwogMSBmaWxlIGNoYW5nZWQsIDEgaW5z
ZXJ0aW9uKCspCgpkaWZmIC0tZ2l0IGEvTUFJTlRBSU5FUlMgYi9NQUlOVEFJTkVSUwppbmRleCA0
YjcwNWJhNTFjNTQuLjE2YWNlOGY1ODY0OSAxMDA2NDQKLS0tIGEvTUFJTlRBSU5FUlMKKysrIGIv
TUFJTlRBSU5FUlMKQEAgLTU5MDIsNiArNTkwMiw3IEBAIEY6CWRyaXZlcnMvZ3B1L2RybS9hdG1l
bC1obGNkYy8KIERSTSBEUklWRVJTIEZPUiBCUklER0UgQ0hJUFMKIE06CUFuZHJ6ZWogSGFqZGEg
PGEuaGFqZGFAc2Ftc3VuZy5jb20+CiBNOglOZWlsIEFybXN0cm9uZyA8bmFybXN0cm9uZ0BiYXls
aWJyZS5jb20+CitNOglSb2JlcnQgRm9zcyA8cm9iZXJ0LmZvc3NAbGluYXJvLm9yZz4KIFI6CUxh
dXJlbnQgUGluY2hhcnQgPExhdXJlbnQucGluY2hhcnRAaWRlYXNvbmJvYXJkLmNvbT4KIFI6CUpv
bmFzIEthcmxtYW4gPGpvbmFzQGt3aWJvby5zZT4KIFI6CUplcm5laiBTa3JhYmVjIDxqZXJuZWou
c2tyYWJlY0BzaW9sLm5ldD4KLS0gCjIuMzEuMC4zMC5nMzk4ZGJhMzQyZC5kaXJ0eQoKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxp
bmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJl
ZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==
