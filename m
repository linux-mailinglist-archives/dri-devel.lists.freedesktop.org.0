Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E315365B45F
	for <lists+dri-devel@lfdr.de>; Mon,  2 Jan 2023 16:46:51 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DBD5710E356;
	Mon,  2 Jan 2023 15:46:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com
 [IPv6:2a00:1450:4864:20::335])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A666410E355;
 Mon,  2 Jan 2023 15:46:32 +0000 (UTC)
Received: by mail-wm1-x335.google.com with SMTP id
 k22-20020a05600c1c9600b003d1ee3a6289so20877869wms.2; 
 Mon, 02 Jan 2023 07:46:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=KV4l1PZvtI/O0whJ9bApwDMsPvefMK+G8FG3GsRq98o=;
 b=M60Q3/0uBdWA0S+Tn70fRisxEI7FsEe7EbJbu06TKVycKn3MmDmRhd7+x75BA70GyI
 Et1m+gk9GxwSC2LmSGkINcuQ250VnvmobG9oCJJfqXrtyi1gfX5lkjqqZaHtA9Plcr4/
 DNsExlRZfSt3v+C1Q5SatTqOXRcMKkvO8Bq9pfvSETf9RcHSX+6DKaeXk/4PBp7kqcXZ
 bSlOGjpCnCA9t26zBO6cXE5HZ2C8h1aupHFezw0FiDIV13d9dxicTs/AP9ohcCPM5Iv2
 DoYDVx7sA8NxDUJksUm7M8LCA+NMjOKbFPI0XZtQXMtOntvC98KMgB/gy5twSYH/BdZh
 cD/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=KV4l1PZvtI/O0whJ9bApwDMsPvefMK+G8FG3GsRq98o=;
 b=OS745W4aU18l/car4AcMxyDANYx3R/6qo7ybQCKWQLE6+oAb0A6+0kDtZ/SY2jl9cC
 NBTq5oBhRJmQvIuGAWJX0/G8ZLv0jt3ctQvCuOKIJEHAl++JH9ZVP01ptD45EMeqn8FE
 3coi1xM08KLB27BrxtQ2NgqJI+pysQAl3Ijkyd2+yGRLJBrNt7hoQkKInkDlyWC/7GFv
 oaAxdYsN0lCRJLXWhgMtKgA60jazwyz0dz0ygOh2hQFqgWtUJnnycezNV24aniNKGUjQ
 78JVr+B01QDeorjWrBgenuRAEhXgmYLeTbPl4s6P/sUyCqahL4akJYnpB+Rwi4J25Wmg
 hKjg==
X-Gm-Message-State: AFqh2koMUT3eLl7ndTcAFCBYDyMTJ1dZd6cEuU9JC+m9NimDBpa3AeSz
 IOkF7A4A4YaneOHyqm3QxW0=
X-Google-Smtp-Source: AMrXdXsQ81BRul2q2Jf6iyqzFnhMK8415HhqzggvxHDLMLgqrT92MfTHQSvlBcOjoZVmVxqJkGJk2w==
X-Received: by 2002:a05:600c:54c2:b0:3d3:3c74:dbd0 with SMTP id
 iw2-20020a05600c54c200b003d33c74dbd0mr29031123wmb.13.1672674390957; 
 Mon, 02 Jan 2023 07:46:30 -0800 (PST)
Received: from ?IPV6:2a02:908:1256:79a0:8d77:4e27:bb99:9a97?
 ([2a02:908:1256:79a0:8d77:4e27:bb99:9a97])
 by smtp.gmail.com with ESMTPSA id
 n20-20020a05600c4f9400b003d9b351de26sm6282138wmq.9.2023.01.02.07.46.29
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 02 Jan 2023 07:46:30 -0800 (PST)
Message-ID: <748c7a8f-38e1-53de-27f4-7550cc8c8e4d@gmail.com>
Date: Mon, 2 Jan 2023 16:46:29 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH v3 05/11] drm/amd: Request SDMA microcode during IP
 discovery
