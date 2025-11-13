Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 05ED3C56C8A
	for <lists+dri-devel@lfdr.de>; Thu, 13 Nov 2025 11:16:03 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F0FB610E33C;
	Thu, 13 Nov 2025 10:15:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="f5DuOwsB";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="CX/oVccL";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DA36510E33C
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Nov 2025 10:15:58 +0000 (UTC)
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 5AD6hVsL3801089
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Nov 2025 10:15:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 JvCSjp0KOt/6f6FBApM09wUVTIiEbjk59DEEY4ZXJZM=; b=f5DuOwsBWJ0oPJ+7
 ++1/bYzbYnOZyBwTIJIWwqoyhNJ5WsFSghy5OJPBoG61kMMQiXlg1sGG0njxd/M3
 +I5c9QK50V1RukgWtcZFN60ZxIu7n1XRRJ1DUQJkkyoybnyq/cAFcWp1GD23r5qy
 scktDcFNQip6wHIfZtNU38GveonTYxyONtE+7Qk54yaxRQL4xquX//+7XP5JXfm1
 hyfNp5cYTkRppB/Svc81t+TC+VKy2695vxHIQSUm/RmaR2XjiDjOYzquZxNZTSCA
 Mcp2NOTcMjJnplxn4M6ro3fG9g2y+O5/9q4xjis1X5OEGp9zamXxJ+InSx+1mOZW
 dV7RsA==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com
 [209.85.219.70])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4adaam8nks-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Nov 2025 10:15:57 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id
 6a1803df08f44-8823e9c63c6so2134296d6.0
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Nov 2025 02:15:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1763028957; x=1763633757;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=JvCSjp0KOt/6f6FBApM09wUVTIiEbjk59DEEY4ZXJZM=;
 b=CX/oVccLnhDcJ/QLyLLFEIJAFnMkV0YPFEk9cgwaYVWTR/LjqHJfDp898c+7ZoU8eY
 bA6uQAjllmZosfV6L+K18Y8uLNVQsy2eAaWBO1AjfAHARHfrhgiS5Du0df+aKuYB/1oM
 JsoHW+HC8OEcdnkSzLKbuXDcvsNeqxjrN6xquIp6hKOMupINUbLgk+mnQHVVKbC7IMhZ
 r6dH5y1r6wcabzDkXIj+Fb8O2myI0YCXZ7QseRf8y9NWWmxGkW2sIhO6Fl1Ch4FcT8+i
 slcRQQevXL7eXGbpTcsRuDRoABq+3K/jK4Ku/wX6lkctaOUlQLwqRTFxxqVumFHoR1bz
 nY6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1763028957; x=1763633757;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=JvCSjp0KOt/6f6FBApM09wUVTIiEbjk59DEEY4ZXJZM=;
 b=WqCSn6UgJYawan3/2DBEtcap1HAI58i58hbSGp2104NJbaZzxz40MEQrk0GKwyFVdn
 Wtlv+q3vhWGOY2GxlcssqjdfP5Pt8NLCU0HzDcMFhiARb8K3aR98vVo3ezIAx0adZLkm
 remtq0R2j0M7WMPctJVSg94/HIoTFgLClcQVZ6a8XgxsvChgerE9lHK73mWsa7pWdUDa
 1N37E+t7Ml8WWdChvRy+WKT1qcjc/RQVh3I/ELIATmobjeJPETmE5nBBJzro89Xsq4g9
 DVV8Z0gNfstrselKQzFeiyV4+LVnhaBikgqimNwX5W1hm1MsKi8HLaUDPoOdxaFP1RSd
 yf4g==
X-Forwarded-Encrypted: i=1;
 AJvYcCWoqqT9RAqx72XjwoVWi8OfjK8nCO+LQIH4GIcSuOxrpe4CpmXIDzcce37+Lhnd2dJ8yZVOpzNHs8U=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yx8Tg78LsP7McePUNh69IeVzi6nZxs9V7H2FHqZOzkBD5WBDCET
 zB8PKCjTpxbOKcb0LgzVNVgHdPR+uoeQ3GSovpYlwvHZFa6l8SR+wmhhsycwbgj+T0nxtA5CUaD
 mMbF24VNlSodJzZttNvJQabp33tKdHzuT8nViirU/w8a+j+A0YeF1uU9yKXR0eJFM3e8XAF8=
