Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A39E23BFFF
	for <lists+dri-devel@lfdr.de>; Tue,  4 Aug 2020 21:31:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 01BEC89CD5;
	Tue,  4 Aug 2020 19:31:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x543.google.com (mail-ed1-x543.google.com
 [IPv6:2a00:1450:4864:20::543])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1CD7089CD5;
 Tue,  4 Aug 2020 19:31:47 +0000 (UTC)
Received: by mail-ed1-x543.google.com with SMTP id bs17so11982701edb.1;
 Tue, 04 Aug 2020 12:31:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=lPQhi2EGIWphqgXXS6/LgcuZPutzCILAsqJJu6qo/8w=;
 b=b22tYC6z9W/pbIRO7pJWfs9ARLlciURv3Ksmck7YruC7f5u3NH1DKq5lVFgz/t3qqV
 W/JlYe5Bl2+t9oCR8Sm1qfSKQzMujgg9Wg2C7ZkGJaLqh6A5jLqskKrWqViCYnmNo2L+
 nv8/HgDn0+cqpExXpEniNbSJ6qBDHGZm0HQQZQT3fdWO9PhLxX8N/ASz+EutLp3lgAfl
 ZaJExNIczPugzHIw3Mr9HKcuQzQduUi6thP4zEXv05vIbEYRCHykgfBC2e9kebRjQJfh
 UtetO4nSPpY1RhZbbDpNiLPTTrmkAqr6t4wGjJV1NHzPoWjmNP1koKNIZD7ta2+c2X/X
 ssQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=lPQhi2EGIWphqgXXS6/LgcuZPutzCILAsqJJu6qo/8w=;
 b=jZDPsrxKkHHiT9em2WHqeFOAa8ufXW3r9tXOCjPb9EwRIxgca30BOWipl8pa73frSk
 H9gptf23XimAalvqR0Hhgwsk6Ur8JBh503OEIyOv0M7Y0gPKQrY+T3emGm17oLkWJrUC
 SQ/WAtiUypIPwpXaGbomMlQy5dhCMAMXP1pBJFjiSBKlCBClomR2tCpPl/653gMZ8jNG
 hjEKOmNaqHQzoK/b1tZm4esjgoGy98VNrB+3yCUtmw8r9l9RPB4aflA5i/KFd6dvsbx6
 Dj0b/vDInqR2MIcwSGpyMfEfvSILMFzJBUm3cRq06axoxL0E4qIv6p6a4Zsw83fIFNTi
 KMZQ==
X-Gm-Message-State: AOAM531gzegaqnnlBPqkP4u6OHIkgyjiRCsePPxN08NYnJnFDOtFw2pv
 ZcSLTZw1Dzz/Fzp5cAASfanGa8j7pFBz0pUmy0Q=
X-Google-Smtp-Source: ABdhPJyWzQIa1aqdPHfKxqQQpi7/uDtf+blsHcQxkD1HTdQTfhXqWmSKU5IaGYgFNsjgBZf8SpKdcLXhi7nHsJkqAV4=
X-Received: by 2002:a50:fd16:: with SMTP id i22mr21981071eds.281.1596569505319; 
 Tue, 04 Aug 2020 12:31:45 -0700 (PDT)
MIME-Version: 1.0
References: <1596540744-6902-1-git-send-email-kalyan_t@codeaurora.org>
In-Reply-To: <1596540744-6902-1-git-send-email-kalyan_t@codeaurora.org>
From: Rob Clark <robdclark@gmail.com>
Date: Tue, 4 Aug 2020 12:32:29 -0700
Message-ID: <CAF6AEGtpPU+ALcpQMuy-MpLF_ZwjD+k=aN7gkoBFjJPq1++9qQ@mail.gmail.com>
Subject: Re: [v1] drm/msm/dpu: update reservations in commit path
To: Kalyan Thota <kalyan_t@codeaurora.org>
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
Cc: "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, Krishna Manikandan <mkrishn@codeaurora.org>,
 linux-arm-msm <linux-arm-msm@vger.kernel.org>,
 Raviteja Tamatam <travitej@codeaurora.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Douglas Anderson <dianders@chromium.org>, Sean Paul <seanpaul@chromium.org>,
 Abhinav Kumar <abhinavk@codeaurora.org>,
 Drew Davenport <ddavenport@chromium.org>,
 "Kristian H. Kristensen" <hoegsberg@chromium.org>,
 Stephen Boyd <swboyd@chromium.org>,
 freedreno <freedreno@lists.freedesktop.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Aug 4, 2020 at 4:32 AM Kalyan Thota <kalyan_t@codeaurora.org> wrote:
>
> DPU resources reserved in the atomic_check path gets unwinded
> during modeset operation before commit happens in a non seamless
> transition.
>
> Update the reservations in the commit path to avoid resource
> failures. Secondly have dummy reservations in atomic_check path
> so that we can gracefully fail the composition if resources are
> not available.
>
> Signed-off-by: Kalyan Thota <kalyan_t@codeaurora.org>
> ---
>  drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c | 15 +++++++++++----
>  1 file changed, 11 insertions(+), 4 deletions(-)
>
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> index 63976dc..c6b8254 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> @@ -565,7 +565,7 @@ static int dpu_encoder_virt_atomic_check(
>         const struct drm_display_mode *mode;
>         struct drm_display_mode *adj_mode;
>         struct msm_display_topology topology;
> -       struct dpu_global_state *global_state;
> +       struct dpu_global_state tmp_resv_state;
>         int i = 0;
>         int ret = 0;
>
> @@ -582,7 +582,7 @@ static int dpu_encoder_virt_atomic_check(
>         dpu_kms = to_dpu_kms(priv->kms);
>         mode = &crtc_state->mode;
>         adj_mode = &crtc_state->adjusted_mode;
> -       global_state = dpu_kms_get_existing_global_state(dpu_kms);
> +       memset(&tmp_resv_state, 0, sizeof(tmp_resv_state));

I think what you want to do is dpu_kms_get_global_state().. that will
clone/duplicate the existing global state (or return the already
duplicated global state if it is called multiple times).

It is safe to modify this global state in the atomic_check() path.. in
fact that is the intention.  For a TEST_ONLY atomic commit, or if any
of the atomic_check()'s fail, this new duplicated global state is
discarded.  If all the checks succeed and the atomic update is
committed to hw, this new global state replaces the existing global
state.

BR,
-R

>         trace_dpu_enc_atomic_check(DRMID(drm_enc));
>
>         /*
> @@ -621,7 +621,7 @@ static int dpu_encoder_virt_atomic_check(
>                  * info may not be available to complete reservation.
>                  */
>                 if (drm_atomic_crtc_needs_modeset(crtc_state)) {
> -                       ret = dpu_rm_reserve(&dpu_kms->rm, global_state,
> +                       ret = dpu_rm_reserve(&dpu_kms->rm, &tmp_resv_state,
>                                         drm_enc, crtc_state, topology);
>                 }
>         }
> @@ -966,7 +966,7 @@ static void dpu_encoder_virt_mode_set(struct drm_encoder *drm_enc,
>         struct dpu_hw_blk *hw_lm[MAX_CHANNELS_PER_ENC];
>         struct dpu_hw_blk *hw_dspp[MAX_CHANNELS_PER_ENC] = { NULL };
>         int num_lm, num_ctl, num_pp, num_dspp;
> -       int i, j;
> +       int i, j, rc;
>
>         if (!drm_enc) {
>                 DPU_ERROR("invalid encoder\n");
> @@ -1006,6 +1006,13 @@ static void dpu_encoder_virt_mode_set(struct drm_encoder *drm_enc,
>
>         topology = dpu_encoder_get_topology(dpu_enc, dpu_kms, adj_mode);
>
> +       rc = dpu_rm_reserve(&dpu_kms->rm, global_state, drm_enc,
> +               drm_crtc->state, topology);
> +       if (rc) {
> +               DPU_ERROR_ENC(dpu_enc, "Failed to reserve resources\n");
> +               return;
> +       }
> +
>         /* Query resource that have been reserved in atomic check step. */
>         num_pp = dpu_rm_get_assigned_resources(&dpu_kms->rm, global_state,
>                 drm_enc->base.id, DPU_HW_BLK_PINGPONG, hw_pp,
> --
> 1.9.1
>
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
