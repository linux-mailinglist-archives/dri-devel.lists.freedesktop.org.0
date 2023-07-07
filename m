Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B29374B901
	for <lists+dri-devel@lfdr.de>; Fri,  7 Jul 2023 23:58:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E525310E00D;
	Fri,  7 Jul 2023 21:58:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-xb2f.google.com (mail-yb1-xb2f.google.com
 [IPv6:2607:f8b0:4864:20::b2f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E69C210E00D
 for <dri-devel@lists.freedesktop.org>; Fri,  7 Jul 2023 21:58:15 +0000 (UTC)
Received: by mail-yb1-xb2f.google.com with SMTP id
 3f1490d57ef6-c17534f4c63so2638701276.0
 for <dri-devel@lists.freedesktop.org>; Fri, 07 Jul 2023 14:58:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1688767094; x=1691359094;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=urIvIMoYHR6wFIwBX4+MGbcbTxdcdrDtNJHB7IMO87E=;
 b=LzoJ48zhQ01CEQcGZQgcWyFBP2tt4XI/gDQzFMqhrmUWH6IZeqBr+xxsG4aJjf8JEs
 Cr1OziFQ0fplCqTgPiUF4PS6BCVN5Y7JYJkiI5yL2UQEAJyUY8sJirG5DzWfcgSz+FJR
 ZfsHZG7gisqF59/YmUNdWD9kvFrYn1CKTWRIsO1jT4KYLLdE46JCyANNif5tyP/09p6E
 0R5wUAmKSKsMRd8q4QXcQmFVKCxIp1YyPkaRniUbuLuS9YgRC5ZQwvWg2uTFvt8rQo3p
 af6VVxZT0HF92GXqfPMRZiqT0ouNxurol7mrLGzX7Z9qRb1xYWDVPzR545lQDtGBTrNQ
 w8ZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1688767094; x=1691359094;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=urIvIMoYHR6wFIwBX4+MGbcbTxdcdrDtNJHB7IMO87E=;
 b=j0REWzgbhOtrnR1KqxrkHnmPAL9bIDH/WxEVYp15Csz7+pXE6niVk95g89O1QwAzgi
 BZgWj5UBxHXP6VHs+PzLzzDLU1NQkGA3rjGlyqloWOpyIWG8ltKajd5nTm9e2JFtkSBG
 35BL6eOcAVKbXZwYLIflVb4i6xnRYj4wZ7oL8ZUTLNhiKk393cKn9q/bp0QyEmqaXhxq
 wVQt6KRr4fXXWNLUOkI7lhhhohQ7eOU+7+M6O3gWAEfcpcf++ha/k5jvu2+cB1v2wqJW
 EV5wyHqLMYr6aqTTTDA10jNsUHo2tWHq3Dek/xv4/Asd+zv4YhslGjqML3woVHdcW+fD
 lufA==
X-Gm-Message-State: ABy/qLYUc0YDiCIlrUCSGdoUTgK66/l+YKSBGVdw68lMrAl8o6Cz7YJs
 L9uq4P2Tkx9fbjEOrT80U68risYtm5Jca24emufuzA==
X-Google-Smtp-Source: APBJJlEZ0aMW1BynuZY1nBJ104lyyGw5RKn8yW+B+2efS9x6d0pBfqski96kniXhXoHcmqrJCpb/RXTj+uLYfd7aszU=
X-Received: by 2002:a25:41c8:0:b0:c61:daee:2c8e with SMTP id
 o191-20020a2541c8000000b00c61daee2c8emr4839504yba.63.1688767094263; Fri, 07
 Jul 2023 14:58:14 -0700 (PDT)
MIME-Version: 1.0
References: <20230622-devcoredump_patch-v4-0-e304ddbe9648@quicinc.com>
 <20230622-devcoredump_patch-v4-6-e304ddbe9648@quicinc.com>
 <0493c891-9cde-8284-a988-b6e95135db85@linaro.org>
 <ee853769-d1ba-5189-1afd-62731c62966c@quicinc.com>
In-Reply-To: <ee853769-d1ba-5189-1afd-62731c62966c@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Sat, 8 Jul 2023 00:58:03 +0300
Message-ID: <CAA8EJprRtR1obKOOhHN1FAKs9O0na=ZjFBqrphaZ4vW92mSnUQ@mail.gmail.com>
Subject: Re: [PATCH v4 6/6] drm/msm/dpu: Update dev core dump to dump
 registers of sub-blocks
To: Ryan McCann <quic_rmccann@quicinc.com>
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
Cc: Rob Clark <robdclark@chromium.org>, freedreno@lists.freedesktop.org,
 quic_jesszhan@quicinc.com, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, Marijn Suijten <marijn.suijten@somainline.org>,
 Sean Paul <sean@poorly.run>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, 7 Jul 2023 at 23:49, Ryan McCann <quic_rmccann@quicinc.com> wrote:
>
> My apologies for the private email, I hit reply instead of reply all by
> accident.

No problem, it happens sometimes.

>
> On 7/6/2023 5:24 PM, Dmitry Baryshkov wrote:
> > On 06/07/2023 23:48, Ryan McCann wrote:
> >> Currently, the device core dump mechanism does not dump registers of
> >> sub-blocks within the DSPP, SSPP, DSC, and PINGPONG blocks. Edit
> >> dpu_kms_mdp_snapshot function to account for sub-blocks.
> >>
> >> Signed-off-by: Ryan McCann <quic_rmccann@quicinc.com>
> >> ---
> >>   drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c | 66
> >> ++++++++++++++++++++++++++++++---
> >>   1 file changed, 60 insertions(+), 6 deletions(-)
> >>
> >> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
> >> b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
> >> index 70dbb1204e6c..afc45d597d65 100644
> >> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
> >> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
> >> @@ -903,25 +903,58 @@ static void dpu_kms_mdp_snapshot(struct
> >> msm_disp_state *disp_state, struct msm_k
> >>                           cat->ctl[i].base, cat->ctl[i].name);
> >>       /* dump DSPP sub-blocks HW regs info */
> >> -    for (i = 0; i < cat->dspp_count; i++)
> >> +    for (i = 0; i < cat->dspp_count; i++) {
> >>           msm_disp_snapshot_add_block(disp_state, cat->dspp[i].len,
> >> dpu_kms->mmio +
> >>                           cat->dspp[i].base, cat->dspp[i].name);
> >> +        if (cat->dspp[i].sblk && cat->dspp[i].sblk->pcc.len > 0)
> >> +            msm_disp_snapshot_add_block(disp_state,
> >> cat->dspp[i].sblk->pcc.len,
> >> +                            dpu_kms->mmio + cat->dspp[i].base +
> >> +                            cat->dspp[i].sblk->pcc.base, "%s_%s",
> >
> > This might look simpler in the following form. Could you please consider
> > it?
> >
> >
> > void *base =  dpu_kms + cat->dspp[i].base;
> >
> > msm_disp_snapshot_add_block(..., base, cat->dspp[i].name)
> >
> > if (!cat->dspp[i].sblk)
> >      continue;
> >
> > if (cat->dspp[i].sblk->pcc.len)
> >      msm_disp_snapshot_add_block(..., base +
> > cat->dspp[i].sblk->pcc.base, ...);
>
> Regarding what we discussed in the private email, is what I had for base
> in v2
>
> (https://patchwork.freedesktop.org/patch/545690/?series=120249&rev=1)
>
> essentially what you have in mind?
>
> >
> >> +                            cat->dspp[i].name,
> >> +                            cat->dspp[i].sblk->pcc.name);
> >> +    }
> >> +
> >>       /* dump INTF sub-blocks HW regs info */
> >>       for (i = 0; i < cat->intf_count; i++)
> >>           msm_disp_snapshot_add_block(disp_state, cat->intf[i].len,
> >> dpu_kms->mmio +
> >>                           cat->intf[i].base, cat->intf[i].name);
> >>       /* dump PP sub-blocks HW regs info */
> >> -    for (i = 0; i < cat->pingpong_count; i++)
> >> +    for (i = 0; i < cat->pingpong_count; i++) {
> >>           msm_disp_snapshot_add_block(disp_state,
> >> cat->pingpong[i].len, dpu_kms->mmio +
> >>                           cat->pingpong[i].base, cat->pingpong[i].name);
> >> +        /* TE2 block has length of 0, so will not print it */
> >> +
> >> +        if (cat->pingpong[i].sblk &&
> >> cat->pingpong[i].sblk->dither.len > 0)
> >> +            msm_disp_snapshot_add_block(disp_state,
> >> cat->pingpong[i].sblk->dither.len,
> >> +                            dpu_kms->mmio + cat->pingpong[i].base +
> >> +                            cat->pingpong[i].sblk->dither.base, "%s_%s",
> >> +                            cat->pingpong[i].name,
> >> +                            cat->pingpong[i].sblk->dither.name);
> >> +    }
> >> +
> >>       /* dump SSPP sub-blocks HW regs info */
> >> -    for (i = 0; i < cat->sspp_count; i++)
> >> +    for (i = 0; i < cat->sspp_count; i++) {
> >>           msm_disp_snapshot_add_block(disp_state, cat->sspp[i].len,
> >> dpu_kms->mmio +
> >>                           cat->sspp[i].base, cat->sspp[i].name);
> >> +        if (cat->sspp[i].sblk && cat->sspp[i].sblk->scaler_blk.len > 0)
> >> +            msm_disp_snapshot_add_block(disp_state,
> >> cat->sspp[i].sblk->scaler_blk.len,
> >> +                            dpu_kms->mmio + cat->sspp[i].base +
> >> +                            cat->sspp[i].sblk->scaler_blk.base, "%s_%s",
> >> +                            cat->sspp[i].name,
> >> +                            cat->sspp[i].sblk->scaler_blk.name);
> >> +
> >> +        if (cat->sspp[i].sblk && cat->sspp[i].sblk->csc_blk.len > 0)
> >> +            msm_disp_snapshot_add_block(disp_state,
> >> cat->sspp[i].sblk->csc_blk.len,
> >> +                            dpu_kms->mmio + cat->sspp[i].base +
> >> +                            cat->sspp[i].sblk->csc_blk.base, "%s_%s",
> >> +                            cat->sspp[i].name,
> >> +                            cat->sspp[i].sblk->csc_blk.name);
> >> +    }
> >> +
> >>       /* dump LM sub-blocks HW regs info */
> >>       for (i = 0; i < cat->mixer_count; i++)
> >>           msm_disp_snapshot_add_block(disp_state, cat->mixer[i].len,
> >> dpu_kms->mmio +
> >> @@ -943,9 +976,30 @@ static void dpu_kms_mdp_snapshot(struct
> >> msm_disp_state *disp_state, struct msm_k
> >>       }
> >>       /* dump DSC sub-blocks HW regs info */
> >> -    for (i = 0; i < cat->dsc_count; i++)
> >> -        msm_disp_snapshot_add_block(disp_state, cat->dsc[i].len,
> >> dpu_kms->mmio +
> >> -                        cat->dsc[i].base, cat->dsc[i].name);
> >> +    for (i = 0; i < cat->dsc_count; i++) {
> >> +        if (cat->dsc[i].features & BIT(DPU_DSC_HW_REV_1_2)) {
> >> +            struct dpu_dsc_blk enc = cat->dsc[i].sblk->enc;
> >> +            struct dpu_dsc_blk ctl = cat->dsc[i].sblk->ctl;
> >> +
> >> +            /* For now, pass in a length of 0 because the DSC_BLK
> >> register space
> >> +             * overlaps with the sblks' register space.
> >> +             *
> >> +             * TODO: Pass in a length of 0 to DSC_BLK_1_2 in the HW
> >> catalog where
> >> +             * applicable.
> >
> > Please assume that https://patchwork.freedesktop.org/series/119776/ and
> > rebase your code on top of it.
>
> Roger.
>
> >
> >> +             */
> >> +            msm_disp_snapshot_add_block(disp_state, 0, dpu_kms->mmio +
> >> +                            cat->dsc[i].base, cat->dsc[i].name);
> >> +            msm_disp_snapshot_add_block(disp_state, enc.len,
> >> dpu_kms->mmio +
> >> +                            cat->dsc[i].base + enc.base, "%s_%s",
> >> +                            cat->dsc[i].name, enc.name);
> >> +            msm_disp_snapshot_add_block(disp_state, ctl.len,
> >> dpu_kms->mmio +
> >> +                            cat->dsc[i].base + ctl.base, "%s_%s",
> >> +                            cat->dsc[i].name, ctl.name);
> >> +        } else {
> >> +            msm_disp_snapshot_add_block(disp_state, cat->dsc[i].len,
> >> dpu_kms->mmio +
> >> +                            cat->dsc[i].base, cat->dsc[i].name);
> >> +        }
> >> +    }
> >>       pm_runtime_put_sync(&dpu_kms->pdev->dev);
> >>   }
> >>
> >



-- 
With best wishes
Dmitry
