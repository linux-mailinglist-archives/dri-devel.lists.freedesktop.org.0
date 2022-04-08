Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 89EA54F9E57
	for <lists+dri-devel@lfdr.de>; Fri,  8 Apr 2022 22:48:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0E2E410E09F;
	Fri,  8 Apr 2022 20:48:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oa1-x2e.google.com (mail-oa1-x2e.google.com
 [IPv6:2001:4860:4864:20::2e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7DC4C10E08D;
 Fri,  8 Apr 2022 20:48:38 +0000 (UTC)
Received: by mail-oa1-x2e.google.com with SMTP id
 586e51a60fabf-df02f7e2c9so10949069fac.10; 
 Fri, 08 Apr 2022 13:48:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=E+nJ+IeQiG4mgvH4yV2XbF3SFHYdv7cMYexwmastyTY=;
 b=UWj9T0SgeOOrrMmgaYoiY5YEbtQ8lCvdCT1Zd/qLCvtxBpRlVuy0ODEQr6LU82RUx+
 wluGV7lYtv10KzBMhz5JCRgWTfRYVMkQCFecNeJvaCrFgnzHLcZtCJtWRp+Xv964J9R0
 YzZ/7shXdsoyiF/TSSXygZWWgFV+n6eoOycubsbu05zVCPVBIjG89VKFmykHzHmm8ifN
 1wKjUtsIYPQY+gWuBHhBGkCuKyzhpGXkfA0l7d1MJcrhinlCWa90UD/gysKZAB2Gu5LI
 ib4+VX0E8IX2dacXcBrPyRd3hD6M9KGcvo/lq2Q29shlbJZ910amW/jtqzZ//qiJd/rE
 y0Lg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=E+nJ+IeQiG4mgvH4yV2XbF3SFHYdv7cMYexwmastyTY=;
 b=e1F+RfYi4GEp/+IdKhckFgmxDyhgKj0svrAHXd+jsEWysx6+AsgTvXa6HkOhAX7AMf
 dTp4gtb6kO1gT6iEF/TyS+qgX3EOyLvwYyVuQj8F8djWUiAxJgPmX51GU3gUJwg9Er5T
 KnoN7HAF9+LzTg5o9wWDQScM6KAuckD84BA2TI+RyxXk1zOJHmju0Y0cn3CIwWmPEsGv
 4Ukc91T6hXCk8Svk5xHAzW0W/id45NJfu92IHoLuAeecbtERElIo9yTx8S47WSwuFlsL
 8sxejiqbyJc9Pc4rv4DGXkIBm+SrwubbPz48h8PwfoRcOKM2jT5U8LLpo4uZavbZ7++I
 /Ftw==
X-Gm-Message-State: AOAM532Ni98pI4afGkCeFb15LPDuqxFMjwT8DVOVMZ2jwb3WCPAsgPGC
 ccrqwqkEYOHXJFMg6cInKz+26plVqFYvYliZVAA=
X-Google-Smtp-Source: ABdhPJzADDrRgHZh+f5rLZNA7S5V+9Fw+9Ir2J07PL7HHDvDsX2UEx0lC2Ep81o0W4CBSPK3+syb59fvi83xxvw/4Gg=
X-Received: by 2002:a05:6870:311d:b0:de:9b6c:362b with SMTP id
 v29-20020a056870311d00b000de9b6c362bmr8928237oaa.200.1649450917768; Fri, 08
 Apr 2022 13:48:37 -0700 (PDT)
MIME-Version: 1.0
References: <20220407214659.2519967-1-trix@redhat.com>
In-Reply-To: <20220407214659.2519967-1-trix@redhat.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Fri, 8 Apr 2022 16:48:26 -0400
Message-ID: <CADnq5_MSrNYWJE0krKTs4SkOqsNtrVyM0PyQanO-YQYV+jSV4g@mail.gmail.com>
Subject: Re: [PATCH] drm/radeon: change cayman_default_state table from global
 to static
To: Tom Rix <trix@redhat.com>
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
Cc: Dave Airlie <airlied@linux.ie>, xinhui pan <Xinhui.Pan@amd.com>,
 LKML <linux-kernel@vger.kernel.org>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>, "Deucher,
 Alexander" <alexander.deucher@amd.com>,
 Christian Koenig <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Apr 7, 2022 at 5:47 PM Tom Rix <trix@redhat.com> wrote:
>
> cayman_default_state and cayman_default_size are only
> used in ni.c.  Single file symbols should be static.
> So move their definitions to cayman_blit_shaders.h
> and change their storage-class-specifier to static.
>
> Remove unneeded cayman_blit_shader.c
>
> cayman_ps/vs definitions were removed with
> commit 4f8629675800 ("drm/radeon/kms: remove r6xx+ blit copy routines")
> So their declarations in cayman_blit_shader.h
> are not needed, so remove them.
>
> Signed-off-by: Tom Rix <trix@redhat.com>

Applied.  Thanks!

Alex
