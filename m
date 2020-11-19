Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 83F8A2B9684
	for <lists+dri-devel@lfdr.de>; Thu, 19 Nov 2020 16:44:34 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6C0F189CBC;
	Thu, 19 Nov 2020 15:44:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x444.google.com (mail-wr1-x444.google.com
 [IPv6:2a00:1450:4864:20::444])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5F4D489CBC
 for <dri-devel@lists.freedesktop.org>; Thu, 19 Nov 2020 15:44:30 +0000 (UTC)
Received: by mail-wr1-x444.google.com with SMTP id s8so6878049wrw.10
 for <dri-devel@lists.freedesktop.org>; Thu, 19 Nov 2020 07:44:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=LW9US6jv3yyovUNXbI5nnPinv07EMe28Qi0AQL7vkE0=;
 b=REa6xQAlt9aBHaKmr9e8/2+minQGwHRoZRNhaU3Fizgyfjh2wVhNmwpNLlB5sEmMxW
 XNWe5N8iB9az/DiNFL6VxY1vDDhOcYyRZPplpaeYTwkdwY/h0dTUPEtAAJAgwucU8pBf
 0eV3cRCYgV7x6OOMri+nice5WFv1FLSQspfBA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=LW9US6jv3yyovUNXbI5nnPinv07EMe28Qi0AQL7vkE0=;
 b=tvFf4VnWGN6ov+W1JvCVeDgC7pTs1luTMfTJaFRANRWwznVs4foZaz+r+fAHfsaN52
 JGsu+/77U0sa6Wcg5j0aKGC+dxrq0/u0VpB/2ODSVucB6C6hOezc5x1Yo7+eLuKylq0c
 PvIeCVvBhH7ZWZ9hq4WnbbxWqSok4lYAWKsr7Gj33citLkIbB97CgD56ys9qMX9KMd1E
 jL+Gs71e52R32D2nsv2czcfLAJapEEhtAdb34to6WnQIJ5kgVeFzGu7PWAU9kjRKe5GG
 CnfavuVzHJKgVYaK+bMH6PQGM9o46WFIWgNuUXwa65IC0XLIyGiADKvDrZkhLow+2XUx
 d1Bw==
X-Gm-Message-State: AOAM533TIhw30Ai0GHSLua/Ewvwq+UxlCJeOv5qDMixGdS9yn57lnVax
 GkZC/GIMp45HELq30S4x8CRcYA==
X-Google-Smtp-Source: ABdhPJyBXZ07aWF0A06u4ckG586otJHmkVaim3T+InJHahYhuAXV+/STxt4XN3M4C9fTAanVygufHA==
X-Received: by 2002:adf:e787:: with SMTP id n7mr11773740wrm.153.1605800669026; 
 Thu, 19 Nov 2020 07:44:29 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id k22sm366503wmi.34.2020.11.19.07.44.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 19 Nov 2020 07:44:28 -0800 (PST)
Date: Thu, 19 Nov 2020 16:44:26 +0100
From: Daniel Vetter <daniel@ffwll.ch>
To: Simon Ser <contact@emersion.fr>
Subject: Re: [PATCH] drm: improve kernel-docs in drm_mode.h
Message-ID: <20201119154426.GH401619@phenom.ffwll.local>
References: <grZIqIAOSUM7eNL0PurBsaWoILFwN2hEKd40Ylgzg@cp7-web-041.plabs.ch>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <grZIqIAOSUM7eNL0PurBsaWoILFwN2hEKd40Ylgzg@cp7-web-041.plabs.ch>
X-Operating-System: Linux phenom 5.7.0-1-amd64 
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
Cc: dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Nov 19, 2020 at 10:03:20AM +0000, Simon Ser wrote:
> - Remove duplicate doc-comments for struct members
> - Add missing @member markers for in-line member comments
> 
> Signed-off-by: Simon Ser <contact@emersion.fr>
> Cc: Daniel Vetter <daniel@ffwll.ch>

Acked-by: Daniel Vetter <daniel.vetter@ffwll.ch>

