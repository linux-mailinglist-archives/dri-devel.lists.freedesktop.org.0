Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A087BAB64A
	for <lists+dri-devel@lfdr.de>; Tue, 30 Sep 2025 06:43:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8E13010E278;
	Tue, 30 Sep 2025 04:43:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="M9ru2ksC";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 80AD810E4BE
 for <dri-devel@lists.freedesktop.org>; Tue, 30 Sep 2025 04:43:52 +0000 (UTC)
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58U4I7hd028066
 for <dri-devel@lists.freedesktop.org>; Tue, 30 Sep 2025 04:43:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 HE/PwEw34TV6LP8lhYgK0e9HeuAiGSOeepZM8oUrj6E=; b=M9ru2ksCa1GEFU8c
 1feiQsJ20gekJQg17XQxfryuD1t1nHSrR5pKllm98O4v/Q2XmPwIKj8CzR0U3+Wa
 3G5kJGcMGs/O2pDd+Jv6OisWa5PyKEpAwkCAiUBz8NZmdh6wFTO7SpmLPneyQ+zU
 uirrFtxI6LxVIgKNYVMJiouhcgB5SI5PS9TIVa5jin8S2ZIkqNWhrhDo7yo/Ze4L
 arTeFz09TtWaBjMntt6wDTTR/U4d4l4c9xYAUB9bBk2oATJRNx1ak/2g53ZNyR86
 XvAA9IwgFb8OXyNCM0qH4CWdrfE81aZSftCbt3sddqW6KQlFDAcHiq1ghY951LoZ
 XtCeUQ==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com
 [209.85.215.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49fyrf17fy-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Tue, 30 Sep 2025 04:43:51 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id
 41be03b00d2f7-b5b3715102fso1719307a12.0
 for <dri-devel@lists.freedesktop.org>; Mon, 29 Sep 2025 21:43:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1759207430; x=1759812230;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=HE/PwEw34TV6LP8lhYgK0e9HeuAiGSOeepZM8oUrj6E=;
 b=Xe0Qc2pNkUVBD/PBTTQAMuRkTCWjtwlfjB5Wp1UNuPV5K/wxDPfO+gNNUd/XiF75kc
 Cekt133dF2HWLLhXiePT/yoV4jA96GQOc60S9EYaMUmlfEVWvaM44QBqn9jnWjyMBa4m
 RpoNEkRQYoZIAt0yLMBD0KTTFKLOJX3fLfymdc7T+VaTtB1oU9rijEXLhDa02a3tIyxR
 U1s69lvbKF0QMpLaCoK5XKrza4ybW415/TwFd+f7Dct3irQhSgz33PWBIvCMLxC6k/cs
 VdM7B/zy5Gz9uxr6krPC2+/C/ULGeVi0+46scWy+tp508Lz/+HWdmBy7+JSoCpqsDLsk
 8iFw==
X-Forwarded-Encrypted: i=1;
 AJvYcCU/JGYJ0ybpYLmeYZeCkHiLdmNnwiBGFLvpEhX8KEE3H9plzIns/OY2bP9yftKsEhi3au1gxlGetZ8=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwuvYNr+flXRNjTpR8O/80Z4mhbmJYSWmeO485jkw13hGUvrArI
 T2byix0mKCk8/+Oe6c7ZRZOsfxntaekaYRSZIu0MN+ztJcLlJAFGdPzKH+bxJEYY5YMSPmZSnfk
 aX2J0fv/fjtDCoA3UxlcWvZXb/9dVeM5LE4CekdlDST3VocjgE0URK/Txt+ZdE0YYjKyD+Nc=
X-Gm-Gg: ASbGncs5+YhW0vI2SIRjur4RVGQMozUuqFfFYmWQAU9cF/uMthfqg0zXmB+pZlibhhB
 C+NFOEhvOAnEjp6veGuH3Up3rAbpIUzsrDBGhXzeZd3gBH45iWDn2h2TFNENYnz9Pb72HXj/gkS
 tw89cIEtBE3TAytU1gBc/axLlE4WtJvnB87MLgHWFJSQb00U/HtmTtY+n4Qe49iIEI73SX/2Kqd
 GWLCdPBA8N5nppA/FIL9P7Lg13YrNShybRpdnxx1KQB/hq8EYq6cRBEgHE9/P9diPV6Z1oNo1zt
 jSpNpejmProv+U29yZSpwzOZFNz41g/5mQMMe6CPx7QHlKi6Y8UFXfbF6bk/14ilhg2l2k7JxMg
 q
X-Received: by 2002:a05:6a21:3290:b0:261:ed47:c9b5 with SMTP id
 adf61e73a8af0-31766f0f15dmr4276719637.13.1759207429948; 
 Mon, 29 Sep 2025 21:43:49 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEcw5Vnw0qMjbGYrHmXkdhasUR0s98OUAwY84goAdi/+syAZPhKj4afqVsIm4XzxONViobouA==
X-Received: by 2002:a05:6a21:3290:b0:261:ed47:c9b5 with SMTP id
 adf61e73a8af0-31766f0f15dmr4276665637.13.1759207429205; 
 Mon, 29 Sep 2025 21:43:49 -0700 (PDT)
Received: from [10.204.86.68] ([202.46.23.25])
 by smtp.gmail.com with ESMTPSA id
 41be03b00d2f7-b57c557418csm12593166a12.30.2025.09.29.21.43.45
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 29 Sep 2025 21:43:48 -0700 (PDT)
Message-ID: <cdb8f84c-ed62-48ec-b7ce-9744a80e56af@oss.qualcomm.com>
Date: Tue, 30 Sep 2025 10:13:44 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] misc: fastrpc: Add support for new DSP IOVA formatting
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
 Jingyi Wang <jingyi.wang@oss.qualcomm.com>
