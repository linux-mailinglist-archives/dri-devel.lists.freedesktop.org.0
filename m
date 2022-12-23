Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 044DD65506D
	for <lists+dri-devel@lfdr.de>; Fri, 23 Dec 2022 13:36:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EA4B010E1A2;
	Fri, 23 Dec 2022 12:36:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x235.google.com (mail-lj1-x235.google.com
 [IPv6:2a00:1450:4864:20::235])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CE4CA10E1A2
 for <dri-devel@lists.freedesktop.org>; Fri, 23 Dec 2022 12:36:01 +0000 (UTC)
Received: by mail-lj1-x235.google.com with SMTP id u12so1183942ljj.11
 for <dri-devel@lists.freedesktop.org>; Fri, 23 Dec 2022 04:36:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=r3UKnhEZQUn5GYS/RbUjSz4ZcQWY1ixwYwswiqDVqN4=;
 b=ZMj8Y/j8X8EoTO+KuKX8colZn+dhXdx8X1p3IZfbkZGh1LneEu7csBHwCLpu/89mdh
 VA57l0Ls/nQDnDIcDSTcQRx6mVOsUT4YNgY/E2Up3vxOxjW0xgk1pF1JRe4hI8WEhPwa
 dOYkY6OJZuJLGrNkxJzC7Y0CoGnozi6s6k8fafoQ80XGnbDOHlHLGIb8LsQKPXCpqt3Q
 mr9P0WahGP8y0eaQkkPbzgGvBQoUJgINgUufJ6Z94cu/nOSHLJHa8edCHdEXz+kzJi9l
 d9VUpbqTfEhP7dfmPKXBtpnVGfeZfoZPEVDQY/u5X9sinrM+4dKtk+fR6JyIaUAY+DbJ
 U/ag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=r3UKnhEZQUn5GYS/RbUjSz4ZcQWY1ixwYwswiqDVqN4=;
 b=ntkKMpyKN4+xPPraM7z5/he2QRXM1aQx17uMza80M5zdb2TGd5gpJNTr2FDCshKie2
 E0y3M0fSQT4I/rTujp35PbVwSSPNqFIjkpXPfkF/yZJ/NIPXbV2pSzjFN6Fy/3u9K21g
 PLCWzN10xl4rrFPEHdPFZzo+INQoO4Ghy/xVslrIpuJdCYArK6OFPeV64ZpW1DVPnXXy
 xMwKEG2Ybb534HeAMHvJwRx2MJhsnX6RaXrLc7Il1IGtmC6yDHmv5hRskbBv8n3BNZSj
 zZYSCp80bin3GUmpDeKEPElRg3YrXqFRDDn8LsReginFQo9zkIPBFMT0H/2g32y4NCvw
 zNgw==
X-Gm-Message-State: AFqh2kr5OUY1w3W1M1YKR0BHIVWxeadC95XuRUIME/DITHBZjtmMXEsi
 TZ/JAKsxrpHHNItPOf5lVZY=
X-Google-Smtp-Source: AMrXdXvhITzwpOd2W35sRsxL4USYcqWShDT+nWnLh4NFjRnjHAGbmI41tTpVVmFbTBCc3uqKHwW4TQ==
X-Received: by 2002:a2e:8197:0:b0:27d:e218:a528 with SMTP id
 e23-20020a2e8197000000b0027de218a528mr3813756ljg.12.1671798960143; 
 Fri, 23 Dec 2022 04:36:00 -0800 (PST)
Received: from [192.168.2.145] ([109.252.113.89])
 by smtp.googlemail.com with ESMTPSA id
 z8-20020a2eb528000000b0027a026088b6sm405599ljm.95.2022.12.23.04.35.58
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 23 Dec 2022 04:35:59 -0800 (PST)
Message-ID: <44d2d972-1cdf-fdb2-5dc0-cc493f79b3da@gmail.com>
Date: Fri, 23 Dec 2022 15:35:58 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH v2 21/21] staging: media: tegra-video: add tegra20 variant
Content-Language: en-US
To: Luca Ceresoli <luca.ceresoli@bootlin.com>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Thierry Reding <thierry.reding@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>,
 Sowjanya Komatineni <skomatineni@nvidia.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Hans Verkuil <hverkuil-cisco@xs4all.nl>
