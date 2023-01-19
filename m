Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 462266732CF
	for <lists+dri-devel@lfdr.de>; Thu, 19 Jan 2023 08:44:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 90E9810E8C9;
	Thu, 19 Jan 2023 07:44:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com
 [IPv6:2a00:1450:4864:20::32a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5DBEC10E8C6
 for <dri-devel@lists.freedesktop.org>; Thu, 19 Jan 2023 07:44:22 +0000 (UTC)
Received: by mail-wm1-x32a.google.com with SMTP id
 c4-20020a1c3504000000b003d9e2f72093so2957625wma.1
 for <dri-devel@lists.freedesktop.org>; Wed, 18 Jan 2023 23:44:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:date:message-id:subject
 :references:in-reply-to:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=eKZQ91Aw87nv1viQEfl8utbxQ45kNGlGmqk/4SGhfo0=;
 b=APlxfIM5M6KKMl7wxzQSVG/X+R3Otv6xmy8/ek59j069tVUBauUpKlA/NpRiyUTOYL
 D7lHh7ru4PscfSHCKTD+Br9JN/Uhwmqe0ilar2hD8SPN6E1JwDVybbA4oSw7uEgdFKeK
 BVx7RPozYTkiu//FFz1Ccinye/mdF4djVez8ALMfiEfiMupIFQzBqN9jEM5RAEcfh44b
 kuYmOUGeCT2F/iLe2o1OOkp3q+qSnF2+R/FXkb3LXgpsaAMzcElvBKoNUDwTw4Wz6dp4
 v6DRfT2Fof+tSEBLjJYIzMdWuJfbcAq2PiSwuC0nitaOvdKnXH4G1l+yOdE2zz7540m7
 gKDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:date:message-id:subject
 :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=eKZQ91Aw87nv1viQEfl8utbxQ45kNGlGmqk/4SGhfo0=;
 b=ol1hrFUQzBKjsfunivjKQ8LJbdvhbYzkxzXj/29OgSxa65myy+MqCCqjQXg+TCPklx
 YQgkLsAmXCfuw4gCiiHRYJnRGVQXd3csLj1HN+trjTLbHAoXTyXq2vek2OVcd66MuhxC
 4xfeIwh6kvMTKbv2O1qdLndCcSgGMrVXJutORdPG8clDugPdgpIxqlQ9sj4Ly9J5+/DQ
 +1riD1VLhlUAgLvshtJKlD+8EO4a1Nj0R+OuiNgC27Z12ExZXk0wVy1NkJqHJrSmCF4F
 ulw0jAWDW1ISzH3BHGsO75ZOjuqf937mHsT+/KdOB/Lx1zhWUaPVU92/pyt188hzriRl
 Q0qA==
X-Gm-Message-State: AFqh2krIOIh0puZ/1IMPp3dX1cGSy9gaf0y5T5V1FuVDENwxsGQPalrk
 gpqL3oNQlQTC3EJNdd0H54hf6Q==
X-Google-Smtp-Source: AMrXdXssvCc0ssiNmEmtP7KI9CPYfAoVDx4z1HqRc6HVFNdJza4wLoqwdqwR31tj/d37i2pUyCt9qQ==
X-Received: by 2002:a05:600c:539b:b0:3d9:f836:3728 with SMTP id
 hg27-20020a05600c539b00b003d9f8363728mr9342406wmb.11.1674114260907; 
 Wed, 18 Jan 2023 23:44:20 -0800 (PST)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:52eb:f6ff:feb3:451a])
 by smtp.gmail.com with ESMTPSA id
 bg14-20020a05600c3c8e00b003dab40f9eafsm5143529wmb.35.2023.01.18.23.44.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 18 Jan 2023 23:44:20 -0800 (PST)
From: Neil Armstrong <neil.armstrong@linaro.org>
To: Andrzej Hajda <andrzej.hajda@intel.com>,
 Robert Foss <robert.foss@linaro.org>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Biju Das <biju.das.jz@bp.renesas.com>
In-Reply-To: <20221122195413.1882486-1-biju.das.jz@bp.renesas.com>
References: <20221122195413.1882486-1-biju.das.jz@bp.renesas.com>
Subject: Re: [PATCH] dt-bindings: display: bridge: renesas,rzg2l-mipi-dsi:
 Document RZ/V2L support
Message-Id: <167411426002.269815.4893986069711340416.b4-ty@linaro.org>
Date: Thu, 19 Jan 2023 08:44:20 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.11.1
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
Cc: Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
 devicetree@vger.kernel.org, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>, Jonas Karlman <jonas@kwiboo.se>,
 dri-devel@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On Tue, 22 Nov 2022 19:54:13 +0000, Biju Das wrote:
> Document RZ/V2L DSI bindings. RZ/V2L MIPI DSI is identical to one found on
> the RZ/G2L SoC. No driver changes are required as generic compatible
> string "renesas,rzg2l-mipi-dsi" will be used as a fallback.
> 
> 

Thanks, Applied to https://anongit.freedesktop.org/git/drm/drm-misc.git (drm-misc-next)

[1/1] dt-bindings: display: bridge: renesas,rzg2l-mipi-dsi: Document RZ/V2L support
      https://cgit.freedesktop.org/drm/drm-misc/commit/?id=ae5a8dce3c86c1ea8e17910c3836b92a406f9ad8

-- 
Neil
