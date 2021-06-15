Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7480A3A89F7
	for <lists+dri-devel@lfdr.de>; Tue, 15 Jun 2021 22:08:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 720E889C69;
	Tue, 15 Jun 2021 20:07:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x236.google.com (mail-oi1-x236.google.com
 [IPv6:2607:f8b0:4864:20::236])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 57B4089C69;
 Tue, 15 Jun 2021 20:07:58 +0000 (UTC)
Received: by mail-oi1-x236.google.com with SMTP id w127so19545006oig.12;
 Tue, 15 Jun 2021 13:07:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=grpU+dQ6BtmxyQhqwU8VFa14I3/A2Q4X/WY+Pgyf6LU=;
 b=i95F7m9fSgaCfK1vBEfApT1tlSEjk19eUCHmQCgPU3lENBPylJ9IljD7V+1hDtpIO5
 J4uwdhfHQawtz00tf4AJG2xJtxkqbDEXVB/nzknIAC8tn4mLbSg78YlColMLDNlsU0YG
 n4qT4l8cL+iGNVLmK3F2JPDYMh6l+tybd/5ma6JdsmK+VXL5hPS8zJ2zDDCc/Ex7v0Wh
 GAGq4dHALmIoRnt6YDZyaE514UwJPJmK0EcyCobAHk/8F4elgtR/4/YWyGg4zHxZn4AE
 wGiFddT9qzc20CpHvC1HHdidvwAoSXmXQN0rmU4VRdYtqaDjg+M4YengxDYlj/gESBIf
 hQow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=grpU+dQ6BtmxyQhqwU8VFa14I3/A2Q4X/WY+Pgyf6LU=;
 b=QXYa0IyTZtofI/LXPSX2iNkLm1guveq2x5+TwhgQUz6So86nU/VTR8WAGjROh0PzCO
 GOKrA98i5Ov6mdkaL3yKmd9DgNBbIvIJq2VavNPizPHjyP5PUKlBLc5iI2JNUrntUAoH
 Dgp+IRf+pVvhzDNXxhh+V/O/3FW9eOXuVNAABfBYAcrpgm02rRfL0F8Y/t4xs0VCVv9o
 4DOqlF/eRRR9C6/R2BB9WIyh/xtVNpanRDK34FDzZKzfNnDoWwTztGVLuGfVfB8r2gyE
 23MDP1Ok52o32XTyn18IgdjBcfFHk3ukN6j9kfYLKTce0eSTSVubgd3PqqOmNjhNiv3V
 HIdg==
X-Gm-Message-State: AOAM532JNMuYhonIFE6JzYze+U4W3mKXARcwafDbRQ3I9vK3Xrv3T2fa
 k6pDiDD/B8+6ILF2WFH3mR8TYndnixRGWuLmTp8=
X-Google-Smtp-Source: ABdhPJwzP9efs2U6D7VzGqrlTEr9BDxh02uo2PpPnHgBG/J7KcRFMiuDelbPo7UwGsMyezXZFRpLA4KQlSdsxMJnIkA=
X-Received: by 2002:a05:6808:999:: with SMTP id
 a25mr556675oic.123.1623787677732; 
 Tue, 15 Jun 2021 13:07:57 -0700 (PDT)
MIME-Version: 1.0
References: <20210615114410.7708-1-wanjiabing@vivo.com>
 <20210615125402.nhvl2g7q2da4sb3r@outlook.office365.com>
In-Reply-To: <20210615125402.nhvl2g7q2da4sb3r@outlook.office365.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Tue, 15 Jun 2021 16:07:46 -0400
Message-ID: <CADnq5_P7petfdwXgfe-JK4NYgQoojHB6tpJ2ejrt+1Fyg6TDrA@mail.gmail.com>
Subject: Re: [PATCH] drm: display: Fix duplicate field initialization in dcn31
To: Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>
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
Cc: Dmytro Laktyushkin <Dmytro.Laktyushkin@amd.com>,
 Wan Jiabing <wanjiabing@vivo.com>, Leo Li <sunpeng.li@amd.com>, "Pan,
 Xinhui" <Xinhui.Pan@amd.com>, Zhan Liu <zhan.liu@amd.com>,
 LKML <linux-kernel@vger.kernel.org>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>, Roman Li <roman.li@amd.com>,
 David Airlie <airlied@linux.ie>, Yongqiang Sun <yongqiang.sun@amd.com>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>,
 Alex Deucher <alexander.deucher@amd.com>,
 Nikola Cornij <nikola.cornij@amd.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Applied.  Thanks!


On Tue, Jun 15, 2021 at 8:54 AM Rodrigo Siqueira
<Rodrigo.Siqueira@amd.com> wrote:
>
> On 06/15, Wan Jiabing wrote:
> > Fix the following coccicheck warning:
> > drivers/gpu/drm/amd/display/dc/dcn31/dcn31_resource.c:917:56-57:
> > pstate_enabled: first occurrence line 935, second occurrence line 937
> >
> > Signed-off-by: Wan Jiabing <wanjiabing@vivo.com>
> > ---
> >  drivers/gpu/drm/amd/display/dc/dcn31/dcn31_resource.c | 1 -
> >  1 file changed, 1 deletion(-)
> >
> > diff --git a/drivers/gpu/drm/amd/display/dc/dcn31/dcn31_resource.c b/drivers/gpu/drm/amd/display/dc/dcn31/dcn31_resource.c
> > index 0d6cb6caad81..c67bc9544f5d 100644
> > --- a/drivers/gpu/drm/amd/display/dc/dcn31/dcn31_resource.c
> > +++ b/drivers/gpu/drm/amd/display/dc/dcn31/dcn31_resource.c
> > @@ -934,7 +934,6 @@ static const struct dc_debug_options debug_defaults_drv = {
> >       .dmub_command_table = true,
> >       .pstate_enabled = true,
> >       .use_max_lb = true,
> > -     .pstate_enabled = true,
> >       .enable_mem_low_power = {
> >               .bits = {
> >                       .vga = false,
> > --
> > 2.20.1
> >
>
> Reviewed-by: Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>
>
> Thanks
>
> --
> Rodrigo Siqueira
> https://siqueira.tech
> _______________________________________________
> amd-gfx mailing list
> amd-gfx@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/amd-gfx
