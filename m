Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6FBCIDEFn2mZYgQAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Wed, 25 Feb 2026 15:20:33 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D0AE31989FE
	for <lists+dri-devel@lfdr.de>; Wed, 25 Feb 2026 15:20:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1583010E08F;
	Wed, 25 Feb 2026 14:20:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="lCLZuHlf";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Hde8A0Mj";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D9AF910E08F
 for <dri-devel@lists.freedesktop.org>; Wed, 25 Feb 2026 14:20:27 +0000 (UTC)
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 61P9SiKE1088217
 for <dri-devel@lists.freedesktop.org>; Wed, 25 Feb 2026 14:20:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 EtyOE2hUVljy+kbFE5PibxyFcc/R7aXCK4PQrjUFn2o=; b=lCLZuHlf8TyAjJm3
 u3rme9fFAEMEi7u536FDPUL5nlAy5jiQp4VpF1GwY2/RJhELgyk1DwwPJRciUo9f
 G6UtslgOw5RylV8+vIzZxzMkscSgIcWthwhfKep4VCv3qiZH2jlFNOMtWoa46lcX
 6KcSkfDa2N+ZoxRrbkVfKOoXzCQaocEd0HhJDFA+sXLsHChPj9nrDPFepT1nqWVI
 IZ36rErEHBHfnY7GWhBi1tYt4FOiBTs7/fvZPcQLxGXvO1vVknuj6NlwUVlasWB5
 3wFujOQ6K2RIpoDNlYCvW7z0Q1Es0jss86QZ/6e/PluRBy/m1UvZ3r/40OqsZ3/M
 2XHL/g==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com
 [209.85.214.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4chh47378q-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Wed, 25 Feb 2026 14:20:27 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id
 d9443c01a7336-2adcab21141so10539525ad.2
 for <dri-devel@lists.freedesktop.org>; Wed, 25 Feb 2026 06:20:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1772029226; x=1772634026;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=EtyOE2hUVljy+kbFE5PibxyFcc/R7aXCK4PQrjUFn2o=;
 b=Hde8A0MjDeVjpiHm5M6T1c2sjMtDy6H+EjaHKboWjsjz2qIjgRdm2gGXfGOwOwCa6o
 7OixN+HgfWLgoMoYvVgQcyUW52zSNVegY1BTh7JmyWNWmsoyjQvzuWRhwKrkCuGUu3Gu
 kwjgts19vd7q8UI2NoKu6PrtGJI8e/aWs/388koSEdwI6t0anWPm/7F6s9e2le4lxWwj
 f9hsALGIZiDOJF5iuaJ/UwaNuq/dXjVAXPfwjXQ8DKJMyg6bgMnOghnBsXZIOCBkR+/S
 uNHI5GSz+wwy2ZIE0YTK6u96feiW/lP04MS+MFq1J3uXH1jNoNQAic/k+kWy5Y8voAI3
 LnKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1772029226; x=1772634026;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=EtyOE2hUVljy+kbFE5PibxyFcc/R7aXCK4PQrjUFn2o=;
 b=je6OUUnOAfqujn0mU2sFPIUbSt3qVH92BlZoN5uwlpPyP+6OffZNKz48//7Lg+UIyx
 xb611zh0SkvCOgs8QXakmZVhAdsOvKqhKOov9VSYAZ4VBEklVB+QULr60jv3hGHTOizx
 5mgG/XJ6YbEUlv22Ylyq7caf/3DOoGYvQ/xMy2lf4SLELaa/bFUEv2yBKw87w8vcLv6L
 3PSvX3q6BBlxSJP6EtFdj3m7UzZo4vKjbTCgi/St3AF3d76d0WMcWGqv0Fz/eVKkWCG9
 NySRFsIhJ13ez+GVxiRA4slu5GxUEHzXtPH4MXuIFJrZtDho9/ZuVGR6O3E6RKJ7M9im
 FMLw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWCevySq1JF0HTH0cBPdsNPUlq/2pGsxJwAmLHNv5o6TiaRuh7KY+uLJrR4VIE5N38cNpUWgNEeQPI=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxBNO5XH8Yg2fb0Js0Ovy7Wy06HLuK3j3dQ1iiaP/Eie7zIkOsO
 Rb3oiWn1++eGqIhFn0iS1rxKMd/YjZvpLLvN4BXu8tQcv3yxpKe+EvDARNspXAQZw5n03aCF3eu
 AZCrRP9SGpYu1v1Z6kzEXTYzbVQdLa1Q4Byb5uC2Z3vWgbNQp+x2W4v1fgxS+k+nOMmoMurU=
X-Gm-Gg: ATEYQzwkZLRfzcVjb064xOVaLUWErogDUmYp0vjvqVUaE3KSC2MK9kYrncpxsJ3LcNJ
 eru3UV7Y02Uw43upAQad/IhQ6VEuY/EspxUDjzO3+BGaEyWDGK6YqCnwwz+Ea7J/iaGh6O/g44n
 y/s+ACxNSCFc5/sv6WgCZOCjuV5RgtnHqESr4YOS95lgdCsbo7iogCtq52yGn4P6kS1hBKjMnHW
 yEaO8aYPv77DrloLCwVjbp9gyx6d/v92Pzy/pob7qea3KOdiO6Ky9dCwtaZiIsnjrJ2aBhIBAFE
 1ylyk1zlLxPAFiUm2XarMHV7iHodyueBkehmSX5vf+ws0ZNM+dMwPXd1/bCpSTS6E1KLgOu9BjP
 HkRHQu+9KWmq7NCpkhaqQdzkThfSY2nHvVUWkhSOnKHoXw8RV8JY=
X-Received: by 2002:a17:902:d485:b0:2a9:2ab2:e50d with SMTP id
 d9443c01a7336-2ade9aa21a7mr3608595ad.51.1772029226518; 
 Wed, 25 Feb 2026 06:20:26 -0800 (PST)
X-Received: by 2002:a17:902:d485:b0:2a9:2ab2:e50d with SMTP id
 d9443c01a7336-2ade9aa21a7mr3608015ad.51.1772029225935; 
 Wed, 25 Feb 2026 06:20:25 -0800 (PST)
Received: from [192.168.1.5] ([171.61.227.247])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2ad74f5e55dsm142051345ad.30.2026.02.25.06.20.18
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 25 Feb 2026 06:20:25 -0800 (PST)
Message-ID: <b6519bfc-7931-4985-aaf1-1aaf1fe5aa88@oss.qualcomm.com>
Date: Wed, 25 Feb 2026 19:50:17 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC 02/18] accel/qda: Add Qualcomm DSP accelerator driver
 skeleton
