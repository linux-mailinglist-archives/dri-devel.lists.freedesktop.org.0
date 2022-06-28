Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7330155BEFA
	for <lists+dri-devel@lfdr.de>; Tue, 28 Jun 2022 09:10:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 71D0A11B5EC;
	Tue, 28 Jun 2022 07:10:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com
 [IPv6:2a00:1450:4864:20::32f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D859C11B5EA
 for <dri-devel@lists.freedesktop.org>; Tue, 28 Jun 2022 07:10:52 +0000 (UTC)
Received: by mail-wm1-x32f.google.com with SMTP id
 c130-20020a1c3588000000b0039c6fd897b4so8813598wma.4
 for <dri-devel@lists.freedesktop.org>; Tue, 28 Jun 2022 00:10:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20210112.gappssmtp.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=KsqAJ7YKidd8LZmByQaDFJBwdldhoJVuguG1CDc3e00=;
 b=EHq+1qalm5NaxwYgPHuR1r+ouWxYKWJ0zegZ1W8TttlkinLcCyWZnlRnc96nOsoGl+
 ED60WnNpEFCnwc9soZ+RfiwEY3fImezkfDdwtQlRqmlfvYnFqdeHEjCofuXdpZjJHWy5
 3g3xtgbbBDKTDOQKxrBcebcvyOaXjmyaQta2+bdOij8QMceMw5ug3bElYN0FhW3CSjbL
 GJ5+9i/GKn05YWHmGw1zFYWYHRfBO90vBvsvSJYdUkkkACLEEYrDc+r30/iUq729MgM9
 6HbGUF1IOtCzhUI7MWL89xJQctzzp6dLf+/iz5hS5jw/el0GjskEkL4DlJFR95IVNND3
 xmsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=KsqAJ7YKidd8LZmByQaDFJBwdldhoJVuguG1CDc3e00=;
 b=NXBhqrBW6P+mD1Xh7fR4JXOKnnZHCLahNOlJ/RsrX+2SdbYUvPLDsoHBYfT4QnXYdG
 ChUuMUV8Vq3KYi2CcLoJDEGvUeFo4NFKg/iV+XMjEQIRoy2AkOrmnECdS+yXN9AiwmEa
 qHf+3JZJnxRLSvXoWQ1NxsfQfS4LBUdslIVwg2RpGdGY3cBfoBTEyG6U2egGX+5n40V7
 Ds/ZdeXkcYt+wiXSvJsOZVYgDJ7L+3Xw26D2y/axyAu5FkO1kLmPajW08EK2RqPye2Ra
 T5CUX8cuHkSmUBgmbZOzuJ1J8djrTmbqLPU124c5g6w4YWzj7Avz5kVTySELlYm+jZb7
 /GhQ==
X-Gm-Message-State: AJIora9UQ3osUhhRTE2D2LhbpATzmqVNP0fnWpxhCVafqIOZIp8YNIUD
 rRxe/hfPBqKNPi2/6wnENbjQGw==
X-Google-Smtp-Source: AGRyM1vBLz/0auY4iqzjFWAMDY4oMb4jz5SNnbvbjqkhB6UI/LyQ2F66AcKR6WTXT6Lv1/2IJMHZ7g==
X-Received: by 2002:a1c:7414:0:b0:3a0:201c:5b7f with SMTP id
 p20-20020a1c7414000000b003a0201c5b7fmr24576381wmc.170.1656400251201; 
 Tue, 28 Jun 2022 00:10:51 -0700 (PDT)
Received: from ?IPV6:2001:861:44c0:66c0:52cb:c433:b96:9ad?
 ([2001:861:44c0:66c0:52cb:c433:b96:9ad])
 by smtp.gmail.com with ESMTPSA id
 bn14-20020a056000060e00b0021d20a43523sm667124wrb.42.2022.06.28.00.10.49
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 28 Jun 2022 00:10:50 -0700 (PDT)
Message-ID: <123b8767-7ea4-e6fe-6d47-0f2444a88dd9@baylibre.com>
Date: Tue, 28 Jun 2022 09:10:48 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Subject: Re: [PATCH v2] drm/bridge: imx: i.MX8 bridge drivers should depend on
 ARCH_MXC
Content-Language: en-US
To: Liu Ying <victor.liu@nxp.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Andrzej Hajda <andrzej.hajda@intel.com>, Robert Foss
 <robert.foss@linaro.org>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>, Shawn Guo <shawnguo@kernel.org>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, NXP Linux Team <linux-imx@nxp.com>,
 Sakari Ailus <sakari.ailus@linux.intel.com>, Marek Vasut <marex@denx.de>
References: <42c542b53a1c8027b23a045045fbb7b34479913d.1656072500.git.geert+renesas@glider.be>
 <b625ba83-fee9-b668-09db-976cb3bef3ca@baylibre.com>
 <9f5b511708ca9b30ef101a46a5d1b76f03b2c4fc.camel@nxp.com>
From: Neil Armstrong <narmstrong@baylibre.com>
Organization: Baylibre
In-Reply-To: <9f5b511708ca9b30ef101a46a5d1b76f03b2c4fc.camel@nxp.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
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
Cc: linux-arm-kernel@lists.infradead.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 28/06/2022 04:31, Liu Ying wrote:
> On Mon, 2022-06-27 at 14:22 +0200, Neil Armstrong wrote:
>> Hi,
> 
> Hi,
> 
>>
>> On 24/06/2022 14:10, Geert Uytterhoeven wrote:
>>> The various Freescale i.MX8 display bridges are only present on
>>> Freescale i.MX8 SoCs.  Hence add a dependency on ARCH_MXC, to
>>> prevent
>>> asking the user about these drivers when configuring a kernel
>>> without
>>> i.MX SoC support.
>>>
>>> Fixes: e60c4354840b2fe8 ("drm/bridge: imx: Add LDB support for
>>> i.MX8qm")
>>> Fixes: 3818715f62b42b5c ("drm/bridge: imx: Add LDB support for
>>> i.MX8qxp")
>>> Fixes: 96988a526c97cfbe ("drm/bridge: imx: Add i.MX8qxp pixel link
>>> to DPI support")
>>> Fixes: 1ec17c26bc06289d ("drm/bridge: imx: Add i.MX8qm/qxp display
>>> pixel link support")
>>> Fixes: 93e163a9e0392aca ("drm/bridge: imx: Add i.MX8qm/qxp pixel
>>> combiner support")
>>> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
>>> Reviewed-by: Liu Ying <victor.liu@nxp.com>
>>> ---
>>> v2:
>>>     - s/i.MX8MP/i.MX8/,
>>>     - Add Reviewed-by.
>>> ---
>>>    drivers/gpu/drm/bridge/imx/Kconfig | 4 ++++
>>>    1 file changed, 4 insertions(+)
>>>
>>> diff --git a/drivers/gpu/drm/bridge/imx/Kconfig
>>> b/drivers/gpu/drm/bridge/imx/Kconfig
>>> index 212a7b0e64fd8b5a..608f47f41bcd1c81 100644
>>> --- a/drivers/gpu/drm/bridge/imx/Kconfig
>>> +++ b/drivers/gpu/drm/bridge/imx/Kconfig
>>> @@ -1,3 +1,5 @@
>>> +if ARCH_MXC || COMPILE_TEST
>>> +
>>>    config DRM_IMX8QM_LDB
>>>    	tristate "Freescale i.MX8QM LVDS display bridge"
>>>    	depends on OF
>>> @@ -41,3 +43,5 @@ config DRM_IMX8QXP_PIXEL_LINK_TO_DPI
>>>    	help
>>>    	  Choose this to enable pixel link to display pixel
>>> interface(PXL2DPI)
>>>    	  found in Freescale i.MX8qxp processor.
>>> +
>>> +endif # ARCH_MXC || COMPILE_TEST
>>
>> I was wondering why those were added in drivers/gpu/drm/bridge/imx
>> since they are specific to NXP SoCs,
>> I think they should be moved in the right drm imx subsystem instead
>> of this change.
> 
> There are 2 directories which contain display controller drivers for
> i.MX SoCs:
> a. drivers/gpu/drm/imx - i.MX51/53/6qdl IPUv3, i.MX8mq DCSS and
>     i.MX8qm/qxp DPU([1], not landed yet)
> b. drivers/gpu/drm/mxsfb - i.MX23/28/6sx/8mq LCDIF and i.MX8mp
>     LCDIFv3([2], not landed yet)
> 
> Bridges added in drivers/gpu/drm/bridge/imx make it possible to share
> bridge drivers across display controllers.  I see chance to use the
> LVDS Display Bridge(LDB) helper(imx-ldb-helper.c) for i.MX6sx LDB.

Thanks for the explanation, LGTM
Reviewed-by: Neil Armstrong <narmstrong@baylibre.com>

> 
> [1]
> https://patchwork.kernel.org/project/dri-devel/patch/20220407091156.1211923-6-victor.liu@nxp.com/
> [2]
> https://patchwork.kernel.org/project/dri-devel/patch/20220624180201.150417-2-marex@denx.de/
> 
> Regards,
> Liu Ying
> 

