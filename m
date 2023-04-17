Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B1C1D6E4D31
	for <lists+dri-devel@lfdr.de>; Mon, 17 Apr 2023 17:29:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A5AEB10E3F5;
	Mon, 17 Apr 2023 15:29:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com
 [IPv6:2a00:1450:4864:20::335])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CA48E10E3F5
 for <dri-devel@lists.freedesktop.org>; Mon, 17 Apr 2023 15:29:21 +0000 (UTC)
Received: by mail-wm1-x335.google.com with SMTP id
 ay3-20020a05600c1e0300b003f17289710aso1931744wmb.5
 for <dri-devel@lists.freedesktop.org>; Mon, 17 Apr 2023 08:29:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1681745359; x=1684337359;
 h=content-transfer-encoding:mime-version:date:message-id:subject
 :references:in-reply-to:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=RzwpePrDPa7xmr54v7b5JEOp+2Pd1xHJ2snEcb8e6Q0=;
 b=xXaSXGfkqHywUqrIdSTuJGAOS2HgJQOlGEp1vPBfWt4kLdPXwVzEKmVTiN95xLc4kP
 jt6uY5G34VADtXHyi41pUyd1eX/fc6ehmYIp8G78BwotiHlWZR+7CWP6uVcNWNIYpCnI
 TBOa0nvTTmubsOSWm1ztLzYuTRM1WEE07NSI+9pUT3575MnQJ6j5UIi66rZ9uuglOaqs
 AKTTIjohJAQLbVBhCleyYRR5n5kPNDtHpyK42IV0yJWNxdrY4psQR8lOZ72VvQKFr0OS
 VrmMhFF3n8sMibZpkqcTERyK6rD5GLa87TJxyqJbjLN92pHZ8fjEaBuvPGGCoPrNgij3
 rOAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1681745359; x=1684337359;
 h=content-transfer-encoding:mime-version:date:message-id:subject
 :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=RzwpePrDPa7xmr54v7b5JEOp+2Pd1xHJ2snEcb8e6Q0=;
 b=HanUA2hJXD1n1YRSe5Zx2R39NMHebLyRFzjTXG+bzIjb0aL7sJ5b6pA+Qj1TV9S0KM
 oxlwTfvo2infSpe4dN9Bp0FTTijYE8iKB0QEOjUZoQK2A2e9whv4WHmByoAnswFtFaeJ
 etiStVEvn9TuYADH0vj3eUSnEcI3vf2mw2wMrG7D0BogN6gQWxl7NyzFQiyE2UmZ76+y
 906ovZwuAMqYEUoA9ub97ZZWkqiP0EgDF653QHrHmKc7VT8yrNKGOicogMH/cdsE+8GZ
 zoTk+TSyqaEZwnQeNGcWskltXM+OsTI9Awei+cnQeMrwCjFarxw+Nr/ExWl4kvPBzzOy
 vtoA==
X-Gm-Message-State: AAQBX9dG9U8pZhAk46YrbhSj/nrAOEvjPZKShfS2M3fck4nwZQrkybOS
 uzE6dFb38WdpT20oFh2v9LrnDQ==
X-Google-Smtp-Source: AKy350a8R3cCjE1wWQ446FxciFe8xGnzx9tik/JyEKMV1aebQPlDVAQwTU0a+LXIf1Hlno0IQpE1/Q==
X-Received: by 2002:a7b:ce14:0:b0:3f1:65de:764 with SMTP id
 m20-20020a7bce14000000b003f165de0764mr6377900wmc.32.1681745359638; 
 Mon, 17 Apr 2023 08:29:19 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:8261:5fff:fe11:bdda])
 by smtp.gmail.com with ESMTPSA id
 jb17-20020a05600c54f100b003f17316ab46sm4097554wmb.13.2023.04.17.08.29.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 17 Apr 2023 08:29:19 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
To: Jianhua Lu <lujianhua000@gmail.com>, Sam Ravnborg <sam@ravnborg.org>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <20230412-topic-lenovopanel-v3-0-bcf9ba4de46f@linaro.org>
References: <20230412-topic-lenovopanel-v3-0-bcf9ba4de46f@linaro.org>
Subject: Re: [PATCH v3 0/4] Lenovo Tab P11 panel
Message-Id: <168174535878.1042404.157210995107973966.b4-ty@linaro.org>
Date: Mon, 17 Apr 2023 17:29:18 +0200
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.12.1
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
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Marijn Suijten <marijn.suijten@somainline.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On Mon, 17 Apr 2023 16:39:02 +0200, Konrad Dybcio wrote:
> v2 -> v3:
> - Drop patch 1 (the one allowing port AND ports)
> - Pick up tags
> 
> v2: https://lore.kernel.org/r/20230412-topic-lenovopanel-v2-0-055c3649788e@linaro.org
> 
> v1 -> v2:
> - Remove dsi_info (unused for single DSI) [5/5]
> - Add backlight.scale [3/5]
> - pick up tags
> 
> [...]

Thanks, Applied to https://anongit.freedesktop.org/git/drm/drm-misc.git (drm-misc-next-fixes)

[1/4] dt-bindings: display: panel: nt36523: Add Lenovo J606F panel
      https://cgit.freedesktop.org/drm/drm-misc/commit/?id=b4b26ab24f8f9ad3aa9fbdfd211e51b051ddb91e
[2/4] drm/panel: nt36523: Add DCS backlight support
      https://cgit.freedesktop.org/drm/drm-misc/commit/?id=aecb583cb997935fb4f4a667a8013469528a8d53
[3/4] drm/panel: nt36523: Get orientation from OF
      https://cgit.freedesktop.org/drm/drm-misc/commit/?id=1eae88fa7b56b3b02d0e003a737fc31d71f3f486
[4/4] drm/panel: nt36523: Add Lenovo J606F panel
      https://cgit.freedesktop.org/drm/drm-misc/commit/?id=4f048de28b90abefff2044f450e882576eb746e9

-- 
Neil

