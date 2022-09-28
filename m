Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4FF1A5EDC81
	for <lists+dri-devel@lfdr.de>; Wed, 28 Sep 2022 14:24:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0588410E4ED;
	Wed, 28 Sep 2022 12:24:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A90FD10E4EC;
 Wed, 28 Sep 2022 12:24:38 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 48445B82038;
 Wed, 28 Sep 2022 12:24:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E3412C433C1;
 Wed, 28 Sep 2022 12:24:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1664367876;
 bh=dBwYyIOq7xKF2yq5mWzeWyI6QLDHI+INr6nNI1xPzAo=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=VpuW2ZIyPzbpYaGo3QDSDvBrtWqXtDUC+j3uR7J3Bojq4/w5XMcNNuN1MTSMm3AH1
 M2soWfAHndJq5YYyEMVkglILBCy85fKd4Vx9y27d5Vyn1ux+VVMARTqmWpJOwxvpk/
 kr/XrqEokc8BN4DvN/MWjY/22JOzvDwwuxsdc2zG2URG8BAZqAUsKk39G0enec/fS4
 yl2hygFdXnojRHQiXobCPhN7bRw9QNyH5lIo3ce7pnw+xCYp6sOOWl4ax3V5F5fT5w
 1aNnSi49wg8Wt3RUx4GL2iK5R5+zaryKXyjRN+f2UNvpsELPgLjLmDDxc806OLwZhh
 XHlVMPz+GExoA==
Received: from johan by xi.lan with local (Exim 4.94.2)
 (envelope-from <johan@kernel.org>)
 id 1odW7E-0001cB-VT; Wed, 28 Sep 2022 14:24:41 +0200
Date: Wed, 28 Sep 2022 14:24:40 +0200
From: Johan Hovold <johan@kernel.org>
To: Abhinav Kumar <quic_abhinavk@quicinc.com>
Subject: Re: [PATCH v2 09/10] drm/msm/dp: drop modeset sanity checks
Message-ID: <YzQ9CPwxZXFJCQGG@hovoldconsulting.com>
References: <20220913085320.8577-1-johan+linaro@kernel.org>
 <20220913085320.8577-10-johan+linaro@kernel.org>
 <d05290d8-7603-13b3-3cc4-d8509b03fc02@quicinc.com>
 <YzKi8XfV6V0p0TJi@hovoldconsulting.com>
 <d7688497-6229-40d4-3378-5036d699dfd7@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <d7688497-6229-40d4-3378-5036d699dfd7@quicinc.com>
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
Cc: dri-devel@lists.freedesktop.org, Neil Armstrong <neil.armstrong@linaro.org>,
 Jernej Skrabec <jernej.skrabec@gmail.com>, linux-kernel@vger.kernel.org,
 Jonas Karlman <jonas@kwiboo.se>, linux-arm-msm@vger.kernel.org,
 Bjorn Andersson <andersson@kernel.org>, Steev Klimaszewski <steev@kali.org>,
 freedreno@lists.freedesktop.org, Douglas Anderson <dianders@chromium.org>,
 Robert Foss <robert.foss@linaro.org>, Stephen Boyd <swboyd@chromium.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Kuogee Hsieh <quic_khsieh@quicinc.com>, Sean Paul <sean@poorly.run>,
 Johan Hovold <johan+linaro@kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Sep 27, 2022 at 11:42:53AM -0700, Abhinav Kumar wrote:
> On 9/27/2022 12:14 AM, Johan Hovold wrote:
> > On Mon, Sep 26, 2022 at 11:17:20AM -0700, Abhinav Kumar wrote:
> >> On 9/13/2022 1:53 AM, Johan Hovold wrote:
> >>> Drop the overly defensive modeset sanity checks of function parameters
> >>> which have already been checked or used by the callers.
> >>>
> >>> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> >>> Signed-off-by: Johan Hovold <johan+linaro@kernel.org>
> >>
> >> The change LGTM, hence
> >>
> >> Reviewed-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
> >>
> >> I think we can use below fixes tag so that we can pick up this entire
> >> series for the fixes cycle.
> >>
> >> Fixes: c943b4948b58 ("drm/msm/dp: add displayPort driver support")
> > 
> > Perhaps that's a requirement for drm, but I wouldn't add a Fixes tag for
> > this otherwise as it's not a bug.
> > 
> > You also have to watch out for Sasha and his autosel scripts which will
> > probably try to backport this to stable if it finds a Fixes tag.

> Discussed with Rob on IRC, we will apply everything except the last two 
> patches of this series in the -fixes and take these two for the next 
> kernel rev push.

So the fixes go in 6.0 and the two follow-on cleanups in 6.1? Or did you
mean 6.1 and 6.2?

Johan
