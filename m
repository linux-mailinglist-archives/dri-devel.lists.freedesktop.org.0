Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E38B2376BBE
	for <lists+dri-devel@lfdr.de>; Fri,  7 May 2021 23:28:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7C9326EE7D;
	Fri,  7 May 2021 21:28:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B6B296EE7D
 for <dri-devel@lists.freedesktop.org>; Fri,  7 May 2021 21:28:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1620422907;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=pVNjq4cwxRpZVEM9G+ZCz6caWZiQ6FKaXq/9liRlvVI=;
 b=T+hZyPJ/jdS/MLCWk0T807dQPoYlWXpGZAoJgCdUTX5CECr2YcyelcllQ8H9jpr5g8uXdF
 z+qVaDhRNgUb6esdQNnxMXFtQAcy+oZJsCHhK3xPcnhqLpHYiF8jbhnGm29/olKHj2LDxD
 Jd4Ux2nCG8gShFL60sPggBt8hEoz914=
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-448-ew5IepA7NdKUZLA6Ur00bQ-1; Fri, 07 May 2021 17:28:19 -0400
X-MC-Unique: ew5IepA7NdKUZLA6Ur00bQ-1
Received: by mail-qk1-f197.google.com with SMTP id
 i62-20020a3786410000b02902e4f9ff4af8so7204997qkd.8
 for <dri-devel@lists.freedesktop.org>; Fri, 07 May 2021 14:28:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
 :references:organization:user-agent:mime-version
 :content-transfer-encoding;
 bh=pVNjq4cwxRpZVEM9G+ZCz6caWZiQ6FKaXq/9liRlvVI=;
 b=SIZhWlMV5hin77vKGHs3b8IcTWZhQvY/xBUrOqRtUahhRawsfFCyoB2RaAjqA5CXx6
 iEuYqEYu4D5rcCZ4qj91tOo7iKGoTDOpD9BGl17jtSdcks6Llx3pnNhPAtViQzUYYljs
 76Bd5m6UMKX+ez09svUdDbSlp1Uf8fbGK0u2/QHcon5Ic3/SlnDaP7lOH71XkijD1+J2
 3BPLc8QpFtUS1eBOI3zr/GRXMTgerbLqNcPuUqyVf9P2S70t3Uy6cu/fcsYl2a1GpxQ9
 5EKIky7L2TxcMLKewuGmdny1gOaLkvi4YYykMbR20jI1nWgj+U4HazXK/HObNRHsc8VF
 1ozg==
X-Gm-Message-State: AOAM530nvSJ3AsJVl1BGaYI6PZwfxTq72NfJMN4gBZBSGBkhMfYOy2dG
 rkTqtc0B3CQ+vLTtmJyydbvKbQXXfpFPng8FtYPF+vyxuUbXwmzkrDtA4hQ4Hcte/mrNSPWE+ya
 00xJQpFHbzlxEUWSiifE74VIbRO8P
X-Received: by 2002:ac8:109a:: with SMTP id a26mr11012785qtj.156.1620422885894; 
 Fri, 07 May 2021 14:28:05 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJx4umG7ULJ2428gNNMYBy++wm63s5NWc12Pht4FLFgn8RWxeg/DGz3zuQqldKEj2lf9x+1nFA==
X-Received: by 2002:ac8:109a:: with SMTP id a26mr11012759qtj.156.1620422885691; 
 Fri, 07 May 2021 14:28:05 -0700 (PDT)
Received: from Ruby.lyude.net (pool-108-49-102-102.bstnma.fios.verizon.net.
 [108.49.102.102])
 by smtp.gmail.com with ESMTPSA id v18sm1635624qkv.34.2021.05.07.14.28.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 07 May 2021 14:28:05 -0700 (PDT)
Message-ID: <cbbd22463a3af9efa7f12dc90b74231dc0ae5771.camel@redhat.com>
Subject: Re: [Intel-gfx] [PATCH 2/2] drm/dp: Drop open-coded
 drm_dp_is_branch() in drm_dp_read_downstream_info()
From: Lyude Paul <lyude@redhat.com>
To: Ville =?ISO-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
Date: Fri, 07 May 2021 17:28:03 -0400
In-Reply-To: <YI9otSh/ftvLqMxb@intel.com>
References: <20210430223428.10514-1-lyude@redhat.com>
 <20210430223428.10514-2-lyude@redhat.com> <YI9otSh/ftvLqMxb@intel.com>
Organization: Red Hat
User-Agent: Evolution 3.38.4 (3.38.4-1.fc33)
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=lyude@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
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
Cc: David Airlie <airlied@linux.ie>, intel-gfx@lists.freedesktop.org,
 open list <linux-kernel@vger.kernel.org>, dri-devel@lists.freedesktop.org,
 Thomas Zimmermann <tzimmermann@suse.de>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, 2021-05-03 at 06:06 +0300, Ville Syrjälä wrote:
> On Fri, Apr 30, 2021 at 06:34:28PM -0400, Lyude Paul wrote:
> > Noticed this while fixing another issue in drm_dp_read_downstream_info(),
> > the open coded DP_DOWNSTREAMPORT_PRESENT check here just duplicates what
> > we
> > already do in drm_dp_is_branch(), so just get rid of it.
> > 
> > Signed-off-by: Lyude Paul <lyude@redhat.com>
> > ---
> >  drivers/gpu/drm/drm_dp_helper.c | 4 +---
> >  1 file changed, 1 insertion(+), 3 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/drm_dp_helper.c
> > b/drivers/gpu/drm/drm_dp_helper.c
> > index 27c8c5bdf7d9..0f84df8798ab 100644
> > --- a/drivers/gpu/drm/drm_dp_helper.c
> > +++ b/drivers/gpu/drm/drm_dp_helper.c
> > @@ -677,9 +677,7 @@ int drm_dp_read_downstream_info(struct drm_dp_aux
> > *aux,
> >         memset(downstream_ports, 0, DP_MAX_DOWNSTREAM_PORTS);
> >  
> >         /* No downstream info to read */
> > -       if (!drm_dp_is_branch(dpcd) ||
> > -           dpcd[DP_DPCD_REV] < DP_DPCD_REV_10 ||
> > -           !(dpcd[DP_DOWNSTREAMPORT_PRESENT] & DP_DWN_STRM_PORT_PRESENT))
> > +       if (!drm_dp_is_branch(dpcd) || dpcd[DP_DPCD_REV] < DP_DPCD_REV_10)
> 
> BTW that DPCD_REV check looks rather wrong.
> 
> Reviewed-by: Ville Syrjälä <ville.syrjala@linux.intel.com>

I'll send out a separate fix for this in just a moment, thanks for pointing it
out!

> 
> >                 return 0;
> >  
> >         /* Some branches advertise having 0 downstream ports, despite also
> > advertising they have a
> > -- 
> > 2.30.2
> > 
> > _______________________________________________
> > Intel-gfx mailing list
> > Intel-gfx@lists.freedesktop.org
> > https://lists.freedesktop.org/mailman/listinfo/intel-gfx
> 

-- 
Cheers,
 Lyude Paul (she/her)
 Software Engineer at Red Hat