To: Bjorn Andersson <andersson@kernel.org>
Cc: Oded Gabbay <ogabbay@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
 Shuah Khan <skhan@linuxfoundation.org>, Joerg Roedel <joro@8bytes.org>,
 Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Sumit Semwal <sumit.semwal@linaro.org>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 dri-devel@lists.freedesktop.org, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 iommu@lists.linux.dev, linux-media@vger.kernel.org,
 linaro-mm-sig@lists.linaro.org,
 Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>,
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
 Bharath Kumar <quic_bkumar@quicinc.com>,
 Chenna Kesava Raju <quic_chennak@quicinc.com>
References: <20260224-qda-firstpost-v1-0-fe46a9c1a046@oss.qualcomm.com>
 <20260224-qda-firstpost-v1-2-fe46a9c1a046@oss.qualcomm.com>
 <elu44euja7d7nnnhdmdqgof76646b3m3isjmws5pr274gqhy2a@dbeq4hk74ebo>
Content-Language: en-US
From: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
In-Reply-To: <elu44euja7d7nnnhdmdqgof76646b3m3isjmws5pr274gqhy2a@dbeq4hk74ebo>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: a5gexYlHo8EgPGXBvMiv9AV06dyHCh1_
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjI1MDEzNyBTYWx0ZWRfX2U+yPfN1zwd1
 P66s51kWmu2rOFJ/i1DWyDxZpA0KPCZicdhh8sZCadmDhCSbzV+DTipbQACuSBzQ74Zj6oVnO3x
 0+u/8x44ND0K/dma7p9P6BA9iCcellzm3dUdGO6zRHlO2oiU8rXROIvdcQcOCEadOtfXOqN1urD
 ho3fD+JDLwsvlT3bRPWEdkBsw2y17XZATkniUFchJwac4tXTHotoRJdZp6VgTB1FcIp7cLLZQWa
 amngUom1iuleNhqbUu8JqdfUvpUl2SSQPV70Fw7QAPANKRTKWtuBRpOskijQUtoWH02LIkHT5C3
 yPGQbfi+4QxXdTSLP+uzR15Me7wGLY5E8SP9/1XXz8y4ehl2pwd/QMBgbhcn6jWnpLsu53MzBPt
 hUk2+hQDz+5zERjQQyA5w0WgwPldUV5l4mtIutlVRuLYGbHEKb88WZkkHdzgNkQh1yBxIySIvWW
 UqTqNg+5QS5Kx26saxQ==
