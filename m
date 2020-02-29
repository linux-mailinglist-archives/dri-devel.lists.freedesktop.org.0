Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 85DD817443A
	for <lists+dri-devel@lfdr.de>; Sat, 29 Feb 2020 02:35:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 12E1E88089;
	Sat, 29 Feb 2020 01:35:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail27.static.mailgun.info (mail27.static.mailgun.info
 [104.130.122.27])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D2F6B6F4E1
 for <dri-devel@lists.freedesktop.org>; Sat, 29 Feb 2020 01:35:54 +0000 (UTC)
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1582940154; h=Message-ID: Subject: Cc: To: From: Date:
 Content-Transfer-Encoding: Content-Type: MIME-Version: Sender;
 bh=ySl75E8LPEXT19bMlNXG70itx4h/1U4kd9G3+SOPYT0=;
 b=YgOhaQQKBjj8PIPbFqJzeuHA9mdMRBTar04mSVb7CYv364cPUYlkOM3uF+NEQoI8dOlrxlch
 wjq2ythnHCdhueBdrRfz4H7T31NAB1Crpm16IaT15VQbMyTxiVDy3xYTVVtd7CKsdDwZuPst
 X40io9Zu8k7P81XWHMv7nEchDZM=
X-Mailgun-Sending-Ip: 104.130.122.27
X-Mailgun-Sid: WyJkOTU5ZSIsICJkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnIiwgImJlOWU0YSJd
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171])
 by mxa.mailgun.org with ESMTP id 5e59bff9.7fb480e932d0-smtp-out-n03;
 Sat, 29 Feb 2020 01:35:53 -0000 (UTC)
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id F23DEC433A2; Sat, 29 Feb 2020 01:35:52 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
 aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,URIBL_BLOCKED
 autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
 (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested) (Authenticated sender: abhinavk)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id 2B242C43383;
 Sat, 29 Feb 2020 01:35:51 +0000 (UTC)
MIME-Version: 1.0
Date: Fri, 28 Feb 2020 17:35:51 -0800
From: abhinavk@codeaurora.org
To: dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org
Subject: Reverting https://patchwork.freedesktop.org/patch/336850/
Message-ID: <8bec962794df6fd8f1384d457060234e@codeaurora.org>
X-Sender: abhinavk@codeaurora.org
User-Agent: Roundcube Webmail/1.3.9
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
Cc: treding@nvidia.com, daniel.vetter@ffwll.ch, varar@quicinc.com,
 seanpaul@chromium.org, aravindh@codeaurora.org, chandanu@codeaurora.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Thierry

For DP drivers using MSM chipsets, we are using drm_dp_link_configure, 
drm_dp_link_power_up and drm_dp_link_power_down functions. Here is the 
patch for reference:

https://patchwork.freedesktop.org/patch/343346/

We will be posting a newer version of the driver soon.

For that, we plan to revert 
https://patchwork.freedesktop.org/patch/336850/ as now there are more 
users of the functions and not just tegra.

Let us know if this is the right approach or shall we make the required 
functions local to our drivers.

Thanks

Abhinav
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
