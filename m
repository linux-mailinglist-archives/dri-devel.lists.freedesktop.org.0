Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C0B74EEA5A
	for <lists+dri-devel@lfdr.de>; Fri,  1 Apr 2022 11:25:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9C7C310E29F;
	Fri,  1 Apr 2022 09:25:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x632.google.com (mail-pl1-x632.google.com
 [IPv6:2607:f8b0:4864:20::632])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 002AA10E29F
 for <dri-devel@lists.freedesktop.org>; Fri,  1 Apr 2022 09:25:23 +0000 (UTC)
Received: by mail-pl1-x632.google.com with SMTP id e5so2000463pls.4
 for <dri-devel@lists.freedesktop.org>; Fri, 01 Apr 2022 02:25:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=cpps/7SgFquxKCOj7M8NgIo6De4u6whEjneyMo4UPFs=;
 b=Q6PGD1JOHNbZ64V72kkcK/KPtpC2zWKuQycsjZo5rWtV1MiuQ97AuWj1IPyn197/OR
 Buxc58Q0yQO+JBpQeztseOPQOQr+2TgzFKGW3VzNAR7c6eKjJJXlgIYzCof8QFeoQdFE
 qbrNgotWTxY/DbY89IYxpbpR/k1NzhsVRpCnpulnaYCTPwNLRwJYGQYzBU6RSJMyGw/p
 T03kfCYjjr4kzdBsuVJKdBlRyDZAFcSSx9jw/RNGtuNyCQTZKi8nNImONmbNLxIav80a
 UBzxUJwKxAuRjTrS8p7UlMz3uiyGcdlzZtWBPqTzCWAzO39OBzV7rdUBJVPGBmONkcz2
 6/8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=cpps/7SgFquxKCOj7M8NgIo6De4u6whEjneyMo4UPFs=;
 b=bnoz1ofw1juIdFbUm7U2BG0YIoFwMhXpq6n0X3G4opEoOCsUjQLgjCSQ+UQTaSlrxe
 e9HNmqZM86dzfjDFeSuekjXuCmwmax388tM5bj8IX3MCGCaS4o9jbuurLuSKb9oYZK4K
 RpKVsX4R6dMJ0G+nMdBYz76pC+NTPBctejqdKhShmWviQxNhckPAi1aX8i1L+zuDxFkf
 JKhwX+BDGBhMYljrL7o4qZlYAf+oXcvPBVYA6yQRtVegVkUG7EK+DIWFbuwzekZ9CHmt
 OTQNNxdKX2wCkrxy+amRWOYqcOQ9Wptfp660CkD/PDKBXf3gatX8HvvI20LbUupr2ogu
 xUNw==
X-Gm-Message-State: AOAM533NC2MlK1erpLE9SvdywBRfEguSZeAoeE/lHG4d8I4V4G7j1jDJ
 6QM6JRhVaJwywmayPNyZM9zkRZbMAXrJ0YyidZU=
X-Google-Smtp-Source: ABdhPJxezlGSi8KeogGlaccw9MFltaFsZMFMDGs0jf8o6lgPej2KNJmC1QA3IjMgku2i6lCVeXsdV26QsfufovSNWMU=
X-Received: by 2002:a17:902:7e0d:b0:156:47a4:a7c4 with SMTP id
 b13-20020a1709027e0d00b0015647a4a7c4mr9473951plm.141.1648805123539; Fri, 01
 Apr 2022 02:25:23 -0700 (PDT)
MIME-Version: 1.0
References: <20220330120246.25580-1-xiam0nd.tong@gmail.com>
 <20220330120246.25580-2-xiam0nd.tong@gmail.com>
In-Reply-To: <20220330120246.25580-2-xiam0nd.tong@gmail.com>
From: Patrik Jakobsson <patrik.r.jakobsson@gmail.com>
Date: Fri, 1 Apr 2022 11:25:12 +0200
Message-ID: <CAMeQTsaL45HwKjVoh2k0m1gq7j5ui43LBLXsq0_-RJnFko40mA@mail.gmail.com>
Subject: Re: [PATCH 1/5] gma500: fix a missing break in oaktrail_crtc_mode_set
To: Xiaomeng Tong <xiam0nd.tong@gmail.com>
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
Cc: David Airlie <airlied@linux.ie>,
 linux-kernel <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>, Zhao Yakui <yakui.zhao@intel.com>,
 Dave Airlie <airlied@redhat.com>, "Clark, Rob" <rob@ti.com>,
 Alan Cox <alan@linux.intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Mar 30, 2022 at 2:03 PM Xiaomeng Tong <xiam0nd.tong@gmail.com> wrote:
>
> Instead of exiting the loop as expected when an entry is found, the
> list_for_each_entry() continues until the traversal is complete. It
> will certainly lead to a invalid reference to list itereator variable
> 'connector' after the loop pointing an bogus address at an offset
> from the list head, and could lead to multiple 'is_*' flags being set
> with true mistakely too.
>
> The invalid reference to list itereator is here:
>         drm_object_property_get_value(&connector->base,
>
> To fix this, when found the entry, add a break after the switch
> statement.

Hi, this is already fixed in:
commit b1a7d0ddb169774c3db5afe9e64124daea7fdd9f
Author: Patrik Jakobsson <patrik.r.jakobsson@gmail.com>
Date:   Tue Mar 22 14:17:38 2022 +0100

    drm/gma500: Make use of the drm connector iterator

>
> Fixes: a69ac9ea85d87 ("drm/gma500: drm_connector_property -> drm_object_property")
> Signed-off-by: Xiaomeng Tong <xiam0nd.tong@gmail.com>
> ---
>  drivers/gpu/drm/gma500/oaktrail_crtc.c | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/drivers/gpu/drm/gma500/oaktrail_crtc.c b/drivers/gpu/drm/gma500/oaktrail_crtc.c
> index 36c7c2686c90..eb2d79872bd5 100644
> --- a/drivers/gpu/drm/gma500/oaktrail_crtc.c
> +++ b/drivers/gpu/drm/gma500/oaktrail_crtc.c
> @@ -409,6 +409,8 @@ static int oaktrail_crtc_mode_set(struct drm_crtc *crtc,
>                         is_mipi = true;
>                         break;
>                 }
> +
> +               break;
>         }
>
>         /* Disable the VGA plane that we never use */
> --
> 2.17.1
>
