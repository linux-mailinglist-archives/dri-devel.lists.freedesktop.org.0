Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7BF17B256F4
	for <lists+dri-devel@lfdr.de>; Thu, 14 Aug 2025 00:49:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CC35310E7D7;
	Wed, 13 Aug 2025 22:49:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="VE0ATn3B";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E8D1310E7D7
 for <dri-devel@lists.freedesktop.org>; Wed, 13 Aug 2025 22:49:46 +0000 (UTC)
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57DBLlKV020893
 for <dri-devel@lists.freedesktop.org>; Wed, 13 Aug 2025 22:49:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 1y1eNmB//F61SipoixUPmWI3edeccgArIKxTM78/+/I=; b=VE0ATn3Bals0gSW4
 +bdtKCITDeGJTX4UJeqZJ6AqzNU2Y+CcP+0ZiRu0/e1mI62QExXllwlPJu2FPv24
 u001U4PpaGOEi9MXWbvM9oqU2EF60TrDYhD8JW1VZLcDI22vTB1dO52BVp5fpCmw
 81lkpE2ARNo8zlCNp25j4eIDzXrhUjVaVYI2vB1AFcL6sRAnwCYiRzU2v1TVjx5J
 iX1XFeFg60S126SjDVQg0Ei91wpRg6/jPEya2VzWUbUSM4qkdaYMapH0NPKxiGxi
 CScpMuJBBqJFdL9VUZ6SAtGJppSuQEkIZqQwRSzFKk/bSC/gin5fKyTxn89UIV28
 kxZAgQ==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com
 [209.85.160.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48dw9swqf5-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Wed, 13 Aug 2025 22:49:46 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id
 d75a77b69052e-4b109adce15so947571cf.1
 for <dri-devel@lists.freedesktop.org>; Wed, 13 Aug 2025 15:49:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1755125385; x=1755730185;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=1y1eNmB//F61SipoixUPmWI3edeccgArIKxTM78/+/I=;
 b=YOxfmwGwJ96GZlvctVE9QS6C+HO2QVOzCE4aO/+n+MLcxfsRJfI6kW3AXaN4caoMRs
 RMcEK7o9DJU1sKRaA/2YZzXZDHJCwmkqbNhZD6Vh34onpO/b8911nT1g2/TSIUCLw1oL
 msSBxROt8/hkHvV/2bARW7UfZFHtUB1mGCT0Q8uqUFidHLGCNq2i1KXZuZqcZlBUglkt
 SR+dUhvjFwlYJDX7xuBr5y+yUHcnwY6kePafbhFhnDpvu3RR34pQYlKtfJo+enRrXe2U
 FxdJzn5KQt3G7BnJDSyuMpCn+zUXWxvRNXwpMo+Wia6ZR8ImqW92gTIgFxwn8+5lIRAj
 s87Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCV6iPrrO6XhNiDRZk6WbGlWCH9UGk0KoyfVcX4HJ05kwZqdyZZa2yl7yHraWVUv98KihgmXTdNC7u4=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyEX0kXctq78BOEhoSfPLM91OM/obCNvfZTt3FMuUKaoQMxKAGU
 2/2kfHXvUSpX0BVwIEhAHqX78bZ+g535C0R+l8k2xsv2ejrMmzloByZpKSUE9CL++zsU1md64wW
 auolLGF0Y02gPQHyz5qqYe2LU9MSswYDXITv2c8JbOsZBbCmS5kQZ2MZZHmD24WMSzswAw6Q=
X-Gm-Gg: ASbGnctDjdJ7Fx2RtTzCQbazaqmvgVZ0roCjwfHzvzFgkMbHIYBakGbSAzg12r+HuHa
 R5WjRloTWX3HBVIoLrs4T04Z14JkGCLECOjh+wGt6xQTcnZ11ziV+9kF/Edl6BDefl+WOuiCzID
 qXxuboXF6rliHpRL00vaqD93DhnQ4wMK+raQ2uAxpFRiHGxrPvR81ZkDzhDfoFqh+1ozawVx2TY
 pVOYPFK0VAz1NYimS9Y2KAvgtUCYiyGIsveWBp89IoBaN9+vaT62IEoaEntds1k1wERUJBfjmwu
 c7qAwcsz/KCVJMFtjlKLPHTjuCUsOoG/r/2ZJubErFYH0z1M4+nzUwHlvSvR4rwbNhHhzRFQyl6
 MCgeiTppPgIkzxmQnew==
X-Received: by 2002:ac8:580b:0:b0:475:1c59:1748 with SMTP id
 d75a77b69052e-4b10ab40660mr6928351cf.11.1755125384976; 
 Wed, 13 Aug 2025 15:49:44 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFOa1EUACt46c/s0PUTGj00pPK/iWnH0SLzQKgyx6D5B8kmovv05Bwu05KhVWthG9YSv94PmA==
X-Received: by 2002:ac8:580b:0:b0:475:1c59:1748 with SMTP id
 d75a77b69052e-4b10ab40660mr6928091cf.11.1755125384448; 
 Wed, 13 Aug 2025 15:49:44 -0700 (PDT)
Received: from [192.168.43.16] (078088045245.garwolin.vectranet.pl.
 [78.88.45.245]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-af91a1e82a5sm2475800966b.82.2025.08.13.15.49.42
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 13 Aug 2025 15:49:43 -0700 (PDT)
Message-ID: <d74404ec-44ad-412f-98ef-eed288ecf1bf@oss.qualcomm.com>
Date: Thu, 14 Aug 2025 00:49:41 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 10/11] qcomtee: enable TEE_IOC_SHM_ALLOC ioctl
To: Amirreza Zarrabi <amirreza.zarrabi@oss.qualcomm.com>,
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
 Neil Armstrong <neil.armstrong@linaro.org>,
 Sumit Garg <sumit.garg@oss.qualcomm.com>
References: <20250812-qcom-tee-using-tee-ss-without-mem-obj-v7-0-ce7a1a774803@oss.qualcomm.com>
 <20250812-qcom-tee-using-tee-ss-without-mem-obj-v7-10-ce7a1a774803@oss.qualcomm.com>
 <3ec0a8d0-7900-45bd-b0d3-90ee8ca7730c@oss.qualcomm.com>
 <d81abdef-18fa-496d-8493-e8f336c43800@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <d81abdef-18fa-496d-8493-e8f336c43800@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=J+Wq7BnS c=1 sm=1 tr=0 ts=689d168a cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8
 a=COk6AnOGAAAA:8 a=YlTi__48JDlbgKAADYoA:9 a=QEXdDO2ut3YA:10
 a=kacYvNCVWA4VmyqE58fU:22 a=cvBusfyB2V15izCimMoJ:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: 69sos5u7N5VCpLFH1F7EpX3XadxXFJi0
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODA5MDAxNSBTYWx0ZWRfXzDdmKQzUeLiX
 lmN7D8GT8ZwucV5mnkDlylkuuJUS45N715wJTu5zRhAWG/8YiVZaTDTc6xz1wkKcL/10TPQFnZH
 ko3AUduOvrtAzxpUDcJIHw3uTS0LwVQNxXNVgyiIf1CLEkyZ6gQNSMwjI4BgmvFL3dQUzpSifFt
 1sFUMZE89ZG9TGFSAmlpfjmQzGcYsARRWpaKfycTamZbGZCe/jActgqK0AkgYwj4pq7PCoJhiEz
 emXDdQUBh4KCIgi45V/1aGZLF7kBuN2+0g9TzgGfB7MjoPMVUSbL39Q49jZIlOn3Vs6FpNrCbaf
 wLSNC7+LSNTaWDmgoBCtlWxPRtz3P+tUvaWraq0/DDMdvBmtoVpe4kUog2aY79E47RYTPAIY45Z
 g+At1ESP
X-Proofpoint-GUID: 69sos5u7N5VCpLFH1F7EpX3XadxXFJi0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-13_02,2025-08-11_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 adultscore=0 malwarescore=0 impostorscore=0 bulkscore=0
 phishscore=0 suspectscore=0 spamscore=0 clxscore=1015 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2508090015
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

On 8/14/25 12:24 AM, Amirreza Zarrabi wrote:
> 
> 
> On 8/13/2025 8:00 PM, Konrad Dybcio wrote:
>> On 8/13/25 2:35 AM, Amirreza Zarrabi wrote:
>>> Enable userspace to allocate shared memory with QTEE. Since
>>> QTEE handles shared memory as object, a wrapper is implemented
>>> to represent tee_shm as an object. The shared memory identifier,
>>> obtained through TEE_IOC_SHM_ALLOC, is transferred to the driver using
>>> TEE_IOCTL_PARAM_ATTR_TYPE_OBJREF_INPUT/OUTPUT.
>>>
>>> Tested-by: Neil Armstrong <neil.armstrong@linaro.org>
>>> Acked-by: Sumit Garg <sumit.garg@oss.qualcomm.com>
>>> Tested-by: Harshal Dev <quic_hdev@quicinc.com>
>>> Signed-off-by: Amirreza Zarrabi <amirreza.zarrabi@oss.qualcomm.com>
>>> ---
>>
>> [...]
>>
>>> +/* Mapping information format as expected by QTEE. */
>>> +struct qcomtee_mapping_info {
>>> +	u64 paddr;
>>> +	u64 len;
>>> +	u32 perms;
>>> +} __packed;
>>
>> Please use types with explicit endianness, e.g. __le32. I'm assuming
>> TZ will always be little-endian, regardless of the host OS
>>
> 
> I'm not entirely sure how this point is relevant. As I understand it,
> the core that populates this struct is the same one that accesses it in TZ.
> Your argument would absolutely make sense if the host and TZ were operating
> on different cores with distinct architectures -- such as one being
> little-endian and the other big-endian, which is not the case.

CONFIG_CPU_BIG_ENDIAN=y exists on arm64

Konrad
