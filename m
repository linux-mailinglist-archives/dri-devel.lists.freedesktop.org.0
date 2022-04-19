Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A8005070AA
	for <lists+dri-devel@lfdr.de>; Tue, 19 Apr 2022 16:35:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8DBD510EF19;
	Tue, 19 Apr 2022 14:35:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oa1-x36.google.com (mail-oa1-x36.google.com
 [IPv6:2001:4860:4864:20::36])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2CB8410EEE1;
 Tue, 19 Apr 2022 14:35:10 +0000 (UTC)
Received: by mail-oa1-x36.google.com with SMTP id
 586e51a60fabf-de3eda6b5dso17726612fac.0; 
 Tue, 19 Apr 2022 07:35:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=0Y1kTXqtM0V/qhN0BJh+ustQ16GMNyceftqiFoXkOJo=;
 b=LKsrOa3nuP9NAcR8rarfjiNYcdHWNAGtZnJnexbhZXdC2BWsvnu2TlCnxPKl6u5Vj9
 Ve+GfJftnqI6Dw/kI2fvUr1sq+wn+NVcjYTWTM+3PQsmGlonuaOWJW2zsaPsusolhRyb
 Qtx1ps6ipjUss6V5UAEwmrcem2Y7xetfKYPQyGmy71RxKN1MpsWo6SXtKNe1529sbOtK
 VzXmYI9RR/zER2Vb6p1pOjC6VlZH1PGlD1sfA7OqzhCfOYhKosTy3+kJLZgvRsJ8FrvK
 IrBfsnJ05Se7Ng1T6bHk1yWeizt/Yr6RvX8UHUhNi+lD81yGxFSSftfMtsdrDV7w0fNc
 NNYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=0Y1kTXqtM0V/qhN0BJh+ustQ16GMNyceftqiFoXkOJo=;
 b=s5QOb7nx//p5DhR8lhFtUObGyjaOFGehKrhx1jVXSMwWyX+ar1uDCKZu7hGc6D/P/y
 w+U/bYgPh1MgoSdmgGiPb30/EgljpGIWS20/RYO9t7MwWCiU6yRYM26arr/4uMs3yhFi
 RaSh09StR3onzWcqRe4VmIhnbhbcyxY+tv8uQC6i6D8VV2tUwooOiRExZ0ytlO1BAMBt
 rhjZ7NYRrSaZeEyUPx1BBG5vY635SXj7zlKJtUWiSCElkmMcvb46/eVMiMLFdVnTdYMc
 i2U4Unmx7V58y/aXEc95psuB91+rl2RLc4q6lZsgsYPwV1Hbtm60sDntWB9eQO6CI3Kw
 vYpA==
X-Gm-Message-State: AOAM5313MFWzILpCRXPfzWnDyNUViH5K98ZpW4boAldDG7dJBBDiCZ9w
 wmwarcu++JFE5Sjsu86ZQ6lMmzDFRKlisLZZsLY=
X-Google-Smtp-Source: ABdhPJylz4Pe9jC88ome39PtLEkLwVqavuFbKl5Z+pnkPi4nxGJ15u5Pjxe998bBVBnUSyvu2UCMWVsYF5ENcONVNUg=
X-Received: by 2002:a05:6870:311d:b0:de:9b6c:362b with SMTP id
 v29-20020a056870311d00b000de9b6c362bmr8023506oaa.200.1650378909464; Tue, 19
 Apr 2022 07:35:09 -0700 (PDT)
MIME-Version: 1.0
References: <20220415182014.278652-1-tales.aparecida@gmail.com>
In-Reply-To: <20220415182014.278652-1-tales.aparecida@gmail.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Tue, 19 Apr 2022 10:34:58 -0400
Message-ID: <CADnq5_NmOxp08Xf_P1Ljq94O2RYa_Ld4cVRtF=fmRqV_DAgDqg@mail.gmail.com>
Subject: Re: [PATCH] drm/amd/display: make hubp1_wait_pipe_read_start() static
To: Tales Lelo da Aparecida <tales.aparecida@gmail.com>
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
Cc: Leo Li <sunpeng.li@amd.com>, "Pan, Xinhui" <Xinhui.Pan@amd.com>,
 Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>,
 LKML <linux-kernel@vger.kernel.org>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>, David Airlie <airlied@linux.ie>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>,
 Alex Deucher <alexander.deucher@amd.com>, andrealmeid@riseup.net,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Applied with minor change to drop the prototype in dcn10_hubp.h.  Thanks!

Alex

On Fri, Apr 15, 2022 at 2:21 PM Tales Lelo da Aparecida
<tales.aparecida@gmail.com> wrote:
>
> It's a local function, let's make it static.
>
> Signed-off-by: Tales Lelo da Aparecida <tales.aparecida@gmail.com>
> ---
>  drivers/gpu/drm/amd/display/dc/dcn10/dcn10_hubp.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/amd/display/dc/dcn10/dcn10_hubp.c b/drivers/gpu/drm/amd/display/dc/dcn10/dcn10_hubp.c
> index fbff6beb78be..3a7f76e2c598 100644
> --- a/drivers/gpu/drm/amd/display/dc/dcn10/dcn10_hubp.c
> +++ b/drivers/gpu/drm/amd/display/dc/dcn10/dcn10_hubp.c
> @@ -1316,7 +1316,7 @@ void hubp1_set_flip_int(struct hubp *hubp)
>   *
>   * @hubp: hubp struct reference.
>   */
> -void hubp1_wait_pipe_read_start(struct hubp *hubp)
> +static void hubp1_wait_pipe_read_start(struct hubp *hubp)
>  {
>         struct dcn10_hubp *hubp1 = TO_DCN10_HUBP(hubp);
>
> --
> 2.35.1
>
