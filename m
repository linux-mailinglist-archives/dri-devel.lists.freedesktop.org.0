Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9FE44B8BE9
	for <lists+dri-devel@lfdr.de>; Fri, 20 Sep 2019 09:52:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F08036F585;
	Fri, 20 Sep 2019 07:51:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x543.google.com (mail-pg1-x543.google.com
 [IPv6:2607:f8b0:4864:20::543])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1E5DC6F662
 for <dri-devel@lists.freedesktop.org>; Thu, 19 Sep 2019 13:55:25 +0000 (UTC)
Received: by mail-pg1-x543.google.com with SMTP id n9so1980102pgc.1
 for <dri-devel@lists.freedesktop.org>; Thu, 19 Sep 2019 06:55:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=hcI+2qu3SHO1kkNhBRtR499gEhJVXFuDOb0iaJPJu1o=;
 b=FR/DJPW2SdlrK/97X9krLlc0iFMjLfjLb9fm4q1IGpEob3XOEhclDuMxnKcOtaSLCf
 c5qmQdRFLAjvDlJa3X0eL5eNErX4tMoY1IoRgEt+QM/KvpCJM0LsjOM+k4S6YBbwGStO
 5QBr6Gm4f5q6eWjZXpzHbqx6Oz+HIT/VYNQFNCBAoZ9ugmREpBgpLLiAby0NoS3cv0HX
 F9mG47HpyaL7JEsaRqyC/rfRxjUAM5QrsJpVtHSWekFWxVuSgvtM+lyUKbOkKx2mKauS
 1znoR/krXbUwdgK84CWogNMOYDXqYev2GqpmBQaEyHCRW/U7eCHlu1KpDylasdep32QR
 clPA==
X-Gm-Message-State: APjAAAXzjgHDZuAMhrV0paNNokniJuXnRolCsq28X6AV9AL52dCYSYT8
 uPMgSK2Sv/nRbTbk2Hqsl51hzQ==
X-Google-Smtp-Source: APXvYqxyO8jD+PyDoTHkQIAYtp40Pex0/Mt27q7YWzADpFPuYqtJNqaFngWeKrfqiIca+BqjDGsIqA==
X-Received: by 2002:aa7:8acf:: with SMTP id b15mr4201816pfd.191.1568901324804; 
 Thu, 19 Sep 2019 06:55:24 -0700 (PDT)
Received: from localhost ([2401:fa00:1:10:79b4:bd83:e4a5:a720])
 by smtp.gmail.com with ESMTPSA id q88sm6395907pjq.9.2019.09.19.06.55.20
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 19 Sep 2019 06:55:24 -0700 (PDT)
From: Cheng-Yi Chiang <cychiang@chromium.org>
To: linux-kernel@vger.kernel.org
Subject: [PATCH v7 2/4] ASoC: rockchip-max98090: Add description for rockchip,
 hdmi-codec
Date: Thu, 19 Sep 2019 21:54:48 +0800
Message-Id: <20190919135450.62309-3-cychiang@chromium.org>
X-Mailer: git-send-email 2.23.0.237.gc6a4ce50a0-goog
In-Reply-To: <20190919135450.62309-1-cychiang@chromium.org>
References: <20190919135450.62309-1-cychiang@chromium.org>
MIME-Version: 1.0
X-Mailman-Approved-At: Fri, 20 Sep 2019 07:51:40 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=hcI+2qu3SHO1kkNhBRtR499gEhJVXFuDOb0iaJPJu1o=;
 b=iWJDh8AorH8nEJumZm/WKDcQuo+qYc151hnc2ynZHB08lu8t45FcSFc3XK8W4mnp1c
 T3000UZZfeJmfDdnixCbXHBmimTrjln/Z/hDuuTKRAyWMnJ9IL3M2Pgs8uVYZ8Okmtj9
 olBky5YGCY5LZ6wfafMKw7O8qXwRl3ZWMAZ34=
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
Cc: alsa-devel@alsa-project.org, Neil Armstrong <narmstrong@baylibre.com>,
 David Airlie <airlied@linux.ie>, dri-devel@lists.freedesktop.org,
 Liam Girdwood <lgirdwood@gmail.com>, Hans Verkuil <hverkuil@xs4all.nl>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jerome Brunet <jbrunet@baylibre.com>, Takashi Iwai <tiwai@suse.com>,
 linux-rockchip@lists.infradead.org, dgreid@chromium.org,
 Cheng-Yi Chiang <cychiang@chromium.org>, tzungbi@chromium.org,
 Jonas Karlman <jonas@kwiboo.se>, Russell King <rmk+kernel@armlinux.org.uk>,
 Mark Brown <broonie@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
 linux-arm-kernel@lists.infradead.org, Jernej Skrabec <jernej.skrabec@siol.net>,
 dianders@chromium.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