X-Gm-Gg: ASbGncux7fJRx4YQTLq1Pm4sHEBnMwXh3qWpRRcU/A5RdX5rGw3QejNDrZnbBYzLWe8
 a8GlObGVmyQ9ZiqzLc5/o8zQV8gT1wLv0ONPTWPqANM0hVzX5Ix03ecqr8r1Qln0fdcgi8e9HyK
 DdtG0gX3mnJpyEKu5zBPaLpiZozBJGjNO0o/t2ex99YLl9x6OP4HctpuVKtIpzUrYxTcPzBpsXL
 zWocbh9d5ObRlavLfFzfeMe5fxSyQvj2HZ+VaPfeKl1CMSJVcof2Pn3MgGekIP6pBQg41cjqqqM
 AyZJUDHSA4LNXhhy0mkBcZj3/i0rrG8zIo2141WKWxkdzqkBXNbXxPgJnVlWPqIS3/RYF/iNndE
 58otz8nIbt6FtF0xEwVt74EwFbtttBnpu2QjpcaGKRgEe209eSJVLHcl9
X-Received: by 2002:a05:622a:34e:b0:4e0:b24a:6577 with SMTP id
 d75a77b69052e-4eddbc813a2mr56579981cf.2.1763028957221; 
 Thu, 13 Nov 2025 02:15:57 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHYGGvlMlXA3tlMF/ZtGBm8iwPIdQWTrlzVZ71x0zfbAy4zIV6GAjpA4kAum7jiWgiDmmhH8w==
X-Received: by 2002:a05:622a:34e:b0:4e0:b24a:6577 with SMTP id
 d75a77b69052e-4eddbc813a2mr56579561cf.2.1763028956628; 
 Thu, 13 Nov 2025 02:15:56 -0800 (PST)
Received: from [192.168.119.202] (078088045245.garwolin.vectranet.pl.
 [78.88.45.245]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-6433a3d8775sm1137866a12.5.2025.11.13.02.15.52
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 13 Nov 2025 02:15:56 -0800 (PST)
Message-ID: <aff7043c-0029-433c-9340-22718909e583@oss.qualcomm.com>
Date: Thu, 13 Nov 2025 11:15:51 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 13/21] drm/msm/adreno: Introduce A8x GPU Support
To: Akhil P Oommen <akhilpo@oss.qualcomm.com>,
 Rob Clark <robin.clark@oss.qualcomm.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, Sean Paul <sean@poorly.run>,
 Dmitry Baryshkov <lumag@kernel.org>, Abhinav Kumar
 <abhinav.kumar@linux.dev>, Jessica Zhang <jesszhan0024@gmail.com>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Jonathan Marek <jonathan@marek.ca>, Jordan Crouse
 <jordan@cosmicpenguin.net>,
 Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
 Joerg Roedel <joro@8bytes.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Connor Abbott <cwabbott0@gmail.com>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 linux-arm-kernel@lists.infradead.org, iommu@lists.linux.dev,
 devicetree@vger.kernel.org
References: <20251110-kaana-gpu-support-v2-0-bef18acd5e94@oss.qualcomm.com>
 <20251110-kaana-gpu-support-v2-13-bef18acd5e94@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20251110-kaana-gpu-support-v2-13-bef18acd5e94@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTEzMDA3NSBTYWx0ZWRfX/IINlAps0VEJ
 x4Yoky3n5HwYmLLG7LyH+HbTyrZzyC3oz58lFRVpqyYbpokYLL+XeNg+BHirNNNf/GYT1nFhgUM
 5/aOj2urfOPaIDnVyx6L2hvoP9uH87Ts5KWZMUNpWSeL05nE3g7ruzvuXM+GYVSgD58VzT9INEv
 /hDtW/VqrRxEDGYJugv8eXwhKbY3MuklZDp7yjU8mCI1iraa0RH1rZLnFm+U1wqvDuMAa/JefYd
 cVgyOSqfSsSMHSn5ZbXZzZ4SsXhdCHbR+Oc1am9dUEpM/KFJgbuH3qKkxFPoq9hGKcu1t+WwFH+
 LiRI+k/rl+iUTfdGMU990xq0ZaMHwkBe6+7mvZWQLWxwz8hO0w9I4TLhGd8WWb+DdQzMVvRQ5wx
 BCEUwxKbfGVdQeqjaiHvTSLu0cRtng==
