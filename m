Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8CE0853331D
	for <lists+dri-devel@lfdr.de>; Tue, 24 May 2022 23:45:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 00BD610F1B8;
	Tue, 24 May 2022 21:45:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay03.th.seeweb.it (relay03.th.seeweb.it
 [IPv6:2001:4b7a:2000:18::164])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C6D7410E426;
 Tue, 24 May 2022 21:44:58 +0000 (UTC)
Received: from SoMainline.org (94-209-165-62.cable.dynamic.v4.ziggo.nl
 [94.209.165.62])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest
 SHA256) (No client certificate requested)
 by m-r1.th.seeweb.it (Postfix) with ESMTPSA id D1E221F9D9;
 Tue, 24 May 2022 23:44:54 +0200 (CEST)
Date: Tue, 24 May 2022 23:44:53 +0200
From: Marijn Suijten <marijn.suijten@somainline.org>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Subject: Re: [PATCH 5/9] drm/msm/dsi_phy_28nm_8960: Replace parent names with
 clk_hw pointers
Message-ID: <20220524214453.ciwyhu7rnsrcx3xz@SoMainline.org>
Mail-Followup-To: Marijn Suijten <marijn.suijten@somainline.org>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 phone-devel@vger.kernel.org, Stephen Boyd <sboyd@kernel.org>,
 ~postmarketos/upstreaming@lists.sr.ht,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@somainline.org>,
 Konrad Dybcio <konrad.dybcio@somainline.org>,
 Martin Botka <martin.botka@somainline.org>,
 Jami Kettunen <jami.kettunen@somainline.org>,
 Michael Turquette <mturquette@baylibre.com>,
 Rob Clark <robdclark@gmail.com>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Sean Paul <sean@poorly.run>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>,
 Rajeev Nandan <quic_rajeevny@quicinc.com>,
 Vladimir Lypak <vladimir.lypak@gmail.com>,
 Arnd Bergmann <arnd@arndb.de>, Jonathan Marek <jonathan@marek.ca>,
 linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org
References: <20220523213837.1016542-1-marijn.suijten@somainline.org>
 <20220523213837.1016542-6-marijn.suijten@somainline.org>
 <CAA8EJprN833M+KOZXOyuaL_KqzEV61P69VXw7mfWo5OiXjE2FA@mail.gmail.com>
 <CAA8EJpqB4wAZo_EVX9dgTvAyX7yqTUUPNeEUsG58nckdDKxr-A@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAA8EJpqB4wAZo_EVX9dgTvAyX7yqTUUPNeEUsG58nckdDKxr-A@mail.gmail.com>
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
 Michael Turquette <mturquette@baylibre.com>,
 Konrad Dybcio <konrad.dybcio@somainline.org>, dri-devel@lists.freedesktop.org,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@somainline.org>,
 phone-devel@vger.kernel.org, linux-clk@vger.kernel.org,
 Jonathan Marek <jonathan@marek.ca>, linux-arm-msm@vger.kernel.org,
 Arnd Bergmann <arnd@arndb.de>, Rajeev Nandan <quic_rajeevny@quicinc.com>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Martin Botka <martin.botka@somainline.org>,
 ~postmarketos/upstreaming@lists.sr.ht, Sean Paul <sean@poorly.run>,
 Stephen Boyd <sboyd@kernel.org>, Vladimir Lypak <vladimir.lypak@gmail.com>,
 linux-kernel@vger.kernel.org, Jami Kettunen <jami.kettunen@somainline.org>,
 freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 2022-05-24 01:44:49, Dmitry Baryshkov wrote:
> On Tue, 24 May 2022 at 01:44, Dmitry Baryshkov
> <dmitry.baryshkov@linaro.org> wrote:
> >
> > On Tue, 24 May 2022 at 00:38, Marijn Suijten
> > <marijn.suijten@somainline.org> wrote:
> > >
> > > parent_hw pointers are easier to manage and cheaper to use than
> > > repeatedly formatting the parent name and subsequently leaving the clk
> > > framework to perform lookups based on that name.
> >
> > Can you please add a followup patch (or a preface one) removing the
> > rest of devm_kzalloc()'ed clock names.
> 
> Argh, stupid me, you did that in the next patch. Please ignore this.

It's a fair observation, one that bothered me as well.  I've reordered
the next patch before this one for the next revision, to have clearer
separation (since this patch was currently deleting 1/3 of the
devm_kzalloc()'s).

- Marijn
