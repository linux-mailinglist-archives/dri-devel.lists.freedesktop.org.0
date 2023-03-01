Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D70F6A708E
	for <lists+dri-devel@lfdr.de>; Wed,  1 Mar 2023 17:08:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2525210E2F1;
	Wed,  1 Mar 2023 16:08:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 36C3A10E2F1
 for <dri-devel@lists.freedesktop.org>; Wed,  1 Mar 2023 16:08:11 +0000 (UTC)
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 321FEZde009799; Wed, 1 Mar 2023 16:08:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=tnUic79Fz9XkJceYdCri/sylXCNffUEx2TPqpiTBdos=;
 b=UTyAJZS7X5+Ru4uvIDwChCGCbdEMVKCzG+TX6zVzcLw1tV3Ka7Ymt4XK2ccOl0bgLLiK
 ejMw0p4o4QboJv57aRVUAqirNRI14ed/c4T2dGvk33OV/ZiMet2xcCKKkEu0Nq5/oFWl
 36mTje6axGyQ9MBFAqBOX+nlPqGseFte8JIoyYqDQJtph9ovGSWbZxptdCQFP0DOaD2e
 kqitpjVXNk2R5WjlgU7QPt6/IoGr/tXh/06kRg+8DKQwoRNxBzkkE391+kT+8IyQaNOg
 9i6zeQ67sB2qZgI92zJJPKlZD6rUuSqzkfTO2smAwqx0ULrOsF+MMUipkFldLoJtmNpf 6g== 
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3p24yursry-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 01 Mar 2023 16:08:06 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA03.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 321G85Vi018152
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 1 Mar 2023 16:08:05 GMT
Received: from [10.226.59.182] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.41; Wed, 1 Mar 2023
 08:08:04 -0800
Message-ID: <83543d98-e624-fadc-7f92-490efa602805@quicinc.com>
Date: Wed, 1 Mar 2023 09:08:03 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.0
Subject: Re: [PATCH v2 5/8] accel/qaic: Add datapath
Content-Language: en-US
To: Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>
References: <1675698105-19025-1-git-send-email-quic_jhugo@quicinc.com>
 <1675698105-19025-6-git-send-email-quic_jhugo@quicinc.com>
 <20230224152546.GB3547587@linux.intel.com>
 <00914fa9-8618-a3ef-d3c5-2a3bba68fa1f@quicinc.com>
 <20230227171454.GF3547587@linux.intel.com>
From: Jeffrey Hugo <quic_jhugo@quicinc.com>
In-Reply-To: <20230227171454.GF3547587@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: aeNUVinjxZnpdQ73MMAVN7N7iiPNi8wE
X-Proofpoint-ORIG-GUID: aeNUVinjxZnpdQ73MMAVN7N7iiPNi8wE
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-03-01_13,2023-03-01_03,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0
 bulkscore=0 priorityscore=1501 malwarescore=0 suspectscore=0 mlxscore=0
 adultscore=0 spamscore=0 mlxlogscore=999 phishscore=0 lowpriorityscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2212070000
 definitions=main-2303010131
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
Cc: linux-doc@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 ogabbay@kernel.org, dri-devel@lists.freedesktop.org, quic_ajitpals@quicinc.com,
 quic_pkanojiy@quicinc.com, quic_carlv@quicinc.com,
 jacek.lawrynowicz@linux.intel.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 2/27/2023 10:14 AM, Stanislaw Gruszka wrote:
> On Fri, Feb 24, 2023 at 12:36:51PM -0700, Jeffrey Hugo wrote:
>>>> +static int reserve_pages(unsigned long start_pfn, unsigned long nr_pages,
>>>> +			 bool reserve)
>>>> +{
>>>> +	unsigned long pfn;
>>>> +	unsigned long end_pfn = start_pfn + nr_pages;
>>>> +	struct page *page;
>>>> +
>>>> +	for (pfn = start_pfn; pfn < end_pfn; pfn++) {
>>>> +		if (!pfn_valid(pfn))
>>>> +			return -EINVAL;
>>>> +		page =  pfn_to_page(pfn);
>>>> +		if (reserve)
>>>> +			SetPageReserved(page);
>>>> +		else
>>>> +			ClearPageReserved(page);
>>>
>>> It is needed? Looks like taken from some legacy code.
>>
>> Required for remap_pfn_range().
> 
> PG_reserved is not required any longer for remap_pfn_range(), here
> is excerpt from comment from include/linux/page-flags.h :
> 
>   * Some PG_reserved pages will be excluded from the hibernation image.
>   * PG_reserved does in general not hinder anybody from dumping or swapping
>   * and is no longer required for remap_pfn_range(). ioremap might require it.
>   * Consequently, PG_reserved for a page mapped into user space can indicate
>   * the zero page, the vDSO, MMIO pages or device memory.

I clearly missed that and was relying on other documentation.  Thank you 
for pointing this out.  Will remove.

> 
>>>> +static int copy_sgt(struct qaic_device *qdev, struct sg_table **sgt_out,
>>>> +		    struct sg_table *sgt_in, u64 size, u64 offset)
>>>> +{
>>>> +	int total_len, len, nents, offf = 0, offl = 0;
>>>> +	struct scatterlist *sg, *sgn, *sgf, *sgl;
>>>> +	struct sg_table *sgt;
>>>> +	int ret, j;
>>>> +
>>>> +	/* find out number of relevant nents needed for this mem */
>>>> +	total_len = 0;
>>>> +	sgf = NULL;
>>>> +	sgl = NULL;
>>>> +	nents = 0;
>>>> +
>>>> +	size = size ? size : PAGE_SIZE;
>>>> +	for (sg = sgt_in->sgl; sg; sg = sg_next(sg)) {
>>>> +		len = sg_dma_len(sg);
>>>> +
>>>> +		if (!len)
>>>> +			continue;
>>>> +		if (offset >= total_len && offset < total_len + len) {
>>>> +			sgf = sg;
>>>> +			offf = offset - total_len;
>>>> +		}
>>>> +		if (sgf)
>>>> +			nents++;
>>>> +		if (offset + size >= total_len &&
>>>> +		    offset + size <= total_len + len) {
>>>> +			sgl = sg;
>>>> +			offl = offset + size - total_len;
>>>> +			break;
>>>> +		}
>>>> +		total_len += len;
>>>> +	}
>>>> +
>>>> +	if (!sgf || !sgl) {
>>>> +		ret = -EINVAL;
>>>> +		goto out;
>>>> +	}
>>>> +
>>>> +	sgt = kzalloc(sizeof(*sgt), GFP_KERNEL);
>>>> +	if (!sgt) {
>>>> +		ret = -ENOMEM;
>>>> +		goto out;
>>>> +	}
>>>> +
>>>> +	ret = sg_alloc_table(sgt, nents, GFP_KERNEL);
>>>> +	if (ret)
>>>> +		goto free_sgt;
>>>> +
>>>> +	/* copy relevant sg node and fix page and length */
>>>> +	sgn = sgf;
>>>> +	for_each_sgtable_sg(sgt, sg, j) {
>>>> +		memcpy(sg, sgn, sizeof(*sg));
>>>> +		if (sgn == sgf) {
>>>> +			sg_dma_address(sg) += offf;
> 
> This looks a bit suspicious. Are you sure you can modify
> sg->dma_address and still use it as valid value ?

A single entry in the sg table is a contiguous mapping of memory.  If it 
wasn't contiguous, it would have to be broken up into multiple entries. 
  In the simple case, a driver is going to take the dma_address/len pair 
and hand that directly to the device.  Then the device is going to 
access every address in that range.

If the device can access every address from dma_address to dma_address + 
len, why can't it access a subset of that?

>>>> +			sg_dma_len(sg) -= offf;
>>>> +			sg_set_page(sg, sg_page(sgn),
>>>> +				    sg_dma_len(sg), offf);
>>>> +		} else {
>>>> +			offf = 0;
>>>> +		}
>>>> +		if (sgn == sgl) {
>>>> +			sg_dma_len(sg) = offl - offf;
>>>> +			sg_set_page(sg, sg_page(sgn),
>>>> +				    offl - offf, offf);
>>>> +			sg_mark_end(sg);
>>>> +			break;
>>>> +		}
>>>> +		sgn = sg_next(sgn);
>>>> +	}
>>>
>>> Why not use sg_copy_table() ? Overall copy_sgt() seems to be something
>>> that could be replaced by generic helper or at least simplify.
>>
>> I don't see "sg_copy_table" defined in 6.2.
> 
> Because there is no such function in any kernel source. It was only my
> imagination, not sure right now how I came up with this function name :-/
> Sorry about confusion.
> 
> There are only sg_copy_{to,from}_buffer(), but not really useful in
> this case.
> 
>> Are you suggesting renaming
>> this function?  I guess I'm not quite understanding your comment here. Can
>> you elaborate?
> 
> Renaming would be nice. I was thinking by simplifying it, not sure
> now if that's easy achievable, though.

Ok.  I'll think on this.

