Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 69E074667E9
	for <lists+dri-devel@lfdr.de>; Thu,  2 Dec 2021 17:25:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A63C66FB11;
	Thu,  2 Dec 2021 16:25:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x129.google.com (mail-lf1-x129.google.com
 [IPv6:2a00:1450:4864:20::129])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7C9956FB16
 for <dri-devel@lists.freedesktop.org>; Thu,  2 Dec 2021 16:25:21 +0000 (UTC)
Received: by mail-lf1-x129.google.com with SMTP id u3so72840800lfl.2
 for <dri-devel@lists.freedesktop.org>; Thu, 02 Dec 2021 08:25:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Eb7uDgOyBpxldHIEI+VonaK+Xu/ASCFuEjbDdDXN+6A=;
 b=lMiY1EXt4w+RL9u0IPATTDoQY0ybYySCgRRawq7FiQQ6cu8lGKSuRmzHsR0SYmAs9E
 NTwTFVZDuohdN6l5gAxtcgSan+WimVzGGoQLdRUHZccNPI2adS24DLVL1BUaefWqfIhJ
 CJuCuHsM6SA+zRVoRBhK4Okt3KwSdqS3aZhu6TRUnZo97joIoej0hmLU0eSlmKSokw22
 CfKi27lCSZXfyFjaclrJ+rFKYg3dtqoo0SDNuuysa/OSPlnIrAvPuIj9S4s2yzuXwWRP
 kUwBE+9zfZfWrjCsepQmTitsjcgaBbKcoKzsAP6P6BbqXGqxSIfPFu5nWAmeNYtQOQkw
 KG9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Eb7uDgOyBpxldHIEI+VonaK+Xu/ASCFuEjbDdDXN+6A=;
 b=q9N7cvH7yb8PFv2MZl+Uu6Hu6mzo7B3Ak2ktuXnyi/G+apTxcwvzdwsRjfXy6/PSVJ
 z6vs8pQYRqeKabCVOrCRdNgZy9GT6JfAXWXMUPvrED/jVtoMfULkKMQ7hWq8e/4c1geH
 8FO2goMryb1BMkTskfX8jE1LxxROBFS3jejzdfcHH6z/4ehcbCGkHTWMKqj+SlHLA8gF
 lTEiVyQVjSVuQ6eDZcNFIaXv6V+h9tgIdb31BOJh5qTMcoGtxGnjARvpmgjgxlUQCf9N
 XSjKiTV8khzpEMKxwWTlItA5cXZ0g6UMiB5kXPEFrGfvx8huHWWmQBHhb3BPZxB59Q62
 z35A==
X-Gm-Message-State: AOAM5333hKxFn5PefVXU1avN7V8n3oVLRSIpZjKkVmGMm/rlNSdE7ptm
 jor75v95eA7A9ZoXHcCXf6Y=
X-Google-Smtp-Source: ABdhPJwlmJsck7gfHr6wwFHtKiWtjlI65dHudAqSt9x2WsizwLZ0RHza4o9/pwyFMZ5LqykxSAe8yQ==
X-Received: by 2002:a05:6512:2304:: with SMTP id
 o4mr12337688lfu.104.1638462319854; 
 Thu, 02 Dec 2021 08:25:19 -0800 (PST)
Received: from localhost.localdomain (94-29-46-111.dynamic.spd-mgts.ru.
 [94.29.46.111])
 by smtp.gmail.com with ESMTPSA id d18sm36806lfl.30.2021.12.02.08.25.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 02 Dec 2021 08:25:19 -0800 (PST)
From: Dmitry Osipenko <digetx@gmail.com>
To: Thierry Reding <thierry.reding@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>, Mark Brown <broonie@kernel.org>,
 Takashi Iwai <tiwai@suse.com>, Jaroslav Kysela <perex@perex.cz>,
 Liam Girdwood <lgirdwood@gmail.com>, Agneli <poczt@protonmail.ch>,
 Rob Herring <robh+dt@kernel.org>
Subject: [PATCH v3 04/20] dt-bindings: host1x: Document optional HDMI
 sound-dai-cells
Date: Thu,  2 Dec 2021 19:23:25 +0300
Message-Id: <20211202162341.1791-5-digetx@gmail.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20211202162341.1791-1-digetx@gmail.com>
References: <20211202162341.1791-1-digetx@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 Arnd Bergmann <arnd@arndb.de>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-tegra@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Document new optional sound-dai-cells property of HDMI node. This node will
be used as endpoint of HDMI sound DAI graph.

Acked-by: Rob Herring <robh@kernel.org>
Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 .../devicetree/bindings/display/tegra/nvidia,tegra20-host1x.txt  | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/display/tegra/nvidia,tegra20-host1x.txt b/Documentation/devicetree/bindings/display/tegra/nvidia,tegra20-host1x.txt
index e61999ce54e9..27b746f28f31 100644
--- a/Documentation/devicetree/bindings/display/tegra/nvidia,tegra20-host1x.txt
+++ b/Documentation/devicetree/bindings/display/tegra/nvidia,tegra20-host1x.txt
@@ -297,6 +297,7 @@ of the following host1x client modules:
   - nvidia,edid: supplies a binary EDID blob
   - nvidia,panel: phandle of a display panel
   - operating-points-v2: See ../bindings/opp/opp.txt for details.
+  - #sound-dai-cells: Should be 0.
 
 - tvo: TV encoder output
 
-- 
2.33.1

