Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CF8B555BC33
	for <lists+dri-devel@lfdr.de>; Mon, 27 Jun 2022 23:43:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 98E3710F466;
	Mon, 27 Jun 2022 21:43:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x52b.google.com (mail-ed1-x52b.google.com
 [IPv6:2a00:1450:4864:20::52b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D5CA810F44C;
 Mon, 27 Jun 2022 21:43:40 +0000 (UTC)
Received: by mail-ed1-x52b.google.com with SMTP id eq6so14904147edb.6;
 Mon, 27 Jun 2022 14:43:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=H1XknEnfRCFWWO1LXEJmw/yXLZDBD0z0CO+bXSUF3KY=;
 b=VfraCNxL3WGDCeRLxpsTD6VREJ07+yuuUDSzFON46Edw6+tXSXffSdDoF7eoQ4xdo1
 4/eFKWb/m/jURAq8eVhrhAlrtNryoFQE2LZ3kwNC9xh1AnWbkoXeNGSkBzm9CH070RKQ
 tuGscuRmNWmyMAHr96xKdTXJFwtva3l5WPDSbeHDADaYA7AvpiboY0DY/e5hg8Nk8hfr
 4o8P+8tiL4EoS+5WZ3J1KZ+QYcFKspqN5KVoUYaem4dhZhdUScy3tEoj9quq09ZkPKdA
 oEDh77ToBPLW+T7NoWX3X1k2GZNNRRO9//n2moFcOYbiy6e9MfRz5Iys81hsJ81gj20Y
 xRWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=H1XknEnfRCFWWO1LXEJmw/yXLZDBD0z0CO+bXSUF3KY=;
 b=8OOr8McV/yfQ4PNfIYCDssZTLhIrXFHl9l0+jw2qgwSWjDNKReNfQ1ihYaGWl9MhA4
 YZmKkVYDEYFWRZtLCSTqds9pIyJwaYiHCNxsreu7DrVBtpUTZuEPneHN0ZbkglveM2J/
 KxhAPzpu6bCUgEZYA3pLsaTF6BGTDB8UwZH08/44DFf6hbimStsticfDv5FQQMEQR8BU
 E+Te9/KANgFTKbPTPQgB4aodeOwQL/+rqigTloJ33Qn0Sd6SCfBLcSflL7VqcYZ0BnDg
 m7IylbiXizonsH6xqcVP+hlZQpHBjFwPtwDIDp9CJjdJ2ssc/PhozOVctlUDKXJsTk8F
 5kDw==
X-Gm-Message-State: AJIora//dfC02VDuhyK1OdST2B+Ti8Q+HP0Upm5yvkRSFqbxfzbdKTd6
 +R74d2pWN72jOxocOnfjSvIneHsF6WIhMQJGArg=
X-Google-Smtp-Source: AGRyM1ty/F1vTKJ4iSXafpmMdgGebsJxkxtMH0H5oixaFzda6xrN+UoEjNyjWvXW0aPqdyRCXLmG71/0bvD9Z4sYB2c=
X-Received: by 2002:a05:6402:158e:b0:435:7d0f:ac85 with SMTP id
 c14-20020a056402158e00b004357d0fac85mr19127349edv.93.1656366219396; Mon, 27
 Jun 2022 14:43:39 -0700 (PDT)
MIME-Version: 1.0
References: <20220626144615.2227149-1-trix@redhat.com>
 <34b5c26c-bf3f-4b7c-3dd8-9e1317968c28@amd.com>
In-Reply-To: <34b5c26c-bf3f-4b7c-3dd8-9e1317968c28@amd.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Mon, 27 Jun 2022 17:43:27 -0400
Message-ID: <CADnq5_P8J12C-QZL7U9x6rs2RV44o-rvmESd7_R9b9qZuD_XhA@mail.gmail.com>
Subject: Re: [PATCH] drm/amd/display: change to_dal_irq_source_dnc32() storage
 class specifier to static
To: Aurabindo Pillai <aurabindo.pillai@amd.com>
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
Cc: amd-gfx list <amd-gfx@lists.freedesktop.org>,
 "Leo \(Sunpeng\) Li" <sunpeng.li@amd.com>, Tom Rix <trix@redhat.com>,
 Qingqing Zhuo <Qingqing.Zhuo@amd.com>, xinhui pan <Xinhui.Pan@amd.com>,
 "Siqueira, Rodrigo" <Rodrigo.Siqueira@amd.com>,
 LKML <linux-kernel@vger.kernel.org>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>, "Kazlauskas,
 Nicholas" <nicholas.kazlauskas@amd.com>, Dave Airlie <airlied@linux.ie>,
 "Limonciello, Mario" <mario.limonciello@amd.com>,
 =?UTF-8?B?TWHDrXJhIENhbmFs?= <maira.canal@usp.br>, "Deucher,
 Alexander" <alexander.deucher@amd.com>,
 Christian Koenig <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Applied.  Thanks!

Alex

On Mon, Jun 27, 2022 at 9:20 AM Aurabindo Pillai
<aurabindo.pillai@amd.com> wrote:
>
>
>
> On 2022-06-26 10:46, Tom Rix wrote:
> > sparse reports
> > drivers/gpu/drm/amd/amdgpu/../display/dc/irq/dcn32/irq_service_dcn32.c:39:20: warning: symbol 'to_dal_irq_source_dcn32' was not declared. Should it be static?
> >
> > to_dal_irq_source_dnc32() is only referenced in irq_service_dnc32.c, so change its
> > storage class specifier to static.
> >
> > Fixes: 0efd4374f6b4 ("drm/amd/display: add dcn32 IRQ changes")
> > Signed-off-by: Tom Rix <trix@redhat.com>
> > ---
> >   drivers/gpu/drm/amd/display/dc/irq/dcn32/irq_service_dcn32.c | 2 +-
> >   1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/drivers/gpu/drm/amd/display/dc/irq/dcn32/irq_service_dcn32.c b/drivers/gpu/drm/amd/display/dc/irq/dcn32/irq_service_dcn32.c
> > index 3a213ca2f077..b1012fa1977b 100644
> > --- a/drivers/gpu/drm/amd/display/dc/irq/dcn32/irq_service_dcn32.c
> > +++ b/drivers/gpu/drm/amd/display/dc/irq/dcn32/irq_service_dcn32.c
> > @@ -36,7 +36,7 @@
> >
> >   #define DCN_BASE__INST0_SEG2                       0x000034C0
> >
> > -enum dc_irq_source to_dal_irq_source_dcn32(
> > +static enum dc_irq_source to_dal_irq_source_dcn32(
> >               struct irq_service *irq_service,
> >               uint32_t src_id,
> >               uint32_t ext_id)
>
> Reviewed-by: Aurabindo Pillai <aurabindo.pillai@amd.com>
