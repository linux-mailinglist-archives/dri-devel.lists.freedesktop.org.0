Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C6FC45F4BFB
	for <lists+dri-devel@lfdr.de>; Wed,  5 Oct 2022 00:35:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 825EE10E101;
	Tue,  4 Oct 2022 22:35:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay06.th.seeweb.it (relay06.th.seeweb.it [5.144.164.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DDE8910E0A8
 for <dri-devel@lists.freedesktop.org>; Tue,  4 Oct 2022 22:35:08 +0000 (UTC)
Received: from SoMainline.org (94-209-172-39.cable.dynamic.v4.ziggo.nl
 [94.209.172.39])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest
 SHA256) (No client certificate requested)
 by m-r2.th.seeweb.it (Postfix) with ESMTPSA id 0D8DE3F3BC;
 Wed,  5 Oct 2022 00:35:06 +0200 (CEST)
Date: Wed, 5 Oct 2022 00:35:04 +0200
From: Marijn Suijten <marijn.suijten@somainline.org>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Subject: Re: [PATCH 3/5] drm/msm/dsi: Account for DSC's bits_per_pixel having
 4 fractional bits
Message-ID: <20221004223504.vlfmxerdv47tlkdu@SoMainline.org>
Mail-Followup-To: Marijn Suijten <marijn.suijten@somainline.org>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 phone-devel@vger.kernel.org, Rob Clark <robdclark@gmail.com>,
 Vinod Koul <vkoul@kernel.org>,
 ~postmarketos/upstreaming@lists.sr.ht,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@somainline.org>,
 Konrad Dybcio <konrad.dybcio@somainline.org>,
 Martin Botka <martin.botka@somainline.org>,
 Jami Kettunen <jami.kettunen@somainline.org>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Sean Paul <sean@poorly.run>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Javier Martinez Canillas <javierm@redhat.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 Douglas Anderson <dianders@chromium.org>,
 Vladimir Lypak <vladimir.lypak@gmail.com>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
 Marek Vasut <marex@denx.de>
References: <20221001190807.358691-1-marijn.suijten@somainline.org>
 <20221001190807.358691-4-marijn.suijten@somainline.org>
 <CAA8EJppYJ-PYCsaKn=sGDpnJJdW2QBx=MOqUr6qzY0bAZtpGxA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAA8EJppYJ-PYCsaKn=sGDpnJJdW2QBx=MOqUr6qzY0bAZtpGxA@mail.gmail.com>
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
 Konrad Dybcio <konrad.dybcio@somainline.org>, dri-devel@lists.freedesktop.org,
 Javier Martinez Canillas <javierm@redhat.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@somainline.org>,
 phone-devel@vger.kernel.org, Marek Vasut <marex@denx.de>,
 linux-arm-msm@vger.kernel.org, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Martin Botka <martin.botka@somainline.org>,
 ~postmarketos/upstreaming@lists.sr.ht, Sean Paul <sean@poorly.run>,
 Jami Kettunen <jami.kettunen@somainline.org>,
 Vladimir Lypak <vladimir.lypak@gmail.com>,
 Douglas Anderson <dianders@chromium.org>, linux-kernel@vger.kernel.org,
 Vinod Koul <vkoul@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Alex Deucher <alexander.deucher@amd.com>, freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 2022-10-04 17:45:50, Dmitry Baryshkov wrote:
> On Sat, 1 Oct 2022 at 22:08, Marijn Suijten
> <marijn.suijten@somainline.org> wrote:
> [..]
> > -       bytes_in_slice = DIV_ROUND_UP(dsc->slice_width * dsc->bits_per_pixel, 8);
> > +       bytes_in_slice = DIV_ROUND_UP(dsc->slice_width * bpp, 8);
> 
> 
> bytes_in_slice = DIV_ROUND_UP(dsc->slice_width * dsc->bits_per_pixel, 8 * 16); ?

Not necessarily a fan of this, it "hides" the fact that we are dealing
with 4 fractional bits (1/16th precision, it is correct though); but
since this is the only use of `bpp` I can change it and document this
fact wiht a comment on top (including referencing the validation pointed
out in dsi_populate_dsc_params()).

Alternatively we can inline the `>> 4` here?

> >
> >         dsc->slice_chunk_size = bytes_in_slice;
> >
> > @@ -913,6 +918,7 @@ static void dsi_timing_setup(struct msm_dsi_host *msm_host, bool is_bonded_dsi)
> >         u32 va_end = va_start + mode->vdisplay;
> >         u32 hdisplay = mode->hdisplay;
> >         u32 wc;
> > +       int ret;
> >
> >         DBG("");
> >
> > @@ -948,7 +954,9 @@ static void dsi_timing_setup(struct msm_dsi_host *msm_host, bool is_bonded_dsi)
> >                 /* we do the calculations for dsc parameters here so that
> >                  * panel can use these parameters
> >                  */
> > -               dsi_populate_dsc_params(dsc);
> > +               ret = dsi_populate_dsc_params(dsc);
> > +               if (ret)
> > +                       return;
> >
> >                 /* Divide the display by 3 but keep back/font porch and
> >                  * pulse width same
> > @@ -1229,6 +1237,10 @@ static int dsi_cmd_dma_add(struct msm_dsi_host *msm_host,
> >         if (packet.size < len)
> >                 memset(data + packet.size, 0xff, len - packet.size);
> >
> > +       if (msg->type == MIPI_DSI_PICTURE_PARAMETER_SET)
> > +               print_hex_dump(KERN_DEBUG, "ALL:", DUMP_PREFIX_NONE,
> > +                               16, 1, data, len, false);
> > +
> >         if (cfg_hnd->ops->tx_buf_put)
> >                 cfg_hnd->ops->tx_buf_put(msm_host);
> >
> > @@ -1786,6 +1798,12 @@ static int dsi_populate_dsc_params(struct drm_dsc_config *dsc)
> >         int data;
> >         int final_value, final_scale;
> >         int i;
> > +       int bpp = dsc->bits_per_pixel >> 4;
> > +
> > +       if (dsc->bits_per_pixel & 0xf) {
> > +               pr_err("DSI does not support fractional bits_per_pixel\n");
> > +               return -EINVAL;
> > +       }
> >
> >         dsc->rc_model_size = 8192;
> >         dsc->first_line_bpg_offset = 12;
> > @@ -1807,7 +1825,7 @@ static int dsi_populate_dsc_params(struct drm_dsc_config *dsc)
> >         }
> >
> >         dsc->initial_offset = 6144; /* Not bpp 12 */
> > -       if (dsc->bits_per_pixel != 8)
> > +       if (bpp != 8)
> >                 dsc->initial_offset = 2048;     /* bpp = 12 */
> >
> >         mux_words_size = 48;            /* bpc == 8/10 */
> > @@ -1830,16 +1848,16 @@ static int dsi_populate_dsc_params(struct drm_dsc_config *dsc)
> >          * params are calculated
> >          */
> >         groups_per_line = DIV_ROUND_UP(dsc->slice_width, 3);
> > -       dsc->slice_chunk_size = dsc->slice_width * dsc->bits_per_pixel / 8;
> > -       if ((dsc->slice_width * dsc->bits_per_pixel) % 8)
> > +       dsc->slice_chunk_size = dsc->slice_width * bpp / 8;
> > +       if ((dsc->slice_width * bpp) % 8)
> 
> One can use fixed point math here too:
> 
> dsc->slice_chunk_size = (dsc->slice_width * dsc->bits_per_pixel  + 8 *
> 16 - 1)/ (8 * 16);

Good catch, this is effectively a DIV_ROUND_UP() that we happened to
call bytes_in_slice above...

Shall I tackle this in the same patch, or insert another cleanup patch?

In fact dsi_populate_dsc_params() is called first (this comment),
followed by dsi_update_dsc_timing(), meaning that slice_chunk_size is
already provided and shouldn't be recomputed.

> >                 dsc->slice_chunk_size++;
> >
> >         /* rbs-min */
> >         min_rate_buffer_size =  dsc->rc_model_size - dsc->initial_offset +
> > -                               dsc->initial_xmit_delay * dsc->bits_per_pixel +
> > +                               dsc->initial_xmit_delay * bpp +
> >                                 groups_per_line * dsc->first_line_bpg_offset;
> >
> > -       hrd_delay = DIV_ROUND_UP(min_rate_buffer_size, dsc->bits_per_pixel);
> > +       hrd_delay = DIV_ROUND_UP(min_rate_buffer_size, bpp);
> >
> >         dsc->initial_dec_delay = hrd_delay - dsc->initial_xmit_delay;
> >
> > @@ -1862,7 +1880,7 @@ static int dsi_populate_dsc_params(struct drm_dsc_config *dsc)
> >         data = 2048 * (dsc->rc_model_size - dsc->initial_offset + num_extra_mux_bits);
> >         dsc->slice_bpg_offset = DIV_ROUND_UP(data, groups_total);
> >
> > -       target_bpp_x16 = dsc->bits_per_pixel * 16;
> > +       target_bpp_x16 = bpp * 16;
> >
> >         data = (dsc->initial_xmit_delay * target_bpp_x16) / 16;
> 
> It looks like this can be replaced with the direct multiplication
> instead, maybe with support for overflow/rounding.

Thanks, Abhinav pointed out the same in patch 1/5 which originally
cleaned up most - but apparently not all! - of the math here.  I don't
think this value should ever overlow, nor does this `* 16 / 16` have any
effect on rounding (that'd be `/ 16 * 16`).

> >         final_value =  dsc->rc_model_size - data + num_extra_mux_bits;
> > --
> > 2.37.3
> >
> 
> 
> -- 
> With best wishes
> Dmitry
