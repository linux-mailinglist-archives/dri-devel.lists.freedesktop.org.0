Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 409B31DEF0E
	for <lists+dri-devel@lfdr.de>; Fri, 22 May 2020 20:18:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5B26D6EA25;
	Fri, 22 May 2020 18:18:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [207.211.31.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 90AB06EA25
 for <dri-devel@lists.freedesktop.org>; Fri, 22 May 2020 18:18:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1590171512;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=m/geKcYtEm6APQ5LEp/KOQcykz/wDN18PTkCVCHlSm8=;
 b=CEk6fnWtfYL+cOJr6EwVcBuVVSczIjZ5mg4MedKjq+n1S1SuFK7mAwNXpqw4B+pn+F5B5h
 jMNZo27L0JjYLGbkDcy1zQHzWWTa+aiHtUQ4NbLNX+R3M58/aS9wVni+1z5bOJE6OMWj0s
 t2q3FZSE2cu/Ms0TbmuZ/HXGREWZpoA=
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-17-NLFHiCaGM3CXgwpIt8VGug-1; Fri, 22 May 2020 14:18:24 -0400
X-MC-Unique: NLFHiCaGM3CXgwpIt8VGug-1
Received: by mail-qk1-f197.google.com with SMTP id d145so3343007qkg.22
 for <dri-devel@lists.freedesktop.org>; Fri, 22 May 2020 11:18:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:message-id:subject:from:reply-to:to:cc:date
 :in-reply-to:references:organization:user-agent:mime-version
 :content-transfer-encoding;
 bh=m/geKcYtEm6APQ5LEp/KOQcykz/wDN18PTkCVCHlSm8=;
 b=MsXV0xtkYpvukciUvTanFll4phGGE4K5G5t8S+EgrY8y1J4+yP3G+jSzqB59g1ifBW
 szoGQrjlqTefheju3gM1k1AyP/oTyXrqCjXpDSHzdb9llSz6cWPn93cns71aGX5PQo4j
 yJSVLWxMbyu+JlPJxasMfkAkLwHL9lx7Qe5Oi1D3VkiP8Je/ACrY3I1wXGmGRhPqbt//
 dnz3Ck+GlwWhhfjtgULBay9WPJvxZ20HsDkpM38soPf77Du8cAR4xw5ROiuead+G86V/
 bVjf4Q7n2Wvd03pkfYFAuDkIDO69BEETYx/E4NrTOBbBIMyh9m0Ew0a3T3pNEwxzEPJM
 Tyjw==
X-Gm-Message-State: AOAM530eFdsbfDS7LXh97LaFrlVwh8wOXx6ScNgDZAYp8A/nj4OuimIL
 v3QyhmHFAPfcThy4ycSBpn8AOLFsK6OEtwwDOcfDVkYCF9YYanX+FORvCwnW0cfEj7bKNPCY3if
 cVL9DpEEW0TKKh4ynlE2y3Fg+Rbdq
X-Received: by 2002:a37:8705:: with SMTP id j5mr14768898qkd.233.1590171503900; 
 Fri, 22 May 2020 11:18:23 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzHR3ERTZmvM/CSJPNLHMaIrwwjp4k68hXtLxCPVvFuYCfjYWDQPH4SgEGssR0Gdrz1RwJcHQ==
X-Received: by 2002:a37:8705:: with SMTP id j5mr14768875qkd.233.1590171503633; 
 Fri, 22 May 2020 11:18:23 -0700 (PDT)
Received: from Whitewolf.lyude.net
 (static-173-76-190-23.bstnma.ftas.verizon.net. [173.76.190.23])
 by smtp.gmail.com with ESMTPSA id x144sm8508643qka.53.2020.05.22.11.18.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 22 May 2020 11:18:22 -0700 (PDT)
Message-ID: <7db8ff3ee32bddfb6f82760468caa86388bee9bd.camel@redhat.com>
Subject: Re: [PATCH] drm/vblank: Fix -Wformat compile warnings on some arches
From: Lyude Paul <lyude@redhat.com>
To: Sam Ravnborg <sam@ravnborg.org>
Date: Fri, 22 May 2020 14:18:21 -0400
In-Reply-To: <20200521210924.GA1056842@ravnborg.org>
References: <20200521204647.2578479-1-lyude@redhat.com>
 <20200521210924.GA1056842@ravnborg.org>
Organization: Red Hat
User-Agent: Evolution 3.36.2 (3.36.2-1.fc32)
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
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
Reply-To: lyude@redhat.com
Cc: David Airlie <airlied@linux.ie>, Dave Airlie <airlied@redhat.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, 2020-05-21 at 23:09 +0200, Sam Ravnborg wrote:
> On Thu, May 21, 2020 at 04:46:47PM -0400, Lyude Paul wrote:
> > On some architectures like ppc64le and aarch64, compiling with
> > -Wformat=1 will throw the following warnings:
> > 
> >   In file included from drivers/gpu/drm/drm_vblank.c:33:
> >   drivers/gpu/drm/drm_vblank.c: In function 'drm_update_vblank_count':
> >   drivers/gpu/drm/drm_vblank.c:273:16: warning: format '%llu' expects
> >   argument of type 'long long unsigned int', but argument 4 has type
> >   'long int' [-Wformat=]
> >     DRM_DEBUG_VBL("updating vblank count on crtc %u:"
> >                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> >   ./include/drm/drm_print.h:407:22: note: in definition of macro
> >   'DRM_DEBUG_VBL'
> >     drm_dbg(DRM_UT_VBL, fmt, ##__VA_ARGS__)
> >                         ^~~
> >   drivers/gpu/drm/drm_vblank.c:274:22: note: format string is defined here
> >            " current=%llu, diff=%u, hw=%u hw_last=%u\n",
> >                      ~~~^
> >                      %lu
> > 
> > So, fix that with a typecast.
> > 
> > Signed-off-by: Lyude Paul <lyude@redhat.com>
> > Co-developed-by: Dave Airlie <airlied@redhat.com>
> > ---
> >  drivers/gpu/drm/drm_vblank.c | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> > 
> > diff --git a/drivers/gpu/drm/drm_vblank.c b/drivers/gpu/drm/drm_vblank.c
> > index acb3c3f65b579..1a96db2dd16fa 100644
> > --- a/drivers/gpu/drm/drm_vblank.c
> > +++ b/drivers/gpu/drm/drm_vblank.c
> > @@ -342,7 +342,7 @@ static void drm_update_vblank_count(struct drm_device
> > *dev, unsigned int pipe,
> >  
> >  	DRM_DEBUG_VBL("updating vblank count on crtc %u:"
> >  		      " current=%llu, diff=%u, hw=%u hw_last=%u\n",
> > -		      pipe, atomic64_read(&vblank->count), diff,
> > +		      pipe, (unsigned long long)atomic64_read(&vblank->count),
> > diff,
> >  		      cur_vblank, vblank->last);
> 
> While touching this you could consider introducing drm_dbg_vbl().
> An maybe as a follow-up patch replace all logging in this file with the drm_*
> variants.

ok - no promises when I can actually get to this though, I've got a lot on my
plate ATM
> 
> 	Sam
> 
> >  
> >  	if (diff == 0) {
> > -- 
> > 2.26.2
> > 
> > _______________________________________________
> > dri-devel mailing list
> > dri-devel@lists.freedesktop.org
> > https://lists.freedesktop.org/mailman/listinfo/dri-devel

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