X-Authority-Analysis: v=2.4 cv=d4f4CBjE c=1 sm=1 tr=0 ts=6915afdd cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=WeZqmzoOQpb_IxObF4IA:9
 a=QEXdDO2ut3YA:10 a=iYH6xdkBrDN1Jqds4HTS:22
X-Proofpoint-ORIG-GUID: 7l_peii31ai6dbV3UUAtKYEhADSc5CS8
X-Proofpoint-GUID: 7l_peii31ai6dbV3UUAtKYEhADSc5CS8
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-13_01,2025-11-12_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 bulkscore=0 priorityscore=1501 malwarescore=0
 phishscore=0 suspectscore=0 spamscore=0 adultscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511130075
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

On 11/10/25 5:37 PM, Akhil P Oommen wrote:
> A8x is the next generation of Adreno GPUs, featuring a significant
> hardware design change. A major update to the design is the introduction
> of Slice architecture. Slices are sort of mini-GPUs within the GPU which
> are more independent in processing Graphics and compute workloads. Also,
> in addition to the BV and BR pipe we saw in A7x, CP has more concurrency
> with additional pipes.
> 
> From a software interface perspective, these changes have a significant
> impact on the KMD side. First, the GPU register space has been extensively
> reorganized. Second, to avoid  a register space explosion caused by the
> new slice architecture and additional pipes, many registers are now
> virtualized, instead of duplicated as in A7x. KMD must configure an
> aperture register with the appropriate slice and pipe ID before accessing
> these virtualized registers.
> 
> This patch adds only a skeleton support for the A8x family. An A8x GPU
> support will be added in an upcoming patch.
> 
> Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
> ---

[...]

> +static void a8xx_aperture_slice_set(struct msm_gpu *gpu, enum adreno_pipe pipe, u32 slice)
> +{
> +	struct adreno_gpu *adreno_gpu = to_adreno_gpu(gpu);
> +	struct a6xx_gpu *a6xx_gpu = to_a6xx_gpu(adreno_gpu);
> +	u32 val;
> +
> +	val = A8XX_CP_APERTURE_CNTL_HOST_PIPEID(pipe) | A8XX_CP_APERTURE_CNTL_HOST_SLICEID(slice);

There's also a BIT(23) value here which is seemingly never set, but
perhaps may come in useful for the bigger GPU

> +
> +	if (a6xx_gpu->cached_aperture == val)
> +		return;
> +
> +	gpu_write(gpu, REG_A8XX_CP_APERTURE_CNTL_HOST, val);
> +
> +	a6xx_gpu->cached_aperture = val;
> +}
> +
> +static void a8xx_aperture_aquire(struct msm_gpu *gpu, enum adreno_pipe pipe, unsigned long *flags)

"acquire"

