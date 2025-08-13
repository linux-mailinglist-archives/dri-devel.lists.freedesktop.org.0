Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BE8A3B255D0
	for <lists+dri-devel@lfdr.de>; Wed, 13 Aug 2025 23:47:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9E78210E10F;
	Wed, 13 Aug 2025 21:47:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="LCJShcCJ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C237810E10F
 for <dri-devel@lists.freedesktop.org>; Wed, 13 Aug 2025 21:47:25 +0000 (UTC)
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57DBLfBb023999
 for <dri-devel@lists.freedesktop.org>; Wed, 13 Aug 2025 21:47:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 PoxP7tG7pCID580yMt9K2LXcQBndbjiv/lE6hcV18C4=; b=LCJShcCJqrQ7J/v4
 GUKejkcaQxV4s9YPZgV8B6+bo/RivOwQyJyJEdjsoQF0qnCkgT7sy1D6zqHnV1vO
 s48+BESFy59JftqMeDl8n2SDCymjYh5aSnCrr1TbCWVG7Kb8IsVjxSZcByDlSHAN
 8IrmNbu000mwJy7GjCPp4kET5WaJXICZmjJntGnTE0eEMzog/jpTZ5T/46QLADsE
 i+pm0N50cbRTQcgWZjzDqVKjtbuQQq4wnqRI9wswOhQOehQ0zOZXm+n7HzJlHfhZ
 1MBWBsL0LP9EGj1Y6HMPq1rsJoFE8RUKzy8jCWnsHUV/YTgwCMYi2dS0hOqO/jCB
 TFDVQQ==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com
 [209.85.215.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48gr9rt0se-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Wed, 13 Aug 2025 21:47:25 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id
 41be03b00d2f7-b4716fa1e59so167958a12.0
 for <dri-devel@lists.freedesktop.org>; Wed, 13 Aug 2025 14:47:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1755121644; x=1755726444;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=PoxP7tG7pCID580yMt9K2LXcQBndbjiv/lE6hcV18C4=;
 b=Ev2eUa13TPUvHeLWXCvuSbOnrhz/uCK6i6wLuKjD2Sq9sM1/Pz2RP+kJh0wNzg8I4C
 F225QIALJPMFi/xoMKcx1Ls3Q7slo+FB4FzB0IMiV5DKBdIQ9wo2kh+1s2HOCKTI6Yk8
 D74PO5CHsGdOd5609Rn6Qo4gD4+taPUHthU7Nf/AgCqEe8d9dNAOqv2gcKd3BiwHcwuT
 ITRkQ9OVF7FllGjzVKSYJIEHwPKI+UHe0y3ZJc14NcBXtO1dF3Vdei+acPJ/yWmU5Hjx
 /MWYEC8cJ32yfJQB4M4L2HQkZt6LWrJ/CIE9il/ogCIUjA2u+QmS2cRMpI2P5XFfxxQ4
 UZ6A==
X-Forwarded-Encrypted: i=1;
 AJvYcCU7LxOLM0DOwY+srzNEPv/jGUmxoUq11OtFqx3T6cLJkRw+j4Uh19zf35+O6KnfP4s+MH/aSgamNuU=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwjH5NOecR1QdTrZuRuKNdmZS7bNwuf4n5N3rw2EYTMEpS5AyRY
 XYE1k3golKpyyHICqUG401g/1SI0kZag+WCXMI9JcRF5QymM9uKVrP7HU/MI/1QO3kY+ku6BFRr
 wol+qYMOGItbEHaSTu1JFID4RxAnD9Fnge00C9sk4VeThrP/XG3laSnEHEu7FB1mgtxnDtg==
X-Gm-Gg: ASbGncudjG5U6LIOeEohkzkvEd77Unnc8iZfM0gx44se936XT6Y0HnZpR1/YcGnWKNc
 KXar0EdYlNGpUQygZoiBB+KeoTgwN976gPXhgf1arp5mMKToVOI1bVZc/ooNx7ZqJWFYezrPCh+
 tjoB1KnKkxWiBF7hnl0cjpnXdeJJF8CDbOW5PR7IbBJW7ijbBjtmS+42G/khDJCID32RI05016N
 IMgUpQVD1WEueRsIu/6D8T8rV3JCV9oLZe1h6LUOwuyr0WnUFnVHKWDksZJY1YLzxmS60nR42AO
 QfRwNCgqCKsKE4e1JmXXGZWvu3G7k6CkwuIKJfULl0fyz4UyrupS7O7U30cmoAvp35xdU5R721w
 VNlPGClxQyYSQkbpOjrGpX6EZn//QIyBIYUHCsw==
X-Received: by 2002:a17:902:d482:b0:242:9bc4:f1c8 with SMTP id
 d9443c01a7336-244586e1b69mr7940595ad.55.1755121644285; 
 Wed, 13 Aug 2025 14:47:24 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFgjyhLi16jIYpZ8EHZqnYQaA0dKD8mdlmwaED7WOs0d7tmfiyJiuh/7q2M1HKFCS2ese9Jpw==
X-Received: by 2002:a17:902:d482:b0:242:9bc4:f1c8 with SMTP id
 d9443c01a7336-244586e1b69mr7940215ad.55.1755121643848; 
 Wed, 13 Aug 2025 14:47:23 -0700 (PDT)
Received: from [192.168.0.74] (n1-41-240-65.bla22.nsw.optusnet.com.au.
 [1.41.240.65]) by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-323257aa89esm1010760a91.23.2025.08.13.14.47.17
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 13 Aug 2025 14:47:23 -0700 (PDT)
Message-ID: <0af9ac59-9b91-4a0b-92fb-b44e0e008431@oss.qualcomm.com>
Date: Thu, 14 Aug 2025 07:47:14 +1000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 07/11] firmware: qcom: tzmem: export shm_bridge
 create/delete
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
 Jens Wiklander <jens.wiklander@linaro.org>,
 Sumit Garg <sumit.garg@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
 Apurupa Pattapu <quic_apurupa@quicinc.com>, Kees Cook <kees@kernel.org>,
 "Gustavo A. R. Silva" <gustavoars@kernel.org>,
 Sumit Semwal <sumit.semwal@linaro.org>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Cc: Harshal Dev <quic_hdev@quicinc.com>, linux-arm-msm@vger.kernel.org,
 op-tee@lists.trustedfirmware.org, linux-kernel@vger.kernel.org,
 linux-hardening@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linaro-mm-sig@lists.linaro.org, linux-doc@vger.kernel.org,
 Neil Armstrong <neil.armstrong@linaro.org>
