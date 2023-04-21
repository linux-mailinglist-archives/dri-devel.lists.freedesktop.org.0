Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 703546EB02B
	for <lists+dri-devel@lfdr.de>; Fri, 21 Apr 2023 19:07:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5C55F10E05B;
	Fri, 21 Apr 2023 17:07:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x134.google.com (mail-lf1-x134.google.com
 [IPv6:2a00:1450:4864:20::134])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2721310E05B
 for <dri-devel@lists.freedesktop.org>; Fri, 21 Apr 2023 17:07:04 +0000 (UTC)
Received: by mail-lf1-x134.google.com with SMTP id
 2adb3069b0e04-4ec86aeeb5cso1959066e87.3
 for <dri-devel@lists.freedesktop.org>; Fri, 21 Apr 2023 10:07:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1682096822; x=1684688822;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=nsVxuLXGb/HmPw4+8d4rfb4M9t507exbwNDKA5TIVj0=;
 b=HrNG838xCe/plUz92VSGxl/e4w2Pd1PcZs5KToy+urCwSP7bumfAbId236f4ii3Cr2
 ZEyJ52y41H0aFtjXZbEWFTUdugvGiTwjGEAKroJc19BY4I4HQtNmxd5Hu5dDldNe64IU
 joL6owyMglGtfqIJFPaHxmAvreliuUZ2pmhC3wV+sEpu/t63h+Denl8lm6KxJGTHOg2E
 AmYfQttbiLsz28aV12KXZLUi0C0oeMhZ1U6Jf/HIOd6UYJUZvmHZy+UtWWAOW/i6efvR
 sRs+cXOKy36HxpMv6kLBv4jLMgSG/A0ULmXen7Fq4G8E3i/v6/OCY09DSWzBGrxo8Jy3
 UCDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682096822; x=1684688822;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=nsVxuLXGb/HmPw4+8d4rfb4M9t507exbwNDKA5TIVj0=;
 b=kVHQrew1WKxtNryOCXDoSbl7HRHtb9YWKztXJ1L09kI+Lrha5Dg1tcrBAyefNSUbQy
 kx6P7Yitsh/qcpukkwKoyJDC/m/trWkhpx9sD7UOzkTDgiEjWytTHeLNNZJ9gA0mExIt
 TsW/jrqE7IWPcYnysKI9i3Xwr143LA+0wwfKC2QqbAh1zX+0F+bQu7hWxb6v1PH8uWrz
 UmrU7sqD9O4iS3KHnf0mQCg1kcDSpkEhcHAVd9d0yBxe1NhBSEuAC52uRNHbzwwe6x5l
 oF7+0hRH7bngOC99uZKaDDz/mPsYUrumEMcndk16uTeFmD6t7duKL/dC2qnNxroN8+Ol
 pTlA==
X-Gm-Message-State: AAQBX9cef94TVB9jU5m7qZI5bFNhZto7dPe6DsBl+6GcXMcHWRHLGrvl
 YlJU/9k7RFhdTyseeLM5KeEiOA==
X-Google-Smtp-Source: AKy350bmI8zPG+zpUhZ0o7e9UHzK1WMARz2ilni8s0oJ+vuQJEaH/EH2o7WV5UWwWtdWpkO+jf8JFA==
X-Received: by 2002:ac2:4821:0:b0:4e8:221f:5886 with SMTP id
 1-20020ac24821000000b004e8221f5886mr1532394lft.19.1682096821884; 
 Fri, 21 Apr 2023 10:07:01 -0700 (PDT)
Received: from ?IPV6:2001:14ba:a085:4d00::8a5?
 (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a085:4d00::8a5])
 by smtp.gmail.com with ESMTPSA id
 x24-20020a19f618000000b004db3e7dfb8csm616096lfe.189.2023.04.21.10.07.01
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 21 Apr 2023 10:07:01 -0700 (PDT)
Message-ID: <bc723ffd-73cd-0339-c2aa-42b3db5a3560@linaro.org>
Date: Fri, 21 Apr 2023 20:07:00 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH v2 2/3] DRM: Create new Content Protection connector
 property
