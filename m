Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 75E55A616EF
	for <lists+dri-devel@lfdr.de>; Fri, 14 Mar 2025 18:00:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6BFD610E352;
	Fri, 14 Mar 2025 17:00:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="Vkg2oNws";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 05D2310E352
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Mar 2025 17:00:27 +0000 (UTC)
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52ECRkU9031816
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Mar 2025 17:00:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 Vj80ZitApyxnsoDCCb/FGtnDuHwIs7XmDAt2lhrvDG4=; b=Vkg2oNwsSosCvSbh
 QFti8bEokE+IR5cahTdbUw0/QeAZGqifmVOCA+fSjLlg77anwwC4E57dMNmj0Dc2
 xK5fR9WtgA2t7HD90OorO53rm4wbjBFQeGACdyxRbxt2Jor+3vLWhGt0a4F7ltyz
 uDtATJWe9QUBiYPvUrlzgBnT2pk7oN5pSxirXFCrjzkFwRzQshP9leUThRBkLyuG
 ZVE9Wtp4OgFdoCtPcw1OMkRuA9zaawuAYDj2WCugjvoemTAY9+c9+n6H3n2EAZW/
 LwXbm6sk6KVdfnWrWnG5ftYzjXzsNqtptJY/IoD6Tg1qx9c/Up2fUcWKIp8qKRwH
 qpbWIQ==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com
 [209.85.214.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45bx1jmave-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Mar 2025 17:00:27 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id
 d9443c01a7336-2217a4bfcc7so38914795ad.3
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Mar 2025 10:00:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1741971626; x=1742576426;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Vj80ZitApyxnsoDCCb/FGtnDuHwIs7XmDAt2lhrvDG4=;
 b=RPSKdaIOEqmufQJkzSF2mVCwss3Q2v0cek1pZagShaqJlH+pphnW3TtuBVTMqbZwGB
 VJj7OU9Ccbo2p7wwxPnawOUMhJfmILCrxGAV8mNB3QnoC1fQWpmmOnn/DAUrfeH5KjWa
 Wq60T/dBeNBqcAGa9to4M381SWTCsnesPb5raWdj4Re9Xm9YdVZYNX68u47YUlU3YKly
 UiGnOEziICnYPAnkjZ02FEBl35OGI/QoPy++7oQ2hTBIeuqC02vWhHhZFuna23lpxZV2
 kNwrGS/ahoTiM6QGHtT0eMEwgn/Ph30nFPNdWgGElQF9yJo4QC4kqau/sg8EubDYDePm
 EZJg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUJF556QX3zZYHJX2ZPfzQmJ9Ej+tWAkAa3kiOgR3LGfU9PMHrwhKfhGMtpwhFeP7PVC1NaUdphKS0=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwpWWR2RS4wFNUqw5CFwH2XqMNRzEkyXCZ+hBFqymF0fwcl8k+3
 1xMcqS+DnNUfqVw/tZE65fU7ow3T3zaTUi2JOJFmAW0WejCI51HBgdP4ubrBVUfIPK5Prpvjr+n
 GCm2absAohzjUHsthFJH+4DIl8ISEyTT9aORVjBNpHLyd0Ue5Zha9IaiItWXhw6VAj2k=
X-Gm-Gg: ASbGncs++M1stF6cOja0QmJJjPY2toNLD05RDIZ/nKUwO+VeiCbfPTUnHa20Cb+626B
 JduJh0MRD+nQaWnL93xTpl7gRyXHweBoAf7qfsb9CKQs9pHwps+vOEas1EJ1uSw6BEEI+CG5B1m
 EuoxXH0wbMYZcKntWKSz0RqhntEZDcpulFnZ8hLivvMSgfCsgn1JhmplseO9UbVk7JM50KYi6Ao
 fGnkLZwY/8UytcqI8Mi8oL3TVB99ULw/I3038AIKUmnfjrE4FbV0HumLC6S3CF3jIHHCJmVMWWh
 x+YX7I5YOM8xNJC9o/NMU7VK+PcbDsNqabd1POzlyM8Pk4r2+pXJGKuErl0WPHV7yA==
X-Received: by 2002:a17:902:d542:b0:223:58ff:c722 with SMTP id
 d9443c01a7336-225e0a75b3fmr50537645ad.28.1741971626473; 
 Fri, 14 Mar 2025 10:00:26 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGgaTrqJvv3hrH5zwdalhsLolvqrISTAGweaj7t70Pd1LstxRhICYIFHsdLjBTzxckLK/Z9NQ==
X-Received: by 2002:a17:902:d542:b0:223:58ff:c722 with SMTP id
 d9443c01a7336-225e0a75b3fmr50537025ad.28.1741971626026; 
 Fri, 14 Mar 2025 10:00:26 -0700 (PDT)
Received: from [10.226.59.182] (i-global254.qualcomm.com. [199.106.103.254])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-225c6bbed72sm30782835ad.197.2025.03.14.10.00.25
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 14 Mar 2025 10:00:25 -0700 (PDT)
Message-ID: <ceedce0e-4294-4ff8-aa70-d2a077b4034d@oss.qualcomm.com>
Date: Fri, 14 Mar 2025 11:00:24 -0600
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] accel/qaic: Remove redundant 'flush_workqueue()' calls
To: Chen Ni <nichen@iscas.ac.cn>, quic_carlv@quicinc.com, ogabbay@kernel.org, 
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
References: <20250312073404.1429992-1-nichen@iscas.ac.cn>
Content-Language: en-US
From: Jeff Hugo <jeff.hugo@oss.qualcomm.com>
In-Reply-To: <20250312073404.1429992-1-nichen@iscas.ac.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=CNQqXQrD c=1 sm=1 tr=0 ts=67d460ab cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=IkcTkHD0fZMA:10 a=Vs1iUdzkB0EA:10 a=EUspDBNiAAAA:8 a=jdnOPd7pnXj7N3RGrIQA:9
 a=QEXdDO2ut3YA:10 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-ORIG-GUID: dfK1djnrk9rn5pZH5VT18bf1kyQguVMl
X-Proofpoint-GUID: dfK1djnrk9rn5pZH5VT18bf1kyQguVMl
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1093,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-14_06,2025-03-14_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0
 mlxlogscore=907 impostorscore=0 mlxscore=0 priorityscore=1501
 suspectscore=0 phishscore=0 malwarescore=0 clxscore=1015 bulkscore=0
 adultscore=0 spamscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2503140133
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

On 3/12/2025 1:34 AM, Chen Ni wrote:
> 'destroy_workqueue()' already drains the queue before destroying it, so
> there is no need to flush it explicitly.
> 
> Remove the redundant 'flush_workqueue()' calls.
> 
> This was generated with coccinelle:
> 
> @@
> expression E;
> @@
> - flush_workqueue(E);
>    destroy_workqueue(E);
> 
> Signed-off-by: Chen Ni <nichen@iscas.ac.cn>

Reviewed-by: Jeff Hugo <jeff.hugo@oss.qualcomm.com>
