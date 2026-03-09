Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uHt2BeBvrmn8EAIAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Mon, 09 Mar 2026 07:59:44 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7639323496B
	for <lists+dri-devel@lfdr.de>; Mon, 09 Mar 2026 07:59:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5834210E115;
	Mon,  9 Mar 2026 06:59:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="i5QfXdgA";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="I0r49uq0";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B7F8510E115
 for <dri-devel@lists.freedesktop.org>; Mon,  9 Mar 2026 06:59:39 +0000 (UTC)
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 628Mnp8K2071120
 for <dri-devel@lists.freedesktop.org>; Mon, 9 Mar 2026 06:59:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 G+rVK2qEYMP73XgPEKoeHzVEXgyXmbiGfinl4OV1AfY=; b=i5QfXdgAcg/AgJni
 irNAv/e8dbLAEbvQsR2oIvr8dzvfhC4LlOP5b0CUTzKKvbHMVURDzdsbElcrqk37
 leb3d0XeO+wsZvb4WSyXwVHqYmgLUGuVSXsvUTqfbQsQxrYL5qOoI96G9Sd/6BFb
 1d4IM7k4Cfc0ikPSe8fnxEOzpXFI03B8f3fSK43H3iiPAKvy4sACg/wvTt55A7pt
 3u4Q3kGPEbgcz57stZVWCbucXmDT9odK4Bnl2AN2bzeNenaT0oCZyvSZ9ylxkB+z
 FvwsrcIZS9B9tZgDXowO674ls3TgjKtQRQ7IwMCSo/bnwHIlVK8Ay+idNqfBPxnM
 xRMw6g==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com
 [209.85.214.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4crda9c2w0-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Mon, 09 Mar 2026 06:59:39 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id
 d9443c01a7336-2ae467f128fso77142335ad.1
 for <dri-devel@lists.freedesktop.org>; Sun, 08 Mar 2026 23:59:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1773039578; x=1773644378;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=G+rVK2qEYMP73XgPEKoeHzVEXgyXmbiGfinl4OV1AfY=;
 b=I0r49uq0UiGlsWzwyALNj3MlWeFGu2vSGP58lTRIwVmvYFe3VxNXk5FrusBQBdrzl9
 tW5UvnqDqkyoQEjT4ZOr3T3zvo71zHAuhkLbxkSThO8ZnvKvIITZsJm/CDwsHl2mGXTT
 pVTxAX3nuG2YeZrcS/6/1oBGlAN1PfP63nRGt0TwVRWUg+S+MHh72QyN9k4dHwrtEcoW
 iTXcEZvCht+4AdmpBiTew1jVxcmywtl9ygUYORsPWctcd64D3dkK1W4gfPNRe8LYdJbk
 Ej1GnQF4hlnE/NUCJmPQzfCormZskvp/6NNC+qiKEAusb4OeQg7OgtGSPwou0EZVYgp5
 GwGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1773039578; x=1773644378;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=G+rVK2qEYMP73XgPEKoeHzVEXgyXmbiGfinl4OV1AfY=;
 b=Y6IwEUfzgiokF1FJgm0BMxVnXDaKaT30el+qoczqtdoGgW4K+0yR3t92Wr9tyuEf1O
 tQLqcbikQIlIrB9LQ/QR20b36xgD2Kf4XkrG7V7NLBBNqF8OdGmkiUIRmjpU4+2qV5Ma
 qhBWSd61xMNFrIysxp31TR24+25vIeXOmWkwqjhmDfCQSnTfOCnZbhJj++9G6Lt1FOU8
 RZDGq7nbliAG1oAAId4mjVJyDnrvQle0oRLI83jXiMilAlKffZusgB3rt0NrQLS2IyeT
 /RgZD7O1xtD7Gl9m+dAClmWGBEhVuHLHcyo+gVvJfkPiwSTNpuJZll0CX8ZA5FULfFHM
 nCow==
X-Gm-Message-State: AOJu0Yx4HsTOTtIjzqF8HeTSXMad8Z1pDN17h4/dGSCILOjRIEKU4K9B
 nJF6lRIVcjy7fYM+rOfNlQWCroBZxO4UNb5T8HbgCh0DKpLLuTNozVhnbwBmzAhdBPxBFCUirlJ
 oOr80UjfC/RPl/YL7GPbjYDRuTUPeN16vvLO4Y7h7ZiHtixMJLASwKF2MFZAm+uiobtSZJVc=
X-Gm-Gg: ATEYQzxMf1bQndn5sh07k9EYnMs22IVT066tFpDTYqDqkHSS8PxeuaiZDSqp8zoZ4I0
 QSMVXLYbHOJUvJD7iAwi8iNjOsAJ1vLLUufY4EQTa5fz81XY70UN8Z4K3m1VX2wLn9QX49+2mUT
 yx1Bb5hXY4E+Yt7jsi+NmhkKwLF5sCwO9RLDDA1WxvP1EhPQOFZ2h1cQ04mAqSQLMqzj/KHvF7f
 0p00XMyvYFHeBYtFCj0X5PLGkBUu/wIr0sFfOj17sx7d4ZP/nCgMb3F3pFnnh6SiqzVTj4M+Cz7
 i82Y/MbUqp85D1U2okLZIIWT29TGIjLqD/Xx38NO6ei60YnajnC7TmduNXEFRE5tA45AlKfoI3+
 nfcpOAZCIISW+uDNW23XIJa/DLAxqnjoaq+okVGXHSsR3R8NmfQ==
X-Received: by 2002:a17:902:f651:b0:2ae:61bb:4255 with SMTP id
 d9443c01a7336-2ae82418927mr109317795ad.11.1773039578328; 
 Sun, 08 Mar 2026 23:59:38 -0700 (PDT)
X-Received: by 2002:a17:902:f651:b0:2ae:61bb:4255 with SMTP id
 d9443c01a7336-2ae82418927mr109317495ad.11.1773039577848; 
 Sun, 08 Mar 2026 23:59:37 -0700 (PDT)
Received: from [10.206.99.28] ([202.46.23.25])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2ae83e5c167sm99741945ad.1.2026.03.08.23.59.30
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 08 Mar 2026 23:59:37 -0700 (PDT)
Message-ID: <29f9bb45-5c3f-4847-a629-21cef540f38b@oss.qualcomm.com>
Date: Mon, 9 Mar 2026 12:29:29 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC 12/18] accel/qda: Add PRIME dma-buf import support
To: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 Oded Gabbay <ogabbay@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
 Shuah Khan <skhan@linuxfoundation.org>, Joerg Roedel <joro@8bytes.org>,
 Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Sumit Semwal <sumit.semwal@linaro.org>
