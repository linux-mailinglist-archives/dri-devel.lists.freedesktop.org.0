Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D7B1307EE4
	for <lists+dri-devel@lfdr.de>; Thu, 28 Jan 2021 20:45:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B6B6A6E9FC;
	Thu, 28 Jan 2021 19:44:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x634.google.com (mail-ej1-x634.google.com
 [IPv6:2a00:1450:4864:20::634])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4C9B86E0DC
 for <dri-devel@lists.freedesktop.org>; Thu, 28 Jan 2021 09:42:18 +0000 (UTC)
Received: by mail-ej1-x634.google.com with SMTP id g3so6762488ejb.6
 for <dri-devel@lists.freedesktop.org>; Thu, 28 Jan 2021 01:42:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:from:to:cc:references:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=VS2BXLiTQG5Ywx+8YI/6vIBJgTmi0BPOFN3mLacxjo4=;
 b=rlxtghjBfMv4sBljBAWBUtNHU7Amys8VPM6WUQ97fwHB6t2TC77Dzg71iFL+GpzU0v
 mNXzfIZRMQv+lYOPDgWb1DBPIeGc0M6wNql9PRFg9ptBFb72lx+7T2BXDREJhgee7iwL
 j/ZyszTs9ktqcwXXxCJ5rnQ5iGTXtmpCTc/7RubSPyHLZaPVuQXMUAqMCe6Q7Z1KK3nC
 +a9lmbGrrgOjw76O9rPePmHpW59cNJ9rG75PiVQXoFQL2JOV176Xpo405L1DVYgMvjoB
 wI80jK1WReqzS+ilePNs5t6MiE+P9/WkzamG9pa6I7tbx/pfONBOZBApQCPxuMqza233
 pvVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:from:to:cc:references:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=VS2BXLiTQG5Ywx+8YI/6vIBJgTmi0BPOFN3mLacxjo4=;
 b=rC1GbsrLZQLNg0vcZliK2HcsTljTzIkb4xFYGh1WJqGsp9pLU+je9FwfWlZBcJ4G5s
 iaBw6b4R17/GfU9UKE7peASozRecTuE3N2Qm2yewprBrhSb2PWD/KrujmEdcXhK4ZR/T
 h1grGVnr5dHMcUi8wT7osLjyKVumwPllE/vlYpQTncj+41su4VoDZ5+U8tyum+h2z+7Q
 K1LG1NYCP8rl84JLJ2k0qWvNHBLfU45V5rtfuqxgh1PP3CLVDkkLFcuxQo4/NVkmTe4y
 IsPvc6XxKwDL8K/k4RAIS6gUMu4sUSHIwKAIGMaagQ5VWqdfSgGuhgMQq4B/wWbWOzNO
 ROjg==
X-Gm-Message-State: AOAM5335857O7/N6Wmq6g1PB1Sq5/61U23kEaEh6WIf0syhsv3Re2UAt
 jCV88byl9xNQ62Nwa/CsH/I=
X-Google-Smtp-Source: ABdhPJwwQr9fpLfw/ULp0RvD+T6rOzO4W88QBT5qcyDraLNmTY0zXsKsqA/nLyzQSi69y6wF0zp7HQ==
X-Received: by 2002:a17:907:7255:: with SMTP id
 ds21mr10178552ejc.258.1611826937030; 
 Thu, 28 Jan 2021 01:42:17 -0800 (PST)
Received: from [192.168.74.106] (178-169-161-196.razgrad.ddns.bulsat.com.
 [178.169.161.196])
 by smtp.gmail.com with ESMTPSA id cx6sm2810192edb.53.2021.01.28.01.42.15
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 28 Jan 2021 01:42:16 -0800 (PST)
Subject: Re: [PATCH 2/2] drm/panel: simple: add samsung,s6e3fa2 panel
From: Iskren Chernev <iskren.chernev@gmail.com>
To: Rob Herring <robh+dt@kernel.org>, Sam Ravnborg <sam@ravnborg.org>,
 Thierry Reding <thierry.reding@gmail.com>
