Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kldvBbTgp2mrlAAAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Wed, 04 Mar 2026 08:35:16 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B39571FBA69
	for <lists+dri-devel@lfdr.de>; Wed, 04 Mar 2026 08:35:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 27D3610E138;
	Wed,  4 Mar 2026 07:35:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="nxDqn5/s";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BBAC210E138;
 Wed,  4 Mar 2026 07:35:12 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id D0F4560097;
 Wed,  4 Mar 2026 07:35:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EA2DAC19423;
 Wed,  4 Mar 2026 07:35:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1772609711;
 bh=ck8j5e5cRPglodxtFZ61BbVXb4ziI3Wl4Gdb1FBkwXg=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=nxDqn5/sBd8jixNlkmxbXt6dqY5FFRhEsECF6I09Re0CRP4U6JgeR4cGXiwaRGofb
 QHQqEaLFJwpqABKvvBr4PPYJQEm5EUeYEi44u3YsZTlDE8R6sDyLiIEtkfDGstqrzg
 qQjvexW0PAli3wbXTDDOKFdRj9TkdAJiAywiVQvKPt1BQ1Ep2y9cJt94LmOXINm970
 cSmGTcouKNrtqnM4ZMdiwUzGQIRO5t0qQ7V1FhKY/iztLFWJZHr0qHc76doy09Li2M
 5HQ4BsDzyPxa8FPH3E7GL9BU6ePU3pKRbxXEgzc5XuOJk3MgbFS8B+cVTQPOc6K3De
 W/4I+nN8vUVZg==
Date: Wed, 4 Mar 2026 08:35:09 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Abel Vesa <abel.vesa@oss.qualcomm.com>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>, 
 Dmitry Baryshkov <lumag@kernel.org>, Abhinav Kumar <abhinav.kumar@linux.dev>, 
 Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
 Kuogee Hsieh <quic_khsieh@quicinc.com>, Abel Vesa <abelvesa@kernel.org>, 
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, stable@vger.kernel.org
Subject: Re: [PATCH v4] dt-bindings: display: msm: Fix reg ranges and clocks
 on Glymur
Message-ID: <20260304-aloof-aboriginal-panda-00dbdb@quoll>
References: <20260303-glymur-fix-dp-bindings-reg-clocks-v4-1-1ebd9c7c2cee@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260303-glymur-fix-dp-bindings-reg-clocks-v4-1-1ebd9c7c2cee@oss.qualcomm.com>
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
X-Rspamd-Queue-Id: B39571FBA69
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.69 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	ARC_NA(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCPT_COUNT_TWELVE(0.00)[24];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[oss.qualcomm.com,kernel.org,linux.dev,gmail.com,poorly.run,somainline.org,linux.intel.com,suse.de,ffwll.ch,quicinc.com,vger.kernel.org,lists.freedesktop.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	FROM_NEQ_ENVFROM(0.00)[krzk@kernel.org,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel,dt];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email]
X-Rspamd-Action: no action

On Tue, Mar 03, 2026 at 11:03:11AM +0200, Abel Vesa wrote:
> The Glymur platform has four DisplayPort controllers. The hardware
> supports four streams (MST) per controller. However, on Glymur the first
> three controllers only have two streams wired to the display subsystem,
> while the fourth controller operates in single-stream mode.
> 
> Add a dedicated clause for the Glymur compatible to require the register
> ranges for all four stream blocks, while allowing either one pixel clock
> (for the single-stream controller) or two pixel clocks (for the remaining
> controllers).
> 
> Update the Glymur MDSS schema example by adding the missing p2, p3,
> mst2link and mst3link register blocks. Without these, the bindings
> validation fails. Also replace the made-up register addresses with the
> actual addresses from the first controller to match the SoC devicetree
> description.
> 
> Cc: stable@vger.kernel.org # v6.19
> Fixes: 8f63bf908213 ("dt-bindings: display: msm: Document the Glymur DiplayPort controller")
> Fixes: 1aee577bbc60 ("dt-bindings: display: msm: Document the Glymur Mobile Display SubSystem")
> Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
> ---
> Did not pick up Dmitry's R-b tag as patches have been squashed
> and commit message re-worded.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof

