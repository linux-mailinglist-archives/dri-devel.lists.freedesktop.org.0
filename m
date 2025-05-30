Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 82971AC939F
	for <lists+dri-devel@lfdr.de>; Fri, 30 May 2025 18:33:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C81DE10E26D;
	Fri, 30 May 2025 16:33:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="dcweAjVD";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CA94A10E26D
 for <dri-devel@lists.freedesktop.org>; Fri, 30 May 2025 16:33:44 +0000 (UTC)
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54UBQjYs013722
 for <dri-devel@lists.freedesktop.org>; Fri, 30 May 2025 16:33:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 uCkkqy4vApGz2Fcr6sUFdDKm308UJD0nqqbHUovYzug=; b=dcweAjVDE/LjqPwp
 oTZoLRzOpQtI1JYDCMartltY2c5NB7YMlo/dTDRPndvS7pd9PPQfhgSBch3PEh4H
 oc5W8IPBmxXc8y9f0eJegWB4pykMBiCEZN8j+v7aGdrixd7VyGS2/kjhy0zo0QqA
 XUgfiq0u1OrBVtwV/38j7YZVZ/qTbTyZsx+lQ9ewM1baMS0WsetNFx0znDmQ5qfz
 BRdtzazkc4/gCaP/Gb9+EA695ygVe/1eKNTHi32s/wCYmY4odDJHX8u9qVCsOZJk
 9jXkDDFD0qe9Gq1ZUFCJmTcOm/GSbItFs5zFtondN5eTlNacUbBVYKOzoLNvsXQH
 LTVIag==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com
 [209.85.210.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46wavm3q1g-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Fri, 30 May 2025 16:33:43 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id
 d2e1a72fcca58-742c7227d7dso1768350b3a.2
 for <dri-devel@lists.freedesktop.org>; Fri, 30 May 2025 09:33:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1748622823; x=1749227623;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=uCkkqy4vApGz2Fcr6sUFdDKm308UJD0nqqbHUovYzug=;
 b=hPUfd0oH1C+ghenhsPd9oV65ul0n2UnVdJU1kQp9qNhtVPGRs7CdIqur/yCK+OM4ga
 8IjnG0eu3FqyWJkfcajmSWuROAADTdg066CucL5wIx9L1Lp6rZXpRQBX8cGFvU7pTEoi
 oAA8h/CZ9bYuGcRS+3+ZpYXwQP2y+PF3dAUnZGGtLelmeCjMFnsu/5+xOs6/PgEZLpTv
 AJAs7W9BOX04lBKgC+HT2SkDJaJRwXV2jbQ1V7obHX5sY7Ssn9si2E/3sdI8MVdPZJPt
 fohbr3/AdvLlPq2UHKWoT5kHDw5c8ji4G9ZRLVhmFcox1dktVz+NCWTUcQsvL6AQCW97
 Yu1Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCWxcl8NvhhrCdnzzxVT1VAM0LlOdO6SsqDX7pFz5us8ReYBPzKXNic3Yb+RRNKCHbU/IWTDPGer/bg=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxTxnvvk5CjequvOpqUoizf03EK8UFcjv+3A64qeZ+NdJA6lFD7
 eTmyfJZ2RV9Ca3+BxbX+EpT8+tWW2I5IIWU+LfmosNEZSQyJkY8xTCfNNnoTgaGOBDLSdMdq5Yr
 jllQDrzxnz3uAiNbUJgvtgRhFOaCjWmKhk4CMyQIvEuiqLvE3AbvIvfZ6ZwmuKlabTJQY1IA=
X-Gm-Gg: ASbGncvzx8beAfIdcE3/DWm39de6xe8Z6/BmhkHowSDuM4NByk0ku9R2G0EcZeMJLi6
 FfF3LCrT7eEA+t5US7RDFeuSyoTGN7wSHQR5ZwHE0XRIz3WgkGLwKS7t/YqCXyXru6b46sPsplv
 LmC+ynwPzvbY+O41qIoWfmuRiJxgFYv/zgrWTVtxcq1GiUlJtxlOnzYECl+v6zoP4SpW08NIgmS
 tQNA5K2k5Ayy+ZiMCet3xR0Qd6J070AP2xgxo8VmhAhrNDDor8sk0LV0ANR0bfG25I6jtHVqroj
 Zq4DAoBRameSS5ckhBZ7kPEvAAnv69Xl3qxycL+YG9iM2CQvOkFWd5QDQP2vjmSoLrTr+Jnr
X-Received: by 2002:a05:6a00:2e04:b0:73f:e8c:1aac with SMTP id
 d2e1a72fcca58-747c1a48890mr3832888b3a.2.1748622822624; 
 Fri, 30 May 2025 09:33:42 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFtqNwQxZU0xTr2WITGJuLCEWHrD4jd+DcWqKzqx8uZbn4MTH/bomjNfm/KY2N3fVJbrV50ng==
X-Received: by 2002:a05:6a00:2e04:b0:73f:e8c:1aac with SMTP id
 d2e1a72fcca58-747c1a48890mr3832859b3a.2.1748622822240; 
 Fri, 30 May 2025 09:33:42 -0700 (PDT)
Received: from [10.226.59.182] (i-global254.qualcomm.com. [199.106.103.254])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-747afeab820sm3347905b3a.60.2025.05.30.09.33.39
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 30 May 2025 09:33:41 -0700 (PDT)
Message-ID: <34a9bf5e-34f1-46ee-bebb-96bca551768c@oss.qualcomm.com>
Date: Fri, 30 May 2025 10:33:39 -0600
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 07/10] accel/rocket: Add job submission IOCTL
To: Tomeu Vizoso <tomeu@tomeuvizoso.net>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>,
 Oded Gabbay <ogabbay@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Sumit Semwal <sumit.semwal@linaro.org>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 Sebastian Reichel <sebastian.reichel@collabora.com>,
 Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-doc@vger.kernel.org,
 linux-media@vger.kernel.org, linaro-mm-sig@lists.linaro.org
