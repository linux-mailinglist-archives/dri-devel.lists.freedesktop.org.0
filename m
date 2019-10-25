Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D5AE8E6E1D
	for <lists+dri-devel@lfdr.de>; Mon, 28 Oct 2019 09:24:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1CA9A6E49D;
	Mon, 28 Oct 2019 08:23:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x544.google.com (mail-pg1-x544.google.com
 [IPv6:2607:f8b0:4864:20::544])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6C1DA6EA31
 for <dri-devel@lists.freedesktop.org>; Fri, 25 Oct 2019 13:31:31 +0000 (UTC)
Received: by mail-pg1-x544.google.com with SMTP id u23so1582928pgo.0
 for <dri-devel@lists.freedesktop.org>; Fri, 25 Oct 2019 06:31:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=z55UMaWEIEJNVekf1KUtXJqZFUzcCvdu1bfEeskovPo=;
 b=IdHpWAUC+sk7ICKeNUw4JWzUepwALZkzI7Ak0CFceot72u0t+qvI5h2yG+R7aUe/ju
 myLV69MOi4wQg4wqYeALmWP5sATIFaFbbRONrjAbgo0x5QbUCQaNbeJ78fYKQNydssjr
 NjKutWIJSXaCsgZ0U30rvsMK9tAdnb+hLYA2XEJtCNSS0GoiqWmeCdz1j3sIacbJck92
 OtOwKbqDtF3NkOViTVgyO5Y4pg+lvAv/JcgQL36wcAScqzLJbQpBcGLT6VSX/NR5BQ4y
 8AtoY1NT8a9BZIIr/+cNpIhhnAUlyZpcYPKQjldozWGFb8rE7TOUSD3ilraym7FX22Pg
 /pug==
X-Gm-Message-State: APjAAAUqOxYDSPPMhqQTxvcYxuotaMCZijUllsLVtbbF13qUJp6IDa13
 0GimplxECyVBPBIRAd5NC/S+7Q==
X-Google-Smtp-Source: APXvYqzEBEK954f+cnTf4ONcLs7stQK9JprT2+giiC3WqbjcH+UZmlt6EYuRfIZ58RAxo7Z4G+ogsw==
X-Received: by 2002:a17:90a:ff11:: with SMTP id
 ce17mr4114202pjb.110.1572010290956; 
 Fri, 25 Oct 2019 06:31:30 -0700 (PDT)
Received: from localhost ([2401:fa00:1:10:79b4:bd83:e4a5:a720])
 by smtp.gmail.com with ESMTPSA id z13sm3706421pgz.42.2019.10.25.06.31.26
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 25 Oct 2019 06:31:30 -0700 (PDT)
From: Cheng-Yi Chiang <cychiang@chromium.org>
To: linux-kernel@vger.kernel.org
Subject: [PATCH v8 6/6] ARM: dts: rockchip: Add HDMI audio support to
 rk3288-veyron-mickey.dts
Date: Fri, 25 Oct 2019 21:30:07 +0800
Message-Id: <20191025133007.11190-7-cychiang@chromium.org>
X-Mailer: git-send-email 2.24.0.rc0.303.g954a862665-goog
In-Reply-To: <20191025133007.11190-1-cychiang@chromium.org>
References: <20191025133007.11190-1-cychiang@chromium.org>
MIME-Version: 1.0
X-Mailman-Approved-At: Mon, 28 Oct 2019 08:23:53 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=z55UMaWEIEJNVekf1KUtXJqZFUzcCvdu1bfEeskovPo=;
 b=VTVnd3DJJxvlTLtyPGznBCDcaWFHpqt3B2OWsYufUi5PjNkalSZF7zX2RHBscVJH34
 NvmlefixU2wv6mbtZk2HQh7csJV0v1aqD+k6gpFFRvJ06om6HBZe7CBPz+9dC/yss4fK
 lh1QNLMpzK6BbmRsTQuBp3GKYRt0JrHDTgHCA=
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
Cc: Mark Rutland <mark.rutland@arm.com>, alsa-devel@alsa-project.org,
 Neil Armstrong <narmstrong@baylibre.com>, David Airlie <airlied@linux.ie>,
 dri-devel@lists.freedesktop.org, Liam Girdwood <lgirdwood@gmail.com>,
 Hans Verkuil <hverkuil@xs4all.nl>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jerome Brunet <jbrunet@baylibre.com>, Takashi Iwai <tiwai@suse.com>,
 linux-rockchip@lists.infradead.org, dgreid@chromium.org,
 Cheng-Yi Chiang <cychiang@chromium.org>, devicetree@vger.kernel.org,
 tzungbi@chromium.org, Jonas Karlman <jonas@kwiboo.se>,
 Russell King <rmk+kernel@armlinux.org.uk>, Rob Herring <robh+dt@kernel.org>,
 Jaroslav Kysela <perex@perex.cz>, linux-arm-kernel@lists.infradead.org,
 Jernej Skrabec <jernej.skrabec@siol.net>, dianders@chromium.org,
 Mark Brown <broonie@kernel.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

QWRkIEhETUkgYXVkaW8gc3VwcG9ydCB0byB2ZXlyb24tbWlja2V5LiBUaGUgc291bmQgY2FyZCBz
aG91bGQgZXhwb3NlCm9uZSBhdWRpbyBkZXZpY2UgZm9yIEhETUkuCgpTaWduZWQtb2ZmLWJ5OiBD
aGVuZy1ZaSBDaGlhbmcgPGN5Y2hpYW5nQGNocm9taXVtLm9yZz4KLS0tCiBhcmNoL2FybS9ib290
L2R0cy9yazMyODgtdmV5cm9uLW1pY2tleS5kdHMgfCA3ICsrKysrKysKIDEgZmlsZSBjaGFuZ2Vk
LCA3IGluc2VydGlvbnMoKykKCmRpZmYgLS1naXQgYS9hcmNoL2FybS9ib290L2R0cy9yazMyODgt
dmV5cm9uLW1pY2tleS5kdHMgYi9hcmNoL2FybS9ib290L2R0cy9yazMyODgtdmV5cm9uLW1pY2tl
eS5kdHMKaW5kZXggYWEzNTJkNDBjOTkxLi45OGEyYWVlMjQwZjEgMTAwNjQ0Ci0tLSBhL2FyY2gv
YXJtL2Jvb3QvZHRzL3JrMzI4OC12ZXlyb24tbWlja2V5LmR0cworKysgYi9hcmNoL2FybS9ib290
L2R0cy9yazMyODgtdmV5cm9uLW1pY2tleS5kdHMKQEAgLTI4LDYgKzI4LDEzIEBACiAJCXJlZ3Vs
YXRvci1ib290LW9uOwogCQl2aW4tc3VwcGx5ID0gPCZ2Y2MzM19zeXM+OwogCX07CisKKwlzb3Vu
ZCB7CisJCWNvbXBhdGlibGUgPSAicm9ja2NoaXAscm9ja2NoaXAtYXVkaW8taGRtaSI7CisJCXJv
Y2tjaGlwLG1vZGVsID0gIlZFWVJPTi1IRE1JIjsKKwkJcm9ja2NoaXAsaTJzLWNvbnRyb2xsZXIg
PSA8Jmkycz47CisJCXJvY2tjaGlwLGhkbWktY29kZWMgPSA8JmhkbWk+OworCX07CiB9OwogCiAm
Y3B1X3RoZXJtYWwgewotLSAKMi4yNC4wLnJjMC4zMDMuZzk1NGE4NjI2NjUtZ29vZwoKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxp
bmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJl
ZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