Cc: Srinivas Kandagatla <srini@kernel.org>,
 Amol Maheshwari <amahesh@qti.qualcomm.com>, Arnd Bergmann <arnd@arndb.de>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 aiqun.yu@oss.qualcomm.com, tingwei.zhang@oss.qualcomm.com,
 trilok.soni@oss.qualcomm.com, yijie.yang@oss.qualcomm.com,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
References: <20250924-knp-fastrpc-v1-0-4b40f8bfce1d@oss.qualcomm.com>
 <20250924-knp-fastrpc-v1-1-4b40f8bfce1d@oss.qualcomm.com>
 <42ge3imptxp46pltqhktrptm6paivhmhooyehc7zigfdlk2qea@zi5ulbgtvy5h>
Content-Language: en-US
From: Kumari Pallavi <kumari.pallavi@oss.qualcomm.com>
In-Reply-To: <42ge3imptxp46pltqhktrptm6paivhmhooyehc7zigfdlk2qea@zi5ulbgtvy5h>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: k7OQ5-4NPmvfqRZmzMPBIhKMbetGiVXA
X-Proofpoint-GUID: k7OQ5-4NPmvfqRZmzMPBIhKMbetGiVXA
X-Authority-Analysis: v=2.4 cv=etzSD4pX c=1 sm=1 tr=0 ts=68db6007 cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=AqClqBJQwO-Rircdwo8A:9
 a=QEXdDO2ut3YA:10 a=x9snwWr2DeNwDh03kgHS:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTI5MDE3NSBTYWx0ZWRfX0SExjg2o8MCM
 k9Fpdon7GftOnmekBPJ9kyITgNBtA5ha+GJ/Mj7qMfrODj+BJKskEmaKmnHncQZIhOYKiatxXc7
 5w3S5L+c8Svdmi5Zue2oRGGa8Q+iNMkk4NwdYoXzxB3I1OvTtL3PN6lsCVIjNZxjjuHSrG8BK+c
 ItHRiLwudW4BlgWHd77FJDxZyvSpgunHhPqCWianQAJ78/kPe10WHsR6wCTCdcU7MgPfhqHz+BK
 v5HZ/eP5J8vopLT12Cw6PRKXMVKHXtDVXczNXRyopGRnAUJ0cqyEOc6KofhCvI1mH4qvKNhs7VO
 k2KmEdQ0b0DhPa9Nph/+I5ycNPBwRgq19+xOM/p5TBaRpnN4wPTsPW23kq0YssS8P3SRG+HxWha
 WJVgXgv1FD5tMQxcGe4X/uRsjtObPw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-29_08,2025-09-29_04,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 clxscore=1011 suspectscore=0 malwarescore=0
 priorityscore=1501 spamscore=0 impostorscore=0 adultscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2509150000 definitions=main-2509290175
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



