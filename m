Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (unknown [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 340905F4B23
	for <lists+dri-devel@lfdr.de>; Tue,  4 Oct 2022 23:48:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 99CB210E058;
	Tue,  4 Oct 2022 21:48:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay01.th.seeweb.it (relay01.th.seeweb.it
 [IPv6:2001:4b7a:2000:18::162])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9CD8E10E058
 for <dri-devel@lists.freedesktop.org>; Tue,  4 Oct 2022 21:48:21 +0000 (UTC)
Received: from SoMainline.org (94-209-172-39.cable.dynamic.v4.ziggo.nl
 [94.209.172.39])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest
 SHA256) (No client certificate requested)
 by m-r1.th.seeweb.it (Postfix) with ESMTPSA id 4FD4F200F6;
 Tue,  4 Oct 2022 23:48:18 +0200 (CEST)
Date: Tue, 4 Oct 2022 23:48:16 +0200
From: Marijn Suijten <marijn.suijten@somainline.org>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Subject: Re: [PATCH 5/5] drm/dsc: Prevent negative BPG offsets from shadowing
 adjacent bitfields
Message-ID: <20221004214816.3azmktopwjgpodzt@SoMainline.org>
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
 Lyude Paul <lyude@redhat.com>
References: <20221001190807.358691-1-marijn.suijten@somainline.org>
 <20221001190807.358691-6-marijn.suijten@somainline.org>
 <20221001202313.fkdsv5ul4v6akhc3@SoMainline.org>
 <CAA8EJpricAKmrtqGJx_ngqyqCWjc2rbrOcsE5QaH5qKaHP7-2g@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAA8EJpricAKmrtqGJx_ngqyqCWjc2rbrOcsE5QaH5qKaHP7-2g@mail.gmail.com>
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
 phone-devel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Martin Botka <martin.botka@somainline.org>,
 ~postmarketos/upstreaming@lists.sr.ht, Sean Paul <sean@poorly.run>,
 Jami Kettunen <jami.kettunen@somainline.org>,
 Vladimir Lypak <vladimir.lypak@gmail.com>,
 Douglas Anderson <dianders@chromium.org>, linux-kernel@vger.kernel.org,
 Vinod Koul <vkoul@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Alex Deucher <alexander.deucher@amd.com>, freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 2022-10-04 17:41:07, Dmitry Baryshkov wrote:
> On Sat, 1 Oct 2022 at 23:23, Marijn Suijten
> <marijn.suijten@somainline.org> wrote:
> [..]
> > Pre-empting the reviews: I was contemplating whether to use FIELD_PREP
> > here, given that it's not yet used anywhere else in this file.  For that
> > I'd remove the existing _SHIFT definitions and replace them with:
> >
> >         #define DSC_PPS_RC_RANGE_MINQP_MASK             GENMASK(15, 11)
> >         #define DSC_PPS_RC_RANGE_MAXQP_MASK             GENMASK(10, 6)
> >         #define DSC_PPS_RC_RANGE_BPG_OFFSET_MASK        GENMASK(5, 0)
> >
> > And turn this section of code into:
> >
> >         cpu_to_be16(FIELD_PREP(DSC_PPS_RC_RANGE_MINQP_MASK,
> >                                dsc_cfg->rc_range_params[i].range_min_qp) |
> >                     FIELD_PREP(DSC_PPS_RC_RANGE_MAXQP_MASK,
> >                                dsc_cfg->rc_range_params[i].range_max_qp) |
> >                     FIELD_PREP(DSC_PPS_RC_RANGE_BPG_OFFSET_MASK,
> >                                dsc_cfg->rc_range_params[i].range_bpg_offset));
> >
> > Is that okay/recommended?
> 
> This is definitely easier to review. However if you do not want to use
> FIELD_PREP, it would be better to split this into a series of `data |=
> something` assignments terminated with the rc_range_parameters[i]
> assignment.

Anything is fine by me, I have no strong opinion on this and rather
leave it up to the maintainers.  However, FIELD_PREP gives us concise
`#define`s through a single `GENMASK()` carrying both the shift and
mask/field-width.
At the same time these genmask definitions map more clearly to the
layout comment right above:

	/*
	 * For DSC sink programming the RC Range parameter fields
	 * are as follows: Min_qp[15:11], max_qp[10:6], offset[5:0]
	 */

If switching to `data |=` however, I've been recommended to not use
FIELD_PREP but fulyl write out `data |= (value & MASK) << SHIFT`
instead.

Perhaps a more important question is how to apply this consistently
throughout the function?

- Marijn