References: <20250812-qcom-tee-using-tee-ss-without-mem-obj-v7-0-ce7a1a774803@oss.qualcomm.com>
 <20250812-qcom-tee-using-tee-ss-without-mem-obj-v7-7-ce7a1a774803@oss.qualcomm.com>
 <f10f1602-972a-491f-9c11-95e5e7bd80f8@oss.qualcomm.com>
Content-Language: en-US
From: Amirreza Zarrabi <amirreza.zarrabi@oss.qualcomm.com>
In-Reply-To: <f10f1602-972a-491f-9c11-95e5e7bd80f8@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODEzMDA5NCBTYWx0ZWRfX8dF6LaW/4raJ
 WI4BwhLMsoy5q0jPcoJmYLS7LipTdR5Hr1QoP2KDXVCuQ29gD8FaqED2VG+li9aCQThBIxrSsm5
 mDlIkTcbR8mNM8Wwww57X74D7MJOqEdr9DGc/nXZfpXWsDWIqLk61QvBbxfzHOuJvul6Sf6UY8g
 GvFZB3gKzh9urSy3U3UQj25CEhHLDtdYGAzIfU1QEfdIw99umJLSR3sYM+jsAq4H0qU7zvDvfOO
 gbGKIGdsM2QSg2EMvvqRNiwkVNZtduoQNikOUsqWo3gPXsLPqgcxe1WmkvQIXvfIh1TqvwqZv7Z
 Dt6EMyi+yc22P1yVaaX+xbmWcyFvaeTKVFciz3daR7GGo21/gQj3WkrkTf3HDUfWdyofA1ZyRT6
 A1eIWPFh
X-Authority-Analysis: v=2.4 cv=NIrV+16g c=1 sm=1 tr=0 ts=689d07ed cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=hi51d+lTLNy/RbqRqnOomQ==:17
 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10 a=sWKEhP36mHoA:10 a=KKAkSRfTAAAA:8
 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8 a=dTt1GwfqUVNo7j6m3doA:9 a=QEXdDO2ut3YA:10
 a=zZCYzV9kfG8A:10 a=x9snwWr2DeNwDh03kgHS:22 a=cvBusfyB2V15izCimMoJ:22
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: hvywjHO-otpKWIVmjyBNi7_Li3ZOti1T
X-Proofpoint-GUID: hvywjHO-otpKWIVmjyBNi7_Li3ZOti1T
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-13_01,2025-08-11_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 clxscore=1015 impostorscore=0 adultscore=0 suspectscore=0
 spamscore=0 malwarescore=0 phishscore=0 bulkscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2508130094
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



On 8/13/2025 8:06 PM, Konrad Dybcio wrote:
> On 8/13/25 2:35 AM, Amirreza Zarrabi wrote:
>> Anyone with access to contiguous physical memory should be able to
>> share memory with QTEE using shm_bridge.
>>
>> Tested-by: Neil Armstrong <neil.armstrong@linaro.org>
>> Tested-by: Harshal Dev <quic_hdev@quicinc.com>
>> Signed-off-by: Amirreza Zarrabi <amirreza.zarrabi@oss.qualcomm.com>
>> ---
> 
> Hm, I thought the idea for the tzmem allocator was to abstract
> these operations to prevent users from shooting themselves in
> the foot, and this seems to be circumventing that..
> 

Yes and no. The TEE subsystem has its own memory management code, and
the qcomtee backed driver will utilize it. In other words, qcomtee will
manage its own memory, and tzmem will only be used for drivers that
communicate with QTEE without involving the TEE subsystem.

This aligns with future extensions for FFA memory sharing.

Regards,
Amir

> Konrad

