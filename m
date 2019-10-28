Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CC44CE6E1C
	for <lists+dri-devel@lfdr.de>; Mon, 28 Oct 2019 09:24:56 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B515E6E497;
	Mon, 28 Oct 2019 08:23:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x543.google.com (mail-pg1-x543.google.com
 [IPv6:2607:f8b0:4864:20::543])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A7D116E0FB
 for <dri-devel@lists.freedesktop.org>; Mon, 28 Oct 2019 07:21:30 +0000 (UTC)
Received: by mail-pg1-x543.google.com with SMTP id r1so6272862pgj.12
 for <dri-devel@lists.freedesktop.org>; Mon, 28 Oct 2019 00:21:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=4rbGb1xeN7CoEMiXrmYQTMXVCXS/HU0F9W4cYEOILvE=;
 b=Jx4OdS+nFqfqbdleEcZ2k3BtSU3/f2pZSszqeRXxEUKbt219cJwAQ7c1cgtS5VwY5O
 uBoWnoi0nIWD5MlnPxNN01xDLUxVzrBJsJgTJH1JKqW0sTkN2uTju/nhg5ReYLnDFTrz
 CN90MCRH+ds0wDceKVIaUWiq0wg3g7tbJHSFJlf9I75F17ZPGYduHk0+p/s9mwEh7w66
 5J/htba7hYpfnApDLxp94j+l/FO/SU/Wp0YMO6fTm16fmTonKPIW9S+UFqoNzUjv2AcS
 B4whpf2Vd+YTsP+zPCskG/TfjhShHWCkJPhgHs7av3yAF3qk4VqfD398gn0rYr2VEJC1
 0JWA==
X-Gm-Message-State: APjAAAVg7sFFkw4EUBfvb1/agWoj9sPMzJf36cg62+xvCpwKWWTeu/1q
 V/s00Urd7iWPpSBC3WjqnU0mGg==
X-Google-Smtp-Source: APXvYqx/hdNJw8hOBpqJnyg7o7+cJPqViehbs5Haz5us8Y755g6iC5ZO8EJknw7fLaGsymzzXl+PJA==
X-Received: by 2002:a63:2c45:: with SMTP id s66mr1198158pgs.248.1572247290245; 
 Mon, 28 Oct 2019 00:21:30 -0700 (PDT)
Received: from localhost ([2401:fa00:1:10:79b4:bd83:e4a5:a720])
 by smtp.gmail.com with ESMTPSA id w6sm9811583pfw.84.2019.10.28.00.21.25
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 28 Oct 2019 00:21:29 -0700 (PDT)
From: Cheng-Yi Chiang <cychiang@chromium.org>
To: linux-kernel@vger.kernel.org
Subject: [PATCH v9 6/6] ARM: dts: rockchip: Add HDMI audio support to
 rk3288-veyron-mickey.dts
Date: Mon, 28 Oct 2019 15:19:30 +0800
Message-Id: <20191028071930.145899-7-cychiang@chromium.org>
X-Mailer: git-send-email 2.24.0.rc0.303.g954a862665-goog
In-Reply-To: <20191028071930.145899-1-cychiang@chromium.org>
References: <20191028071930.145899-1-cychiang@chromium.org>
MIME-Version: 1.0
X-Mailman-Approved-At: Mon, 28 Oct 2019 08:23:53 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=4rbGb1xeN7CoEMiXrmYQTMXVCXS/HU0F9W4cYEOILvE=;
 b=LLuW/hoCz0kb7qlhmY1LiUcIcgWwr7eNcpXZvUZYIIfw+1Y/hSQlFpMmHrr3w2w0Ql
 wwL6EKwOH3u9eYdO3vXO3rqqHyfTy8JUURWOa4FF78ZBdrZl952TfClRmjTZLhgmFIBu
 Qn6O3CVnphnd2Pyti/yjGyPJI9oJih7MC5738=
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
eS5kdHMKaW5kZXggYWEzNTJkNDBjOTkxLi5jZjUzY2I0NTk0YzQgMTAwNjQ0Ci0tLSBhL2FyY2gv
YXJtL2Jvb3QvZHRzL3JrMzI4OC12ZXlyb24tbWlja2V5LmR0cworKysgYi9hcmNoL2FybS9ib290
L2R0cy9yazMyODgtdmV5cm9uLW1pY2tleS5kdHMKQEAgLTI4LDYgKzI4LDEzIEBACiAJCXJlZ3Vs
YXRvci1ib290LW9uOwogCQl2aW4tc3VwcGx5ID0gPCZ2Y2MzM19zeXM+OwogCX07CisKKwlzb3Vu
ZCB7CisJCWNvbXBhdGlibGUgPSAicm9ja2NoaXAscm9ja2NoaXAtYXVkaW8tbWF4OTgwOTAiOwor
CQlyb2NrY2hpcCxtb2RlbCA9ICJWRVlST04tSERNSSI7CisJCXJvY2tjaGlwLGkycy1jb250cm9s
bGVyID0gPCZpMnM+OworCQlyb2NrY2hpcCxoZG1pLWNvZGVjID0gPCZoZG1pPjsKKwl9OwogfTsK
IAogJmNwdV90aGVybWFsIHsKLS0gCjIuMjQuMC5yYzAuMzAzLmc5NTRhODYyNjY1LWdvb2cKCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBt
YWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3Rz
LmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
