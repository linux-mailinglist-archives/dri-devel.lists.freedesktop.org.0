Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F35BCC62A81
	for <lists+dri-devel@lfdr.de>; Mon, 17 Nov 2025 08:07:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A285D10E2DD;
	Mon, 17 Nov 2025 07:07:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="njJ0o/UZ";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="IGzHNGFg";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DE26210E2DD
 for <dri-devel@lists.freedesktop.org>; Mon, 17 Nov 2025 07:07:40 +0000 (UTC)
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 5AH4o31b2910588
 for <dri-devel@lists.freedesktop.org>; Mon, 17 Nov 2025 07:07:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 s+L9dKXUNJ/0YqqqeqxjRtTyQQ45AAju5TOgvH9J0mQ=; b=njJ0o/UZ+9ShrMnm
 i9x5L8kKQwqqxedY1NPVdJ1weBfATrA1hD23fBtmp1keh6LHzRMaqQtueXvGQ7fB
 T0UrGJ2dJeuGXNmWE+tFpK1CP659lasYZ1WCWUL2/6BqKYTFPV4Rdbo+/iAN2KJG
 L/2fQ6+DuThudvZHCFGeDY/vvSpoOI8D7DTq9Y3UMmsutyhc7zpkbxGstQJmZcpW
 7EMeUB9XhTVpnX9pn+4YUq78iWqSG29enmFRULKEJOSb0AtaK1Ya1QroTcQL0PCl
 /Jit4owggNVBIxxih9Au2hYzL72Vt+CO2F8d+nZU/hunufdhN929BO5IpHO0NSD3
 AkZeCQ==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com
 [209.85.216.72])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4aejgcbpfb-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Mon, 17 Nov 2025 07:07:40 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id
 98e67ed59e1d1-3436e9e3569so9701865a91.2
 for <dri-devel@lists.freedesktop.org>; Sun, 16 Nov 2025 23:07:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1763363260; x=1763968060;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=s+L9dKXUNJ/0YqqqeqxjRtTyQQ45AAju5TOgvH9J0mQ=;
 b=IGzHNGFgz3F3BH2BFcCUUWwIkblqiNr7qNZZxf5hUqMMMDDl79D6uoEy5vi8XjBW/O
 qQ7fSApvrzuwKsV0oK9AnMNjER99VXQHcz6M6X0qhSOMSHv5TlpkH/LSmq88Lf86upK0
 kNMOwwRvlcbI3RrewE7BbI8IGLcnjunyhCQF9H4Q27pINoXbBCWmMMGJGZ6iqivVTVOG
 6lMiOJupDvDeAGszE/COJwtUgtpQQk1m3Glnvg/Qs2wA++w2DgiVsiqdurWD1UAaBjMI
 jCFJzWODBZthpiiCnmw31OxFbJIfut8MGAACM4xTlO+PeAxatcBIUa4ZYwAqWV0mKUFH
 8F/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1763363260; x=1763968060;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=s+L9dKXUNJ/0YqqqeqxjRtTyQQ45AAju5TOgvH9J0mQ=;
 b=GwZitElHrLojJbjCSQFbXCeCSliCE0dEDVd9dkxRhdhTKu6sh/RqGnBXcy88todASl
 zY1eajggD3pAMVwolDtKn20qGarqWzlRK2jMxXf4Ptqy9k/9J9pz66GGw++4+teedHkT
 oQk+HaXoF2u+stxGp+D7kc+QHcKOIWb2Z9rQkJIlk2JNlYU+mr4NmMX+0P92IQW/eUps
 +HdloKwYam+9dkcvXtGUVGxIMH3quJb3j+E4P6iEGXKmUctVD4UdS7ZDGGwnhDAptmuz
 d+nKkDBUbsjEJGB7TbgocbWcEQrXLEa6l8RUgCJ0va+SyLjEZyjzQQLuyoBq3VyUrJr1
 Fkvg==
X-Forwarded-Encrypted: i=1;
 AJvYcCV6iHYZxh5yi/L4wTPFLlqaZxvE+F/UCMejfj6btXOvVgwhay2VXoRRvpxDPa12zaq6NiSWA5IzAY8=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yykc8wxH3fvIPwpkjG2INA49HxTw9/fybAnLdXlK8iYsBM3rvP+
 ZwwXuUuWHYG5SZyCbvkH3ULMeroOxJcj/Jw/B05O9DEwX/YeHRicINYONjOSIl4BRRe7Zuw+kZ2
 hijpljA+txR+ro+3KjURQuRHP1W3dVisFFn80x5veEZMRWz6Gr/AywrxuIWWD1bbRnnK2SOU=
