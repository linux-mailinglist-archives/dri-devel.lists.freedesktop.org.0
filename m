Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C30D43DB4C
	for <lists+dri-devel@lfdr.de>; Thu, 28 Oct 2021 08:38:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DD4D16E8F3;
	Thu, 28 Oct 2021 06:38:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x32b.google.com (mail-ot1-x32b.google.com
 [IPv6:2607:f8b0:4864:20::32b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0BAE96E7DD
 for <dri-devel@lists.freedesktop.org>; Thu, 28 Oct 2021 06:38:26 +0000 (UTC)
Received: by mail-ot1-x32b.google.com with SMTP id
 107-20020a9d0a74000000b00553bfb53348so7296273otg.0
 for <dri-devel@lists.freedesktop.org>; Wed, 27 Oct 2021 23:38:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:in-reply-to:references:from:user-agent:date:message-id
 :subject:to:cc;
 bh=Q0aPYShzUHQahtTa1rDM0UEGu5hh3TXopg752neKMGg=;
 b=KruDRqjhoLjx+sYOUpcq3sXk+XjHwJCdCH64uMmttuPc0A1Ta8HjzGKGqfQturSuV4
 eJC8zMQU25XhO1/5qaLQ9Z4UUuhozYFk6zA47U4yYRH/7RQDkdwNLZ0B9O5Nm8wv8ldd
 /jFaUIShVutNM8YxnxPYE1zdvlfpCnyPyxfxw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:in-reply-to:references:from
 :user-agent:date:message-id:subject:to:cc;
 bh=Q0aPYShzUHQahtTa1rDM0UEGu5hh3TXopg752neKMGg=;
 b=M39PgNGXrg8bGCsSCmpzm0MCIOq7K9NchAHtau0roixwT8DgUoD5/e5evvWodLj+fp
 p5VCPSzNLcaOuTd00naNlQ7VHBv7P21seQRbm4t05yxrqQYdjNSk9N44MEc3vnQOQtf6
 6OmSIa0leRxwmX8qT7IHU+kj5yF8cajQUpctuKE6ppr3EgfbjvC/+nKGsbnZvgJfIbLs
 NMVVPVc/UQiB07ULL3IAKTlL4zPD/i+1ZPQmRvyh7bY/VowCHcm7WRvA91LFt3MeKC1j
 jH95Rr8NtyGRmC+BAociybvLKrorpVHxn3bscZZbTNk4ZLtgB/yGwV6K92dVuBYoE3Sj
 DfSw==
X-Gm-Message-State: AOAM531FanPJm19Xvu6AOFAwtyB2CxFXv65ju48wBpv3krzozxBrtR7S
 H53G+sCL9DTc3d1q0vPh150tpV0tAgsYZbR8VjN5Pw==
X-Google-Smtp-Source: ABdhPJy5II9bUKXp0PmXN9iZD0uyK1uwYoFfurzgzrVy+zidgimkf19uyPDV0C7OcPK1KlpMppshRp1NEBWVvR6ePUk=
X-Received: by 2002:a9d:7655:: with SMTP id o21mr1932382otl.126.1635403105338; 
 Wed, 27 Oct 2021 23:38:25 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 27 Oct 2021 23:38:25 -0700
MIME-Version: 1.0
In-Reply-To: <1635386088-18089-7-git-send-email-quic_sbillaka@quicinc.com>
References: <1635386088-18089-1-git-send-email-quic_sbillaka@quicinc.com>
 <1635386088-18089-7-git-send-email-quic_sbillaka@quicinc.com>
From: Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.9.1
Date: Wed, 27 Oct 2021 23:38:24 -0700
Message-ID: <CAE-0n50YcX6sCoTR0bUy_GrZM7=UdHPAGYNwE3Nvj6GL4iTmMg@mail.gmail.com>
Subject: Re: [PATCH v3 6/6] drm/msm/dp: Remove the hpd init delay for eDP
To: Sankeerth Billakanti <quic_sbillaka@quicinc.com>,
 dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, linux-arm-msm@vger.kernel.org, 
 linux-kernel@vger.kernel.org
Cc: robdclark@gmail.com, seanpaul@chromium.org, kalyan_t@codeaurora.org, 
 abhinavk@codeaurora.org, dianders@chromium.org, khsieh@codeaurora.org, 
 mkrishn@codeaurora.org, sbillaka@codeaurora.org
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Quoting Sankeerth Billakanti (2021-10-27 18:54:48)
> DP driver needs a 10 second delay before phy_init so that
> the usb combo phy initializes and sets up the necessary
> clocks for usb devices such as keyboard and mouse.
>
> eDP controller uses a standalone phy and need not wait for
> phy initialization from any other component. This change
> will remove the delay for eDP controller.
>
> Signed-off-by: Sankeerth Billakanti <quic_sbillaka@quicinc.com>
> ---
>  drivers/gpu/drm/msm/dp/dp_display.c | 11 ++++++++++-
>  1 file changed, 10 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
> index 61385d6..de6a1fd 100644
> --- a/drivers/gpu/drm/msm/dp/dp_display.c
> +++ b/drivers/gpu/drm/msm/dp/dp_display.c
> @@ -1438,7 +1439,15 @@ void msm_dp_irq_postinstall(struct msm_dp *dp_display)
>
>         dp_hpd_event_setup(dp);
>
> -       dp_add_event(dp, EV_HPD_INIT_SETUP, 0, 100);
> +       if (dp->dp_display.connector_type == DRM_MODE_CONNECTOR_eDP) {
> +               /* eDP does not need any delay before phy init */
> +               delay = 0;
> +       } else {
> +               /* DP needs 10 second delay to let usb combo phy initialize */

This seems to be a different approach to the patch Kuogee sent a week or
two ago. Can we figure out what's wrong with the DP phy starting before
the USB phy? I suppose this patch is OK as a temporary hack to keep
moving with eDP, but we really need to figure out what's wrong with DP
so this delay can be removed entirely. Has any progress been made on
that?

> +               delay = 100;
> +       }
> +
> +       dp_add_event(dp, EV_HPD_INIT_SETUP, 0, delay);