References: <20250520-6-10-rocket-v5-0-18c9ca0fcb3c@tomeuvizoso.net>
 <20250520-6-10-rocket-v5-7-18c9ca0fcb3c@tomeuvizoso.net>
Content-Language: en-US
From: Jeff Hugo <jeff.hugo@oss.qualcomm.com>
In-Reply-To: <20250520-6-10-rocket-v5-7-18c9ca0fcb3c@tomeuvizoso.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: Gjy_wbnR7egoe8cbsMAnVRYwpMkJ8R9P
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTMwMDE0NiBTYWx0ZWRfX95UOo1kp3j15
 tyS7g+Q9j+W5B3/+26Ea0lROtYLfk9ADkws8yoC2USdT86Zh/vSbZfFx1Vr03Ir9NorQ+0G10EH
 rzfsuiVOD1YUI4uxOKzOFIYnOkTwYNoD3IrzZsOm5JsBFobYErtW5fE0VCXCqokOZ8pmJe4WGzq
 VjmeCna2Ds6SDfTN6waS41dFXLmyuUPGPvCfPyTTqAERc7g4DtyY303ArxpSovc3GC/k0C2z1du
 LWEEM8iIBeAkJv4wAiyjpqWSLDTLmza25fZ4GN2rLJtQQI9W+/oF0DYm6B2KrQr7HxHkmBn/VCH
 6gcqUHNzKW6DRhAPChBrpyiVqhWrEJCHRoPiOL6XntVZ7DdM21PIv+6xhUqa+/JhdfjmjWkPpku
 M99zagAJid0iAT3PgpxIGl0o1vckNOpVbBA4ZBZ2JKDqIbpHuF4TgVQe09132+Qi1Z8c0X9c
X-Authority-Analysis: v=2.4 cv=fMk53Yae c=1 sm=1 tr=0 ts=6839dde7 cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=YifSY7n-Kb6RBMa0OVQA:9
 a=QEXdDO2ut3YA:10 a=IoOABgeZipijB_acs4fv:22
X-Proofpoint-ORIG-GUID: Gjy_wbnR7egoe8cbsMAnVRYwpMkJ8R9P
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-30_07,2025-05-30_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0 impostorscore=0 phishscore=0 suspectscore=0
 spamscore=0 priorityscore=1501 lowpriorityscore=0 clxscore=1015 mlxscore=0
 mlxlogscore=932 bulkscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505160000
 definitions=main-2505300146
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

On 5/20/2025 4:27 AM, Tomeu Vizoso wrote:
> -	version = rocket_pc_read(core, VERSION);
> -	version += rocket_pc_read(core, VERSION_NUM) & 0xffff;
> +	version = rocket_pc_readl(core, VERSION);
> +	version += rocket_pc_readl(core, VERSION_NUM) & 0xffff;

This seems weird.  Feels like an eariler patch introduced a "bug" and 
you are fixing it here.  If so, then shouldn't the origional patch be 
updated?

> +static int
> +rocket_copy_tasks(struct drm_device *dev,
> +		  struct drm_file *file_priv,
> +		  struct drm_rocket_job *job,
> +		  struct rocket_job *rjob)
> +{
> +	struct drm_rocket_task *tasks;
> +	int ret = 0;
> +	int i;
> +
> +	rjob->task_count = job->task_count;
> +
> +	if (!rjob->task_count)
> +		return 0;
> +
> +	tasks = kvmalloc_array(rjob->task_count, sizeof(*tasks), GFP_KERNEL);
> +	if (!tasks) {
> +		ret = -ENOMEM;
> +		drm_dbg(dev, "Failed to allocate incoming tasks\n");
> +		goto fail;
> +	}
> +
> +	if (copy_from_user(tasks,
> +			   (void __user *)(uintptr_t)job->tasks,

u64_to_user_ptr() ?

Same thing down in rocket_ioctl_submit_job()


