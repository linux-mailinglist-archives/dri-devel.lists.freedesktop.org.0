Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D64614AB79
	for <lists+dri-devel@lfdr.de>; Mon, 27 Jan 2020 22:10:40 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 396AD6EB31;
	Mon, 27 Jan 2020 21:10:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-xb41.google.com (mail-yb1-xb41.google.com
 [IPv6:2607:f8b0:4864:20::b41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7F14B6EB3B
 for <dri-devel@lists.freedesktop.org>; Mon, 27 Jan 2020 21:10:34 +0000 (UTC)
Received: by mail-yb1-xb41.google.com with SMTP id p129so5641324ybc.13
 for <dri-devel@lists.freedesktop.org>; Mon, 27 Jan 2020 13:10:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=poorly.run; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=Vnw3Ah4JrkMvKt9fKqHBZF1O0aZJrWmh8oqC23PGxAk=;
 b=WIS2cxF2YwNjYNmRUL/huEq2SVB54heqcvQmqC0eepVwmeg+jM7LM0OdHhiCFg5roi
 jwVGtVnkhsMAJsffkWXTr9XKefwBQ1P6rFrWA+6Kca5C1vcWaSOHGrNBdr0cYOG4jpx0
 SDvz+sklRTi4yvwhoffc/ttA6Wylf6pNWU7mtIE/TOgmCjbiAT5WEDLBeEYQ4mQd2SpO
 YB+KNVvd9ynUB5rZ1Um5RZH/YIFugyM7SW3PZbEcPpWoD8biCCWevlWaZ2DHBNDHGCh3
 hM4OzzBvw+GDt9j2Ioo1hVk61UjgF6jNEWSaxSmFrvVYQl7cfBmSoe+cKf/juZs1GD9S
 b+lQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=Vnw3Ah4JrkMvKt9fKqHBZF1O0aZJrWmh8oqC23PGxAk=;
 b=BlAkr5y/+OE62X9eP4H6eKjuwD1zFxSuB1WgaeiJwJkfqY+Gq5gbGPT1lnMFCMMH/L
 n/a65yiJQXjDYHWOl60fDq5hZiD/tgsP9bFbOEJlkBev/wgMOwmF1JiqTVoi4YHLsAyW
 uxjf1N+swRgmF5qVik6dJTZCGQiKTb8C+4BCcqmaDvi2kvPPg6sECk+syDn+CULRKvyd
 21MDqBYGZlBHcRkpJLYmT2BAj6uF5KH+Ij6Xdh/ErkB6+GK6G39TJ4ROJE4q5w7nM7yj
 DUFBwJnfbBxS4UkUorPaWHt5vHsBC+jSfzAeQ8UCqbuK8ukDF1G6E/Hyx51aD6rBXVps
 00Gw==
X-Gm-Message-State: APjAAAUhsfahwxClA5Td1JrSSQ8Y3QwEUmzpbwKZY/uE0UpygJXATX5c
 Fl0xi3h6PCvr5ikn/twF3p4QcnnbdJTPEA==
X-Google-Smtp-Source: APXvYqy8szzwYqZfjlC2mVsVS0QwKrW04oHkk0ucMR40rlGdIPUz0OByfjKBmaa8Q36pZ/NLZd1uwA==
X-Received: by 2002:a25:6a83:: with SMTP id
 f125mr14646885ybc.212.1580159433444; 
 Mon, 27 Jan 2020 13:10:33 -0800 (PST)
Received: from localhost ([2620:0:1013:11:1e1:4760:6ce4:fc64])
 by smtp.gmail.com with ESMTPSA id w200sm6754894ywa.34.2020.01.27.13.10.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 27 Jan 2020 13:10:32 -0800 (PST)
Date: Mon, 27 Jan 2020 16:10:32 -0500
From: Sean Paul <sean@poorly.run>
To: Ramalingam C <ramalingam.c@intel.com>
Subject: Re: [Intel-gfx] [PATCH v2] drm/hdcp: optimizing the srm handling
Message-ID: <20200127211032.GA56834@art_vandelay>
References: <20200127181231.5380-1-ramalingam.c@intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200127181231.5380-1-ramalingam.c@intel.com>
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

On Mon, Jan 27, 2020 at 11:42:31PM +0530, Ramalingam C wrote:
> As we are not using the sysfs infrastructure anymore, link to it is
> removed. And global srm data and mutex to protect it are removed,
> with required handling at revocation check function.
> 
> v2:
>   srm_data is dropped and few more comments are addressed.
> 
> Signed-off-by: Ramalingam C <ramalingam.c@intel.com>
> Suggested-by: Sean Paul <seanpaul@chromium.org>
> ---
>  drivers/gpu/drm/drm_hdcp.c     | 144 ++++++++++++---------------------
>  drivers/gpu/drm/drm_internal.h |   4 -
>  drivers/gpu/drm/drm_sysfs.c    |   2 -
>  include/drm/drm_hdcp.h         |   4 +-
>  4 files changed, 55 insertions(+), 99 deletions(-)
> 
> diff --git a/drivers/gpu/drm/drm_hdcp.c b/drivers/gpu/drm/drm_hdcp.c
> index 9191633a3c43..30749a13108e 100644
> --- a/drivers/gpu/drm/drm_hdcp.c
> +++ b/drivers/gpu/drm/drm_hdcp.c
> @@ -23,14 +23,6 @@
>  
>  #include "drm_internal.h"
>  
> -static struct hdcp_srm {
> -	u32 revoked_ksv_cnt;
> -	u8 *revoked_ksv_list;
> -
> -	/* Mutex to protect above struct member */
> -	struct mutex mutex;
> -} *srm_data;
> -
>  static inline void drm_hdcp_print_ksv(const u8 *ksv)
>  {
>  	DRM_DEBUG("\t%#02x, %#02x, %#02x, %#02x, %#02x\n",
> @@ -91,7 +83,8 @@ static inline u32 get_vrl_length(const u8 *buf)
>  	return drm_hdcp_be24_to_cpu(buf);
>  }
>  
> -static int drm_hdcp_parse_hdcp1_srm(const u8 *buf, size_t count)
> +static int drm_hdcp_parse_hdcp1_srm(const u8 *buf, size_t count,
> +				    u8 *revoked_ksv_list, u32 *revoked_ksv_cnt)

Shouldn't this be u8 **revoked_ksv_list since you want to return the pointer for
use in the caller?  I'm surprised any of this worked when you tested it...

>  {
>  	struct hdcp_srm_header *header;
>  	u32 vrl_length, ksv_count;
> @@ -131,29 +124,28 @@ static int drm_hdcp_parse_hdcp1_srm(const u8 *buf, size_t count)
>  	ksv_count = drm_hdcp_get_revoked_ksv_count(buf, vrl_length);
>  	if (!ksv_count) {
>  		DRM_DEBUG("Revoked KSV count is 0\n");
> -		return count;
> +		return 0;
>  	}
>  
> -	kfree(srm_data->revoked_ksv_list);
> -	srm_data->revoked_ksv_list = kcalloc(ksv_count, DRM_HDCP_KSV_LEN,
> -					     GFP_KERNEL);
> -	if (!srm_data->revoked_ksv_list) {
> +	revoked_ksv_list = kcalloc(ksv_count, DRM_HDCP_KSV_LEN, GFP_KERNEL);
> +	if (!revoked_ksv_list) {
>  		DRM_ERROR("Out of Memory\n");
>  		return -ENOMEM;
>  	}
>  
> -	if (drm_hdcp_get_revoked_ksvs(buf, srm_data->revoked_ksv_list,
> +	if (drm_hdcp_get_revoked_ksvs(buf, revoked_ksv_list,
>  				      vrl_length) != ksv_count) {
> -		srm_data->revoked_ksv_cnt = 0;
> -		kfree(srm_data->revoked_ksv_list);
> +		*revoked_ksv_cnt = 0;
> +		kfree(revoked_ksv_list);
>  		return -EINVAL;
>  	}
>  
> -	srm_data->revoked_ksv_cnt = ksv_count;
> -	return count;
> +	*revoked_ksv_cnt = ksv_count;
> +	return 0;
>  }
>  
> -static int drm_hdcp_parse_hdcp2_srm(const u8 *buf, size_t count)
> +static int drm_hdcp_parse_hdcp2_srm(const u8 *buf, size_t count,
> +				    u8 *revoked_ksv_list, u32 *revoked_ksv_cnt)

Same comment here, this should be u8 **

>  {
>  	struct hdcp_srm_header *header;
>  	u32 vrl_length, ksv_count, ksv_sz;
> @@ -195,13 +187,11 @@ static int drm_hdcp_parse_hdcp2_srm(const u8 *buf, size_t count)
>  	ksv_count = (*buf << 2) | DRM_HDCP_2_KSV_COUNT_2_LSBITS(*(buf + 1));
>  	if (!ksv_count) {
>  		DRM_DEBUG("Revoked KSV count is 0\n");
> -		return count;
> +		return 0;
>  	}
>  
> -	kfree(srm_data->revoked_ksv_list);
> -	srm_data->revoked_ksv_list = kcalloc(ksv_count, DRM_HDCP_KSV_LEN,
> -					     GFP_KERNEL);
> -	if (!srm_data->revoked_ksv_list) {
> +	revoked_ksv_list = kcalloc(ksv_count, DRM_HDCP_KSV_LEN, GFP_KERNEL);
> +	if (!revoked_ksv_list) {
>  		DRM_ERROR("Out of Memory\n");
>  		return -ENOMEM;
>  	}
> @@ -210,10 +200,10 @@ static int drm_hdcp_parse_hdcp2_srm(const u8 *buf, size_t count)
>  	buf += DRM_HDCP_2_NO_OF_DEV_PLUS_RESERVED_SZ;
>  
>  	DRM_DEBUG("Revoked KSVs: %d\n", ksv_count);
> -	memcpy(srm_data->revoked_ksv_list, buf, ksv_sz);
> +	memcpy(revoked_ksv_list, buf, ksv_sz);
>  
> -	srm_data->revoked_ksv_cnt = ksv_count;
> -	return count;
> +	*revoked_ksv_cnt = ksv_count;
> +	return 0;
>  }
>  
>  static inline bool is_srm_version_hdcp1(const u8 *buf)
> @@ -226,18 +216,22 @@ static inline bool is_srm_version_hdcp2(const u8 *buf)
>  	return *buf == (u8)(DRM_HDCP_2_SRM_ID << 4 | DRM_HDCP_2_INDICATOR);
>  }
>  
> -static void drm_hdcp_srm_update(const u8 *buf, size_t count)
> +static void drm_hdcp_srm_update(const u8 *buf, size_t count,
> +				u8 *revoked_ksv_list, u32 *revoked_ksv_cnt)

and here

>  {
>  	if (count < sizeof(struct hdcp_srm_header))
>  		return;
>  
>  	if (is_srm_version_hdcp1(buf))
> -		drm_hdcp_parse_hdcp1_srm(buf, count);
> +		drm_hdcp_parse_hdcp1_srm(buf, count, revoked_ksv_list,
> +					 revoked_ksv_cnt);
>  	else if (is_srm_version_hdcp2(buf))
> -		drm_hdcp_parse_hdcp2_srm(buf, count);
> +		drm_hdcp_parse_hdcp2_srm(buf, count, revoked_ksv_list,
> +					 revoked_ksv_cnt);
>  }
>  
> -static void drm_hdcp_request_srm(struct drm_device *drm_dev)
> +static void drm_hdcp_request_srm(struct drm_device *drm_dev,
> +				 u8 *revoked_ksv_list, u32 *revoked_ksv_cnt)

and here

>  {
>  	char fw_name[36] = "display_hdcp_srm.bin";
>  	const struct firmware *fw;
> @@ -250,7 +244,8 @@ static void drm_hdcp_request_srm(struct drm_device *drm_dev)
>  		goto exit;
>  
>  	if (fw->size && fw->data)
> -		drm_hdcp_srm_update(fw->data, fw->size);
> +		drm_hdcp_srm_update(fw->data, fw->size, revoked_ksv_list,
> +				    revoked_ksv_cnt);
>  
>  exit:
>  	release_firmware(fw);
> @@ -279,70 +274,37 @@ static void drm_hdcp_request_srm(struct drm_device *drm_dev)
>   * https://www.digital-cp.com/sites/default/files/specifications/HDCP%20on%20HDMI%20Specification%20Rev2_2_Final1.pdf
>   *
>   * Returns:
> - * TRUE on any of the KSV is revoked, else FALSE.
> + * Count of the revoked KSVs.

What about on error?

>   */
> -bool drm_hdcp_check_ksvs_revoked(struct drm_device *drm_dev, u8 *ksvs,
> -				 u32 ksv_count)
> +int drm_hdcp_check_ksvs_revoked(struct drm_device *drm_dev, u8 *ksvs_in,
> +				u32 ksv_count)
>  {
> -	u32 rev_ksv_cnt, cnt, i, j;
> -	u8 *rev_ksv_list;
> -
> -	if (!srm_data)
> -		return false;
> -
> -	mutex_lock(&srm_data->mutex);
> -	drm_hdcp_request_srm(drm_dev);
> -
> -	rev_ksv_cnt = srm_data->revoked_ksv_cnt;
> -	rev_ksv_list = srm_data->revoked_ksv_list;
> -
> -	/* If the Revoked ksv list is empty */
> -	if (!rev_ksv_cnt || !rev_ksv_list) {
> -		mutex_unlock(&srm_data->mutex);
> -		return false;
> -	}
> -
> -	for  (cnt = 0; cnt < ksv_count; cnt++) {
> -		rev_ksv_list = srm_data->revoked_ksv_list;
> -		for (i = 0; i < rev_ksv_cnt; i++) {
> -			for (j = 0; j < DRM_HDCP_KSV_LEN; j++)
> -				if (ksvs[j] != rev_ksv_list[j]) {
> -					break;
> -				} else if (j == (DRM_HDCP_KSV_LEN - 1)) {
> -					DRM_DEBUG("Revoked KSV is ");
> -					drm_hdcp_print_ksv(ksvs);
> -					mutex_unlock(&srm_data->mutex);
> -					return true;
> -				}
> -			/* Move the offset to next KSV in the revoked list */
> -			rev_ksv_list += DRM_HDCP_KSV_LEN;
> +	u8 *revoked_ksv_list = NULL, *ksvs, *list_itr;

Where is revoked_ksv_list freed?

> +	u32 revoked_ksv_cnt = 0, i, j;
> +	int ret = 0;
> +
> +	drm_hdcp_request_srm(drm_dev, revoked_ksv_list, &revoked_ksv_cnt);

This can't fail?

> +	list_itr = revoked_ksv_list;
> +
> +	for (i = 0; i < revoked_ksv_cnt; i++) {
> +		ksvs = ksvs_in;
> +		for  (j = 0; j < ksv_count; j++) {


You can save yourself the iterators if you just generate the offsets like:

        for (i = 0; i < revoked_ksv_cnt; i++) {
                u8 *a = &ksvs_in[j * DRM_HDCP_KSV_LEN];
                for  (j = 0; j < ksv_count; j++) {
                        u8 *b = &revoked_ksv_list[i * DRM_HDCP_KSV_LEN];

                        if (!memcmp(a, b, DRM_HDCP_KSV_LEN)) {
                                ...
                        }




> +			if (!memcmp(ksvs, list_itr, DRM_HDCP_KSV_LEN)) {
> +				DRM_DEBUG("Revoked KSV is ");
> +				drm_hdcp_print_ksv(ksvs);
> +				ret++;
> +			}
> +			/* Iterate to next ksv_offset */
> +			ksvs += DRM_HDCP_KSV_LEN;
>  		}
> -
> -		/* Iterate to next ksv_offset */
> -		ksvs += DRM_HDCP_KSV_LEN;
> +		/* Move the offset to next KSV in the revoked list */
> +		list_itr += DRM_HDCP_KSV_LEN;
>  	}
> -	mutex_unlock(&srm_data->mutex);
> -	return false;
> -}
> -EXPORT_SYMBOL_GPL(drm_hdcp_check_ksvs_revoked);
> -
> -int drm_setup_hdcp_srm(struct class *drm_class)
> -{
> -	srm_data = kzalloc(sizeof(*srm_data), GFP_KERNEL);
> -	if (!srm_data)
> -		return -ENOMEM;
> -	mutex_init(&srm_data->mutex);
>  
> -	return 0;
> -}
> -
> -void drm_teardown_hdcp_srm(struct class *drm_class)
> -{
> -	if (srm_data) {
> -		kfree(srm_data->revoked_ksv_list);
> -		kfree(srm_data);
> -	}
> +	kfree(revoked_ksv_list);
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
> diff --git a/include/drm/drm_hdcp.h b/include/drm/drm_hdcp.h
> index 06a11202a097..d512089b873f 100644
> --- a/include/drm/drm_hdcp.h
> +++ b/include/drm/drm_hdcp.h
> @@ -288,8 +288,8 @@ struct hdcp_srm_header {
>  struct drm_device;
>  struct drm_connector;
>  
> -bool drm_hdcp_check_ksvs_revoked(struct drm_device *dev,
> -				 u8 *ksvs, u32 ksv_count);
> +int drm_hdcp_check_ksvs_revoked(struct drm_device *dev,
> +				u8 *ksvs, u32 ksv_count);
>  int drm_connector_attach_content_protection_property(
>  		struct drm_connector *connector, bool hdcp_content_type);
>  void drm_hdcp_update_content_protection(struct drm_connector *connector,
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