X-Gm-Gg: ASbGncsBAHtFfBHEj/yQ+UaKknZXCn8dYMrRI/VSbAxYwK81+8djOtcCdVegvJgOyjr
 NxxymsvzT7Y2ElPVcZn9YZ0oLMhqvJx6WEVaES21xg5bWewS4SQPdlN/orTatXayOdfrdls/XqZ
 t6UM/Umk5roNqcwt5uf5kla2lFrnhn2YN1qs5JFmMSOSdwkqTajG/l0BPdyBZRggbNAq3HhDFk8
 Dt/HkowTaBH8+PaxobC/BrsD6479yU/A0uLmcHQLMWppcdZ3GkII8VLYQET1yjUU7TYGIJm7V14
 ZEZoL2NjLV9gCyR7gE+aIz6zEOB9bhrui2fxq2GEFMadbwCfo5520t6IcqZ5QWJ+vyEPn0qJUPE
 7YjP7HS/7/0CENnX5z2rYutJ0TxOrz1M=
X-Received: by 2002:a17:90b:2e0b:b0:343:747e:2cac with SMTP id
 98e67ed59e1d1-343fa761482mr12754856a91.31.1763363259469; 
 Sun, 16 Nov 2025 23:07:39 -0800 (PST)
X-Google-Smtp-Source: AGHT+IH1bHDIuyMF/Gxb9CuZXRy44lstMx2jZjo5rsVIGCWOU7oyYLn01+2EDK0qIIevhMCmYZDNCg==
X-Received: by 2002:a17:90b:2e0b:b0:343:747e:2cac with SMTP id
 98e67ed59e1d1-343fa761482mr12754813a91.31.1763363258869; 
 Sun, 16 Nov 2025 23:07:38 -0800 (PST)
Received: from [10.204.86.112] ([202.46.23.25])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-343ea5f9fa4sm6266704a91.0.2025.11.16.23.07.34
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 16 Nov 2025 23:07:38 -0800 (PST)
Message-ID: <83112aa3-5998-4030-98cb-d3d5ee7c0570@oss.qualcomm.com>
Date: Mon, 17 Nov 2025 12:37:33 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/4] misc: fastrpc: Rename phys to dma_addr for clarity
To: Bjorn Andersson <andersson@kernel.org>
Cc: kpallavi@qti.qualcomm.com, srini@kernel.org, amahesh@qti.qualcomm.com,
 arnd@arndb.de, gregkh@linuxfoundation.org, quic_bkumar@quicinc.com,
 ekansh.gupta@oss.qualcomm.com, linux-kernel@vger.kernel.org,
 quic_chennak@quicinc.com, dri-devel@lists.freedesktop.org,
 linux-arm-msm@vger.kernel.org, jingyi.wang@oss.qualcomm.com,
 aiqun.yu@oss.qualcomm.com, ktadakam@qti.qualcomm.com
References: <20251114084142.3386682-1-kumari.pallavi@oss.qualcomm.com>
 <20251114084142.3386682-3-kumari.pallavi@oss.qualcomm.com>
 <q46rupdndsmeojv4szm3qbtcwu6n7x2ukwrrx4jd7rph7nlq5b@xiclcnpx7rc7>
Content-Language: en-US
From: Kumari Pallavi <kumari.pallavi@oss.qualcomm.com>
In-Reply-To: <q46rupdndsmeojv4szm3qbtcwu6n7x2ukwrrx4jd7rph7nlq5b@xiclcnpx7rc7>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: iKSpyROdX1FPJ9e163j2f5LRKkpSDvyQ
X-Proofpoint-GUID: iKSpyROdX1FPJ9e163j2f5LRKkpSDvyQ
X-Authority-Analysis: v=2.4 cv=PJECOPqC c=1 sm=1 tr=0 ts=691ac9bc cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=aU0ChUNEQ9L6yK78W9kA:9 a=QEXdDO2ut3YA:10 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTE3MDA1OCBTYWx0ZWRfXzt3+wY8+8qf7
 MTOAF4xP7Nr7mmHzwIclXRBJssXRURaZ8u/BgvYKVuyHvE2ryKwmSMfCirZoDnyZzwKLCTt8Nux
 G1fEQ3oYPKM3JbWtaDtd5AaUAwDEfhtW/bRzTTBpfDym9Kjrejui4GDVuLnN96eZPGsyDN16Ayq
 mb8yijJJaoe1hLFURBqntLaxjmaWjGtFy1ic6s3QEwJCqCn88Y0EsyGXEfyC/jn7Bxir7xPuZBs
 8uAwZl7/9BBHBA5MzwVK+tQu38POQ47paFUPTO/CMWGwE3Ej6Ik72zefwKMOwFEeWM1HIx6BXIx
 PMojTC4FA+MrAxGsXsTBCxznJIpWNUXEe+w1qaoRUisusnq4lbhvFOvvhX9NDv94AQQaE6oru5Z
 aPfRe5YxADHZV9uGp6D7gygBnYDwdQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-17_02,2025-11-13_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 lowpriorityscore=0 clxscore=1015 spamscore=0 phishscore=0
 bulkscore=0 impostorscore=0 suspectscore=0 priorityscore=1501 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511170058
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



