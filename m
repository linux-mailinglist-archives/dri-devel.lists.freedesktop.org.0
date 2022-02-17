Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7CCD64B97A3
	for <lists+dri-devel@lfdr.de>; Thu, 17 Feb 2022 05:21:12 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 11B6910E7E1;
	Thu, 17 Feb 2022 04:21:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7A31210E796;
 Thu, 17 Feb 2022 04:21:08 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 5E7E761DB0;
 Thu, 17 Feb 2022 04:21:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F3010C340E9;
 Thu, 17 Feb 2022 04:21:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1645071665;
 bh=JCJ5zo28ggwBwwlByO8PafXAV2figIzScUg43ZiQpuU=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=KJsgc9yCx/gLzgA4pQpA9qyIIWUG998w6GIBM7G0sj9P+hyROIagoeTTuUS66B/vq
 9bnLqmWS36xrVR70ykn/M6/1KhgKnPzm/WSa3a5kky5vQnz1rTV8bbWyXAoQBzJmHF
 9nzP3EW0MQMekyaCAwcrrarELRMVvyzSw7MVC+x6jaESTEPACoL2BpMkrO4epafOXJ
 9uZjiPAQdieW7smd+fUB9Yo7nQvsM5wvb3NFJfOumqY7sL/srQlqqnExifARf3NIQD
 c/IBnUlZIWqeP1K4URxsY0jDvPQuonxY9MM27lyrDHoKy0raUQDqhlMG4k7LCAhZuK
 jhPUpEvf/ABCw==
Date: Thu, 17 Feb 2022 09:51:01 +0530
From: Vinod Koul <vkoul@kernel.org>
To: Abhinav Kumar <quic_abhinavk@quicinc.com>
Subject: Re: [REPOST PATCH v4 04/13] drm/msm/disp/dpu1: Add support for DSC
 in pingpong block
Message-ID: <Yg3NLVBQij0feTMv@matsya>
References: <20220210103423.271016-1-vkoul@kernel.org>
 <20220210103423.271016-5-vkoul@kernel.org>
 <a65a62ab-427f-3a5a-b633-2c457f797dab@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <a65a62ab-427f-3a5a-b633-2c457f797dab@quicinc.com>
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
Cc: Jonathan Marek <jonathan@marek.ca>, David Airlie <airlied@linux.ie>,
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 Abhinav Kumar <abhinavk@codeaurora.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>, dri-devel@lists.freedesktop.org,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 16-02-22, 11:49, Abhinav Kumar wrote:
> 
> 
> On 2/10/2022 2:34 AM, Vinod Koul wrote:
> > In SDM845, DSC can be enabled by writing to pingpong block registers, so
> > add support for DSC in hw_pp
> > 
> > Reviewed-by: Abhinav Kumar <abhinavk@codeaurora.org>
> 
> For the sake of uniformity, please use
> 
> Reviewed-by: Abhinav Kumar <quic_abhinavk@quicinc.com>

This one has been carry fwd from few versions back :) will update
everywhere...

-- 
~Vinod
