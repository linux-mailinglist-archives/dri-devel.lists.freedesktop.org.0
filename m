Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E4DA4674F6F
	for <lists+dri-devel@lfdr.de>; Fri, 20 Jan 2023 09:26:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CDD0210E066;
	Fri, 20 Jan 2023 08:26:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com
 [IPv6:2a00:1450:4864:20::429])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C952110E066
 for <dri-devel@lists.freedesktop.org>; Fri, 20 Jan 2023 08:26:47 +0000 (UTC)
Received: by mail-wr1-x429.google.com with SMTP id r9so4140155wrw.4
 for <dri-devel@lists.freedesktop.org>; Fri, 20 Jan 2023 00:26:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=dQD3SeU5cieHqSaSQOFOuvwfEvzyXZdGHoT+3iMV3+Q=;
 b=sVyo1WQwvoZ440cfSfd/pBn6sA68vMHM8R19MkVLWsSsjdsZTDLI/NPzuoCWheFB43
 U7XktPstpagWZ2qz+/mHgKjzQQgu3K9H8IY2GeXgWQYXzCePDwAWGP8CDHTPDv1XAbUK
 dLcildkMljvAn1QFV/+0m7H3A/iSELWMk8RmyCxo4MfsLd0NJX4Bq5SCA2I+UggX4tp6
 W6pC9BpEKDUFQ3uN21L7ZEHZbdVwujf+RUFsv+roVc6i/LE8/3KauFC7lJjED2eJXAaD
 OkTontz5KnEQacEvrHalrX1nNKaPgQUBXoYOJu+4WJhlFa3MztSxvXw8DUEY7rb12NJP
 jhYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=dQD3SeU5cieHqSaSQOFOuvwfEvzyXZdGHoT+3iMV3+Q=;
 b=FXL+uSOQHunyHHcl3vcOy8dMkI557hX+ftEqC09vjDrYUQhVnSNW9Qmg14LCoBwduD
 sURq1AZEt2iG9Mjg0KDJ2lFAOfA0qieHkRsE336AwYR1NdkOX1GGqmSxrHnvht6dBd0x
 BAz1YcOrZMMYik30T8HLojIGa/XTvquJItEx7UQd3OhUCE52TCsh1PRwAJQRytKRG7UA
 OroKWEgwD6Y7xnYKFOd1uY9FAp7/d02zpTLtG2hzFncQ2ZpHD6fu/3sddGT0thgC+lHa
 xOYGGhyodVROh9QAjoGEuMt18QzTM1WxT1iclCgFqDu1t1lcXNIKtzHdXn2bhtuF2/ck
 zOLQ==
X-Gm-Message-State: AFqh2kqd8s2hMpNvxy2Suzef6RKPn2ITQqms7LRY64VlObsr9NHg+MJl
 pCZEgEXB1sg1T9sJCNNO3up+JA==
X-Google-Smtp-Source: AMrXdXumlxfJ8KEAKW4uHiXN9MBz2WNa1cx1COulyE/9/p90MuXxNfk3ZAmuW8Tb8rR6CiXOYcG//A==
X-Received: by 2002:a5d:6447:0:b0:2be:34f9:5284 with SMTP id
 d7-20020a5d6447000000b002be34f95284mr6818039wrw.48.1674203206302; 
 Fri, 20 Jan 2023 00:26:46 -0800 (PST)
Received: from [192.168.1.109] ([178.197.216.144])
 by smtp.gmail.com with ESMTPSA id
 w10-20020a5d404a000000b00275970a85f4sm35371733wrp.74.2023.01.20.00.26.44
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 20 Jan 2023 00:26:45 -0800 (PST)
Message-ID: <94655b6a-4e2b-9ec5-8c86-17cb8690f44f@linaro.org>
Date: Fri, 20 Jan 2023 09:26:43 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.0
Subject: Re: [PATCH 3/3] dt-bindings: display: rockchip-lvds: add compatible
 string for RK3568
Content-Language: en-US
To: Alibek Omarov <a1ba.omarov@gmail.com>
References: <20230119184807.171132-1-a1ba.omarov@gmail.com>
 <20230119184807.171132-4-a1ba.omarov@gmail.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230119184807.171132-4-a1ba.omarov@gmail.com>
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
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Frank Wunderlich <frank-w@public-files.de>, linux-kernel@vger.kernel.org,
 Sascha Hauer <s.hauer@pengutronix.de>, macromorgan@hotmail.com,
 Sandy Huang <hjc@rock-chips.com>, alexander.sverdlin@siemens.com,
 Alex Bee <knaerzche@gmail.com>,
 Nicolas Frattaroli <frattaroli.nicolas@gmail.com>,
 linux-rockchip@lists.infradead.org, Rob Herring <robh+dt@kernel.org>,
 Michael Riesch <michael.riesch@wolfvision.net>,
 Peter Geis <pgwipeout@gmail.com>, linux-arm-kernel@lists.infradead.org,
 Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 19/01/2023 19:48, Alibek Omarov wrote:
> RK3568 SoCs have a single LVDS output, that use PHY shared by two display
> pipelines: LVDS and MIPI DSI.
> 
> Signed-off-by: Alibek Omarov <a1ba.omarov@gmail.com>


Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

