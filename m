Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DBA56C2183A
	for <lists+dri-devel@lfdr.de>; Thu, 30 Oct 2025 18:36:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E878310E2E0;
	Thu, 30 Oct 2025 17:36:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="Q92/7ElM";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="gcSdD3un";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5C62B10E2E0
 for <dri-devel@lists.freedesktop.org>; Thu, 30 Oct 2025 17:36:18 +0000 (UTC)
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 59U9ERXl1994523
 for <dri-devel@lists.freedesktop.org>; Thu, 30 Oct 2025 17:36:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 bajkHqMMv5pqZJo4QCw1Ta2zYwtF/RwQTRuwpNjkSLQ=; b=Q92/7ElMP3R0fyOM
 imgHlHInp3GVvOBewB7MFleKB9oBawKM8a9G3uXojFbFsdR1ylWJH3MusQ+/hvnL
 iZ+7OxLTNG2nY0Zbg1GvCDhC10IoON+63JDhw6wDLj1irFyIFwtPIgAqItlwbmTl
 +L9mM8lkq7VQi3WluSw7QttRzuzk4oPwVj4mVAeuG6vL4v+5dngvboPLXJFstPrK
 uruBs/H/uBVdfQB4LHCTkrTc1WsnVSd2YERbfefOZd45XXZ0sHGkbCSl9kbvk5qy
 F8TdzZHxIB9KuHLqmRJL8n/HllTQoV9T9dhhXGyM8IYs1+ms3D1BboL4IJF5UHLB
 +U0IaQ==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com
 [209.85.216.72])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4a3wr72qa8-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Thu, 30 Oct 2025 17:36:17 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id
 98e67ed59e1d1-340410b11b8so1208379a91.2
 for <dri-devel@lists.freedesktop.org>; Thu, 30 Oct 2025 10:36:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1761845776; x=1762450576;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=bajkHqMMv5pqZJo4QCw1Ta2zYwtF/RwQTRuwpNjkSLQ=;
 b=gcSdD3unyujYvgq35PK2AH5P9ROZnECYAiWcwx3oUrNVQEV8bGNSrKi41QjWE09p5A
 fTwHTtQzEWNPapRCgd0UI4IoDyST1bETeoL2g7FF1mIktHIGPJr43imL6FU/PBBk3hSW
 KaAQxX8o0x1ILoUlu7Hyp5SbZOBAy/ZIyUWu1c5TvD+0Q4K5LEiw3/nGXcprS9z4vl6a
 tcCxMbP96hlBcAwSAIgBkaj4ynvxerXKbuDGHPXMSfAuYUKQSKbW9vKrAbme0J8e8R2F
 k5iuQQoRt36EKNuE+pO7kKtjy+qAIMS5K+5nj/FR2PIdgavV4x1fIMGI3KAYopqfxGFP
 0nTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1761845776; x=1762450576;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=bajkHqMMv5pqZJo4QCw1Ta2zYwtF/RwQTRuwpNjkSLQ=;
 b=dNvtzOBMnTN+zVO67Q8qrq86ZNoF2IQCAhMsSYNkuXhgfOnI2dHIAUMEZ92w146uyD
 OShkLD7CAHqu2fNkU3tQCKJI0YDgGsGhJOaHeO0gUlMS9L7kdRH62eMifMFITx4c2vrH
 3PFjs34i4EILjzFr2Y5v3C/We89YV/3IiG9nVzoDFdcBHgW1CSsbsyybGCcdYJyCjAU4
 gPZLxECtZlEyjynsCk7ICcLIEu9MKpY2ONw/Dta2Mmz8KVkDTA3OXvTtNNM8tf+hbOoe
 AsvuIAh2RuuqnE8qLaKHGBWAQmP/zTqrmulwfjB2WQcLCm1B78Wvyjw2Ygxg2B/6CvzJ
 Yn3Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCXU9c3lg6ZyFcSwCvWUzWw/yaGCu3y0XxPoxjyYr1r+p5vs9dQ57O5TtYyu9p/aDzcLJSU2iQ4HK4I=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyUZ4OEJ0rUTpyocy70vjRpFIsj/FDx9Cf5LpJu44ABngRDm3p1
 66GHrLxnkSziF1ElG68cnQ1t3EWC2qbD+csV1S0PXzFhHNzAfQqheKvvbUQ5etSKKWUPnog1Icg
 XGGqRAo8LGNuatVQYBifTFUk73Y/cSOIDBUIQ9eQYYX1PAM9Pz38GIMcWWQl3zH5KTDgbqqk=
X-Gm-Gg: ASbGncshpMLHT1CF6FR9Bdc26DDStD65GzybTgfYhEiUX0FjrxJu9Sp47uuodgsNiz3
 +rbHvVfTzYujCx1EpW/QaYCSl49PavNrzKz8epKPpRgZnDP02GYGl0KpUPwyYlSpX+ISpzLtgpl
 TvBnWRnZ20M55AlDRAlO/nJBCLwj/QKWatWJQJJlVgMF7O2jUkI8xiE5knq1DNlBVN8OyEA1Xhi
 sYSePsaWLLxdQ3M8VOa6jGd51G2QzN9jRcdSU5a2fIvNypX59MxSNIA+fVoqKXzs4DvhwjWWcPq
 krwXWUBKP97l9kvNtdAWIcAV8gqZtQD9cFDA0CQqSoGvM/5uhxcTcjIlpGzuBgBZ3tXq71/LXNW
 BUvE1dDwo1TdIod+wDRHAwA6ovdJCEbAke3v2nHQBfFHDo7yI1Rmm
X-Received: by 2002:a17:90b:5490:b0:33b:cbb2:31ed with SMTP id
 98e67ed59e1d1-34082f057a0mr726845a91.0.1761845776344; 
 Thu, 30 Oct 2025 10:36:16 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFjy1qSt2hZ98/eZvNJ9wygZ/dv5c3bUXaazDj2M0X/Bxw7LMUxGQjHWbaOsqTKpz9V8v3MMA==
X-Received: by 2002:a17:90b:5490:b0:33b:cbb2:31ed with SMTP id
 98e67ed59e1d1-34082f057a0mr726805a91.0.1761845775801; 
 Thu, 30 Oct 2025 10:36:15 -0700 (PDT)
Received: from [10.226.59.182] (i-global254.qualcomm.com. [199.106.103.254])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-340509b444bsm3239247a91.13.2025.10.30.10.36.14
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 30 Oct 2025 10:36:15 -0700 (PDT)
Message-ID: <e89a830c-020b-4970-a649-86850246a530@oss.qualcomm.com>
Date: Thu, 30 Oct 2025 11:36:13 -0600
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] accel/qaic: Fix typos in the documentation for qaic
To: Youssef Samir <youssef.abdulrahman@oss.qualcomm.com>,
 carl.vanderlip@oss.qualcomm.com, troy.hanson@oss.qualcomm.com,
 zachary.mckevitt@oss.qualcomm.com
Cc: ogabbay@kernel.org, lizhi.hou@amd.com, karol.wachowski@linux.intel.com,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org
References: <20251024165749.821414-1-youssef.abdulrahman@oss.qualcomm.com>
Content-Language: en-US
From: Jeff Hugo <jeff.hugo@oss.qualcomm.com>
In-Reply-To: <20251024165749.821414-1-youssef.abdulrahman@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDMwMDE0NSBTYWx0ZWRfX8sBXAOxWjsFi
 5iu6RPR27UF6IeBdYv6AaJAIQA+kFQmBdAH4CjBjDXI+8oEvwEK23S8rqm5T/J8aJMP5maLHjtI
 pEdGlHekAGFaUTP0d5uMGoUGjs0byRl663KXGmn7J41kpoT9XasFtqtGq5E1unaEbmPP6IbwGXG
 550T0ecpVO63lVXIl8uxiOlbvrwZVqQBAncvsVzZ1NWxzE3nODMbp28o2iaIs0WeYLRGxx8rLay
 pNZ6Gjy+f9FueqD7f6LwdPGBDPunZl/H05X0/VTfsEVUgBbucEOyjMDcmp3v/O8KpIPRzA4d6WS
 JQb+cMoCK5gDhFUdHAgytAa0Xvn0cVQyt/6q5k6T2qdqiZqRL6oOvCYw5NfFBu/BDo9J/7LXwSC
 ey6XBRKLpwz8pBZRK3cbZHKNaUJHGg==
X-Authority-Analysis: v=2.4 cv=P+Y3RyAu c=1 sm=1 tr=0 ts=6903a211 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8
 a=_LXf31rqrPtJYysunv4A:9 a=QEXdDO2ut3YA:10 a=5OH7ri-qmpsA:10
 a=iS9zxrgQBfv6-_F4QbHw:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: V7WTJU5FlhhFOmuf-AOIWBEySu7xEllw
X-Proofpoint-GUID: V7WTJU5FlhhFOmuf-AOIWBEySu7xEllw
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-10-30_05,2025-10-29_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 spamscore=0 lowpriorityscore=0
 priorityscore=1501 phishscore=0 malwarescore=0 adultscore=0 impostorscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2510300145
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

On 10/24/2025 10:57 AM, Youssef Samir wrote:
> From: Sourab Bera <quic_sourbera@quicinc.com>
> 
> Fix typos in qaic.rst file.
> 
> Signed-off-by: Sourab Bera <quic_sourbera@quicinc.com>
> Signed-off-by: Youssef Samir <youssef.abdulrahman@oss.qualcomm.com>

Pushed to drm-misc-next.

-Jeff
