Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BBC6A5F5B74
	for <lists+dri-devel@lfdr.de>; Wed,  5 Oct 2022 23:09:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8668C10E787;
	Wed,  5 Oct 2022 21:08:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from m-r1.th.seeweb.it (m-r1.th.seeweb.it
 [IPv6:2001:4b7a:2000:18::170])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F0A3F10E783
 for <dri-devel@lists.freedesktop.org>; Wed,  5 Oct 2022 21:08:48 +0000 (UTC)
Received: from SoMainline.org (94-209-172-39.cable.dynamic.v4.ziggo.nl
 [94.209.172.39])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest
 SHA256) (No client certificate requested)
 by m-r1.th.seeweb.it (Postfix) with ESMTPSA id 7DCAB20178;
 Wed,  5 Oct 2022 23:08:46 +0200 (CEST)
Date: Wed, 5 Oct 2022 23:08:45 +0200
From: Marijn Suijten <marijn.suijten@somainline.org>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 phone-devel@vger.kernel.org, Rob Clark <robdclark@gmail.com>,
 Vinod Koul <vkoul@kernel.org>, ~postmarketos/upstreaming@lists.sr.ht,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@somainline.org>,
 Konrad Dybcio <konrad.dybcio@somainline.org>,
 Martin Botka <martin.botka@somainline.org>,
 Jami Kettunen <jami.kettunen@somainline.org>,
 Daniel Vetter <daniel@ffwll.ch>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Sean Paul <sean@poorly.run>, Thomas Zimmermann <tzimmermann@suse.de>,
 Javier Martinez Canillas <javierm@redhat.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 Douglas Anderson <dianders@chromium.org>,
 Vladimir Lypak <vladimir.lypak@gmail.com>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
 David Airlie <airlied@linux.ie>
Subject: Re: [PATCH v2 5/7] drm/msm/dsi: Account for DSC's bits_per_pixel
 having 4 fractional bits
Message-ID: <20221005210845.yednmbqec4bzukxm@SoMainline.org>
Mail-Followup-To: Marijn Suijten <marijn.suijten@somainline.org>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 phone-devel@vger.kernel.org, Rob Clark <robdclark@gmail.com>,
 Vinod Koul <vkoul@kernel.org>,
 ~postmarketos/upstreaming@lists.sr.ht,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@somainline.org>,
 Konrad Dybcio <konrad.dybcio@somainline.org>,
 Martin Botka <martin.botka@somainline.org>,
 Jami Kettunen <jami.kettunen@somainline.org>,
 Daniel Vetter <daniel@ffwll.ch>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Sean Paul <sean@poorly.run>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Javier Martinez Canillas <javierm@redhat.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 Douglas Anderson <dianders@chromium.org>,
 Vladimir Lypak <vladimir.lypak@gmail.com>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
 David Airlie <airlied@linux.ie>
References: <20221005181657.784375-1-marijn.suijten@somainline.org>
 <20221005181657.784375-6-marijn.suijten@somainline.org>
 <CAA8EJpr=0w0KReqNW2jP8DzvXLgo_o6bKmwMOed2sXb6d8HKhg@mail.gmail.com>
 <20221005205845.rwkzyit4daizi3z4@SoMainline.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221005205845.rwkzyit4daizi3z4@SoMainline.org>
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

On 2022-10-05 22:58:48, Marijn Suijten wrote:
> On 2022-10-05 22:31:43, Dmitry Baryshkov wrote:
> > [..]
> > In fact, could you please take a look if we can switch to using this
> > function and drop our code?
>
> [..]
>
> Do you want me to do this in a v3, before applying this fractional-bits
> fix?  [..]

One thing to note:

	/* bpc 8 */
	dsc->flatness_min_qp = 3;
	dsc->flatness_max_qp = 12;
	dsc->rc_quant_incr_limit0 = 11;
	dsc->rc_quant_incr_limit1 = 11;
	dsc->mux_word_size = DSC_MUX_WORD_SIZE_8_10_BPC;

Here a bunch of properties are hardcoded, seemingly for bpc = 8.
mux_word_size is only ever read in drm_dsc_compute_rc_parameters() so
only becomes relevant _after_ the migration, and is currently dealt with
correctly by:

	mux_words_size = 48;		/* bpc == 8/10 */
	if (dsc->bits_per_component == 12)
		mux_words_size = 64;

Aside fixing that to assign these values (through the proper constants)
to dsc->mux_word_size, is it worth looking for the right parameters for
other bpc or return -EINVAL if bpc isn't 8, to uphold this comment until
support for other bpc is validated?

- Marijn
