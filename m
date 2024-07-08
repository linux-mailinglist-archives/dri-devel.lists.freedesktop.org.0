Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F2024929D60
	for <lists+dri-devel@lfdr.de>; Mon,  8 Jul 2024 09:43:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 58A8F10E268;
	Mon,  8 Jul 2024 07:43:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="YccB7T+J";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4C98310E261
 for <dri-devel@lists.freedesktop.org>; Mon,  8 Jul 2024 07:43:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1720424582; x=1751960582;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=gR2sv2VYvHGEVJeByiF31fIirAGeTcv2VNhnHXYZaJ4=;
 b=YccB7T+JvAnQwsRDIlKv5kzNgb/d+IPaYpZd/hCHQNmTGbEpb4u9nqxA
 D6imSsyOLDz5FDMSpVYXE79uo1EXsTMDNMg8MRt4oDf4vXoua5ojQsjUK
 qJzF/vKI5jUuJnxmbIbTJj9OHXNledxKtGAqO9i8Xk4I/3dhHkYRJwDdG
 MG6q33+LCsqZSAK42HcX9twM9xOhgPT3a40rsQv/5fc0GXKNYMJZp87H2
 rZU+AGi9t5TSVW9kjhhSBF2VEiK4pjFi0lYMpjk2hIv+xM22nMCqrQS0o
 n6FQA1DzbqdFVYqMzEnVxcq/WxVQP2kgPwwDQ+eknbSLi9mU1vvF7WYyC g==;
X-CSE-ConnectionGUID: LyBDtqEgQv6LhZt01S2HBQ==
X-CSE-MsgGUID: tH1//BPhQmukS5v9xOdEzQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11126"; a="17567055"
X-IronPort-AV: E=Sophos;i="6.09,191,1716274800"; d="scan'208";a="17567055"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Jul 2024 00:43:02 -0700
X-CSE-ConnectionGUID: 8OQH5ZjYQ86Xnc0uG9Baow==
X-CSE-MsgGUID: puA4PV+gSDyj6Xi9BWrIKQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,191,1716274800"; d="scan'208";a="47190926"
Received: from jlawryno-mobl.ger.corp.intel.com (HELO [10.246.19.58])
 ([10.246.19.58])
 by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Jul 2024 00:42:59 -0700
Message-ID: <832c27d0-a2ec-46df-afcd-be74b8108358@linux.intel.com>
Date: Mon, 8 Jul 2024 09:42:56 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] accel/ivpu: Add missing MODULE_FIRMWARE metadata
To: "Alexander F. Lent" <lx@xanderlent.com>,
 Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>,
 Oded Gabbay <ogabbay@kernel.org>, Jeffrey Hugo <quic_jhugo@quicinc.com>,
 Daniel Vetter <daniel.vetter@ffwll.ch>,
 Andrzej Kacprowski <andrzej.kacprowski@linux.intel.com>,
 Krystian Pradzynski <krystian.pradzynski@linux.intel.com>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <20240705-fix-ivpu-firmware-metadata-v1-1-704b73852d92@xanderlent.com>
Content-Language: en-US
From: Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>
Organization: Intel Technology Poland sp. z o.o. - ul. Slowackiego 173, 80-298
 Gdansk - KRS 101882 - NIP 957-07-52-316
In-Reply-To: <20240705-fix-ivpu-firmware-metadata-v1-1-704b73852d92@xanderlent.com>
Content-Type: text/plain; charset=UTF-8
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

Hi, thanks for the commit.

On 05.07.2024 13:14, Alexander F. Lent wrote:
> Modules that load firmware from various paths at runtime must declare
> those paths at compile time, via the MODULE_FIRMWARE macro, so that the
> firmware paths are included in the module's metadata.
> 
> The accel/ivpu driver loaded firmware but lacked this metadata,
> preventing dracut from correctly locating firmware files.
> 
> Fixes: 9ab43e95f922 ("accel/ivpu: Switch to generation based FW names")
> Fixes: 02d5b0aacd05 ("accel/ivpu: Implement firmware parsing and booting")
> Signed-off-by: Alexander F. Lent <lx@xanderlent.com>
> ---
>  drivers/accel/ivpu/ivpu_fw.c | 18 ++++++++++++++----
>  1 file changed, 14 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/accel/ivpu/ivpu_fw.c b/drivers/accel/ivpu/ivpu_fw.c
> index 1457300828bf..51792a00b7e3 100644
> --- a/drivers/accel/ivpu/ivpu_fw.c
> +++ b/drivers/accel/ivpu/ivpu_fw.c
> @@ -48,16 +48,26 @@ static char *ivpu_firmware;
>  module_param_named_unsafe(firmware, ivpu_firmware, charp, 0644);
>  MODULE_PARM_DESC(firmware, "NPU firmware binary in /lib/firmware/..");
>  
> +#define IVPU_FW_PATH_37XX_BIN		"vpu_37xx.bin"
> +#define IVPU_FW_PATH_37XX_V0_BIN	"intel/vpu/vpu_37xx_v0.0.bin"
> +#define IVPU_FW_PATH_40XX_BIN		"vpu_40xx.bin"
> +#define IVPU_FW_PATH_40XX_V0_BIN	"intel/vpu/vpu_40xx_v0.0.bin"
> +
>  static struct {
>  	int gen;
>  	const char *name;
>  } fw_names[] = {
> -	{ IVPU_HW_37XX, "vpu_37xx.bin" },
> -	{ IVPU_HW_37XX, "intel/vpu/vpu_37xx_v0.0.bin" },
> -	{ IVPU_HW_40XX, "vpu_40xx.bin" },
> -	{ IVPU_HW_40XX, "intel/vpu/vpu_40xx_v0.0.bin" },
> +	{ IVPU_HW_37XX, IVPU_FW_PATH_37XX_BIN },
> +	{ IVPU_HW_37XX, IVPU_FW_PATH_37XX_V0_BIN },
> +	{ IVPU_HW_40XX, IVPU_FW_PATH_40XX_BIN },
> +	{ IVPU_HW_40XX, IVPU_FW_PATH_40XX_V0_BIN },
>  };
>  
> +MODULE_FIRMWARE(IVPU_FW_PATH_37XX_BIN);
> +MODULE_FIRMWARE(IVPU_FW_PATH_37XX_V0_BIN);
> +MODULE_FIRMWARE(IVPU_FW_PATH_40XX_BIN);
> +MODULE_FIRMWARE(IVPU_FW_PATH_40XX_V0_BIN);
Include only V0 variants, FW names without version are used for development and they wont be included in any distribution.
I would also skip macros and just use literal strings as macros add a lot of lines that don't increase readability.

Regards,
Jacek
