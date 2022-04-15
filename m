Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5CA2D5031D8
	for <lists+dri-devel@lfdr.de>; Sat, 16 Apr 2022 01:14:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8EB0D10E518;
	Fri, 15 Apr 2022 23:14:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay08.th.seeweb.it (relay08.th.seeweb.it
 [IPv6:2001:4b7a:2000:18::169])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AFAAE10E4B8
 for <dri-devel@lists.freedesktop.org>; Fri, 15 Apr 2022 23:14:46 +0000 (UTC)
Received: from SoMainline.org (94-209-165-62.cable.dynamic.v4.ziggo.nl
 [94.209.165.62])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest
 SHA256) (No client certificate requested)
 by m-r2.th.seeweb.it (Postfix) with ESMTPSA id E1F7B3F78D;
 Sat, 16 Apr 2022 01:14:42 +0200 (CEST)
Date: Sat, 16 Apr 2022 01:14:41 +0200
From: Marijn Suijten <marijn.suijten@somainline.org>
To: Abhinav Kumar <quic_abhinavk@quicinc.com>
Subject: Re: [Freedreno] [PATCH 06/12] drm/msm/dpu: make changes to
 dpu_encoder to support virtual encoder
Message-ID: <20220415231441.dd2cyrl7sfz5fvy3@SoMainline.org>
References: <1644009445-17320-1-git-send-email-quic_abhinavk@quicinc.com>
 <1644009445-17320-7-git-send-email-quic_abhinavk@quicinc.com>
 <20220414222642.f7wy3wdbsgmrqrxj@SoMainline.org>
 <1af827f1-b9b5-ed43-7bd8-8af6206eabaa@quicinc.com>
 <227cb6b8-c4c5-aa24-a91e-ccbd29260b29@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <227cb6b8-c4c5-aa24-a91e-ccbd29260b29@quicinc.com>
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
Cc: markyacoub@chromium.org, quic_jesszhan@quicinc.com,
 linux-arm-msm@vger.kernel.org, Konrad Dybcio <konrad.dybcio@somainline.org>,
 dri-devel@lists.freedesktop.org, swboyd@chromium.org, nganji@codeaurora.org,
 Martin Botka <martin.botka@somainline.org>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@somainline.org>,
 dmitry.baryshkov@linaro.org, seanpaul@chromium.org, aravindh@codeaurora.org,
 freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Abhinav,

On 2022-04-15 12:25:55, Abhinav Kumar wrote:
> Hi Marijn
> 
> Looking at msm-next tip, this code has already been refactored in
> 
> https://gitlab.freedesktop.org/drm/msm/-/commit/ef58e0ad34365e2c8274b74e6e745b8c180ff0d3
> 
> So, I will just rebase my changes on msm-next tip and it should address 
> below comments as well.

That's actually great, I love patches that remove a whole lot of
(especially bug-containing) lines, awesome Dmitry!

Looking forward to the next revision, spotted some minor nits in this
revision but it probably makes little sense to point them out here
presuming they might have already been addressed on your end or removed
altogether.

- Marijn
