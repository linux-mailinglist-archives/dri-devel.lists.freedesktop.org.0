Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +DvCNmVgn2lRagQAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Wed, 25 Feb 2026 21:49:41 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 31AD219D702
	for <lists+dri-devel@lfdr.de>; Wed, 25 Feb 2026 21:49:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1CC3810E22B;
	Wed, 25 Feb 2026 20:49:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="gh5lbDJE";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8E2B010E22B
 for <dri-devel@lists.freedesktop.org>; Wed, 25 Feb 2026 20:49:37 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 3BDAB402C0;
 Wed, 25 Feb 2026 20:49:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 64616C116D0;
 Wed, 25 Feb 2026 20:49:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1772052577;
 bh=Z2XqOHW3E59pFYG8L5zLMGCmRxAtLhSohZFB6TUfHWo=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=gh5lbDJE37p0yE6+rLFJGl2dLfxdBLnhFDfXwPpGgWQAI7EMUPHpN+i59pr1XsgEz
 NdqKBLbhuIlp/GXHetqQ18tyeV0fqVFtPTWTB0zEAMFbPagtKcOYcfbCEP09HAO0xn
 AvK+zlX3A9nV3bqBo+L769Hbr/eWRibAQM60yAG/iNeBFT47VJCsLyUD4HJRowXW5h
 sP35HJSke6gjbzcO8875VMDufJ5hhtk69Mcqjd1PvoHVXe7aEXlOPVNOwsFI3J9wb7
 bkgr6pcf9Ag52fQs0C5DnR/sdepIXLJJfGhqOxe0/jZaNTmvEi9c8M7DgVsWl9eV2z
 vhFmgXnlPxaBg==
Message-ID: <c856ee59-215e-4bb3-a1e2-cd07139275fb@kernel.org>
Date: Wed, 25 Feb 2026 14:49:37 -0600
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V2] accel/amdxdna: Use a different name for latest firmware
To: Lizhi Hou <lizhi.hou@amd.com>, ogabbay@kernel.org,
 quic_jhugo@quicinc.com, dri-devel@lists.freedesktop.org,
 maciej.falkowski@linux.intel.com
