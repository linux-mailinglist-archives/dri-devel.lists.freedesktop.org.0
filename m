Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3DB0554DE59
	for <lists+dri-devel@lfdr.de>; Thu, 16 Jun 2022 11:45:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DF61E113D7C;
	Thu, 16 Jun 2022 09:44:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x62f.google.com (mail-ej1-x62f.google.com
 [IPv6:2a00:1450:4864:20::62f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 18B59113D7C
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Jun 2022 09:44:58 +0000 (UTC)
Received: by mail-ej1-x62f.google.com with SMTP id gl15so1742320ejb.4
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Jun 2022 02:44:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=raspberrypi.com; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=mhKDWh309DCiaIkvC+yjcO+PIaX4ExpmBkvJNenQmOY=;
 b=icUQO2AVW2z4ISKHDbAnhDIBXLqKT+UHUcDy/7AeMofpJpbJBZHvcjH2r8IV+aoNWL
 eiY+s/LezYvaADkmzgxeafqSj3i03DXWrwSCc9LW/pkDGuj2sIyzCs8jS451XXWU2UFq
 v3YK7ZEK3P3awPRKaWaw0me4gOCqHCjVCRlqY32O6AoeVg6JQiwqSxX2MNx/qY0aB2Qk
 3+AJ2D0jxZmP+THmMao5FYIY9mLYTQ08ynFGs79p3xAIh/3mI4EE4rpY37z+sYrdStuA
 O/gXmIRC6AYtkOxxXm6882NSR+cBZmKry1cnyQ7FsSYRsMfht/HzRSFFkhFBDFNjMTUz
 +c6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=mhKDWh309DCiaIkvC+yjcO+PIaX4ExpmBkvJNenQmOY=;
 b=oVNwsyyPFjXLW7/a8c/5fLiIb7YBeNTfSdyDsTPLs+7APm/Jz0ke6XxUEKFHJXX5/9
 6ScT1SKMEgm/3gCcTv7lzUIQG9MrngNcQ/h450FaoAnremj/tkerc4yzLLmDNkJzuWDO
 corQ1X9cLUfKBedfBR6cvJENtAOdNxA3f5TBH6GC896qIlXS4FkLip2u0FRtFzf25ds6
 tB3iFGTKujkzGVJ1AFbGy8mKd7OohdT2pWd/RVB73Sxa9v4PLHKwqejCLLqI9PGfzVeg
 ATj16kPmQDzbZdAxKFk/ivKj2a9B9SFWmrIWnD0gMNrszKySm/RhGQ/o+LIKkVZ+pICL
 x9rg==
X-Gm-Message-State: AJIora+tEmdIf+xlxMmCa4mdtn5QHAkBOMFJVZpRlF6kLwLKpt+AJrto
 g0+4TI3QchsVDfMQveXUDRQCfhMiKW9sQB/hzQd8oQ==
X-Google-Smtp-Source: AGRyM1u0p+HcFY+QTv0+IYnKTmxsMK8SoKgxauv9LeMqak6wWDhSMeCnx3Cs7t57k/Q33vyaD+HfgtLV3SuR/F2mMIY=
X-Received: by 2002:a17:907:7b9b:b0:71b:6f0a:c480 with SMTP id
 ne27-20020a1709077b9b00b0071b6f0ac480mr1503888ejc.175.1655372696676; Thu, 16
 Jun 2022 02:44:56 -0700 (PDT)
MIME-Version: 1.0
References: <20220610092924.754942-1-maxime@cerno.tech>
 <20220610092924.754942-18-maxime@cerno.tech>
 <CAPY8ntCHiO7QrhOw7doE7PtzuTJEp4-u20rT_RDRBCmZ8fnQRw@mail.gmail.com>
 <20220616094103.dubzsbf2uuny472o@houat>
In-Reply-To: <20220616094103.dubzsbf2uuny472o@houat>
From: Dave Stevenson <dave.stevenson@raspberrypi.com>
Date: Thu, 16 Jun 2022 10:44:41 +0100
Message-ID: <CAPY8ntAZa8bcgPyoigiO6nPtwB4iNL6YkO6yxy5z65_-BNNfXQ@mail.gmail.com>
Subject: Re: [PATCH 17/64] drm/vc4: crtc: Move debugfs_name to crtc_data
To: Maxime Ripard <maxime@cerno.tech>
Content-Type: text/plain; charset="UTF-8"
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
Cc: David Airlie <airlied@linux.ie>, Daniel Vetter <daniel.vetter@intel.com>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Thomas Zimmermann <tzimmermann@suse.de>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, 16 Jun 2022 at 10:41, Maxime Ripard <maxime@cerno.tech> wrote:
>
> Hi Dave,
>
> On Tue, Jun 14, 2022 at 04:57:45PM +0100, Dave Stevenson wrote:
> > On Fri, 10 Jun 2022 at 10:30, Maxime Ripard <maxime@cerno.tech> wrote:
> > >
> > > All the CRTCs, including the TXP, have a debugfs file and name so we can
> > > consolidate it into vc4_crtc_data.
> > >
> > > Signed-off-by: Maxime Ripard <maxime@cerno.tech>
> >
> > Reviewed-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
> >
> > I was sort of expecting the vc4_debugfs_add_regset32 call to move to
> > vc4_crtc_init so that it would be a common call for crtcs and txp, but
> > that doesn't appear to happen in this set. The debugfs_name for the
> > txp is therefore actually unused.
>
> As of this patch, you're right
>
> This is later changed by some other patch though:
> https://lore.kernel.org/all/20220610092924.754942-60-maxime@cerno.tech/

Indeed, and that cleans it all up. Perfect.

  Dave
