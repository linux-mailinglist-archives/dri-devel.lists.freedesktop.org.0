Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B354469755B
	for <lists+dri-devel@lfdr.de>; Wed, 15 Feb 2023 05:23:42 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0CBA910E112;
	Wed, 15 Feb 2023 04:23:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x232.google.com (mail-oi1-x232.google.com
 [IPv6:2607:f8b0:4864:20::232])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0A79210E112;
 Wed, 15 Feb 2023 04:23:34 +0000 (UTC)
Received: by mail-oi1-x232.google.com with SMTP id bg11so94970oib.9;
 Tue, 14 Feb 2023 20:23:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=28pkhs7BNsOxA9fRLX3gZsoQIzciaQoaB4lJUO4D5nY=;
 b=Fa8w4E5izzvn9yFXqCRURcAGEdKWPXgAVpTypsZf43R4pZtoQ3BKjRGad+ww+Mq3kV
 tCkj2izkJmSLl9QQRPMSGqBvoEdBj3NSacSh/eyFiuPFFXhOTV8zBeog09F3LE4uUsmT
 /RCT8MO52WkmNgJZoS6jbFa5kX2SvxQ3/1mdfWkZYSTKkZpWL4RpewpFG31E4Zuv8NMj
 jM2ljuVp/QwD6mAx9B24TZbeWpPABgh0pG5YEnE6gYHfvQGBwKBir832LIAQqD+j+KLW
 LyCoLhyxUsd8FjY660egh2HFIQoChtfsBaYpw1RGvLENovmjMWicbopSs2yGEAa7M0LR
 3ObQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=28pkhs7BNsOxA9fRLX3gZsoQIzciaQoaB4lJUO4D5nY=;
 b=fYCiL+YmKuP/MqLDR6a003qC4YYExhTmRC/kFRXG8iqGpqlXAelRz/2xa2SKKNtpfR
 cI1RRd090UrNmWm5OT1w/kHjQPomysrY1fu9/puzlvkd4cp41FGfGXC7qtWzMQlXypOJ
 dVYHfXVX6bmYB9RAwl2M6HlMkhsM60PA+iGLuShMindQiqVDq17rVKoO6T09tVKfW+bs
 Xq4lBiXh7c6wqHRGM3LECmv73npyYQPE+26kEER2kzpD03m2yxo3J6HEccqs7QylaE7N
 rfBYqVVJ+qZD3ue4+F7MulVqw4nvUJLy4YxQ5E3xqXzYxOFtR1Nt+1xJg7Ag6kTLQfe8
 w3bA==
X-Gm-Message-State: AO0yUKXvA4CVf2K7dJENtbgxIAUoKhrhDxhIyruk4FDMtclQRJm1VtVZ
 2ucZMX2jbsR11a3y4+yvVRd0JeTaEAJik4cydr0=
X-Google-Smtp-Source: AK7set/r++RbOmGbzjb+Yp69hd6JJ+g/KPtzvE2ZN65RIpZijc9zcasmQbwcBLPttyQOlCwlijCKJ5KJ3pabQ1tBe1M=
X-Received: by 2002:aca:ded7:0:b0:35b:d93f:cbc4 with SMTP id
 v206-20020acaded7000000b0035bd93fcbc4mr96257oig.96.1676435013946; Tue, 14 Feb
 2023 20:23:33 -0800 (PST)
MIME-Version: 1.0
References: <Y+YYZ4SbMQBcpTZP@ubun2204.myguest.virtualbox.org>
 <c64bb7b8-ab50-78c3-bb56-820ce96a1e14@amd.com>
In-Reply-To: <c64bb7b8-ab50-78c3-bb56-820ce96a1e14@amd.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Tue, 14 Feb 2023 23:23:22 -0500
Message-ID: <CADnq5_NektE+iS4VUXjha=WOOo4WRKCM3dXnYfP7RBtGztCZVA@mail.gmail.com>
Subject: Re: [PATCH] drm/amd/display: Remove duplicate/repeating expression
To: Harry Wentland <harry.wentland@amd.com>
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
Cc: Saurabh Singh Sengar <ssengar@microsoft.com>,
 Deepak R Varma <drv@mailo.com>, "Pan, Xinhui" <Xinhui.Pan@amd.com>,
 Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>, linux-kernel@vger.kernel.org,
 amd-gfx@lists.freedesktop.org, Leo Li <sunpeng.li@amd.com>,
 dri-devel@lists.freedesktop.org, Alex Deucher <alexander.deucher@amd.com>,
 Praveen Kumar <kumarpraveen@linux.microsoft.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Applied.  Thanks!

On Fri, Feb 10, 2023 at 10:22 AM Harry Wentland <harry.wentland@amd.com> wrote:
>
> On 2/10/23 05:11, Deepak R Varma wrote:
> > Remove duplicate or repeating expressions in the if condition
> > evaluation. Issue identified using doubletest.cocci Coccinelle semantic
> > patch.
> >
> > Signed-off-by: Deepak R Varma <drv@mailo.com>
>
> Reviewed-by: Harry Wentland <harry.wentland@amd.com>
>
> Harry
>
> > ---
> >  .../gpu/drm/amd/display/dc/dml/dcn314/display_rq_dlg_calc_314.c | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/drivers/gpu/drm/amd/display/dc/dml/dcn314/display_rq_dlg_calc_314.c b/drivers/gpu/drm/amd/display/dc/dml/dcn314/display_rq_dlg_calc_314.c
> > index 61ee9ba063a7..6576b897a512 100644
> > --- a/drivers/gpu/drm/amd/display/dc/dml/dcn314/display_rq_dlg_calc_314.c
> > +++ b/drivers/gpu/drm/amd/display/dc/dml/dcn314/display_rq_dlg_calc_314.c
> > @@ -51,7 +51,7 @@ static bool CalculateBytePerPixelAnd256BBlockSizes(
> >               *BytePerPixelDETC = 0;
> >               *BytePerPixelY = 4;
> >               *BytePerPixelC = 0;
> > -     } else if (SourcePixelFormat == dm_444_16 || SourcePixelFormat == dm_444_16) {
> > +     } else if (SourcePixelFormat == dm_444_16) {
> >               *BytePerPixelDETY = 2;
> >               *BytePerPixelDETC = 0;
> >               *BytePerPixelY = 2;
>
