Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E78C4AD5AA1
	for <lists+dri-devel@lfdr.de>; Wed, 11 Jun 2025 17:36:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 46FEF10E6AE;
	Wed, 11 Jun 2025 15:36:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="Q2C/oqyy";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5A22A10E6AE
 for <dri-devel@lists.freedesktop.org>; Wed, 11 Jun 2025 15:36:27 +0000 (UTC)
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55B9EntW021815
 for <dri-devel@lists.freedesktop.org>; Wed, 11 Jun 2025 15:36:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 GBpg7FRyPE2bOJtUQWGo/9McLlAo2Q//lTabaKYPhZI=; b=Q2C/oqyytHXh6n9X
 FJfs1Lidsh3BZTURLYn8OFNAW0KKj9Siuh3t4MrsW4ixee82vxGnWU+PuByS5Q1m
 GMg4wSF3hisP8GpR8RxrXtWW+5PRO/cVzlahvp3HzT7cemVc3g1v2bzPty+knR5M
 yUtk63ZEe/XnrzEZIinCuhSgVhc8ShKhptBefnXLG5ODlLIhz8p9VW/zOI+KvusR
 ZXyN44ReQK6TK3SbZoi/7EF+OYPo2EkBcH0UOXdDudrwE3xKFOQ3b8iPdzgO9VgH
 MK/QeA3yO+tCRRkmLgQoRkQbnrlBZW9gC9KQa+D7raSARTkJEA6agkqIH6UELzh9
 x0NzSw==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com
 [209.85.215.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 474eqcnfd3-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Wed, 11 Jun 2025 15:36:26 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id
 41be03b00d2f7-b26e4fe0c08so4367370a12.3
 for <dri-devel@lists.freedesktop.org>; Wed, 11 Jun 2025 08:36:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1749656186; x=1750260986;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=GBpg7FRyPE2bOJtUQWGo/9McLlAo2Q//lTabaKYPhZI=;
 b=sOeNYSe3ito7YGirnzI4XdAOw9lm9NOwPt4nBbtO62dijj4BgFfAcSQ0PnBqP0+MuI
 GA85zUQBNrlW1+oZvpbnmGIlPk608KsIDoeLKy62bRgFOomxYdfoBa7PcrOTn5y0qwED
 T2OqezqzU4ha/x5bbg+e2DxFG7yXjVI9sct7fd2XFXk1SCzVJyQXIB7cLM3D2sRrFnaJ
 FnTT3xaf/uSt8+1baN+etiQqfkzehH5ucioclOZAinyNSz7OT7Q2LjxaHRT9ImyS2RpG
 CDMQhQsaPia3v7YTklajXo6eDfmnwlXFkbizd2m1McRf7ekoGluq/mbOP29Hr9wzmpm6
 EOgA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXM3tb6WjpjrddKJ92Oox9gpunJXwBaVSf1mKNvxjIrsw+GZZFt47+Uqpb2RKPfpM22Xj74TdvCSD8=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwKzLWCHTCfPoi6vbMes4Aj33LWIcnQz+cpnLm+yjSwdz98TuEw
 XiPrZamLQ0uOaKkWTi+ruXdVqHAn7ELU0YsGykG8Il4/O6X3elS38rsWIGDMHc9JjmJzVRRtW9G
 DzlFr9OXDDLyCkgPfc2W4l46BQqu6gq/j+4CmqG/ntnKeqr+Q/ayxN3ghLCYMEOqjDYA44wA=
X-Gm-Gg: ASbGncvNq7S882jdSvEe8R1qwPffuQvgyBxNAinOTL9mM1eratZ9N2sLzV9rsOMr7Nc
 a7k1WWSz+wqfnJZZQU0OY00C8uEZXeDRObdFpsYmXXun+BCuNsYv3y3uTAItTgNgfX3uG/PJYWa
 kVPJNJC3KQq42YW24lcyq6mZ+8rgmcNdrNC3JWeyhg5fFzp6+94rMyex8P+klWN5+eK5ut6kg3x
 2vpWb9sQkqZcRKHvVR39v2aVKWYa0u6qeJnwSgaW3qwgX+F0PKI9RdAo1hgEgwS3h6u3obXSttb
 pr5eqtR/TG2MtDxb2z5ixbhiVjkP/dS05uObSw3UqH0Vfjdqjrx5z0vDVI7GZLpTdvLE0IDi
X-Received: by 2002:a17:903:178b:b0:235:f3b0:ae81 with SMTP id
 d9443c01a7336-23641b198bcmr43701795ad.27.1749656185728; 
 Wed, 11 Jun 2025 08:36:25 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHNe+ViZORDsP5Y/hLxF0FbUul9r0/EOhNQ+GwB+CKWOeGphnXlvWwwX3PPzsWyGWUpQjQ9/g==
X-Received: by 2002:a17:903:178b:b0:235:f3b0:ae81 with SMTP id
 d9443c01a7336-23641b198bcmr43701565ad.27.1749656185373; 
 Wed, 11 Jun 2025 08:36:25 -0700 (PDT)
Received: from [10.226.59.182] (i-global254.qualcomm.com. [199.106.103.254])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-23603097070sm88818405ad.62.2025.06.11.08.36.24
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 11 Jun 2025 08:36:25 -0700 (PDT)
Message-ID: <4e9508c6-8eac-4930-93c2-ebfe65df16c2@oss.qualcomm.com>
Date: Wed, 11 Jun 2025 09:36:23 -0600
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] accel/qaic: Use dev_printk() in RAS
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: quic_carlv@quicinc.com, quic_thanson@quicinc.com, lizhi.hou@amd.com,
 jacek.lawrynowicz@linux.intel.com, quic_yabdulra@quicinc.com,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org
