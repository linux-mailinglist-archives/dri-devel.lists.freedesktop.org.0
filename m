Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1AB296FBF7E
	for <lists+dri-devel@lfdr.de>; Tue,  9 May 2023 08:46:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E4C7C10E1E3;
	Tue,  9 May 2023 06:46:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from m-r1.th.seeweb.it (m-r1.th.seeweb.it [5.144.164.170])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 529D710E1E3
 for <dri-devel@lists.freedesktop.org>; Tue,  9 May 2023 06:46:28 +0000 (UTC)
Received: from SoMainline.org (unknown [89.205.226.248])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest
 SHA256) (No client certificate requested)
 by m-r1.th.seeweb.it (Postfix) with ESMTPSA id 584721F713;
 Tue,  9 May 2023 08:46:24 +0200 (CEST)
Date: Tue, 9 May 2023 08:46:22 +0200
From: Marijn Suijten <marijn.suijten@somainline.org>
To: Jessica Zhang <quic_jesszhan@quicinc.com>
Subject: Re: [PATCH v2 4/4] drm/msm/dpu: Set DATA_COMPRESS for command mode
Message-ID: <tucqk6alt7bcxhk63bwobnswrag4dhx7srj6hzhqvky3trclwv@jbq5hdzfa5of>
References: <20230405-add-dsc-support-v2-0-1072c70e9786@quicinc.com>
 <20230405-add-dsc-support-v2-4-1072c70e9786@quicinc.com>
 <j5wa45g4v6swvsiakl23azu7qgxtdllf2gav5wdc7s7zukxe4c@jkcu2wnyn6rn>
 <baa25817-4a0d-551d-a351-21cc1525a932@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <baa25817-4a0d-551d-a351-21cc1525a932@quicinc.com>
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
 Konrad Dybcio <konrad.dybcio@linaro.org>, linux-arm-msm@vger.kernel.org,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 2023-05-08 16:17:54, Jessica Zhang wrote:
<snip>
> >> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.h
> >> index 73b0885918f8..a8def68a5ec2 100644
> >> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.h
> >> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.h
> >> @@ -70,6 +70,7 @@ struct intf_status {
> >>    * @get_autorefresh:            Retrieve autorefresh config from hardware
> >>    *                              Return: 0 on success, -ETIMEDOUT on timeout
> >>    * @vsync_sel:                  Select vsync signal for tear-effect configuration
> >> + * @enable_compression: Enable data compression
> > 
> > Indent to match above.
> 
> Sure, is the plan to correct the whitespace in the first half of the 
> comment block in the future?

I couldn't see the first part of the block in the diff context here, but
indeed that's a broken disaster so we will have to fix that up :(

I think it is fine to leave the latter ones as it is, as long as it is
consistent:

- Only using spaces;
- Colon directly after the word (and an @ before it, see kerneldoc
  specification);
- Aligned to existing entries.

- Marijn