References: <20201230151711.3619846-1-iskren.chernev@gmail.com>
 <20201230151711.3619846-2-iskren.chernev@gmail.com>
Message-ID: <e8701e3c-b0b2-559c-e808-1e6983b85b00@gmail.com>
Date: Thu, 28 Jan 2021 11:42:14 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.1
MIME-Version: 1.0
In-Reply-To: <20201230151711.3619846-2-iskren.chernev@gmail.com>
Content-Language: en-US
X-Mailman-Approved-At: Thu, 28 Jan 2021 19:44:34 +0000
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
Cc: devicetree@vger.kernel.org, David Airlie <airlied@linux.ie>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 Samuel Pascua <pascua.samuel.14@gmail.com>,
 ~postmarketos/upstreaming@lists.sr.ht
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 12/30/20 5:17 PM, Iskren Chernev wrote:
> From: Samuel Pascua <pascua.samuel.14@gmail.com>
> 
> This panel is used on the Samsung Galaxy S5 (klte).
> 
> Signed-off-by: Samuel Pascua <pascua.samuel.14@gmail.com>
> ---
>  drivers/gpu/drm/panel/panel-simple.c | 30 ++++++++++++++++++++++++++++
>  1 file changed, 30 insertions(+)
> 
> diff --git a/drivers/gpu/drm/panel/panel-simple.c b/drivers/gpu/drm/panel/panel-simple.c
> index 41bbec72b2dad..5f16826f3ae06 100644
> --- a/drivers/gpu/drm/panel/panel-simple.c
> +++ b/drivers/gpu/drm/panel/panel-simple.c
> @@ -4611,6 +4611,33 @@ static const struct panel_desc_dsi osd101t2045_53ts = {
>  	.lanes = 4,
>  };
> 
> +static const struct drm_display_mode s6e3fa2_mode = {
> +	.clock = 149769,
> +	.hdisplay = 1080,
> +	.hsync_start = 1080 + 162,
> +	.hsync_end = 1080 + 162 + 10,
> +	.htotal = 1080 + 162 + 10 + 36,
> +	.vdisplay = 1920,
> +	.vsync_start = 1920 + 13,
> +	.vsync_end = 1920 + 13 + 2,
> +	.vtotal = 1920 + 13 + 2 + 3,
> +};
> +
> +static const struct panel_desc_dsi samsung_s6e3fa2 = {
> +	.desc = {
> +		.modes = &s6e3fa2_mode,
> +		.num_modes = 1,
> +		.bpc = 8,
> +		.size = {
> +			.width = 65,
> +			.height = 115,
> +		},
> +	},
> +	.flags = MIPI_DSI_MODE_VIDEO_BURST,
> +	.format = MIPI_DSI_FMT_RGB888,
> +	.lanes = 4,
> +};
> +
>  static const struct of_device_id dsi_of_match[] = {
>  	{
>  		.compatible = "auo,b080uan01",
> @@ -4633,6 +4660,9 @@ static const struct of_device_id dsi_of_match[] = {
>  	}, {
>  		.compatible = "osddisplays,osd101t2045-53ts",
>  		.data = &osd101t2045_53ts
> +	}, {
> +		.compatible = "samsung,s6e3fa2",
> +		.data = &samsung_s6e3fa2

I just want to share some details to avoid issues in the future.

This setup (with simple panel and bindings), works in the sense that the
display shows stuff, after being left on by the bootloader on the Samsung
Galaxy S5 (klte). There is no provisions for turning the screen off and
back on, backlight, or anything else.

The display is a rather advanced one, containing many features, but so far
none of them (including on/off) has been made to work. It is possible that
in the future some of those features will be figured out, and these might
very well include additional DT properties.

So would it be better to put the bindings in a separate file, ready to
grow, and for the panel - include a simple custom driver that works no
better than the simple-panel one now, but can accommodate future expansion?

>  	}, {
>  		/* sentinel */
>  	}
> --
> 2.29.2
> 
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
