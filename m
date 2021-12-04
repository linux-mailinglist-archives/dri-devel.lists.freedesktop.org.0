Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 24C304693B5
	for <lists+dri-devel@lfdr.de>; Mon,  6 Dec 2021 11:27:40 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7C3737AB4E;
	Mon,  6 Dec 2021 10:20:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x230.google.com (mail-lj1-x230.google.com
 [IPv6:2a00:1450:4864:20::230])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 197756E9C7
 for <dri-devel@lists.freedesktop.org>; Sat,  4 Dec 2021 14:37:36 +0000 (UTC)
Received: by mail-lj1-x230.google.com with SMTP id 207so11920437ljf.10
 for <dri-devel@lists.freedesktop.org>; Sat, 04 Dec 2021 06:37:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Eb7uDgOyBpxldHIEI+VonaK+Xu/ASCFuEjbDdDXN+6A=;
 b=KGnKA/dQc8pbQH0H3RIo4qaNKiRY7d6IAIGib9U78EeBrBD/UO9dBe39jn6NgwttBT
 jNS8LifWCAC6/vvC65qiJ585D9msh7sKwa2ZYt9WGQa6By9MrbEE/f5CC5RsaJ0mIIB2
 TJbx5dCfEdNn+VlHCLE/7DollFvrYKaP3BZ8zUtdAjX5rJHLshRJ4iHArEL57GLRzotm
 FPRXwdsppJ+fypDqncS0FQ2Xnkm92/QOqvfu0yQ9Do6TDxruI30g9yzSURNHxDvHQUWU
 CNsfOhgo0bGgWEqY9ECgmDBN1xOjLkEftjUTzDxwrnaKbQ6JrujXIJartr0qyZVNSC2f
 ADnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Eb7uDgOyBpxldHIEI+VonaK+Xu/ASCFuEjbDdDXN+6A=;
 b=ozXwCG/IKvOqQQSB7k6gV06qsDF2zx2tZsZZeEcMLHri4j4q3s+kOlyuU7XsTQlMQV
 kldVD0oX2NSPKS8kBiQfu9kx19gyPhKBFjeN2ArPdLfWUAa4izM+/6ZIQSLQuyiVkUY6
 7xMXkjQrAfQBfS/Zj4SjtYURFiF3fBJXeoHFWAlPAagI0sYARJiG6D0ugijHhxJtHNF0
 MhcnnXh0jMCDx5+w15gNFDxr0JujVpOER50szwho3QXyjMPq6kD7sqCNKQm+Or0ci/3y
 BqBE+4QXdU6ISBN+IXom5UWE1esIkCuaxbFBJUDWmd+GJl47YlOsYentJnzzG/iwAet9
 Npqg==
X-Gm-Message-State: AOAM531Yea4uU0KpE1NopjgyStaXjmRh9G7hO7tDAsngwL8S2JY+1SF8
 JNi+t97CyV+GAp+F9OmzZrY=
X-Google-Smtp-Source: ABdhPJxG9CwWehDg+cjNOGJNJ68s2+9n0UqBCW/yFW5nzEyc+H1ZMEC6RTa4ZNUFnEefQ+7xWgLCFQ==
X-Received: by 2002:a2e:9017:: with SMTP id h23mr24483040ljg.13.1638628654467; 
 Sat, 04 Dec 2021 06:37:34 -0800 (PST)
Received: from localhost.localdomain (94-29-46-111.dynamic.spd-mgts.ru.
 [94.29.46.111])
 by smtp.gmail.com with ESMTPSA id g36sm782934lfv.16.2021.12.04.06.37.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 04 Dec 2021 06:37:34 -0800 (PST)
From: Dmitry Osipenko <digetx@gmail.com>
To: Thierry Reding <thierry.reding@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>, Mark Brown <broonie@kernel.org>,
 Takashi Iwai <tiwai@suse.com>, Jaroslav Kysela <perex@perex.cz>,
 Liam Girdwood <lgirdwood@gmail.com>, Agneli <poczt@protonmail.ch>
Subject: [PATCH v4 04/22] dt-bindings: host1x: Document optional HDMI
 sound-dai-cells
Date: Sat,  4 Dec 2021 17:37:07 +0300
Message-Id: <20211204143725.31646-5-digetx@gmail.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20211204143725.31646-1-digetx@gmail.com>
References: <20211204143725.31646-1-digetx@gmail.com>
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
 dri-devel@lists.freedesktop.org, Rob Herring <robh+dt@kernel.org>,
 linux-tegra@vger.kernel.org
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

