Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CC40C78CB31
	for <lists+dri-devel@lfdr.de>; Tue, 29 Aug 2023 19:26:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 15CD210E472;
	Tue, 29 Aug 2023 17:26:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x22c.google.com (mail-lj1-x22c.google.com
 [IPv6:2a00:1450:4864:20::22c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AE50A10E472
 for <dri-devel@lists.freedesktop.org>; Tue, 29 Aug 2023 17:26:01 +0000 (UTC)
Received: by mail-lj1-x22c.google.com with SMTP id
 38308e7fff4ca-2bceb02fd2bso69545791fa.1
 for <dri-devel@lists.freedesktop.org>; Tue, 29 Aug 2023 10:26:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1693329960; x=1693934760;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=XASF6L+CFT37xAgTRLzvSw5XT/pAT+qRxQqIx8eoTe4=;
 b=kHbU+j63kRJgi19vriktot12nqwsQEFKOH92u6vdDrVpsZweOAUzFYD2jMRVZONtHB
 8oqMSawB5f/rUfbFdyoZZSeSbQNp2Qy7tR6DgybERzmJT83rICzzkoGQk2XZqyk7ctcd
 Qo0qLiW6c+Mhy6O1SSArqwSPnfoadLxFuMEsFg3G5OIFeYHbeEBWIrmo47N/zTLK6vK2
 S/2YVtg1nm66M3w6dqaNW1lkwhijfgcUAld2IqWjubjKAGtF3wRtAGth+yw0t4R+knpp
 9Yrrzco7+yLakp+f28SG+mWHIxXeTmtvIx6njQcK2459fq8ot/epCFFuSlkLUrDBPC65
 rAzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1693329960; x=1693934760;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=XASF6L+CFT37xAgTRLzvSw5XT/pAT+qRxQqIx8eoTe4=;
 b=g1tyXjG7bmvh5lmCY8yAJapamSF/NB8PbaGkuf2mxI+X6wvA4uoM7iEfa45VDbiUhN
 A/v+7wqs5tA6OT1dPjuKGl9OgX2IMXLwxFL5RfG9dM5sPLoqgIHqFif69cr6j5zvjcyM
 Z9GnWK3Tuxwgoq++bBQ/Lsk6pUXurKyNYNCUDB+PNzb53LIQJP+m4nZj6blKtRIXPwnC
 I6XPHTXcA/uR+IRaypbW0ZMGM46OHKVZ92EQV0AvWBhmFQH+MPyzhHvEC4n8Cc+ckO6N
 7Wb7TbNV6JW/Vjb4Kvws74DjJbj4hG8qa+HpkzygWaY+dbBndNy8LpIhiYYl35Gm3qgr
 DOkw==
X-Gm-Message-State: AOJu0YxIqylr2df5sJzxM7DRPCbwdn6go33TD40B3TNhYdcQeVP2YPFt
 VfJHzwhunloUj14Ln4sKsHcSEQ==
X-Google-Smtp-Source: AGHT+IGHdaXGoRpgBFSCCGbMrc9WN2vaolT0HlJjcJrqIeZe/CQVLwYV84VHWJ3Nah14pPFkboyfcA==
X-Received: by 2002:a2e:9649:0:b0:2bc:c28c:a2b8 with SMTP id
 z9-20020a2e9649000000b002bcc28ca2b8mr17205992ljh.27.1693329959883; 
 Tue, 29 Aug 2023 10:25:59 -0700 (PDT)
Received: from [192.168.0.22] ([77.252.47.196])
 by smtp.gmail.com with ESMTPSA id
 vw13-20020a170907058d00b00993664a9987sm6181867ejb.103.2023.08.29.10.25.58
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 29 Aug 2023 10:25:59 -0700 (PDT)
Message-ID: <4343e032-aafe-ed57-9374-c21961926184@linaro.org>
Date: Tue, 29 Aug 2023 19:25:57 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.14.0
Subject: Re: [PATCH 17/31] ARM: dts: rockchip: Add CPU resets for RK312x
Content-Language: en-US
To: Alex Bee <knaerzche@gmail.com>, Heiko Stuebner <heiko@sntech.de>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Lee Jones <lee@kernel.org>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Vinod Koul <vkoul@kernel.org>,
 Kishon Vijay Abraham I <kishon@kernel.org>
References: <20230829171647.187787-1-knaerzche@gmail.com>
 <20230829171647.187787-18-knaerzche@gmail.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230829171647.187787-18-knaerzche@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
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
 Elaine Zhang <zhangqing@rock-chips.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-rockchip@lists.infradead.org,
 linux-phy@lists.infradead.org, Johan Jonker <jbx6244@gmail.com>,
 linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 29/08/2023 19:16, Alex Bee wrote:
> Add the reset controls for all 4 cpu cores.

This we see from the diff. Commit should say why.


Best regards,
Krzysztof