On 11/14/2025 9:14 PM, Bjorn Andersson wrote:
> On Fri, Nov 14, 2025 at 02:11:40PM +0530, Kumari Pallavi wrote:
>> Update all references of buf->phys and map->phys to buf->dma_addr and
>> map->dma_addr to accurately represent that these fields store DMA
>> addresses, not physical addresses. This change improves code clarity
>> and aligns with kernel conventions for dma_addr_t usage.
>>
>> Signed-off-by: Kumari Pallavi <kumari.pallavi@oss.qualcomm.com>
>> ---
>>   drivers/misc/fastrpc.c | 76 ++++++++++++++++++++++--------------------
>>   1 file changed, 40 insertions(+), 36 deletions(-)
>>
>> diff --git a/drivers/misc/fastrpc.c b/drivers/misc/fastrpc.c
>> index ee652ef01534..d6a7960fe716 100644
>> --- a/drivers/misc/fastrpc.c
>> +++ b/drivers/misc/fastrpc.c
>> @@ -106,7 +106,7 @@
>>   #define miscdev_to_fdevice(d) container_of(d, struct fastrpc_device, miscdev)
>>   
>>   struct fastrpc_phy_page {
>> -	u64 addr;		/* physical address */
>> +	u64 addr;		/* physical or dma address */
>>   	u64 size;		/* size of contiguous region */
>>   };
>>   
>> @@ -171,7 +171,7 @@ struct fastrpc_msg {
>>   	u64 ctx;		/* invoke caller context */
>>   	u32 handle;	/* handle to invoke */
>>   	u32 sc;		/* scalars structure describing the data */
>> -	u64 addr;		/* physical address */
>> +	u64 addr;		/* physical or dma address */
> 
> Can you go all the way and make the type dma_addr_t? That way you don't
> need to typecast the dma_alloc_coherent() and dma_free_coherent().
> 
> I believe it might complicate the places where you do math on it, but
> that is a good thing, as it highlights those places where you do
> something unexpected.
> 

While this not strictly limited to holding a dma_addr_t.
Based on historical behavior, when the FASTRPC_ATTR_SECUREMAP flag is
set, S2 mapping expects a physical address to be passed to the
qcom_scm_assign_mem() API.
reference-
https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/commit/drivers/misc/fastrpc.c?id=e90d911906196bf987492c94e38f10ca611dfd7b

If you suggest, I can define it as dma_addr_t and perform typecasting to 
u64 wherever required.

Thanks,
Pallavi


>>   	u64 size;		/* size of contiguous region */
>>   };
>>   
>> @@ -194,7 +194,7 @@ struct fastrpc_buf {
>>   	struct dma_buf *dmabuf;
>>   	struct device *dev;
>>   	void *virt;
>> -	u64 phys;
>> +	u64 dma_addr;
>>   	u64 size;
>>   	/* Lock for dma buf attachments */
>>   	struct mutex lock;
>> @@ -217,7 +217,7 @@ struct fastrpc_map {
>>   	struct dma_buf *buf;
>>   	struct sg_table *table;
>>   	struct dma_buf_attachment *attach;
>> -	u64 phys;
>> +	u64 dma_addr;
>>   	u64 size;
>>   	void *va;
>>   	u64 len;
>> @@ -320,11 +320,12 @@ static void fastrpc_free_map(struct kref *ref)
>>   
>>   			perm.vmid = QCOM_SCM_VMID_HLOS;
>>   			perm.perm = QCOM_SCM_PERM_RWX;
>> -			err = qcom_scm_assign_mem(map->phys, map->len,
>> +			err = qcom_scm_assign_mem(map->dma_addr, map->len,
>>   				&src_perms, &perm, 1);
>>   			if (err) {
>> -				dev_err(map->fl->sctx->dev, "Failed to assign memory phys 0x%llx size 0x%llx err %d\n",
>> -						map->phys, map->len, err);
>> +				dev_err(map->fl->sctx->dev,
>> +					"Failed to assign memory dma_addr 0x%llx size 0x%llx err %d\n",
>> +					map->dma_addr, map->len, err);
>>   				return;
>>   			}
>>   		}
>> @@ -389,7 +390,7 @@ static int fastrpc_map_lookup(struct fastrpc_user *fl, int fd,
>>   static void fastrpc_buf_free(struct fastrpc_buf *buf)
>>   {
>>   	dma_free_coherent(buf->dev, buf->size, buf->virt,
>> -			  FASTRPC_PHYS(buf->phys));
>> +			  FASTRPC_PHYS(buf->dma_addr));
>>   	kfree(buf);
>>   }
>>   
>> @@ -408,12 +409,12 @@ static int __fastrpc_buf_alloc(struct fastrpc_user *fl, struct device *dev,
>>   
>>   	buf->fl = fl;
>>   	buf->virt = NULL;
>> -	buf->phys = 0;
>> +	buf->dma_addr = 0;
>>   	buf->size = size;
>>   	buf->dev = dev;
>>   	buf->raddr = 0;
>>   
>> -	buf->virt = dma_alloc_coherent(dev, buf->size, (dma_addr_t *)&buf->phys,
>> +	buf->virt = dma_alloc_coherent(dev, buf->size, (dma_addr_t *)&buf->dma_addr,
>>   				       GFP_KERNEL);
>>   	if (!buf->virt) {
>>   		mutex_destroy(&buf->lock);
>> @@ -439,7 +440,7 @@ static int fastrpc_buf_alloc(struct fastrpc_user *fl, struct device *dev,
>>   	buf = *obuf;
>>   
>>   	if (fl->sctx && fl->sctx->sid)
>> -		buf->phys += ((u64)fl->sctx->sid << 32);
>> +		buf->dma_addr += ((u64)fl->sctx->sid << 32);
>>   
>>   	return 0;
>>   }
>> @@ -684,7 +685,7 @@ static int fastrpc_dma_buf_attach(struct dma_buf *dmabuf,
>>   		return -ENOMEM;
>>   
>>   	ret = dma_get_sgtable(buffer->dev, &a->sgt, buffer->virt,
>> -			      FASTRPC_PHYS(buffer->phys), buffer->size);
>> +			      FASTRPC_PHYS(buffer->dma_addr), buffer->size);
>>   	if (ret < 0) {
>>   		dev_err(buffer->dev, "failed to get scatterlist from DMA API\n");
>>   		kfree(a);
>> @@ -733,7 +734,7 @@ static int fastrpc_mmap(struct dma_buf *dmabuf,
>>   	dma_resv_assert_held(dmabuf->resv);
>>   
>>   	return dma_mmap_coherent(buf->dev, vma, buf->virt,
>> -				 FASTRPC_PHYS(buf->phys), size);
>> +				 FASTRPC_PHYS(buf->dma_addr), size);
> 
> In fact, we invoke dma_alloc_coherent() above to get a dma_addr_t, and
> then we call map, unmap, and free on the lower 32 bits of that
> address...
> 
> In other words, each time we reference dma_addr we have that implicit
> thing that it's a composit of a dma_addr_t as seen from Linux's point of
> view (which is matching the addresses in the SMMU page tables) and the
> adjusted address that we use in communication with the firmware to
> direct the accesses to the right SID + iova.
> 
> I think it would be quite nice to make this more explicit throughout the
> code, rather than juggling the two perspectives in the same variable.
> 
> Regards,
> Bjorn
> 
>>   }
>>   
>>   static const struct dma_buf_ops fastrpc_dma_buf_ops = {
>> @@ -785,10 +786,10 @@ static int fastrpc_map_attach(struct fastrpc_user *fl, int fd,
>>   	map->table = table;
>>   
>>   	if (attr & FASTRPC_ATTR_SECUREMAP) {
>> -		map->phys = sg_phys(map->table->sgl);
>> +		map->dma_addr = sg_phys(map->table->sgl);
>>   	} else {
>> -		map->phys = sg_dma_address(map->table->sgl);
>> -		map->phys += ((u64)fl->sctx->sid << 32);
>> +		map->dma_addr = sg_dma_address(map->table->sgl);
>> +		map->dma_addr += ((u64)fl->sctx->sid << 32);
>>   	}
>>   	for_each_sg(map->table->sgl, sgl, map->table->nents,
>>   		sgl_index)
>> @@ -815,10 +816,11 @@ static int fastrpc_map_attach(struct fastrpc_user *fl, int fd,
>>   		dst_perms[1].vmid = fl->cctx->vmperms[0].vmid;
>>   		dst_perms[1].perm = QCOM_SCM_PERM_RWX;
>>   		map->attr = attr;
>> -		err = qcom_scm_assign_mem(map->phys, (u64)map->len, &src_perms, dst_perms, 2);
>> +		err = qcom_scm_assign_mem(map->dma_addr, (u64)map->len, &src_perms, dst_perms, 2);
>>   		if (err) {
>> -			dev_err(sess->dev, "Failed to assign memory with phys 0x%llx size 0x%llx err %d\n",
>> -					map->phys, map->len, err);
>> +			dev_err(sess->dev,
>> +				"Failed to assign memory with dma_addr 0x%llx size 0x%llx err %d\n",
>> +				map->dma_addr, map->len, err);
>>   			goto map_err;
>>   		}
>>   	}
>> @@ -1009,7 +1011,7 @@ static int fastrpc_get_args(u32 kernel, struct fastrpc_invoke_ctx *ctx)
>>   			struct vm_area_struct *vma = NULL;
>>   
>>   			rpra[i].buf.pv = (u64) ctx->args[i].ptr;
>> -			pages[i].addr = ctx->maps[i]->phys;
>> +			pages[i].addr = ctx->maps[i]->dma_addr;
>>   
>>   			mmap_read_lock(current->mm);
>>   			vma = find_vma(current->mm, ctx->args[i].ptr);
>> @@ -1036,7 +1038,7 @@ static int fastrpc_get_args(u32 kernel, struct fastrpc_invoke_ctx *ctx)
>>   				goto bail;
>>   
>>   			rpra[i].buf.pv = args - ctx->olaps[oix].offset;
>> -			pages[i].addr = ctx->buf->phys -
>> +			pages[i].addr = ctx->buf->dma_addr -
>>   					ctx->olaps[oix].offset +
>>   					(pkt_size - rlen);
>>   			pages[i].addr = pages[i].addr &	PAGE_MASK;
>> @@ -1068,7 +1070,7 @@ static int fastrpc_get_args(u32 kernel, struct fastrpc_invoke_ctx *ctx)
>>   		list[i].num = ctx->args[i].length ? 1 : 0;
>>   		list[i].pgidx = i;
>>   		if (ctx->maps[i]) {
>> -			pages[i].addr = ctx->maps[i]->phys;
>> +			pages[i].addr = ctx->maps[i]->dma_addr;
>>   			pages[i].size = ctx->maps[i]->size;
>>   		}
>>   		rpra[i].dma.fd = ctx->args[i].fd;
>> @@ -1150,7 +1152,7 @@ static int fastrpc_invoke_send(struct fastrpc_session_ctx *sctx,
>>   	msg->ctx = ctx->ctxid | fl->pd;
>>   	msg->handle = handle;
>>   	msg->sc = ctx->sc;
>> -	msg->addr = ctx->buf ? ctx->buf->phys : 0;
>> +	msg->addr = ctx->buf ? ctx->buf->dma_addr : 0;
>>   	msg->size = roundup(ctx->msg_sz, PAGE_SIZE);
>>   	fastrpc_context_get(ctx);
>>   
>> @@ -1306,13 +1308,14 @@ static int fastrpc_init_create_static_process(struct fastrpc_user *fl,
>>   		if (fl->cctx->vmcount) {
>>   			u64 src_perms = BIT(QCOM_SCM_VMID_HLOS);
>>   
>> -			err = qcom_scm_assign_mem(fl->cctx->remote_heap->phys,
>> +			err = qcom_scm_assign_mem(fl->cctx->remote_heap->dma_addr,
>>   							(u64)fl->cctx->remote_heap->size,
>>   							&src_perms,
>>   							fl->cctx->vmperms, fl->cctx->vmcount);
>>   			if (err) {
>> -				dev_err(fl->sctx->dev, "Failed to assign memory with phys 0x%llx size 0x%llx err %d\n",
>> -					fl->cctx->remote_heap->phys, fl->cctx->remote_heap->size, err);
>> +				dev_err(fl->sctx->dev,
>> +					"Failed to assign memory with dma_addr 0x%llx size 0x%llx err %d\n",
>> +					fl->cctx->remote_heap->dma_addr, fl->cctx->remote_heap->size, err);
>>   				goto err_map;
>>   			}
>>   			scm_done = true;
>> @@ -1332,7 +1335,7 @@ static int fastrpc_init_create_static_process(struct fastrpc_user *fl,
>>   	args[1].length = inbuf.namelen;
>>   	args[1].fd = -1;
>>   
>> -	pages[0].addr = fl->cctx->remote_heap->phys;
>> +	pages[0].addr = fl->cctx->remote_heap->dma_addr;
>>   	pages[0].size = fl->cctx->remote_heap->size;
>>   
>>   	args[2].ptr = (u64)(uintptr_t) pages;
>> @@ -1361,12 +1364,12 @@ static int fastrpc_init_create_static_process(struct fastrpc_user *fl,
>>   
>>   		dst_perms.vmid = QCOM_SCM_VMID_HLOS;
>>   		dst_perms.perm = QCOM_SCM_PERM_RWX;
>> -		err = qcom_scm_assign_mem(fl->cctx->remote_heap->phys,
>> +		err = qcom_scm_assign_mem(fl->cctx->remote_heap->dma_addr,
>>   						(u64)fl->cctx->remote_heap->size,
>>   						&src_perms, &dst_perms, 1);
>>   		if (err)
>> -			dev_err(fl->sctx->dev, "Failed to assign memory phys 0x%llx size 0x%llx err %d\n",
>> -				fl->cctx->remote_heap->phys, fl->cctx->remote_heap->size, err);
>> +			dev_err(fl->sctx->dev, "Failed to assign memory dma_addr 0x%llx size 0x%llx err %d\n",
>> +				fl->cctx->remote_heap->dma_addr, fl->cctx->remote_heap->size, err);
>>   	}
>>   err_map:
>>   	fastrpc_buf_free(fl->cctx->remote_heap);
>> @@ -1455,7 +1458,7 @@ static int fastrpc_init_create_process(struct fastrpc_user *fl,
>>   	args[2].length = inbuf.filelen;
>>   	args[2].fd = init.filefd;
>>   
>> -	pages[0].addr = imem->phys;
>> +	pages[0].addr = imem->dma_addr;
>>   	pages[0].size = imem->size;
>>   
>>   	args[3].ptr = (u64)(uintptr_t) pages;
>> @@ -1913,7 +1916,7 @@ static int fastrpc_req_mmap(struct fastrpc_user *fl, char __user *argp)
>>   	args[0].ptr = (u64) (uintptr_t) &req_msg;
>>   	args[0].length = sizeof(req_msg);
>>   
>> -	pages.addr = buf->phys;
>> +	pages.addr = buf->dma_addr;
>>   	pages.size = buf->size;
>>   
>>   	args[1].ptr = (u64) (uintptr_t) &pages;
>> @@ -1941,11 +1944,12 @@ static int fastrpc_req_mmap(struct fastrpc_user *fl, char __user *argp)
>>   	if (req.flags == ADSP_MMAP_REMOTE_HEAP_ADDR && fl->cctx->vmcount) {
>>   		u64 src_perms = BIT(QCOM_SCM_VMID_HLOS);
>>   
>> -		err = qcom_scm_assign_mem(buf->phys, (u64)buf->size,
>> +		err = qcom_scm_assign_mem(buf->dma_addr, (u64)buf->size,
>>   			&src_perms, fl->cctx->vmperms, fl->cctx->vmcount);
>>   		if (err) {
>> -			dev_err(fl->sctx->dev, "Failed to assign memory phys 0x%llx size 0x%llx err %d",
>> -					buf->phys, buf->size, err);
>> +			dev_err(fl->sctx->dev,
>> +				"Failed to assign memory dma_addr 0x%llx size 0x%llx err %d",
>> +				buf->dma_addr, buf->size, err);
>>   			goto err_assign;
>>   		}
>>   	}
>> @@ -2059,7 +2063,7 @@ static int fastrpc_req_mem_map(struct fastrpc_user *fl, char __user *argp)
>>   	args[0].ptr = (u64) (uintptr_t) &req_msg;
>>   	args[0].length = sizeof(req_msg);
>>   
>> -	pages.addr = map->phys;
>> +	pages.addr = map->dma_addr;
>>   	pages.size = map->len;
>>   
>>   	args[1].ptr = (u64) (uintptr_t) &pages;
>> -- 
>> 2.34.1
>>
>>

