Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 896EB1F5D00
	for <lists+dri-devel@lfdr.de>; Wed, 10 Jun 2020 22:21:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5A4CC6E85B;
	Wed, 10 Jun 2020 20:20:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x444.google.com (mail-wr1-x444.google.com
 [IPv6:2a00:1450:4864:20::444])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0F3F96E85B
 for <dri-devel@lists.freedesktop.org>; Wed, 10 Jun 2020 20:20:58 +0000 (UTC)
Received: by mail-wr1-x444.google.com with SMTP id j10so3761786wrw.8
 for <dri-devel@lists.freedesktop.org>; Wed, 10 Jun 2020 13:20:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=hT3t/Ann7kBSZo/ieNxBeedEnTigZ8MgySTiCmVEODw=;
 b=mPEaswbQkhDPAIV/QUKKORL1LNXQ5roJvhzrpQ58GDFBNNr7yal3m9XUXZv/+rz8CQ
 hbM6DHJqBz52rnpR07dQYIJHNZepNMlY+WKxULom0T6BAT2UFuB5tae8kYfxUvXErXE9
 4a/k9MSsbzyoMEQfvUR0ihHivN0X1d3iC83vXtg0BqBqLtaT7nmbzZJLVgcIEETfuh/p
 yfWWoWjcpw+dZjF6DhrEMWqUsqdCJmJG9Sd6Il2UqKZl6AI1Lxn2gkoiedb5k3dqdf1M
 7fnVTbNl995XrK/ymzW5/kTUXgIIthvnSXupUUqvV8mGreJWw9f6h6WSU9SAoG1JAGor
 9jAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=hT3t/Ann7kBSZo/ieNxBeedEnTigZ8MgySTiCmVEODw=;
 b=cffAUIBZ6AyifWnhdiVEmU0huT95HwezwNVkL+q+Nc/LmoTZ6WSNADG2OQXnK1Ymsw
 QB802RztUJyvFV2d2+5C2iucf9YJOEzI9z8Q4zSYoC6Fwb6O2tFJh2HxG3gOifThGyKA
 iBoYAu64CG0AGWsZsyHLGpCFqHzv/ADr5boABUJCL07j9rIFNZXqcUaIUcKVTu/bM163
 uxX8c4hfRfND5ie+wUfaXxfkRUy3wQGBvQQaYyQMmRmPq5AmEuCYtzPCU2/1zV+PaX2c
 cGv6ArFE12kQT8vWU6WwVovjjgDalCxT5bNvjxfE8odwsxvCMPGKrKV+BoHoMCcmL3yO
 5JfQ==
X-Gm-Message-State: AOAM530mgmWDp4WykgxQnfCe6dvDkkyIk0ZBkytIRTcibM0cv4Z0jJXV
 WfuJGLlIheyuoSLfEzTO62SMDi4n7cbyITbD3sU=
X-Google-Smtp-Source: ABdhPJyEftOoBiCgwi9O0kx2By7YSWjqCD+M9u4Ywhi/d6FBtfvMITnXPweIbWFoVAIJnu1LHLgMiK3yuBa6zc0TqpE=
X-Received: by 2002:adf:fd41:: with SMTP id h1mr5790007wrs.374.1591820456683; 
 Wed, 10 Jun 2020 13:20:56 -0700 (PDT)
MIME-Version: 1.0
References: <3811376f-08d5-3b2f-5f1c-10919a90f418@gmail.com>
In-Reply-To: <3811376f-08d5-3b2f-5f1c-10919a90f418@gmail.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Wed, 10 Jun 2020 16:20:45 -0400
Message-ID: <CADnq5_O6Ye9DAWjK65LLfjDT8Ox+sH0rRfeMj14RHf91j2DNsA@mail.gmail.com>
Subject: Re: [PATCH 1/1] AMDGPU: Replace invalid device ID with a valid device
 ID
To: Sandeep Raghuraman <sandy.8925@gmail.com>
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
Cc: "Deucher, Alexander" <alexander.deucher@amd.com>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Applied.  Thanks!

Alex

On Wed, Jun 10, 2020 at 4:06 PM Sandeep Raghuraman <sandy.8925@gmail.com> wrote:
>
> Initializes Powertune data for a specific Hawaii card by fixing what looks like a typo in the code. The device ID 66B1 is not a supported device ID for this driver, and is not mentioned elsewhere. 67B1 is a valid device ID, and is a Hawaii Pro GPU.
>
> I have tested on my R9 390 which has device ID 67B1, and it works fine without problems.
>
> Signed-off-by: Sandeep Raghuraman <sandy.8925@gmail.com>
>
> ---
>  drivers/gpu/drm/amd/powerplay/smumgr/ci_smumgr.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/amd/powerplay/smumgr/ci_smumgr.c b/drivers/gpu/drm/amd/powerplay/smumgr/ci_smumgr.c
> index 85e5b1ed22c29..56923a96b4502 100644
> --- a/drivers/gpu/drm/amd/powerplay/smumgr/ci_smumgr.c
> +++ b/drivers/gpu/drm/amd/powerplay/smumgr/ci_smumgr.c
> @@ -239,7 +239,7 @@ static void ci_initialize_power_tune_defaults(struct pp_hwmgr *hwmgr)
>
>         switch (dev_id) {
>         case 0x67BA:
> -       case 0x66B1:
> +       case 0x67B1:
>                 smu_data->power_tune_defaults = &defaults_hawaii_pro;
>                 break;
>         case 0x67B8:
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
