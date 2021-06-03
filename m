Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DBC9399FC9
	for <lists+dri-devel@lfdr.de>; Thu,  3 Jun 2021 13:30:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BCAB16E160;
	Thu,  3 Jun 2021 11:30:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x62e.google.com (mail-ej1-x62e.google.com
 [IPv6:2a00:1450:4864:20::62e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 130046E160
 for <dri-devel@lists.freedesktop.org>; Thu,  3 Jun 2021 11:30:13 +0000 (UTC)
Received: by mail-ej1-x62e.google.com with SMTP id g20so8788437ejt.0
 for <dri-devel@lists.freedesktop.org>; Thu, 03 Jun 2021 04:30:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:mail-followup-to:references
 :mime-version:content-disposition:in-reply-to;
 bh=JQPG6yu+Jm/v1G300jVvmHhYJLJT/kgFqNxsmCD/SVU=;
 b=UuqGhLwhKPL2UZnJsZIyrY79pLOgLOqaHSPoNPoeWc4N8hx4767TnTwEsF3LZNtla/
 TPZGQVe+8BS7Rw28Rr950sI7gD11EViAabcSK9u58VHuMCAx2R8h+yL+P3NSDkYdJwy8
 LXhaBkjbtGs8KE5u0+ntseLSRBv+usQy6/MIw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id
 :mail-followup-to:references:mime-version:content-disposition
 :in-reply-to;
 bh=JQPG6yu+Jm/v1G300jVvmHhYJLJT/kgFqNxsmCD/SVU=;
 b=C2KE8NRcDbnNeMtXyjk4K79JUkc3Lzfu/98xNToN/to7PKwYFmcyoovkm08PowLUtE
 DGRrGhFtjdGfFlppWLX+QeF72S2chFybsa4F/iol6JxDrrPZ2EY+4QkNAeugtr6gSiWW
 q74ngsWWA31cjEvxN52X9VnrxW3Fnb5W8e1df8CSXOfeCBRe3Pkm5sx8pBrNojth4a9m
 bZ4iK6p/59aMjv38TsyC79oZFNp9IzUXoUD5Rym4NRyUssr6HLjhZjo9BpGUPDVkj9BR
 4vvmzjclhI8KrNLilxTKg0mdkWs4B02UP7zCNmg+r8CrJ5P4jnEGJocMT4jO4e74613u
 wGOg==
X-Gm-Message-State: AOAM5326EkexEc/k61P95Guc0Wf4KvnkvzMz1n5cV042KPmUCrVFdiUf
 K6/54gnzULPzUzuFmKpWPLUORw==
X-Google-Smtp-Source: ABdhPJwMUYfrOxIGftaR7UridML3dSa22TrXpD7HPzzADNMlpuQKbmkVQuxyFkP0lSzr1wU3d3ESbQ==
X-Received: by 2002:a17:907:72d2:: with SMTP id
 du18mr38469724ejc.438.1622719811673; 
 Thu, 03 Jun 2021 04:30:11 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id c14sm1402302ejm.4.2021.06.03.04.30.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 03 Jun 2021 04:30:10 -0700 (PDT)
Date: Thu, 3 Jun 2021 13:30:08 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Subject: Re: [RESEND 17/26] drm/xlnx/zynqmp_disp: Fix incorrectly named enum
 'zynqmp_disp_layer_id'
Message-ID: <YLi9QI76rFWva6ID@phenom.ffwll.local>
Mail-Followup-To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Lee Jones <lee.jones@linaro.org>, linux-kernel@vger.kernel.org,
 Hyun Kwon <hyun.kwon@xilinx.com>, David Airlie <airlied@linux.ie>,
 Michal Simek <michal.simek@xilinx.com>,
 dri-devel@lists.freedesktop.org,
 linux-arm-kernel@lists.infradead.org
References: <20210602143300.2330146-1-lee.jones@linaro.org>
 <20210602143300.2330146-18-lee.jones@linaro.org>
 <YLev02lSORBOlqw+@pendragon.ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YLev02lSORBOlqw+@pendragon.ideasonboard.com>
X-Operating-System: Linux phenom 5.10.32scarlett+ 
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
Cc: Hyun Kwon <hyun.kwon@xilinx.com>, David Airlie <airlied@linux.ie>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Michal Simek <michal.simek@xilinx.com>, Lee Jones <lee.jones@linaro.org>,
 linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Jun 02, 2021 at 07:20:35PM +0300, Laurent Pinchart wrote:
> Hi Lee,
> 
> Thank you for the patch.
> 
> On Wed, Jun 02, 2021 at 03:32:51PM +0100, Lee Jones wrote:
> > Fixes the following W=1 kernel build warning(s):
> > 
> >  drivers/gpu/drm/xlnx/zynqmp_disp.c:101: warning: expecting prototype for enum zynqmp_disp_id. Prototype was for enum zynqmp_disp_layer_id instead
> > 
> > Cc: Hyun Kwon <hyun.kwon@xilinx.com>
> > Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> > Cc: David Airlie <airlied@linux.ie>
> > Cc: Daniel Vetter <daniel@ffwll.ch>
> > Cc: Michal Simek <michal.simek@xilinx.com>
> > Cc: dri-devel@lists.freedesktop.org
> > Cc: linux-arm-kernel@lists.infradead.org
> > Signed-off-by: Lee Jones <lee.jones@linaro.org>
> 
> Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

I'm assuming you'll merge these two for xlnx somehow?
-Daniel

> 
> > ---
> >  drivers/gpu/drm/xlnx/zynqmp_disp.c | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> > 
> > diff --git a/drivers/gpu/drm/xlnx/zynqmp_disp.c b/drivers/gpu/drm/xlnx/zynqmp_disp.c
> > index 109d627968ac0..ca1161ec9e16f 100644
> > --- a/drivers/gpu/drm/xlnx/zynqmp_disp.c
> > +++ b/drivers/gpu/drm/xlnx/zynqmp_disp.c
> > @@ -91,7 +91,7 @@ struct zynqmp_disp_format {
> >  };
> >  
> >  /**
> > - * enum zynqmp_disp_id - Layer identifier
> > + * enum zynqmp_disp_layer_id - Layer identifier
> >   * @ZYNQMP_DISP_LAYER_VID: Video layer
> >   * @ZYNQMP_DISP_LAYER_GFX: Graphics layer
> >   */
> 
> -- 
> Regards,
> 
> Laurent Pinchart

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
