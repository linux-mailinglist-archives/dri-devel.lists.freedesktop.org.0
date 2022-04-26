Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id ED57D51079D
	for <lists+dri-devel@lfdr.de>; Tue, 26 Apr 2022 20:53:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E673810E4F4;
	Tue, 26 Apr 2022 18:53:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x52e.google.com (mail-ed1-x52e.google.com
 [IPv6:2a00:1450:4864:20::52e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2E04D10E47B
 for <dri-devel@lists.freedesktop.org>; Tue, 26 Apr 2022 18:53:02 +0000 (UTC)
Received: by mail-ed1-x52e.google.com with SMTP id e23so2446325eda.11
 for <dri-devel@lists.freedesktop.org>; Tue, 26 Apr 2022 11:53:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=z4sYpHvyZF3Hk6BiPjvYNwcG7/Dp9Wmwe6z9mbx3W2s=;
 b=I5uBAOwMEKxVr+eXU6bhXPPs6dSP53/OuwGioKaQOebnd6AIM6SoPmTjt1FDV5jfU9
 d9vXP0Wqd9VSiJojlrAqJmivIvynt/yN0QAU1+GuPVZDdDy1Ti1tK8BSNCPWgUBsiTsX
 Dt6lxBFC5HiLV64nMraJB3slQ6IrIiv1tBYNmMYzc4Vj3JkWwESoD3/Ezc/sKUDf6Ogh
 AEC1g6o2kmRZla6OCm/iu0izb516WW4j73OoOY5nfA1T28Z8S6bVrUXDm3LCGBqeIgfz
 8eiqgI4aOY1/fXR/X5v7ym+2Vy+De+SBO/qsWwOf38gklQCuZLjsab2YP4iUd595AD49
 V2Ng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=z4sYpHvyZF3Hk6BiPjvYNwcG7/Dp9Wmwe6z9mbx3W2s=;
 b=px1CYrs64eNkw0U00wco2msL3a6U7UgWTFq6CgqJB2zhtMTiLg2Db82g3xAaUY/sRT
 behvJLub5MEjLeU7KpAxwwskR2TPSoMzdUM4vB/Zuqb43EON2324IAdT8quwYIfhFQWK
 t/2KqlVc7kKPtsv71cjTasuoZyV4RoTs9pciN8UosO3w4parROTsN683Iu/7Mim4cij6
 2L0yQNYRYZhBGUeKbObyJ17wsfHTcdaP51V0NjcigzIddWquz4dI0oCcjKjjszjBVGup
 Umk6E6tj21UJG/r46SwYNiJKS+MjhDa7vJV627u+BRgecfi3lDZzPUIP9VMJncYfAq4W
 uQCg==
X-Gm-Message-State: AOAM533wv90oVtdeCUN/a8S4+aC2P0q3vzpu6KTEMbNAkfsG4NNJi+So
 NWBxP02f3sbnN2pz1mJGD5McTzkNj3h1c7Y3PJA=
X-Google-Smtp-Source: ABdhPJwcmqG/+vzlqoxtlrsT6gZobvfs/S8A0HkJQpLfvzP9UYtznRcBQc2afH3r2O7yqT2p34XPePhi3UY7aP4g3Wg=
X-Received: by 2002:a05:6402:528b:b0:425:8d78:fa4b with SMTP id
 en11-20020a056402528b00b004258d78fa4bmr26507913edb.206.1650999180595; Tue, 26
 Apr 2022 11:53:00 -0700 (PDT)
MIME-Version: 1.0
References: <20220412204809.824491-1-olvaffe@gmail.com>
 <CAPaKu7RwUwuQEGBB87CQysOFzPHbzjhW6we4dq198UsOWdoJyg@mail.gmail.com>
 <a7a60651-04a8-4c34-e487-c7908e223124@amd.com>
In-Reply-To: <a7a60651-04a8-4c34-e487-c7908e223124@amd.com>
From: Chia-I Wu <olvaffe@gmail.com>
Date: Tue, 26 Apr 2022 11:52:49 -0700
Message-ID: <CAPaKu7Tq57HEuGSAQ3EjceyAU+MxOaAFE5egKEf_xWTzpDC_rA@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] drm/sched: use DECLARE_EVENT_CLASS
To: Andrey Grodzovsky <andrey.grodzovsky@amd.com>
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
Cc: David Airlie <airlied@linux.ie>, Rob Clark <robdclark@chromium.org>,
 ML dri-devel <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

That would be great.  I don't have push permission.

On Tue, Apr 26, 2022 at 11:25 AM Andrey Grodzovsky
<andrey.grodzovsky@amd.com> wrote:
>
> It's ok to land but it wasn't, do you have push permissions to
> drm-misc-next ? If not, I will do it for you.
>
> Andrey
>
> On 2022-04-26 12:29, Chia-I Wu wrote:
> > On Tue, Apr 12, 2022 at 1:48 PM Chia-I Wu <olvaffe@gmail.com> wrote:
> >> drm_sched_job and drm_run_job have the same prototype.
> >>
> >> v2: rename the class from drm_sched_job_entity to drm_sched_job (Andrey)
> >>
> >> Signed-off-by: Chia-I Wu <olvaffe@gmail.com>
> >> Cc: Rob Clark <robdclark@chromium.org>
> >> Reviewed-by: Andrey Grodzovsky <andrey.grodzovsky@amd.com>
> > This series has been reviewed.  Is it ok to land (if it hasn't)?
