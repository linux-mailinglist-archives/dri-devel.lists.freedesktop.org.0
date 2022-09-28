Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C1555EE10A
	for <lists+dri-devel@lfdr.de>; Wed, 28 Sep 2022 17:57:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0EFA210E41B;
	Wed, 28 Sep 2022 15:57:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 85B1210E41B;
 Wed, 28 Sep 2022 15:57:26 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id D669A61F10;
 Wed, 28 Sep 2022 15:57:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3DE40C433D6;
 Wed, 28 Sep 2022 15:57:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1664380645;
 bh=tjK6Iwi9Ql5KmK46x2ExPsr0zxrzgi8K1Jt3JCk5wG0=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=IAPMUszGIv2DzN4/h8aUlomn7hJkaXcbEvnq+G8MmPtvaiXjWPLFEpQw+L0tXj8mv
 nSaXwxfw7KUH+zCsO5eeRCqfrqy8XD6usPAvTwWrke4CwDjCt4a+/ZsTF2rx75qBxF
 gpCTcdLvPqxW2+SJqI+/lDxbhDcqnglftQdLbNxPDKuQbreUK7iNwpV7ghPIkCZzBx
 XNbgdsuNq0LCORR/LB70/RUBeDfx47cC1JsnWK2uQkBXesAC9OWYHTy7JwEQ5ZiS2w
 DNLX8L0Dq+FWd1EoA3LeTe7ub9tsZgCZ1J1KPoO+EEV8rcKvV27AGtoBXpLLHySD/a
 sdVbUcOrIOylA==
Received: from johan by xi.lan with local (Exim 4.94.2)
 (envelope-from <johan@kernel.org>)
 id 1odZRD-0005f9-N1; Wed, 28 Sep 2022 17:57:31 +0200
Date: Wed, 28 Sep 2022 17:57:31 +0200
From: Johan Hovold <johan@kernel.org>
To: Abhinav Kumar <quic_abhinavk@quicinc.com>
Subject: Re: [PATCH v2 09/10] drm/msm/dp: drop modeset sanity checks
Message-ID: <YzRu64bdqjnhbjlc@hovoldconsulting.com>
References: <20220913085320.8577-1-johan+linaro@kernel.org>
 <20220913085320.8577-10-johan+linaro@kernel.org>
 <d05290d8-7603-13b3-3cc4-d8509b03fc02@quicinc.com>
 <YzKi8XfV6V0p0TJi@hovoldconsulting.com>
 <d7688497-6229-40d4-3378-5036d699dfd7@quicinc.com>
 <YzQ9CPwxZXFJCQGG@hovoldconsulting.com>
 <3a5f006d-2735-5af5-48fa-4397bfb5e3ba@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <3a5f006d-2735-5af5-48fa-4397bfb5e3ba@quicinc.com>
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

On Wed, Sep 28, 2022 at 08:33:52AM -0700, Abhinav Kumar wrote:
> On 9/28/2022 5:24 AM, Johan Hovold wrote:
> > On Tue, Sep 27, 2022 at 11:42:53AM -0700, Abhinav Kumar wrote:

> >> Discussed with Rob on IRC, we will apply everything except the last two
> >> patches of this series in the -fixes and take these two for the next
> >> kernel rev push.
> > 
> > So the fixes go in 6.0 and the two follow-on cleanups in 6.1? Or did you
> > mean 6.1 and 6.2?

> The fixes will go in 6.1 first.
> 
> The two follow-on cleanups in 6.2.

Ok, sounds good. Thanks.

Johan
