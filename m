Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E829F55546D
	for <lists+dri-devel@lfdr.de>; Wed, 22 Jun 2022 21:29:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3319F10E5F0;
	Wed, 22 Jun 2022 19:29:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x62c.google.com (mail-ej1-x62c.google.com
 [IPv6:2a00:1450:4864:20::62c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3F7AB10E030;
 Wed, 22 Jun 2022 19:29:34 +0000 (UTC)
Received: by mail-ej1-x62c.google.com with SMTP id v1so36319749ejg.13;
 Wed, 22 Jun 2022 12:29:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=0tgPFQiHARZRSBsE1sttJvX3FKyQM5vZhpszZb9PCP4=;
 b=Nhc56f6eXXNIvTMh6EP5F3Q9kZ6gDVrHuXKlsor0n7O737E7y51ZXImhXPLGI4ON94
 GGxG/lwNs+h5ckIE4VIgpj35ZGZAiqEhwEbjOKeSmuNDB8l2B/PjfwZWsL5VXk948dH0
 LlhTBEpCGoimLOs5rgMM2BJiv6oIq9uXn7xVqqNTV/bZYZxmRk3+XgvTRl5YFfw9figx
 gp5ZmBRHQ07eTN5pL57bzZpgrnnN4QOb+wgNCALORksRiB0hCtnscKAdfuBPac0HlhJe
 y6/AQUPqsmnoIV+3P19yo+3d438mq5utiGoachPcsNM4RSqP2YNznH98ZNW/2R2p2L2+
 aYIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=0tgPFQiHARZRSBsE1sttJvX3FKyQM5vZhpszZb9PCP4=;
 b=pjnBWBXAOxidD0FHhUk03KTT4c005rN4SpwLp9pMS8ALa3EFq5CdAtcSNrsdW1ddFE
 VP+fqVhKltqv9Ryq1BiAa2NvDyS0s3lwcZ5uA/eH9Q0fHuYoMEmR0CtnfeuayeFZRjDT
 PJLshwGuOrX3Q02Xum3gjAZlEJQA7pFH6jbY7uIWWKqMulenFE7D8gpGur6Ccjy6uSPh
 o5cHzIUa+FJKTtvOUtaNMW4ZnAUqT8uir42dTyWz59jb/WzKFGtOKJ5+dKg+/071oQjk
 ZnCTfch+Xjk7pU6aYyZ0b+Evwaexno6MlNXijUBhWjsGwDpPf8QvUcGsVeVvLy6gMZGn
 7IkQ==
X-Gm-Message-State: AJIora98qW1aiTnMzceZvw/s7t5vtl8qCnuUStxAzUAe48tStO1jQUFr
 2fGRXIrSkrnqFmNnjPjLdh9N9ZKSV9dubMi85mA=
X-Google-Smtp-Source: AGRyM1sP2adR0n/+LFrFv/PEswf8KM7NNdAapAUDhPMT5lgBdxeQQ0X24Ka8k0M8PsHf6DZlMOEK3OyRQ51XRmx55WY=
X-Received: by 2002:a17:907:7f1c:b0:711:f3b4:da5 with SMTP id
 qf28-20020a1709077f1c00b00711f3b40da5mr4561253ejc.508.1655926172836; Wed, 22
 Jun 2022 12:29:32 -0700 (PDT)
MIME-Version: 1.0
References: <20220622142237.11492-1-jiangjian@cdjrlc.com>
In-Reply-To: <20220622142237.11492-1-jiangjian@cdjrlc.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Wed, 22 Jun 2022 15:29:21 -0400
Message-ID: <CADnq5_Onc2wC_y3RUQ1Y1aKZmHWRxbOFgp26MsuKAFRJ+w8cYw@mail.gmail.com>
Subject: Re: [PATCH] gpu/drm/radeon: Fix typo in comments
To: Jiang Jian <jiangjian@cdjrlc.com>
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
 amd-gfx list <amd-gfx@lists.freedesktop.org>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>, "Deucher,
 Alexander" <alexander.deucher@amd.com>,
 Christian Koenig <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Applied.  Thanks!

On Wed, Jun 22, 2022 at 10:24 AM Jiang Jian <jiangjian@cdjrlc.com> wrote:
>
> Remove the repeated word 'and' from comments
>
> Signed-off-by: Jiang Jian <jiangjian@cdjrlc.com>
> ---
>  drivers/gpu/drm/radeon/r300_reg.h | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/radeon/r300_reg.h b/drivers/gpu/drm/radeon/r300_reg.h
> index 60d5413bafa1..9d341cff63ee 100644
> --- a/drivers/gpu/drm/radeon/r300_reg.h
> +++ b/drivers/gpu/drm/radeon/r300_reg.h
> @@ -1103,7 +1103,7 @@
>   * The destination register index is in FPI1 (color) and FPI3 (alpha)
>   * together with enable bits.
>   * There are separate enable bits for writing into temporary registers
> - * (DSTC_REG_* /DSTA_REG) and and program output registers (DSTC_OUTPUT_*
> + * (DSTC_REG_* /DSTA_REG) and program output registers (DSTC_OUTPUT_*
>   * /DSTA_OUTPUT). You can write to both at once, or not write at all (the
>   * same index must be used for both).
>   *
> --
> 2.17.1
>
