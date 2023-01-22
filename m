Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 24DC6676BE0
	for <lists+dri-devel@lfdr.de>; Sun, 22 Jan 2023 10:36:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2BA4410E2B8;
	Sun, 22 Jan 2023 09:36:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com
 [IPv6:2a00:1450:4864:20::32d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1BAD810E2B8
 for <dri-devel@lists.freedesktop.org>; Sun, 22 Jan 2023 09:36:06 +0000 (UTC)
Received: by mail-wm1-x32d.google.com with SMTP id
 l41-20020a05600c1d2900b003daf986faaeso6536693wms.3
 for <dri-devel@lists.freedesktop.org>; Sun, 22 Jan 2023 01:36:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=iQGkmyos0lptZSiQJgSxMj19ir8RXd2BXhS7aLPksK4=;
 b=a/O7eeWbwW3MkGdxwzCLdf/ODdAB4Xjsl6zkEaR8Md/OVOVl3Z6tMA+Z/vDfOszKnR
 liyNDASxY49rjxITomrTybtNdvwrQd/sqPKLg9omwczQNH8gu44NWw9HPmvIzMbss1sZ
 4JztWJa9cw1un2qO5kTHXjiJXD/i6LlodZw7cYkTA9A0GYpLsJwC59N9rkEYag3r1BBt
 gbbPZkE0wcMc51w3bxvAmhsKjTV41PFwM1v0sBQ4x9peeU+Yiq8PjmPMNboYF3ItfzuM
 P7On+fnIlcrz4GlYwDClVADzBQqU8oV+kW9TvTPr+vNrYSAgUsvVBUc2uTUl4FTvTJqP
 QMYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=iQGkmyos0lptZSiQJgSxMj19ir8RXd2BXhS7aLPksK4=;
 b=EqlaDMUxtT7hJ8v5okZZt7klrKSQER/iR37biGsjPaJCNGOkXvM7mRpvUwty/wrHw9
 hyEeS6W8QBo86Wy/yORc44Qjn3lRU3Z8An7R7uCK5Csrz8YXoGS/eeBRdrj0JnmGBl3T
 IRDVmZhOFy4Yf1ULSgjo9shQqIhIc0VM+ENQ67GR7a1anA//kNBOnFDD67hQfC8xAuxg
 Uio5vJyXYAMky5OAdTkE5+/RcCqCiEQIZ1SihpWHRurh/pESKktpgI0LIA0kpVogcD+l
 YUZstHI1X9ul9a0yVFSEnHv5pcUzKSB7KY0Zggorl19EJ759RxVb/eVy9eCRsf7ld+jF
 dbTw==
X-Gm-Message-State: AFqh2krtWZRSVTJb7nQQe1TkNPbYMoirKaS62DwnRpR5sQfJZQrhM3T1
 JjV6f+B7Ru6ddJqHcNFCD4K+NA==
X-Google-Smtp-Source: AMrXdXuG1CIYLchLewcqX4Ck0w7BpAgN9xbWaxxrPI3SGtr0y6z83pzW/xubfDxRgesXyEZhxHW7ag==
X-Received: by 2002:a05:600c:3583:b0:3d9:719a:8f7d with SMTP id
 p3-20020a05600c358300b003d9719a8f7dmr19574436wmq.35.1674380165479; 
 Sun, 22 Jan 2023 01:36:05 -0800 (PST)
Received: from [192.168.1.109] ([178.197.216.144])
 by smtp.gmail.com with ESMTPSA id
 i22-20020a05600c355600b003a84375d0d1sm7951206wmq.44.2023.01.22.01.36.03
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 22 Jan 2023 01:36:04 -0800 (PST)
Message-ID: <b32d2c8f-cace-d762-38e6-6a1a17d919cc@linaro.org>
Date: Sun, 22 Jan 2023 10:36:02 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.0
Subject: Re: [PATCH 1/2] dt-bindings: display: bridge: ldb: Add i.MX93 LDB
 device tree binding
To: Liu Ying <victor.liu@nxp.com>, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20230122081429.694574-1-victor.liu@nxp.com>
 <20230122081429.694574-2-victor.liu@nxp.com>
Content-Language: en-US
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230122081429.694574-2-victor.liu@nxp.com>
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
Cc: marex@denx.de, neil.armstrong@linaro.org, krzysztof.kozlowski+dt@linaro.org,
 jonas@kwiboo.se, linux-imx@nxp.com, jernej.skrabec@gmail.com,
 robh+dt@kernel.org, robert.foss@linaro.org, andrzej.hajda@intel.com,
 Laurent.pinchart@ideasonboard.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 22/01/2023 09:14, Liu Ying wrote:
> Same to i.MX8mp LDB, i.MX93 LDB is controlled by mediamix blk-ctrl
> through 'ldb' register and 'lvds' register.  Also, the 'ldb' clock

Subject: drop second/last, redundant "device tree binding". The
"dt-bindings" prefix is already stating that these are bindings.

> is required.  i.MX93 LDB supports only one LVDS channel(channel 0,
> a.k.a, LVDS Channel-A in the device tree binding documentation), while
> i.MX8mp LDB supports at most two.  Add i.MX93 LDB device tree binding
> in the existing i.MX8mp LDB device tree binding documentation.
> 
> Signed-off-by: Liu Ying <victor.liu@nxp.com>
> ---

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

