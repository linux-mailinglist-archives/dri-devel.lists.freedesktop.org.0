Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 34E2AE6E08
	for <lists+dri-devel@lfdr.de>; Mon, 28 Oct 2019 09:24:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 39D596E455;
	Mon, 28 Oct 2019 08:23:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x642.google.com (mail-pl1-x642.google.com
 [IPv6:2607:f8b0:4864:20::642])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 011B86E3AA
 for <dri-devel@lists.freedesktop.org>; Mon, 28 Oct 2019 07:21:22 +0000 (UTC)
Received: by mail-pl1-x642.google.com with SMTP id y24so5135017plr.12
 for <dri-devel@lists.freedesktop.org>; Mon, 28 Oct 2019 00:21:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=SjvUltuh2v1/qjjUiDFm1v63Jt23MLQuB40iH2adgOI=;
 b=djcCaU9YPY6jr515yp4/5wj8xQBTSf/cQsntSTiNVb5STZBVLc1cJ9Fe63AxqJ9KJ9
 En3wUCMYm7wcSTG+p9Mpjds8pe+df9VCprDRog/93+aq0oLIcCu9lwpZYQqQhc2YcUGW
 CQrfj+6yVTnaG+yfgbx8B5MLUAw/Bz6RVJbmXHNni89xvKyfs1yKAtuviA3RSXALlCf6
 yfBjIPOUkD8DnJcIEt4USVzAgfpLd+g5TtIuuybM066RomT+w3/ND60QdRr1AdjsIsXT
 OX7smhAXWTJmhWkTJ2bDtDasGy7/RwuGZGItzWSdnUvtDMfRu3EPUTl7V7uxyq979YoH
 kwyA==
X-Gm-Message-State: APjAAAUXngNwo08TVFafP1L7trPLJzI6AFxUSvGB/Kvzq5KEDBjpVyTH
 TJsXg+tfbjpjz6DAdBNunOAyqg==
X-Google-Smtp-Source: APXvYqwQobGd2yy0h+d8xDL2+pMj+A5vCdvqmHiGo4UYL5LngwD8QHY8Y1z1VloRFcuJdF2lxCaDwQ==
X-Received: by 2002:a17:902:bc48:: with SMTP id
 t8mr17749026plz.167.1572247282658; 
 Mon, 28 Oct 2019 00:21:22 -0700 (PDT)
Received: from localhost ([2401:fa00:1:10:79b4:bd83:e4a5:a720])
 by smtp.gmail.com with ESMTPSA id 18sm9589688pfp.100.2019.10.28.00.21.18
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 28 Oct 2019 00:21:21 -0700 (PDT)
From: Cheng-Yi Chiang <cychiang@chromium.org>
To: linux-kernel@vger.kernel.org
Subject: [PATCH v9 5/6] ARM: dts: rockchip: Add HDMI support to
 rk3288-veyron-analog-audio
Date: Mon, 28 Oct 2019 15:19:29 +0800
Message-Id: <20191028071930.145899-6-cychiang@chromium.org>
X-Mailer: git-send-email 2.24.0.rc0.303.g954a862665-goog
In-Reply-To: <20191028071930.145899-1-cychiang@chromium.org>
References: <20191028071930.145899-1-cychiang@chromium.org>
MIME-Version: 1.0
X-Mailman-Approved-At: Mon, 28 Oct 2019 08:23:53 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=SjvUltuh2v1/qjjUiDFm1v63Jt23MLQuB40iH2adgOI=;
 b=buMahIY2QkRhxUMbtrIj3QU2PwGHfajv7+ks2hGSjMkp72N2uLGZOgxlF9/W6Fwu5A
 mkL0SiRP70ryL4HwrbZhXGjw82cfTiIZERn9FuzGmR3FYXWw5EIZaQKjD+rZuvl4bjHV
 ZpFBOdPdzHyMDjCJr9cA+29/2iblFNKU///AE=
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
dmVyIHVzaW5nCnJvY2tjaGlwLGhkbWktY29kZWMgcHJvcGVydHkgc28gbWFjaGluZSBkcml2ZXIg
Y3JlYXRlcyBIRE1JIGF1ZGlvIGRldmljZS4KClNpZ25lZC1vZmYtYnk6IENoZW5nLVlpIENoaWFu
ZyA8Y3ljaGlhbmdAY2hyb21pdW0ub3JnPgotLS0KIGFyY2gvYXJtL2Jvb3QvZHRzL3JrMzI4OC12
ZXlyb24tYW5hbG9nLWF1ZGlvLmR0c2kgfCAxICsKIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlv
bigrKQoKZGlmZiAtLWdpdCBhL2FyY2gvYXJtL2Jvb3QvZHRzL3JrMzI4OC12ZXlyb24tYW5hbG9n
LWF1ZGlvLmR0c2kgYi9hcmNoL2FybS9ib290L2R0cy9yazMyODgtdmV5cm9uLWFuYWxvZy1hdWRp
by5kdHNpCmluZGV4IDQ0NTI3MGFhMTM2ZS4uNTEyMDhkMTYxZDY1IDEwMDY0NAotLS0gYS9hcmNo
L2FybS9ib290L2R0cy9yazMyODgtdmV5cm9uLWFuYWxvZy1hdWRpby5kdHNpCisrKyBiL2FyY2gv
YXJtL2Jvb3QvZHRzL3JrMzI4OC12ZXlyb24tYW5hbG9nLWF1ZGlvLmR0c2kKQEAgLTE3LDYgKzE3
LDcgQEAKIAkJcm9ja2NoaXAsaHAtZGV0LWdwaW9zID0gPCZncGlvNiBSS19QQTUgR1BJT19BQ1RJ
VkVfSElHSD47CiAJCXJvY2tjaGlwLG1pYy1kZXQtZ3Bpb3MgPSA8JmdwaW82IFJLX1BCMyBHUElP
X0FDVElWRV9MT1c+OwogCQlyb2NrY2hpcCxoZWFkc2V0LWNvZGVjID0gPCZoZWFkc2V0Y29kZWM+
OworCQlyb2NrY2hpcCxoZG1pLWNvZGVjID0gPCZoZG1pPjsKIAl9OwogfTsKIAotLSAKMi4yNC4w
LnJjMC4zMDMuZzk1NGE4NjI2NjUtZ29vZwoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMu
ZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlz
dGluZm8vZHJpLWRldmVs
