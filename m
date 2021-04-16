Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E1443621A7
	for <lists+dri-devel@lfdr.de>; Fri, 16 Apr 2021 16:05:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E07996EA7D;
	Fri, 16 Apr 2021 14:05:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x22b.google.com (mail-oi1-x22b.google.com
 [IPv6:2607:f8b0:4864:20::22b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CFD776EB2F
 for <dri-devel@lists.freedesktop.org>; Fri, 16 Apr 2021 14:05:48 +0000 (UTC)
Received: by mail-oi1-x22b.google.com with SMTP id k25so27961247oic.4
 for <dri-devel@lists.freedesktop.org>; Fri, 16 Apr 2021 07:05:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=C+rlscYexZWyPJJB0luvYK5Jp5Lb4ntWaMwIlWDCxA8=;
 b=aqEUqE065VaA1LwsczKanpqB99xvbwu5/6XFHqu2VzFcLX9nLgtXhKEDAAh4z2Zgce
 2NHFkJMnhfweDT1DiVO+L+AjT8k8iY3oN0Cq7tSl4EYoQgh0RfsI5Q0rZb8mVZUCpv4n
 JeCWkypP+8h7Sq2WLNafD2IQbHUkcC+ISkbW8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=C+rlscYexZWyPJJB0luvYK5Jp5Lb4ntWaMwIlWDCxA8=;
 b=osTOhGmUnyAYNsuYQ7yKvJft/vd8WkXsl+DI1d/b/jvwWtDw+kQblci7T/YzXfAd5m
 kZ4v9t9Jdq+4RPCLvK8DOo8Q7q9hRrLEM0/IPt+TyyO+uZ62RxXI8+LCRV47acUinbCN
 3peXGZG/bYN2Xmy4/8Yl1tf9K/pYlkBGAKrE+ey4oLZWltIKmI0gBrrw5C3zrCs+8xLl
 dRNosVPrhND1VvWcwrP+KD+4DdTirGswm7LhcJJMpk2O6g26sppdR84P3btMT4vgguvj
 QOReRgWLxJilZ8G2JnH+MRY1b2SPPyBgRGA+KhaQE1HQda0ZWm1P8COS9/9VXtJWAtqh
 Pr5A==
X-Gm-Message-State: AOAM5315SQW0/FkdWLaFDHROeZKVLq9lVcE+cUWrXPtuF8jOOFdnGcB+
 VatIjdyCY7CWa6Z9yvCNTnRvAbLOMyqZFcCbCnZpiQ==
X-Google-Smtp-Source: ABdhPJzsyoD8rSn82Wk4RELA4g8ccBTtnaaqGRscH6DkkkViY9/e2f1QiufuNIB2MrmlFZn/9lkjcERLEypc1ghcFXY=
X-Received: by 2002:a05:6808:699:: with SMTP id
 k25mr1952151oig.101.1618581946705; 
 Fri, 16 Apr 2021 07:05:46 -0700 (PDT)
MIME-Version: 1.0
References: <20210416103718.460830-1-matthew.auld@intel.com>
 <20210416103718.460830-2-matthew.auld@intel.com>
In-Reply-To: <20210416103718.460830-2-matthew.auld@intel.com>
From: Daniel Vetter <daniel@ffwll.ch>
Date: Fri, 16 Apr 2021 16:05:35 +0200
Message-ID: <CAKMK7uHKAiw6rVbFongjDDxa-SAJXt3+LSdOaj5Pgj4vHnqQmA@mail.gmail.com>
Subject: Re: [PATCH 2/4] drm/doc: add section for driver uAPI
To: Matthew Auld <matthew.auld@intel.com>
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
Cc: Jordan Justen <jordan.l.justen@intel.com>,
 intel-gfx <intel-gfx@lists.freedesktop.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Kenneth Graunke <kenneth@whitecape.org>, Jason Ekstrand <jason@jlekstrand.net>,
 Mesa Dev <mesa-dev@lists.freedesktop.org>,
 Daniel Vetter <daniel.vetter@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Apr 16, 2021 at 12:37 PM Matthew Auld <matthew.auld@intel.com> wrote:
>
> Add section for drm/i915 uAPI and pull in i915_drm.h.
>
> Suggested-by: Daniel Vetter <daniel@ffwll.ch>
> Signed-off-by: Matthew Auld <matthew.auld@intel.com>
> Cc: Joonas Lahtinen <joonas.lahtinen@linux.intel.com>
> Cc: Jordan Justen <jordan.l.justen@intel.com>
> Cc: Daniel Vetter <daniel.vetter@intel.com>
> Cc: Kenneth Graunke <kenneth@whitecape.org>
> Cc: Jason Ekstrand <jason@jlekstrand.net>
> Cc: Dave Airlie <airlied@gmail.com>
> Cc: dri-devel@lists.freedesktop.org
> Cc: mesa-dev@lists.freedesktop.org

lgtm. Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>

> ---
>  Documentation/gpu/driver-uapi.rst | 8 ++++++++
>  Documentation/gpu/index.rst       | 1 +
>  2 files changed, 9 insertions(+)
>  create mode 100644 Documentation/gpu/driver-uapi.rst
>
> diff --git a/Documentation/gpu/driver-uapi.rst b/Documentation/gpu/driver-uapi.rst
> new file mode 100644
> index 000000000000..4411e6919a3d
> --- /dev/null
> +++ b/Documentation/gpu/driver-uapi.rst
> @@ -0,0 +1,8 @@
> +===============
> +DRM Driver uAPI
> +===============
> +
> +drm/i915 uAPI
> +=============
> +
> +.. kernel-doc:: include/uapi/drm/i915_drm.h
> diff --git a/Documentation/gpu/index.rst b/Documentation/gpu/index.rst
> index ec4bc72438e4..b9c1214d8f23 100644
> --- a/Documentation/gpu/index.rst
> +++ b/Documentation/gpu/index.rst
> @@ -10,6 +10,7 @@ Linux GPU Driver Developer's Guide
>     drm-kms
>     drm-kms-helpers
>     drm-uapi
> +   driver-uapi
>     drm-client
>     drivers
>     backlight
> --
> 2.26.3
>


-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
