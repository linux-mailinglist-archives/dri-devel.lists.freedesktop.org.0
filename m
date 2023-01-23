Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1BCE5677B1F
	for <lists+dri-devel@lfdr.de>; Mon, 23 Jan 2023 13:38:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1FBA810E48A;
	Mon, 23 Jan 2023 12:38:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 188F910E489;
 Mon, 23 Jan 2023 12:38:17 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 905F5B80D6E;
 Mon, 23 Jan 2023 12:38:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F33BBC4339B;
 Mon, 23 Jan 2023 12:38:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1674477494;
 bh=H+OW5DW2jeWkZvRmxDgz1ed60PrBNSnXSPQjJ/Kwihk=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=BEDC7QceJmbRsOQqIcGKhnAS2rq9TrHli4lvckskodzCC1mxiNSXKTP7gizrwlzm/
 7kbIuQEp86DuMkX6/ktJlU/uilVq+gPJrQVmrNvZpG65XLeN9zDFipPu7inAyKDBcS
 eTJFcFe2CBcmNWpLOY4+Es5HHB50JlthORvgiKGLS/5ALeAXNpvT1b8I/A6p3fHThn
 yH235OdH5KM+QWxx4f0cxVsjtgTGHY+4F2jqA4+pRFcl+mZPTIdcx38uy6JbQpNn2D
 VSA7hhwsYTaAvMoTfVE2NYI6xqlWMaf12/GZ2mQwGmFYYiphMR0VCjJgJS3QxioEmq
 iATV6Il2RU8jg==
Message-ID: <2d5f0bc3-620a-1fd8-061f-92f16efd3c5e@kernel.org>
Date: Mon, 23 Jan 2023 13:38:07 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.0
Subject: Re: [PATCH v2 1/3] drm/msm/gpu: Add devfreq tuning debugfs
To: Rob Clark <robdclark@gmail.com>, dri-devel@lists.freedesktop.org
References: <20230110231447.1939101-1-robdclark@gmail.com>
 <20230110231447.1939101-2-robdclark@gmail.com>
Content-Language: en-US
From: Krzysztof Kozlowski <krzk@kernel.org>
In-Reply-To: <20230110231447.1939101-2-robdclark@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
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
Cc: Rob Clark <robdclark@chromium.org>, freedreno@lists.freedesktop.org,
 Akhil P Oommen <quic_akhilpo@quicinc.com>, linux-arm-msm@vger.kernel.org,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@somainline.org>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Douglas Anderson <dianders@chromium.org>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>,
 open list <linux-kernel@vger.kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 11/01/2023 00:14, Rob Clark wrote:
> From: Rob Clark <robdclark@chromium.org>
> 
> Make the handful of tuning knobs available visible via debugfs.
> 
> v2: select DEVFREQ_GOV_SIMPLE_ONDEMAND because for some reason
>     struct devfreq_simple_ondemand_data depends on this
> 
> Signed-off-by: Rob Clark <robdclark@chromium.org>
> ---

For some reason this was merged even though earlier kbuild reported
build failure. This breaks linux next and qcom defconfig. Please drop
the patch from the linux next.

See earlier build issues reported:
https://lore.kernel.org/all/202301130108.fslQjvJ8-lkp@intel.com/

Best regards,
Krzysztof