X-Authority-Analysis: v=2.4 cv=fvDRpV4f c=1 sm=1 tr=0 ts=699f052b cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=CLJ8B99oKJtQbdnoKiLypA==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=tV0izz4fD985yFSgC6wA:9 a=QEXdDO2ut3YA:10 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-GUID: a5gexYlHo8EgPGXBvMiv9AV06dyHCh1_
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-25_01,2026-02-25_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 lowpriorityscore=0 malwarescore=0 priorityscore=1501
 impostorscore=0 adultscore=0 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2602130000
 definitions=main-2602250137
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
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:andersson@kernel.org,m:ogabbay@kernel.org,m:corbet@lwn.net,m:skhan@linuxfoundation.org,m:joro@8bytes.org,m:will@kernel.org,m:robin.murphy@arm.com,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:tzimmermann@suse.de,m:airlied@gmail.com,m:simona@ffwll.ch,m:sumit.semwal@linaro.org,m:christian.koenig@amd.com,m:linux-doc@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:iommu@lists.linux.dev,m:linux-media@vger.kernel.org,m:linaro-mm-sig@lists.linaro.org,m:srinivas.kandagatla@oss.qualcomm.com,m:dmitry.baryshkov@oss.qualcomm.com,m:quic_bkumar@quicinc.com,m:quic_chennak@quicinc.com,s:lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[kernel.org,lwn.net,linuxfoundation.org,8bytes.org,arm.com,linux.intel.com,suse.de,gmail.com,ffwll.ch,linaro.org,amd.com,lists.freedesktop.org,vger.kernel.org,lists.linux.dev,lists.linaro.org,oss.qualcomm.com,quicinc.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	ARC_NA(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[25];
	FORGED_SENDER(0.00)[ekansh.gupta@oss.qualcomm.com,dri-devel-bounces@lists.freedesktop.org];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	FROM_NEQ_ENVFROM(0.00)[ekansh.gupta@oss.qualcomm.com,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	TAGGED_RCPT(0.00)[dri-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:mid,oss.qualcomm.com:dkim,qualcomm.com:dkim,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns]
X-Rspamd-Queue-Id: D0AE31989FE
X-Rspamd-Action: no action



On 2/24/2026 3:22 AM, Bjorn Andersson wrote:
> On Tue, Feb 24, 2026 at 12:38:56AM +0530, Ekansh Gupta wrote:
> [..]
>> diff --git a/drivers/accel/qda/qda_drv.c b/drivers/accel/qda/qda_drv.c
>> new file mode 100644
>> index 000000000000..18b0d3fb1598
>> --- /dev/null
>> +++ b/drivers/accel/qda/qda_drv.c
>> @@ -0,0 +1,22 @@
>> +// SPDX-License-Identifier: GPL-2.0-only
>> +// Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
>> +#include <linux/module.h>
>> +#include <linux/kernel.h>
>> +
>> +static int __init qda_core_init(void)
>> +{
>> +	pr_info("QDA: driver initialization complete\n");
> This print is useless as soon as you make the driver do anything, please
> don't include developmental debug logs.
>
>
> In fact, this patch doesn't actually do anything, please squash things a
> bit to give it some meat.
>
> Regards,
> Bjorn
Ack, will squash the next commit with this one.
>
>> +	return 0;
>> +}
>> +
>> +static void __exit qda_core_exit(void)
>> +{
>> +	pr_info("QDA: driver exit complete\n");
>> +}
>> +
>> +module_init(qda_core_init);
>> +module_exit(qda_core_exit);
>> +
>> +MODULE_AUTHOR("Qualcomm AI Infra Team");
>> +MODULE_DESCRIPTION("Qualcomm DSP Accelerator Driver");
>> +MODULE_LICENSE("GPL");
>>
>> -- 
>> 2.34.1
>>
>>