Content-Language: en-US
To: Mario Limonciello <mario.limonciello@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>, linux-kernel@vger.kernel.org
References: <20221230052119.15096-1-mario.limonciello@amd.com>
 <20221230052119.15096-6-mario.limonciello@amd.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>
In-Reply-To: <20221230052119.15096-6-mario.limonciello@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
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
Cc: "Pan, Xinhui" <Xinhui.Pan@amd.com>,
 Javier Martinez Canillas <javierm@redhat.com>, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, Carlos Soriano Sanchez <csoriano@redhat.com>,
 christian.koenig@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



Am 30.12.22 um 06:21 schrieb Mario Limonciello:
> If SDMA microcode is not available during early init, the firmware
> framebuffer will have already been released and the screen will
> freeze.
>
> Move the request from SDMA microcode into the IP discovery phase
> so that if it's not available, IP discovery will fail.
>
> Signed-off-by: Mario Limonciello <mario.limonciello@amd.com>
> ---
> v2->v3:
>   * Fix dGPU naming scheme
> ---
>   drivers/gpu/drm/amd/amdgpu/amdgpu_discovery.c | 57 ++++++++++++++++
>   drivers/gpu/drm/amd/amdgpu/amdgpu_sdma.c      |  9 +--
>   drivers/gpu/drm/amd/amdgpu/amdgpu_sdma.h      |  2 +-
>   drivers/gpu/drm/amd/amdgpu/sdma_v4_0.c        | 61 +----------------
>   drivers/gpu/drm/amd/amdgpu/sdma_v5_0.c        | 42 +-----------
>   drivers/gpu/drm/amd/amdgpu/sdma_v5_2.c        | 65 +------------------
>   drivers/gpu/drm/amd/amdgpu/sdma_v6_0.c        | 30 +--------
>   7 files changed, 66 insertions(+), 200 deletions(-)
>
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_discovery.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_discovery.c
> index b719852daa07..24d54ab0963a 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_discovery.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_discovery.c
> @@ -90,6 +90,40 @@ MODULE_FIRMWARE(FIRMWARE_IP_DISCOVERY);
>   #define mmMM_INDEX_HI		0x6
>   #define mmMM_DATA		0x1
>   
> +MODULE_FIRMWARE("amdgpu/navi10_sdma.bin");
> +MODULE_FIRMWARE("amdgpu/navi10_sdma1.bin");
> +MODULE_FIRMWARE("amdgpu/navi14_sdma.bin");
> +MODULE_FIRMWARE("amdgpu/navi14_sdma1.bin");
> +MODULE_FIRMWARE("amdgpu/navi12_sdma.bin");
> +MODULE_FIRMWARE("amdgpu/navi12_sdma1.bin");
> +MODULE_FIRMWARE("amdgpu/cyan_skillfish2_sdma.bin");
> +MODULE_FIRMWARE("amdgpu/cyan_skillfish2_sdma1.bin");
> +MODULE_FIRMWARE("amdgpu/vega10_sdma.bin");
> +MODULE_FIRMWARE("amdgpu/vega10_sdma1.bin");
> +MODULE_FIRMWARE("amdgpu/vega12_sdma.bin");
> +MODULE_FIRMWARE("amdgpu/vega12_sdma1.bin");
> +MODULE_FIRMWARE("amdgpu/vega20_sdma.bin");
> +MODULE_FIRMWARE("amdgpu/vega20_sdma1.bin");
> +MODULE_FIRMWARE("amdgpu/raven_sdma.bin");
> +MODULE_FIRMWARE("amdgpu/picasso_sdma.bin");
> +MODULE_FIRMWARE("amdgpu/raven2_sdma.bin");
> +MODULE_FIRMWARE("amdgpu/arcturus_sdma.bin");
> +MODULE_FIRMWARE("amdgpu/renoir_sdma.bin");
> +MODULE_FIRMWARE("amdgpu/green_sardine_sdma.bin");
> +MODULE_FIRMWARE("amdgpu/aldebaran_sdma.bin");
> +MODULE_FIRMWARE("amdgpu/sienna_cichlid_sdma.bin");
> +MODULE_FIRMWARE("amdgpu/navy_flounder_sdma.bin");
> +MODULE_FIRMWARE("amdgpu/dimgrey_cavefish_sdma.bin");
> +MODULE_FIRMWARE("amdgpu/beige_goby_sdma.bin");
> +MODULE_FIRMWARE("amdgpu/vangogh_sdma.bin");
> +MODULE_FIRMWARE("amdgpu/yellow_carp_sdma.bin");
> +MODULE_FIRMWARE("amdgpu/sdma_5_2_6.bin");
> +MODULE_FIRMWARE("amdgpu/sdma_5_2_7.bin");
> +MODULE_FIRMWARE("amdgpu/sdma_6_0_0.bin");
> +MODULE_FIRMWARE("amdgpu/sdma_6_0_1.bin");
> +MODULE_FIRMWARE("amdgpu/sdma_6_0_2.bin");
> +MODULE_FIRMWARE("amdgpu/sdma_6_0_3.bin");

