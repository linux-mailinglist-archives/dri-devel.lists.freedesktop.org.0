Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F397E358208
	for <lists+dri-devel@lfdr.de>; Thu,  8 Apr 2021 13:35:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 14D4F6EAA1;
	Thu,  8 Apr 2021 11:35:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com
 [IPv6:2a00:1450:4864:20::429])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 171356EAA1
 for <dri-devel@lists.freedesktop.org>; Thu,  8 Apr 2021 11:35:12 +0000 (UTC)
Received: by mail-wr1-x429.google.com with SMTP id f6so1747566wrv.12
 for <dri-devel@lists.freedesktop.org>; Thu, 08 Apr 2021 04:35:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=QLAU4HrAhq88O5gH9vaZbwbEe2kQ+tQ8lC0ZCmQitYI=;
 b=VO5TJFaCotVJjDZGdZEJQqvBYXzGEJKZfjd8vXTTMaqyCRs0zSLylE/mygNimVZzwj
 uW7nOJWhx4gfZJYuwebLUY9dYrzk8R46CFLfAshvZcAjoa2uQ65mELBvezsOPxbyWSFg
 vUsBGQn6dhH+pyCDdZXggwDJjuYGwEsRWqDBk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=QLAU4HrAhq88O5gH9vaZbwbEe2kQ+tQ8lC0ZCmQitYI=;
 b=mgA3tlA9qObDIj8WnPwJP/GvAQgVNa/Puh7hX46Qru0gvo1EuMtxzN8kY3JhJ9EEW+
 k1eqqn1idLBd1BrUn0LqmilVh4xpipQo888ReKqPJl9ibN5kigaV0GDOx7r4K3Aa5jUd
 xEYNgtEBoR0PG6oApdnzMz+99lPBF/+hMv6fAK2iTPCFAstCLq1iRsolPMojVfc1O6IM
 QP7mlGlCmoh3Okce4qsn9BBSG7K7kgv/Je/6GzDMZx/FsVytsQ40QMkD7tiOtp9xDMOb
 +cX3+ur5k5fpEbDn9mG3zgR0R+y4YTxdLwH2cq7bzdBbhoymKYtDMLkGx302OYlh3MvI
 wpXg==
X-Gm-Message-State: AOAM533x4iauLHjxG0p9SfsAIoEJScLKs7E+aesr/Qk8JdSYV5KBTi5o
 PtdfpW3EB2UeIPBHC3LAc3+w2jRdSjWRgQ==
X-Google-Smtp-Source: ABdhPJyzbyG3AMlF3FMOetzBW8bWjpXBKNbmwhGeqcjIUuo3S22eYPuwRpJU8bVi80JuUBWFd0dzRA==
X-Received: by 2002:a05:6000:251:: with SMTP id
 m17mr10727760wrz.171.1617881710731; 
 Thu, 08 Apr 2021 04:35:10 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id u9sm11258432wmq.30.2021.04.08.04.35.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 08 Apr 2021 04:35:09 -0700 (PDT)
Date: Thu, 8 Apr 2021 13:35:08 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Leandro Ribeiro <leandro.ribeiro@collabora.com>
Subject: Re: [PATCH 0/2] Document how userspace should use plane format list
 and IN_FORMATS
Message-ID: <YG7qbA3KthIUXhDn@phenom.ffwll.local>
References: <20210406192118.12313-1-leandro.ribeiro@collabora.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210406192118.12313-1-leandro.ribeiro@collabora.com>
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
Cc: airlied@linux.ie, dri-devel@lists.freedesktop.org,
 pekka.paalanen@collabora.co.uk, kernel@collabora.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Apr 06, 2021 at 04:21:16PM -0300, Leandro Ribeiro wrote:
> This patch is to emphasize how userspace should use the plane format list and
> the IN_FORMATS blob. The plane format list contains the formats that do not
> require modifiers, and the blob property has the formats that support
> modifiers.

Uh this is a very strong statement that I don't think is supported by
kernel driver code. Where is this from.

> Note that these are not disjoint sets. If a format supports modifiers but the
> driver can also handle it without a modifier, it should be present in both the
> IN_FORMATS blob property and the plane format list.

Same here ...

I thought these two lists are 100% consistent. If not sounds like driver
bugs that we need to maybe validate in drm_plane_init.

> This is important for userspace, as there are situations in which we need to
> find out if the KMS driver can handle a certain format without any modifiers.

I don't think you can rely on this. No modifiers means implicit modifier,
and the only thing that can give you such buffers is defacto mesa
userspace drivers (since that all depends upon driver private magic, with
maybe some kernel metadata passed around in private ioctls on the render
node).

Maybe for more context, what's the problem you've hit and trying to
clarify here?
-Daniel

> 
> Leandro Ribeiro (2):
>   drm/doc: document drm_mode_get_plane
>   drm/doc: emphasize difference between plane formats and IN_FORMATS
>     blob
> 
>  drivers/gpu/drm/drm_plane.c |  4 ++++
>  include/uapi/drm/drm_mode.h | 22 ++++++++++++++++++++++
>  2 files changed, 26 insertions(+)
> 
> -- 
> 2.31.1
> 

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
