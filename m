Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A4656EBD7C
	for <lists+dri-devel@lfdr.de>; Sun, 23 Apr 2023 08:48:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9F03810E0CC;
	Sun, 23 Apr 2023 06:47:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x52d.google.com (mail-ed1-x52d.google.com
 [IPv6:2a00:1450:4864:20::52d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5228B10E098
 for <dri-devel@lists.freedesktop.org>; Sat, 22 Apr 2023 14:32:48 +0000 (UTC)
Received: by mail-ed1-x52d.google.com with SMTP id
 4fb4d7f45d1cf-504eb1155d3so20185467a12.1
 for <dri-devel@lists.freedesktop.org>; Sat, 22 Apr 2023 07:32:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1682173962; x=1684765962;
 h=content-transfer-encoding:in-reply-to:content-language:references
 :cc:to:subject:from:user-agent:mime-version:date:message-id:from:to
 :cc:subject:date:message-id:reply-to;
 bh=99YDX/7qK2W322RAkYIogsdvoiSZC6dcO4nnOgE0Yyo=;
 b=ZB2yO7V+VviFFwaU4aBE/vpz5FwYoSa+h0HUBE0qU/AShZGYTQpE+4lZmOgds1alHW
 afhiqm6haQpQInYGWCAYvlM5H9b7/KSHLfJiUct5BZlzyT4WxO4aLg/VSXIwur5t9E7u
 klogQQINI1oU57+YgfubJiMoZun+SKchav/ORXFAKX0esBEXS3azxI95JpsSA+wvPte0
 uYbSNuOV4tqcavR1UXD/2RVyj+nd4/5YqRsG//nEvKGEFLpmoNgry7XrCDgfDbxE/wox
 YmXepcrKiVDI2Vp4TJGDclcFZhqKt3Es1+HbXNFgfqP1WXz6KrO0o1iuQjGaNESUhcRP
 L/mw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682173962; x=1684765962;
 h=content-transfer-encoding:in-reply-to:content-language:references
 :cc:to:subject:from:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=99YDX/7qK2W322RAkYIogsdvoiSZC6dcO4nnOgE0Yyo=;
 b=jk62jndWghEsH5ewIXNre9zxC55M11aI+7a75f6hFy4IpQ+VN+Tqb/ST4IPcv4axD0
 6NNv+sh3355g/I8hZwi71LFd5tRX2DV9sjWAIcg6z/K9jf1w+v4njoKcoItzHWwwJXCq
 tO8cFWc2brCnNivRjhJbh2Y7gVI5vPolk1qqUjR0+aHhAgNPqkzNJxnaMVP9xb/rfdc1
 n4rMR/w6sB+j4Moc5kJiy2FroJP9dlfJpHdInMDe2IdTM7DiHfkiQP2pAptZ/MaKqqV/
 X4EzWfh9Ahw8RiTmTTVh4+n9NHTMBcAoveto7fc+iO0w1UWaM/Lol0+d+Mb0SiFpbWnL
 Rvvg==
X-Gm-Message-State: AAQBX9eanQzJIevAEiTG3XDmCuvmyo/akfAxd6qB3VJItGHK3rQ/Ikzy
 BGFGLckXLhGjgp3SmfnuiDM=
X-Google-Smtp-Source: AKy350ag+YkaszQoLJF85uoBsRlfKgZMpqx2xUlrkmBej+tzYfEcbXlftSXKRerq6HGjS1CWb+PkyQ==
X-Received: by 2002:a17:906:cc52:b0:953:4bec:f350 with SMTP id
 mm18-20020a170906cc5200b009534becf350mr5336322ejb.23.1682173962546; 
 Sat, 22 Apr 2023 07:32:42 -0700 (PDT)
Received: from [192.168.50.244] (83.11.224.11.ipv4.supernova.orange.pl.
 [83.11.224.11]) by smtp.gmail.com with ESMTPSA id
 z4-20020a170906434400b0094f2dca017fsm3300437ejm.50.2023.04.22.07.32.41
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 22 Apr 2023 07:32:41 -0700 (PDT)
Message-ID: <6803ab6e-d7ed-cce1-013f-221878b4be2c@gmail.com>
Date: Sat, 22 Apr 2023 16:32:39 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
From: Artur Weber <aweber.kernel@gmail.com>
Subject: Re: [PATCH v3 2/3] drm/panel: Add Samsung S6D7AA0 panel controller
 driver
To: Linus Walleij <linus.walleij@linaro.org>
References: <20230416131632.31673-1-aweber.kernel@gmail.com>
 <20230416131632.31673-3-aweber.kernel@gmail.com>
 <CACRpkdaTmHASz25uzDoeZBG2=e7XRLK67DENfAtCbaFp+AYnYA@mail.gmail.com>
Content-Language: en-US
In-Reply-To: <CACRpkdaTmHASz25uzDoeZBG2=e7XRLK67DENfAtCbaFp+AYnYA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Mailman-Approved-At: Sun, 23 Apr 2023 06:47:48 +0000
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
Cc: devicetree@vger.kernel.org, sam@ravnborg.org, linux-kernel@vger.kernel.org,
 robh+dt@kernel.org, thierry.reding@gmail.com, dri-devel@lists.freedesktop.org,
 krzysztof.kozlowski+dt@linaro.org, ~postmarketos/upstreaming@lists.sr.ht
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

thank you for the review.

On 20/04/2023 09:35, Linus Walleij wrote:
>> +static int s6d7aa0_on(struct s6d7aa0 *ctx)
>> +{
>> +       struct mipi_dsi_device *dsi = ctx->dsi;
>> +       struct device *dev = &dsi->dev;
>> +       int ret;
>> +
>> +       dsi->mode_flags |= MIPI_DSI_MODE_LPM;
> 
> (...)
> 
>> +static int s6d7aa0_off(struct s6d7aa0 *ctx)
>> +{
>> +       struct mipi_dsi_device *dsi = ctx->dsi;
>> +       struct device *dev = &dsi->dev;
>> +       int ret;
>> +
>> +       dsi->mode_flags &= ~MIPI_DSI_MODE_LPM;
> 
> I haven't seen this mode flag MIPI_DSI_MODE_LPM set and
> masked in other DSI panel drivers! Is this something we should
> fix everywhere then? Or even something the core should be
> doing?

These bits were included in a driver for a similar panel with the same
controller in an MSM8916 close-to-mainline kernel fork[1]; that driver
was generated with lmdpdg[2], which adds the LPM mode flag automatically
based on some downstream DTS property. In this case, I left it in, since
it didn't seem to break anything... but I just re-tested without it and
it seems that it might've fixed some odd issues I'd get sometimes when
going out of sleep mode. I'll get rid of it in the next version.

(I based my panel driver off that driver; now that I think about it, it
might be worth mentioning somewhere in the copyright notice...?)

Best regards
Artur Weber

[1]
https://github.com/msm8916-mainline/linux/blob/msm8916/6.3-rc7/drivers/gpu/drm/panel/msm8916-generated/panel-samsung-s6d7aa0-lsl080al03.c
[2]
https://github.com/msm8916-mainline/linux-mdss-dsi-panel-driver-generator
