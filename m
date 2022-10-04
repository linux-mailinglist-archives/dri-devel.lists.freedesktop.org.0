Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A00465F4C44
	for <lists+dri-devel@lfdr.de>; Wed,  5 Oct 2022 00:56:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 851B110E2BC;
	Tue,  4 Oct 2022 22:56:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay02.th.seeweb.it (relay02.th.seeweb.it [5.144.164.163])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3EC5D10E146
 for <dri-devel@lists.freedesktop.org>; Tue,  4 Oct 2022 22:56:08 +0000 (UTC)
Received: from SoMainline.org (94-209-172-39.cable.dynamic.v4.ziggo.nl
 [94.209.172.39])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest
 SHA256) (No client certificate requested)
 by m-r1.th.seeweb.it (Postfix) with ESMTPSA id 132B4200D2;
 Wed,  5 Oct 2022 00:56:06 +0200 (CEST)
Date: Wed, 5 Oct 2022 00:56:04 +0200
From: Marijn Suijten <marijn.suijten@somainline.org>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Subject: Re: [PATCH 3/5] drm/msm/dsi: Account for DSC's bits_per_pixel having
 4 fractional bits
Message-ID: <20221004225604.4ysjrc2zmnbqordk@SoMainline.org>
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
 <20221004223504.vlfmxerdv47tlkdu@SoMainline.org>
 <b47e3be7-7de1-0f0c-8aa6-054e99dcaab3@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <b47e3be7-7de1-0f0c-8aa6-054e99dcaab3@linaro.org>
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

On 2022-10-05 01:40:12, Dmitry Baryshkov wrote:
> On 05/10/2022 01:35, Marijn Suijten wrote:
> > On 2022-10-04 17:45:50, Dmitry Baryshkov wrote:
> >> On Sat, 1 Oct 2022 at 22:08, Marijn Suijten
> >> <marijn.suijten@somainline.org> wrote:
> >> [..]
> >>> -       bytes_in_slice = DIV_ROUND_UP(dsc->slice_width * dsc->bits_per_pixel, 8);
> >>> +       bytes_in_slice = DIV_ROUND_UP(dsc->slice_width * bpp, 8);
> >>
> >>
> >> bytes_in_slice = DIV_ROUND_UP(dsc->slice_width * dsc->bits_per_pixel, 8 * 16); ?
> > 
> > Not necessarily a fan of this, it "hides" the fact that we are dealing
> > with 4 fractional bits (1/16th precision, it is correct though); but
> > since this is the only use of `bpp` I can change it and document this
> > fact wiht a comment on top (including referencing the validation pointed
> > out in dsi_populate_dsc_params()).
> > 
> > Alternatively we can inline the `>> 4` here?
> 
> No, I don't think so. If we shift by 4 bits, we'd loose the fractional 
> part. DIV_ROUND_UP( .... , 8 * 16) ensures that we round it up rather 
> than just dropping it.

I'd still keep the `-EINVAL` on `if (dsc->bits_per_pixel & 0xf)` to
guarantee that there is no fractional part.
After all, as explained in the patch description, none of this code /
the DSI driver in general seems to be able to handle fractional bits per
pixel.

> >>> [..]
> >>> -       dsc->slice_chunk_size = dsc->slice_width * dsc->bits_per_pixel / 8;
> >>> -       if ((dsc->slice_width * dsc->bits_per_pixel) % 8)
> >>> +       dsc->slice_chunk_size = dsc->slice_width * bpp / 8;
> >>> +       if ((dsc->slice_width * bpp) % 8)
> >>
> >> One can use fixed point math here too:
> >>
> >> dsc->slice_chunk_size = (dsc->slice_width * dsc->bits_per_pixel  + 8 *
> >> 16 - 1)/ (8 * 16);
> > 
> > Good catch, this is effectively a DIV_ROUND_UP() that we happened to
> > call bytes_in_slice above...
> > 
> > Shall I tackle this in the same patch, or insert another cleanup patch?
> 
> It's up to you. I usually prefer separate patches, even if just to ease 
> bisecting between unrelated changes.

Same feeling here, and have already set it up that way; added two extra
patches to 1. replace this with DIV_ROUND_UP() and 2. remove the
recalculation of slice_chunk_size (disguised as bytes_in_slice) above.

- Marijn
