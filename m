Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 856ED6E40E3
	for <lists+dri-devel@lfdr.de>; Mon, 17 Apr 2023 09:29:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D50BA10E1BD;
	Mon, 17 Apr 2023 07:29:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com
 [IPv6:2a00:1450:4864:20::32a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 21C3910E1BD
 for <dri-devel@lists.freedesktop.org>; Mon, 17 Apr 2023 07:29:00 +0000 (UTC)
Received: by mail-wm1-x32a.google.com with SMTP id
 5b1f17b1804b1-3f0a80b686eso7478535e9.1
 for <dri-devel@lists.freedesktop.org>; Mon, 17 Apr 2023 00:28:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1681716538; x=1684308538;
 h=content-transfer-encoding:mime-version:date:message-id:subject
 :references:in-reply-to:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=0ks93xPrb3fXFOs4miszqIce8wwreHasGlxqjnl70wE=;
 b=MT12PihTJId6tbaNYwJ4jJBnaOmYQ8/yaqUEgpRtKaz094Z60GmjVV3oCiGtIJxE3o
 GMir3O/YDj96fCHQQpGVh0z059GqmXUiKbdJXgbmDdcbCjiFLdK9bNHbcYN8yo7qeBWg
 pjOR/nDrWkwy8jOZzmVrjVAMIJH2YDIi//fBWLclZDaD6Abw/B2j3Q6I7IgQ+HrLgg8M
 MLDrJN8ISKPld/iuXghar639S/c05sEWtX4EXOx5JJtMVJ/OecM0n9NjNS1uMDc4ll8F
 Q5BKsZa+GPQHZH7ODm1huNtuvXe+S58Uw9hF/JMSQPXbS/IYLlePM4C8OXMdbn8hEQo5
 XkWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1681716538; x=1684308538;
 h=content-transfer-encoding:mime-version:date:message-id:subject
 :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=0ks93xPrb3fXFOs4miszqIce8wwreHasGlxqjnl70wE=;
 b=fGTbdkQL5ggV9fgGvPf8h71xVKQKxw2jmnRdj88HfKmEFEdgRaAvOeBeFV3rUPo6vk
 k+AKPttngjo7w4vlmdn+aFTypEe6enkMOLcSMDuD6UnHhGkZKhFYoW57dCnxaXjACEsp
 I9ruxF7KQiNxdQSNo4c9pLYv2Dyu0qEkrufoFkoKTCI8vLRH2PvTKk3BImCV/m8iO9UF
 BfMCO1/9LHMF5JX0tUV7jK8mlfdkNX2YPx3BquFF3RHGagnQJ4PTX/S8cIQiuiClviGY
 Tf30Avy4vzISYvl1Eaqo0Na4wTA65BlMGchyRSgPhpiw0pO6i9aKH/z42SxszOss+e7N
 1KbA==
X-Gm-Message-State: AAQBX9eZ6EyDn4/azgy02bmihm/HawzXGejm2t2KkV2JC1OIbrI85s8j
 HxUjJh931FgpzVYfJxpW/k/nyQ==
X-Google-Smtp-Source: AKy350aN+Okoy4hYmAFvnXwByuGTJEOjQlFq/23QpbPOTaAzIlczgNzdVL01tZmWyYI4BL7YMHaGVQ==
X-Received: by 2002:adf:dc90:0:b0:2c7:fc61:12d4 with SMTP id
 r16-20020adfdc90000000b002c7fc6112d4mr4104948wrj.47.1681716538024; 
 Mon, 17 Apr 2023 00:28:58 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:52eb:f6ff:feb3:451a])
 by smtp.gmail.com with ESMTPSA id
 d4-20020a056000114400b002cea8f07813sm9740564wrx.81.2023.04.17.00.28.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 17 Apr 2023 00:28:57 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
To: Sam Ravnborg <sam@ravnborg.org>, David Airlie <airlied@gmail.com>, 
 Daniel Vetter <daniel@ffwll.ch>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@somainline.org>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <20230415-konrad-longbois-next-v1-1-ce695dc9df84@linaro.org>
References: <20230415-konrad-longbois-next-v1-1-ce695dc9df84@linaro.org>
Subject: Re: [PATCH] drm/panel: novatek-nt35950: Improve error handling
Message-Id: <168171653726.4116174.15834990201475611175.b4-ty@linaro.org>
Date: Mon, 17 Apr 2023 09:28:57 +0200
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
Cc: Marijn Suijten <marijn.suijten@somainline.org>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On Sat, 15 Apr 2023 13:00:30 +0200, Konrad Dybcio wrote:
> In a very peculiar case when probing and registering with the secondary
> DSI host succeeds, but the OF backlight or DSI attachment fails, the
> primary DSI device is automatically cleaned up, but the secondary one
> is not, leading to -EEXIST when the driver core tries to handle
> -EPROBE_DEFER.
> 
> Unregister the DSI1 device manually on failure to prevent that.
> 
> [...]

Thanks, Applied to https://anongit.freedesktop.org/git/drm/drm-misc.git (drm-misc-next-fixes)

[1/1] drm/panel: novatek-nt35950: Improve error handling
      https://cgit.freedesktop.org/drm/drm-misc/commit/?id=5dd45b66742a1f3cfa9a92dc0ac8714c7708ee6c

-- 
Neil

