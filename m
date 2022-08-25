Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4851E5A1607
	for <lists+dri-devel@lfdr.de>; Thu, 25 Aug 2022 17:46:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 16C2710E758;
	Thu, 25 Aug 2022 15:46:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x22c.google.com (mail-oi1-x22c.google.com
 [IPv6:2607:f8b0:4864:20::22c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C7C3F10E747;
 Thu, 25 Aug 2022 15:46:02 +0000 (UTC)
Received: by mail-oi1-x22c.google.com with SMTP id p187so16449888oia.9;
 Thu, 25 Aug 2022 08:46:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc;
 bh=CXRawYlhhxO/MQxKaXHdr4kZEQr8lUECnzmSXqlmARE=;
 b=RPZ+yyUQEApYUEfNXvdgEw41hp68nmXpsHZ2Gu/lyjwSnJYg6kmL0DKSZ4y3oqsMO6
 csnhalUSYM8vuyNU/Sv9TVD4cx3ExranuIqGIQbroufOw1YySzEjWeFeC06o6rE2VWl7
 JWHTZDllVVSK7KUaDOs/1puTgn3krtyLV9gemnAZzvnDOyU5E+zrvAwSr9FGUQNdxV8o
 jF9iwaEgxuHEm48OqKCyuIm3g7EJjxvz0eOdZNQuAm3fkVJCFydy4PdVhOZCS09sK/sa
 Jp5jtf8ZK7CDCr1RliAf1uvxf/T54a4DYLZ4m5DiEOq2FynW63q2G1dACvuB/t7UnhoG
 0KTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc;
 bh=CXRawYlhhxO/MQxKaXHdr4kZEQr8lUECnzmSXqlmARE=;
 b=NPmZp9d4aItOQ4083eRppJdPTndyKwZHhrYV1koeQQMwOBYxlZE5NbwBBFLvUKdbxj
 BIKMugiQRePiPrqRTynKvioRn+iUlib4TElIiOeJsjsDN04VZy/cDA7fK6K2AiA3wq9a
 D604yrwZVHSIejwbihuz3NkPAVECZOU9CJemPJTefL1fS5JEeQ+jrctxEr4facmij8nh
 4AxfGe2sv8olFxptaeQ1D17kLdILrmJJX0tD4mnGbnBd7fs0sx344XhAy73BGQByWcHI
 UbqV1MZudcPAscP4E7c0YK126vkWY7MYph1y/7HKXC8K9E09dM6VqxK6BWAu0sAlbpxn
 gmIA==
X-Gm-Message-State: ACgBeo08htDwVy44E12/ZgfRnEZBExr/o68oLtPXZIKPPN1Pc/Xx1ifr
 She1NPNC9GwdynF+zddrin121cOTUyEIU4/x9mKvLJg2
X-Google-Smtp-Source: AA6agR6+Z4yWNh7fjJS4xR/oOuGMOKZiklF2tDEGivfsICK9DgP1aWJ+/SUU2NG2VYfxIKp6ioLL45bPay9oIDOrhIk=
X-Received: by 2002:a05:6808:2187:b0:344:eccd:3fc5 with SMTP id
 be7-20020a056808218700b00344eccd3fc5mr5900955oib.46.1661442362118; Thu, 25
 Aug 2022 08:46:02 -0700 (PDT)
MIME-Version: 1.0
References: <20220825023848.32307-1-yuzhe@nfschina.com>
In-Reply-To: <20220825023848.32307-1-yuzhe@nfschina.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Thu, 25 Aug 2022 11:45:51 -0400
Message-ID: <CADnq5_Pdtgznt3yn=cp++B2HEtRpTV7RU_p_C1hTP8HVcdPwng@mail.gmail.com>
Subject: Re: [PATCH] drm/radeon: use time_after(a,b) to replace "a>b"
To: Yu Zhe <yuzhe@nfschina.com>
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
Cc: airlied@linux.ie, Xinhui.Pan@amd.com, dri-devel@lists.freedesktop.org,
 liqiong@nfschina.com, amd-gfx@lists.freedesktop.org, alexander.deucher@amd.com,
 christian.koenig@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Applied.  Thanks!

Alex

On Wed, Aug 24, 2022 at 10:40 PM Yu Zhe <yuzhe@nfschina.com> wrote:
>
> time_after() deals with timer wrapping correctly.
>
> Signed-off-by: Yu Zhe <yuzhe@nfschina.com>
> ---
>  drivers/gpu/drm/radeon/radeon_pm.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/radeon/radeon_pm.c b/drivers/gpu/drm/radeon/radeon_pm.c
> index e765abcb3b01..04c693ca419a 100644
> --- a/drivers/gpu/drm/radeon/radeon_pm.c
> +++ b/drivers/gpu/drm/radeon/radeon_pm.c
> @@ -1899,7 +1899,7 @@ static void radeon_dynpm_idle_work_handler(struct work_struct *work)
>                  * to false since we want to wait for vbl to avoid flicker.
>                  */
>                 if (rdev->pm.dynpm_planned_action != DYNPM_ACTION_NONE &&
> -                   jiffies > rdev->pm.dynpm_action_timeout) {
> +                   time_after(jiffies, rdev->pm.dynpm_action_timeout)) {
>                         radeon_pm_get_dynpm_state(rdev);
>                         radeon_pm_set_clocks(rdev);
>                 }
> --
> 2.11.0
>
