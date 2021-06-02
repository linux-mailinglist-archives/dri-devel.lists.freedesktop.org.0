Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C128B3991D1
	for <lists+dri-devel@lfdr.de>; Wed,  2 Jun 2021 19:37:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 71FE16EE28;
	Wed,  2 Jun 2021 17:37:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com
 [IPv6:2a00:1450:4864:20::42b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 97AC06EE29
 for <dri-devel@lists.freedesktop.org>; Wed,  2 Jun 2021 17:37:55 +0000 (UTC)
Received: by mail-wr1-x42b.google.com with SMTP id q5so3136685wrs.4
 for <dri-devel@lists.freedesktop.org>; Wed, 02 Jun 2021 10:37:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=+yaTa+zDqmDiAibU5zoH8Z7YnQKRwY03Jyu/LIqtjEI=;
 b=NweQXUximI5ePuS0XoWrWeT2EWTWo74GFJr3gtWpYr4cBa/glGPCN1MFlztMmepXSt
 Vd+fbZUDe+a5tB+iB/Wbapbm2KVoW96cmcBe8F2P0kkPLtsDvIfcmdGfmbO7fJzG0Zk7
 QOp0ET0vMmsIhYhJXvLtUv1MsbC5taoVQH0DQSDnPGXzEZfKkR6aT94XYk0vILzdgB7Y
 q2SIEJmDPMsjAC2BXzw3yhqibiLA3x+sDITaR01MOpDdMA8usM26KGz0DbZQtDnJDFTV
 4PhF3is4/MZo9nsFotUgEtsFiBRan+5V8KpuZL2r7CB9s38/kYvyhEd2xo5DwkArz5Ua
 cbpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=+yaTa+zDqmDiAibU5zoH8Z7YnQKRwY03Jyu/LIqtjEI=;
 b=KuAv3JzpEst2Jfzk2moFOqJC0WtSWGrXnUo6ocbSSAGfBLcw0Gr0UBx1EufqU9oByy
 od24njrYVmvIfHspOB64kMrB1mLPYMQwMJv8TMN7h1RRVKIMlkt7wNPPpYaDrhdRk1LP
 tVZwDM25RczfML48DxBbXT9nLI8tVflb2v1Cid0tjzyFnHWJcJW7/EqU0rKsbFp17geh
 VPRxu3HAFSZPrHCygI2GyLyIdrSMV7kYT+y0tM4ngt738RBdkJzqGJUNRkhg0E0DL5jL
 PBpwqEbPPWr2Uj9pd0hri00GdGP2r25Cjq+rcwVoJO9WcGQhuJyZZ9I6t5yZBeP4DnhW
 +L7Q==
X-Gm-Message-State: AOAM5332AidXSv1woXDeFRgfx78K2rL4+Wyq4Fb3G2F0R5fI6/D8PO1J
 upukxZeeGY1vWYjVIf/9AogzeQ==
X-Google-Smtp-Source: ABdhPJweKZb3mxKzWSBDkCYDSjNL1O4y6OXQiFdyWx0qycUJBjK5T89gdX9sOaxWit8bK7NhrooxDQ==
X-Received: by 2002:a05:6000:186a:: with SMTP id
 d10mr35384063wri.41.1622655474277; 
 Wed, 02 Jun 2021 10:37:54 -0700 (PDT)
Received: from dell ([91.110.221.214])
 by smtp.gmail.com with ESMTPSA id i34sm788478wri.3.2021.06.02.10.37.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 02 Jun 2021 10:37:53 -0700 (PDT)
Date: Wed, 2 Jun 2021 18:37:52 +0100
From: Lee Jones <lee.jones@linaro.org>
To: Alex Deucher <alexdeucher@gmail.com>
Subject: Re: [RESEND 16/26] drm/amd/display/dc/dce/dce_transform: Remove
 superfluous re-initialisation of DCFE_MEM_LIGHT_SLEEP_CNTL,
Message-ID: <20210602173752.GK2173308@dell>
References: <20210602143300.2330146-1-lee.jones@linaro.org>
 <20210602143300.2330146-17-lee.jones@linaro.org>
 <CADnq5_MHcth1p_00d=0ey+kg8o=_ZQk4t-RcU7zx3fb+35uy+g@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CADnq5_MHcth1p_00d=0ey+kg8o=_ZQk4t-RcU7zx3fb+35uy+g@mail.gmail.com>
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
Cc: Leo Li <sunpeng.li@amd.com>, Mauro Rossi <issor.oruam@gmail.com>,
 LKML <linux-kernel@vger.kernel.org>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>,
 David Airlie <airlied@linux.ie>, amd-gfx list <amd-gfx@lists.freedesktop.org>,
 Alex Deucher <alexander.deucher@amd.com>,
 Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, 02 Jun 2021, Alex Deucher wrote:

> On Wed, Jun 2, 2021 at 10:33 AM Lee Jones <lee.jones@linaro.org> wrote:
> >
> > Fixes the following W=1 kernel build warning(s):
> >
> >  drivers/gpu/drm/amd/amdgpu/../display/modules/hdcp/hdcp_psp.c:374:22: warning: no previous prototype for ‘mod_hdcp_hdcp1_get_link_encryption_status’
> >  In file included from drivers/gpu/drm/amd/amdgpu/../display/dc/dce60/dce60_resource.c:28:
> >  drivers/gpu/drm/amd/amdgpu/../include/asic_reg/dce/dce_6_0_d.h:568:43: warning: initialized field overwritten [-Woverride-init]
> >  drivers/gpu/drm/amd/amdgpu/../display/dc/dce60/dce60_resource.c:157:14: note: in expansion of macro ‘mmCRTC0_DCFE_MEM_LIGHT_SLEEP_CNTL’
> >  drivers/gpu/drm/amd/amdgpu/../display/dc/dce/dce_transform.h:170:2: note: in expansion of macro ‘SRI’
> >  drivers/gpu/drm/amd/amdgpu/../display/dc/dce60/dce60_resource.c:183:3: note: in expansion of macro ‘XFM_COMMON_REG_LIST_DCE60’
> >  drivers/gpu/drm/amd/amdgpu/../display/dc/dce60/dce60_resource.c:187:3: note: in expansion of macro ‘transform_regs’
> >  drivers/gpu/drm/amd/amdgpu/../include/asic_reg/dce/dce_6_0_d.h:568:43: note: (near initialization for ‘xfm_regs[0].DCFE_MEM_LIGHT_SLEEP_CNTL’)
> >  drivers/gpu/drm/amd/amdgpu/../display/dc/dce60/dce60_resource.c:157:14: note: in expansion of macro ‘mmCRTC0_DCFE_MEM_LIGHT_SLEEP_CNTL’
> >  drivers/gpu/drm/amd/amdgpu/../display/dc/dce/dce_transform.h:170:2: note: in expansion of macro ‘SRI’
> >  drivers/gpu/drm/amd/amdgpu/../display/dc/dce60/dce60_resource.c:183:3: note: in expansion of macro ‘XFM_COMMON_REG_LIST_DCE60’
> >  drivers/gpu/drm/amd/amdgpu/../display/dc/dce60/dce60_resource.c:187:3: note: in expansion of macro ‘transform_regs’
> >  drivers/gpu/drm/amd/amdgpu/../include/asic_reg/dce/dce_6_0_d.h:645:43: warning: initialized field overwritten [-Woverride-init]
> >
> > Cc: Harry Wentland <harry.wentland@amd.com>
> > Cc: Leo Li <sunpeng.li@amd.com>
> > Cc: Alex Deucher <alexander.deucher@amd.com>
> > Cc: "Christian König" <christian.koenig@amd.com>
> > Cc: David Airlie <airlied@linux.ie>
> > Cc: Daniel Vetter <daniel@ffwll.ch>
> > Cc: Mauro Rossi <issor.oruam@gmail.com>
> > Cc: amd-gfx@lists.freedesktop.org
> > Cc: dri-devel@lists.freedesktop.org
> > Signed-off-by: Lee Jones <lee.jones@linaro.org>
> > ---
> >  drivers/gpu/drm/amd/display/dc/dce/dce_transform.h | 3 +--
> >  1 file changed, 1 insertion(+), 2 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/amd/display/dc/dce/dce_transform.h b/drivers/gpu/drm/amd/display/dc/dce/dce_transform.h
> > index cbce194ec7b82..e98b5d4141739 100644
> > --- a/drivers/gpu/drm/amd/display/dc/dce/dce_transform.h
> > +++ b/drivers/gpu/drm/amd/display/dc/dce/dce_transform.h
> > @@ -166,8 +166,7 @@
> >         SRI(SCL_F_SHARP_CONTROL, SCL, id)
> >
> >  #define XFM_COMMON_REG_LIST_DCE60(id) \
> > -       XFM_COMMON_REG_LIST_DCE60_BASE(id), \
> > -       SRI(DCFE_MEM_LIGHT_SLEEP_CNTL, CRTC, id)
> > +       XFM_COMMON_REG_LIST_DCE60_BASE(id)
> 
> I believe DCFE_MEM_LIGHT_SLEEP_CNTL should be kept here and it should
> be removed from
> XFM_COMMON_REG_LIST_DCE60_BASE() to align with other asics.

Ack.  Sorry for missing this.

-- 
Lee Jones [李琼斯]
Senior Technical Lead - Developer Services
Linaro.org │ Open source software for Arm SoCs
Follow Linaro: Facebook | Twitter | Blog
