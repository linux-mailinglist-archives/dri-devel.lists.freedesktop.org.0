Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id AB1F576E331
	for <lists+dri-devel@lfdr.de>; Thu,  3 Aug 2023 10:34:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1B49710E5D2;
	Thu,  3 Aug 2023 08:33:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x22c.google.com (mail-lj1-x22c.google.com
 [IPv6:2a00:1450:4864:20::22c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E4A5E10E5D2
 for <dri-devel@lists.freedesktop.org>; Thu,  3 Aug 2023 08:33:57 +0000 (UTC)
Received: by mail-lj1-x22c.google.com with SMTP id
 38308e7fff4ca-2b9dc1bff38so9846851fa.1
 for <dri-devel@lists.freedesktop.org>; Thu, 03 Aug 2023 01:33:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1691051636; x=1691656436;
 h=content-transfer-encoding:mime-version:date:message-id:subject
 :references:in-reply-to:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=gFP0+9DO5z5eu/GI4qWQeUSbbmrVEwQLwngQCeQzKbw=;
 b=JbBAxN9twm3cw2GFSTiV+lgQgX5phCEfsDHRoTr7bx2T7W6mhmPYGSPitdzwE72MEr
 3ozHXFo/INF9JXY5/mlSoGc4Q/vp9CPDshOqEbM6OQXDV2oLuC3DBxNp19XDC0naelPS
 ozOZ4dGO40jtttdwpxp9hjwNpeoiFzQw/WbAICk2kJsZwPvRoIXblp0ptAkLSV2XJfkl
 PP8ulqepnuOOKDbEJE1N+uzmJQEW68wjBdc2Tiki2j+UfL5umGlwungUdOBHDPbvt/di
 E7pk6rCuz3ZXHcQzsip62IKe4P1e9AWSsXLynIOBHfThf/r3BeZBy4xiHT4QzYTs68Pe
 FWAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1691051636; x=1691656436;
 h=content-transfer-encoding:mime-version:date:message-id:subject
 :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=gFP0+9DO5z5eu/GI4qWQeUSbbmrVEwQLwngQCeQzKbw=;
 b=Ve5LQlWDIK73mPq8wG0k4NQdcAwLtEOWm1HboxEkTcd76iT29q4ZA5hKw7Se8q9hX4
 oA5qaTeCg2iyYV29qkKntDRmxzdhSbo08+Jnsw4AEM0CFgHH1b3FmOdNd6Raa/KSrl2G
 ilBNtuNdTQO9qZeTVKdrz4sLBr6b4+na3XGKMbqsYiRCUrBKPxzQTcwg2bGCUNfW76BB
 mDGLMl/lddOK0RM1pPvJtWpq5tuNtylhkJI7ZpJAO0WZyWoHU+8drspqlNfELU7IP5P5
 XL9XProP5L/oGxqiibz/3ncxCJnqytlViUc7ZfOTvy4lIoqgNwFpYlu3dvKWT+9+8SX9
 ZU/A==
X-Gm-Message-State: ABy/qLbFn2SZIqmbVj+kXmbMOkYRq+7buFLXiTppE7H6JCZ+gOXVRTVG
 r7KzcjbZ65z6gPyVXrT6OeAM6A==
X-Google-Smtp-Source: APBJJlGjSyyIqyXsDMy03t3tVsKEALJAlFC26v4EPKUXPzG0xUEAapzOrpSN5bm4mjqUwHBFT154+g==
X-Received: by 2002:a2e:6e15:0:b0:2b4:6d59:7863 with SMTP id
 j21-20020a2e6e15000000b002b46d597863mr7020477ljc.25.1691051636071; 
 Thu, 03 Aug 2023 01:33:56 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:52eb:f6ff:feb3:451a])
 by smtp.gmail.com with ESMTPSA id
 j10-20020a5d604a000000b0031758e7ba6dsm21175448wrt.40.2023.08.03.01.33.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 03 Aug 2023 01:33:55 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
To: Andrzej Hajda <andrzej.hajda@intel.com>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Alexander Stein <alexander.stein@ew.tq-group.com>
In-Reply-To: <20230718084411.1189831-1-alexander.stein@ew.tq-group.com>
References: <20230718084411.1189831-1-alexander.stein@ew.tq-group.com>
Subject: Re: [PATCH 1/1] dt-bindings: display: bridge: tc358867: Add
 interrupt property
Message-Id: <169105163516.2532485.17482210489199279281.b4-ty@linaro.org>
Date: Thu, 03 Aug 2023 10:33:55 +0200
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.12.3
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
Cc: devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On Tue, 18 Jul 2023 10:44:11 +0200, Alexander Stein wrote:
> This bridge has an interrupt line for event signaling. Add the
> corresponding property.
> 
> 

Thanks, Applied to https://anongit.freedesktop.org/git/drm/drm-misc.git (drm-misc-next)

[1/1] dt-bindings: display: bridge: tc358867: Add interrupt property
      https://cgit.freedesktop.org/drm/drm-misc/commit/?id=078b39c9e4ba849947ded1c887bd55afdea98d65

-- 
Neil

