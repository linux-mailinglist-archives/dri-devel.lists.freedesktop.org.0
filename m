Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 970A9552BCB
	for <lists+dri-devel@lfdr.de>; Tue, 21 Jun 2022 09:24:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7A6A010F22F;
	Tue, 21 Jun 2022 07:24:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oa1-x33.google.com (mail-oa1-x33.google.com
 [IPv6:2001:4860:4864:20::33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A8223112346;
 Tue, 21 Jun 2022 02:27:02 +0000 (UTC)
Received: by mail-oa1-x33.google.com with SMTP id
 586e51a60fabf-101e1a33fe3so6496842fac.11; 
 Mon, 20 Jun 2022 19:27:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=y+H1yHRewfJ4TeRG+Yh5+qo4qD6sH1lCnmTiIvv7tW0=;
 b=YyMolUb7ycdPjzRVy7pn12nfKpgJZLRONkCxbxidaLJd+PRKgP27CLmQVbYuBM+yx2
 wb4CXQr1x9X2F3ICjltUjg/CBS1Klyu+TqSnHyIqNI/uoiogIdLyiveU9rb2tl5oAlIK
 PdE4ClbtKV1JLYOxhY+VFQL1gFuuHihE3kmlBEEEjrPVZrA+eNP4x/v7Fiu7BHetlAv2
 L3uhVWKK3LlZ808xO9sHxzGrpeJbFwpwy3d0c5uNqzXbPBUgn5CIUe9DPvlXtwmCY1t6
 QzmNI5sYUK+K+J0BWXdpWUdOeIeemze4Vfv9JyB/bxPeZ8PzZWRoaMdbsnUDugtZczIO
 L5ig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=y+H1yHRewfJ4TeRG+Yh5+qo4qD6sH1lCnmTiIvv7tW0=;
 b=fkFVFOGDZus8JHZlXTDEPWotrE/T3E6A/IRlr2d1KiMbAzAK22M6ZSY34nkMNcI8pd
 6RpSYDSH00FHL0tHmDhpqm83tfA6Qz0Qc55eiLcClDGMM2Bt40MqIaqcteFzKDHKyrt0
 iUNStVMx4cfypr9vFE7K1Zcy37tkzSRFgv+S5pnqTCuSCs2oxHEH3ZO75rNdJTzU7vGH
 SvlPbb9RuE+qCkIUm+P3VAROuDgRLCOTZqrmSVpnIBhKIIiBY4hWngz4XnlLruynjANc
 NMsTb+TuLZnOgp+mUidEfeJrSfO4SDnsmlGjCPQIiIVVDSw24vuD17oCk0EtS50e/FpH
 a/TA==
X-Gm-Message-State: AJIora8el15FRmiMdqfsACEmerKiJ6nWKodQB6EXIwR9ZyIjjV2XnR82
 vS9Ze9wKhk1sEvqXC6DNCfsEfYkeC+ZRBRxptIc=
X-Google-Smtp-Source: AGRyM1t9kYo9o6DosEPpQPNwOSkcM6g15Kxfltr5dCVQzIi38dGqVpWj4IuRrNzrmQGdtQ+lJx2gNUynP8rXFjLYsVI=
X-Received: by 2002:a05:6870:4393:b0:101:aef4:703d with SMTP id
 r19-20020a056870439300b00101aef4703dmr10018636oah.69.1655778421926; Mon, 20
 Jun 2022 19:27:01 -0700 (PDT)
MIME-Version: 1.0
References: <20220620100216.1791284-1-zys.zljxml@gmail.com>
 <7a2028c6-8ed6-1fc4-3abf-b13f7254cdee@linux.intel.com>
In-Reply-To: <7a2028c6-8ed6-1fc4-3abf-b13f7254cdee@linux.intel.com>
From: Katrin Jo <zys.zljxml@gmail.com>
Date: Tue, 21 Jun 2022 10:26:51 +0800
Message-ID: <CAOaDN_T_ZVCfhmbqd1AJnt3vhTuxnGhKsxG2fjjF8-u4wXOBcg@mail.gmail.com>
Subject: Re: [PATCH] drm/i915/gem: remove unused assignments
To: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailman-Approved-At: Tue, 21 Jun 2022 07:24:08 +0000
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
Cc: bob.beckett@collabora.com, thomas.hellstrom@linux.intel.com,
 katrinzhou <katrinzhou@tencent.com>, airlied@linux.ie,
 intel-gfx@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, rodrigo.vivi@intel.com, kernel@collabora.com,
 matthew.auld@intel.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Jun 20, 2022 at 6:19 PM Tvrtko Ursulin
<tvrtko.ursulin@linux.intel.com> wrote:
>
>
> On 20/06/2022 11:02, zys.zljxml@gmail.com wrote:
> > From: katrinzhou <katrinzhou@tencent.com>
> >
> > The variable ret is reassigned and the value EINVAL is never used.
> > Thus, remove the unused assignments.
> >
> > Addresses-Coverity: ("Unused value")
> > Fixes: d4433c7600f7 ("drm/i915/gem: Use the proto-context to handle create parameters (v5)")
> > Signed-off-by: katrinzhou <katrinzhou@tencent.com>
> > ---
> >   drivers/gpu/drm/i915/gem/i915_gem_context.c | 2 --
> >   1 file changed, 2 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/i915/gem/i915_gem_context.c b/drivers/gpu/drm/i915/gem/i915_gem_context.c
> > index ab4c5ab28e4d..d5ef5243673a 100644
> > --- a/drivers/gpu/drm/i915/gem/i915_gem_context.c
> > +++ b/drivers/gpu/drm/i915/gem/i915_gem_context.c
> > @@ -931,8 +931,6 @@ static int set_proto_ctx_param(struct drm_i915_file_private *fpriv,
> >               break;
> >
> >       case I915_CONTEXT_PARAM_PERSISTENCE:
> > -             if (args->size)
> > -                     ret = -EINVAL;
> >               ret = proto_context_set_persistence(fpriv->dev_priv, pc,
> >                                                   args->value);
>
> AFAICT fix should end up with code like this:
>
> if (args->size)
>         ret = -EINVAL;
> else
>         ret = proto_context_set_persistence(...)
> break;
>
>
> Alternatively move args->size checking into
> proto_context_set_persistence to align with set_persistence().
>
> Regards,
>
> Tvrtko
>
> >               break;

Thanks for reviewing! I sent the V2 patch, modified according to your
suggestion.

Best Regards,
Katrin