On 9/25/2025 7:55 AM, Dmitry Baryshkov wrote:
> On Wed, Sep 24, 2025 at 04:46:36PM -0700, Jingyi Wang wrote:
>> From: Kumari Pallavi <kumari.pallavi@oss.qualcomm.com>
>>
>> Implement the new IOVA formatting required by the DSP architecture change
>> on Kaanapali SoC. Place the SID for DSP DMA transactions at bit 56 in the
>> physical address. This placement is necessary for the DSPs to correctly
>> identify streams and operate as intended.
>> To address this, add an iova-format flag which determines the SID position
>> within the physical address. Set SID position to bit 56 when iova_format
>> is enabled; otherwise, default to legacy 32-bit placement.
>> Initialize the flag to 0 and update to 1 based on SoC-specific compatible
>> string from the root node.
>> This change ensures consistent SID placement across DSPs.
>>
>> Signed-off-by: Kumari Pallavi <kumari.pallavi@oss.qualcomm.com>
>> Signed-off-by: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
>> ---
>>   drivers/misc/fastrpc.c | 76 ++++++++++++++++++++++++++++++++++++++++++++------
>>   1 file changed, 68 insertions(+), 8 deletions(-)
>>
>> diff --git a/drivers/misc/fastrpc.c b/drivers/misc/fastrpc.c
>> index 8e1d97873423..db396241b8ce 100644
>> --- a/drivers/misc/fastrpc.c
>> +++ b/drivers/misc/fastrpc.c
>> @@ -33,7 +33,6 @@
>>   #define FASTRPC_ALIGN		128
>>   #define FASTRPC_MAX_FDLIST	16
>>   #define FASTRPC_MAX_CRCLIST	64
>> -#define FASTRPC_PHYS(p)	((p) & 0xffffffff)
>>   #define FASTRPC_CTX_MAX (256)
>>   #define FASTRPC_INIT_HANDLE	1
>>   #define FASTRPC_DSP_UTILITIES_HANDLE	2
>> @@ -105,6 +104,26 @@
>>   
>>   #define miscdev_to_fdevice(d) container_of(d, struct fastrpc_device, miscdev)
>>   
>> +/*
>> + * By default, the sid will be prepended adjacent to smmu pa before sending
>> + * to DSP. But if the compatible Soc found at root node specifies the new
>> + * addressing format to handle pa's of longer widths, then the sid will be
>> + * prepended at the position specified in this macro.
>> + */
>> +#define SID_POS_IN_IOVA 56
>> +
>> +/* Default width of pa bus from dsp */
>> +#define DSP_DEFAULT_BUS_WIDTH 32
>> +
>> +/* Extract smmu pa from consolidated iova */
>> +#define IOVA_TO_PHYS(iova, sid_pos) (iova & ((1ULL << sid_pos) - 1ULL))
>> +
>> +/*
>> + * Prepare the consolidated iova to send to dsp by prepending the sid
>> + * to smmu pa at the appropriate position
>> + */
>> +#define IOVA_FROM_SID_PA(sid, phys, sid_pos) (phys += sid << sid_pos)
>> +
>>   struct fastrpc_phy_page {
>>   	u64 addr;		/* physical address */
>>   	u64 size;		/* size of contiguous region */
>> @@ -255,6 +274,7 @@ struct fastrpc_session_ctx {
>>   	int sid;
>>   	bool used;
>>   	bool valid;
>> +	u32 sid_pos;
>>   };
>>   
>>   struct fastrpc_channel_ctx {
>> @@ -278,6 +298,7 @@ struct fastrpc_channel_ctx {
>>   	bool secure;
>>   	bool unsigned_support;
>>   	u64 dma_mask;
>> +	u32 iova_format;
>>   };
>>   
>>   struct fastrpc_device {
>> @@ -391,8 +412,11 @@ static int fastrpc_map_lookup(struct fastrpc_user *fl, int fd,
>>   
>>   static void fastrpc_buf_free(struct fastrpc_buf *buf)
>>   {
>> +	uint32_t sid_pos = (buf->fl->sctx ? buf->fl->sctx->sid_pos :
>> +					    DSP_DEFAULT_BUS_WIDTH);
>> +
>>   	dma_free_coherent(buf->dev, buf->size, buf->virt,
>> -			  FASTRPC_PHYS(buf->phys));
>> +			  IOVA_TO_PHYS(buf->phys, sid_pos));
>>   	kfree(buf);
>>   }
>>   
>> @@ -442,7 +466,7 @@ static int fastrpc_buf_alloc(struct fastrpc_user *fl, struct device *dev,
>>   	buf = *obuf;
>>   
>>   	if (fl->sctx && fl->sctx->sid)
>> -		buf->phys += ((u64)fl->sctx->sid << 32);
>> +		IOVA_FROM_SID_PA((u64)fl->sctx->sid, buf->phys, fl->sctx->sid_pos);
>>   
>>   	return 0;
>>   }
>> @@ -687,7 +711,8 @@ static int fastrpc_dma_buf_attach(struct dma_buf *dmabuf,
>>   		return -ENOMEM;
>>   
>>   	ret = dma_get_sgtable(buffer->dev, &a->sgt, buffer->virt,
>> -			      FASTRPC_PHYS(buffer->phys), buffer->size);
>> +			      IOVA_TO_PHYS(buffer->phys, buffer->fl->sctx->sid_pos),
>> +			      buffer->size);
>>   	if (ret < 0) {
>>   		dev_err(buffer->dev, "failed to get scatterlist from DMA API\n");
>>   		kfree(a);
>> @@ -736,7 +761,7 @@ static int fastrpc_mmap(struct dma_buf *dmabuf,
>>   	dma_resv_assert_held(dmabuf->resv);
>>   
>>   	return dma_mmap_coherent(buf->dev, vma, buf->virt,
>> -				 FASTRPC_PHYS(buf->phys), size);
>> +				 IOVA_TO_PHYS(buf->phys, buf->fl->sctx->sid_pos), size);
>>   }
>>   
>>   static const struct dma_buf_ops fastrpc_dma_buf_ops = {
>> @@ -793,7 +818,8 @@ static int fastrpc_map_create(struct fastrpc_user *fl, int fd,
>>   		map->phys = sg_phys(map->table->sgl);
>>   	} else {
>>   		map->phys = sg_dma_address(map->table->sgl);
>> -		map->phys += ((u64)fl->sctx->sid << 32);
>> +		IOVA_FROM_SID_PA((u64)fl->sctx->sid, map->phys,
>> +				 fl->sctx->sid_pos);
>>   	}
>>   	map->size = len;
>>   	map->va = sg_virt(map->table->sgl);
>> @@ -2153,11 +2179,14 @@ static int fastrpc_cb_probe(struct platform_device *pdev)
>>   	sess->used = false;
>>   	sess->valid = true;
>>   	sess->dev = dev;
>> -	dev_set_drvdata(dev, sess);
>> +	/* Configure where sid will be prepended to pa */
>> +	sess->sid_pos =
>> +		(cctx->iova_format ? SID_POS_IN_IOVA : DSP_DEFAULT_BUS_WIDTH);
> 
> You are using iova_format as a flag. Rename it to something more
> sensible and turn it into a boolean flag.
> 

Sure, I'll take it up in next patch series.

>>   
>>   	if (of_property_read_u32(dev->of_node, "reg", &sess->sid))
>>   		dev_info(dev, "FastRPC Session ID not specified in DT\n");
>>   
>> +	dev_set_drvdata(dev, sess);
>>   	if (sessions > 0) {
>>   		struct fastrpc_session_ctx *dup_sess;
>>   
>> @@ -2256,6 +2285,19 @@ static int fastrpc_get_domain_id(const char *domain)
>>   	return -EINVAL;
>>   }
>>   
>> +struct fastrpc_soc_data {
>> +	u32 dsp_iova_format;
>> +};
>> +
>> +static const struct fastrpc_soc_data kaanapali_soc_data = {
>> +	.dsp_iova_format = 1,
>> +};
>> +
>> +static const struct of_device_id qcom_soc_match_table[] = {
>> +	{ .compatible = "qcom,kaanapali", .data = &kaanapali_soc_data },
>> +	{},
>> +};
>> +
>>   static int fastrpc_rpmsg_probe(struct rpmsg_device *rpdev)
>>   {
>>   	struct device *rdev = &rpdev->dev;
>> @@ -2264,6 +2306,23 @@ static int fastrpc_rpmsg_probe(struct rpmsg_device *rpdev)
>>   	const char *domain;
>>   	bool secure_dsp;
>>   	unsigned int vmids[FASTRPC_MAX_VMIDS];
>> +	struct device_node *root;
>> +	const struct of_device_id *match;
>> +	const struct fastrpc_soc_data *soc_data = NULL;
>> +	u32 iova_format = 0;
>> +
>> +	root = of_find_node_by_path("/");
>> +	if (!root)
>> +		return -ENODEV;
>> +
>> +	match = of_match_node(qcom_soc_match_table, root);
>> +	of_node_put(root);
>> +	if (!match || !match->data) {
>> +		dev_dbg(rdev, "no compatible SoC found at root node\n");
>> +	} else {
>> +		soc_data = match->data;
>> +		iova_format = soc_data->dsp_iova_format;
>> +	}
>>   
>>   	err = of_property_read_string(rdev->of_node, "label", &domain);
>>   	if (err) {
>> @@ -2343,7 +2402,8 @@ static int fastrpc_rpmsg_probe(struct rpmsg_device *rpdev)
>>   		err = -EINVAL;
>>   		goto err_free_data;
>>   	}
>> -
>> +	/* determine where sid needs to be prepended to pa based on iova_format */
>> +	data->iova_format = iova_format;
>>   	kref_init(&data->refcount);
>>   
>>   	dev_set_drvdata(&rpdev->dev, data);
>>
>> -- 
>> 2.25.1
>>
> 
Thanks,
Pallavi
