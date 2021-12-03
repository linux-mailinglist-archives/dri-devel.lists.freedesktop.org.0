Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A2D50467A12
	for <lists+dri-devel@lfdr.de>; Fri,  3 Dec 2021 16:09:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AE8C36F3A3;
	Fri,  3 Dec 2021 15:09:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com
 [IPv6:2a00:1450:4864:20::432])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 737856F3A3
 for <dri-devel@lists.freedesktop.org>; Fri,  3 Dec 2021 15:09:45 +0000 (UTC)
Received: by mail-wr1-x432.google.com with SMTP id t9so6344441wrx.7
 for <dri-devel@lists.freedesktop.org>; Fri, 03 Dec 2021 07:09:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20210112.gappssmtp.com; s=20210112;
 h=subject:to:cc:references:from:organization:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=waV1npKtrBCQx1BdtxDZJlwzTMwSFFCWDGHrj9kXp+g=;
 b=ojLwcLS3q+5lu9Md+ylAfjdkQjmhI3t0vBLaOWzMZaSbzQsN801Uv+Rs8JlM+Fnefz
 dLi8R30/TTbF3vL2wSCNQo4o5NxscRaPCjak/3yolpMikXNDtF1qXzylYLQhWvTVG/ai
 0Gxrz7ppbDeJcHJR/sDTiOOF/fMa+a0NL50YK9+R7jmKC0M+m/nrMEpmnhlFc8f2YlDj
 MiytKJwnfe9xoEOUeRXrGW4DyE61Oz57CNZAPNrBvxhc1F5XRLBZdcT7SNpQlITSain7
 yxvtPecFBTnRsaP629RuTQGe9XxUB53qk0XBY/fWvc5zovkWFEjwD3xr39NIcn/rkhYX
 uN5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:organization
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=waV1npKtrBCQx1BdtxDZJlwzTMwSFFCWDGHrj9kXp+g=;
 b=V/TTr1vuOZSIMTarhSqhU5p5dqrn8zzLIkCedF+G+3McgtomTeaD5Jfl9kmKBElJa8
 QymIjooBX5920J/r6UVyJlYl6cvMpcYYAlgdq4m6qhYs9YweFmItd/oS5a/JWwyhVpl/
 4Imuc/rrEhxKfsftRBd9C0tf2hSWF0CfOZ7OZCvXiXYgO4PfhMqOY//jsqO/qTNB+VQ2
 QP0QRjgAaHYVPbKbf5no/+4mEuykPPrDHEsfb0ybzegvfJfbuaty9fcznBCd+yUOPBI1
 alm2GREkrjwz4RYWKUWsJpD+75Tt7EgstwCD4W8wBccDWNDvwxYqgSuJTBa0B8JNYqwN
 9QzQ==
X-Gm-Message-State: AOAM5303xwaNZSLTlUF0ea4gvAfjLwI7yyZCoWWM6glTRTf+jecJYuAt
 URcM3vimnj9vP6O5+QSl7X7zbQ==
X-Google-Smtp-Source: ABdhPJyqLILEVhNUxFLPLtBUGu4NPp9AokVet23hbEKTHhte6QSXOYL1Wbtj5MT8I5aKoY+hEy5Upw==
X-Received: by 2002:a5d:68c1:: with SMTP id p1mr21450510wrw.585.1638544183855; 
 Fri, 03 Dec 2021 07:09:43 -0800 (PST)
Received: from ?IPv6:2001:861:44c0:66c0:d539:1fa4:f06d:ec1?
 ([2001:861:44c0:66c0:d539:1fa4:f06d:ec1])
 by smtp.gmail.com with ESMTPSA id a10sm5469480wmq.27.2021.12.03.07.09.43
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 03 Dec 2021 07:09:43 -0800 (PST)
Subject: Re: [PATCH v7 0/9] drm/omap: Add virtual-planes support
To: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
References: <20211117141928.771082-1-narmstrong@baylibre.com>
 <bab2b84a-ebef-ec69-187f-745e739079eb@ideasonboard.com>
From: Neil Armstrong <narmstrong@baylibre.com>
Organization: Baylibre
Message-ID: <71f01ce0-bc1d-0ac0-9bf2-7f2c3738eeaa@baylibre.com>
Date: Fri, 3 Dec 2021 16:09:42 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <bab2b84a-ebef-ec69-187f-745e739079eb@ideasonboard.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
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
Cc: khilman@baylibre.com, linux-omap@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On 03/12/2021 12:31, Tomi Valkeinen wrote:
> On 17/11/2021 16:19, Neil Armstrong wrote:
>> This patchset is the follow-up the v4 patchset from Benoit Parrot at [1].
>>
>> This patch series adds virtual-plane support to omapdrm driver to allow the use
>> of display wider than 2048 pixels.
>>
>> In order to do so we introduce the concept of hw_overlay which can then be
>> dynamically allocated to a plane. When the requested output width exceed what
>> be supported by one overlay a second is then allocated if possible to handle
>> display wider then 2048.
>>
>> This series replaces an earlier series which was DT based and using statically
>> allocated resources.
>>
>> This implementation is inspired from the work done in msm/disp/mdp5
>> driver.
> 
> I think this looks good. I'll apply this to my work tree to see if I see any issues during my daily work, and if not, I'll push to drm-misc-next.
> 
> Have you tested this with other platforms than x15? I'm mostly thinking about omap3/4, as the DSS is somewhat different on those platforms.

I haven't tested the last version non non-x15, but I haven't changed the logic from the original patchset which was in the TI BSP
tree for multiple years.

Neil

> 
>  Tomi

