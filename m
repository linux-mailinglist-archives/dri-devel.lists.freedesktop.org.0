Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B30036E9DFC
	for <lists+dri-devel@lfdr.de>; Thu, 20 Apr 2023 23:39:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9E6D610E312;
	Thu, 20 Apr 2023 21:39:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay02.th.seeweb.it (relay02.th.seeweb.it
 [IPv6:2001:4b7a:2000:18::163])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D4A4010E2E6
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Apr 2023 21:39:17 +0000 (UTC)
Received: from SoMainline.org (94-211-6-86.cable.dynamic.v4.ziggo.nl
 [94.211.6.86])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest
 SHA256) (No client certificate requested)
 by m-r1.th.seeweb.it (Postfix) with ESMTPSA id 8C81120571;
 Thu, 20 Apr 2023 23:39:13 +0200 (CEST)
Date: Thu, 20 Apr 2023 23:39:12 +0200
From: Marijn Suijten <marijn.suijten@somainline.org>
To: Abhinav Kumar <quic_abhinavk@quicinc.com>
Subject: Re: [Freedreno] [PATCH 1/3] drm/msm/dpu: Drop unused members from HW
 structs
Message-ID: <2ujeakobg7oulzarvzjktx5elo4ckpjq5pbknr3jx3h43snmry@yd4j64s7tqy5>
References: <20230418-dpu-drop-useless-for-lookup-v1-0-b9897ceb6f3e@somainline.org>
 <20230418-dpu-drop-useless-for-lookup-v1-1-b9897ceb6f3e@somainline.org>
 <7ad86cd9-4b30-e7f1-780f-2c1c7093087e@linaro.org>
 <cd308be9-5420-6d75-da23-e844107ec275@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <cd308be9-5420-6d75-da23-e844107ec275@quicinc.com>
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
Cc: freedreno@lists.freedesktop.org,
 Jami Kettunen <jami.kettunen@somainline.org>, Sean Paul <sean@poorly.run>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@somainline.org>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Jordan Crouse <jordan@cosmicpenguin.net>,
 Konrad Dybcio <konrad.dybcio@linaro.org>,
 Martin Botka <martin.botka@somainline.org>,
 ~postmarketos/upstreaming@lists.sr.ht, linux-arm-msm@vger.kernel.org,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 2023-04-20 08:46:46, Abhinav Kumar wrote:
> 
> 
> On 4/20/2023 7:33 AM, Dmitry Baryshkov wrote:
> > On 18/04/2023 02:14, Marijn Suijten wrote:
> >> Some of these members were initialized while never read, while others
> >> were not even assigned any value at all.  Drop them to save some space,
> >> and above all confusion when looking at these members.
> >>
> >> Fixes: 25fdd5933e4c ("drm/msm: Add SDM845 DPU support")
> >> Fixes: 84a33d0fd921 ("drm/msm/dpu: add dpu_hw_wb abstraction for 
> >> writeback blocks")
> > 
> > The fixes headers are slightly questionable, as unused fields are not a 
> > bug. Nevertheless:
> > 
> 
> Yes, I would also not treat this as a "fix" but just cleanup.

Ack to both.  This seems like a fine line to me as the fields are not
contributing to anything except confusion.  Specifically hw_mdp which is
never initialized and may accidentally be used without realizing that
it'll stay NULL, but that is again up to the developer using the field
at that point.

Feel free to drop them while applying, or should I reword the message to
at least still link these commits to mention the origin of the unused
fields?

- Marijn
