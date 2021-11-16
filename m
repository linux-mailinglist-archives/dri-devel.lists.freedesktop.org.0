Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D8FA452DC3
	for <lists+dri-devel@lfdr.de>; Tue, 16 Nov 2021 10:19:50 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DAC736EE98;
	Tue, 16 Nov 2021 09:19:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com
 [IPv6:2a00:1450:4864:20::433])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 526FB6EE98;
 Tue, 16 Nov 2021 09:19:44 +0000 (UTC)
Received: by mail-wr1-x433.google.com with SMTP id a9so9975962wrr.8;
 Tue, 16 Nov 2021 01:19:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=subject:to:references:from:message-id:date:user-agent:mime-version
 :in-reply-to:content-transfer-encoding:content-language;
 bh=ZZ5qtct0gReM0veqtvP3uHFmenhhHdLVzBUtdLlNxJU=;
 b=FPNECisJWg97qsX6YuqXQNB6Sue6Q8Q39s5qXnIUbI3Eja1cgj9hQ43mt0XcwT84RZ
 /XyY55pV1CR2TGsc7y4hn/dQBfKRLT65HHQC1Xz4ivHmhciGyubG+03hAhL1mQbnsiPz
 cfT438ohx21BUz+300sEHdxvuHf2mpZDXb1thNNXEWP/5nvL/pLLlOsTmeQDlIiFyYnJ
 WWdjSFnyQn5k2kbH9cVRijX98C1mYbS8Ezbdpwhf/mH7uE5/Yjm96SUeXtFDpaG07gTp
 qZpSwAWJaumC4IbF9oJiCg8BH5ldgeSDLWVPRixnAUnVcb8+S1FGwoFqN1raXLkQ0SQl
 q3fw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=ZZ5qtct0gReM0veqtvP3uHFmenhhHdLVzBUtdLlNxJU=;
 b=M1RMBN3hIhH/wZIRgZjPtgCSNy8QpKeD1vQCfUVvznBfqj/tt3lnPQjEmVeTGcxdwG
 5J7IF3BTb1ZcchAZ5WI0exITiitRo3t+/Iji/uJVTkq4Yl6APiQwh2yTnduytQ23Z0Rf
 kGhZh7JHlve+JyGLg+8hj6OZidsLJjzOv4fqLn8O0kjfkkRinXu3xpPMrEalgYyCqsu9
 1URvEDpcFtLEx2YsLyrAqu5Y6S+eQLiZyYrngpxHhIbzW08pr4sv29TtjyQRl3rLABq/
 0hY8RjmV3M6pXDcqVMJE0WolfSJk1wTIImO9SostGYLvsQtTTRvY6zZOVw6Qj6hw+6Ks
 VbDw==
X-Gm-Message-State: AOAM532lQdWbVPjKdeRFucYbA+3v0vH5+ZiW/fUvXm2wB1xRiDLTbFjR
 V6QbuAK9Osc4yyUhzvMuPGw=
X-Google-Smtp-Source: ABdhPJzsTNyvDWu3WC/2tAllTUTwz9jBCO6xvduzfNLLfGl+N3dtMqB+QzCsR0uBvvu5/P1TswIDKw==
X-Received: by 2002:adf:f787:: with SMTP id q7mr7461935wrp.1.1637054382983;
 Tue, 16 Nov 2021 01:19:42 -0800 (PST)
Received: from [192.168.178.21] (p57b0b77b.dip0.t-ipconnect.de.
 [87.176.183.123])
 by smtp.gmail.com with ESMTPSA id i15sm2043189wmq.18.2021.11.16.01.19.41
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 16 Nov 2021 01:19:42 -0800 (PST)
Subject: Re: [PATCH] drm/amd/display: cleanup the code a bit
To: Bernard Zhao <bernard@vivo.com>, Harry Wentland <harry.wentland@amd.com>, 
 Leo Li <sunpeng.li@amd.com>, Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>, 
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
 "Pan, Xinhui" <Xinhui.Pan@amd.com>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <20211116013438.26517-1-bernard@vivo.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>
Message-ID: <88328288-ef1f-ef8b-987f-43dc8dc69ee7@gmail.com>
Date: Tue, 16 Nov 2021 10:19:41 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20211116013438.26517-1-bernard@vivo.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
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

Am 16.11.21 um 02:34 schrieb Bernard Zhao:
> In function dc_sink_destruct, kfree will check pointer, no need
> to check again.
> This change is to cleanup the code a bit.
>
> Signed-off-by: Bernard Zhao <bernard@vivo.com>

This one and the other patch are Acked-by: Christian König 
<christian.koenig@amd.com>

> ---
>   drivers/gpu/drm/amd/display/dc/core/dc_sink.c | 10 +---------
>   1 file changed, 1 insertion(+), 9 deletions(-)
>
> diff --git a/drivers/gpu/drm/amd/display/dc/core/dc_sink.c b/drivers/gpu/drm/amd/display/dc/core/dc_sink.c
> index a249a0e5edd0..4b5e4d8e7735 100644
> --- a/drivers/gpu/drm/amd/display/dc/core/dc_sink.c
> +++ b/drivers/gpu/drm/amd/display/dc/core/dc_sink.c
> @@ -33,14 +33,6 @@
>    * Private functions
>    ******************************************************************************/
>   
> -static void dc_sink_destruct(struct dc_sink *sink)
> -{
> -	if (sink->dc_container_id) {
> -		kfree(sink->dc_container_id);
> -		sink->dc_container_id = NULL;
> -	}
> -}
> -
>   static bool dc_sink_construct(struct dc_sink *sink, const struct dc_sink_init_data *init_params)
>   {
>   
> @@ -75,7 +67,7 @@ void dc_sink_retain(struct dc_sink *sink)
>   static void dc_sink_free(struct kref *kref)
>   {
>   	struct dc_sink *sink = container_of(kref, struct dc_sink, refcount);
> -	dc_sink_destruct(sink);
> +	kfree(sink->dc_container_id);
>   	kfree(sink);
>   }
>   

