Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id OAG5OnSQe2nOGAIAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Thu, 29 Jan 2026 17:53:08 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C2154B276C
	for <lists+dri-devel@lfdr.de>; Thu, 29 Jan 2026 17:53:08 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1FC3710E12A;
	Thu, 29 Jan 2026 16:53:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="i9GB03m2";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3A83010E112;
 Thu, 29 Jan 2026 16:53:05 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 5DFED600C4;
 Thu, 29 Jan 2026 16:53:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E040BC4CEF7;
 Thu, 29 Jan 2026 16:53:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1769705584;
 bh=4Go8r+auphjo22TcuXvyOWWNojSmrb+RGzHfXTGMbzs=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=i9GB03m2rvW1q2q52DbPwCtjUQP5aHy6q0i/GQtvQPaBJ77SGI9HEANAdjlN+ue50
 cz4KCQVvudBzPtTloSt7N4Bxq+AiQLUVj8DXVEVb6Jp6PlksHW8ir0Xjg1x9AwJqw7
 BPg8jwfYNyiCs1SAMC5wdYwvHw4ApXjcGxAGrGoolFt8swmCiXrGX0mck+fC/4epLG
 AtBxiVddh00hmQJtFZhy8nvi+gRGAs3QG6/ybnz3rRwvtYa9EH6ATp1RkpXUgrQ6iU
 /nyBDnOmmeLghKnZ3q+SvgvkFNEw0yuvjZgXWZEaDcQ/auR7l+TTjmMXkNDl0df/L7
 RXZBPHnedKVaw==
Date: Thu, 29 Jan 2026 10:53:03 -0600
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Ritesh Kumar <quic_riteshk@quicinc.com>
Cc: quic_mahap@quicinc.com, robin.clark@oss.qualcomm.com,
 mripard@kernel.org, krzk+dt@kernel.org,
 dri-devel@lists.freedesktop.org, martin.petersen@oracle.com,
 tzimmermann@suse.de, lumag@kernel.org, simona@ffwll.ch,
 linux-kernel@vger.kernel.org, maarten.lankhorst@linux.intel.com,
 sean@poorly.run, kishon@kernel.org, James.Bottomley@hansenpartnership.com,
 marijn.suijten@somainline.org, devicetree@vger.kernel.org,
 andersson@kernel.org, cros-qcom-dts-watchers@chromium.org,
 linux-scsi@vger.kernel.org, vkoul@kernel.org, mani@kernel.org,
 linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
 quic_vproddut@quicinc.com, abhinav.kumar@linux.dev,
 conor+dt@kernel.org, konradybcio@kernel.org,
 freedreno@lists.freedesktop.org, airlied@gmail.com
Subject: Re: [PATCH v4 1/2] dt-bindings: phy: qcom-edp: Add reference clock
 for sa8775p eDP PHY
Message-ID: <176970558251.1269081.4205775234649909264.robh@kernel.org>
References: <20260128114853.2543416-1-quic_riteshk@quicinc.com>
 <20260128114853.2543416-2-quic_riteshk@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260128114853.2543416-2-quic_riteshk@quicinc.com>
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
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [1.19 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.20)[mailman];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_TWELVE(0.00)[30];
	FREEMAIL_CC(0.00)[quicinc.com,oss.qualcomm.com,kernel.org,lists.freedesktop.org,oracle.com,suse.de,ffwll.ch,vger.kernel.org,linux.intel.com,poorly.run,hansenpartnership.com,somainline.org,chromium.org,lists.infradead.org,linux.dev,gmail.com];
	ARC_NA(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	FROM_NEQ_ENVFROM(0.00)[robh@kernel.org,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel,dt];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[quicinc.com:email,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns]
X-Rspamd-Queue-Id: C2154B276C
X-Rspamd-Action: no action


On Wed, 28 Jan 2026 17:18:49 +0530, Ritesh Kumar wrote:
> The initial sa8775p eDP PHY binding contribution missed adding support for
> voting on the eDP reference clock. This went unnoticed because the UFS PHY
> driver happened to enable the same clock.
> 
> After commit 77d2fa54a945 ("scsi: ufs: qcom : Refactor phy_power_on/off
> calls"), the eDP reference clock is no longer kept enabled, which results
> in the following PHY power-on failure:
> 
> phy phy-aec2a00.phy.10: phy poweron failed --> -110
> 
> To fix this, explicit voting for the eDP reference clock is required.
> This patch adds the eDP reference clock for sa8775p eDP PHY and updates
> the corresponding example node.
> 
> Signed-off-by: Ritesh Kumar <quic_riteshk@quicinc.com>
> ---
>  .../devicetree/bindings/display/msm/qcom,sa8775p-mdss.yaml  | 6 ++++--
>  Documentation/devicetree/bindings/phy/qcom,edp-phy.yaml     | 1 +
>  2 files changed, 5 insertions(+), 2 deletions(-)
> 

Acked-by: Rob Herring (Arm) <robh@kernel.org>

