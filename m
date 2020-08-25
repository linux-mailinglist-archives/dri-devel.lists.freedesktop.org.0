Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4337A251803
	for <lists+dri-devel@lfdr.de>; Tue, 25 Aug 2020 13:48:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7CD316E098;
	Tue, 25 Aug 2020 11:48:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x143.google.com (mail-lf1-x143.google.com
 [IPv6:2a00:1450:4864:20::143])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0A2F16E098
 for <dri-devel@lists.freedesktop.org>; Tue, 25 Aug 2020 11:48:08 +0000 (UTC)
Received: by mail-lf1-x143.google.com with SMTP id d2so6252213lfj.1
 for <dri-devel@lists.freedesktop.org>; Tue, 25 Aug 2020 04:48:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=yFuuy2ZDucKKeJ/aOHHfJBNxs6p6AUH2V+s9q4oBJ6k=;
 b=qCCWdvKcg6Td6nhTc9ARhsNDt/+BogFS29YuKYIevjtVfq94EQF4p/IyUmtEtdtqNB
 BxRrG9GzA29+e4vipOnU/J+MyF0YQV8EPnu5FcNuE1OaPKJ1HN0sEaToksMgCfZOf+Db
 6AoNstMX4syVXWySWN+v3q0mRTfbVZ9aKIIVY2RPmAst39oJWsCiR1/YxQIj5C9+Cc9J
 LuYksNZwLCGA5Og28tW02aWh6AjWUz2BQjkrA5aUcK1KJRKJyj9iAjrmUgyIxHS1fWc4
 I539SgSSGAZVNOSu1aGlvpBbYMnQFWaVuNwFXKb3Z8V0h1TfvmMG8ORO7Zmz2PJ6efUx
 7SHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=yFuuy2ZDucKKeJ/aOHHfJBNxs6p6AUH2V+s9q4oBJ6k=;
 b=sYLmBezIMkskbmf1MfjX/+GAVMHRTNXLSgWHm+H1/AAnQC3EMbaTHPvkkawwipxjZK
 MNMKmQT6G2RVVPgn/qBx7LurQYYbLkGwbIEMqDF1oeX38WTrPfU7nbpospb+q/1zSPEL
 zvtnm4TiQBsPHETKkQa4qAKbsdEc+jpu+2Oca1SancVhqt+WW2S/XnAGbwnekVoEZbHF
 josfp3a1YRDa1vHGil/lU4gTbF58Ie33fWjslj36LSm9D3/NTNOatX/MSDl9YpLObS/q
 dO3nZTG2pqeuC28OqsnSPLWRE7ESZmv1BW4psYZ3FZTbAPYFgUuET9w5or+w3VgfvAkv
 WB1Q==
X-Gm-Message-State: AOAM532LZrPSq/cGuBt19fLlC3U8eF2ijvFveTID3ny5m+r/ZTcTIwdF
 E4qLhyPMOvmCUIy0veCfK+fouIdwQGlwl9iKUB0=
X-Google-Smtp-Source: ABdhPJx+Ob/DxLLUN7sb7xIDlh2g8C85fI0xJOfJUmPsQFkuBnviB5TiFpyhXvjtw/qfR3Ny3ENZ+t3Ab+yIwpKmdPM=
X-Received: by 2002:ac2:5e75:: with SMTP id a21mr148102lfr.206.1598356086190; 
 Tue, 25 Aug 2020 04:48:06 -0700 (PDT)
MIME-Version: 1.0
References: <20200819205336.fce24lioz34vbcd2@smtp.gmail.com>
 <20200825030404.htitgoy27nyhlezz@smtp.gmail.com>
In-Reply-To: <20200825030404.htitgoy27nyhlezz@smtp.gmail.com>
From: Melissa Wen <melissa.srw@gmail.com>
Date: Tue, 25 Aug 2020 08:47:55 -0300
Message-ID: <CAJeY4oEtxU1HyWW44J4TGwJpcVHK+gUAdsgpjJef+FKGUsrGcg@mail.gmail.com>
Subject: Re: [PATCH] drm/vkms: add alpha-premultiplied color blending
To: Rodrigo Siqueira <rodrigosiqueiramelo@gmail.com>
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
Cc: Haneen Mohammed <hamohammed.sa@gmail.com>, David Airlie <airlied@linux.ie>,
 Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>,
 LKML <linux-kernel@vger.kernel.org>,
 DRI Development <dri-devel@lists.freedesktop.org>, kernel-usp@googlegroups.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Rodrigo,

Thanks for the review!
I just sent a v2 applying your suggestions.

Best Regards,

Melissa Wen

Melissa Wen


