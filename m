Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 93E43308814
	for <lists+dri-devel@lfdr.de>; Fri, 29 Jan 2021 12:09:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9ABF26EACD;
	Fri, 29 Jan 2021 11:09:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x12c.google.com (mail-lf1-x12c.google.com
 [IPv6:2a00:1450:4864:20::12c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1143F6EACD
 for <dri-devel@lists.freedesktop.org>; Fri, 29 Jan 2021 11:09:41 +0000 (UTC)
Received: by mail-lf1-x12c.google.com with SMTP id a8so11925268lfi.8
 for <dri-devel@lists.freedesktop.org>; Fri, 29 Jan 2021 03:09:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=jp018/NNbeQpvYse40r6JT7x/m5TRiAGOXsBxOinmfU=;
 b=hUiNnPRhrY2JVvfCtwmz+1ntIB5YmG9J/mas4Ux8Y5HG5WfOtpYPcMELHaGmTH3vNI
 wdc/x3G3Gum9KhrCUoxPMJxjTJby9T8qmMdkohWdFQdcPpLH9zsrIDfycZJ32O8gN+h3
 Vr1tpZBBmQnpbyGXWg3NpDyWdPZnNXevUNUOYQID2RgELKijDOv9F0BeEdW/LKwM+hbU
 xXF+Zo6iz36kB7LTO97inZH62vEC9V9yCrKig/nwQMC3sg0q648OKLOTF5GpydfyZF34
 PhJ2JV9DCib9kOBfUJI85r075EO6uoSw45Nyy7oW8kV57UQU1uZWmN3lZwv/qCXvMzIb
 4bFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=jp018/NNbeQpvYse40r6JT7x/m5TRiAGOXsBxOinmfU=;
 b=GbNuRklcvJA8rrZf4vwiudAaN4cHI9iu2vj0DMTU7YxPpb7wOLjLcifFeK8aH1+VP9
 tikjPeZK3lC/u1OkptcKajBugeJEoJzFL8UMMXggb2AABiE3zGL+P+uL1nOKCcrS4V+s
 V07QPpK5NmQeTXzqwGBwRid/cJJyGWQHPf7BTJPp+PDD+a41DOLvxO3p/TuojWxsvcrI
 1lhk2XDlEQNknMFCAOAvqVLed+h9V9D4nwru1BFPZKpBGIvC6v2feXInFPrnoz8/2V7i
 yAkhWxcb9jCAWf3Y8HLBv88U3orcyVxfk6sHrEn82zJlMJYgDyOEvmsE4SLF+wT8frqx
 YWGg==
X-Gm-Message-State: AOAM5333lk5+zLF0uu3iWrQC50cYBiN311LG46jwu+U1mqcalQHrOf+O
 X0sdMV9iDHGisxZD5tlTBPT22WK4byUr1ivaJkY=
X-Google-Smtp-Source: ABdhPJzvJSG6dl3tQG5hDl8Vpkf6jqTxr9e8yE+8nL9g0gJkklhIZipKiJf20C009r2clZiD1qifzCI9wEK7de/z0KI=
X-Received: by 2002:a19:ad0d:: with SMTP id t13mr1649736lfc.539.1611918579468; 
 Fri, 29 Jan 2021 03:09:39 -0800 (PST)
MIME-Version: 1.0
References: <20210119231341.2498036-1-festevam@gmail.com>
In-Reply-To: <20210119231341.2498036-1-festevam@gmail.com>
From: Fabio Estevam <festevam@gmail.com>
Date: Fri, 29 Jan 2021 08:09:29 -0300
Message-ID: <CAOMZO5AekLMhN6+itpaROqOdmE3mV-Z8yKoCRcyNxPoW7tqPuw@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] drm/msm: Call shutdown conditionally
To: Rob Clark <robdclark@gmail.com>
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
Cc: Krishna Manikandan <mkrishn@codeaurora.org>,
 Jonathan Marek <jonathan@marek.ca>, David Airlie <airlied@linux.ie>,
 DRI mailing list <dri-devel@lists.freedesktop.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>, stable <stable@vger.kernel.org>,
 Sascha Hauer <kernel@pengutronix.de>, kalyan_t@codeaurora.org,
 Sean Paul <sean@poorly.run>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Rob,

Any comments on this series, please?

On Tue, Jan 19, 2021 at 8:15 PM Fabio Estevam <festevam@gmail.com> wrote:
>
> Issuing a 'reboot' command in i.MX5 leads to the following flow:
>
> [   24.557742] [<c0769b78>] (msm_atomic_commit_tail) from [<c06db0b4>]
> (commit_tail+0xa4/0x1b0)
> [   24.566349] [<c06db0b4>] (commit_tail) from [<c06dbed0>]
> (drm_atomic_helper_commit+0x154/0x188)
> [   24.575193] [<c06dbed0>] (drm_atomic_helper_commit) from
> [<c06db604>] (drm_atomic_helper_disable_all+0x154/0x1c0)
> [   24.585599] [<c06db604>] (drm_atomic_helper_disable_all) from
> [<c06db704>] (drm_atomic_helper_shutdown+0x94/0x12c)
> [   24.596094] [<c06db704>] (drm_atomic_helper_shutdown) from
>
> In the i.MX5 case, priv->kms is not populated (as i.MX5 does not use any
> of the Qualcomm display controllers), causing a NULL pointer
> dereference in msm_atomic_commit_tail():
>
> [   24.268964] 8<--- cut here ---
> [   24.274602] Unable to handle kernel NULL pointer dereference at
> virtual address 00000000
> [   24.283434] pgd = (ptrval)
> [   24.286387] [00000000] *pgd=ca212831
> [   24.290788] Internal error: Oops: 17 [#1] SMP ARM
> [   24.295609] Modules linked in:
> [   24.298777] CPU: 0 PID: 197 Comm: init Not tainted 5.11.0-rc2-next-20210111 #333
> [   24.306276] Hardware name: Freescale i.MX53 (Device Tree Support)
> [   24.312442] PC is at msm_atomic_commit_tail+0x54/0xb9c
> [   24.317743] LR is at commit_tail+0xa4/0x1b0
>
> Fix the problem by calling drm_atomic_helper_shutdown() conditionally.
>
> Cc: <stable@vger.kernel.org>
> Fixes: 9d5cbf5fe46e ("drm/msm: add shutdown support for display platform_driver")
> Suggested-by: Rob Clark <robdclark@gmail.com>
> Signed-off-by: Fabio Estevam <festevam@gmail.com>
> ---
> Changes since v1:
> - Explain in the commit log that the problem happens after a 'reboot' command.
>
>  drivers/gpu/drm/msm/msm_drv.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/msm/msm_drv.c b/drivers/gpu/drm/msm/msm_drv.c
> index 108c405e03dd..c082b72b9e3b 100644
> --- a/drivers/gpu/drm/msm/msm_drv.c
> +++ b/drivers/gpu/drm/msm/msm_drv.c
> @@ -1311,7 +1311,8 @@ static void msm_pdev_shutdown(struct platform_device *pdev)
>  {
>         struct drm_device *drm = platform_get_drvdata(pdev);
>
> -       drm_atomic_helper_shutdown(drm);
> +       if (get_mdp_ver(pdev))
> +               drm_atomic_helper_shutdown(drm);
>  }
>
>  static const struct of_device_id dt_match[] = {
> --
> 2.25.1
>
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
