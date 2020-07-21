Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C2C5F227BBE
	for <lists+dri-devel@lfdr.de>; Tue, 21 Jul 2020 11:30:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CA6D788EF2;
	Tue, 21 Jul 2020 09:30:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com
 [IPv6:2a00:1450:4864:20::443])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BA47488EF2
 for <dri-devel@lists.freedesktop.org>; Tue, 21 Jul 2020 09:30:10 +0000 (UTC)
Received: by mail-wr1-x443.google.com with SMTP id a14so5628682wra.5
 for <dri-devel@lists.freedesktop.org>; Tue, 21 Jul 2020 02:30:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=p+/SheO24iF1AKhD/tlcF2i42kPeW4qURoV8olVTlxY=;
 b=kegZTnZhKIXYZO40+zm//B5i5FuH/4RbArAxFqtQMACp7KK6u4Y52AQqZ7M+ViC8Vs
 x6pAmN7T3+NjBo+eEQsaT5tq/rGe6LXbJm51fEfQh+dfXDaJdqvtbXqQx5JmZyjG62Wc
 qSF/MIJfPd8h2wt4kyEhM+I78VnKvwQdabSa8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=p+/SheO24iF1AKhD/tlcF2i42kPeW4qURoV8olVTlxY=;
 b=cwet7cumEoaT1ztzYnx1ESve99LNxgx7l0OwrABhJF92R5/RcfgacYybt34/4tBNvR
 sfQfXPhMoqPGGkq4Y27w0HLyBl+vm0PtPb/zsbmSQLs/m8bl2te974q1P67fwNzsWPfD
 xLNBlgT6otRVdiS9+suJNhYRy1dWGpE9wdXXZQKNP4kfy/95XnaglpYjTg5BUJ+nC3T0
 uOR6YexUyuxd0+Xnvu/MxPbdmMHMaZlcRh8tsKGIGGb1azovgaqCzffrk5Tfa0h3inUc
 2FxOtmiv1she6+8RV3OmRf8F/sXq0HbxJDopz1AlZtTzZXOzxVNzPqOlA5+hw8/Acfrs
 2ccA==
X-Gm-Message-State: AOAM5324wQZMRoL692omXN+y0BLCgn02oSs25enOPmJrP94He3ezqzSc
 8kJoP7R6zjXWBoQwUtk6ZOMvaoFASHk=
X-Google-Smtp-Source: ABdhPJxN5Uq4lCsM+/B7Wi3eUOdhd0ZM4i3nJGHJGvMyc96OsPF73sLPYPYRAgIJ0d1OiWgKmbtkrA==
X-Received: by 2002:adf:ea0f:: with SMTP id q15mr25418808wrm.113.1595323809420; 
 Tue, 21 Jul 2020 02:30:09 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id 78sm2747442wma.31.2020.07.21.02.30.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 21 Jul 2020 02:30:08 -0700 (PDT)
Date: Tue, 21 Jul 2020 11:30:07 +0200
From: daniel@ffwll.ch
To: 
Subject: Re: [PATCH 11/11] drm/ttm: remove TTM_MEMTYPE_FLAG_MAPPABLE
Message-ID: <20200721093007.GJ6419@phenom.ffwll.local>
References: <20200721073245.2484-1-christian.koenig@amd.com>
 <20200721073245.2484-11-christian.koenig@amd.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200721073245.2484-11-christian.koenig@amd.com>
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
Cc: Madhav.Chauhan@amd.com, michael.j.ruhl@intel.com, tzimmermann@suse.de,
 dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Jul 21, 2020 at 09:32:45AM +0200, Christian K=F6nig wrote:
> Not used any more. And it is bad design to use a TTM flag
> to do a check inside a driver.
> =

> Signed-off-by: Christian K=F6nig <christian.koenig@amd.com>
> ---
>  include/drm/ttm/ttm_bo_driver.h | 1 -
>  1 file changed, 1 deletion(-)
> =

> diff --git a/include/drm/ttm/ttm_bo_driver.h b/include/drm/ttm/ttm_bo_dri=
ver.h
> index 71b195e78c7c..9b251853afe2 100644
> --- a/include/drm/ttm/ttm_bo_driver.h
> +++ b/include/drm/ttm/ttm_bo_driver.h
> @@ -46,7 +46,6 @@
>  #define TTM_MAX_BO_PRIORITY	4U
>  =

>  #define TTM_MEMTYPE_FLAG_FIXED         (1 << 0)	/* Fixed (on-card) PCI m=
emory */
> -#define TTM_MEMTYPE_FLAG_MAPPABLE      (1 << 1)	/* Memory mappable */

I think you can still do this, and it makes sense to delete: Just code a
driver-specific check in the io callback which checks whether a buffer can
be mappable directly, instead of going through the indirection of using
this flag.
-Daniel
-- =

Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
