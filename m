Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C153209AD1
	for <lists+dri-devel@lfdr.de>; Thu, 25 Jun 2020 09:53:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4C1D389FC0;
	Thu, 25 Jun 2020 07:53:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x344.google.com (mail-wm1-x344.google.com
 [IPv6:2a00:1450:4864:20::344])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7787889FC0
 for <dri-devel@lists.freedesktop.org>; Thu, 25 Jun 2020 07:53:42 +0000 (UTC)
Received: by mail-wm1-x344.google.com with SMTP id o2so4910342wmh.2
 for <dri-devel@lists.freedesktop.org>; Thu, 25 Jun 2020 00:53:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:mail-followup-to:references
 :mime-version:content-disposition:in-reply-to;
 bh=QhFF+JhtH5OrbA2XVfa4DEMoq1rPmq5A541noBohoEI=;
 b=dbum92HacgzVfcv5HyBVk4jTj4zjsMSRuPnugG4qBlK9zxfz+PiLRjLwKR6lr2PW+0
 E8QWSPaMgLpkHkyRw5PCAzc4dC2wDWRk37C+K0E2B7QdTiRDa73eLJG7aZG706RoTmKe
 4AlhpK9mFuUPoMxycv+1Km95Zufyc/4TO2i0E=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id
 :mail-followup-to:references:mime-version:content-disposition
 :in-reply-to;
 bh=QhFF+JhtH5OrbA2XVfa4DEMoq1rPmq5A541noBohoEI=;
 b=nT7E4G7Y3teLItT+iXgB4vWPMFACmQjyF6vxYWZs4p85ckVG921elX0NLrEZAgdjiL
 qpN9GoRr/dDjqt3TWT6MeHFNYESigDO6MRPPmZeDR35YZNpfI/GELCWwOJ4PYo/tgW9L
 7DuU18uIIPNhcYWNnrRJCZamFufxCCempoqLGJLleStVRyQoWds/5TPS4OSYH24QbSn1
 U3taaUNRkFjMEOz2o3EO5EEgXr3bR0y+LR4hgjImbLILpS8Td6FWo1L8+qsLZhnDyCP6
 fL6Z1/BkoA8d+YDhysME7rqn0fQCcaiWYHYVPG6Svp6Sw+xiIMJ+JkS6FuyHBP7dDTtN
 3UBA==
X-Gm-Message-State: AOAM530qdHmn4dDvN4tQJtQmPqGNEXzV/Fp8+I6rtSfxfmtiDSBvlCAD
 r3dHEZAi7swXUDaK7yDIkhtWuQ==
X-Google-Smtp-Source: ABdhPJwk5m6H2Tp1NSk8W7Q7efXaGQpX9fClYnMmVqGc/bGphvNrVx6oIBY7RwQwAd9rZkulo8fFvg==
X-Received: by 2002:a1c:e355:: with SMTP id a82mr1996753wmh.165.1593071620044; 
 Thu, 25 Jun 2020 00:53:40 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id k126sm5848415wme.17.2020.06.25.00.53.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 25 Jun 2020 00:53:39 -0700 (PDT)
Date: Thu, 25 Jun 2020 09:53:36 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Yannick FERTRE <yannick.fertre@st.com>
Subject: Re: [PATCH] drm/bridge: dw-mipi-dsi.c: remove unused header file
Message-ID: <20200625075336.GB3278063@phenom.ffwll.local>
Mail-Followup-To: Yannick FERTRE <yannick.fertre@st.com>,
 Angelo Ribeiro <Angelo.Ribeiro@synopsys.com>,
 Philippe CORNU <philippe.cornu@st.com>,
 Benjamin GAIGNARD <benjamin.gaignard@st.com>,
 "airlied@linux.ie" <airlied@linux.ie>,
 "mcoquelin.stm32@gmail.com" <mcoquelin.stm32@gmail.com>,
 Alexandre TORGUE <alexandre.torgue@st.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linux-stm32@st-md-mailman.stormreply.com"
 <linux-stm32@st-md-mailman.stormreply.com>, 
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, 
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Gustavo Pimentel <Gustavo.Pimentel@synopsys.com>,
 Joao Pinto <Joao.Pinto@synopsys.com>,
 Jose Abreu <Jose.Abreu@synopsys.com>
References: <171ff1fb3918664a570dc8f2f34b446612505f76.1585832665.git.angelo.ribeiro@synopsys.com>
 <669d5484-b1e5-dd5c-b4e5-f3b5a8b436b4@st.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <669d5484-b1e5-dd5c-b4e5-f3b5a8b436b4@st.com>
X-Operating-System: Linux phenom 5.6.0-1-amd64 
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
Cc: Jose Abreu <Jose.Abreu@synopsys.com>, Joao Pinto <Joao.Pinto@synopsys.com>,
 "airlied@linux.ie" <airlied@linux.ie>,
 Gustavo Pimentel <Gustavo.Pimentel@synopsys.com>,
 Philippe CORNU <philippe.cornu@st.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Alexandre TORGUE <alexandre.torgue@st.com>,
 Angelo Ribeiro <Angelo.Ribeiro@synopsys.com>,
 "mcoquelin.stm32@gmail.com" <mcoquelin.stm32@gmail.com>,
 "linux-stm32@st-md-mailman.stormreply.com"
 <linux-stm32@st-md-mailman.stormreply.com>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
 Benjamin GAIGNARD <benjamin.gaignard@st.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Jun 24, 2020 at 03:08:22PM +0000, Yannick FERTRE wrote:
> Hello Angelo,
> thank for patch.
> 
> Reviewed-by: Yannick Fertre <yannick.fertre@st.com>

Patch applied, thanks.
-Daniel

> 
> 
> 
> On 4/3/20 3:30 PM, Angelo Ribeiro wrote:
> > dw-mipi-dsi does not use any definition from drm_probe_helper.
> > 
> > Coverity output:
> > Event unnecessary_header:
> > Including .../include/drm/drm_probe_helper.h does not provide any
> > needed symbols.
> > 
> > Cc: Gustavo Pimentel <gustavo.pimentel@synopsys.com>
> > Cc: Joao Pinto <jpinto@synopsys.com>
> > Cc: Jose Abreu <jose.abreu@synopsys.com>
> > Signed-off-by: Angelo Ribeiro <angelo.ribeiro@synopsys.com>
> > ---
> >   drivers/gpu/drm/bridge/synopsys/dw-mipi-dsi.c | 1 -
> >   1 file changed, 1 deletion(-)
> > 
> > diff --git a/drivers/gpu/drm/bridge/synopsys/dw-mipi-dsi.c b/drivers/gpu/drm/bridge/synopsys/dw-mipi-dsi.c
> > index 024acad..582635d 100644
> > --- a/drivers/gpu/drm/bridge/synopsys/dw-mipi-dsi.c
> > +++ b/drivers/gpu/drm/bridge/synopsys/dw-mipi-dsi.c
> > @@ -27,7 +27,6 @@
> >   #include <drm/drm_modes.h>
> >   #include <drm/drm_of.h>
> >   #include <drm/drm_print.h>
> > -#include <drm/drm_probe_helper.h>
> >   
> >   #define HWVER_131			0x31333100	/* IP version 1.31 */
> >   
> > 

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
