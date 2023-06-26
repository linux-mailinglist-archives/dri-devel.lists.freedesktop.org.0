Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 53AA573E1E5
	for <lists+dri-devel@lfdr.de>; Mon, 26 Jun 2023 16:17:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F0B5F10E211;
	Mon, 26 Jun 2023 14:17:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay05.th.seeweb.it (relay05.th.seeweb.it
 [IPv6:2001:4b7a:2000:18::166])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9B57210E214
 for <dri-devel@lists.freedesktop.org>; Mon, 26 Jun 2023 14:17:47 +0000 (UTC)
Received: from SoMainline.org (82-72-63-87.cable.dynamic.v4.ziggo.nl
 [82.72.63.87])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest
 SHA256) (No client certificate requested)
 by m-r2.th.seeweb.it (Postfix) with ESMTPSA id A80873F7B3;
 Mon, 26 Jun 2023 16:17:44 +0200 (CEST)
Date: Mon, 26 Jun 2023 16:17:42 +0200
From: Marijn Suijten <marijn.suijten@somainline.org>
To: Konrad Dybcio <konrad.dybcio@linaro.org>
Subject: Re: [PATCH 00/15] drm/msm: Add SM6125 MDSS/DPU hardware and enable
 Sony Xperia 10 II panel
Message-ID: <jllpsyveqvxco3ihclqypwnfhac2g3gdm6ukd3x3fjsr6z54xy@2xwh5fixpprh>
References: <20230624-sm6125-dpu-v1-0-1d5a638cebf2@somainline.org>
 <035ffdd2-27e3-99bc-f8a4-41e66685db09@linaro.org>
 <i5xxzhfhlwzoxlnezzgg42hzwzwfcgxv5gopqhb6vd3udz252b@wpznuvoleeta>
 <701916b3-388e-8216-f7ae-1837d5895d87@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <701916b3-388e-8216-f7ae-1837d5895d87@linaro.org>
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
Cc: Michael Turquette <mturquette@baylibre.com>,
 dri-devel@lists.freedesktop.org, Krishna Manikandan <quic_mkrishn@quicinc.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 linux-clk@vger.kernel.org, Krzysztof Kozlowski <krzk@kernel.org>,
 Andy Gross <agross@kernel.org>, Lux Aliaga <they@mint.lgbt>,
 devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>,
 linux-arm-msm@vger.kernel.org, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Rob Herring <robh+dt@kernel.org>, Martin Botka <martin.botka@somainline.org>,
 ~postmarketos/upstreaming@lists.sr.ht, Sean Paul <sean@poorly.run>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Stephen Boyd <sboyd@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 linux-kernel@vger.kernel.org, Jami Kettunen <jami.kettunen@somainline.org>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 2023-06-26 11:41:39, Konrad Dybcio wrote:
> On 25.06.2023 21:18, Marijn Suijten wrote:
> > On 2023-06-24 03:42:46, Konrad Dybcio wrote:
> >> On 24.06.2023 02:40, Marijn Suijten wrote:
> >>> Bring up the SM6125 DPU now that all preliminary series (such as INTF
> >>> TE) have been merged (for me to test the hardware properly)
> >> We should not repeat the same mistake in the future.. Finding a
> >> balance between releasing early and releasing what we can declare
> >> working and tested code is hard, but we waaaaaaaay overstayed on
> >> this one..
> > 
> > I don't understand what you mean by "mistake" at all.  Yes the DPU
> > catalog portion of this series sat in my local branch for a very long
> > time.  Yes it had to be rebased on top of conflicts many many times.
> > 
> > However, that time has also been used to fix and extend DPU where
> > necessary, instead of submitting a half-broken or half-incomplete
> > catalog entry...
> > 
> > Re "we overstayed": you could have asked to clean up and send my patch,
> > so I don't take this as a mistake on my part as you are completely aware
> > of my time schedule ;)
> I didn't mean to pick on you. I just wanted to emphasize that a more
> upstream-forward approach would have saved us quite some time on the
> rebasing and cleaning-up front.

That is how it comes across ;) - our dream is all about upstream-first
but as you know this becomes a mess really quickly when things are
blocked on dependencies and you're working on 5 different features and
testing across ±8 different Sony platforms on ±14 different devices at
once... all in a limited portion of free time.

Fwiw cleaning-up would have had to happen either way, and would have
taken the same amount of time regardless of whether this series is
submitted now or two months ago.

> >> Konrad
> >> , and most
> > 
> > Also here, don't forget to re-quote my message if you break half-way in
> > the line.
> Ugh. All the time I've been doing this I thought thunderfox was smart
> enough to do it for me. Apparently not and you're the 1st one to point
> that out.

You're welcome!
(Though I thought it should be visible in Thunderburd, unless you're not
 in plaintext mode?  Does it still show the "this is quoted" line in
 front of the broken sentence?)

 - Marijn
