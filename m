Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 27A682518A7
	for <lists+dri-devel@lfdr.de>; Tue, 25 Aug 2020 14:36:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 140126E0BC;
	Tue, 25 Aug 2020 12:36:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x541.google.com (mail-pg1-x541.google.com
 [IPv6:2607:f8b0:4864:20::541])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B79CF6E0BC
 for <dri-devel@lists.freedesktop.org>; Tue, 25 Aug 2020 12:36:02 +0000 (UTC)
Received: by mail-pg1-x541.google.com with SMTP id w186so4633192pgb.8
 for <dri-devel@lists.freedesktop.org>; Tue, 25 Aug 2020 05:36:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=m+ogH5ulPuM2hkUbprAOsV1Pp0nM7Zu6hRZDding+Jc=;
 b=GR1PGsJKN/V0tdvSTncoG6jUNNeoMQOt8Q0wmT/q/vJTyxjLTUUZBax7s8PR26FqF/
 2NthILHfDBZxcv9pxwMqCP2D4V6cNSnM4GeCKqWFDg4Lr5AapF0nlEoYptTkP+763jtn
 cDQPBauUJRHsnELAdjf0JrQs3WeKVpMWunbwsjyJZ7yfCQsvKrkpWNldYSVsI0D9lL9W
 C4ViBS5Mm3atHCzKPQ3GQL5V8211eCOj2sOMc6xVbs/pH+8l/q4+EAmpTcYjXarZi3U6
 Ie4Xxl4eO0Xz0SpF5FGY7R9zUtCVOYJkGQ2QnDnkEnVgdmnRH1mYUQ3s0/7xrjPnfdWS
 LYgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=m+ogH5ulPuM2hkUbprAOsV1Pp0nM7Zu6hRZDding+Jc=;
 b=bTzvdJBsmxGIjkvgBaAQ4DN4RoJwTrY+qO+qO/v/KDtDSIP8CmmJyK5/6cqD0b/zHB
 6/a3hlao6SiV9/WjpKMIs9kwWH7LXX+aqmb7kb7Q9DkihLulsCrf6Ef1NCBqHTQ5G69I
 zkBzB55R8EwbDQ6cKDqTIGHn/SdbEJz6AAWSUbcWjPHhoOEvtHzRvB4YNWCE4IZyzfXh
 SkkXRynyakHbH7ONIjIaYojNuSpS4CAXOyB37ibQML3adVQ4tjLlWxM5i22ZkBuKbcl4
 Y6FP4yuplIXHKHTrMrdy+/h58fvEnEzKn4nUGUv6gIp9/qthxTS6tnrI8S4G68L3pAXt
 VrDg==
X-Gm-Message-State: AOAM532j+VyjgKua+6vBjPupzHAQXr29YfrVuCp6Hvqx/93no+DfhfDc
 441naYv+rCBDaoxURa8aaSc=
X-Google-Smtp-Source: ABdhPJw/fNiDE1HlatNELcS5RKiecoQ5s7tg/0bT9fLlga7FeQsr/od6Ib4gVZTSsdkuX/38M6hXFQ==
X-Received: by 2002:a17:902:b588:: with SMTP id
 a8mr7228614pls.96.1598358962298; 
 Tue, 25 Aug 2020 05:36:02 -0700 (PDT)
Received: from realwakka ([61.83.141.80])
 by smtp.gmail.com with ESMTPSA id lb1sm2464720pjb.26.2020.08.25.05.35.59
 (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
 Tue, 25 Aug 2020 05:36:01 -0700 (PDT)
Date: Tue, 25 Aug 2020 12:35:51 +0000
From: Sidong Yang <realwakka@gmail.com>
To: Rodrigo Siqueira <rodrigosiqueiramelo@gmail.com>
Subject: Re: [PATCH] drm/vkms: Use alpha value to blend values.
Message-ID: <20200825123551.GA25810@realwakka>
References: <20200818160215.19550-1-realwakka@gmail.com>
 <20200825031501.y3knhdwph5a6knld@smtp.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200825031501.y3knhdwph5a6knld@smtp.gmail.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
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
 Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, kernel-usp@googlegroups.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Aug 24, 2020 at 11:15:01PM -0400, Rodrigo Siqueira wrote:
> Hi Sidong,
> 
> Thanks a lot for your patch and effort to improve VKMS.
> 
> On 08/18, Sidong Yang wrote:
> > I wrote this patch for TODO list in vkms documentation.
> > 
> > Use alpha value to blend source value and destination value Instead of
> > just overwrite with source value.
> > 
> > Cc: Rodrigo Siqueira <rodrigosiqueiramelo@gmail.com>
> > Cc: Haneen Mohammed <hamohammed.sa@gmail.com>
> > 
> > Signed-off-by: Sidong Yang <realwakka@gmail.com>
> > ---
> >  drivers/gpu/drm/vkms/vkms_composer.c | 14 ++++++++++++--
> >  1 file changed, 12 insertions(+), 2 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/vkms/vkms_composer.c b/drivers/gpu/drm/vkms/vkms_composer.c
> > index 4f3b07a32b60..e3230e2a99af 100644
> > --- a/drivers/gpu/drm/vkms/vkms_composer.c
> > +++ b/drivers/gpu/drm/vkms/vkms_composer.c
> > @@ -77,6 +77,9 @@ static void blend(void *vaddr_dst, void *vaddr_src,
> >  
> >  	for (i = y_src, i_dst = y_dst; i < y_limit; ++i) {
> >  		for (j = x_src, j_dst = x_dst; j < x_limit; ++j) {
> > +			u8 *src, *dst;
> > +			u32 alpha, inv_alpha;
> > +
> >  			offset_dst = dest_composer->offset
> >  				     + (i_dst * dest_composer->pitch)
> >  				     + (j_dst++ * dest_composer->cpp);
> > @@ -84,8 +87,15 @@ static void blend(void *vaddr_dst, void *vaddr_src,
> >  				     + (i * src_composer->pitch)
> >  				     + (j * src_composer->cpp);
> >  
> > -			memcpy(vaddr_dst + offset_dst,
> > -			       vaddr_src + offset_src, sizeof(u32));
> > +			src = vaddr_src + offset_src;
> > +			dst = vaddr_dst + offset_dst;
> > +			alpha = src[3] + 1;
> > +			inv_alpha = 256 - src[3];
> > +			dst[0] = (alpha * src[0] + inv_alpha * dst[0]) >> 8;
> > +			dst[1] = (alpha * src[1] + inv_alpha * dst[1]) >> 8;
> > +			dst[2] = (alpha * src[2] + inv_alpha * dst[2]) >> 8;
> 

Hi, Rodrigo!

> Did you test your change with IGT? Maybe I missed something but looks
> like that you're applying the alpha value but the value that we get is
> already pre-multiplied.
> 
> Btw, It looks like that you and Melissa are working in the same feature,
> maybe you two could try to sync for avoiding overlapping.

Thanks for review.
Yes, this patch should be dropped and I should watch Melissa's patch.

> 
> Finally, do you have plans to send your fix for
> vkms_get_vblank_timestamp() function? That patch was really good and
> removes a lot of warning generated during the IGT test.

Okay, I'll work for improve vkms_get_vblank_timestamp().
Thank you so much.

Sincerely,
-Sidong

> 
> Best Regards
> 
> > +			dst[3] = 0xff;
> > +
> >  		}
> >  		i_dst++;
> >  	}
> > -- 
> > 2.17.1
> > 
> 
> -- 
> Rodrigo Siqueira
> https://siqueira.tech


_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
