Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CCD2C2A7AD3
	for <lists+dri-devel@lfdr.de>; Thu,  5 Nov 2020 10:43:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 166F16E1BC;
	Thu,  5 Nov 2020 09:43:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com
 [IPv6:2a00:1450:4864:20::443])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A928C6E1BC
 for <dri-devel@lists.freedesktop.org>; Thu,  5 Nov 2020 09:43:12 +0000 (UTC)
Received: by mail-wr1-x443.google.com with SMTP id y12so939994wrp.6
 for <dri-devel@lists.freedesktop.org>; Thu, 05 Nov 2020 01:43:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=umt3jz7XvqnLKblRD57fg7k5CbpHUOGpmAmalMgljt8=;
 b=Ih+nDylFGMjHq84eK7Rq9s+Z2tyNqAr7ZxdVjnA5XHGw90B5AgJ8ZKL7j863EbjF8N
 tszUj4XXa6G/DClYyE+fJIZhleQWAnyCcY8NmxPXtkV4Ctdg5svH7pAVwCk1C4zjnQd/
 FFEJbXF2ledzRjhZZYNJRsRH1CPkmfAHNExOM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=umt3jz7XvqnLKblRD57fg7k5CbpHUOGpmAmalMgljt8=;
 b=ZNamvsQDNHB2pynp1jeue+bIujL3Sye3zwg9nKL64mII7CwAXTQlZVG7xoFGGKHEdY
 y7JpM0JztO0WDIAszFUHHStvvk12Vap56aCt3i91vZmWujlzMfRStdxVnEnxN4h8tqGO
 Fpw8CMyxKyPrFggYIrQLGpYZVKVffcsV+6qeZ7i3galjX+ACD3XBNwO2hDfhSh5WzpFE
 0z3+6Fpcg8t2AasjGE9kyZeZ+kO+H/f4rMc56K16UTVHxHDZw/6+Gazmf7+Gmo+f/oIV
 k4xva7L9XbG1+eRe7Iiv+opu2rg+g6/yerUZZv8dni607sDdEnjm9irWsx7/kbo7p8a7
 QYGg==
X-Gm-Message-State: AOAM531GJadHjDa2roK68edxkjS1ceyzA5RLrf+cGEdmW00w0fh/si4b
 JDrZbw2XKM4757HxnRhdEQAqNQ==
X-Google-Smtp-Source: ABdhPJyTOlna4fpmBl8kEs7svYnCj6NSnfvD8ATZ3TURBY/iWQvM1HLgRCIloCMgE/qDCtdyEF2JAg==
X-Received: by 2002:adf:a29e:: with SMTP id s30mr1972486wra.29.1604569391403; 
 Thu, 05 Nov 2020 01:43:11 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id l124sm1712004wml.48.2020.11.05.01.43.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 05 Nov 2020 01:43:10 -0800 (PST)
Date: Thu, 5 Nov 2020 10:43:09 +0100
From: Daniel Vetter <daniel@ffwll.ch>
To: Simon Ser <contact@emersion.fr>
Subject: Re: [PATCH v2] drm: document that blobs are ref'counted
Message-ID: <20201105094309.GU401619@phenom.ffwll.local>
References: <wgav99DTGfubfVPiurrydQEiyufYpxlJQZ0wJMWYBQ@cp7-web-042.plabs.ch>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <wgav99DTGfubfVPiurrydQEiyufYpxlJQZ0wJMWYBQ@cp7-web-042.plabs.ch>
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
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Nov 04, 2020 at 05:01:40PM +0000, Simon Ser wrote:
> User-space doesn't need to keep track of blobs that might be in use by
> the kernel. User-space can just destroy blobs as soon as they don't need
> them anymore.
> =

> Signed-off-by: Simon Ser <contact@emersion.fr>
> Signed-off-by: Daniel Stone <daniel@fooishbar.org>
> Reviewed-by: Jonas =C5dahl <jadahl@gmail.com>
> Cc: Pekka Paalanen <ppaalanen@gmail.com>
> Cc: Daniel Vetter <daniel@ffwll.ch>

Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>

> ---
>  include/uapi/drm/drm_mode.h | 6 ++++++
>  1 file changed, 6 insertions(+)
> =

> diff --git a/include/uapi/drm/drm_mode.h b/include/uapi/drm/drm_mode.h
> index 863eda048265..5ad10ab2a577 100644
> --- a/include/uapi/drm/drm_mode.h
> +++ b/include/uapi/drm/drm_mode.h
> @@ -924,6 +924,12 @@ struct drm_mode_create_blob {
>   * struct drm_mode_destroy_blob - Destroy user blob
>   * @blob_id: blob_id to destroy
>   * Destroy a user-created blob property.
> + *
> + * User-space can release blobs as soon as they do not need to refer to =
them by
> + * their blob object ID.  For instance, if you are using a MODE_ID blob =
in an
> + * atomic commit and you will not make another commit re-using the same =
ID, you
> + * can destroy the blob as soon as the commit has been issued, without w=
aiting
> + * for it to complete.
>   */
>  struct drm_mode_destroy_blob {
>  	__u32 blob_id;
> -- =

> 2.29.2
> =

> =


-- =

Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