Cc: dri-devel@lists.freedesktop.org, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 iommu@lists.linux.dev, linux-media@vger.kernel.org,
 linaro-mm-sig@lists.linaro.org,
 Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>,
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
 Bharath Kumar <quic_bkumar@quicinc.com>,
 Chenna Kesava Raju <quic_chennak@quicinc.com>
References: <20260224-qda-firstpost-v1-0-fe46a9c1a046@oss.qualcomm.com>
 <20260224-qda-firstpost-v1-12-fe46a9c1a046@oss.qualcomm.com>
 <e87c0c1d-82f1-4a03-9a56-9bf3e03273cf@amd.com>
Content-Language: en-US
From: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
In-Reply-To: <e87c0c1d-82f1-4a03-9a56-9bf3e03273cf@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzA5MDA2MyBTYWx0ZWRfXwkVW8ox9wrgg
 EXwg0Iqz6P6Api/YoVlCqaXQrdNZS1wypGOq9zz10Hcig1xak6Cwy4unWaYMZ9sTOsQTlfXH9Fv
 uxISs4PJ8EFnyJVKyiH3YL/egvTnyxKLSMuQyuB2g/L048F+zWIfxfTiTusmoYSoEJk1ZuwFSPG
 J9cymgKw2KPOWRVA8yjaPkMrQWaceVKdAFEULvwAB64aXVAKV7V431nuGqCrzWv0ady48jbzQNU
 lb7AvMN1kYICTs3CG0wjvFMlnI71RNhdUiAGeLs1NTtSma/WZ2w6CacCd/ZxoGYoHfVRlgxSkfs
 SPIynP1hZDzhh3HiommwvQQN4uTdNvZ9niRaIvMYSqAsKhicMdvoETtkfwX91IaXiED3PpCfnP5
 VKT6VovA4lLW2VVLJ3hMF/PLrlmeRYQeW0UdThJT/GhmpeR+p6PNWFz9jag1IYLk89oNHpZvZtk
 TOZawrp9LOaG+gmArWg==
