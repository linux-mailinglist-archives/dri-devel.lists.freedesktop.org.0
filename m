Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B77197B4B8A
	for <lists+dri-devel@lfdr.de>; Mon,  2 Oct 2023 08:38:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1E78510E122;
	Mon,  2 Oct 2023 06:38:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bombadil.infradead.org (bombadil.infradead.org
 [IPv6:2607:7c80:54:3::133])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 538FE10E134;
 Mon,  2 Oct 2023 06:38:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 Content-Type:In-Reply-To:From:References:To:Subject:MIME-Version:Date:
 Message-ID:Sender:Reply-To:Cc:Content-ID:Content-Description;
 bh=qG2OUo0jkUhRHbJw+LMRYwNS/lqz8RgvctqBHgbaYYA=; b=4MUOLO87rx/lPtDgTJwXQ29UP7
 QG/sxrYlTeKR3HFKw5MNOBTUabL4asBe6nfOtzTeHjr0TMYECd36d9tQssft3KYTfkaGVtC5jkRGa
 3EWqtcFHmJY8udUB4kPM6H6ze+or3bExDWaghN8RH2cP0L6BjsEbHizb9kc1SN+LJSHfm3s/FAlhm
 /VBceTCWttmhjlvtK60CshxG+HyXqg1pSMzhHVpF5eQ5UDfM6l9nJg6ILVnso6SnBWsGmm35jSYDd
 T/GoypBJi2ABcS8NZkneQxcoGBq1t2xtTckd76Gua491utE7IwM34WM1uQZKvvEWoeRTa/GQJnxXM
 tyi1eLYg==;
Received: from [50.53.46.231] (helo=[192.168.254.15])
 by bombadil.infradead.org with esmtpsa (Exim 4.96 #2 (Red Hat Linux))
 id 1qnCZa-00C2GH-09; Mon, 02 Oct 2023 06:38:30 +0000
Message-ID: <153b7d81-143a-4b82-8ec0-33ba130098a0@infradead.org>
Date: Sun, 1 Oct 2023 23:38:28 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/amd/display: add kernel docs for dc_dmub_caps
Content-Language: en-US
To: Sagar Vashnav <sagarvashnav72427@gmail.com>,
 Harry Wentland <harry.wentland@amd.com>, Leo Li <sunpeng.li@amd.com>,
 Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 "Pan, Xinhui" <Xinhui.Pan@amd.com>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <9270c1f3-c8f3-4b3c-91ec-ed17d97ecafd@infradead.org>
 <20231002044126.70197-1-sagarvashnav72427@gmail.com>
From: Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <20231002044126.70197-1-sagarvashnav72427@gmail.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 10/1/23 21:41, Sagar Vashnav wrote:
> Add kernel documentation for the dc_dmub_caps structure.
> 
> Signed-off-by: Sagar Vashnav <sagarvashnav72427@gmail.com>

Reviewed-by: Randy Dunlap <rdunlap@infradead.org>

Thanks.

> ---
>  drivers/gpu/drm/amd/display/dc/dc.h | 10 ++++++++++
>  1 file changed, 10 insertions(+)
> 
> diff --git a/drivers/gpu/drm/amd/display/dc/dc.h b/drivers/gpu/drm/amd/display/dc/dc.h
> index 81258392d..14b4c503d 100644
> --- a/drivers/gpu/drm/amd/display/dc/dc.h
> +++ b/drivers/gpu/drm/amd/display/dc/dc.h
> @@ -208,6 +208,16 @@ struct dc_color_caps {
>  	struct mpc_color_caps mpc;
>  };
>  
> +/**
> + * struct dc_dmub_caps - DMUB (Display Microcontroller Unit) capabilities
> + * @psr: support for PSR (Power Saving State Residency)
> + * @mclk_sw: support for MCLK_SW (Memory Clock Switch)
> + * @subvp_psr: support for SUBVP PSR (Sub-Viewport Power Saving State Residency)
> + * @gecc_enable: GECC (Global Error Correcting Code) enablement.
> + *
> + * This structure describes the capabilities of the Display Microcontroller Unit (DMUB).
> + * It specifies whether certain features like PSR and MCLK_SW are supported.
> + */
>  struct dc_dmub_caps {
>  	bool psr;
>  	bool mclk_sw;

-- 
~Randy
