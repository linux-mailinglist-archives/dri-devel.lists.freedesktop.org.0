Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7309FB2570C
	for <lists+dri-devel@lfdr.de>; Thu, 14 Aug 2025 00:56:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9E70610E7DA;
	Wed, 13 Aug 2025 22:55:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="kvOe4hR3";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 81AC310E7DA
 for <dri-devel@lists.freedesktop.org>; Wed, 13 Aug 2025 22:55:56 +0000 (UTC)
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57DM9qWl030067
 for <dri-devel@lists.freedesktop.org>; Wed, 13 Aug 2025 22:55:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 8e0ZVNprxYNA0/9coeslBrJajBup8IpRB7mgWlinU3I=; b=kvOe4hR389WJMGpr
 pSwX613gEZv7psgmjtiDKWNew9mN/oaXMWt7VZsUGZ0BYhGuur1Tz3LOgjc4ZcK8
 /ynBUUlLlkC9ecKh/1uPZUlS49gpcuwVRp1AIl8jtwpxIE2wI758QNLtqcuIMjqI
 u5Iu1TIo6URF61zeq0ZC83H3d+6cTgEDcqZXQq6s97Yqr1aWTmz2quWNfvCk2QFF
 euT8hKEvGddJZWYZKTRwNVXCQURNZieBYj52C5lJvsE4tofLzHsd4HIGpe++dhTC
 2hnP3czq2OO5mp5AJoSFJhPJvDbMPVyR6GLoI3PXpoxprIRy8abBaUsC7jdJ9wdQ
 0fkCvg==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com
 [209.85.214.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48fm3vrd86-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Wed, 13 Aug 2025 22:55:55 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id
 d9443c01a7336-24457ef983fso5022435ad.0
 for <dri-devel@lists.freedesktop.org>; Wed, 13 Aug 2025 15:55:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1755125754; x=1755730554;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=8e0ZVNprxYNA0/9coeslBrJajBup8IpRB7mgWlinU3I=;
 b=Uq3sT3j4x9L6bn2ip0Zxoy4gHySuBjn4YZEn+3AGlDh0SnK0g7hyElVuLbVRteb6OM
 +zLy0bcORk5abYDZEIRrmRULuo3ZFsoqDbB6pHN4RuMysw0dXaFAJO/T4ozGrdfWIanL
 fwmEWZ+NdeOHspWbKXlNUKX7yn3rUZbCR5KjhacIDnWx/NxJ1ub+0U38437F0pU2C6KY
 RXKmrgY003tsO3YXmXk6xnhFBgIlXpAu5rvQT4pPCnxGW0BlIDcoKxYh6kfjRWpRHNSP
 qNZxJftDQzKhgV0qTLm7oSc3ACLNBPjETHUlIKf8YphLdIO6JRvtFioPGO2ftofCbolw
 vj2w==
X-Forwarded-Encrypted: i=1;
 AJvYcCU7NVLGRjj+o9+q6+peIbJyr1XNnxE5XmiHTVD/ibNVhUWD4QmZrVLU3vvMLFW03V8RhlWTSlnu8uo=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyQ3I0w052jP29lwhY9co1TCywSnZddQyykmAS3V551QnBdFR4l
 OvrR3t5bLEUPyzS559IgPGiOpq2XLf/hG8nyS4SELHK7gTMTyNOX0IeQoAfSAF2aIsTirRl8uWZ
 GfnzfIqsJtyCngp/y521ugq3enFtXKxUPDQj0jkh0SN5giQlaifwaVBlLxYzW3ba2R+JTTw==
X-Gm-Gg: ASbGncu9rxxeRrC7mj+jdC/xdZuFcQG2438PFb+1ojAp6qa0gC3DT+BzagCGadri/eg
 2jMQna9n3MdbSrVLpfnUgzQ6BbNcJBAZwPRQ07008ALUzXlcC9LVC0aVxv2pUsMn95T93HOEISH
 CMr8oX0aX9k2+XmTXpFY9wnOMjhr9cPWZUXeqZOeQbVMzIs8odkx9DCSKl11HkEhoH8/+CrIg9d
 sHBRBhvHiUnA0aORnYTNHnMXbPK6xkWeggk34OzIzdOu3xyCcpAINlwbjpi/R4UzXAp36AgtJ6A
 abTXaY6rQdnFFkEqhERhsKOm0d0h+cvBZ0LdOiL57v/ukC/NSX2iTwmXy40mAFErzAo4AZZB9H/
 tnIvWvHVrEAztgEwdK5q5uslKjUg/psIDk99E1Q==
X-Received: by 2002:a17:902:ef48:b0:243:38d:b3c5 with SMTP id
 d9443c01a7336-244586d6812mr11282955ad.47.1755125754316; 
 Wed, 13 Aug 2025 15:55:54 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEwyZkPhdjRr1DNqf2XUlzMie+QCuji1zBonY4NxpkKvkrR7x/LGRt8rtlqOJlwD4OUaeYUew==
X-Received: by 2002:a17:902:ef48:b0:243:38d:b3c5 with SMTP id
 d9443c01a7336-244586d6812mr11282655ad.47.1755125753877; 
 Wed, 13 Aug 2025 15:55:53 -0700 (PDT)
Received: from [192.168.0.74] (n1-41-240-65.bla22.nsw.optusnet.com.au.
 [1.41.240.65]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2429b4ca995sm202959025ad.177.2025.08.13.15.55.47
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 13 Aug 2025 15:55:53 -0700 (PDT)
Message-ID: <1874e02d-993f-483b-bcb7-dba7c0611376@oss.qualcomm.com>
Date: Thu, 14 Aug 2025 08:55:45 +1000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 06/11] firmware: qcom: scm: add support for object
 invocation
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
 <20250812-qcom-tee-using-tee-ss-without-mem-obj-v7-6-ce7a1a774803@oss.qualcomm.com>
 <f015c644-1176-47b3-8ce2-2567e529081e@oss.qualcomm.com>
 <a93b9788-92ef-4b5a-89ca-7e7733697eed@oss.qualcomm.com>
 <176361cd-a095-4b81-9e36-f933d159d249@oss.qualcomm.com>
Content-Language: en-US
From: Amirreza Zarrabi <amirreza.zarrabi@oss.qualcomm.com>
In-Reply-To: <176361cd-a095-4b81-9e36-f933d159d249@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODExMDEwNyBTYWx0ZWRfX+QdOg+c0HKTb
 iTBx8XoguxMDQFpNSl/CwVCKcuuZV3OqQL8KMzPeKQvvL/wKmjKgrLrncVh2nczJEV5yTnkN3++
 hx/TBkP6+F4TT9mHRZOgzFzoh/AhQTmcAItV47X7xoPDWd8lRe2q+CDh/XgV2a9+fCGKd1gzTCl
 lRx3gO8aKaY+pKGTzf07DTJgeHQ85g3x1QxTXWCvq0jJRQIrmvL5bt9XcbTgSFpqg7mUg1FVCCP
 vwyoWgaD5yDH6nZbnWob1VHMVu57/9Y6HCzYiXWfO+lIGGbbqufjOBq0C4Mxm7nH4b6UIxVqyhQ
 ceqTVM+IKU2UjH0O7VILPmAlxFrakLzC0dgIL60cZ1qqsMoYwRmPont4JH8qQjszbzp8oLrcLc4
 yjxl0pb1
X-Proofpoint-GUID: CnhI0FsnuN29dsjOSnStp4iBQDyWtmsx
X-Authority-Analysis: v=2.4 cv=A+1sP7WG c=1 sm=1 tr=0 ts=689d17fb cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=hi51d+lTLNy/RbqRqnOomQ==:17
 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10 a=KKAkSRfTAAAA:8 a=COk6AnOGAAAA:8
 a=EUspDBNiAAAA:8 a=T0n-DW2OHO-Z3PBZrcMA:9 a=QEXdDO2ut3YA:10
 a=324X-CrmTo6CU4MGRt3R:22 a=cvBusfyB2V15izCimMoJ:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: CnhI0FsnuN29dsjOSnStp4iBQDyWtmsx
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-13_02,2025-08-11_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 priorityscore=1501 malwarescore=0 spamscore=0
 phishscore=0 clxscore=1015 adultscore=0 bulkscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2508110107
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



On 8/14/2025 8:52 AM, Konrad Dybcio wrote:
> On 8/13/25 11:37 PM, Amirreza Zarrabi wrote:
>>
>>
>> On 8/13/2025 7:53 PM, Konrad Dybcio wrote:
>>> On 8/13/25 2:35 AM, Amirreza Zarrabi wrote:
>>>> Qualcomm TEE (QTEE) hosts Trusted Applications (TAs) and services in
>>>> the secure world, accessed via objects. A QTEE client can invoke these
>>>> objects to request services. Similarly, QTEE can request services from
>>>> the nonsecure world using objects exported to the secure world.
>>>>
>>>> Add low-level primitives to facilitate the invocation of objects hosted
>>>> in QTEE, as well as those hosted in the nonsecure world.
>>>>
>>>> If support for object invocation is available, the qcom_scm allocates
>>>> a dedicated child platform device. The driver for this device communicates
>>>> with QTEE using low-level primitives.
>>>>
>>>> Tested-by: Neil Armstrong <neil.armstrong@linaro.org>
>>>> Tested-by: Harshal Dev <quic_hdev@quicinc.com>
>>>> Signed-off-by: Amirreza Zarrabi <amirreza.zarrabi@oss.qualcomm.com>
>>>> ---
> 
> [...]
> 
>>>>  /**
>>>>   * qcom_scm_is_available() - Checks if SCM is available
>>>>   */
>>>> @@ -2326,6 +2444,16 @@ static int qcom_scm_probe(struct platform_device *pdev)
>>>>  	ret = qcom_scm_qseecom_init(scm);
>>>>  	WARN(ret < 0, "failed to initialize qseecom: %d\n", ret);
>>>>  
>>>> +	/*
>>>> +	 * Initialize the QTEE object interface.
>>>> +	 *
>>>> +	 * This only represents the availability for QTEE object invocation
>>>> +	 * and callback support. On failure, ignore the result. Any subsystem
>>>> +	 * depending on it may fail if it tries to access this interface.
>>>> +	 */
>>>> +	ret = qcom_scm_qtee_init(scm);
>>>> +	WARN(ret < 0, "failed to initialize qcomtee: %d\n", ret);
>>>
>>> This will throw a WARN on *a lot* of platforms, ranging from
>>> Chromebooks running TF-A (with a reduced SMC handler), through
>>> platforms requiring QCOM_SCM_SMCINVOKE_INVOKE_LEGACY (0x00) cmd
>>>
>>
>> Are you suggesting I remove the WARN? If so, how should the user be notified?
>> Should the error simply be ignored?
> 
> I suggest using dev_info/dev_notice, WARN prints multiple dozen lines
> and taints the kernel
> 
> Konrad

Ack.

Amir

