Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 626F0704636
	for <lists+dri-devel@lfdr.de>; Tue, 16 May 2023 09:21:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9EA6110E2FA;
	Tue, 16 May 2023 07:21:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com
 [IPv6:2a00:1450:4864:20::331])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5226110E2FB
 for <dri-devel@lists.freedesktop.org>; Tue, 16 May 2023 07:21:10 +0000 (UTC)
Received: by mail-wm1-x331.google.com with SMTP id
 5b1f17b1804b1-3f41d087b3bso106261685e9.0
 for <dri-devel@lists.freedesktop.org>; Tue, 16 May 2023 00:21:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1684221668; x=1686813668;
 h=content-transfer-encoding:in-reply-to:organization:references:cc:to
 :content-language:subject:reply-to:from:user-agent:mime-version:date
 :message-id:from:to:cc:subject:date:message-id:reply-to;
 bh=/9dx6R//z1RQpkhpsooU3dvEBQ61yF1rCpRuUAhlSyU=;
 b=OzfiKpEokqMpwSBb7CcRlXceL550ISmoDpO+8RmxURTiv5fNOzmkePwHC+uZh11WhS
 2BBL7SWGz83UnXDL2NQ7iED7vbuU/1S8hynshCBG6L9zOGpMdjs3cNr2sFH55WU2HtJi
 T7w5brtvR86e5HF2Qzu1PPgbCEklk8ymYSFenuC2WrFFy25qCnG/PxhVIMdUCNBfxE37
 X1ZNbwSyB5yvWo1vwsRJXQzZl/ER++IA3jyWuVAV9Dnl2qKy3a9NX0FUEjZUo87ZT46l
 v8Y+nlHqyY8M8EfwAQ19+n5xMJnuww/kHAneWwOYKBQ7DC4FpCeFrQjrNLe3WoMLBkqG
 Y+yQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1684221668; x=1686813668;
 h=content-transfer-encoding:in-reply-to:organization:references:cc:to
 :content-language:subject:reply-to:from:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=/9dx6R//z1RQpkhpsooU3dvEBQ61yF1rCpRuUAhlSyU=;
 b=b4VwjGsCwtu5Fi8ZUYL4Q1uw07fI7MI9/pCM32lUjHB+4E2LgdlI32DzR3X6OOoBZi
 eAJcq8fZkYEz1s2d3aZcR3q5qBjXsmOQJshV9BrwiRW9vM3QwYY/yWgSul4Hej+6K677
 Gt1BdIyMRpN4LU0+ZrqlwkmHzEQs005SNWIe/Vd4yx01apqYS+X+TuVONMjZuc+bwryp
 UNsN2XBsLd22W93m2i2bqrBJQUHAVELyIIMRZMpTgQz0Ub6ICTwKhvrtAQnVVUaCZItW
 ghQ1hpKTuqLTVwIjZSvlktO1EvCjryNj+oujSjVOtuwmXqEW6giD8vMBPgps/JNxTpsu
 gDYw==
X-Gm-Message-State: AC+VfDzytYW+8LxwHmn2RVxoWSMdORPh4kVJ4p3K6w8LQtdD6Y57aHYJ
 XerLwjBLuxexh6+VbEAbxq9PnwcFuOkELRMFHQ1+mw==
X-Google-Smtp-Source: ACHHUZ4Xc+eQioisYBeXVxVzJy8AIzGtt2Jh3W/8exKfh8FPHzNgTkPgHSxp1nFkXhvr/V+R1BvMcQ==
X-Received: by 2002:a05:600c:2144:b0:3f4:2438:e201 with SMTP id
 v4-20020a05600c214400b003f42438e201mr19423225wml.21.1684221667960; 
 Tue, 16 May 2023 00:21:07 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:982:cbb0:86be:97a:a043:77a8?
 ([2a01:e0a:982:cbb0:86be:97a:a043:77a8])
 by smtp.gmail.com with ESMTPSA id
 l24-20020a1ced18000000b003f4290720cbsm1259658wmh.29.2023.05.16.00.21.06
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 16 May 2023 00:21:07 -0700 (PDT)
Message-ID: <305382fd-2312-59d9-e2d3-25a17e0a2158@linaro.org>
Date: Tue, 16 May 2023 09:21:06 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.1
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH v6 3/8] drm/bridge: mhdp8546: Add minimal format
 negotiation
Content-Language: en-US
To: Aradhya Bhatia <a-bhatia1@ti.com>,
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
 Jyri Sarha <jyri.sarha@iki.fi>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>, Robert Foss <rfoss@kernel.org>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Rahul T R <r-ravikumar@ti.com>, Swapnil Jakhade <sjakhade@cadence.com>,
 Boris Brezillon <boris.brezillon@collabora.com>,
 Francesco Dolcini <francesco@dolcini.it>
References: <20230509093036.3303-1-a-bhatia1@ti.com>
 <20230509093036.3303-4-a-bhatia1@ti.com>
 <db9b4117-b030-49a7-3732-2fc39d089ee2@ideasonboard.com>
 <d2777edc-151d-7f06-30c4-4634fdb6a63d@ti.com>
