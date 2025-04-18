Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 268E0A939A7
	for <lists+dri-devel@lfdr.de>; Fri, 18 Apr 2025 17:30:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6F41310E214;
	Fri, 18 Apr 2025 15:30:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="CsqpLplN";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2993710E214
 for <dri-devel@lists.freedesktop.org>; Fri, 18 Apr 2025 15:30:15 +0000 (UTC)
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53IEVpCj013277
 for <dri-devel@lists.freedesktop.org>; Fri, 18 Apr 2025 15:30:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 4CkX4Ng6zp2NEUOg0cWNDXOFaKUZqvkoxGvXodyedus=; b=CsqpLplNXKlYiw9D
 C4sDQZQffVCcBi8BSe0Bov5AZq+BGvr5mD1dE9rnQh0kAOmbGfmdlceeSXlhjDz7
 wK+Q/7gKZvUwM6m2x/aBEI86mpsCIVUSC+PYSHtT0EWjd1avcVeSszaSECmDNXgG
 CMB7RfmP0SQeUTtm0JoXg1DIrmviJHrwSNdcM6Qms09im4UynXtT2/aWrMi9S/uQ
 FmN0Vad1ghdFVI6jMcTYnqDVGozts/xQY6ziIEipXqI0MSZU46qRJ21QWxit3WX9
 Z/g5ol4/FFN2OZ4EpBidNBaAr3YFuRiu//wcW+vcQH+0Hi3MrPsrUSbNmkM8Z3pP
 YPMXUQ==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com
 [209.85.215.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4628rvfmdr-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Fri, 18 Apr 2025 15:30:14 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id
 41be03b00d2f7-b00cd79a5e6so2062936a12.3
 for <dri-devel@lists.freedesktop.org>; Fri, 18 Apr 2025 08:30:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1744990214; x=1745595014;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=4CkX4Ng6zp2NEUOg0cWNDXOFaKUZqvkoxGvXodyedus=;
 b=Zpiv8hcMZ3nG63ULOg8u5NVFH9St27DzkDYWs5f/IvkwRcSIA0jfuXuQHAhxexYfbE
 voeY6MfUzP97/2+jsIjinAGOzK98HV5SzZ0fKrwD8OkHIYU04dd5ODix8EdDUcll4Nyb
 AizREELVY+tCC/HXoA8+eXskmHwGZgkzKWD4xztZpkVW+UlLzf6zy+Hh5lOLv/Va75es
 AOULsMSGk2+Gd/9YIwaYjHeZSqLCFQCbhmc7Nu0IB4mjJiOUvC9Q8mNaaDv5apXViUxO
 4B0WKg2MfNHdFl5p0NC4g99CRv11Ki9MKocUr3w7nScoVwa5nTownzOr+jOfyWnea/nS
 EOHQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVn6tXt+cdhe5mDNMB6Lhez3p/KLfEdmnifgAojzrqpHYaYUc3dKGBA+v/+nPkwgaKvI1mz7+JTAfI=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzCJOGrd4CThkZZ9oMckhtBG07BMonCaZMjZL11kJulRupOsFLV
 duJeJGtOBgIfUGPXLKI0g/cHFRn+UownvWRPMtTw7VY8B0wdFn24g3aBp3oXgL9B9aupmBEJ2ii
 IYQDjbKE54XPx1KY7wk7mUPOQLE/j+Z+svp5SoQh46W1QDy+FDULN8923hwY3PfPqBv8=
X-Gm-Gg: ASbGncsOptNbDwjAiEsYoNN5JW0tL7gCLn6QoONTM5lMKoQzC0qbbng5wLZnWmOWMsy
 T212TUU7qx5lyAEDBghOzgoIQFtTo8y93vhvF5cuC85RjY67of0VXpts5M7tXVMrBpvJMA1Ts+C
 Uf1kZunR48xprogk3SwiiF7a5rkRVHv0d7dTMEghl7lSPycCyZi3WxrmD+NmG8SUbf98oYY4raM
 alKPIvExu+jQ/SuwvxblxLvMbotYdjmlgFQtR1gnuOrXQ328XzYRCj9mOotipL4UQoGYbtXRqD3
 LrEeMDTiJwiC1a67ds/IDR3vjZplwCO+E/RoLFJ8Sjfq/Zr8SRSJ6BVrEJY+rQ==
X-Received: by 2002:a05:6a20:6f03:b0:1f5:80a3:b008 with SMTP id
 adf61e73a8af0-203cbcd6e19mr5999404637.32.1744990213883; 
 Fri, 18 Apr 2025 08:30:13 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEoQ3qbZ7XPTcBGg1tKHygMMg7MKPS8W++BKm4L0YsfWkg60FUxAk/PNudkzXGDoKHkFo7QHQ==
X-Received: by 2002:a05:6a20:6f03:b0:1f5:80a3:b008 with SMTP id
 adf61e73a8af0-203cbcd6e19mr5999358637.32.1744990213495; 
 Fri, 18 Apr 2025 08:30:13 -0700 (PDT)
Received: from [10.226.59.182] (i-global254.qualcomm.com. [199.106.103.254])
 by smtp.gmail.com with ESMTPSA id
 41be03b00d2f7-b0db157d243sm1510411a12.73.2025.04.18.08.30.12
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 18 Apr 2025 08:30:13 -0700 (PDT)
Message-ID: <230eaab9-c91c-434a-86d6-c95e626f7d35@oss.qualcomm.com>
Date: Fri, 18 Apr 2025 09:30:12 -0600
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] accel/ivpu: Fix the D0i2 disable test mode
To: Maciej Falkowski <maciej.falkowski@linux.intel.com>,
 dri-devel@lists.freedesktop.org