References: <20221128152336.133953-1-luca.ceresoli@bootlin.com>
 <20221128152336.133953-22-luca.ceresoli@bootlin.com>
From: Dmitry Osipenko <digetx@gmail.com>
In-Reply-To: <20221128152336.133953-22-luca.ceresoli@bootlin.com>
Content-Type: text/plain; charset=UTF-8
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
Cc: devicetree@vger.kernel.org, linux-staging@lists.linux.dev,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Paul Kocialkowski <paul.kocialkowski@bootlin.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, linux-tegra@vger.kernel.org,
 Richard Leitner <richard.leitner@skidata.com>, linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

28.11.2022 18:23, Luca Ceresoli пишет:
> +/* --------------------------------------------------------------------------
> + * VIP
> + */
> +
> +/*
> + * VIP-specific configuration for stream start.
> + *
> + * Whatever is common among VIP and CSI is done by the VI component (see
> + * tegra20_vi_start_streaming()). Here we do what is VIP-specific.
> + */
> +static int tegra20_vip_start_streaming(struct tegra_vip_channel *vip_chan)
> +{
> +	struct tegra_vi_channel *vi_chan = v4l2_get_subdev_hostdata(&vip_chan->subdev);
> +	int width  = vi_chan->format.width;
> +	int height = vi_chan->format.height;
> +
> +	unsigned int main_input_format;
> +	unsigned int yuv_input_format;
> +
> +	tegra20_vi_get_input_formats(vi_chan, &main_input_format, &yuv_input_format);
> +
> +	tegra20_vi_write(vi_chan, TEGRA_VI_VI_CORE_CONTROL, 0);
> +
> +	tegra20_vi_write(vi_chan, TEGRA_VI_VI_INPUT_CONTROL,
> +			 VI_INPUT_VIP_INPUT_ENABLE | main_input_format | yuv_input_format);
> +
> +	tegra20_vi_write(vi_chan, TEGRA_VI_V_DOWNSCALE_CONTROL, 0);
> +	tegra20_vi_write(vi_chan, TEGRA_VI_H_DOWNSCALE_CONTROL, 0);
> +
> +	tegra20_vi_write(vi_chan, TEGRA_VI_VIP_V_ACTIVE, height << VI_VIP_V_ACTIVE_PERIOD_SFT);
> +	tegra20_vi_write(vi_chan, TEGRA_VI_VIP_H_ACTIVE,
> +			 roundup(width, 2) << VI_VIP_H_ACTIVE_PERIOD_SFT);
> +
> +	/*
> +	 * For VIP, D9..D2 is mapped to the video decoder's P7..P0.
> +	 * Disable/mask out the other Dn wires. When not in BT656
> +	 * mode we also need the V/H sync.
> +	 */
> +	tegra20_vi_write(vi_chan, TEGRA_VI_PIN_INPUT_ENABLE,
> +			 GENMASK(9, 2) << VI_PIN_INPUT_VD_SFT |
> +			 VI_PIN_INPUT_HSYNC | VI_PIN_INPUT_VSYNC);
> +	tegra20_vi_write(vi_chan, TEGRA_VI_VI_DATA_INPUT_CONTROL,
> +			 GENMASK(9, 2) << VI_DATA_INPUT_SFT);
> +	tegra20_vi_write(vi_chan, TEGRA_VI_PIN_INVERSION, 0);
> +
> +	tegra20_vi_write(vi_chan, TEGRA_VI_CONT_SYNCPT_OUT_1,
> +			 VI_CONT_SYNCPT_OUT_1_CONTINUOUS_SYNCPT |
> +			 host1x_syncpt_id(vi_chan->out_sp) << VI_CONT_SYNCPT_OUT_1_SYNCPT_IDX_SFT);
> +
> +	tegra20_vi_write(vi_chan, TEGRA_VI_CAMERA_CONTROL, VI_CAMERA_CONTROL_STOP_CAPTURE);
> +
> +	return 0;
> +}
> +
> +static const struct tegra_vip_ops tegra20_vip_ops = {
> +	.vip_start_streaming = tegra20_vip_start_streaming,
> +};
> +
> +const struct tegra_vip_soc tegra20_vip_soc = {
> +	.ops = &tegra20_vip_ops,
> +};

Shouldn't this be placed in vip.c? Also looks like patch #20 won't link
because tegra20_vip_soc is defined in patch #21.