On Tue, Aug 25, 2020 at 12:04 AM Rodrigo Siqueira
<rodrigosiqueiramelo@gmail.com> wrote:
>
> Hi Melissa,
>
> First of all, thanks a lot for your patch!
>
> Follows my inline comments.
>
> On 08/19, Melissa Wen wrote:
> > The current VKMS blend function ignores alpha channel and just overwrites
> > vaddr_src with vaddr_dst. This XRGB approach triggers a warning when
> > running the kms_cursor_crc/cursor-alpha-transparent test case. In IGT
> > tests, cairo_format_argb32 uses premultiplied alpha (according to
> > documentation), so this patch considers premultiplied alpha colors to
> > compose vaddr_src with vaddr_dst.
> >
> > This change removes the following cursor-alpha-transparent warning:
> > Suspicious CRC: All values are 0.
> >
> > Cc: Daniel Vetter <daniel@ffwll.ch>
> > Cc: Rodrigo Siqueira <rodrigosiqueiramelo@gmail.com>
> > Cc: Haneen Mohammed <hamohammed.sa@gmail.com>
> >
> > Signed-off-by: Melissa Wen <melissa.srw@gmail.com>
> > ---
> >  drivers/gpu/drm/vkms/vkms_composer.c | 43 +++++++++++++++++++++-------
> >  1 file changed, 33 insertions(+), 10 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/vkms/vkms_composer.c b/drivers/gpu/drm/vkms/vkms_composer.c
> > index 4f3b07a32b60..6aac962d3e2e 100644
> > --- a/drivers/gpu/drm/vkms/vkms_composer.c
> > +++ b/drivers/gpu/drm/vkms/vkms_composer.c
> > @@ -32,8 +32,6 @@ static uint32_t compute_crc(void *vaddr_out, struct vkms_composer *composer)
> >                       src_offset = composer->offset
> >                                    + (i * composer->pitch)
> >                                    + (j * composer->cpp);
> > -                     /* XRGB format ignores Alpha channel */
> > -                     bitmap_clear(vaddr_out + src_offset, 24, 8);
> >                       crc = crc32_le(crc, vaddr_out + src_offset,
> >                                      sizeof(u32));
> >               }
> > @@ -42,6 +40,32 @@ static uint32_t compute_crc(void *vaddr_out, struct vkms_composer *composer)
> >       return crc;
> >  }
> >
> > +u8 blend_channel(u8 c_src, u8 c_dst, u8 a_src)
>
> Use static here.
>
> Also, replace c_src to src, c_dst to dst, and a_src to alpha.
>
> > +{
> > +     u32 pre_blend;
> > +     u8 new_color;
> > +
> > +     /* Premultiplied alpha blending - IGT + cairo context */
>
> You can drop the part that says "IGT + cairo context", this explanation
> better suit the commit message.
>
> > +     pre_blend = (c_src * 255 + c_dst * (255 - a_src));
> > +
> > +     /* Faster div by 255 */
> > +     new_color = ((pre_blend + ((pre_blend + 257) >> 8)) >> 8);
> > +
> > +     return new_color;
> > +}
> > +
> > +void alpha_blending(u8 *argb_src, u8 *argb_dst)
>
> Use static.
>
> Looks like that argb_src is a read-only variable, in this sense add
> const.
>
> > +{
> > +     u8 a_src;
> > +
> > +     a_src = argb_src[3];
>
> change a_src to alpha.
>
> > +     argb_dst[0] = blend_channel(argb_src[0], argb_dst[0], a_src);
> > +     argb_dst[1] = blend_channel(argb_src[1], argb_dst[1], a_src);
> > +     argb_dst[2] = blend_channel(argb_src[2], argb_dst[2], a_src);
> > +     /* Opaque primary */
> > +     argb_dst[3] = 0xFF;
> > +}
> > +
> >  /**
> >   * blend - blend value at vaddr_src with value at vaddr_dst
> >   * @vaddr_dst: destination address
> > @@ -50,12 +74,9 @@ static uint32_t compute_crc(void *vaddr_out, struct vkms_composer *composer)
> >   * @src_composer: source framebuffer's metadata
> >   *
> >   * Blend value at vaddr_src with value at vaddr_dst.
> > - * Currently, this function write value of vaddr_src on value
> > - * at vaddr_dst using buffer's metadata to locate the new values
> > - * from vaddr_src and their destination at vaddr_dst.
> > - *
> > - * TODO: Use the alpha value to blend vaddr_src with vaddr_dst
> > - *    instead of overwriting it.
> > + * Currently, this function considers premultiplied alpha for blending, as used
> > + * by Cairo. It uses buffer's metadata to locate the new composite values at
> > + * vaddr_dst.
> >   */
> >  static void blend(void *vaddr_dst, void *vaddr_src,
> >                 struct vkms_composer *dest_composer,
> > @@ -63,6 +84,7 @@ static void blend(void *vaddr_dst, void *vaddr_src,
> >  {
> >       int i, j, j_dst, i_dst;
> >       int offset_src, offset_dst;
> > +     u8 *p_dst, *p_src;
>
> I suppose that p stands for "pixel", right? In this case how about use
> pixel?
>
> Best Regards
> Rodrigo Siqueira
>
> >
> >       int x_src = src_composer->src.x1 >> 16;
> >       int y_src = src_composer->src.y1 >> 16;
> > @@ -84,8 +106,9 @@ static void blend(void *vaddr_dst, void *vaddr_src,
> >                                    + (i * src_composer->pitch)
> >                                    + (j * src_composer->cpp);
> >
> > -                     memcpy(vaddr_dst + offset_dst,
> > -                            vaddr_src + offset_src, sizeof(u32));
> > +                     p_src = (u8 *)(vaddr_src + offset_src);
> > +                     p_dst = (u8 *)(vaddr_dst + offset_dst);
> > +                     alpha_blending(p_src, p_dst);
> >               }
> >               i_dst++;
> >       }
> > --
> > 2.28.0
> >
>
> --
> Rodrigo Siqueira
> https://siqueira.tech
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