> +{
> +	struct adreno_gpu *adreno_gpu = to_adreno_gpu(gpu);
> +	struct a6xx_gpu *a6xx_gpu = to_a6xx_gpu(adreno_gpu);
> +
> +	spin_lock_irqsave(&a6xx_gpu->aperture_lock, *flags);
> +
> +	a8xx_aperture_slice_set(gpu, pipe, 0);

Maybe we can add "unsigned long flags[MAX_NUM_SLICES]" to a6xx_gpu
to make the API a little more ergonomic.. but maybe that's too much
IDK

[...]

> +	a6xx_gpu->slice_mask = a6xx_llc_read(a6xx_gpu,
> +			REG_A8XX_CX_MISC_SLICE_ENABLE_FINAL) & GENMASK(3, 0);

Please define that field in the XML

[...]

> +}
> +
> +static u32 a8xx_get_first_slice(struct a6xx_gpu *a6xx_gpu)
> +{
> +	return ffs(a6xx_gpu->slice_mask) - 1;
> +}
> +
> +static inline bool _a8xx_check_idle(struct msm_gpu *gpu)
> +{
> +	struct adreno_gpu *adreno_gpu = to_adreno_gpu(gpu);
> +	struct a6xx_gpu *a6xx_gpu = to_a6xx_gpu(adreno_gpu);
> +
> +	/* Check that the GMU is idle */
> +	if (!a6xx_gmu_isidle(&a6xx_gpu->gmu))
> +		return false;
> +
> +	/* Check that the CX master is idle */
> +	if (gpu_read(gpu, REG_A8XX_RBBM_STATUS) &
> +			~A8XX_RBBM_STATUS_CP_AHB_BUSY_CX_MASTER)
> +		return false;
> +
> +	return !(gpu_read(gpu, REG_A8XX_RBBM_INT_0_STATUS) &
> +		A6XX_RBBM_INT_0_MASK_RBBM_HANG_DETECT);

Odd parenthesis-alignment (couple times in the file), checkpatch
usually mumbles at that

[...]

> +
> +void a8xx_flush(struct msm_gpu *gpu, struct msm_ringbuffer *ring)
> +{
> +	struct adreno_gpu *adreno_gpu = to_adreno_gpu(gpu);
> +	struct a6xx_gpu *a6xx_gpu = to_a6xx_gpu(adreno_gpu);
> +	uint32_t wptr;
> +	unsigned long flags;
> +
> +	spin_lock_irqsave(&ring->preempt_lock, flags);
> +
> +	/* Copy the shadow to the actual register */
> +	ring->cur = ring->next;
> +
> +	/* Make sure to wrap wptr if we need to */
> +	wptr = get_wptr(ring);
> +
> +	/* Update HW if this is the current ring and we are not in preempt*/
> +	if (!a6xx_in_preempt(a6xx_gpu)) {
> +		if (a6xx_gpu->cur_ring == ring)
> +			gpu_write(gpu, REG_A6XX_CP_RB_WPTR, wptr);

I think this should use _fenced too, but I guess the preempt detail
is just a harmless copypasta

[...]

> +static void a8xx_set_hwcg(struct msm_gpu *gpu, bool state)
> +{
> +	struct adreno_gpu *adreno_gpu = to_adreno_gpu(gpu);
> +	struct a6xx_gpu *a6xx_gpu = to_a6xx_gpu(adreno_gpu);
> +	struct a6xx_gmu *gmu = &a6xx_gpu->gmu;
> +	u32 val;
> +
> +	gmu_write(gmu, REG_A6XX_GPU_GMU_AO_GMU_CGC_MODE_CNTL,
> +			state ? adreno_gpu->info->a6xx->gmu_cgc_mode : 0);
> +	gmu_write(gmu, REG_A6XX_GPU_GMU_AO_GMU_CGC_DELAY_CNTL,
> +			state ? 0x110111 : 0);

a840 sets this, a830 sets 0x10111, please confirm which way x2 skews

> +	gmu_write(gmu, REG_A6XX_GPU_GMU_AO_GMU_CGC_HYST_CNTL,
> +			state ? 0x55555 : 0);
> +
> +	gpu_write(gpu, REG_A8XX_RBBM_CLOCK_CNTL_GLOBAL, 1);
> +	gpu_write(gpu, REG_A8XX_RBBM_CGC_GLOBAL_LOAD_CMD, state ? 1 : 0);

!!state

[...]

> +static void a8xx_nonctxt_config(struct msm_gpu *gpu, u32 *gmem_protect)
> +{
> +	struct adreno_gpu *adreno_gpu = to_adreno_gpu(gpu);
> +	const struct a6xx_info *info = adreno_gpu->info->a6xx;
> +	const struct adreno_reglist_pipe *regs = info->nonctxt_reglist;
> +	unsigned int pipe_id, i;
> +	unsigned long flags;
> +
> +	for (pipe_id = PIPE_NONE; pipe_id <= PIPE_DDE_BV; pipe_id++) {
> +		/* We don't have support for LPAC yet */
> +		if (pipe_id == PIPE_LPAC)
> +			continue;

This seems arbitrary - one because there are no defines targetting PIPE_LPAC
specifcally in the reg lists you shared and two because it would almost
certainly not hurt to configure these registers and otherwise not power up
the LPAC pipeline

> +
> +		a8xx_aperture_aquire(gpu, pipe_id, &flags);
> +
> +		for (i = 0; regs[i].offset; i++) {
> +			if (!(BIT(pipe_id) & regs[i].pipe))
> +				continue;
> +
> +			if (regs[i].offset == REG_A8XX_RB_GC_GMEM_PROTECT)
> +				*gmem_protect = regs[i].value;
> +
> +			gpu_write(gpu, regs[i].offset, regs[i].value);
> +		}
> +
> +		a8xx_aperture_release(gpu, flags);
> +	}
> +
> +	a8xx_aperture_clear(gpu);
> +}
> +
> +static int a8xx_cp_init(struct msm_gpu *gpu)
> +{
> +	struct msm_ringbuffer *ring = gpu->rb[0];
> +	u32 mask;
> +
> +	/* Disable concurrent binning before sending CP init */
> +	OUT_PKT7(ring, CP_THREAD_CONTROL, 1);
> +	OUT_RING(ring, BIT(27));
> +
> +	OUT_PKT7(ring, CP_ME_INIT, 4);
> +
> +	/* Use multiple HW contexts */
> +	mask = BIT(0);
> +
> +	/* Enable error detection */
> +	mask |= BIT(1);
> +
> +	/* Set default reset state */
> +	mask |= BIT(3);
> +
> +	/* Disable save/restore of performance counters across preemption */
> +	mask |= BIT(6);
> +
> +	OUT_RING(ring, mask);
> +
> +	/* Enable multiple hardware contexts */
> +	OUT_RING(ring, 0x00000003);
> +
> +	/* Enable error detection */
> +	OUT_RING(ring, 0x20000000);
> +
> +	/* Operation mode mask */
> +	OUT_RING(ring, 0x00000002);

Should we include the pwrup reglist from the get-go too? I don't think
you used the ones you declared in patch 15 (or at least my ctrl-f can't
find the use of it)

[...]

> +#define A8XX_CP_INTERRUPT_STATUS_MASK_PIPE \
> +	(A8XX_CP_INTERRUPT_STATUS_MASK_PIPE_CSFRBWRAP | \
> +	 A8XX_CP_INTERRUPT_STATUS_MASK_PIPE_CSFIB1WRAP | \
> +	 A8XX_CP_INTERRUPT_STATUS_MASK_PIPE_CSFIB2WRAP | \
> +	 A8XX_CP_INTERRUPT_STATUS_MASK_PIPE_CSFIB3WRAP | \
> +	 A8XX_CP_INTERRUPT_STATUS_MASK_PIPE_CSFSDSWRAP | \
> +	 A8XX_CP_INTERRUPT_STATUS_MASK_PIPE_CSFMRBWRAP | \
> +	 A8XX_CP_INTERRUPT_STATUS_MASK_PIPE_CSFVSDWRAP | \
> +	 A8XX_CP_INTERRUPT_STATUS_MASK_PIPE_OPCODEERROR | \
> +	 A8XX_CP_INTERRUPT_STATUS_MASK_PIPE_VSDPARITYERROR | \
> +	 A8XX_CP_INTERRUPT_STATUS_MASK_PIPE_REGISTERPROTECTIONERROR | \
> +	 A8XX_CP_INTERRUPT_STATUS_MASK_PIPE_ILLEGALINSTRUCTION | \
> +	 A8XX_CP_INTERRUPT_STATUS_MASK_PIPE_SMMUFAULT | \
> +	 A8XX_CP_INTERRUPT_STATUS_MASK_PIPE_VBIFRESP | \

kgsl also enables VBIFRESTP(TYPE/READ/LIENT)

[...]

> +	/* Setup GMEM Range in UCHE */
> +	gmem_range_min = SZ_64M;

this doesn't seem to ever change, you can inline it

[...]

> +static void a8xx_dump(struct msm_gpu *gpu)
> +{
> +	DRM_DEV_INFO(&gpu->pdev->dev, "status:   %08x\n",
> +			gpu_read(gpu, REG_A8XX_RBBM_STATUS));

This can be a single line

Konrad
