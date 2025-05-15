Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F973AB95AA
	for <lists+dri-devel@lfdr.de>; Fri, 16 May 2025 07:50:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6A9AC10E9A3;
	Fri, 16 May 2025 05:50:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="ka/6c+ML";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-f51.google.com (mail-ot1-f51.google.com
 [209.85.210.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ADF3610E0C5;
 Thu, 15 May 2025 20:18:15 +0000 (UTC)
Received: by mail-ot1-f51.google.com with SMTP id
 46e09a7af769-72b0626c785so1413838a34.2; 
 Thu, 15 May 2025 13:18:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1747340295; x=1747945095; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=ORIH55nECeHA8LdRURYjVDonMGKHgsrmuMpr+vgfdSY=;
 b=ka/6c+MLqVxQv5o9O42+AI8Udegrh78Fv1LvGHZNp327g2bpcOrUolYhxDABULEmzd
 14RLRDAbDpWVfAY3fdkcBpwTuuSzv6B63YPKnpgX3y1D0fuAzhOVVHJyNH9jCTLNVd4n
 eoGd2dAO4B5+LlKGbhG9p/IracjpaPcFxcpMxsYXe2MiUWuWEcomBcVNZ5LIiKSBuWGO
 c+Z+RBgNiRFY6+TgqANCtihtAjurzVCRiNWNWL23T6BWB0aqmfxUjqUwOgVqJ5RkUiWG
 SGY4SrbWnafL7KiYToX6usC0D1JyVcjw4vfjj9PUYQEIStMU7OGp7AimgOBttGTtEdiM
 ACKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1747340295; x=1747945095;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=ORIH55nECeHA8LdRURYjVDonMGKHgsrmuMpr+vgfdSY=;
 b=ShIsSiy51qxbIqa9qC21KOIkl5c6UsN/LDQhXJku9GOqMmPvBjG5lUwMx7zZNvLzAO
 B/xOzskv0maFaOuinP5Yi9PbJLxs5qvAQHAosxazn14THXScCXzXkssIt+MlkiV7yO27
 xj9lSRSWQYlHXctu24EbKwfLb7IohAnCQqkOnW1tnwhmeo16vhLtYhRrzSwNgmSjAKG/
 X6p5bU+qImy52MqS+j4wvlutIJnUT4WhKiClThwZwZbcBSkcFdN4dfd4WURTioY9W2rB
 JhhmBH2hDS0ejiqjMovAiK2OYUysFdKyUgtKdYTJwwkAyc6ZAcK46lk57JLgPa8FPAo0
 AWgQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWHa86ypwl/J8YJCIeEFzhsnJYiViI/pOjpIBzo9wiOhHjVqzhxBzMfJ594YhOIz2deExwuibEhm3M=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwsdbngLDGhgci2rcf/1aBSlgTdYNUFBQNvxiQi/KOjDZWbyiOn
 bjSs+5wQsi2mM5OxNRK2DxUb+hO1WLWeCZe1NCNK0U7/wTYSG/IdC80n
X-Gm-Gg: ASbGncsr4V0bgfNrj4pnh134MnXee2S4RfenoiQH5PgXQmcjqYZmi4wR74BSMkHrWid
 Whn06qGss2Bdf3CXnyK951OHQvGLbetWT16L6xPBAZcA8kDeKgZILF0rVlc+pvf8ZtcLEWV+xsH
 FLzKfvPO8nVG2G7eyF+AaMoHfWcz1hGVSNEZYiOJQ+w1Vexb9VCyK+tKSkEIvS+q4/vU48WFd7x
 w/afkjQFVyIzwuYu6ruX//Ujk1/IvRfdzSUnUf703+zHSNTo1O/GBBgsoUv1S5pwHwjfgejM1vT
 rJBBASYxxqIbRQ/YtwB+P7zqx3CciE4KFMlCL2lw4CcI0YxXtfaBKLOn65epEKMXTA5Be+g4GVi
 v6EHZh4lx2chOLlRLLJtj
X-Google-Smtp-Source: AGHT+IGZ6iGkEs8/AH2Bd1WLfM05uSAVYmHniGGxt7DIrP1bhSS+eA9OMmxLChw99pSYQjBXZX778A==
X-Received: by 2002:a05:6830:681a:b0:72b:9c34:1361 with SMTP id
 46e09a7af769-734f6b0465cmr757134a34.15.1747340294735; 
 Thu, 15 May 2025 13:18:14 -0700 (PDT)
Received: from [10.0.0.9] (104-50-4-201.lightspeed.sntcca.sbcglobal.net.
 [104.50.4.201]) by smtp.gmail.com with ESMTPSA id
 46e09a7af769-734f6b5ffdesm87785a34.60.2025.05.15.13.18.13
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 15 May 2025 13:18:14 -0700 (PDT)
Message-ID: <98201050-82eb-453d-a669-036eeefa354e@gmail.com>
Date: Thu, 15 May 2025 13:18:11 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 5/5] drm/print: require struct drm_device for drm_err()
 and friends
To: Jani Nikula <jani.nikula@intel.com>, dri-devel@lists.freedesktop.org
Cc: intel-gfx@lists.freedesktop.org, gustavo.sousa@intel.com,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 airlied@gmail.com, simona@ffwll.ch, linux-kernel@vger.kernel.org,
 kees@kernel.org
References: <cover.1737644530.git.jani.nikula@intel.com>
 <dfe6e774883e6ef93cfaa2b6fe92b804061ab9d9.1737644530.git.jani.nikula@intel.com>
Content-Language: en-US
From: Bill Wendling <isanbard@gmail.com>
In-Reply-To: <dfe6e774883e6ef93cfaa2b6fe92b804061ab9d9.1737644530.git.jani.nikula@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Mailman-Approved-At: Fri, 16 May 2025 05:50:09 +0000
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

On 1/23/25 7:09 AM, Jani Nikula wrote:
> The expectation is that the struct drm_device based logging helpers get
> passed an actual struct drm_device pointer rather than some random
> struct pointer where you can dereference the ->dev member.
> 
> Add a static inline helper to convert struct drm_device to struct
> device, with the main benefit being the type checking of the macro
> argument.
> 
> As a side effect, this also reduces macro argument double references.
> 
> Signed-off-by: Jani Nikula <jani.nikula@intel.com>
> ---
>   include/drm/drm_print.h | 41 +++++++++++++++++++++++------------------
>   1 file changed, 23 insertions(+), 18 deletions(-)
> 
> diff --git a/include/drm/drm_print.h b/include/drm/drm_print.h
> index 9732f514566d..f31eba1c7cab 100644
> --- a/include/drm/drm_print.h
> +++ b/include/drm/drm_print.h
> @@ -584,9 +584,15 @@ void __drm_dev_dbg(struct _ddebug *desc, const struct device *dev,
>    * Prefer drm_device based logging over device or prink based logging.
>    */
>   
> +/* Helper to enforce struct drm_device type */
> +static inline struct device *__drm_to_dev(const struct drm_device *drm)
> +{
> +	return drm ? drm->dev : NULL;
> +}
> +
>   /* Helper for struct drm_device based logging. */
>   #define __drm_printk(drm, level, type, fmt, ...)			\
> -	dev_##level##type((drm) ? (drm)->dev : NULL, "[drm] " fmt, ##__VA_ARGS__)
> +	dev_##level##type(__drm_to_dev(drm), "[drm] " fmt, ##__VA_ARGS__)
>   
>   
>   #define drm_info(drm, fmt, ...)					\
> @@ -620,25 +626,25 @@ void __drm_dev_dbg(struct _ddebug *desc, const struct device *dev,
>   
>   
>   #define drm_dbg_core(drm, fmt, ...)					\
> -	drm_dev_dbg((drm) ? (drm)->dev : NULL, DRM_UT_CORE, fmt, ##__VA_ARGS__)
> -#define drm_dbg_driver(drm, fmt, ...)						\
> -	drm_dev_dbg((drm) ? (drm)->dev : NULL, DRM_UT_DRIVER, fmt, ##__VA_ARGS__)
> +	drm_dev_dbg(__drm_to_dev(drm), DRM_UT_CORE, fmt, ##__VA_ARGS__)
> +#define drm_dbg_driver(drm, fmt, ...)					\
> +	drm_dev_dbg(__drm_to_dev(drm), DRM_UT_DRIVER, fmt, ##__VA_ARGS__)
>   #define drm_dbg_kms(drm, fmt, ...)					\
> -	drm_dev_dbg((drm) ? (drm)->dev : NULL, DRM_UT_KMS, fmt, ##__VA_ARGS__)
> +	drm_dev_dbg(__drm_to_dev(drm), DRM_UT_KMS, fmt, ##__VA_ARGS__)
>   #define drm_dbg_prime(drm, fmt, ...)					\
> -	drm_dev_dbg((drm) ? (drm)->dev : NULL, DRM_UT_PRIME, fmt, ##__VA_ARGS__)
> +	drm_dev_dbg(__drm_to_dev(drm), DRM_UT_PRIME, fmt, ##__VA_ARGS__)
>   #define drm_dbg_atomic(drm, fmt, ...)					\
> -	drm_dev_dbg((drm) ? (drm)->dev : NULL, DRM_UT_ATOMIC, fmt, ##__VA_ARGS__)
> +	drm_dev_dbg(__drm_to_dev(drm), DRM_UT_ATOMIC, fmt, ##__VA_ARGS__)
>   #define drm_dbg_vbl(drm, fmt, ...)					\
> -	drm_dev_dbg((drm) ? (drm)->dev : NULL, DRM_UT_VBL, fmt, ##__VA_ARGS__)
> +	drm_dev_dbg(__drm_to_dev(drm), DRM_UT_VBL, fmt, ##__VA_ARGS__)
>   #define drm_dbg_state(drm, fmt, ...)					\
> -	drm_dev_dbg((drm) ? (drm)->dev : NULL, DRM_UT_STATE, fmt, ##__VA_ARGS__)
> +	drm_dev_dbg(__drm_to_dev(drm), DRM_UT_STATE, fmt, ##__VA_ARGS__)
>   #define drm_dbg_lease(drm, fmt, ...)					\
> -	drm_dev_dbg((drm) ? (drm)->dev : NULL, DRM_UT_LEASE, fmt, ##__VA_ARGS__)
> +	drm_dev_dbg(__drm_to_dev(drm), DRM_UT_LEASE, fmt, ##__VA_ARGS__)
>   #define drm_dbg_dp(drm, fmt, ...)					\
> -	drm_dev_dbg((drm) ? (drm)->dev : NULL, DRM_UT_DP, fmt, ##__VA_ARGS__)
> +	drm_dev_dbg(__drm_to_dev(drm), DRM_UT_DP, fmt, ##__VA_ARGS__)
>   #define drm_dbg_drmres(drm, fmt, ...)					\
> -	drm_dev_dbg((drm) ? (drm)->dev : NULL, DRM_UT_DRMRES, fmt, ##__VA_ARGS__)
> +	drm_dev_dbg(__drm_to_dev(drm), DRM_UT_DRMRES, fmt, ##__VA_ARGS__)
>   
>   #define drm_dbg(drm, fmt, ...)	drm_dbg_driver(drm, fmt, ##__VA_ARGS__)
>   
> @@ -727,10 +733,9 @@ void __drm_err(const char *format, ...);
>   #define __DRM_DEFINE_DBG_RATELIMITED(category, drm, fmt, ...)					\
>   ({												\
>   	static DEFINE_RATELIMIT_STATE(rs_, DEFAULT_RATELIMIT_INTERVAL, DEFAULT_RATELIMIT_BURST);\
> -	const struct drm_device *drm_ = (drm);							\
>   												\
>   	if (drm_debug_enabled(DRM_UT_ ## category) && __ratelimit(&rs_))			\
> -		drm_dev_printk(drm_ ? drm_->dev : NULL, KERN_DEBUG, fmt, ## __VA_ARGS__);	\
> +		drm_dev_printk(__drm_to_dev(drm), KERN_DEBUG, fmt, ## __VA_ARGS__);		\
>   })
>   
>   #define drm_dbg_ratelimited(drm, fmt, ...) \
> @@ -752,13 +757,13 @@ void __drm_err(const char *format, ...);
>   /* Helper for struct drm_device based WARNs */
>   #define drm_WARN(drm, condition, format, arg...)			\
>   	WARN(condition, "%s %s: [drm] " format,				\
> -			dev_driver_string((drm)->dev),			\
> -			dev_name((drm)->dev), ## arg)
> +			dev_driver_string(__drm_to_dev(drm)),		\
> +			dev_name(__drm_to_dev(drm)), ## arg)
>   
>   #define drm_WARN_ONCE(drm, condition, format, arg...)			\
>   	WARN_ONCE(condition, "%s %s: [drm] " format,			\
> -			dev_driver_string((drm)->dev),			\
> -			dev_name((drm)->dev), ## arg)
> +			dev_driver_string(__drm_to_dev(drm)),		\
> +			dev_name(__drm_to_dev(drm)), ## arg)
>
Hi Jani,

These two changes introduce undefined behavior into these macros. The final
code generation becomes this (from 'bxt_port_to_phy_channel'):

	__warn_printk("%s %s: [drm] " "PHY not found for PORT %c",
		      dev_driver_string(__drm_to_dev(display->drm)),
		      dev_name(__drm_to_dev(display->drm)),
		      (port + 'A'));

The issue lies in 'dev_name(__drm_to_dev(display->drm))'. After inlining, it
becomes this (pseudo code):

	struct device *device = display->drm ? display->drm->dev : NULL;
	const char *name = device->init_name ? device->init_name
					     : kobject_name(&device->kobj);

	__warn_printk("%s %s: [drm] " "PHY not found for PORT %c",
		      dev_driver_string(device), name, (port + 'A'));

The issue, of course, is that the 'device' may be NULL when attempting 
to get
'device->init_name'. The compiler sees this as undefined behavior, which may
lead to unexpected outcomes, especially with Clang where paths 
determined to be
undefined are removed entirely under certain conditions.

(Note, I'm working on making this behavior less draconian by adopting a GCC
pass, but this will take time to filter out to Linux devs.)

Regards,
-bw