References: <20250610175912.2086773-1-jeff.hugo@oss.qualcomm.com>
 <20250611083602.169893da@canb.auug.org.au>
Content-Language: en-US
From: Jeff Hugo <jeff.hugo@oss.qualcomm.com>
In-Reply-To: <20250611083602.169893da@canb.auug.org.au>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjExMDEzMSBTYWx0ZWRfX/ohAw1UpWRRp
 ag9C/UJLM7B9sT+yAG0RzevXD10nxUjhxsg+7Pg3tK9RbnqMhLqxNDWfc2iMU7PIXqiTlbSfCMN
 lRu6QzdIs5oQELV7Nb7FhtSvrKoqiLY6fzH1rP2a6aOsPZsDnWMUw8LCmphOWeMcKQm+keUMj48
 Z3m1oR2xRQ82zr0CgboDBhOCquV+Va6Ipe63fmaC7CH2JZTJGV1c/hfF8YujGgBv+ATKZ3NvD/6
 ALE2WKMcgLCvGce0qK6aD423X1Fd27mWMfVQ7uGg1OECuAOG9UuMoTwG86UFQzzo1tK/V7PHfTR
 tAYathE9AqzOOVkrZKtXIozJlfdAYUmaqHlcoV6hEC9OcRw9p+sMV8eHK9oSzy3ynQCIJNxUYTC
 J0m7fUn9Uv4vkUBp/uJovVGcZ3EZHZyUQYXTrX8rqnFDGNPzHcvtezBIcSnGkQkGzn13boGd
X-Authority-Analysis: v=2.4 cv=Q7TS452a c=1 sm=1 tr=0 ts=6849a27a cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=VwQbUJbxAAAA:8 a=rOUgymgbAAAA:8
 a=EUspDBNiAAAA:8 a=CiQAVfEbOHSXt17sDtkA:9 a=QEXdDO2ut3YA:10
 a=3WC7DwWrALyhR5TkjVHa:22 a=MP9ZtiD8KjrkvI0BhSjB:22
X-Proofpoint-GUID: sZ8yZUayCFc4-do4qTpiyJNm_9C3pIjM
X-Proofpoint-ORIG-GUID: sZ8yZUayCFc4-do4qTpiyJNm_9C3pIjM
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-11_05,2025-06-10_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 mlxscore=0 spamscore=0 mlxlogscore=999
 bulkscore=0 clxscore=1015 lowpriorityscore=0 adultscore=0 impostorscore=0
 priorityscore=1501 malwarescore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506110131
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

On 6/10/2025 4:36 PM, Stephen Rothwell wrote:
> Hi Jeff,
> 
> On Tue, 10 Jun 2025 11:59:12 -0600 Jeff Hugo <jeff.hugo@oss.qualcomm.com> wrote:
>>
>> pci_printk() was removed with commit 1c8a0ed2043c ("PCI: Remove unused pci_printk()")
>> so change to using dev_printk().
>>
>> Fixes: c11a50b170e7 ("accel/qaic: Add Reliability, Accessibility, Serviceability (RAS)")
>> Reported-by: Stephen Rothwell <sfr@canb.auug.org.au>
>> Closes: https://lore.kernel.org/all/20250610124809.1e1ff0cd@canb.auug.org.au/
>> Signed-off-by: Jeff Hugo <jeff.hugo@oss.qualcomm.com>
>> ---
>>   drivers/accel/qaic/qaic_ras.c | 16 ++++++++--------
>>   1 file changed, 8 insertions(+), 8 deletions(-)
> 
> Thanks.  I will apply that to the drm-misc tree merge until it is
> applied to the drm-misc tree itself.
> 

Thank you very much for the report. Pushed to drm-misc-next. Hopefully 
it will make its way to you via normal channels very soon.

-Jeff
