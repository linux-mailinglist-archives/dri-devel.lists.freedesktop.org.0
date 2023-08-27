Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BEEFE789DE8
	for <lists+dri-devel@lfdr.de>; Sun, 27 Aug 2023 14:45:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C7B9310E051;
	Sun, 27 Aug 2023 12:45:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x62d.google.com (mail-ej1-x62d.google.com
 [IPv6:2a00:1450:4864:20::62d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7F90010E051
 for <dri-devel@lists.freedesktop.org>; Sun, 27 Aug 2023 12:45:34 +0000 (UTC)
Received: by mail-ej1-x62d.google.com with SMTP id
 a640c23a62f3a-99bfcf4c814so294904566b.0
 for <dri-devel@lists.freedesktop.org>; Sun, 27 Aug 2023 05:45:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1693140333; x=1693745133;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=J4nrGHQXWGJOJy96+djCX01NUNDs5EjnDz65MkIXeAk=;
 b=irPSjeDok07WKVwrCNH3KFcyAfhvLcbGW0nLPAwWCYwXZX3OpYtbARmfewUya61lYL
 nUI6X0482t/MWn+UODgdExMEl80k/exS12DSJJKDY05DxdorjdR2/36d42plLF0Wh1JW
 qFW8HhJL/GlNTR3pEcHxVhiMU3+2CPjZvbmx0TAH7hnQ48y02nQCDk5+Fd8pfkbDcFGm
 733pQvZIrLz3+Nta6yQvi3UfStp3YABCgdKs6IChTDocRUou5XeIbs5yWHjOcuaY3d2M
 /VrN6yABB9yuqi9l7WQzvPtSbCuCJfun+d7Bzx4DnNHv9s5lvnvFvo11swfnkmspVNqn
 pBsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1693140333; x=1693745133;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=J4nrGHQXWGJOJy96+djCX01NUNDs5EjnDz65MkIXeAk=;
 b=idJQbq+9Fe1qIhH7FzKTOrToPgyC5n5Nd2CGyQNsMUKyis3xgA1cT4ox8t7rldd+R1
 o0HKDBCN6w1nNMtgohvAhz6pa9aYVvHycsNZw3/mZU9HMW1+MfL4PCtNvdC+dZxB2LOY
 2m/7PnkOLPbXn8r7k2yJMNoHIE5We0Q5wxZQiG8e3QaiZbJijka+y6Dt1XE6DlSgD9Hq
 JpyulEM/FMSTYNHqO/9b25fYgApZD9ZUhc6sGONWV61psMyzwydb04oJIr+K1uPxOEmz
 740o0q+Ub34+0TlnzvJx/F26Ghv4vJg0IsyIaYsc7pz22jRxv/T6bp6jOW0aPoLf4ACM
 PXig==
X-Gm-Message-State: AOJu0YyK4zsIPAjQuGLnhBfreujKTP6KWadWlyOgWy0L4ksvT6PUiIN7
 CHnVitukdvxORr5zU7k1rdnRbQ==
X-Google-Smtp-Source: AGHT+IEWKDRa6IsELYTXk9QKcuouqJY4xo8YWM4wjKKvFH6kB2tEu09aYM06gnXU22x0Y0pkU3cddQ==
X-Received: by 2002:a17:907:2c4b:b0:9a2:16e2:353 with SMTP id
 hf11-20020a1709072c4b00b009a216e20353mr6902277ejc.6.1693140332935; 
 Sun, 27 Aug 2023 05:45:32 -0700 (PDT)
Received: from [192.168.0.22] ([77.252.47.225])
 by smtp.gmail.com with ESMTPSA id
 mh2-20020a170906eb8200b0099b76c3041csm3365057ejb.7.2023.08.27.05.45.31
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 27 Aug 2023 05:45:32 -0700 (PDT)
Message-ID: <4411dbf4-a7f5-7608-6b93-3eef2f4fcb90@linaro.org>
Date: Sun, 27 Aug 2023 14:45:30 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.14.0
Subject: Re: [PATCH 1/2] dt-bindings: display/lvds-codec: add ti,sn65lvds94
Content-Language: en-US
To: Conor Dooley <conor@kernel.org>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
References: <20230826215429.1905599-1-dmitry.baryshkov@linaro.org>
 <20230827-drum-food-09e417962032@spud>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230827-drum-food-09e417962032@spud>
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
Cc: dri-devel@lists.freedesktop.org, Conor Dooley <conor+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Jonas Karlman <jonas@kwiboo.se>, Robert Foss <robert.foss@linaro.org>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Neil Armstrong <narmstrong@baylibre.com>,
 Jernej Skrabec <jernej.skrabec@gmail.com>, Rob Herring <robh+dt@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>, Shawn Guo <shawnguo@kernel.org>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 linux-arm-kernel@lists.infradead.org, NXP Linux Team <linux-imx@nxp.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 27/08/2023 14:19, Conor Dooley wrote:
> On Sun, Aug 27, 2023 at 12:54:28AM +0300, Dmitry Baryshkov wrote:
>> Add compatible strings for TI sn65lvds94, LVDS serdes receiver.
>>
>> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> 
> Acked-by: Conor Dooley <conor.dooley@microchip.com>

For the record, patch looks good, but was not tested by automation.
Missing Cc-list.

Best regards,
Krzysztof

