Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C90E3552BD8
	for <lists+dri-devel@lfdr.de>; Tue, 21 Jun 2022 09:24:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F2A6310FCCF;
	Tue, 21 Jun 2022 07:24:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x330.google.com (mail-ot1-x330.google.com
 [IPv6:2607:f8b0:4864:20::330])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5FE8111230B;
 Tue, 21 Jun 2022 02:21:25 +0000 (UTC)
Received: by mail-ot1-x330.google.com with SMTP id
 y16-20020a9d5190000000b0060c1292a5b9so9696860otg.3; 
 Mon, 20 Jun 2022 19:21:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=pDQ6vaD9jgFu0zY8u96WS/d+kiDGgxfsRU+RPRfqSC4=;
 b=g0tJ5XPEBtRuOQ838gtdBgq6nLd+aC1GbAmqG7krMREQuzaaPwrmwG1R2o+r+N/1bw
 Bpt02cuXrVih9QHPbvF3Hd3IMlTqHqHqN5trEElcVJJtX93taJxJm/VYT+JTHjzXk4En
 4LuTHY7KQyGjj7jxaszAJgWFfmAhVoAGguM5+kxwf45wBqs+iPcPwMQ4adqspBAt2/Wv
 F3Yb8A6qh4h8gh/5kA5t1PsHB1TmpyyI+xAUBTwqGx63FrpOaUbs7ZosU7Q30clZwayV
 NVO1dtMJrHbPdkEjW/1haZXCYI9x69DbOji9nmwlAycEwQVrZREmNA2fFDogof6XmyCj
 u9Gw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=pDQ6vaD9jgFu0zY8u96WS/d+kiDGgxfsRU+RPRfqSC4=;
 b=uljVUPVJlVrBETAjCPvpwx8rPjdIttlaZJB7HxyHkELpTSBXcWgbYFjSJuDRcQmISg
 aL2cVhFNvMwgn8B7+buDxxN3ft6YwpIO4QWN9bgTUFPIKtFg1zWLFnLkS4F75D/mVuaF
 VkdHCzfvi5oCG9VgJoBe5M4oEioldo72pFc0nmhjxXEQgcwHmte09HmuVpG1K+GZ04GP
 8L8VQ1iHo70ds5vBAhkJz5ShkDCQ2FOwMPURixLd9/3foBFpsN/odfGR2Ip2anDdeI6Q
 VY9cNT2WciL24yhhCRS7IDHoygq95iOsG+k0iSEzmkkaQfgk3lUSNSQ2kLNtIhouyTXR
 OymQ==
X-Gm-Message-State: AJIora+dXQN3DPRycG26nHo7by2IgD8oTE5zBzxrqU34i0EXsp4o2qQL
 4hj2AGW6hRAHpTwEEXEKterHMHU1Yc2Gg7BL6tE=
X-Google-Smtp-Source: AGRyM1tXyP3psvJu6O4PF1IK/XHflmoEYLR2zzFCBMBvNteX28Ifos5XVGUW4IPF1yKdrWVz8+arJ07fY1flIn4oW08=
X-Received: by 2002:a05:6830:1188:b0:60e:32a4:349 with SMTP id
 u8-20020a056830118800b0060e32a40349mr9584898otq.116.1655778084686; Mon, 20
 Jun 2022 19:21:24 -0700 (PDT)
MIME-Version: 1.0
References: <20220620100216.1791284-1-zys.zljxml@gmail.com>
 <878rprtzh4.fsf@intel.com>
In-Reply-To: <878rprtzh4.fsf@intel.com>
From: Katrin Jo <zys.zljxml@gmail.com>
Date: Tue, 21 Jun 2022 10:21:13 +0800
Message-ID: <CAOaDN_StZipqEd+XxyOEes0wRCE6AFhTKfX1rJbSDtxWbpO1pw@mail.gmail.com>
Subject: Re: [PATCH] drm/i915/gem: remove unused assignments
To: Jani Nikula <jani.nikula@linux.intel.com>
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
Cc: bob.beckett@collabora.com, tvrtko.ursulin@linux.intel.com,
 katrinzhou <katrinzhou@tencent.com>, thomas.hellstrom@linux.intel.com,
 airlied@linux.ie, intel-gfx@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 matthew.auld@intel.com, rodrigo.vivi@intel.com, kernel@collabora.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Jun 20, 2022 at 6:13 PM Jani Nikula <jani.nikula@linux.intel.com> wrote:
>
> On Mon, 20 Jun 2022, zys.zljxml@gmail.com wrote:
> > From: katrinzhou <katrinzhou@tencent.com>
> >
> > The variable ret is reassigned and the value EINVAL is never used.
> > Thus, remove the unused assignments.
>
> It's obviously a bug, but it's not obvious just throwing the code away
> is the fix. Maybe there's a missing "else" instead.
>
> BR,
> Jani.
>
>
> >
> > Addresses-Coverity: ("Unused value")
> > Fixes: d4433c7600f7 ("drm/i915/gem: Use the proto-context to handle create parameters (v5)")
> > Signed-off-by: katrinzhou <katrinzhou@tencent.com>
> > ---
> >  drivers/gpu/drm/i915/gem/i915_gem_context.c | 2 --
> >  1 file changed, 2 deletions(-)
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
> >               break;
>
> --
> Jani Nikula, Intel Open Source Graphics Center

Thanks for reviewing!

Best Regards,
Katrin
