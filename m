Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 02EC0250BAB
	for <lists+dri-devel@lfdr.de>; Tue, 25 Aug 2020 00:29:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 52EA66E554;
	Mon, 24 Aug 2020 22:29:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-xb43.google.com (mail-yb1-xb43.google.com
 [IPv6:2607:f8b0:4864:20::b43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D17EC89935;
 Mon, 24 Aug 2020 22:29:08 +0000 (UTC)
Received: by mail-yb1-xb43.google.com with SMTP id s195so6047435ybc.8;
 Mon, 24 Aug 2020 15:29:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=3qOJ3NzWfJ9sWmSZflRe5Z/SiLVOjHtScl8TXItrV3A=;
 b=l+ltexb5PPukV4iJ9LAIkMPnqWOS/KfO3eQhMs5uqymC9AarAqrzL4DZ55+LKrNKSz
 91zotAMJ+IBsnRBYfMbQH0xs+OdbmoP1up23cYmATdKMc/zXwQSpUTTHABL/n3opXon+
 HE/Fq/cAu5BJU4ImGNv+HhWYQNgGH+PP9yH2BMw349IfG6r3haeeQANG55nAS4FG/HeO
 NaxgdyRtxv6hwQUz9Sr8jRak8zKTXBwlzmdT/1qpVEczfvPzB09TFH4x2FhExHHvpZLE
 e/ucPg/YKPJOPgfgV3cqPS7dPwu7mJ7VD1kWkeGncoG7+i/tF0ozMTgIkVhXZBG13v2C
 Zh3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=3qOJ3NzWfJ9sWmSZflRe5Z/SiLVOjHtScl8TXItrV3A=;
 b=cx9O4XoVmT1lIY9sNr6v6DfnLvnNo7A3w22+NSCAY8UIAXz0V8DvpsnwiJw4D5T/fR
 mBQrN18eGk3lu5LX9Sfr8BUJIvvAQchvlWNORaoDNHsW9N0DJTBGTii6KCypJgw6GWf/
 qFpVRF31o8ZwNxjY+j3UttrnxBirr/rM/l8Y2FSexpS/Rznej0aCOBpS5pV2ERp2Wn3W
 kNvd/y6+4dt6PonbBF5jVE+dYzRMkw7gsRWFOkhG/lG3C0G7ARvu5ZUR8oHFvIfQMG2q
 AI15hAVWlyx9rc4Ey/GS38aDKHkwoL8Ox15IQFm8EAehX0L7DKG5QZ6+udXvzqpMoUzj
 THwA==
X-Gm-Message-State: AOAM532NmZJvMLAPFxrkSahSG6H8rkdPHPVTE2klgkqXjYltxoeuiw1O
 fjJewq6C8YEf4b4VUlWVgGfUJaCsVsoNNgOMue4=
X-Google-Smtp-Source: ABdhPJwYgl3FJMdku6i+4HiglRO8zsQRW9BAP3I/BEAqKMIf1RRP+xNfrrsy4rPjxTHUVwO6XaFN+jSnZyngLiRiyAU=
X-Received: by 2002:a25:8447:: with SMTP id r7mr9673141ybm.147.1598308147950; 
 Mon, 24 Aug 2020 15:29:07 -0700 (PDT)
MIME-Version: 1.0
References: <20200824183253.826343-1-lyude@redhat.com>
 <20200824183253.826343-2-lyude@redhat.com>
In-Reply-To: <20200824183253.826343-2-lyude@redhat.com>
From: Ben Skeggs <skeggsb@gmail.com>
Date: Tue, 25 Aug 2020 08:28:56 +1000
Message-ID: <CACAvsv6hymdcGkEcigL3fWACZ_1POpB+aefq9d9ChnYv_dHnVg@mail.gmail.com>
Subject: Re: [Nouveau] [PATCH 1/2] drm/nouveau/kms/nv50-: Program notifier
 offset before requesting disp caps
To: Lyude Paul <lyude@redhat.com>
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
Cc: Sasha Levin <sashal@kernel.org>, David Airlie <airlied@linux.ie>,
 ML nouveau <nouveau@lists.freedesktop.org>,
 open list <linux-kernel@vger.kernel.org>,
 "open list:DRM DRIVER FOR NVIDIA GEFORCE/QUADRO GPUS"
 <dri-devel@lists.freedesktop.org>, Ben Skeggs <bskeggs@redhat.com>,
 stable@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, 25 Aug 2020 at 04:33, Lyude Paul <lyude@redhat.com> wrote:
>
> Not entirely sure why this never came up when I originally tested this
> (maybe some BIOSes already have this setup?) but the ->caps_init vfunc
> appears to cause the display engine to throw an exception on driver
> init, at least on my ThinkPad P72:
>
> nouveau 0000:01:00.0: disp: chid 0 mthd 008c data 00000000 0000508c 0000102b
>
> This is magic nvidia speak for "You need to have the DMA notifier offset
> programmed before you can call NV507D_GET_CAPABILITIES." So, let's fix
> this by doing that, and also perform an update afterwards to prevent
> racing with the GPU when reading capabilities.
>
> Changes since v1:
> * Don't just program the DMA notifier offset, make sure to actually
>   perform an update
I'm not sure there's a need to send an Update() method here, I believe
GetCapabilities() is an action method on its own right?

Ben.

>
> Signed-off-by: Lyude Paul <lyude@redhat.com>
> Fixes: 4a2cb4181b07 ("drm/nouveau/kms/nv50-: Probe SOR and PIOR caps for DP interlacing support")
> Cc: <stable@vger.kernel.org> # v5.8+
> ---
>  drivers/gpu/drm/nouveau/dispnv50/core507d.c | 25 ++++++++++++++++-----
>  1 file changed, 19 insertions(+), 6 deletions(-)
>
> diff --git a/drivers/gpu/drm/nouveau/dispnv50/core507d.c b/drivers/gpu/drm/nouveau/dispnv50/core507d.c
> index e341f572c2696..5e86feec3b720 100644
> --- a/drivers/gpu/drm/nouveau/dispnv50/core507d.c
> +++ b/drivers/gpu/drm/nouveau/dispnv50/core507d.c
> @@ -65,13 +65,26 @@ core507d_ntfy_init(struct nouveau_bo *bo, u32 offset)
>  int
>  core507d_caps_init(struct nouveau_drm *drm, struct nv50_disp *disp)
>  {
> -       u32 *push = evo_wait(&disp->core->chan, 2);
> +       struct nv50_core *core = disp->core;
> +       u32 interlock[NV50_DISP_INTERLOCK__SIZE] = {0};
> +       u32 *push;
>
> -       if (push) {
> -               evo_mthd(push, 0x008c, 1);
> -               evo_data(push, 0x0);
> -               evo_kick(push, &disp->core->chan);
> -       }
> +       core->func->ntfy_init(disp->sync, NV50_DISP_CORE_NTFY);
> +
> +       push = evo_wait(&core->chan, 4);
> +       if (!push)
> +               return 0;
> +
> +       evo_mthd(push, 0x0084, 1);
> +       evo_data(push, 0x80000000 | NV50_DISP_CORE_NTFY);
> +       evo_mthd(push, 0x008c, 1);
> +       evo_data(push, 0x0);
> +       evo_kick(push, &core->chan);
> +
> +       core->func->update(core, interlock, false);
> +       if (core->func->ntfy_wait_done(disp->sync, NV50_DISP_CORE_NTFY,
> +                                      core->chan.base.device))
> +               NV_ERROR(drm, "core notifier timeout\n");
>
>         return 0;
>  }
> --
> 2.26.2
>
> _______________________________________________
> Nouveau mailing list
> Nouveau@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/nouveau
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
