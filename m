Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id F27BD7157ED
	for <lists+dri-devel@lfdr.de>; Tue, 30 May 2023 10:06:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6DCFC10E370;
	Tue, 30 May 2023 08:06:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com
 [IPv6:2a00:1450:4864:20::332])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 93D9F10E370
 for <dri-devel@lists.freedesktop.org>; Tue, 30 May 2023 08:06:14 +0000 (UTC)
Received: by mail-wm1-x332.google.com with SMTP id
 5b1f17b1804b1-3f601c57d8dso29598585e9.0
 for <dri-devel@lists.freedesktop.org>; Tue, 30 May 2023 01:06:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1685433972; x=1688025972;
 h=content-transfer-encoding:mime-version:date:message-id:subject
 :references:in-reply-to:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=x65KE+uKYeb7ssZC2FNtK6B+rqgxlUIxtSzrxN15FOQ=;
 b=ffOEDtzeJr+xuIg4YRJs+HxBmRdZ9NFk4+Mx0Ch6k6aCZWaBMLXytREcCsnIz2iXZa
 UV3bz4l7qnjsf4LaVQtmpjb2KulMGMN43h+oxPPCJuWpFy4eBSA4Cd1hqa9xNUIUkvQ3
 Z9rZTPrtlS1nmm8CYxK4tumA4GTTBO9hqfgdpv0rNAn8Ndg85ynai6XSeciCx3EVBcX2
 egfHQAbYI22wAw34083Gz6t3ownLmZmgHcokMAoj9hFkkdMlea/LWsAG2bflk290xA1f
 LCpw0ngJ9efdnXlM+a3z2r9JEZ4W006Xa9DV/6cX38P7hpsM880lgni9yaqPQsETMqo0
 GjUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1685433972; x=1688025972;
 h=content-transfer-encoding:mime-version:date:message-id:subject
 :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=x65KE+uKYeb7ssZC2FNtK6B+rqgxlUIxtSzrxN15FOQ=;
 b=Ces/8Zkm3AJI3fU+xOC+4Up/xSGdQsSBvOztRMntzq7gmoGwCngbAIxTYZP629H78G
 PVK2JkuGwBQi+KvSurCkraYHImpuYJip7rET06uEJYNb6SFj9GDHHYWSXZt5q1i/5HX5
 S02V2RO/EQ03p3NE7eeYnYnklhcEtV8M7LMxuTGrXU5vfQAld1c019lS+fdww0AQPPHw
 upFTiWhGsEJExKKJ9d39RSF0iF1lSzPJWASJ5Qp3U3mS2X/ejBdITc4LqmrNQ32H9jc9
 ausLPWrSIRVDta3Y8dJB0rGzVWg4Gm7/P41gf/rz6yR4WiCVsClNO67rwd+cV2iGXMHk
 V50g==
X-Gm-Message-State: AC+VfDyPa8NFPH1cNSAXtHSZBSNaEukakyJTKFTmzI6TaaMg2JG/MrYl
 z13PdxUAUty3v4ZOXMgoc0ff/g==
X-Google-Smtp-Source: ACHHUZ5BFb11PtQ/I26ACejaIx73ewZ0yAW4jCRQ68LHqsCiA8uZpZefR1IYaxoZ9MVi2UkwACp/fQ==
X-Received: by 2002:a05:600c:3651:b0:3f5:fa76:8dd0 with SMTP id
 y17-20020a05600c365100b003f5fa768dd0mr1311471wmq.0.1685433972473; 
 Tue, 30 May 2023 01:06:12 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:8261:5fff:fe11:bdda])
 by smtp.gmail.com with ESMTPSA id
 v4-20020a5d4a44000000b0030497b3224bsm2369704wrs.64.2023.05.30.01.06.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 30 May 2023 01:06:12 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
To: dri-devel@lists.freedesktop.org, Adam Ford <aford173@gmail.com>
In-Reply-To: <20230528132727.3933-1-aford173@gmail.com>
References: <20230528132727.3933-1-aford173@gmail.com>
Subject: Re: [PATCH V2] dt-bindings: bridge: samsung-dsim: Make some flags
 optional
Message-Id: <168543397153.1595635.3344136004150912350.b4-ty@linaro.org>
Date: Tue, 30 May 2023 10:06:11 +0200
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.12.2
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
Cc: devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>,
 Robert Foss <rfoss@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Jonas Karlman <jonas@kwiboo.se>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, aford@beaconembedded.com,
 Jernej Skrabec <jernej.skrabec@gmail.com>, linux-kernel@vger.kernel.org,
 Conor Dooley <conor.dooley@microchip.com>, Rob Herring <robh+dt@kernel.org>,
 Jagan Teki <jagan@amarulasolutions.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Marek Szyprowski <m.szyprowski@samsung.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On Sun, 28 May 2023 08:27:27 -0500, Adam Ford wrote:
> In the event a device is connected to the samsung-dsim
> controller that doesn't support the burst-clock, the
> driver is able to get the requested pixel clock from the
> attached device or bridge.  In these instances, the
> samsung,burst-clock-frequency isn't needed, so remove
> it from the required list.
> 
> [...]

Thanks, Applied to https://anongit.freedesktop.org/git/drm/drm-misc.git (drm-misc-next)

[1/1] dt-bindings: bridge: samsung-dsim: Make some flags optional
      https://cgit.freedesktop.org/drm/drm-misc/commit/?id=5769b45abedca0b9d14145e156c180af36139416

-- 
Neil