If we centralize the MODULE_FIRMWARE() requests I think we should rather 
move that to amdgpu_ucode.c instead.

One minor problem is that we considered adding support for disabling 
some hw generations during compilation, but since this never 
materialized we are probably never going to need it.

With the MODULE_FIRMWARE() requests moved feel free to add an Acked-by: 
Christian König <christian.koenig@amd.com> to the series.

Regards,
Christian.

> +
>   static const char *hw_id_names[HW_ID_MAX] = {
>   	[MP1_HWID]		= "MP1",
>   	[MP2_HWID]		= "MP2",
> @@ -1821,8 +1855,26 @@ static int amdgpu_discovery_set_gc_ip_blocks(struct amdgpu_device *adev)
>   	return 0;
>   }
>   
> +static int amdgpu_discovery_load_sdma_fw(struct amdgpu_device *adev, u32 instance,
> +					 const char *chip_name)
> +{
> +	char fw_name[40];
> +
> +	if (instance == 0)
> +		snprintf(fw_name, sizeof(fw_name), "amdgpu/%s.bin", chip_name);
> +	else
> +		snprintf(fw_name, sizeof(fw_name), "amdgpu/%s1.bin", chip_name);
> +
> +	return request_firmware(&adev->sdma.instance[instance].fw, fw_name, adev->dev);
> +}
> +
>   static int amdgpu_discovery_set_sdma_ip_blocks(struct amdgpu_device *adev)
>   {
> +	char ucode_prefix[30];
> +	int i, r;
> +
> +	amdgpu_ucode_ip_version_decode(adev, SDMA0_HWIP, ucode_prefix, sizeof(ucode_prefix));
> +
>   	switch (adev->ip_versions[SDMA0_HWIP][0]) {
>   	case IP_VERSION(4, 0, 0):
>   	case IP_VERSION(4, 0, 1):
> @@ -1862,6 +1914,11 @@ static int amdgpu_discovery_set_sdma_ip_blocks(struct amdgpu_device *adev)
>   			adev->ip_versions[SDMA0_HWIP][0]);
>   		return -EINVAL;
>   	}
> +	for (i = 0; i < adev->sdma.num_instances; i++) {
> +		r = amdgpu_discovery_load_sdma_fw(adev, i, ucode_prefix);
> +		if (r)
> +			return r;
> +	}
>   	return 0;
>   }
>   
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_sdma.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_sdma.c
> index ea5278f094c0..9e46d8034c03 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_sdma.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_sdma.c
> @@ -205,8 +205,7 @@ void amdgpu_sdma_destroy_inst_ctx(struct amdgpu_device *adev,
>   }
>   
>   int amdgpu_sdma_init_microcode(struct amdgpu_device *adev,
> -			       char *fw_name, u32 instance,
> -			       bool duplicate)
> +			       u32 instance, bool duplicate)
>   {
>   	struct amdgpu_firmware_info *info = NULL;
>   	const struct common_firmware_header *header = NULL;
> @@ -214,10 +213,6 @@ int amdgpu_sdma_init_microcode(struct amdgpu_device *adev,
>   	const struct sdma_firmware_header_v2_0 *sdma_hdr;
>   	uint16_t version_major;
>   
> -	err = request_firmware(&adev->sdma.instance[instance].fw, fw_name, adev->dev);
> -	if (err)
> -		goto out;
> -
>   	header = (const struct common_firmware_header *)
>   		adev->sdma.instance[instance].fw->data;
>   	version_major = le16_to_cpu(header->header_version_major);
> @@ -280,7 +275,7 @@ int amdgpu_sdma_init_microcode(struct amdgpu_device *adev,
>   
>   out:
>   	if (err) {
> -		DRM_ERROR("SDMA: Failed to init firmware \"%s\"\n", fw_name);
> +		DRM_ERROR("SDMA: Failed to init sdma firmware\n");
>   		amdgpu_sdma_destroy_inst_ctx(adev, duplicate);
>   	}
>   	return err;
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_sdma.h b/drivers/gpu/drm/amd/amdgpu/amdgpu_sdma.h
> index 7d99205c2e01..07b375e89e83 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_sdma.h
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_sdma.h
> @@ -125,7 +125,7 @@ int amdgpu_sdma_process_ecc_irq(struct amdgpu_device *adev,
>   				      struct amdgpu_irq_src *source,
>   				      struct amdgpu_iv_entry *entry);
>   int amdgpu_sdma_init_microcode(struct amdgpu_device *adev,
> -        char *fw_name, u32 instance, bool duplicate);
> +	u32 instance, bool duplicate);
>   void amdgpu_sdma_destroy_inst_ctx(struct amdgpu_device *adev,
>           bool duplicate);
>   void amdgpu_sdma_unset_buffer_funcs_helper(struct amdgpu_device *adev);
> diff --git a/drivers/gpu/drm/amd/amdgpu/sdma_v4_0.c b/drivers/gpu/drm/amd/amdgpu/sdma_v4_0.c
> index 4d780e4430e7..bbaee1cfc92d 100644
> --- a/drivers/gpu/drm/amd/amdgpu/sdma_v4_0.c
> +++ b/drivers/gpu/drm/amd/amdgpu/sdma_v4_0.c
> @@ -58,20 +58,6 @@
>   #include "amdgpu_ras.h"
>   #include "sdma_v4_4.h"
>   
> -MODULE_FIRMWARE("amdgpu/vega10_sdma.bin");
> -MODULE_FIRMWARE("amdgpu/vega10_sdma1.bin");
> -MODULE_FIRMWARE("amdgpu/vega12_sdma.bin");
> -MODULE_FIRMWARE("amdgpu/vega12_sdma1.bin");
> -MODULE_FIRMWARE("amdgpu/vega20_sdma.bin");
> -MODULE_FIRMWARE("amdgpu/vega20_sdma1.bin");
> -MODULE_FIRMWARE("amdgpu/raven_sdma.bin");
> -MODULE_FIRMWARE("amdgpu/picasso_sdma.bin");
> -MODULE_FIRMWARE("amdgpu/raven2_sdma.bin");
> -MODULE_FIRMWARE("amdgpu/arcturus_sdma.bin");
> -MODULE_FIRMWARE("amdgpu/renoir_sdma.bin");
> -MODULE_FIRMWARE("amdgpu/green_sardine_sdma.bin");
> -MODULE_FIRMWARE("amdgpu/aldebaran_sdma.bin");
> -
>   #define SDMA0_POWER_CNTL__ON_OFF_CONDITION_HOLD_TIME_MASK  0x000000F8L
>   #define SDMA0_POWER_CNTL__ON_OFF_STATUS_DURATION_TIME_MASK 0xFC000000L
>   
> @@ -575,60 +561,17 @@ static void sdma_v4_0_setup_ulv(struct amdgpu_device *adev)
>   // vega10 real chip need to use PSP to load firmware
>   static int sdma_v4_0_init_microcode(struct amdgpu_device *adev)
>   {
> -	const char *chip_name;
> -	char fw_name[30];
>   	int ret, i;
>   
> -	DRM_DEBUG("\n");
> -
> -	switch (adev->ip_versions[SDMA0_HWIP][0]) {
> -	case IP_VERSION(4, 0, 0):
> -		chip_name = "vega10";
> -		break;
> -	case IP_VERSION(4, 0, 1):
> -		chip_name = "vega12";
> -		break;
> -	case IP_VERSION(4, 2, 0):
> -		chip_name = "vega20";
> -		break;
> -	case IP_VERSION(4, 1, 0):
> -	case IP_VERSION(4, 1, 1):
> -		if (adev->apu_flags & AMD_APU_IS_RAVEN2)
> -			chip_name = "raven2";
> -		else if (adev->apu_flags & AMD_APU_IS_PICASSO)
> -			chip_name = "picasso";
> -		else
> -			chip_name = "raven";
> -		break;
> -	case IP_VERSION(4, 2, 2):
> -		chip_name = "arcturus";
> -		break;
> -	case IP_VERSION(4, 1, 2):
> -		if (adev->apu_flags & AMD_APU_IS_RENOIR)
> -			chip_name = "renoir";
> -		else
> -			chip_name = "green_sardine";
> -		break;
> -	case IP_VERSION(4, 4, 0):
> -		chip_name = "aldebaran";
> -		break;
> -	default:
> -		BUG();
> -	}
> -
>   	for (i = 0; i < adev->sdma.num_instances; i++) {
> -		if (i == 0)
> -			snprintf(fw_name, sizeof(fw_name), "amdgpu/%s_sdma.bin", chip_name);
> -		else
> -			snprintf(fw_name, sizeof(fw_name), "amdgpu/%s_sdma%d.bin", chip_name, i);
>   		if (adev->ip_versions[SDMA0_HWIP][0] == IP_VERSION(4, 2, 2) ||
>                       adev->ip_versions[SDMA0_HWIP][0] == IP_VERSION(4, 4, 0)) {
>   			/* Acturus & Aldebaran will leverage the same FW memory
>   			   for every SDMA instance */
> -			ret = amdgpu_sdma_init_microcode(adev, fw_name, 0, true);
> +			ret = amdgpu_sdma_init_microcode(adev, 0, true);
>   			break;
>   		} else {
> -			ret = amdgpu_sdma_init_microcode(adev, fw_name, i, false);
> +			ret = amdgpu_sdma_init_microcode(adev, i, false);
>   			if (ret)
>   				return ret;
>   		}
> diff --git a/drivers/gpu/drm/amd/amdgpu/sdma_v5_0.c b/drivers/gpu/drm/amd/amdgpu/sdma_v5_0.c
> index d4d9f196db83..4154b511ae94 100644
> --- a/drivers/gpu/drm/amd/amdgpu/sdma_v5_0.c
> +++ b/drivers/gpu/drm/amd/amdgpu/sdma_v5_0.c
> @@ -42,18 +42,6 @@
>   #include "sdma_common.h"
>   #include "sdma_v5_0.h"
>   
> -MODULE_FIRMWARE("amdgpu/navi10_sdma.bin");
> -MODULE_FIRMWARE("amdgpu/navi10_sdma1.bin");
> -
> -MODULE_FIRMWARE("amdgpu/navi14_sdma.bin");
> -MODULE_FIRMWARE("amdgpu/navi14_sdma1.bin");
> -
> -MODULE_FIRMWARE("amdgpu/navi12_sdma.bin");
> -MODULE_FIRMWARE("amdgpu/navi12_sdma1.bin");
> -
> -MODULE_FIRMWARE("amdgpu/cyan_skillfish2_sdma.bin");
> -MODULE_FIRMWARE("amdgpu/cyan_skillfish2_sdma1.bin");
> -
>   #define SDMA1_REG_OFFSET 0x600
>   #define SDMA0_HYP_DEC_REG_START 0x5880
>   #define SDMA0_HYP_DEC_REG_END 0x5893
> @@ -237,39 +225,13 @@ static void sdma_v5_0_init_golden_registers(struct amdgpu_device *adev)
>   // emulation only, won't work on real chip
>   // navi10 real chip need to use PSP to load firmware
>   static int sdma_v5_0_init_microcode(struct amdgpu_device *adev)
> -{
> -	const char *chip_name;
> -	char fw_name[40];
> -	int ret, i;
> +{	int ret, i;
>   
>   	if (amdgpu_sriov_vf(adev) && (adev->ip_versions[SDMA0_HWIP][0] == IP_VERSION(5, 0, 5)))
>   		return 0;
>   
> -	DRM_DEBUG("\n");
> -
> -	switch (adev->ip_versions[SDMA0_HWIP][0]) {
> -	case IP_VERSION(5, 0, 0):
> -		chip_name = "navi10";
> -		break;
> -	case IP_VERSION(5, 0, 2):
> -		chip_name = "navi14";
> -		break;
> -	case IP_VERSION(5, 0, 5):
> -		chip_name = "navi12";
> -		break;
> -	case IP_VERSION(5, 0, 1):
> -		chip_name = "cyan_skillfish2";
> -		break;
> -	default:
> -		BUG();
> -	}
> -
>   	for (i = 0; i < adev->sdma.num_instances; i++) {
> -		if (i == 0)
> -			snprintf(fw_name, sizeof(fw_name), "amdgpu/%s_sdma.bin", chip_name);
> -		else
> -			snprintf(fw_name, sizeof(fw_name), "amdgpu/%s_sdma1.bin", chip_name);
> -		ret = amdgpu_sdma_init_microcode(adev, fw_name, i, false);
> +		ret = amdgpu_sdma_init_microcode(adev, i, false);
>   		if (ret)
>   			return ret;
>   	}
> diff --git a/drivers/gpu/drm/amd/amdgpu/sdma_v5_2.c b/drivers/gpu/drm/amd/amdgpu/sdma_v5_2.c
> index 65e7a710298d..4757c119cdfe 100644
> --- a/drivers/gpu/drm/amd/amdgpu/sdma_v5_2.c
> +++ b/drivers/gpu/drm/amd/amdgpu/sdma_v5_2.c
> @@ -44,16 +44,6 @@
>   #include "sdma_common.h"
>   #include "sdma_v5_2.h"
>   
> -MODULE_FIRMWARE("amdgpu/sienna_cichlid_sdma.bin");
> -MODULE_FIRMWARE("amdgpu/navy_flounder_sdma.bin");
> -MODULE_FIRMWARE("amdgpu/dimgrey_cavefish_sdma.bin");
> -MODULE_FIRMWARE("amdgpu/beige_goby_sdma.bin");
> -
> -MODULE_FIRMWARE("amdgpu/vangogh_sdma.bin");
> -MODULE_FIRMWARE("amdgpu/yellow_carp_sdma.bin");
> -MODULE_FIRMWARE("amdgpu/sdma_5_2_6.bin");
> -MODULE_FIRMWARE("amdgpu/sdma_5_2_7.bin");
> -
>   #define SDMA1_REG_OFFSET 0x600
>   #define SDMA3_REG_OFFSET 0x400
>   #define SDMA0_HYP_DEC_REG_START 0x5880
> @@ -89,59 +79,6 @@ static u32 sdma_v5_2_get_reg_offset(struct amdgpu_device *adev, u32 instance, u3
>   	return base + internal_offset;
>   }
>   
> -/**
> - * sdma_v5_2_init_microcode - load ucode images from disk
> - *
> - * @adev: amdgpu_device pointer
> - *
> - * Use the firmware interface to load the ucode images into
> - * the driver (not loaded into hw).
> - * Returns 0 on success, error on failure.
> - */
> -
> -// emulation only, won't work on real chip
> -// navi10 real chip need to use PSP to load firmware
> -static int sdma_v5_2_init_microcode(struct amdgpu_device *adev)
> -{
> -	const char *chip_name;
> -	char fw_name[40];
> -
> -	DRM_DEBUG("\n");
> -
> -	switch (adev->ip_versions[SDMA0_HWIP][0]) {
> -	case IP_VERSION(5, 2, 0):
> -		chip_name = "sienna_cichlid_sdma";
> -		break;
> -	case IP_VERSION(5, 2, 2):
> -		chip_name = "navy_flounder_sdma";
> -		break;
> -	case IP_VERSION(5, 2, 1):
> -		chip_name = "vangogh_sdma";
> -		break;
> -	case IP_VERSION(5, 2, 4):
> -		chip_name = "dimgrey_cavefish_sdma";
> -		break;
> -	case IP_VERSION(5, 2, 5):
> -		chip_name = "beige_goby_sdma";
> -		break;
> -	case IP_VERSION(5, 2, 3):
> -		chip_name = "yellow_carp_sdma";
> -		break;
> -	case IP_VERSION(5, 2, 6):
> -		chip_name = "sdma_5_2_6";
> -		break;
> -	case IP_VERSION(5, 2, 7):
> -		chip_name = "sdma_5_2_7";
> -		break;
> -	default:
> -		BUG();
> -	}
> -
> -	snprintf(fw_name, sizeof(fw_name), "amdgpu/%s.bin", chip_name);
> -
> -	return amdgpu_sdma_init_microcode(adev, fw_name, 0, true);
> -}
> -
>   static unsigned sdma_v5_2_ring_init_cond_exec(struct amdgpu_ring *ring)
>   {
>   	unsigned ret;
> @@ -1288,7 +1225,7 @@ static int sdma_v5_2_sw_init(void *handle)
>   			return r;
>   	}
>   
> -	r = sdma_v5_2_init_microcode(adev);
> +	r = amdgpu_sdma_init_microcode(adev, 0, true);
>   	if (r) {
>   		DRM_ERROR("Failed to load sdma firmware!\n");
>   		return r;
> diff --git a/drivers/gpu/drm/amd/amdgpu/sdma_v6_0.c b/drivers/gpu/drm/amd/amdgpu/sdma_v6_0.c
> index 049c26a45d85..9c65e2f98d44 100644
> --- a/drivers/gpu/drm/amd/amdgpu/sdma_v6_0.c
> +++ b/drivers/gpu/drm/amd/amdgpu/sdma_v6_0.c
> @@ -44,11 +44,6 @@
>   #include "sdma_v6_0.h"
>   #include "v11_structs.h"
>   
> -MODULE_FIRMWARE("amdgpu/sdma_6_0_0.bin");
> -MODULE_FIRMWARE("amdgpu/sdma_6_0_1.bin");
> -MODULE_FIRMWARE("amdgpu/sdma_6_0_2.bin");
> -MODULE_FIRMWARE("amdgpu/sdma_6_0_3.bin");
> -
>   #define SDMA1_REG_OFFSET 0x600
>   #define SDMA0_HYP_DEC_REG_START 0x5880
>   #define SDMA0_HYP_DEC_REG_END 0x589a
> @@ -78,29 +73,6 @@ static u32 sdma_v6_0_get_reg_offset(struct amdgpu_device *adev, u32 instance, u3
>   	return base + internal_offset;
>   }
>   
> -/**
> - * sdma_v6_0_init_microcode - load ucode images from disk
> - *
> - * @adev: amdgpu_device pointer
> - *
> - * Use the firmware interface to load the ucode images into
> - * the driver (not loaded into hw).
> - * Returns 0 on success, error on failure.
> - */
> -static int sdma_v6_0_init_microcode(struct amdgpu_device *adev)
> -{
> -	char fw_name[30];
> -	char ucode_prefix[30];
> -
> -	DRM_DEBUG("\n");
> -
> -	amdgpu_ucode_ip_version_decode(adev, SDMA0_HWIP, ucode_prefix, sizeof(ucode_prefix));
> -
> -	snprintf(fw_name, sizeof(fw_name), "amdgpu/%s.bin", ucode_prefix);
> -
> -	return amdgpu_sdma_init_microcode(adev, fw_name, 0, true);
> -}
> -
>   static unsigned sdma_v6_0_ring_init_cond_exec(struct amdgpu_ring *ring)
>   {
>   	unsigned ret;
> @@ -1260,7 +1232,7 @@ static int sdma_v6_0_sw_init(void *handle)
>   	if (r)
>   		return r;
>   
> -	r = sdma_v6_0_init_microcode(adev);
> +	r = amdgpu_sdma_init_microcode(adev, 0, true);
>   	if (r) {
>   		DRM_ERROR("Failed to load sdma firmware!\n");
>   		return r;

