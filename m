Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 03FC185D216
	for <lists+dri-devel@lfdr.de>; Wed, 21 Feb 2024 09:05:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5F9F310E277;
	Wed, 21 Feb 2024 08:05:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="eK6ijRXR";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E94F810E277;
 Wed, 21 Feb 2024 08:05:32 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id 30350CE1C78;
 Wed, 21 Feb 2024 08:05:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 68B0DC433C7;
 Wed, 21 Feb 2024 08:05:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1708502729;
 bh=Tpr/yec3AGC4Lc2eJDg1OjnAD9sBLP7h0jxhyqIYTUQ=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=eK6ijRXRympTy7Dlryxc1+ccz+sSc9s0V1MK9EzciMsOwCX31RlKWS1sIRNlLJZOl
 nNXm/VKIPBSVHaaNT4XyAGeUwcPHOffWPNyCwwX0+nJCVmevA9E8CLAmGbhFpzDN5i
 gNF1JoS+qJE4Du1iQMrDeb0MtjwdodkrHmvMa+4mVt5chON5GQBTtJVUNvDNQwEUCa
 0HIEAJejS3pOB2BbCfmA/xZODMcpB6TjHBgD1ZtL4YmsLwENycTADaiN9TTZnwfMf+
 zT2IK655ADuV66esW14ijM7EDLGHrRR4PSXMazD2xJGOMUn2JbiYJplEH9ruicueIK
 +V/92rXlMN8Bw==
Received: from johan by xi.lan with local (Exim 4.97.1)
 (envelope-from <johan@kernel.org>) id 1rchbe-000000004Sj-2sC5;
 Wed, 21 Feb 2024 09:05:30 +0100
Date: Wed, 21 Feb 2024 09:05:30 +0100
From: Johan Hovold <johan@kernel.org>
To: Abhinav Kumar <quic_abhinavk@quicinc.com>
Cc: Rob Clark <robdclark@gmail.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Kuogee Hsieh <quic_khsieh@quicinc.com>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Bjorn Andersson <quic_bjorande@quicinc.com>,
 quic_jesszhan@quicinc.com, quic_sbillaka@quicinc.com,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 linux-arm-msm@vger.kernel.org, regressions@lists.linux.dev,
 linux-kernel@vger.kernel.org
Subject: Re: drm/msm: Second DisplayPort regression in 6.8-rc1
Message-ID: <ZdWuygp4HuRVXvyl@hovoldconsulting.com>
References: <ZctVmLK4zTwcpW3A@hovoldconsulting.com>
 <343710b1-f0f4-5c05-70e6-3c221cdc9580@quicinc.com>
 <ZczFhVjHIm55JTfO@hovoldconsulting.com>
 <ZdDNcrf4KpflGeYQ@hovoldconsulting.com>
 <ZdMwZa98L23mu3u6@hovoldconsulting.com>
 <2df31f2d-8271-d966-158a-27c6e0581d72@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2df31f2d-8271-d966-158a-27c6e0581d72@quicinc.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Feb 20, 2024 at 01:19:54PM -0800, Abhinav Kumar wrote:
> On 2/19/2024 2:41 AM, Johan Hovold wrote:

> > It seems my initial suspicion that at least some of these regressions
> > were related to the runtime PM work was correct. The hard resets happens
> > when the DP controller is runtime suspended after being probed:

> > [   17.074925] bus: 'platform': __driver_probe_device: matched device aea0000.displayport-controller with driver msm-dp-display
> > [        Starting Network Time Synchronization...
> > [   17.112000] msm-dp-display aea0000.displayport-controller: dp_display_probe - populate aux bus
> > [   17.125208] msm-dp-display aea0000.displayport-controller: dp_pm_runtime_resume
> >           Starting Record System Boot/Shutdown in UTMP...
> >           Starting Virtual Console Setup...
> > [  OK  ] Finished Load/Save Screen Backlight Brightness of backlight:backlight.
> > [   17.197909] msm-dp-display aea0000.displayport-controller: dp_pm_runtime_suspend
> > [   17.198079] probe of aea0Format: Log Type - Time(microsec) - Message - Optional Info
> > Log Type: B - Since Boot(Power On Reset),  D - Delta,  S - Statistic
> > S - QC_IMAGE_VERSION_STRING=BOOT.MXF.1.1-00470-MAKENA-1
> > S - IMAGE_VARIANT_STRING=SocMakenaWP
> > S - OEM_IMAGE_VERSION_STRING=crm-ubuntu92
> > 
> >    < machine is reset by hypervisor >
> > 
> > Presumably the reset happens when controller is being shut down while
> > still being used by the EFI framebuffer.
> 
> I am not sure if we can conclude like that. Even if we shut off the 
> controller when the framebuffer was still being fetched that should only 
> cause a blank screen and not a reset because we really don't trigger a 
> new register write / read while its fetching so as such there is no new 
> hardware access.

It specifically looks like the reset happens when shutting down the PHY,
that is, the call to dp_display_host_phy_exit(dp) in
dp_pm_runtime_suspend() never returns.

That seems like more than a coincidence to me.
 
> One thing I must accept is that there are two differences between 
> sc8280xp where we are hitting these resets and sc7180/sc7280 chromebooks 
> where we tested it more thoroughly without any such issues:
> 
> 1) with the chromebooks we have depthcharge and not the QC UEFI.
> 
> If we are suspecting a hand-off issue here, will it help if we try to 
> disable the display in EFI by using "fastboot oem select-display-panel 
> none" (assuming this is a fastboot enabled device) and see if you still 
> hit the reset issue?

No, we don't have fastboot.

But as I mentioned I still do see resets when I instrument the code to
not shut down the display, which could indicate more than one issue
here.

> 2) chromebooks used "internal_hpd" whereas the pmic_glink method used in 
> the sc8280xp.
> 
> I am still checking if there are any code paths in the eDP/DP driver 
> left exposed due to this difference with pm_runtime which can cause 
> this. I am wondering if some sort of drm tracing will help to narrow 
> down the reset point.
> 
> > In the cases where the machines survives boot, the controller is never
> > suspended.
> > 
> > When investigating this I've also seen intermittent:
> > 
> > 	[drm:dp_display_probe [msm]] *ERROR* device tree parsing failed
> 
> So this error I think is because in dp_parser_parse() ---> 
> dp_parser_ctrl_res(), we also have a devm_phy_get().
> 
> This can return -EDEFER if the phy driver has not yet probed.
> 
> I checked the other things inside dp_parser_parse(), others calls seem 
> to be purely DT parsing except this one. I think to avoid the confusion, 
> we should move devm_phy_get() outside of DT parsing into a separate call 
> or atleast add an error log inside devm_phy_get() failure below to 
> indicate that it deferred
> 
>          io->phy = devm_phy_get(&pdev->dev, "dp");
>          if (IS_ERR(io->phy))
>                  return PTR_ERR(io->phy);
> 
> If my hypothesis is correct on this, then this error log (even though 
> misleading) should be harmless for this issue because if we hit 
> DRM_ERROR("device tree parsing failed\n"); we will skip the 
> devm_pm_runtime_enable().

Yeah, this seems to be the case as boot appears to recover from this, so
this may indeed be a probe deferral.

Probe deferrals should not be logged as errors however, so the fix is
not to add another error message but rather to suppress the current one
(e.g. using dev_err_probe()).

> > Has anyone given some thought to how the framebuffer handover is
> > supposed to work? It seems we're currently just relying on luck with
> > timing.

Any comments to this? It seems we should not be shutting down (runtime
suspend) the display during boot as can currently happen.

Johan
