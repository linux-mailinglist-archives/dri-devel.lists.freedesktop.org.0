Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oNYuGcmAqGmYvAAAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Wed, 04 Mar 2026 19:58:17 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D51E8206BA4
	for <lists+dri-devel@lfdr.de>; Wed, 04 Mar 2026 19:58:16 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 216F310EA5A;
	Wed,  4 Mar 2026 18:58:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="AwB8CcU3";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 96D2510EA5A;
 Wed,  4 Mar 2026 18:58:14 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 53E0644387;
 Wed,  4 Mar 2026 18:58:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8D7E9C4CEF7;
 Wed,  4 Mar 2026 18:57:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1772650694;
 bh=pu3OJFJuXTN1mbkxo4zJRrJEcUuyxNxIUZrmOglqj/c=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=AwB8CcU3+sXaDNelrTNcdKED5BuooBcptyjoz9pyiIDJlix/dUrVlBRAtY2KBDSD7
 h6KrDy4b73ZJdvM4hktgVTAjTX6zRTc+gvSTQ/5RottG6nhL+D3O/QjhQk8OWJVt2/
 MvKM3oW0h8rAaH+Xy1nyrLgibke4pf8Ytw146llNQq7shcJlSKiDHrM6C9X7NfmYak
 j4f0yovpFJlvkk+d+Ppu2se2Y2B54cqTv7SCSCMtvTuyxvwIBBCn9Oi3G8xndWyLtN
 BQYRKVOwWfHkMT/8IdaQvAWQhI9w2L1pW92h2u/lnv7UgDWNOHQ2tQ439iGinuyOqk
 Kz5iPPq8G9rwQ==
Date: Wed, 4 Mar 2026 12:57:43 -0600
From: Bjorn Andersson <andersson@kernel.org>
To: Ritesh Kumar <quic_riteshk@quicinc.com>
Cc: robin.clark@oss.qualcomm.com, lumag@kernel.org, 
 abhinav.kumar@linux.dev, sean@poorly.run, marijn.suijten@somainline.org, 
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 airlied@gmail.com, 
 simona@ffwll.ch, robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
 quic_mahap@quicinc.com, konradybcio@kernel.org, mani@kernel.org, 
 James.Bottomley@hansenpartnership.com, martin.petersen@oracle.com,
 vkoul@kernel.org, kishon@kernel.org, 
 cros-qcom-dts-watchers@chromium.org, linux-phy@lists.infradead.org,
 linux-arm-msm@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-scsi@vger.kernel.org,
 quic_vproddut@quicinc.com
Subject: Re: [PATCH v4 1/2] dt-bindings: phy: qcom-edp: Add reference clock
 for sa8775p eDP PHY
Message-ID: <gurq34svc5p52bqx5qwkgjmschzcbklmssjzmu2tg5wzgppkft@c6nrw2ageyp2>
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
X-Rspamd-Queue-Id: D51E8206BA4
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
	RCPT_COUNT_TWELVE(0.00)[30];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[oss.qualcomm.com,kernel.org,linux.dev,poorly.run,somainline.org,linux.intel.com,suse.de,gmail.com,ffwll.ch,quicinc.com,hansenpartnership.com,oracle.com,chromium.org,lists.infradead.org,vger.kernel.org,lists.freedesktop.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	FROM_NEQ_ENVFROM(0.00)[andersson@kernel.org,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel,dt];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:rdns,gabe.freedesktop.org:helo,quicinc.com:email]
X-Rspamd-Action: no action

On Wed, Jan 28, 2026 at 05:18:49PM +0530, Ritesh Kumar wrote:
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

Is there any reason why you didn't follow up on this patch Ritesh?
Looks like it's ready to be merged.

Reviewed-by: Bjorn Andersson <andersson@kernel.org>

Regards,
Bjorn

> ---
>  .../devicetree/bindings/display/msm/qcom,sa8775p-mdss.yaml  | 6 ++++--
>  Documentation/devicetree/bindings/phy/qcom,edp-phy.yaml     | 1 +
>  2 files changed, 5 insertions(+), 2 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/display/msm/qcom,sa8775p-mdss.yaml b/Documentation/devicetree/bindings/display/msm/qcom,sa8775p-mdss.yaml
> index e2730a2f25cf..6c827cf9692b 100644
> --- a/Documentation/devicetree/bindings/display/msm/qcom,sa8775p-mdss.yaml
> +++ b/Documentation/devicetree/bindings/display/msm/qcom,sa8775p-mdss.yaml
> @@ -200,9 +200,11 @@ examples:
>                    <0x0aec2000 0x1c8>;
>  
>              clocks = <&dispcc0 MDSS_DISP_CC_MDSS_DPTX0_AUX_CLK>,
> -                     <&dispcc0 MDSS_DISP_CC_MDSS_AHB_CLK>;
> +                     <&dispcc0 MDSS_DISP_CC_MDSS_AHB_CLK>,
> +                     <&gcc GCC_EDP_REF_CLKREF_EN>;
>              clock-names = "aux",
> -                          "cfg_ahb";
> +                          "cfg_ahb",
> +                          "ref";
>  
>              #clock-cells = <1>;
>              #phy-cells = <0>;
> diff --git a/Documentation/devicetree/bindings/phy/qcom,edp-phy.yaml b/Documentation/devicetree/bindings/phy/qcom,edp-phy.yaml
> index 4a1daae3d8d4..0bf8bf4f66ac 100644
> --- a/Documentation/devicetree/bindings/phy/qcom,edp-phy.yaml
> +++ b/Documentation/devicetree/bindings/phy/qcom,edp-phy.yaml
> @@ -74,6 +74,7 @@ allOf:
>          compatible:
>            enum:
>              - qcom,glymur-dp-phy
> +            - qcom,sa8775p-edp-phy
>              - qcom,x1e80100-dp-phy
>      then:
>        properties:
> -- 
> 2.34.1
> 
