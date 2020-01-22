Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BBF901457A3
	for <lists+dri-devel@lfdr.de>; Wed, 22 Jan 2020 15:21:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7F2676F549;
	Wed, 22 Jan 2020 14:21:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-xb43.google.com (mail-yb1-xb43.google.com
 [IPv6:2607:f8b0:4864:20::b43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 783AE6F54A
 for <dri-devel@lists.freedesktop.org>; Wed, 22 Jan 2020 14:21:52 +0000 (UTC)
Received: by mail-yb1-xb43.google.com with SMTP id z15so3135884ybm.8
 for <dri-devel@lists.freedesktop.org>; Wed, 22 Jan 2020 06:21:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=poorly.run; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=+/p86Y+DK7SRlgsg41Io0iP7JH8+JfcvGxwgzWMIUh0=;
 b=YlEEsc/wKCcfjuqpTZ3/7J+9AliQiPhSQDJ3yyrqKgcJf3Z1j+oUtuG0r8D7FBUfQx
 eK7Igb/ptk8Zlr5hGsbQC1lI+GfxzuWiKKxPmrpaBoQmgK8HEPJ9dvZDeuiTgT+HzlYM
 uonjZLVOT7HhaPtG0GgJB76EHDhI3O1HW306zrAvyPLcfQHyO2PW72kyCN9Reo02PAGt
 zFYK0bF4Qcd6HdmpW6c+gSOYDljiTOliGPKU0Vmph7yS2wVwYP6ZmW4AED+9jr1bnPPY
 +NkQlcCzcOBOhJzM5uF1R1QorCZ5opejVibTRxyd6GGrOGWSxbg3qW/i9N93Ko7coTzK
 Iq6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=+/p86Y+DK7SRlgsg41Io0iP7JH8+JfcvGxwgzWMIUh0=;
 b=UoaDmtRgND8kpxLyI6V/cQig4WjO48cAe7EIvnAesd2SjqSjnY4r1pEZL05BkIMUG8
 tOWYE6UNfxNDpcfIU8rDt6bHXzwDFqtfmDKd/bl/Xvw3OldZrCnG8RvYfsl5H1ODYmFS
 VV8xdx/abMBUI+HxG7aAhrKYyfHtZXbpsK6U5oLp/VWO9+bL/TW5aE27oAAtWrB62KW0
 l3YfVQdG3l0hN75Gtm7BPfGg0yWCviYjkZQcjVGUx+ezpA0V12KHQnLhz+oik0PTkJux
 32p3HMewaLRlxBgIj7hl3b7xyi0qZSu6t73vdcB8BauaGXhqrPVzdgXLGgCI0IHYx0nn
 eRoQ==
X-Gm-Message-State: APjAAAWgCQua1qal5p/xDafxYq0gV0JsRk9YylcjVi7iF/EiPeF1ywMR
 PjvuxDpe1XQXPDOlykWLbs/wWA==
X-Google-Smtp-Source: APXvYqwBVgs5+k4H+bdqXBI4VLEhD+rljxdbJRr6UnK6U1/rd0lwaMnvZXb2Px6XENj5+qGatmwmmg==
X-Received: by 2002:a25:424c:: with SMTP id p73mr7743400yba.332.1579702911938; 
 Wed, 22 Jan 2020 06:21:51 -0800 (PST)
Received: from localhost ([2620:0:1013:11:1e1:4760:6ce4:fc64])
 by smtp.gmail.com with ESMTPSA id x184sm18699418ywg.4.2020.01.22.06.21.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 22 Jan 2020 06:21:51 -0800 (PST)
Date: Wed, 22 Jan 2020 09:21:50 -0500
From: Sean Paul <sean@poorly.run>
To: Ramalingam C <ramalingam.c@intel.com>
Subject: Re: [Intel-gfx] [RFC] drm/hdcp: optimizing the srm handling
Message-ID: <20200122142150.GF25564@art_vandelay>
References: <20200121070955.26426-1-ramalingam.c@intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200121070955.26426-1-ramalingam.c@intel.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
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
Cc: intel-gfx <intel-gfx@lists.freedesktop.org>,
 Sean Paul <seanpaul@chromium.org>, dri-devel <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Jan 21, 2020 at 12:39:55PM +0530, Ramalingam C wrote:
> As we are not using the sysfs infrastructure anymore, link to it is
> removed. And global srm data and mutex to protect it are removed,
> with required handling at revocation check function.
> 

Hi Ram,
Thanks for taking this on. A few comments below..

> Yet to test hence RFC tag is added.
> 
> Signed-off-by: Ramalingam C <ramalingam.c@intel.com>
> Suggested-by: Sean Paul <seanpaul@chromium.org>
> ---
>  drivers/gpu/drm/drm_hdcp.c     | 68 ++++++++++++++--------------------
>  drivers/gpu/drm/drm_internal.h |  4 --
>  drivers/gpu/drm/drm_sysfs.c    |  2 -
>  3 files changed, 27 insertions(+), 47 deletions(-)
> 
> diff --git a/drivers/gpu/drm/drm_hdcp.c b/drivers/gpu/drm/drm_hdcp.c
> index 9191633a3c43..cc08d953eb53 100644
> --- a/drivers/gpu/drm/drm_hdcp.c
> +++ b/drivers/gpu/drm/drm_hdcp.c
> @@ -23,13 +23,10 @@
>  
>  #include "drm_internal.h"
>  
> -static struct hdcp_srm {
> +struct hdcp_srm {

struct drm_hdcp_srm

would be more consistent with the rest of the subsystem

>  	u32 revoked_ksv_cnt;
>  	u8 *revoked_ksv_list;
> -
> -	/* Mutex to protect above struct member */
> -	struct mutex mutex;
> -} *srm_data;
> +};
>  
>  static inline void drm_hdcp_print_ksv(const u8 *ksv)
>  {
> @@ -91,7 +88,8 @@ static inline u32 get_vrl_length(const u8 *buf)
>  	return drm_hdcp_be24_to_cpu(buf);
>  }
>  
> -static int drm_hdcp_parse_hdcp1_srm(const u8 *buf, size_t count)
> +static int drm_hdcp_parse_hdcp1_srm(const u8 *buf, size_t count,
> +				    struct hdcp_srm *srm_data)

Usually the drm structs are the first argument.

>  {
>  	struct hdcp_srm_header *header;
>  	u32 vrl_length, ksv_count;
> @@ -153,7 +151,8 @@ static int drm_hdcp_parse_hdcp1_srm(const u8 *buf, size_t count)
>  	return count;
>  }
>  
> -static int drm_hdcp_parse_hdcp2_srm(const u8 *buf, size_t count)
> +static int drm_hdcp_parse_hdcp2_srm(const u8 *buf, size_t count,
> +				    struct hdcp_srm *srm_data)
>  {
>  	struct hdcp_srm_header *header;
>  	u32 vrl_length, ksv_count, ksv_sz;
> @@ -226,18 +225,20 @@ static inline bool is_srm_version_hdcp2(const u8 *buf)
>  	return *buf == (u8)(DRM_HDCP_2_SRM_ID << 4 | DRM_HDCP_2_INDICATOR);
>  }
>  
> -static void drm_hdcp_srm_update(const u8 *buf, size_t count)
> +static void drm_hdcp_srm_update(const u8 *buf, size_t count,
> +				struct hdcp_srm *srm_data)
>  {
>  	if (count < sizeof(struct hdcp_srm_header))
>  		return;
>  
>  	if (is_srm_version_hdcp1(buf))
> -		drm_hdcp_parse_hdcp1_srm(buf, count);
> +		drm_hdcp_parse_hdcp1_srm(buf, count, srm_data);
>  	else if (is_srm_version_hdcp2(buf))
> -		drm_hdcp_parse_hdcp2_srm(buf, count);
> +		drm_hdcp_parse_hdcp2_srm(buf, count, srm_data);
>  }
>  
> -static void drm_hdcp_request_srm(struct drm_device *drm_dev)
> +static void drm_hdcp_request_srm(struct drm_device *drm_dev,
> +				 struct hdcp_srm *srm_data)
>  {
>  	char fw_name[36] = "display_hdcp_srm.bin";
>  	const struct firmware *fw;
> @@ -250,7 +251,7 @@ static void drm_hdcp_request_srm(struct drm_device *drm_dev)
>  		goto exit;
>  
>  	if (fw->size && fw->data)
> -		drm_hdcp_srm_update(fw->data, fw->size);
> +		drm_hdcp_srm_update(fw->data, fw->size, srm_data);
>  
>  exit:
>  	release_firmware(fw);
> @@ -284,35 +285,33 @@ static void drm_hdcp_request_srm(struct drm_device *drm_dev)
>  bool drm_hdcp_check_ksvs_revoked(struct drm_device *drm_dev, u8 *ksvs,

Unrelated nit: This function should really return int and let the caller decide what to do
with the result.

>  				 u32 ksv_count)
>  {
> -	u32 rev_ksv_cnt, cnt, i, j;
> +	struct hdcp_srm *srm_data;
>  	u8 *rev_ksv_list;
> +	bool ret = false;
> +	u32 cnt, i, j;
>  
> +	srm_data = kzalloc(sizeof(*srm_data), GFP_KERNEL);

No need to put srm_data on the heap, it's only a pointer and a u32.

>  	if (!srm_data)
> -		return false;
> +		return ret;
>  
> -	mutex_lock(&srm_data->mutex);
> -	drm_hdcp_request_srm(drm_dev);
> -
> -	rev_ksv_cnt = srm_data->revoked_ksv_cnt;
> +	drm_hdcp_request_srm(drm_dev, srm_data);
>  	rev_ksv_list = srm_data->revoked_ksv_list;
>  
>  	/* If the Revoked ksv list is empty */
> -	if (!rev_ksv_cnt || !rev_ksv_list) {
> -		mutex_unlock(&srm_data->mutex);
> -		return false;
> -	}
> +	if (!srm_data->revoked_ksv_cnt || !rev_ksv_list)

You can't have one of these true without the other, right?

I think you should just reverse the loops below and remove this condition
entirely.

> +		goto out;
>  
>  	for  (cnt = 0; cnt < ksv_count; cnt++) {
>  		rev_ksv_list = srm_data->revoked_ksv_list;
> -		for (i = 0; i < rev_ksv_cnt; i++) {
> +		for (i = 0; i < srm_data->revoked_ksv_cnt; i++) {
>  			for (j = 0; j < DRM_HDCP_KSV_LEN; j++)

Multi-line loops should have braces.

>  				if (ksvs[j] != rev_ksv_list[j]) {
>  					break;
>  				} else if (j == (DRM_HDCP_KSV_LEN - 1)) {

This can be checked outside the 'j' loop (see below). but even better would be
to replace this whole loop with a memcmp.

>  					DRM_DEBUG("Revoked KSV is ");
>  					drm_hdcp_print_ksv(ksvs);
> -					mutex_unlock(&srm_data->mutex);
> -					return true;
> +					ret = true;
> +					goto out;
>  				}
>  			/* Move the offset to next KSV in the revoked list */
>  			rev_ksv_list += DRM_HDCP_KSV_LEN;
> @@ -321,28 +320,15 @@ bool drm_hdcp_check_ksvs_revoked(struct drm_device *drm_dev, u8 *ksvs,
>  		/* Iterate to next ksv_offset */
>  		ksvs += DRM_HDCP_KSV_LEN;
>  	}
> -	mutex_unlock(&srm_data->mutex);
> -	return false;
> -}
> -EXPORT_SYMBOL_GPL(drm_hdcp_check_ksvs_revoked);
>  
> -int drm_setup_hdcp_srm(struct class *drm_class)
> -{
> -	srm_data = kzalloc(sizeof(*srm_data), GFP_KERNEL);
> -	if (!srm_data)
> -		return -ENOMEM;
> -	mutex_init(&srm_data->mutex);
> -
> -	return 0;
> -}
> -
> -void drm_teardown_hdcp_srm(struct class *drm_class)
> -{
> +out:
>  	if (srm_data) {
>  		kfree(srm_data->revoked_ksv_list);

IMO, we shouldn't be reaching into the struct to clear it. The struct is so
simple you could just pass the array and count around and get rid of it. The
alternative is adding a drm_hdcp_srm_destroy helper function to do this.

>  		kfree(srm_data);
>  	}
> +	return ret;
>  }
> +EXPORT_SYMBOL_GPL(drm_hdcp_check_ksvs_revoked);
>  
>  static struct drm_prop_enum_list drm_cp_enum_list[] = {
>  	{ DRM_MODE_CONTENT_PROTECTION_UNDESIRED, "Undesired" },
> diff --git a/drivers/gpu/drm/drm_internal.h b/drivers/gpu/drm/drm_internal.h
> index 6937bf923f05..a34c7f8373fa 100644
> --- a/drivers/gpu/drm/drm_internal.h
> +++ b/drivers/gpu/drm/drm_internal.h
> @@ -235,7 +235,3 @@ int drm_syncobj_query_ioctl(struct drm_device *dev, void *data,
>  void drm_framebuffer_print_info(struct drm_printer *p, unsigned int indent,
>  				const struct drm_framebuffer *fb);
>  int drm_framebuffer_debugfs_init(struct drm_minor *minor);
> -
> -/* drm_hdcp.c */
> -int drm_setup_hdcp_srm(struct class *drm_class);
> -void drm_teardown_hdcp_srm(struct class *drm_class);
> diff --git a/drivers/gpu/drm/drm_sysfs.c b/drivers/gpu/drm/drm_sysfs.c
> index dd2bc85f43cc..2e83c3d72af9 100644
> --- a/drivers/gpu/drm/drm_sysfs.c
> +++ b/drivers/gpu/drm/drm_sysfs.c
> @@ -85,7 +85,6 @@ int drm_sysfs_init(void)
>  	}
>  
>  	drm_class->devnode = drm_devnode;
> -	drm_setup_hdcp_srm(drm_class);
>  	return 0;
>  }
>  
> @@ -98,7 +97,6 @@ void drm_sysfs_destroy(void)
>  {
>  	if (IS_ERR_OR_NULL(drm_class))
>  		return;
> -	drm_teardown_hdcp_srm(drm_class);
>  	class_remove_file(drm_class, &class_attr_version.attr);
>  	class_destroy(drm_class);
>  	drm_class = NULL;
> -- 
> 2.20.1
> 
> _______________________________________________
> Intel-gfx mailing list
> Intel-gfx@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/intel-gfx

-- 
Sean Paul, Software Engineer, Google / Chromium OS
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
