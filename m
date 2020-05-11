Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 76A5B1CE876
	for <lists+dri-devel@lfdr.de>; Tue, 12 May 2020 00:52:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0D9B96E7D1;
	Mon, 11 May 2020 22:52:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-xd42.google.com (mail-io1-xd42.google.com
 [IPv6:2607:f8b0:4864:20::d42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AA6C589DEC;
 Mon, 11 May 2020 17:18:18 +0000 (UTC)
Received: by mail-io1-xd42.google.com with SMTP id f3so10635416ioj.1;
 Mon, 11 May 2020 10:18:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=b7ywi95dPkco7T5CqY7Ij21XZ2F7lgDUu5ELoqshkqg=;
 b=I60NhLeQjiGFzyZYQdNeASF8N8lVpKsXrFoi+WEQVPRg6ORfGQNSbSoDlW85TD8dq8
 wpMkDS4G3H/3cUbmsSfQgce4XDuGRzrvXeoS2W/aGTlm7tvJ2luOrDCYfda4tZ3LX0wh
 snyFihC9Et+xceZ58cN+y8I6gg76Hl0qcdMaD1Hc3rgSfI1/K23spAX0T7lWlWQs7gLV
 xR5jI7qIz+XDH5j7p8MSr9Ll9Ipl7o67P1oMZpCadGAojWOhGZm2ctyhfT35ZyVQEm37
 6mOzZrqOFWCjLI0MIZQKDSuTnqzHLBqDnBdyxxX0m1klqc0e0vn3xBRrgpXk/P5w2z7p
 hAsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=b7ywi95dPkco7T5CqY7Ij21XZ2F7lgDUu5ELoqshkqg=;
 b=lW+PTY+Fb+v8Qw6fHf4B5CrkMPcNNKgWzs0Scgb3oee8Z11tbjcgG3153pgjwIG8gO
 P2xXkaOlgxmm+8w4jJ737ojTyjAuY2zShDIgtiCPdCjSWnyGgFKj27ZiRmVDwhS0+rwx
 3J5XC5/qR9nOPBWAyxt1f1rQQge6ZI7pbNOUnc+l0lCuoHcA9mEJrY7WU77bjCYz4gGb
 pgyEO5Arr3+ATD1c0/R3/+XsDfxPaSTQbJs30sly2W0dRHABEfaNXfKcRJv6LrGs+hxN
 v2kAgFZh6T6NK9eshx2NGZi3Te/JZAYljxXlkMfby+nh06YbSNqqToUTJcKy3cYOiO/S
 q/Vg==
X-Gm-Message-State: AGi0PuZjKQIkc1oB2Sy9EW9yClF+Z4/7sKhBigk2Le9xsHGKHpYB4QTJ
 L9JkIAyaEJ5dunAIFYhwHZCLL/XoiJd82cJG04h9pA==
X-Google-Smtp-Source: APiQypJK/GCol9m33Ip4vahld070bNhXa0mDffBWMWJqSqmecoGneQtpaBcLCytsmrkR2/wYrlQanW8EFsR3wT4jguU=
X-Received: by 2002:a05:6638:11d4:: with SMTP id
 g20mr2067852jas.19.1589217498143; 
 Mon, 11 May 2020 10:18:18 -0700 (PDT)
MIME-Version: 1.0
References: <20200501205201.149804-1-konradybcio@gmail.com>
In-Reply-To: <20200501205201.149804-1-konradybcio@gmail.com>
From: Jeffrey Hugo <jeffrey.l.hugo@gmail.com>
Date: Mon, 11 May 2020 11:18:07 -0600
Message-ID: <CAOCk7NqbOsQ2Bz1K8Gkeh75pLHDaUn6MhE1T7NkMYEHOPoL0NQ@mail.gmail.com>
Subject: Re: [PATCH] drivers: gpu: drm: Add MDP5 configuration for MSM8x36 and
 its derivatives, such as MSM8939.
To: Konrad Dybcio <konradybcio@gmail.com>
X-Mailman-Approved-At: Mon, 11 May 2020 22:51:58 +0000
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
Cc: freedreno <freedreno@lists.freedesktop.org>, skrzynka@konradybcio.pl,
 David Airlie <airlied@linux.ie>, MSM <linux-arm-msm@vger.kernel.org>,
 lkml <linux-kernel@vger.kernel.org>,
 "open list:DRM PANEL DRIVERS" <dri-devel@lists.freedesktop.org>,
 zhengbin <zhengbin13@huawei.com>, Alexios Zavras <alexios.zavras@intel.com>,
 Ben Dooks <ben.dooks@codethink.co.uk>, Thomas Gleixner <tglx@linutronix.de>,
 AngeloGioacchino Del Regno <kholk11@gmail.com>, Sean Paul <sean@poorly.run>,
 Allison Randal <allison@lohutok.net>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, May 1, 2020 at 2:52 PM Konrad Dybcio <konradybcio@gmail.com> wrote:
>
> Signed-off-by: Konrad Dybcio <konradybcio@gmail.com>
> ---
>  drivers/gpu/drm/msm/disp/mdp5/mdp5_cfg.c | 70 ++++++++++++++++++++++++
>  1 file changed, 70 insertions(+)
>
> diff --git a/drivers/gpu/drm/msm/disp/mdp5/mdp5_cfg.c b/drivers/gpu/drm/msm/disp/mdp5/mdp5_cfg.c
> index e3c4c250238b7..1c7de7d6870cf 100644
> --- a/drivers/gpu/drm/msm/disp/mdp5/mdp5_cfg.c
> +++ b/drivers/gpu/drm/msm/disp/mdp5/mdp5_cfg.c
> @@ -342,6 +342,75 @@ static const struct mdp5_cfg_hw msm8x16_config = {
>         .max_clk = 320000000,
>  };
>
> +static const struct mdp5_cfg_hw msm8x36_config = {
> +       .name = "msm8x36",
> +       .mdp = {
> +               .count = 1,
> +               .base = { 0x0 },
> +               .caps = MDP_CAP_SMP |
> +                       0,

Is the "| 0" really adding value here?
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
