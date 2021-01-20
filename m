Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 622A62FDC28
	for <lists+dri-devel@lfdr.de>; Wed, 20 Jan 2021 22:58:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 382326E461;
	Wed, 20 Jan 2021 21:58:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x333.google.com (mail-ot1-x333.google.com
 [IPv6:2607:f8b0:4864:20::333])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9052C6E45D;
 Wed, 20 Jan 2021 21:58:41 +0000 (UTC)
Received: by mail-ot1-x333.google.com with SMTP id n42so24869439ota.12;
 Wed, 20 Jan 2021 13:58:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=VF5vWwpN0WTTAbK2Z2NttkJ6CJSQ2hghN1uL2Mgnxck=;
 b=EzLEez6jtnf8JtqyqlIg8YpCBuANBTWBSoj8Ej/TC9V2tBYlFwyxmJZuqSPAlc6cbt
 ogPDE2aMr5O+aq0yHHil4RauRfTBUTT6dbvO7YyyOOkZgTqwnOAECFNAMSvMpU98kiqW
 mRm3ACDVn4552fT7haLovkFYrXkvGJxcu+RcdSG3c3jkc8J5awkN8Ic8HPorz4MX+nVz
 A3yGeUy06y2ulZ1hAfHsJxWt0A+6CEmaB4zy6Ph0IrngaSC+wbqtuZzNsRQwPEupKIio
 xo5Cdc7zpO0ZcprKPmITjwAl+qQRNAnCkzsahb1nIHVTOdfqOrTMFQt4VmwG9CtZmCmO
 q6QA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=VF5vWwpN0WTTAbK2Z2NttkJ6CJSQ2hghN1uL2Mgnxck=;
 b=kxtevIT0RSG2b+na9kk2e04wY+MgELpXwm0fDTNMKIYbP6AU7157GOhiPlsf0/hY8a
 WnQwm1bsQTWUnYP3HUrUwtIq3UM2UgLt/skSg+GJgyWK9MkLtijkljPOVnx0+ynE6V7s
 WCyKQvDF44iNVKIvtl0cBT3dYhvTnZOCbKrwkgc57lwgTaA20fi+ZJfhcIsiJ0K0MxuX
 iN8p8ETtWh+HCxf765UCzDBcxxG0GuiHD/xKEWvjX5IZ1+s+uz3tr+gkF4bpUsVVOv5n
 te4FBPP/PIAX7ud30eM25BzMSVTK0TrBn4RtjtQhS+agwh2xoyhKDfGd5lAf8CeZDGX4
 W/rw==
X-Gm-Message-State: AOAM533oaG5X8RYNYvY/K4ajUMfa7zah/7aGzaCBgQSRBf3TzvpdIyFh
 f8axF55w8DtpUeEFxlN1IClUzlnw91JfREhfRPM=
X-Google-Smtp-Source: ABdhPJyfupROq9yYCDbZ/3+AmWCN8HnkiGrbhZkCpEOXQTQW6PaR5MBQJrTLWRFVQEhrTRJG6c/wfMxfAJsLqhNe4k4=
X-Received: by 2002:a9d:2ac2:: with SMTP id e60mr8448651otb.23.1611179920837; 
 Wed, 20 Jan 2021 13:58:40 -0800 (PST)
MIME-Version: 1.0
References: <20210120092624.13061-1-colin.king@canonical.com>
 <a06aeb18-b02d-41cd-f717-6ff30ea48bb4@amd.com>
In-Reply-To: <a06aeb18-b02d-41cd-f717-6ff30ea48bb4@amd.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Wed, 20 Jan 2021 16:58:29 -0500
Message-ID: <CADnq5_Oypeyaq8YSHgPhouJcp7t8aSxT1Z0YxraWQV6aJm9uYQ@mail.gmail.com>
Subject: Re: [PATCH][next] drm/amd/display: Fix spelling mistake of function
 name
To: Harry Wentland <harry.wentland@amd.com>
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
Cc: Leo Li <sunpeng.li@amd.com>, kernel-janitors@vger.kernel.org,
 Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>,
 LKML <linux-kernel@vger.kernel.org>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>, David Airlie <airlied@linux.ie>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>,
 Alex Deucher <alexander.deucher@amd.com>,
 Colin King <colin.king@canonical.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Applied.  Thanks!

Alex

On Wed, Jan 20, 2021 at 9:46 AM Harry Wentland <harry.wentland@amd.com> wrote:
>
> On 2021-01-20 4:26 a.m., Colin King wrote:
> > From: Colin Ian King <colin.king@canonical.com>
> >
>
> Reviewed-by: Harry Wentland <harry.wentland@amd.com>
>
> Harry
>
> > There are two spelling mistakes of the function name, fix this
> > by using __func__ instead of a hard coded name string.
> >
> > Signed-off-by: Colin Ian King <colin.king@canonical.com>
> > ---
> >   drivers/gpu/drm/amd/display/dc/core/dc_link.c | 4 ++--
> >   1 file changed, 2 insertions(+), 2 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/amd/display/dc/core/dc_link.c b/drivers/gpu/drm/amd/display/dc/core/dc_link.c
> > index c16af3983fdb..91d4130cd2cb 100644
> > --- a/drivers/gpu/drm/amd/display/dc/core/dc_link.c
> > +++ b/drivers/gpu/drm/amd/display/dc/core/dc_link.c
> > @@ -1602,7 +1602,7 @@ static bool dc_link_construct(struct dc_link *link,
> >
> >       link->psr_settings.psr_version = DC_PSR_VERSION_UNSUPPORTED;
> >
> > -     DC_LOG_DC("BIOS object table - dc_link_contruct finished successfully.\n");
> > +     DC_LOG_DC("BIOS object table - %s finished successfully.\n", __func__);
> >       return true;
> >   device_tag_fail:
> >       link->link_enc->funcs->destroy(&link->link_enc);
> > @@ -1619,7 +1619,7 @@ static bool dc_link_construct(struct dc_link *link,
> >               link->hpd_gpio = NULL;
> >       }
> >
> > -     DC_LOG_DC("BIOS object table - dc_link_contruct failed.\n");
> > +     DC_LOG_DC("BIOS object table - %s failed.\n", __func__);
> >       kfree(info);
> >
> >       return false;
> >
> _______________________________________________
> amd-gfx mailing list
> amd-gfx@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/amd-gfx
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
