Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E0FDF76ED55
	for <lists+dri-devel@lfdr.de>; Thu,  3 Aug 2023 16:57:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2C3DB10E1FD;
	Thu,  3 Aug 2023 14:57:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x12d.google.com (mail-lf1-x12d.google.com
 [IPv6:2a00:1450:4864:20::12d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2726610E1FD
 for <dri-devel@lists.freedesktop.org>; Thu,  3 Aug 2023 14:57:32 +0000 (UTC)
Received: by mail-lf1-x12d.google.com with SMTP id
 2adb3069b0e04-4fe0a3377bfso448423e87.0
 for <dri-devel@lists.freedesktop.org>; Thu, 03 Aug 2023 07:57:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google; t=1691074650; x=1691679450;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date:from:to
 :cc:subject:date:message-id:reply-to;
 bh=BtoiTWg/wie+YUV9nDTimeU0umr3skhvQtwNFa8H0qo=;
 b=HFhFpOsy+MD1XmsUcSrWzHh5kJ5zayPAvPM2bAleZEZJZHYQNOIN1yn7A5Ky2AzASs
 M/TgpoL76zoqvgtaT58Sf+7wrFdXCP/ANiaS+mm/zJG6N+T3B0HHpOBq1N96TKTqXLXt
 UuWVXT/0s53DOIegOx4+YP/VGCXMN5rs+Ghi8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1691074650; x=1691679450;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=BtoiTWg/wie+YUV9nDTimeU0umr3skhvQtwNFa8H0qo=;
 b=QDRhTxvkBiv/eA9+zbndpsr7UxyovzOx467Yr5palRPRRZ84ZKqgkecquC1MrGOvcr
 4bMBLMHKm159uiiPBurHcZ1bZ1plhxFwBSATUwDpSmdjisdK4HesfzvllK+aBPZdKr7P
 XNEm6bmtFaFYATrVte+TdMZlAoYUe24Jx5dZkf8WPVzps6LZAD5D2Jz6WZ19RIODufEE
 KCSTtfbWJ8ExLvUQsI9NRvfjh6Gkv2dN2tsuIzSI//mLdLNvAGr6lTO5o8Oy6shauvSa
 u2Qw0EoOYXBVk235C5ZdhWlIMVVN954RZF8cF3NGrOpepdpE6S8Aiy9/2HKrioYaIITa
 DRIA==
X-Gm-Message-State: ABy/qLa/ivxIOrrbakPfqzAjkahuqaoS9deo91SX+NaeF7+wIalv+vcK
 RTzFcUrL06MdHqgzl600wTqHmw==
X-Google-Smtp-Source: APBJJlEpF0DWzUN+W6T0dNmRzfn5TpxtjrNfgi2K+oa/HBRt3yDg0KvZd/++TnbwzIPjVUChsKzmNQ==
X-Received: by 2002:ac2:44d2:0:b0:4fd:cbd8:17d5 with SMTP id
 d18-20020ac244d2000000b004fdcbd817d5mr8690927lfm.4.1691074650248; 
 Thu, 03 Aug 2023 07:57:30 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id
 y10-20020a17090668ca00b0099bd1ce18fesm10740953ejr.10.2023.08.03.07.57.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 03 Aug 2023 07:57:29 -0700 (PDT)
Date: Thu, 3 Aug 2023 16:57:27 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Justin Green <greenjustin@chromium.org>
Subject: Re: [PATCH RESEND] drm/mediatek: Add valid modifier check
Message-ID: <ZMvAV42bm7ZTKXfv@phenom.ffwll.local>
References: <20230724175839.675911-1-greenjustin@chromium.org>
 <ZMtkIHkfhbOCodhw@phenom.ffwll.local>
 <CAHC42Rfz6jjY9RfVsrrPuENgXiaCB7EecH=-Dnfzm0KynGFNjA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAHC42Rfz6jjY9RfVsrrPuENgXiaCB7EecH=-Dnfzm0KynGFNjA@mail.gmail.com>
X-Operating-System: Linux phenom 6.3.0-2-amd64 
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
Cc: chunkuang.hu@kernel.org, jason-jh.lin@mediatek.com, justin.yeh@mediatek.com,
 dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org,
 wenst@chromium.org, angelogioacchino.delregno@collabora.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Aug 03, 2023 at 08:48:56AM -0400, Justin Green wrote:
> > See c91acda3a380 ("drm/gem: Check for valid formats") and the related gem
> fb helper functions to see how this is supposed to be done.
> 
> Oh that's interesting, so does this imply that the infrastructure
> automatically calls format_mod_supported() during framebuffer
> creation? In that case, this entire patch might be unnecessary in the
> tip of tree kernel.

It /should/, but maybe a wheel fell off somewhere. So please double-check
that it doesn indeed work.

Also because we had to put the check into gem helpers, if your driver
doesn't use those but hand-rolls a bit of that code (the helpers predate a
bunch of drivers, not sure all got converted), then you might also have a
validation gap here.

Cheers, Sima

> 
> On Thu, Aug 3, 2023 at 4:24 AM Daniel Vetter <daniel@ffwll.ch> wrote:
> >
> > On Mon, Jul 24, 2023 at 01:58:39PM -0400, Justin Green wrote:
> > > Add a check to mtk_drm_mode_fb_create() that rejects any modifier that
> > > is not the AFBC mode supported by MT8195's display overlays.
> > >
> > > Tested by booting ChromeOS and verifying the UI works, and by running
> > > the ChromeOS kms_addfb_basic binary, which has a test called
> > > "addfb25-bad-modifier" that attempts to create a framebuffer with the
> > > modifier DRM_FORMAT_MOD_INVALID and verifies the ADDFB2 ioctl returns
> > > EINVAL.
> > >
> > > Signed-off-by: Justin Green <greenjustin@chromium.org>
> > > ---
> > >  drivers/gpu/drm/mediatek/mtk_drm_drv.c | 7 +++++++
> > >  1 file changed, 7 insertions(+)
> > >
> > > diff --git a/drivers/gpu/drm/mediatek/mtk_drm_drv.c b/drivers/gpu/drm/mediatek/mtk_drm_drv.c
> > > index cd5b18ef7951..2096e8a794ad 100644
> > > --- a/drivers/gpu/drm/mediatek/mtk_drm_drv.c
> > > +++ b/drivers/gpu/drm/mediatek/mtk_drm_drv.c
> > > @@ -51,6 +51,13 @@ mtk_drm_mode_fb_create(struct drm_device *dev,
> > >       if (info->num_planes != 1)
> > >               return ERR_PTR(-EINVAL);
> > >
> > > +     if (cmd->modifier[0] &&
> > > +         cmd->modifier[0] != DRM_FORMAT_MOD_ARM_AFBC(
> > > +                                     AFBC_FORMAT_MOD_BLOCK_SIZE_32x8 |
> > > +                                     AFBC_FORMAT_MOD_SPLIT |
> > > +                                     AFBC_FORMAT_MOD_SPARSE))
> > > +             return ERR_PTR(-EINVAL);
> >
> > If you set the modifiers/format properties correctly and use all the
> > helpers then the drm core should already validate that only formats you
> > can use are allowed.
> >
> > See c91acda3a380 ("drm/gem: Check for valid formats") and the related gem
> > fb helper functions to see how this is supposed to be done. These kind of
> > checks in driver code for gem drivers (which really is everyone at this
> > point) should not be needed at all.
> >
> > Cheers, Sima
> >
> > > +
> > >       return drm_gem_fb_create(dev, file, cmd);
> > >  }
> > >
> > > --
> > > 2.41.0.162.gfafddb0af9-goog
> > >
> >
> > --
> > Daniel Vetter
> > Software Engineer, Intel Corporation
> > http://blog.ffwll.ch

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
