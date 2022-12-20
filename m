Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8ED63652880
	for <lists+dri-devel@lfdr.de>; Tue, 20 Dec 2022 22:40:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8F51D10E3FE;
	Tue, 20 Dec 2022 21:40:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x129.google.com (mail-lf1-x129.google.com
 [IPv6:2a00:1450:4864:20::129])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1A8D710E3FE
 for <dri-devel@lists.freedesktop.org>; Tue, 20 Dec 2022 21:40:31 +0000 (UTC)
Received: by mail-lf1-x129.google.com with SMTP id o6so15734032lfi.5
 for <dri-devel@lists.freedesktop.org>; Tue, 20 Dec 2022 13:40:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=i0QJJAJHs8AlHPv1GFzIrByGID5+G91GQ7RiYN+XzJE=;
 b=AGyI0rZkXfrzcC3mDk9Ocmgo5FfL5qYohqfDty0IGt1mIpDzR+ADBd/5jdkkEIYucf
 fdivCrsy66dXu745ocmIYzzv726M4VbxrH+iIX98exDpvwE0xg0fP4LZOwEN0HUN1RQB
 P1pknZ7u3+ZZ47CmR+Fbci/fvn882uWfnawSIfdeRnSUef2f1hCQ0NToip4Q74f6wx1G
 Aqq+XY15pMIbZZjJhBKOtQ+ZQSKrEhTvriuEkJTg+IeY6KQgvKgW/Pqfm/+SoxkLNBaw
 KuwrecRR7kMH8ZwKcLOUWdX+L+1jY78K9zgg50J94by/ZZt0CXnKc12dTO49GFIgErx0
 h34A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=i0QJJAJHs8AlHPv1GFzIrByGID5+G91GQ7RiYN+XzJE=;
 b=YANm6ywdU9TDTl0jpabh1cctkXGr4JRhc0sBlpbohjQEgVb/zDoclhfy1V7+/egMDJ
 B+dgJV4JLFwWw5oe7wsWhLftBVwo5a7fCtpVLUxyD48heb4a8qrUb7+IP1BhD9XmRUJ7
 DGUGs8wjR4E8x4dzzb6nGK760s+H5yb+q5meb0fsAoUXckWLAx1hogLcFREwsjBb2caO
 qoqbMxKPy7kMVVFtNUugfA+lgLEhWiGzdQ02ULLfQO1gzG6OLNRdJFCBQz6BEg3fRw4F
 FQqOWJm9J26A572Zfbm/FCu8kSriYNScy1KOkGWqWp/Kq7vKudV7vpc1E5UG7selM9TM
 x3kQ==
X-Gm-Message-State: ANoB5pkP7TpceKNQ8UDCAc7A2qq0WB5G45nHnZzVw1wGeaGhmiioTR0A
 iMLqUqm5ioD3EpkcXg/y+Is=
X-Google-Smtp-Source: AA0mqf7UCX9LfU9mAdsWfz+Q/qhvUuQxl0BkWSutbWvnPYHqlJ49tXMn0MPeBrgSGHjYxfib5jXyig==
X-Received: by 2002:a05:6512:682:b0:4a4:68b8:f4db with SMTP id
 t2-20020a056512068200b004a468b8f4dbmr19035562lfe.33.1671572429262; 
 Tue, 20 Dec 2022 13:40:29 -0800 (PST)
Received: from [192.168.2.145] (109-252-113-89.nat.spd-mgts.ru.
 [109.252.113.89]) by smtp.googlemail.com with ESMTPSA id
 v24-20020ac25618000000b004b549ad99adsm1598785lfd.304.2022.12.20.13.40.27
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 20 Dec 2022 13:40:28 -0800 (PST)
Message-ID: <30e6b040-aa82-f6a3-1ff6-baa2c0dcb0e2@gmail.com>
Date: Wed, 21 Dec 2022 00:40:20 +0300
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
> +static int tegra20_channel_capture_frame(struct tegra_vi_channel *chan,
> +					 struct tegra_channel_buffer *buf)
> +{
> +	u32 value;
> +	int err;
> +
> +	chan->next_out_sp_idx++;
> +
> +	tegra20_channel_vi_buffer_setup(chan, buf);
> +
> +	tegra20_vi_write(chan, TEGRA_VI_CAMERA_CONTROL, VI_CAMERA_CONTROL_VIP_ENABLE);
> +
> +	/* Wait for syncpt counter to reach frame start event threshold */
> +	err = host1x_syncpt_wait(chan->out_sp, chan->next_out_sp_idx,
> +				 TEGRA_VI_SYNCPT_WAIT_TIMEOUT, &value);

You're not using the "value" variable, it should be NULL.

The "chan->out_sp" looks redundant, it duplicates the chan->mw_ack_sp.
AFAICS from the doc, T20 has two VI channels, and thus, two mw_ack_sp,
like T210.

