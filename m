Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 536E4E6E00
	for <lists+dri-devel@lfdr.de>; Mon, 28 Oct 2019 09:24:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 039846E43D;
	Mon, 28 Oct 2019 08:23:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x541.google.com (mail-pg1-x541.google.com
 [IPv6:2607:f8b0:4864:20::541])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 291CF6EA32
 for <dri-devel@lists.freedesktop.org>; Fri, 25 Oct 2019 13:31:19 +0000 (UTC)
Received: by mail-pg1-x541.google.com with SMTP id w3so1567590pgt.5
 for <dri-devel@lists.freedesktop.org>; Fri, 25 Oct 2019 06:31:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=oNSnTAXUPLhOggYZsXmByzoHissc2cQrcW1ijnP3ewc=;
 b=rN1KEpIHXgmohRPy+MzU4GuzNunE5UTZh6TTuSW7RTHEt3nSl2iyvXBZukAQ0kCAVS
 m/qVKy4zN680vS1HsmIxYIQndiMVnJrMqzYP6XIOL4zSIrPaDvBKLG67W8/v2ZTwIYrK
 XDwNSq6TmlQEq9HUTrg/r1W8mhjmuSZf4tEnHE/H1Dp/UMag+ZK4+KbRk0kXiRV1QxRg
 J6IRz6Ohioy9XazNHm6HVlPJ+KGyM7U5eZ1pBh84qDeltF+KpVDDxG/Mk4MLodp86Hx3
 BpdRPNQntJ1xJiTpKRA0avtlxucG005w087Po5Ao0I1hKbnp+pIgJeGpdVINDSyLLgAT
 tcCQ==
X-Gm-Message-State: APjAAAXm+q40k3w6AtIKPZBeUgBmGJgY8XFhPZMwhAQ3SHbqYD476NWv
 kl1xdk79mkoW6r+mwXOtox/N9A==
X-Google-Smtp-Source: APXvYqzbwsXWBs3ky/vHamL+ysr3yMSuWsGovFl/YV0ZreeaOiOp90nD6ACzcZJAlWwB0QQOpZKsVA==
X-Received: by 2002:a63:4525:: with SMTP id s37mr4571578pga.148.1572010278731; 
 Fri, 25 Oct 2019 06:31:18 -0700 (PDT)
Received: from localhost ([2401:fa00:1:10:79b4:bd83:e4a5:a720])
 by smtp.gmail.com with ESMTPSA id y36sm2379120pgk.66.2019.10.25.06.31.14
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 25 Oct 2019 06:31:17 -0700 (PDT)
From: Cheng-Yi Chiang <cychiang@chromium.org>
To: linux-kernel@vger.kernel.org
Subject: [PATCH v8 5/6] ARM: dts: rockchip: Add HDMI support to
 rk3288-veyron-analog-audio
Date: Fri, 25 Oct 2019 21:30:06 +0800
Message-Id: <20191025133007.11190-6-cychiang@chromium.org>
X-Mailer: git-send-email 2.24.0.rc0.303.g954a862665-goog
In-Reply-To: <20191025133007.11190-1-cychiang@chromium.org>
References: <20191025133007.11190-1-cychiang@chromium.org>
MIME-Version: 1.0
X-Mailman-Approved-At: Mon, 28 Oct 2019 08:23:53 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=oNSnTAXUPLhOggYZsXmByzoHissc2cQrcW1ijnP3ewc=;
 b=cgKZg2IA8rLE/Gb1Fea2/UKtImFx1r+3/oLrUJKGJkgq3mqfzGP0fCzY87EqP9S0+0
 WQXRy0BralqXwRQgIPwF2wZyUs5/mIyBfACB/94kBYzmDeud7Zq9bMrWbAL3xy6flbQs
 pc4pHa+WCeiKDem2XAefpAmHZf6J9Dozhans0=
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

QWxsIGJvYXJkcyB1c2luZyByazMyODgtdmV5cm9uLWFuYWxvZy1hdWRpby5kdHNpIGhhdmUgSERN
SSBhdWRpby4KU3BlY2lmeSB0aGUgc3VwcG9ydCBvZiBIRE1JIGF1ZGlvIG9uIG1hY2hpbmUgZHJp
dmVyIHVzaW5nIGNvbXBhdGlibGUKc3RyaW5nIHNvIG1hY2hpbmUgZHJpdmVyIGNyZWF0ZXMgSERN
SSBhdWRpbyBkZXZpY2UuCgpTaWduZWQtb2ZmLWJ5OiBDaGVuZy1ZaSBDaGlhbmcgPGN5Y2hpYW5n
QGNocm9taXVtLm9yZz4KLS0tCiBhcmNoL2FybS9ib290L2R0cy9yazMyODgtdmV5cm9uLWFuYWxv
Zy1hdWRpby5kdHNpIHwgMyArKy0KIDEgZmlsZSBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKyksIDEg
ZGVsZXRpb24oLSkKCmRpZmYgLS1naXQgYS9hcmNoL2FybS9ib290L2R0cy9yazMyODgtdmV5cm9u
LWFuYWxvZy1hdWRpby5kdHNpIGIvYXJjaC9hcm0vYm9vdC9kdHMvcmszMjg4LXZleXJvbi1hbmFs
b2ctYXVkaW8uZHRzaQppbmRleCA0NDUyNzBhYTEzNmUuLjkyZWE2MjM0MDFlOSAxMDA2NDQKLS0t
IGEvYXJjaC9hcm0vYm9vdC9kdHMvcmszMjg4LXZleXJvbi1hbmFsb2ctYXVkaW8uZHRzaQorKysg
Yi9hcmNoL2FybS9ib290L2R0cy9yazMyODgtdmV5cm9uLWFuYWxvZy1hdWRpby5kdHNpCkBAIC04
LDcgKzgsNyBAQAogCiAvIHsKIAlzb3VuZCB7Ci0JCWNvbXBhdGlibGUgPSAicm9ja2NoaXAscm9j
a2NoaXAtYXVkaW8tbWF4OTgwOTAiOworCQljb21wYXRpYmxlID0gInJvY2tjaGlwLHJvY2tjaGlw
LWF1ZGlvLW1heDk4MDkwLWhkbWkiOwogCQlwaW5jdHJsLW5hbWVzID0gImRlZmF1bHQiOwogCQlw
aW5jdHJsLTAgPSA8Jm1pY19kZXQ+LCA8JmhwX2RldD47CiAJCXJvY2tjaGlwLG1vZGVsID0gIlZF
WVJPTi1JMlMiOwpAQCAtMTcsNiArMTcsNyBAQAogCQlyb2NrY2hpcCxocC1kZXQtZ3Bpb3MgPSA8
JmdwaW82IFJLX1BBNSBHUElPX0FDVElWRV9ISUdIPjsKIAkJcm9ja2NoaXAsbWljLWRldC1ncGlv
cyA9IDwmZ3BpbzYgUktfUEIzIEdQSU9fQUNUSVZFX0xPVz47CiAJCXJvY2tjaGlwLGhlYWRzZXQt
Y29kZWMgPSA8JmhlYWRzZXRjb2RlYz47CisJCXJvY2tjaGlwLGhkbWktY29kZWMgPSA8JmhkbWk+
OwogCX07CiB9OwogCi0tIAoyLjI0LjAucmMwLjMwMy5nOTU0YTg2MjY2NS1nb29nCgpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGlu
ZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVl
ZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