Cc: oded.gabbay@gmail.com, jacek.lawrynowicz@linux.intel.com,
 lizhi.hou@amd.com, Andrzej Kacprowski <Andrzej.Kacprowski@linux.intel.com>
References: <20250416102629.384626-1-maciej.falkowski@linux.intel.com>
Content-Language: en-US
From: Jeff Hugo <jeff.hugo@oss.qualcomm.com>
In-Reply-To: <20250416102629.384626-1-maciej.falkowski@linux.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: OdB1pprO477mKf4DeuqYW7-mwTXgNJvW
X-Authority-Analysis: v=2.4 cv=RbSQC0tv c=1 sm=1 tr=0 ts=68027006 cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=QyXUC8HyAAAA:8 a=EUspDBNiAAAA:8
 a=Dazju9N7mY0vhJR6QN4A:9 a=QEXdDO2ut3YA:10
 a=bFCP_H2QrGi7Okbo017w:22
X-Proofpoint-GUID: OdB1pprO477mKf4DeuqYW7-mwTXgNJvW
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-18_05,2025-04-17_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxlogscore=999
 suspectscore=0 adultscore=0 impostorscore=0 clxscore=1015 bulkscore=0
 phishscore=0 priorityscore=1501 spamscore=0 mlxscore=0 lowpriorityscore=0
 malwarescore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504180114
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

On 4/16/2025 4:26 AM, Maciej Falkowski wrote:
> From: Andrzej Kacprowski <Andrzej.Kacprowski@linux.intel.com>
> 
> Correct setup of D0i2 disable which was
> by mistake set up to value 1 and use BIT(1) instead.
> 
> Fixes: 011529fe8112 ("accel/ivpu: Implement D0i2 disable test mode")
> Signed-off-by: Andrzej Kacprowski <Andrzej.Kacprowski@linux.intel.com>
> Signed-off-by: Maciej Falkowski <maciej.falkowski@linux.intel.com>

Reviewed-by: Jeff Hugo <jeff.hugo@oss.qualcomm.com>
