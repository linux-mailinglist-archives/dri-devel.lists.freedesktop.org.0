Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BEE5370CBAF
	for <lists+dri-devel@lfdr.de>; Mon, 22 May 2023 22:55:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C5E8610E38F;
	Mon, 22 May 2023 20:55:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay07.th.seeweb.it (relay07.th.seeweb.it [5.144.164.168])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C975A10E38F
 for <dri-devel@lists.freedesktop.org>; Mon, 22 May 2023 20:55:54 +0000 (UTC)
Received: from SoMainline.org (94-211-6-86.cable.dynamic.v4.ziggo.nl
 [94.211.6.86])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest
 SHA256) (No client certificate requested)
 by m-r2.th.seeweb.it (Postfix) with ESMTPSA id 0ED253EED9;
 Mon, 22 May 2023 22:55:53 +0200 (CEST)
Date: Mon, 22 May 2023 22:55:51 +0200
From: Marijn Suijten <marijn.suijten@somainline.org>
To: Konrad Dybcio <konrad.dybcio@linaro.org>
Subject: Re: [PATCH v4 1/5] msm/drm/dsi: Round up DSC hdisplay calculation
Message-ID: <gdh5p33gkoqccyrp6ljpnfmzbartpzptins7vowe5bphpcac2y@4ngkfujtp3dy>
References: <20230405-add-dsc-support-v4-0-15daf84f8dcb@quicinc.com>
 <20230405-add-dsc-support-v4-1-15daf84f8dcb@quicinc.com>
 <eo7chb7m4cowvb53hnebi3bjtotm7x5ea5iv6ulmmfkr2hdt32@2nkoa5rco3qb>
 <ecf22436-44f3-8809-1232-e9ae30f3864b@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ecf22436-44f3-8809-1232-e9ae30f3864b@linaro.org>
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
Cc: freedreno@lists.freedesktop.org, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Jessica Zhang <quic_jesszhan@quicinc.com>, Sean Paul <sean@poorly.run>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 2023-05-22 22:52:40, Konrad Dybcio wrote:
> 
> 
> On 22.05.2023 22:44, Marijn Suijten wrote:
> > On 2023-05-22 13:30:20, Jessica Zhang wrote:
> >> Currently, when compression is enabled, hdisplay is reduced via integer
> >> division. This causes issues for modes where the original hdisplay is
> >> not a multiple of 3.
> >>
> >> To fix this, use DIV_ROUND_UP to divide hdisplay.
> >>
> >> Reviewed-by: Marijn Suijten <marijn.suijten@somainline.org>
> >> Suggested-by: Marijn Suijten <marijn.suijten@somainline.org>
> > 
> > Nit: probably these should go in the opposite order.  And if they're
> > all supposed to be chronological, I think it is:
> > 
> >     Suggested-by:
> >     Fixes:
> >     Signed-off-by:
> >     Reviewed-by:
> > 
> > But unsure if that's a hard requirement, or even correct at all.
> > 
> > - Marijn
> Or you can rely on b4 to pick that up if it comes from others

The problem is that somewhat stupidly, b4 (trailers -u) puts them in the
wrong (not chronological) order, so it's pretty much useless for this.

Unless there's a required ordering specified somewhere in the docs, that
is *not* chronological, and that b4 is abiding by?  (that is my question
above)

- Marijn

> 
> Konrad
<snip>