Organization: Linaro Developer Services
In-Reply-To: <d2777edc-151d-7f06-30c4-4634fdb6a63d@ti.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
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
Reply-To: neil.armstrong@linaro.org
Cc: Nishanth Menon <nm@ti.com>, Jayesh Choudhary <j-choudhary@ti.com>,
 Vignesh Raghavendra <vigneshr@ti.com>, Devarsh Thakkar <devarsht@ti.com>,
 Linux Kernel List <linux-kernel@vger.kernel.org>,
 DRI Development List <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 15/05/2023 17:59, Aradhya Bhatia wrote:
> Hi Tomi,
> 
> On 12-May-23 14:45, Tomi Valkeinen wrote:
>> On 09/05/2023 12:30, Aradhya Bhatia wrote:
>>> From: Nikhil Devshatwar <nikhil.nd@ti.com>
>>>
>>> With new connector model, mhdp bridge will not create the connector and
>>> SoC driver will rely on format negotiation to setup the encoder format.
>>>
>>> Support minimal format negotiations hooks in the drm_bridge_funcs.
>>> Complete format negotiation can be added based on EDID data.
>>> This patch adds the minimal required support to avoid failure
>>> after moving to new connector model.
>>>
>>> Signed-off-by: Nikhil Devshatwar <nikhil.nd@ti.com>
>>> Reviewed-by: Tomi Valkeinen <tomi.valkeinen@ti.com>
>>
>> You need to add your SoB to this and the other patches.
> 
> Okay!
> 
>>
>>> ---
>>>
>>> Notes:
>>>
>>>       changes from v1:
>>>       * cosmetic fixes, commit message update.
>>>
>>>       changes from v5:
>>>       * dropped the default_bus_format variable and directly assigned
>>>         MEDIA_BUS_FMT_RGB121212_1X36 to input_fmts.
>>>
>>>    .../drm/bridge/cadence/cdns-mhdp8546-core.c   | 25 +++++++++++++++++++
>>>    1 file changed, 25 insertions(+)
>>>
>>> diff --git a/drivers/gpu/drm/bridge/cadence/cdns-mhdp8546-core.c
>>> b/drivers/gpu/drm/bridge/cadence/cdns-mhdp8546-core.c
>>> index f6822dfa3805..623e4235c94f 100644
>>> --- a/drivers/gpu/drm/bridge/cadence/cdns-mhdp8546-core.c
>>> +++ b/drivers/gpu/drm/bridge/cadence/cdns-mhdp8546-core.c
>>> @@ -2146,6 +2146,30 @@ cdns_mhdp_bridge_atomic_reset(struct drm_bridge
>>> *bridge)
>>>        return &cdns_mhdp_state->base;
>>>    }
>>>    +static u32 *cdns_mhdp_get_input_bus_fmts(struct drm_bridge *bridge,
>>> +                     struct drm_bridge_state *bridge_state,
>>> +                     struct drm_crtc_state *crtc_state,
>>> +                     struct drm_connector_state *conn_state,
>>> +                     u32 output_fmt,
>>> +                     unsigned int *num_input_fmts)
>>> +{
>>> +    u32 *input_fmts;
>>> +
>>> +    *num_input_fmts = 0;
>>> +
>>> +    if (output_fmt != MEDIA_BUS_FMT_FIXED)
>>> +        return NULL;
>>
>> The tfp410 and sii902x drivers don't have the above check. Why does mhdp
>> need it? Or the other way, why don't tfp410 and sii902x need it?
> 
> I had removed this condition in order to follow status quo, from the
> ITE-66121 HDMI bridge driver.
> 
> The idea would have been to drop this for MHDP as well, but I guess I
> overlooked this one.
> 
> However...
> 
>> I guess at the moment we always do get MEDIA_BUS_FMT_FIXED as the out
>> fmt (in all three bridge drivers), don't we?
> 
> ... I tested again to ensure that the above is indeed the case. And
> ended up catching some odd behavior.
> 
> It turns out that for all the HDMI bridges (TFP410, SII902X, ITE-66121),
> the format negotiation doesn't stop at output_fmt = MEDIA_BUS_FMT_FIXED.
> The {bridge}_get_input_format API gets called again with the output_fmt
> = MEDIA_BUS_FMT_RGB24_1X24.
> 
> This doesn't happen with the MHDP driver. Format negotiation with MHDP
> bridge stops after one round, at output_fmt = MEDIA_BUS_FMT_FIXED.

This is because the bridge negociation logic will test with all possible
output formats from the chain, and won't stop at first working test.

If your bridge only supports a single input format, it should return the
same format whatever output_fmt is tried.

So indeed remove this test on mhdp aswell, or filter out invalid output
formats.

The MEDIA_BUS_FMT_FIXED is when there's no output format to test, so this
should be always supported.

Neil

> 
> 
> Regards
> Aradhya

