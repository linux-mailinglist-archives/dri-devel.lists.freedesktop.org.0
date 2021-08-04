Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 83EDE3E084E
	for <lists+dri-devel@lfdr.de>; Wed,  4 Aug 2021 20:50:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2B5EF6E434;
	Wed,  4 Aug 2021 18:50:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-xb32.google.com (mail-yb1-xb32.google.com
 [IPv6:2607:f8b0:4864:20::b32])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 90AD86EA51
 for <dri-devel@lists.freedesktop.org>; Wed,  4 Aug 2021 18:50:31 +0000 (UTC)
Received: by mail-yb1-xb32.google.com with SMTP id z18so5258817ybg.8
 for <dri-devel@lists.freedesktop.org>; Wed, 04 Aug 2021 11:50:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=jlekstrand-net.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=nnWPot3vtcxM+9mBkA7EsLftdmsLwvJ1NJsdykuuxGY=;
 b=uiaUlBAODW2LsdZ3Das8opfzcsFXHXT0aiqTsE1jy0GbpjTOpXlkCUo8j3srr0Gg+X
 v6ItYg8A01ue7CDk7mhvUH5dWmYOYgNmTHITArg38e4x5m3Z2MCXkKtbsfuouIFkbrbU
 af7RQGorc3zh693tTD3F6Uj6s8etNzyuHOOkDFDUMD+thRYETVuryI+3godtzKL/przV
 b3W1+nuIDItd2vp/du4JH/sTfrQbnkYXexZaDeqhH1uBqdRDVk10Q/mKvmJtcr9b1hrJ
 +VSULxicCZ4E2qLq9CZt/vfSM+u0SkSvjaRnwr7DYIoO1oQUztLPGm7lWtRB0JB5U4F3
 GwyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=nnWPot3vtcxM+9mBkA7EsLftdmsLwvJ1NJsdykuuxGY=;
 b=csREVSBMWLl4KH50aIDL/W58Xu1R1aoWZu4Kmmkt4wBde4C5SuAuatYbJ4g+zcXwat
 oG8gzixj5Xkof+wGF/1CHVN4x6YKxks5JkyRRRrljHwm6EwNimXPXIljZhGK89OHqiVu
 8ryeH+qrM3o6AhruLx/lT/IwT8RTcwK2VXeWz6+Rzbfm3MglpbuxExNio/NWlr5QryR0
 z8oDRWiTjSRTI4WPRkZO2qSA//U0rh7nBln2H+Fhs9GwwTmwNzkvd/lX2UgNmI2b7cW7
 crTuIkp0LX8okUKGqSOaNK0xWzDL4K1mKxJFOArDwSFK4Ie6kQq1uBVUO1v5+BeFwWLo
 GEHQ==
X-Gm-Message-State: AOAM532GSVVEszL+O98XV8DC+L6ebLiHJJQMnIieLyNsc6l2TiOUYw6s
 u1Jv/CL89kx3ReM9jyiDl7nKr7BOMb8iG0mtgYePLPzg9FSrlg6H
X-Google-Smtp-Source: ABdhPJw4rK+q4pHtmoD5OLSWFeSRg6rVOeYKUJj/H9vaGBvtTJpcIslQYnjo6kFBabrIHH8bIWLNihGcqjPDbcNzWqk=
X-Received: by 2002:a25:ced0:: with SMTP id x199mr962088ybe.323.1628103030377; 
 Wed, 04 Aug 2021 11:50:30 -0700 (PDT)
MIME-Version: 1.0
References: <20210804184816.623950-1-jason@jlekstrand.net>
In-Reply-To: <20210804184816.623950-1-jason@jlekstrand.net>
From: Jason Ekstrand <jason@jlekstrand.net>
Date: Wed, 4 Aug 2021 13:50:19 -0500
Message-ID: <CAOFGe97sfQn_g5c8wTKEt8g+EWK+w9ktzUTrPGs1LY9sJP_i=Q@mail.gmail.com>
Subject: Re: [PATCH] docs/drm: Add a new bullet to the uAPI requirements
To: Maling list - DRI developers <dri-devel@lists.freedesktop.org>
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>, Dave Airlie <airlied@redhat.com>
Content-Type: text/plain; charset="UTF-8"
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

On Wed, Aug 4, 2021 at 1:48 PM Jason Ekstrand <jason@jlekstrand.net> wrote:
>
> While tracking down various bits of i915 uAPI, it's been difficult to
> find the userspace much of the time because no one bothers to mention it
> in commit messages.  Require the kernel patch to be a one-stop shop for
> finding the various bits which were used to justify the new uAPI.
>
> Signed-off-by: Jason Ekstrand <jason@jlekstrand.net>
> Cc: Daniel Vetter <daniel.vetter@ffwll.ch>
> Cc: Dave Airlie <airlied@redhat.com>
> ---
>  Documentation/gpu/drm-uapi.rst | 5 +++++
>  1 file changed, 5 insertions(+)
>
> diff --git a/Documentation/gpu/drm-uapi.rst b/Documentation/gpu/drm-uapi.rst
> index 199afb503ab1..82f780bc3fce 100644
> --- a/Documentation/gpu/drm-uapi.rst
> +++ b/Documentation/gpu/drm-uapi.rst
> @@ -109,6 +109,11 @@ leads to a few additional requirements:
>    userspace patches land. uAPI always flows from the kernel, doing things the
>    other way round risks divergence of the uAPI definitions and header files.
>
> +- The kernel patch which adds the new uAPI **must** reference the patch series
> +  or merge requests in the userspaces project which use the new uAPI and

Locally, I've done s/project which use/projects which demonstrate/

--Jason

> +  against which the review was done so that future developers can find all of
> +  the pieces which tie together.
> +
>  These are fairly steep requirements, but have grown out from years of shared
>  pain and experience with uAPI added hastily, and almost always regretted about
>  just as fast. GFX devices change really fast, requiring a paradigm shift and
> --
> 2.31.1
>