QWRkIHN1cHBvcnQgZm9yIEhETUkgY29kZWMgaW4gcm9ja2NoaXAtbWF4OTgwOTAuCkxldCB1c2Vy
IHNwZWNpZnkgSERNSSBkZXZpY2Ugbm9kZSBpbiBEVFMgc28gbWFjaGluZSBkcml2ZXIgY2FuIGZp
bmQKaGRtaS1jb2RlYyBkZXZpY2Ugbm9kZSBmb3IgY29kZWMgREFJLgoKU2lnbmVkLW9mZi1ieTog
Q2hlbmctWWkgQ2hpYW5nIDxjeWNoaWFuZ0BjaHJvbWl1bS5vcmc+Ci0tLQogRG9jdW1lbnRhdGlv
bi9kZXZpY2V0cmVlL2JpbmRpbmdzL3NvdW5kL3JvY2tjaGlwLW1heDk4MDkwLnR4dCB8IDIgKysK
IDEgZmlsZSBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKykKCmRpZmYgLS1naXQgYS9Eb2N1bWVudGF0
aW9uL2RldmljZXRyZWUvYmluZGluZ3Mvc291bmQvcm9ja2NoaXAtbWF4OTgwOTAudHh0IGIvRG9j
dW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL3NvdW5kL3JvY2tjaGlwLW1heDk4MDkwLnR4
dAppbmRleCBhODA1YWE5OWFkNzUuLjk3ZmM4Mzg0NThmNyAxMDA2NDQKLS0tIGEvRG9jdW1lbnRh
dGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL3NvdW5kL3JvY2tjaGlwLW1heDk4MDkwLnR4dAorKysg
Yi9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3Mvc291bmQvcm9ja2NoaXAtbWF4OTgw
OTAudHh0CkBAIC03LDYgKzcsNyBAQCBSZXF1aXJlZCBwcm9wZXJ0aWVzOgogICBjb25uZWN0ZWQg
dG8gdGhlIENPREVDCiAtIHJvY2tjaGlwLGF1ZGlvLWNvZGVjOiBUaGUgcGhhbmRsZSBvZiB0aGUg
TUFYOTgwOTAgYXVkaW8gY29kZWMKIC0gcm9ja2NoaXAsaGVhZHNldC1jb2RlYzogVGhlIHBoYW5k
bGUgb2YgRXh0IGNoaXAgZm9yIGphY2sgZGV0ZWN0aW9uCistIHJvY2tjaGlwLGhkbWktY29kZWM6
IFRoZSBwaGFuZGxlIG9mIEhETUkgZGV2aWNlIGZvciBIRE1JIGNvZGVjLgogCiBFeGFtcGxlOgog
CkBAIC0xNiw0ICsxNyw1IEBAIHNvdW5kIHsKIAlyb2NrY2hpcCxpMnMtY29udHJvbGxlciA9IDwm
aTJzPjsKIAlyb2NrY2hpcCxhdWRpby1jb2RlYyA9IDwmbWF4OTgwOTA+OwogCXJvY2tjaGlwLGhl
YWRzZXQtY29kZWMgPSA8JmhlYWRzZXRjb2RlYz47CisJcm9ja2NoaXAsaGRtaS1jb2RlYyA9IDwm
aGRtaT47CiB9OwotLSAKMi4yMy4wLjIzNy5nYzZhNGNlNTBhMC1nb29nCgpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0
CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3Rv
cC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
