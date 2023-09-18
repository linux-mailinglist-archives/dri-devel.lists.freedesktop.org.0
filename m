Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id ECBA07A420A
	for <lists+dri-devel@lfdr.de>; Mon, 18 Sep 2023 09:17:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D115010E1E8;
	Mon, 18 Sep 2023 07:17:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x22b.google.com (mail-lj1-x22b.google.com
 [IPv6:2a00:1450:4864:20::22b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 69D3010E1CB
 for <dri-devel@lists.freedesktop.org>; Mon, 18 Sep 2023 07:16:44 +0000 (UTC)
Received: by mail-lj1-x22b.google.com with SMTP id
 38308e7fff4ca-2c008d8fd07so12106321fa.1
 for <dri-devel@lists.freedesktop.org>; Mon, 18 Sep 2023 00:16:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1695021402; x=1695626202; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references
 :mail-followup-to:message-id:subject:cc:to:from:date:from:to:cc
 :subject:date:message-id:reply-to;
 bh=HtYLAbUkW1EE5YSKH4JQuk4HIHGauzB0S/KhIJUqMLY=;
 b=MErJo6iEMyt/oquKmY8K8FAQlvI2yBlzkVN28YLdm6dAOVGuSoCQmMy9w0Afwit0ps
 yQ/Y7vMdHdtslXgVeLHf7a58zzDA8RcENCGNRzTumn8VVDQ1uFFBKAbrZAIdPDUcAxSD
 6rxAfaCeBwO++MJiIm4VxoSQMRf4TbxjYBMbjGgvgWCCYFBKN5Ot2BPdAkgwBKyZCYz6
 bHxqJ0voGmeHEG/uex9th88wa+inOaWqmWlSlFCNqLOv8+AVlB/+jUJBmmIxbBLWLSmK
 +81qUMhsdEaLgjYC4r28OirECvxSB40zMVPR+JZtyuEhRvZxIlCR8etZ4tG85d+G7XcZ
 Sa3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1695021402; x=1695626202;
 h=in-reply-to:content-disposition:mime-version:references
 :mail-followup-to:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=HtYLAbUkW1EE5YSKH4JQuk4HIHGauzB0S/KhIJUqMLY=;
 b=OXZvCwkbdvlrVB4H+mlUV0LXXNwGPd+2JFNGoVLZ32NWPAsDCTZkdxNWDpkxrARmjR
 lKRA3Z3LM2YJEve2bJS3IGvNeRFRZK/XFYrQNa5Rt3n9ylIN05V58cD919t2ZcaF3nQp
 qDQb2R6guYeGhySuyw6lo+1wuZ9BUneDZtP874/ViOqZWXF9w1KICtBC8yq63/hfP7F6
 TPgCH2EZl/K1SNeM+QteuOm8s2pziupqVOQdFz5lCOu16lUbM2TZyF/NqH+7Bmx+Mcc+
 xjSekiSRPnwAgoSlTyy/hP8Z5dfJjMe8nY+WxapGBJjgCWLhPXx8S5mSKQDr+STbm8hh
 2SRQ==
X-Gm-Message-State: AOJu0Ywhu3Z4R9nZ7mZXJthOzlAHVKnd+aJ5721YtRi4+Q7tA8c60Adt
 Sx+ONhuyKe85iOPtoX3TH54=
X-Google-Smtp-Source: AGHT+IG38LcxzwKXLpAT//j7BucjbiMzO8rRJFcNYXDrwkHSK8FMz6yosThkN68Vrff6++hYDjGT3g==
X-Received: by 2002:a05:651c:610:b0:2c0:18e0:708a with SMTP id
 k16-20020a05651c061000b002c018e0708amr408980lje.46.1695021402207; 
 Mon, 18 Sep 2023 00:16:42 -0700 (PDT)
Received: from localhost (81-226-149-122-no518.tbcn.telia.com.
 [81.226.149.122]) by smtp.gmail.com with ESMTPSA id
 n6-20020a2e8786000000b002bcc866ec9esm1980739lji.119.2023.09.18.00.16.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 18 Sep 2023 00:16:41 -0700 (PDT)
Date: Mon, 18 Sep 2023 09:16:39 +0200
From: Patrik Jakobsson <patrik.r.jakobsson@gmail.com>
To: Kees Cook <keescook@chromium.org>
Subject: Re: [PATCH] drm/gma500: refactor deprecated strncpy
Message-ID: <7rldvf22zvtvvqpqsoeidg57sqwnuz6pfclve7igw6kuxp5jfp@vkt3z7br5hll>
Mail-Followup-To: Kees Cook <keescook@chromium.org>, 
 Justin Stitt <justinstitt@google.com>, David Airlie <airlied@gmail.com>, 
 Daniel Vetter <daniel@ffwll.ch>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, 
 linux-hardening@vger.kernel.org
References: <20230914-drivers-gpu-drm-gma500-oaktrail_lvds_i2c-c-v1-1-0a53a076ce20@google.com>
 <202309142135.16032DEA8@keescook>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <202309142135.16032DEA8@keescook>
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
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-hardening@vger.kernel.org, Justin Stitt <justinstitt@google.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Sep 14, 2023 at 09:37:31PM -0700, Kees Cook wrote:
> On Thu, Sep 14, 2023 at 08:52:21PM +0000, Justin Stitt wrote:
> > `strncpy` is deprecated for use on NUL-terminated destination strings [1].
> > 
> > We should prefer more robust and less ambiguous string interfaces.
> > 
> > Since `chan->base.name` is expected to be NUL-terminated, a suitable
> > replacement is `strscpy` [2] due to the fact that it guarantees
> > NUL-termination on the destination buffer without also unnecessarily
> > NUL-padding.
> 
> How did you decide about %NUL padding? (I see it is kzalloc'd, so it
> doesn't matter.)
> 
> > 
> > Link: https://www.kernel.org/doc/html/latest/process/deprecated.html#strncpy-on-nul-terminated-strings [1]
> > Link: https://manpages.debian.org/testing/linux-manual-4.8/strscpy.9.en.html [2]
> > Link: https://github.com/KSPP/linux/issues/90
> > Cc: linux-hardening@vger.kernel.org
> > Signed-off-by: Justin Stitt <justinstitt@google.com>
> > ---
> > 
> > 
> > drm/gma500: refactor deprecated strncpy
> > ---
> >  drivers/gpu/drm/gma500/oaktrail_lvds_i2c.c | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> > 
> > diff --git a/drivers/gpu/drm/gma500/oaktrail_lvds_i2c.c b/drivers/gpu/drm/gma500/oaktrail_lvds_i2c.c
> > index 06b5b2d70d48..68458cbdd6d5 100644
> > --- a/drivers/gpu/drm/gma500/oaktrail_lvds_i2c.c
> > +++ b/drivers/gpu/drm/gma500/oaktrail_lvds_i2c.c
> > @@ -141,7 +141,7 @@ struct gma_i2c_chan *oaktrail_lvds_i2c_init(struct drm_device *dev)
> >  
> >  	chan->drm_dev = dev;
> >  	chan->reg = dev_priv->lpc_gpio_base;
> > -	strncpy(chan->base.name, "gma500 LPC",  I2C_NAME_SIZE - 1);
> > +	strscpy(chan->base.name, "gma500 LPC",  I2C_NAME_SIZE - 1);
> 
> What's going on here with the destination buffer size? chan->base.name
> is 48 bytes. I2C_NAME_SIZE is 20.

It seems I2C_NAME_SIZE is used for i2c_client.name but is abused here
for i2c_adapter.name as well. Using sizeof() would be better. Justin,
would you mind changing that as well?

Thanks
Patrik

> 
> Ultimately it doesn't matter since the source is a const char string,
> but it's still weird. Therefore:
> 
> Reviewed-by: Kees Cook <keescook@chromium.org>
> 
> -Kees
> 
> >  	chan->base.owner = THIS_MODULE;
> >  	chan->base.algo_data = &chan->algo;
> >  	chan->base.dev.parent = dev->dev;
> > 
> > ---
> > base-commit: 3669558bdf354cd352be955ef2764cde6a9bf5ec
> > change-id: 20230914-drivers-gpu-drm-gma500-oaktrail_lvds_i2c-c-a53c6d8bd62f
> > 
> > Best regards,
> > --
> > Justin Stitt <justinstitt@google.com>
> > 
> 
> -- 
> Kees Cook