Cc: linux-kernel@vger.kernel.org, max.zhen@amd.com, sonal.santan@amd.com
References: <20260225204752.2711734-1-lizhi.hou@amd.com>
Content-Language: en-US
From: "Mario Limonciello (AMD) (kernel.org)" <superm1@kernel.org>
In-Reply-To: <20260225204752.2711734-1-lizhi.hou@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.31 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:lizhi.hou@amd.com,m:ogabbay@kernel.org,m:quic_jhugo@quicinc.com,m:maciej.falkowski@linux.intel.com,m:linux-kernel@vger.kernel.org,m:max.zhen@amd.com,m:sonal.santan@amd.com,s:lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_SENDER(0.00)[superm1@kernel.org,dri-devel-bounces@lists.freedesktop.org];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[kernel.org:+];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	FORGED_SENDER_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	NEURAL_HAM(-0.00)[-0.999];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[superm1@kernel.org,dri-devel-bounces@lists.freedesktop.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[8];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	DBL_BLOCKED_OPENRESOLVER(0.00)[amd.com:email,gitlab.freedesktop.org:url,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns]
X-Rspamd-Queue-Id: 31AD219D702
X-Rspamd-Action: no action



On 2/25/2026 2:47 PM, Lizhi Hou wrote:
> Using legacy driver with latest firmware causes a power off issue.
> 
> Fix this by assigning a different filename (npu_7.sbin) to the latest
> firmware. The driver attempts to load the latest firmware first and falls
> back to the previous firmware version if loading fails.
> 
> Closes: https://gitlab.freedesktop.org/drm/amd/-/issues/5009
> Fixes: f1eac46fe5f7 ("accel/amdxdna: Update firmware version check for latest firmware")
> Signed-off-by: Lizhi Hou <lizhi.hou@amd.com>
Reviewed-by: Mario Limonciello (AMD) <superm1@kernel.org>
> ---
>   drivers/accel/amdxdna/aie2_pci.c        | 20 +++++++++++++++++++-
>   drivers/accel/amdxdna/amdxdna_pci_drv.c |  3 +++
>   drivers/accel/amdxdna/npu1_regs.c       |  2 +-
>   drivers/accel/amdxdna/npu4_regs.c       |  2 +-
>   drivers/accel/amdxdna/npu5_regs.c       |  2 +-
>   drivers/accel/amdxdna/npu6_regs.c       |  2 +-
>   6 files changed, 26 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/accel/amdxdna/aie2_pci.c b/drivers/accel/amdxdna/aie2_pci.c
> index 4b3e6bb97bd2..85079b6fc5d9 100644
> --- a/drivers/accel/amdxdna/aie2_pci.c
> +++ b/drivers/accel/amdxdna/aie2_pci.c
> @@ -32,6 +32,11 @@ static int aie2_max_col = XRS_MAX_COL;
>   module_param(aie2_max_col, uint, 0600);
>   MODULE_PARM_DESC(aie2_max_col, "Maximum column could be used");
>   
> +static char *npu_fw[] = {
> +	"npu_7.sbin",
> +	"npu.sbin"
> +};
> +
>   /*
>    * The management mailbox channel is allocated by firmware.
>    * The related register and ring buffer information is on SRAM BAR.
> @@ -489,6 +494,7 @@ static int aie2_init(struct amdxdna_dev *xdna)
>   	struct psp_config psp_conf;
>   	const struct firmware *fw;
>   	unsigned long bars = 0;
> +	char *fw_full_path;
>   	int i, nvec, ret;
>   
>   	if (!hypervisor_is_type(X86_HYPER_NATIVE)) {
> @@ -503,7 +509,19 @@ static int aie2_init(struct amdxdna_dev *xdna)
>   	ndev->priv = xdna->dev_info->dev_priv;
>   	ndev->xdna = xdna;
>   
> -	ret = request_firmware(&fw, ndev->priv->fw_path, &pdev->dev);
> +	for (i = 0; i < ARRAY_SIZE(npu_fw); i++) {
> +		fw_full_path = kasprintf(GFP_KERNEL, "%s%s", ndev->priv->fw_path, npu_fw[i]);
> +		if (!fw_full_path)
> +			return -ENOMEM;
> +
> +		ret = firmware_request_nowarn(&fw, fw_full_path, &pdev->dev);
> +		kfree(fw_full_path);
> +		if (!ret) {
> +			XDNA_INFO(xdna, "Load firmware %s%s", ndev->priv->fw_path, npu_fw[i]);
> +			break;
> +		}
> +	}
> +
>   	if (ret) {
>   		XDNA_ERR(xdna, "failed to request_firmware %s, ret %d",
>   			 ndev->priv->fw_path, ret);
> diff --git a/drivers/accel/amdxdna/amdxdna_pci_drv.c b/drivers/accel/amdxdna/amdxdna_pci_drv.c
> index 4ada45d06fcf..a4384593bdcc 100644
> --- a/drivers/accel/amdxdna/amdxdna_pci_drv.c
> +++ b/drivers/accel/amdxdna/amdxdna_pci_drv.c
> @@ -23,6 +23,9 @@ MODULE_FIRMWARE("amdnpu/1502_00/npu.sbin");
>   MODULE_FIRMWARE("amdnpu/17f0_10/npu.sbin");
>   MODULE_FIRMWARE("amdnpu/17f0_11/npu.sbin");
>   MODULE_FIRMWARE("amdnpu/17f0_20/npu.sbin");
> +MODULE_FIRMWARE("amdnpu/1502_00/npu_7.sbin");
> +MODULE_FIRMWARE("amdnpu/17f0_10/npu_7.sbin");
> +MODULE_FIRMWARE("amdnpu/17f0_11/npu_7.sbin");
>   
>   /*
>    * 0.0: Initial version
> diff --git a/drivers/accel/amdxdna/npu1_regs.c b/drivers/accel/amdxdna/npu1_regs.c
> index 6f36a27b5a02..6e3d3ca69c04 100644
> --- a/drivers/accel/amdxdna/npu1_regs.c
> +++ b/drivers/accel/amdxdna/npu1_regs.c
> @@ -72,7 +72,7 @@ static const struct aie2_fw_feature_tbl npu1_fw_feature_table[] = {
>   };
>   
>   static const struct amdxdna_dev_priv npu1_dev_priv = {
> -	.fw_path        = "amdnpu/1502_00/npu.sbin",
> +	.fw_path        = "amdnpu/1502_00/",
>   	.rt_config	= npu1_default_rt_cfg,
>   	.dpm_clk_tbl	= npu1_dpm_clk_table,
>   	.fw_feature_tbl = npu1_fw_feature_table,
> diff --git a/drivers/accel/amdxdna/npu4_regs.c b/drivers/accel/amdxdna/npu4_regs.c
> index a8d6f76dde5f..ce25eef5fc34 100644
> --- a/drivers/accel/amdxdna/npu4_regs.c
> +++ b/drivers/accel/amdxdna/npu4_regs.c
> @@ -98,7 +98,7 @@ const struct aie2_fw_feature_tbl npu4_fw_feature_table[] = {
>   };
>   
>   static const struct amdxdna_dev_priv npu4_dev_priv = {
> -	.fw_path        = "amdnpu/17f0_10/npu.sbin",
> +	.fw_path        = "amdnpu/17f0_10/",
>   	.rt_config	= npu4_default_rt_cfg,
>   	.dpm_clk_tbl	= npu4_dpm_clk_table,
>   	.fw_feature_tbl = npu4_fw_feature_table,
> diff --git a/drivers/accel/amdxdna/npu5_regs.c b/drivers/accel/amdxdna/npu5_regs.c
> index c0a35cfd886c..c0ac5daf32ee 100644
> --- a/drivers/accel/amdxdna/npu5_regs.c
> +++ b/drivers/accel/amdxdna/npu5_regs.c
> @@ -63,7 +63,7 @@
>   #define NPU5_SRAM_BAR_BASE	MMNPU_APERTURE1_BASE
>   
>   static const struct amdxdna_dev_priv npu5_dev_priv = {
> -	.fw_path        = "amdnpu/17f0_11/npu.sbin",
> +	.fw_path        = "amdnpu/17f0_11/",
>   	.rt_config	= npu4_default_rt_cfg,
>   	.dpm_clk_tbl	= npu4_dpm_clk_table,
>   	.fw_feature_tbl = npu4_fw_feature_table,
> diff --git a/drivers/accel/amdxdna/npu6_regs.c b/drivers/accel/amdxdna/npu6_regs.c
> index 1fb07df99186..ce591ed0d483 100644
> --- a/drivers/accel/amdxdna/npu6_regs.c
> +++ b/drivers/accel/amdxdna/npu6_regs.c
> @@ -63,7 +63,7 @@
>   #define NPU6_SRAM_BAR_BASE	MMNPU_APERTURE1_BASE
>   
>   static const struct amdxdna_dev_priv npu6_dev_priv = {
> -	.fw_path        = "amdnpu/17f0_10/npu.sbin",
> +	.fw_path        = "amdnpu/17f0_10/",
>   	.rt_config	= npu4_default_rt_cfg,
>   	.dpm_clk_tbl	= npu4_dpm_clk_table,
>   	.fw_feature_tbl = npu4_fw_feature_table,

