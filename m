Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B976C7EBE60
	for <lists+dri-devel@lfdr.de>; Wed, 15 Nov 2023 09:08:34 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A06AD10E1BD;
	Wed, 15 Nov 2023 08:08:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 77C5710E1BD;
 Wed, 15 Nov 2023 08:08:31 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by ams.source.kernel.org (Postfix) with ESMTP id B6182B81864;
 Wed, 15 Nov 2023 08:08:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 15325C433C7;
 Wed, 15 Nov 2023 08:08:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1700035709;
 bh=FrpH99pmwPh2F9FlzZlkzcWpBUQxotTE5nvhX+03e28=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=l8acyOhcKcJVYn2zmm5mfTdkmaM4/PFGG/coN2r2+xcaqdrKMtxCDNnsKmhw10ZrZ
 R56BstdttA7H1SFLYPpSw2G07DIc2rFfVd/fAu3gMnUlDr+Y1DnEs21uFapMElYRVv
 VrKXAPeOx8+3iuHKaa/hPruqVejo0c1xZzSLaA/vaDo9Wttwe6IPIFZD+1Vjq5EqUu
 EE2w4FwtfWShvYXu/o/rfmFUG2V3dElv1XvYKP+IAz0VrZCkrCpXXbTBHVlKBccqwN
 T3+0z00arlYyJQ7x92TKYbnobj66fx3OzE77LSzNVBn2kOY9GMhwuetlECmjg40fHV
 LE70K5H9G8CCA==
Received: from johan by xi.lan with local (Exim 4.96.2)
 (envelope-from <johan@kernel.org>) id 1r3Awk-0001ZJ-0N;
 Wed, 15 Nov 2023 09:08:26 +0100
Date: Wed, 15 Nov 2023 09:08:26 +0100
From: Johan Hovold <johan@kernel.org>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Subject: Re: [PATCH v2 1/2] drm/msm/dp: don't touch DP subconnector property
 in eDP case
Message-ID: <ZVR8ei0Dv3Cvoe4A@hovoldconsulting.com>
References: <20231025092711.851168-1-dmitry.baryshkov@linaro.org>
 <20231025092711.851168-2-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231025092711.851168-2-dmitry.baryshkov@linaro.org>
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
Cc: freedreno@lists.freedesktop.org, Bjorn Andersson <andersson@kernel.org>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, dri-devel@lists.freedesktop.org,
 Stephen Boyd <swboyd@chromium.org>, linux-arm-msm@vger.kernel.org,
 Marijn Suijten <marijn.suijten@somainline.org>,
 Abel Vesa <abel.vesa@linaro.org>, Sean Paul <sean@poorly.run>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Oct 25, 2023 at 12:23:09PM +0300, Dmitry Baryshkov wrote:
> From: Abel Vesa <abel.vesa@linaro.org>
> 
> In case of the eDP connection there is no subconnetor and as such no
> subconnector property. Put drm_dp_set_subconnector_property() calls
> under the !is_edp condition.
> 
> Fixes: bfcc3d8f94f4 ("drm/msm/dp: support setting the DP subconnector type")
> Signed-off-by: Abel Vesa <abel.vesa@linaro.org>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

Reviewed-by: Johan Hovold <johan+linaro@kernel.org>
Tested-by: Johan Hovold <johan+linaro@kernel.org>
