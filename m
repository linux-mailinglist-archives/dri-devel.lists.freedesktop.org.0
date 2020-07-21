Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0478C2280A2
	for <lists+dri-devel@lfdr.de>; Tue, 21 Jul 2020 15:11:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A6CA76E261;
	Tue, 21 Jul 2020 13:11:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from m43-7.mailgun.net (m43-7.mailgun.net [69.72.43.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BB6E26E1BC
 for <dri-devel@lists.freedesktop.org>; Tue, 21 Jul 2020 12:57:52 +0000 (UTC)
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1595336272; h=Message-ID: References: In-Reply-To: Subject:
 Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=zL4Vmv3VgfCA8IfWdHITcCzdfO+3oA2nyWU0ZMt5Q0A=;
 b=tZdoAwUNk5wBAsL5vzk2vujCY5tznoLVTibFmUe4YTBC38EhPqeVzawMR2pyUPOSOQOgZevO
 3hyyIeFc+gpkje/gkQ9fZB4cQlWWDfINcSknVpdCuUI+9cCmxuiehQH8L9Q1IUj/GniKL+GD
 V4D3ShJuOJj799n2Ug3hsZE8ojk=
X-Mailgun-Sending-Ip: 69.72.43.7
X-Mailgun-Sid: WyJkOTU5ZSIsICJkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnIiwgImJlOWU0YSJd
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n18.prod.us-west-2.postgun.com with SMTP id
 5f16e64f3dbcb593a9b88c1b (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Tue, 21 Jul 2020 12:57:51
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id 92AA6C433CA; Tue, 21 Jul 2020 12:57:51 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
 aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,URIBL_BLOCKED
 autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
 (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested) (Authenticated sender: kalyan_t)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id DF31AC433C9;
 Tue, 21 Jul 2020 12:57:49 +0000 (UTC)
MIME-Version: 1.0
Date: Tue, 21 Jul 2020 18:27:49 +0530
From: kalyan_t@codeaurora.org
To: Rob Clark <robdclark@gmail.com>
Subject: Re: [Freedreno] [PATCH] drm/msm/dpu: fix/enable 6bpc dither with
 split-lm
In-Reply-To: <CAF6AEGuV7vTseh5KmCremhhfR1E4sAY1oPAwtCOCtYb1vx=A0g@mail.gmail.com>
References: <20200715221955.3209856-1-robdclark@gmail.com>
 <92c9e9d08dfa014f1589186a68902de7@codeaurora.org>
 <CAF6AEGuV7vTseh5KmCremhhfR1E4sAY1oPAwtCOCtYb1vx=A0g@mail.gmail.com>
Message-ID: <dbd08d83075ce6356a233f66b3001cc7@codeaurora.org>
X-Sender: kalyan_t@codeaurora.org
User-Agent: Roundcube Webmail/1.3.9
X-Mailman-Approved-At: Tue, 21 Jul 2020 13:11:23 +0000
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
Cc: Rob Clark <robdclark@chromium.org>, Sam Ravnborg <sam@ravnborg.org>,
 David Airlie <airlied@linux.ie>,
 "open list:DRM DRIVER FOR MSM ADRENO GPU" <linux-arm-msm@vger.kernel.org>,
 Doug Anderson <dianders@chromium.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Stephen Boyd <swboyd@chromium.org>, Zheng Bin <zhengbin13@huawei.com>,
 Sean Paul <sean@poorly.run>, Steev Klimaszewski <steev@gentoo.org>,
 Drew Davenport <ddavenport@chromium.org>,
 "open list:DRM DRIVER FOR MSM ADRENO GPU" <freedreno@lists.freedesktop.org>,
 open list <linux-kernel@vger.kernel.org>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 2020-07-20 20:53, Rob Clark wrote:
> On Mon, Jul 20, 2020 at 5:53 AM <kalyan_t@codeaurora.org> wrote:
>> 
>> On 2020-07-16 03:49, Rob Clark wrote:
>> > From: Rob Clark <robdclark@chromium.org>
>> >
>> > If split-lm is used (for ex, on sdm845), we can have multiple ping-
>> > pongs, but only a single phys encoder.  We need to configure dithering
>> > on each of them.
>> >
>> > Signed-off-by: Rob Clark <robdclark@chromium.org>
      Reviewed-by: Kalyan Thota <kalyan_t@codeaurora.org>
>> > ---
>> >  drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c   | 22 ++++++++++---------
>> >  .../gpu/drm/msm/disp/dpu1/dpu_hw_pingpong.c   |  3 +--
>> >  2 files changed, 13 insertions(+), 12 deletions(-)
>> >
>> > diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
>> > b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
>> > index 46df0ff75b85..9b98b63c77fb 100644
>> > --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
>> > +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
>> > @@ -212,14 +212,14 @@ static u32 dither_matrix[DITHER_MATRIX_SZ] = {
>> >       15, 7, 13, 5, 3, 11, 1, 9, 12, 4, 14, 6, 0, 8, 2, 10
>> >  };
>> >
>> > -static void _dpu_encoder_setup_dither(struct dpu_encoder_phys *phys)
>> > +static void _dpu_encoder_setup_dither(struct dpu_hw_pingpong *hw_pp,
>> > unsigned bpc)
>> >  {
>> >       struct dpu_hw_dither_cfg dither_cfg = { 0 };
>> >
>> > -     if (!phys->hw_pp || !phys->hw_pp->ops.setup_dither)
>> > +     if (!hw_pp->ops.setup_dither)
>> >               return;
>> >
>> > -     switch (phys->connector->display_info.bpc) {
>> > +     switch (bpc) {
>> >       case 6:
>> >               dither_cfg.c0_bitdepth = 6;
>> >               dither_cfg.c1_bitdepth = 6;
>> > @@ -228,14 +228,14 @@ static void _dpu_encoder_setup_dither(struct
>> > dpu_encoder_phys *phys)
>> >               dither_cfg.temporal_en = 0;
>> >               break;
>> >       default:
>> > -             phys->hw_pp->ops.setup_dither(phys->hw_pp, NULL);
>> > +             hw_pp->ops.setup_dither(hw_pp, NULL);
>> >               return;
>> >       }
>> >
>> >       memcpy(&dither_cfg.matrix, dither_matrix,
>> >                       sizeof(u32) * DITHER_MATRIX_SZ);
>> >
>> > -     phys->hw_pp->ops.setup_dither(phys->hw_pp, &dither_cfg);
>> > +     hw_pp->ops.setup_dither(hw_pp, &dither_cfg);
>> >  }
>> >
>> >  void dpu_encoder_helper_report_irq_timeout(struct dpu_encoder_phys
>> > *phys_enc,
>> > @@ -1132,11 +1132,13 @@ static void
>> > _dpu_encoder_virt_enable_helper(struct drm_encoder *drm_enc)
>> >
>> >       _dpu_encoder_update_vsync_source(dpu_enc, &dpu_enc->disp_info);
>> >
>> > -     if (dpu_enc->disp_info.intf_type == DRM_MODE_ENCODER_DSI) {
>> > -             for (i = 0; i < dpu_enc->num_phys_encs; i++) {
>> > -                     struct dpu_encoder_phys *phys = dpu_enc->phys_encs[i];
>> > -
>> > -                     _dpu_encoder_setup_dither(phys);
>> > +     if (dpu_enc->disp_info.intf_type == DRM_MODE_ENCODER_DSI &&
>> > +                     !WARN_ON(dpu_enc->num_phys_encs == 0)) {
>> > +             unsigned bpc = dpu_enc->phys_encs[0]->connector->display_info.bpc;
>> > +             for (i = 0; i < MAX_CHANNELS_PER_ENC; i++) {
>> > +                     if (!dpu_enc->hw_pp[i])
>> > +                             continue;
>> > +                     _dpu_encoder_setup_dither(dpu_enc->hw_pp[i], bpc);
>> >               }
>> >       }
>> >  }
>> > diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_pingpong.c
>> > b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_pingpong.c
>> > index 7411ab6bf6af..bea4ab5c58c5 100644
>> > --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_pingpong.c
>> > +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_pingpong.c
>> > @@ -231,8 +231,7 @@ static void _setup_pingpong_ops(struct
>> > dpu_hw_pingpong *c,
>> >       c->ops.poll_timeout_wr_ptr = dpu_hw_pp_poll_timeout_wr_ptr;
>> >       c->ops.get_line_count = dpu_hw_pp_get_line_count;
>> >
>> > -     if (test_bit(DPU_PINGPONG_DITHER, &features) &&
>> > -             IS_SC7180_TARGET(c->hw.hwversion))
>> > +     if (test_bit(DPU_PINGPONG_DITHER, &features))
>> >               c->ops.setup_dither = dpu_hw_pp_setup_dither;
>> >  };
>> 
>> Change looks good to me
> 
> Does that count as a Reviewed-by?
> 
Sure i have added the tag.

> BR,
> -R
> 
>> 
>> - Kalyan
> _______________________________________________
> Freedreno mailing list
> Freedreno@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/freedreno
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
