Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E052576C7C7
	for <lists+dri-devel@lfdr.de>; Wed,  2 Aug 2023 10:01:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BE3FE10E517;
	Wed,  2 Aug 2023 08:01:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com
 [IPv6:2a00:1450:4864:20::436])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 88AAF10E055
 for <dri-devel@lists.freedesktop.org>; Wed,  2 Aug 2023 08:01:33 +0000 (UTC)
Received: by mail-wr1-x436.google.com with SMTP id
 ffacd0b85a97d-3110ab7110aso6593561f8f.3
 for <dri-devel@lists.freedesktop.org>; Wed, 02 Aug 2023 01:01:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1690963292; x=1691568092;
 h=content-transfer-encoding:in-reply-to:organization:references:cc:to
 :content-language:subject:reply-to:from:user-agent:mime-version:date
 :message-id:from:to:cc:subject:date:message-id:reply-to;
 bh=Lra3q/h8SM1TJz6A0xEiw6O+E+QZRKqoZawzR3yHXXU=;
 b=E74fLrybjGCQ84vac0P6HVS1/Iyg54CTdP3mHt3RqKPZQBMvSM483g8CzZTvh0EYcA
 eAES6nSnQCM0qfvR5Np5to2qSlDhMcnFjegFFi1qG1ohAWyidHQd8vsQh1CU+vZie3Mj
 8nc8RNcjwIUU2uQKWV0V/YDqmqRIU+zQgL0/12hzed8e5Lij+/EFLllnpsUxlVF4FYgx
 p+uJs3YCzIdoYnE5oDjw1NXNVEkCkmNRkEYCTzlpv+0hVzoCTiOgzhFR+FPVEoyWx2re
 39LhRu4V2aG+iTUAwfdz5x7zcPTChH+3H3a26O2DItCKDjBifNG982jPgH4/IDYm7sTm
 9liw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1690963292; x=1691568092;
 h=content-transfer-encoding:in-reply-to:organization:references:cc:to
 :content-language:subject:reply-to:from:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Lra3q/h8SM1TJz6A0xEiw6O+E+QZRKqoZawzR3yHXXU=;
 b=e88my7RnrUU4nd2N22Ko6gbsuPBbQwx5TBCGWctH452KVz4wf59w2RK4QZXMBHga6l
 U8CrR/ulnH5Lmqgui5NVS8zXb+uDaXcaGkCzLsCjsKcXR7pZY/tLrt1gAO+CZd6nswTf
 fRdRvzNeZWEWiprf/fwFvxhkbIfB1XYYJnsT5g8mOkZ6acfyRZ5+mSTE/h3WEUulrjOW
 5OFjNBej8+N3uF7Ogmw8fCv8YlHDbhR0Y+LOizOmk5qAJR5v+vwekz6j+Mw3VWebkKRh
 CPDkrJ/OLm7z7lR+4u93XxB7uMaLqzKD2xGn9sc6Wpy3681zP2/kbOMBcgVzS16emSgq
 q4Zg==
X-Gm-Message-State: ABy/qLbF0FhGz0mvJCACgmY3xXn5Ek/dW6C9xZFMnjvyQ55DJ+snZ28A
 vXxLfyNYu1Dk/4itpj3EhVELdQ==
X-Google-Smtp-Source: APBJJlGdsZhFMf93cQbrmr7O2hMk9KbKDVaIKgraQYohQlJ5ll+m53ZGUG4Ri6G3YFdBEvdtu0kh7Q==
X-Received: by 2002:adf:e291:0:b0:317:67bf:3376 with SMTP id
 v17-20020adfe291000000b0031767bf3376mr4297267wri.57.1690963291548; 
 Wed, 02 Aug 2023 01:01:31 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:982:cbb0:c5bb:5b4:61e3:d196?
 ([2a01:e0a:982:cbb0:c5bb:5b4:61e3:d196])
 by smtp.gmail.com with ESMTPSA id
 z13-20020a5d654d000000b00314398e4dd4sm18128546wrv.54.2023.08.02.01.01.30
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 02 Aug 2023 01:01:30 -0700 (PDT)
Message-ID: <32876ecc-4f20-2b59-937d-7923a4d20594@linaro.org>
Date: Wed, 2 Aug 2023 10:01:29 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH] drm/panel: samsung-s6d7aa0: Add MODULE_DEVICE_TABLE
Content-Language: en-US
To: Nikita Travkin <nikita@trvn.ru>, Artur Weber <aweber.kernel@gmail.com>,
 Sam Ravnborg <sam@ravnborg.org>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>
References: <20230802-gt5-panel-dtable-v1-1-c0a765c175e2@trvn.ru>
Organization: Linaro Developer Services
In-Reply-To: <20230802-gt5-panel-dtable-v1-1-c0a765c175e2@trvn.ru>
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
Reply-To: neil.armstrong@linaro.org
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 02/08/2023 08:41, Nikita Travkin wrote:
> The driver can be built as a module, however the lack of the
> MODULE_DEVICE_TABLE macro prevents it from being automatically probed
> from the DT in such case.
> 
> Add the missed macro to make sure the module can load automatically.
> 
> Fixes: 6810bb390282 ("drm/panel: Add Samsung S6D7AA0 panel controller driver")
> Signed-off-by: Nikita Travkin <nikita@trvn.ru>
> ---
>   drivers/gpu/drm/panel/panel-samsung-s6d7aa0.c | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/gpu/drm/panel/panel-samsung-s6d7aa0.c b/drivers/gpu/drm/panel/panel-samsung-s6d7aa0.c
> index 0583360b1280..ea5a85779382 100644
> --- a/drivers/gpu/drm/panel/panel-samsung-s6d7aa0.c
> +++ b/drivers/gpu/drm/panel/panel-samsung-s6d7aa0.c
> @@ -567,6 +567,7 @@ static const struct of_device_id s6d7aa0_of_match[] = {
>   	},
>   	{ /* sentinel */ }
>   };
> +MODULE_DEVICE_TABLE(of, s6d7aa0_of_match);
>   
>   static struct mipi_dsi_driver s6d7aa0_driver = {
>   	.probe = s6d7aa0_probe,
> 
> ---
> base-commit: 626c67169f9972fffcdf3bc3864de421f162ebf5
> change-id: 20230802-gt5-panel-dtable-d9d6ca407f26
> 
> Best regards,

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