> ---
>  include/uapi/drm/drm_mode.h | 66 ++++++++++++++++++-------------------
>  1 file changed, 32 insertions(+), 34 deletions(-)
> 
> diff --git a/include/uapi/drm/drm_mode.h b/include/uapi/drm/drm_mode.h
> index 5ad10ab2a577..f29c1d37be67 100644
> --- a/include/uapi/drm/drm_mode.h
> +++ b/include/uapi/drm/drm_mode.h
> @@ -905,24 +905,23 @@ struct drm_format_modifier {
>  
>  /**
>   * struct drm_mode_create_blob - Create New block property
> - * @data: Pointer to data to copy.
> - * @length: Length of data to copy.
> - * @blob_id: new property ID.
> + *
>   * Create a new 'blob' data property, copying length bytes from data pointer,
>   * and returning new blob ID.
>   */
>  struct drm_mode_create_blob {
> -	/** Pointer to data to copy. */
> +	/** @data: Pointer to data to copy. */
>  	__u64 data;
> -	/** Length of data to copy. */
> +	/** @length: Length of data to copy. */
>  	__u32 length;
> -	/** Return: new property ID. */
> +	/** @blob_id: Return: new property ID. */
>  	__u32 blob_id;
>  };
>  
>  /**
>   * struct drm_mode_destroy_blob - Destroy user blob
>   * @blob_id: blob_id to destroy
> + *
>   * Destroy a user-created blob property.
>   *
>   * User-space can release blobs as soon as they do not need to refer to them by
> @@ -937,36 +936,32 @@ struct drm_mode_destroy_blob {
>  
>  /**
>   * struct drm_mode_create_lease - Create lease
> - * @object_ids: Pointer to array of object ids.
> - * @object_count: Number of object ids.
> - * @flags: flags for new FD.
> - * @lessee_id: unique identifier for lessee.
> - * @fd: file descriptor to new drm_master file.
> + *
>   * Lease mode resources, creating another drm_master.
>   */
>  struct drm_mode_create_lease {
> -	/** Pointer to array of object ids (__u32) */
> +	/** @object_ids: Pointer to array of object ids (__u32) */
>  	__u64 object_ids;
> -	/** Number of object ids */
> +	/** @object_count: Number of object ids */
>  	__u32 object_count;
> -	/** flags for new FD (O_CLOEXEC, etc) */
> +	/** @flags: flags for new FD (O_CLOEXEC, etc) */
>  	__u32 flags;
>  
> -	/** Return: unique identifier for lessee. */
> +	/** @lessee_id: Return: unique identifier for lessee. */
>  	__u32 lessee_id;
> -	/** Return: file descriptor to new drm_master file */
> +	/** @fd: Return: file descriptor to new drm_master file */
>  	__u32 fd;
>  };
>  
>  /**
>   * struct drm_mode_list_lessees - List lessees
> - * @count_lessees: Number of lessees.
> - * @pad: pad.
> - * @lessees_ptr: Pointer to lessess.
> - * List lesses from a drm_master
> + *
> + * List lesses from a drm_master.
>   */
>  struct drm_mode_list_lessees {
> -	/** Number of lessees.
> +	/**
> +	 * @count_lessees: Number of lessees.
> +	 *
>  	 * On input, provides length of the array.
>  	 * On output, provides total number. No
>  	 * more than the input number will be written
> @@ -974,23 +969,26 @@ struct drm_mode_list_lessees {
>  	 * the size and then the data.
>  	 */
>  	__u32 count_lessees;
> +	/** @pad: Padding. */
>  	__u32 pad;
>  
> -	/** Pointer to lessees.
> -	 * pointer to __u64 array of lessee ids
> +	/**
> +	 * @lessees_ptr: Pointer to lessees.
> +	 *
> +	 * Pointer to __u64 array of lessee ids
>  	 */
>  	__u64 lessees_ptr;
>  };
>  
>  /**
>   * struct drm_mode_get_lease - Get Lease
> - * @count_objects: Number of leased objects.
> - * @pad: pad.
> - * @objects_ptr: Pointer to objects.
> - * Get leased objects
> + *
> + * Get leased objects.
>   */
>  struct drm_mode_get_lease {
> -	/** Number of leased objects.
> +	/**
> +	 * @count_objects: Number of leased objects.
> +	 *
>  	 * On input, provides length of the array.
>  	 * On output, provides total number. No
>  	 * more than the input number will be written
> @@ -998,22 +996,22 @@ struct drm_mode_get_lease {
>  	 * the size and then the data.
>  	 */
>  	__u32 count_objects;
> +	/** @pad: Padding. */
>  	__u32 pad;
>  
> -	/** Pointer to objects.
> -	 * pointer to __u32 array of object ids
> +	/**
> +	 * @objects_ptr: Pointer to objects.
> +	 *
> +	 * Pointer to __u32 array of object ids.
>  	 */
>  	__u64 objects_ptr;
>  };
>  
>  /**
>   * struct drm_mode_revoke_lease - Revoke lease
> - * @lessee_id: Unique ID of lessee.
> - * Revoke lease
>   */
>  struct drm_mode_revoke_lease {
> -	/** Unique ID of lessee
> -	 */
> +	/** @lessee_id: Unique ID of lessee */
>  	__u32 lessee_id;
>  };
>  
> -- 
> 2.29.2
> 
> 

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
