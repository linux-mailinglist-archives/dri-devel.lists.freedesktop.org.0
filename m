Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 10B1873D49F
	for <lists+dri-devel@lfdr.de>; Sun, 25 Jun 2023 23:33:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6840210E198;
	Sun, 25 Jun 2023 21:33:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay05.th.seeweb.it (relay05.th.seeweb.it [5.144.164.166])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 765E710E198
 for <dri-devel@lists.freedesktop.org>; Sun, 25 Jun 2023 21:33:23 +0000 (UTC)
Received: from SoMainline.org (94-211-6-86.cable.dynamic.v4.ziggo.nl
 [94.211.6.86])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest
 SHA256) (No client certificate requested)
 by m-r2.th.seeweb.it (Postfix) with ESMTPSA id 560B33F290;
 Sun, 25 Jun 2023 23:33:21 +0200 (CEST)
Date: Sun, 25 Jun 2023 23:33:19 +0200
From: Marijn Suijten <marijn.suijten@somainline.org>
To: Abhinav Kumar <quic_abhinavk@quicinc.com>
Subject: Re: [PATCH 1/2] drm/msm/dpu: fix DSC 1.2 block lengths
Message-ID: <vp56takwifjhcopj5mfnh3767alih5glyqliji55iptcdbhbv7@dwxbtnb24jso>
References: <20230623013731.1088007-1-dmitry.baryshkov@linaro.org>
 <6b74cb1f-3128-4ebd-8ff9-33cc025d957b@quicinc.com>
 <mwxs3rvemvdizqtsfa7pxms5prgrdq2lue6lvkt2f23nehzhwr@uawaxv5jsnmh>
 <ad1cf803-729f-5ef5-a6cf-667ecde0b282@linaro.org>
 <okxoa5ltkvki25q6e25jwoh55l3aav3umowynklinyapg4ojvp@wfxa6upwnk3m>
 <fbfb5297-0b89-d48e-459f-7e2cd8aa221b@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <fbfb5297-0b89-d48e-459f-7e2cd8aa221b@quicinc.com>
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
Cc: freedreno@lists.freedesktop.org, Sean Paul <sean@poorly.run>,
 Bjorn Andersson <andersson@kernel.org>, dri-devel@lists.freedesktop.org,
 Stephen Boyd <swboyd@chromium.org>, linux-arm-msm@vger.kernel.org,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 2023-06-23 15:12:06, Abhinav Kumar wrote:
> 
> 
> On 6/23/2023 1:28 PM, Marijn Suijten wrote:
> > On 2023-06-23 14:37:12, Dmitry Baryshkov wrote:
> > <snip>
> >>> In fact I asked to make it 0xf00 + 0x10 or 0xf80 + 0x10 to also cover
> >>> the CTL registers, but that change didn't make it through.  0x29c is an
> >>> arbitrary number that I have no clue what it was based on.
> >>
> >> This should have been NAKed. or at least TODOed.
> > 
> > As usual ;) - add new features first, fix the fundamentals... later?
> > 
> > - Marijn
> 
> I think you yourself found out that this was not an arbitary number but 
> we atleast wanted to cover the full encoder set.
> 
> So fundamentals are always sound sometimes understanding is not ;)

The fundamentals are not sound until the CTL block/register can be
dumped ;)

- Marijn