X-Proofpoint-ORIG-GUID: twHvcrOfJy1w3jXweR2b8SZyPfRoM1Dl
X-Authority-Analysis: v=2.4 cv=QZtrf8bv c=1 sm=1 tr=0 ts=69ae6fdb cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=_EeEMxcBAAAA:8 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=YM0dgK5nqTTLF_VjvEgA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=czjwGCTIUPoA:10
 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-GUID: twHvcrOfJy1w3jXweR2b8SZyPfRoM1Dl
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-09_02,2026-03-06_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 clxscore=1015 bulkscore=0 priorityscore=1501 impostorscore=0
 malwarescore=0 phishscore=0 spamscore=0 suspectscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603090063
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
X-Rspamd-Queue-Id: 7639323496B
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.31 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:christian.koenig@amd.com,m:ogabbay@kernel.org,m:corbet@lwn.net,m:skhan@linuxfoundation.org,m:joro@8bytes.org,m:will@kernel.org,m:robin.murphy@arm.com,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:tzimmermann@suse.de,m:airlied@gmail.com,m:simona@ffwll.ch,m:sumit.semwal@linaro.org,m:linux-doc@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:iommu@lists.linux.dev,m:linux-media@vger.kernel.org,m:linaro-mm-sig@lists.linaro.org,m:srinivas.kandagatla@oss.qualcomm.com,m:dmitry.baryshkov@oss.qualcomm.com,m:quic_bkumar@quicinc.com,m:quic_chennak@quicinc.com,s:lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[amd.com,kernel.org,lwn.net,linuxfoundation.org,8bytes.org,arm.com,linux.intel.com,suse.de,gmail.com,ffwll.ch,linaro.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[ekansh.gupta@oss.qualcomm.com,dri-devel-bounces@lists.freedesktop.org];
	RCPT_COUNT_TWELVE(0.00)[24];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	FROM_NEQ_ENVFROM(0.00)[ekansh.gupta@oss.qualcomm.com,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	MID_RHS_MATCH_FROM(0.00)[];
	REDIRECTOR_URL(0.00)[aka.ms];
	NEURAL_HAM(-0.00)[-0.995];
	TAGGED_RCPT(0.00)[dri-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:rdns,gabe.freedesktop.org:helo,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,qualcomm.com:dkim,qualcomm.com:email,aka.ms:url]
X-Rspamd-Action: no action



On 2/24/2026 2:42 PM, Christian König wrote:
> On 2/23/26 20:09, Ekansh Gupta wrote:
>> [Sie erhalten nicht häufig E-Mails von ekansh.gupta@oss.qualcomm.com. Weitere Informationen, warum dies wichtig ist, finden Sie unter https://aka.ms/LearnAboutSenderIdentification ]
>>
>> Add PRIME dma-buf import support for QDA GEM buffer objects and integrate
>> it with the existing per-process memory manager and IOMMU device model.
>>
>> The implementation extends qda_gem_obj to represent imported dma-bufs,
>> including dma_buf references, attachment state, scatter-gather tables
>> and an imported DMA address used for DSP-facing book-keeping. The
>> qda_gem_prime_import() path handles reimports of buffers originally
>> exported by QDA as well as imports of external dma-bufs, attaching them
>> to the assigned IOMMU device
> That is usually an absolutely clear NO-GO for DMA-bufs. Where exactly in the code is that?
dma_buf_attach* to comute-cb iommu devices are critical for DSPs to access the buffer.
This is needed if the buffer is exported by anyone other than QDA(say system heap). If this is not
the correct way, what should be the right way here? On the current fastrpc driver also,
the DMABUF is getting attached with iommu device[1] due to the same requirement.

[1] https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/tree/drivers/misc/fastrpc.c#n779
>
>> and mapping them through the memory manager
>> for DSP access. The GEM free path is updated to unmap and detach
>> imported buffers while preserving the existing behaviour for locally
>> allocated memory.
>>
>> The PRIME fd-to-handle path is implemented in qda_prime_fd_to_handle(),
>> which records the calling drm_file in a driver-private import context
>> before invoking the core DRM helpers. The GEM import callback retrieves
>> this context to ensure that an IOMMU device is assigned to the process
>> and that imported buffers follow the same per-process IOMMU selection
>> rules as natively allocated GEM objects.
>>
>> This patch prepares the driver for interoperable buffer sharing between
>> QDA and other dma-buf capable subsystems while keeping IOMMU mapping and
>> lifetime handling consistent with the existing GEM allocation flow.
>>
>> Signed-off-by: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
> ...
>
>> @@ -15,23 +16,29 @@ static int validate_gem_obj_for_mmap(struct qda_gem_obj *qda_gem_obj)
>>                 qda_err(NULL, "Invalid GEM object size\n");
>>                 return -EINVAL;
>>         }
>> -       if (!qda_gem_obj->iommu_dev || !qda_gem_obj->iommu_dev->dev) {
>> -               qda_err(NULL, "Allocated buffer missing IOMMU device\n");
>> -               return -EINVAL;
>> -       }
>> -       if (!qda_gem_obj->iommu_dev->dev) {
>> -               qda_err(NULL, "Allocated buffer missing IOMMU device\n");
>> -               return -EINVAL;
>> -       }
>> -       if (!qda_gem_obj->virt) {
>> -               qda_err(NULL, "Allocated buffer missing virtual address\n");
>> -               return -EINVAL;
>> -       }
>> -       if (qda_gem_obj->dma_addr == 0) {
>> -               qda_err(NULL, "Allocated buffer missing DMA address\n");
>> -               return -EINVAL;
>> +       if (qda_gem_obj->is_imported) {
> Absolutely clear NAK to that. Imported buffers *can't* be mmaped through the importer!
>
> Userspace needs to mmap() them through the exporter.
>
> If you absolutely have to map them through the importer for uAPI backward compatibility then there is dma_buf_mmap() for that, but this is clearly not the case here.
>
> ...
Okay, the requirement is slightly different here. Any buffer which is not allocated using the
QDA GEM interface needs to be attached to the iommu device for that particular process to
enable DSP for the access. I should not call it `mmap` instead it should be called importing the
buffer to a particular iommu context bank. With this definition, is it fine to keep it this way? Or
should the dma_buf_attach* calls be moved to some other place?
>> +static int qda_memory_manager_map_imported(struct qda_memory_manager *mem_mgr,
>> +                                          struct qda_gem_obj *gem_obj,
>> +                                          struct qda_iommu_device *iommu_dev)
>> +{
>> +       struct scatterlist *sg;
>> +       dma_addr_t dma_addr;
>> +       int ret = 0;
>> +
>> +       if (!gem_obj->is_imported || !gem_obj->sgt || !iommu_dev) {
>> +               qda_err(NULL, "Invalid parameters for imported buffer mapping\n");
>> +               return -EINVAL;
>> +       }
>> +
>> +       gem_obj->iommu_dev = iommu_dev;
>> +
>> +       sg = gem_obj->sgt->sgl;
>> +       if (sg) {
>> +               dma_addr = sg_dma_address(sg);
>> +               dma_addr += ((u64)iommu_dev->sid << 32);
>> +
>> +               gem_obj->imported_dma_addr = dma_addr;
> Well that looks like you are only using the first DMA address from the imported sgt. What about the others?
I might have a proper appach for this now, will update in the next spin.
>
> Regards,
> Christian.

