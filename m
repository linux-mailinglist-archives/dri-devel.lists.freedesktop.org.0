Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3495A2545D0
	for <lists+dri-devel@lfdr.de>; Thu, 27 Aug 2020 15:21:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 24BF16E271;
	Thu, 27 Aug 2020 13:21:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x342.google.com (mail-wm1-x342.google.com
 [IPv6:2a00:1450:4864:20::342])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B08B86E271
 for <dri-devel@lists.freedesktop.org>; Thu, 27 Aug 2020 13:21:33 +0000 (UTC)
Received: by mail-wm1-x342.google.com with SMTP id u18so5155553wmc.3
 for <dri-devel@lists.freedesktop.org>; Thu, 27 Aug 2020 06:21:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=00nGXco+/vgGv2l6MQGjSd/Z/LSl5S7OepFuDLohtS0=;
 b=DiwrjOSshtX/x/QjNnYeknKJqKgKhdhAryLOZZuVfuWHZnu+CrzK8Kt8Paop79d3tg
 er4w2Ce9UozxXyu+bBkzG0vO9vhYK9Pn84msqJIK8o2qvoBoZOaHXL/ffLjSxZpbmxEL
 e2LI1s6wMjDnL2sBO3sx7SkTxT5qgx1bsDmAh9ZJ90yrqudwqY/yTOLgrg3PJbn9QuPO
 mBmp2YYoTnvTEvScT9lDiIzdfrrclfoonVOTtGfx8Qof73ZlDJxzGtqFfeirlhjZYsvU
 0tI0+pvEs69upUYjUOFqNc7c+lYGIiOIxBxu44kwsJuHfuQwhea5suwww+hQo2JI+g1q
 GQJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=00nGXco+/vgGv2l6MQGjSd/Z/LSl5S7OepFuDLohtS0=;
 b=coQYH69aURoqY2Wnhy8AeL70Va1Ujy+5egRoFbsKrVgBbR66Vqh+AbFtudDlcpgZvG
 lx/47XdrpTeQoQpjT62fSDkAFdxlmRAtzQCpGQuc+9rSCa0qNQj5pHOQqvSxPwtNkJ52
 XocQKCBh2R4W7eugnM+TNsgJ334zOSjvKZrQbKOeVmeJkXJ+QXjlUDPHC6pZt73ciouT
 cw/Bj9kEBRbaip2Y7Z7ThmB/6v6CHUQpizklOTQfa4HgG1Ez/sFPJRmmOWrDvApS86Sy
 HkxpgF/DbwHQV9SqQVlD00y00JFJvTOd5bcGZju1nQiJ/C5BywSGw0lrKJGURqpcDdf5
 zaZQ==
X-Gm-Message-State: AOAM531bVy74WzNWOTZchW8ED+8krsOfpkYU2fdMw8SNTlcJnOcrKaR5
 XoxqO6QSQP/+0gr2uOWdc35recOwr1Gt0juD/avfURRr
X-Google-Smtp-Source: ABdhPJyvIY7JoSyA61y8Zqdlr3HqXt8Nga/vNTbOmaOGWAsLuaCdEttKAkLn5iKsJHcfIe7gE0BGAR+sBBJbRF78h2E=
X-Received: by 2002:a7b:c941:: with SMTP id i1mr11762397wml.73.1598534492308; 
 Thu, 27 Aug 2020 06:21:32 -0700 (PDT)
MIME-Version: 1.0
References: <f1cb7c18-5580-65f4-9eac-ffc0402963b4@gmail.com>
In-Reply-To: <f1cb7c18-5580-65f4-9eac-ffc0402963b4@gmail.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Thu, 27 Aug 2020 09:21:20 -0400
Message-ID: <CADnq5_PeDeP8AmioZ-Ja=qnQW7p3qFUsMi2cBOqOEHTz0yEemA@mail.gmail.com>
Subject: Re: [PATCH 1/1] AMDGPU: Specify get_argument function for ci_smu_funcs
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

On Thu, Aug 27, 2020 at 7:37 AM Sandeep Raghuraman <sandy.8925@gmail.com> wrote:
>
> Starting in Linux 5.8, the graphics and memory clock frequency were not being reported for CIK cards. This is a regression, since they were reported correctly in Linux 5.7. This was due to changes in commit a0ec225633d9f681e393a1827f29f02c837deb84.
>
> After investigation, I discovered that the smum_send_msg_to_smc() function, attempts to call the corresponding get_argument() function of ci_smu_funcs. However, the get_argument() function is not defined in ci_smu_funcs.
>
> This patch fixes the bug by specifying the correct get_argument() function.
>
> Signed-off-by: Sandeep Raghuraman <sandy.8925@gmail.com>
>
> ---
>  drivers/gpu/drm/amd/powerplay/smumgr/ci_smumgr.c | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/drivers/gpu/drm/amd/powerplay/smumgr/ci_smumgr.c b/drivers/gpu/drm/amd/powerplay/smumgr/ci_smumgr.c
> index ad54f4500af1..63016c14b942 100644
> --- a/drivers/gpu/drm/amd/powerplay/smumgr/ci_smumgr.c
> +++ b/drivers/gpu/drm/amd/powerplay/smumgr/ci_smumgr.c
> @@ -37,6 +37,7 @@
>  #include "cgs_common.h"
>  #include "atombios.h"
>  #include "pppcielanes.h"
> +#include "smu7_smumgr.h"
>
>  #include "smu/smu_7_0_1_d.h"
>  #include "smu/smu_7_0_1_sh_mask.h"
> @@ -2948,6 +2949,7 @@ const struct pp_smumgr_func ci_smu_funcs = {
>         .request_smu_load_specific_fw = NULL,
>         .send_msg_to_smc = ci_send_msg_to_smc,
>         .send_msg_to_smc_with_parameter = ci_send_msg_to_smc_with_parameter,
> +       .get_argument = smu7_get_argument,
>         .download_pptable_settings = NULL,
>         .upload_pptable_settings = NULL,
>         .get_offsetof = ci_get_offsetof,
> --
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
