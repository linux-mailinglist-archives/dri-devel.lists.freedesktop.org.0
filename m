Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BD0D66EFBBD
	for <lists+dri-devel@lfdr.de>; Wed, 26 Apr 2023 22:35:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B2B4110E06D;
	Wed, 26 Apr 2023 20:35:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay06.th.seeweb.it (relay06.th.seeweb.it
 [IPv6:2001:4b7a:2000:18::167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2973B10E06D;
 Wed, 26 Apr 2023 20:35:27 +0000 (UTC)
Received: from SoMainline.org (94-211-6-86.cable.dynamic.v4.ziggo.nl
 [94.211.6.86])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest
 SHA256) (No client certificate requested)
 by m-r2.th.seeweb.it (Postfix) with ESMTPSA id 2FC763F7AD;
 Wed, 26 Apr 2023 22:35:21 +0200 (CEST)
Date: Wed, 26 Apr 2023 22:35:19 +0200
From: Marijn Suijten <marijn.suijten@somainline.org>
To: Abhinav Kumar <quic_abhinavk@quicinc.com>
Subject: Re: [PATCH v3 06/21] drm/msm/dpu: Use V2 DITHER PINGPONG sub-block
 in SM8[34]50/SC8280XP
Message-ID: <5i3lldg2ayomfs2yo3bs2bfbuhwocujedegcz57ptowlg24ckk@euxp6sz3lvqh>
References: <20230411-dpu-intf-te-v3-0-693b17fe6500@somainline.org>
 <20230411-dpu-intf-te-v3-6-693b17fe6500@somainline.org>
 <d44022e0-bc09-122e-5a48-1994cb025ba8@quicinc.com>
 <vwejuayy7ulq3frpqpqetkyhyefgrmgo6222how4hp4bissepx@uauvwlhsekgn>
 <e0a64c2b-6178-6513-d7ba-d6a79831f21d@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <e0a64c2b-6178-6513-d7ba-d6a79831f21d@quicinc.com>
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
Cc: dri-devel@lists.freedesktop.org, Jordan Crouse <jordan@cosmicpenguin.net>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@somainline.org>,
 Robert Foss <rfoss@kernel.org>, Kuogee Hsieh <quic_khsieh@quicinc.com>,
 Jessica Zhang <quic_jesszhan@quicinc.com>, linux-arm-msm@vger.kernel.org,
 Adam Skladowski <a39.skl@gmail.com>,
 Martin Botka <martin.botka@somainline.org>,
 ~postmarketos/upstreaming@lists.sr.ht, Sean Paul <sean@poorly.run>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Loic Poulain <loic.poulain@linaro.org>,
 Jami Kettunen <jami.kettunen@somainline.org>,
 Bjorn Andersson <andersson@kernel.org>, linux-kernel@vger.kernel.org,
 Konrad Dybcio <konrad.dybcio@linaro.org>, Vinod Koul <vkoul@kernel.org>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 2023-04-26 12:11:39, Abhinav Kumar wrote:
> 
> 
> On 4/26/2023 12:08 PM, Marijn Suijten wrote:
> > On 2023-04-26 09:24:19, Abhinav Kumar wrote:
> >>
> >>
> >> On 4/25/2023 4:05 PM, Marijn Suijten wrote:
> >>> According to downstream sources this DITHER sub-block sits at an offset
> >>> of 0xe0 with version 0x20000.  The PP_BLK_DITHER macro is _not_ used as
> >>> downstream still says the size of the PINGPONG block is 0xd4 and not 0.
> >>>
> >>
> >> the PINGPONG block size is 0x0 on sm8350, sm8450 and sc8280xp.
> >>
> >> and length of dither is 0x20 and they all start at 0xe0.
> >>
> >> So now does anything prevent us from using PP_BLK_DITHER macro for these?
> > 
> > Nothing prevents it from being used (if you are referring to our
> > previous conversations) besides this information not being available in
> > public DTS (I simply did not know) and the fact that all these many
> > fixes - however necessary they are - distract from the main topic of
> > this series: bringing INTF TE support to DPU1.
> > 
> 
> Yeah, you could have sent these as a separate series if you wanted to 
> stick to this one being only intf te.

As already explained in IRC, and repeating here for posterity:

Maintaining two heavily-dependent series that constantly touch the exact
same lines in the catalog for many SoCs at once is pretty much
impossible.  Doing it that way relies on one of the two series to be
easily pick-able so that the other can proceed through a few review
rounds and revisions without constantly conflicting or having to be
rebased on the other.  And that doesn't apply here: both INTF TE and the
fixes have required extra revisions.  And then, some of the fixes are
even preliminary to INTF TE support.

- Marijn