Content-Language: en-GB
To: Mark Yacoub <markyacoub@chromium.org>, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
References: <20230421162749.360777-1-markyacoub@google.com>
 <20230421162749.360777-3-markyacoub@google.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <20230421162749.360777-3-markyacoub@google.com>
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
Cc: seanpaul@chromium.org, dianders@chromium.org, linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 21/04/2023 19:27, Mark Yacoub wrote:
> From: Mark Yacoub <markyacoub@chromium.org>

Nit: is there a reason for this header? My first impression is that it 
matches your outgoing name & email address and as such is not necessary.

Nit#2: subject should mention 'Key', as you are creating a property for 
the key.

> 
> [Why]
> To enable Protected Content, some drivers require a key to be injected
> from user space to enable HDCP on the connector.
> 
> [How]
> Create new "Content Protection Property" of type "Blob"

Generic observation is that the ability to inject HDCP keys manually 
seems to be quite unique to your hardware. As such, I think the debugfs 
or sysfs suits better in comparison to the DRM property.

> 
> Signed-off-by: Mark Yacoub <markyacoub@chromium.org>
> ---
>   drivers/gpu/drm/drm_atomic_uapi.c | 9 +++++++++
>   include/drm/drm_connector.h       | 6 ++++++
>   include/drm/drm_mode_config.h     | 6 ++++++
>   3 files changed, 21 insertions(+)
> 
> diff --git a/drivers/gpu/drm/drm_atomic_uapi.c b/drivers/gpu/drm/drm_atomic_uapi.c
> index d867e7f9f2cd5..e20bc57cdb05c 100644
> --- a/drivers/gpu/drm/drm_atomic_uapi.c
> +++ b/drivers/gpu/drm/drm_atomic_uapi.c
> @@ -749,6 +749,11 @@ static int drm_atomic_connector_set_property(struct drm_connector *connector,
>   		state->content_protection = val;
>   	} else if (property == config->hdcp_content_type_property) {
>   		state->hdcp_content_type = val;
> +	} else if (property == config->content_protection_key_property) {
> +		ret = drm_atomic_replace_property_blob_from_id(
> +			dev, &state->content_protection_key, val, -1, -1,
> +			&replaced);
> +		return ret;
>   	} else if (property == connector->colorspace_property) {
>   		state->colorspace = val;
>   	} else if (property == config->writeback_fb_id_property) {
> @@ -843,6 +848,10 @@ drm_atomic_connector_get_property(struct drm_connector *connector,
>   		*val = state->content_protection;
>   	} else if (property == config->hdcp_content_type_property) {
>   		*val = state->hdcp_content_type;
> +	} else if (property == config->content_protection_key_property) {
> +		*val = state->content_protection_key ?
> +			       state->content_protection_key->base.id :
> +			       0;
>   	} else if (property == config->writeback_fb_id_property) {
>   		/* Writeback framebuffer is one-shot, write and forget */
>   		*val = 0;
> diff --git a/include/drm/drm_connector.h b/include/drm/drm_connector.h
> index 7b5048516185c..2fbe51272bfeb 100644
> --- a/include/drm/drm_connector.h
> +++ b/include/drm/drm_connector.h
> @@ -896,6 +896,12 @@ struct drm_connector_state {
>   	 */
>   	unsigned int content_protection;
>   
> +	/**
> +	 * @content_protection_key: DRM blob property for holding the Content
> +	 * Protection Key injected from user space.
> +	 */
> +	struct drm_property_blob *content_protection_key;
> +
>   	/**
>   	 * @colorspace: State variable for Connector property to request
>   	 * colorspace change on Sink. This is most commonly used to switch
> diff --git a/include/drm/drm_mode_config.h b/include/drm/drm_mode_config.h
> index e5b053001d22e..615d1e5f57562 100644
> --- a/include/drm/drm_mode_config.h
> +++ b/include/drm/drm_mode_config.h
> @@ -887,6 +887,12 @@ struct drm_mode_config {
>   	 */
>   	struct drm_property *hdcp_content_type_property;
>   
> +	/**
> +	 * @content_protection_key_property: DRM blob property that receives the
> +	 * content protection key from user space to be injected into the kernel.
> +	 */
> +	struct drm_property *content_protection_key_property;
> +
>   	/* dumb ioctl parameters */
>   	uint32_t preferred_depth, prefer_shadow;
>   

-- 
With best wishes
Dmitry

