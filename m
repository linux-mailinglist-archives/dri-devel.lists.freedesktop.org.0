Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 195625EBB52
	for <lists+dri-devel@lfdr.de>; Tue, 27 Sep 2022 09:15:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 045A710E06D;
	Tue, 27 Sep 2022 07:14:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EBD4210E06D;
 Tue, 27 Sep 2022 07:14:54 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 5E9F4B819DC;
 Tue, 27 Sep 2022 07:14:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 042C4C433D6;
 Tue, 27 Sep 2022 07:14:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1664262892;
 bh=AXaJuNbMdlA3wyGDnt3C65MZ5fPprSXOkBzMm29GxKU=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Lg4xfg3HPJJgLOswp5R4rRvhCSHY80EEGlrkDDVTVmIf2RUUaZq4gKG1UC71/6yLz
 sPW8a/BHJdKNLENWTlp2IZMlB37kPRyLzwizM0Y+fg2pGMGSB8RRPAIVVFiWYph/GI
 /PD0BNHVcy0b2gUBr33oPPSpFsFGWijRzO/kaFrDiw5v1bMca3zoPgr5Bs9EyuH3UQ
 Kv7FLpRzeSCWj/rCg+FaZFP0GaWsoiyd2rbO06yL+HygmEOq49g3dFpPedckH9Cux7
 Ntod7/E2gqpN1vNIOeGBdmB+TcNsp5fbDNY7Z5Or9rRdoROehDde0FZJa1UAfydqhv
 PW+swX5ksnP+Q==
Received: from johan by xi.lan with local (Exim 4.94.2)
 (envelope-from <johan@kernel.org>)
 id 1od4nx-0005GW-Jb; Tue, 27 Sep 2022 09:14:57 +0200
Date: Tue, 27 Sep 2022 09:14:57 +0200
From: Johan Hovold <johan@kernel.org>
To: Abhinav Kumar <quic_abhinavk@quicinc.com>
Subject: Re: [PATCH v2 09/10] drm/msm/dp: drop modeset sanity checks
Message-ID: <YzKi8XfV6V0p0TJi@hovoldconsulting.com>
References: <20220913085320.8577-1-johan+linaro@kernel.org>
 <20220913085320.8577-10-johan+linaro@kernel.org>
 <d05290d8-7603-13b3-3cc4-d8509b03fc02@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <d05290d8-7603-13b3-3cc4-d8509b03fc02@quicinc.com>
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

On Mon, Sep 26, 2022 at 11:17:20AM -0700, Abhinav Kumar wrote:
> On 9/13/2022 1:53 AM, Johan Hovold wrote:
> > Drop the overly defensive modeset sanity checks of function parameters
> > which have already been checked or used by the callers.
> > 
> > Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> > Signed-off-by: Johan Hovold <johan+linaro@kernel.org>
> 
> The change LGTM, hence
> 
> Reviewed-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
> 
> I think we can use below fixes tag so that we can pick up this entire 
> series for the fixes cycle.
> 
> Fixes: c943b4948b58 ("drm/msm/dp: add displayPort driver support")

Perhaps that's a requirement for drm, but I wouldn't add a Fixes tag for
this otherwise as it's not a bug.

You also have to watch out for Sasha and his autosel scripts which will
probably try to backport this to stable if it finds a Fixes tag.

Johan
