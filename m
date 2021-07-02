Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2308D3BA12B
	for <lists+dri-devel@lfdr.de>; Fri,  2 Jul 2021 15:22:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 96C066E16F;
	Fri,  2 Jul 2021 13:22:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-x82d.google.com (mail-qt1-x82d.google.com
 [IPv6:2607:f8b0:4864:20::82d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0C2A06E16F;
 Fri,  2 Jul 2021 13:22:12 +0000 (UTC)
Received: by mail-qt1-x82d.google.com with SMTP id g12so6558129qtb.2;
 Fri, 02 Jul 2021 06:22:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=Mv4J5ys30flflh2mN4ouLTrG+fC9KjOKtKl2MgOZP7k=;
 b=aHlgSvHtbsWbQUbthyuKCOzCBbdub0GZz3JTB5QWk6s7di+wEXBwWmrvvXbcgEsixx
 aoW47sITiPWMQwWrB3n9tZEyfyr69Xn2QT5ibdiCPTVCAp3x5n+4tZc4CbbwWeymVD0z
 DPQXLqkw2qedDhWJ/eE/H8UnprdwBfUduq7R8LQnu3RGn2z7HFQ5/JoDhGDRTJhDUI3Y
 Yg/pchWniMRtmeLjG/DpvwevJlbSMm5jx4HA9SbSxlir9CjqArQLzOjSMpRtogEnpIEj
 EuqJ/PzJDMbmVMSqmTIVdoYNDm4siJmF5ySMFDFw+3zMgS1hOcwt2w8pdwmNto6OkX1h
 6sDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=Mv4J5ys30flflh2mN4ouLTrG+fC9KjOKtKl2MgOZP7k=;
 b=gK/OcFq4l8EpGvD3jhaI4x32dwbBs7v/6aBkpof5c6iH1eX5u1jHrdt2d5FCRMKhRw
 NXYxJm7f2+ZtDRlnnRQhVIHmY6BkAlwWwRroTgw7Q/kU+75UFUPv594LRAw7OoCvxVWg
 mfUeUmLl30TuChv2HSf3M34ZID7gBkyjc3R2gxtn3ykF7/zaGoN4VQu63DLHZSdCuQVQ
 ol7SnKhnRlvGMKfhQYl4rh9Cv8/P7wwGrggDv1gzUfWgBe6BTgfFgoqNi62bnjvSlieA
 B9A6M7GGjdybeGtlLX2vYvMPbadRXlvIR6D5wT2sZAwvCeyicYC5s01pOTxzX4y8akG8
 0M5w==
X-Gm-Message-State: AOAM532Q/Qly2gz+nEuCpYxcHQ807BaMUFkFQ9XjWlwyJGv0gc5KBLNf
 WFcu2ich3mW/LzdESGSsn9ANZXjoQYrPE5JsWAHlrFzxl7SS1g==
X-Google-Smtp-Source: ABdhPJwdQ1WbiOGCCmfH0VCB1c//Ptzt0p0kc112cythdINB9yMhPqP+3C0qVtt3ccQPVBC8JjwFeh/z3fQWVJvPLCk=
X-Received: by 2002:ac8:60d:: with SMTP id d13mr5083948qth.223.1625232131188; 
 Fri, 02 Jul 2021 06:22:11 -0700 (PDT)
MIME-Version: 1.0
References: <20210701151019.1103315-1-matthew.auld@intel.com>
 <20210701151019.1103315-3-matthew.auld@intel.com>
In-Reply-To: <20210701151019.1103315-3-matthew.auld@intel.com>
From: Matthew Auld <matthew.william.auld@gmail.com>
Date: Fri, 2 Jul 2021 14:21:44 +0100
Message-ID: <CAM0jSHOjukUd0gu-VE49RT3zf-Uvh6ehypR1x9r12iBcDOUUYQ@mail.gmail.com>
Subject: Re: [PATCH v2 3/3] drm/i915/uapi: reject set_domain for discrete
To: Matthew Auld <matthew.auld@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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
Cc: =?UTF-8?Q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 kenneth.w.graunke@intel.com, Jordan Justen <jordan.l.justen@intel.com>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 ML dri-devel <dri-devel@lists.freedesktop.org>,
 Kenneth Graunke <kenneth@whitecape.org>, Jason Ekstrand <jason@jlekstrand.net>,
 Daniel Vetter <daniel.vetter@ffwll.ch>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, 1 Jul 2021 at 16:10, Matthew Auld <matthew.auld@intel.com> wrote:
>
> The CPU domain should be static for discrete, and on DG1 we don't need
> any flushing since everything is already coherent, so really all this
> does is an object wait, for which we have an ioctl. Longer term the
> desired caching should be an immutable creation time property for the
> BO, which can be set with something like gem_create_ext.
>
> One other user is iris + userptr, which uses the set_domain to probe all
> the pages to check if the GUP succeeds, however keeping the set_domain
> around just for that seems rather scuffed. We could equally just submit
> a dummy batch, which should hopefully be good enough, otherwise adding a
> new creation time flag for userptr might be an option. Although longer
> term we will also have vm_bind, which should also be a nice fit for
> this, so adding a whole new flag is likely overkill.

Kenneth, do you have a preference for the iris + userptr use case?
Adding the flag shouldn't be much work, if you feel the dummy batch is
too ugly. I don't mind either way.

>
> Suggested-by: Daniel Vetter <daniel@ffwll.ch>
> Signed-off-by: Matthew Auld <matthew.auld@intel.com>
> Cc: Thomas Hellstr=C3=B6m <thomas.hellstrom@linux.intel.com>
> Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
> Cc: Jordan Justen <jordan.l.justen@intel.com>
> Cc: Kenneth Graunke <kenneth@whitecape.org>
> Cc: Jason Ekstrand <jason@jlekstrand.net>
> Cc: Daniel Vetter <daniel.vetter@ffwll.ch>
> Cc: Ramalingam C <ramalingam.c@intel.com>
> ---
>  drivers/gpu/drm/i915/gem/i915_gem_domain.c | 3 +++
>  1 file changed, 3 insertions(+)
>
> diff --git a/drivers/gpu/drm/i915/gem/i915_gem_domain.c b/drivers/gpu/drm=
/i915/gem/i915_gem_domain.c
> index 43004bef55cb..b684a62bf3b0 100644
> --- a/drivers/gpu/drm/i915/gem/i915_gem_domain.c
> +++ b/drivers/gpu/drm/i915/gem/i915_gem_domain.c
> @@ -490,6 +490,9 @@ i915_gem_set_domain_ioctl(struct drm_device *dev, voi=
d *data,
>         u32 write_domain =3D args->write_domain;
>         int err;
>
> +       if (IS_DGFX(to_i915(dev)))
> +               return -ENODEV;
> +
>         /* Only handle setting domains to types used by the CPU. */
>         if ((write_domain | read_domains) & I915_GEM_GPU_DOMAINS)
>                 return -EINVAL;
> --
> 2.26.3
>
