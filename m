Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D8FDE5F4C03
	for <lists+dri-devel@lfdr.de>; Wed,  5 Oct 2022 00:39:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1DE7F10E1E6;
	Tue,  4 Oct 2022 22:39:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay08.th.seeweb.it (relay08.th.seeweb.it [5.144.164.169])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EA8E710E1E6
 for <dri-devel@lists.freedesktop.org>; Tue,  4 Oct 2022 22:39:43 +0000 (UTC)
Received: from SoMainline.org (94-209-172-39.cable.dynamic.v4.ziggo.nl
 [94.209.172.39])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest
 SHA256) (No client certificate requested)
 by m-r2.th.seeweb.it (Postfix) with ESMTPSA id 7735D3F3BC;
 Wed,  5 Oct 2022 00:39:41 +0200 (CEST)
Date: Wed, 5 Oct 2022 00:39:40 +0200
From: Marijn Suijten <marijn.suijten@somainline.org>
To: Abhinav Kumar <quic_abhinavk@quicinc.com>
Subject: Re: [PATCH 5/5] drm/dsc: Prevent negative BPG offsets from shadowing
 adjacent bitfields
Message-ID: <20221004223940.stfsyvubx7ecd3a3@SoMainline.org>
Mail-Followup-To: Marijn Suijten <marijn.suijten@somainline.org>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 phone-devel@vger.kernel.org, Rob Clark <robdclark@gmail.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Vinod Koul <vkoul@kernel.org>,
 ~postmarketos/upstreaming@lists.sr.ht,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@somainline.org>,
 Konrad Dybcio <konrad.dybcio@somainline.org>,
 Martin Botka <martin.botka@somainline.org>,
 Jami Kettunen <jami.kettunen@somainline.org>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
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
 <55d7e20b-79cd-ece6-b643-8b542beb7474@quicinc.com>
 <20221004215745.zdfvulqx4exlujgk@SoMainline.org>
 <1a5ed43e-914e-079d-96bf-c9e3912a9473@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1a5ed43e-914e-079d-96bf-c9e3912a9473@quicinc.com>
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
 linux-kernel@vger.kernel.org,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@somainline.org>,
 phone-devel@vger.kernel.org, Javier Martinez Canillas <javierm@redhat.com>,
 linux-arm-msm@vger.kernel.org, Alex Deucher <alexander.deucher@amd.com>,
 Martin Botka <martin.botka@somainline.org>,
 ~postmarketos/upstreaming@lists.sr.ht, Sean Paul <sean@poorly.run>,
 Jami Kettunen <jami.kettunen@somainline.org>,
 Vladimir Lypak <vladimir.lypak@gmail.com>,
 Douglas Anderson <dianders@chromium.org>, Vinod Koul <vkoul@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 2022-10-04 15:31:10, Abhinav Kumar wrote:
> 
> 
> On 10/4/2022 2:57 PM, Marijn Suijten wrote:
> > [..]
> > Alas, as explained in the cover letter I opted to perform the masking in
> > the PPS packing code as the DSC block code also reads these values, and
> > would suddenly write 6-bit intead of 8-bit values to the
> > DSC_RANGE_BPG_OFFSET registers.  Quick testing on the mentioned sdm845
> > platform shows no regressions, but I'm not sure if that's safe to rely
> > on?
> 
> I looked up the MDP_DSC_0_RANGE_BPG_OFFSET_* registers.
> They take only a 6-bit value according to the SW documentation ( bits 5:0 )
> 
> It was always expecting only a 6-bit value and not 8.
> 
> So this change is safe.

Ack, I think that implies I should make this change and move the masks
to the DSI driver?

> >> If you want to move to helper, other drivers need to be changed too to
> >> remove duplicate & 0x3f.
> > 
> > Sure, we only have to confirm whether those drivers also read back the
> > value(s) in rc_range_params, and expect / allow this to be 8 instead of
> > 6 bits.
> > 
> >> FWIW, this too has already been fixed in the latest downstream driver too.
> > 
> > What is this supposed to mean?  Is there a downstream DPU project that
> > has pending patches needing to be upstreamed?  Or is the downstream SDE,
> > techpack/display, or whatever it is called nowadays, slowly using more
> > DRM structs like drm_dsc_config and this drm_dsc_pps_payload_pack()
> > helper function as pointed out in an earlier mail?
> > 
> 
> No, what I meant was, the version of downstream driver based on which 
> the upstream DSC was made seems to be an older version. Downstream 
> drivers keep getting updated and we always keep trying to align with 
> upstream structs.
> 
> This is true not just for DSC but even other blocks.
> 
> So as part of that effort, we started using struct drm_dsc_config . That 
> change was made on newer chipsets. But the downstream SW on sdm845 based 
> on which the DSC was upstreamed seems like didnt have that. Hence all 
> this redundant math happened.
> 
> So this comment was more of a explanation about why this issue happened 
> even though latest downstream didnt have this issue.

Thanks, I understood most of that but wasn't aware these exact "issues"
were also addressed downstream (by i.e. also using the upstream
structs).

> > Offtopic: are SDE and DPU growing closer together, hopefully achieving
> > feature parity allowing the SDE project to be dropped in favour of a
> > fully upstreamed DPU driver for day-one out-of-the-box mainline support
> > for new SoCs (as long as work is published and on its way upstream)?
> > 
> 
> There is still a lot of gap between SDE and DPU drivers at this point. 
> We keep trying to upstream as many features as possible to minimize the 
> gap but there is still a lot of work to do.

Glad to hear, but that sounds like a very hard to close gap unless
downstream "just works on DPU" instead of having parallel development on
two "competing" drivers for the exact same hardware.

- Marijn
