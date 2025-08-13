Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 656ADB2559B
	for <lists+dri-devel@lfdr.de>; Wed, 13 Aug 2025 23:37:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4FF3610E06E;
	Wed, 13 Aug 2025 21:37:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="cf01cekL";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0D3DD10E06E
 for <dri-devel@lists.freedesktop.org>; Wed, 13 Aug 2025 21:37:47 +0000 (UTC)
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57DKixSr002790
 for <dri-devel@lists.freedesktop.org>; Wed, 13 Aug 2025 21:37:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 +SndjKr0RXE6OvRgCGGjccbf8K/ICQkhBHCI3TArlkI=; b=cf01cekLIKKmp6W9
 Q/KiEcVSMrq8AYF3X5UAHRYpvTK1X1DUORA9hux8y9uPE16/4CYrPgxKaBlLS7Yt
 nu4uuJGy4uEe0ZJA+FxLoQaRnAxi+rROX43B20wRy5W/TI7G92K0GbK4nPxZSO7h
 88vZpNMTG9DLSNeD6RzLLu6goYg2RtxJIrvIzGZIS8aZzL36z56spkA+iJy9APXr
 pdUvD1/tM+pL076SnTHA0TS58l0s+JVc+wkln+ka4tX8MCVy0dsINtixHmJUvP0C
 OlxTaUoYFDF27xosid1bq4nfJT02CtZEulMGareqAO0apCpLC1Rs4LUgsAyWMnKY
 mSGE0Q==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com
 [209.85.214.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48dxdv5ath-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Wed, 13 Aug 2025 21:37:46 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id
 d9443c01a7336-24457f440f0so2373305ad.0
 for <dri-devel@lists.freedesktop.org>; Wed, 13 Aug 2025 14:37:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1755121065; x=1755725865;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=+SndjKr0RXE6OvRgCGGjccbf8K/ICQkhBHCI3TArlkI=;
 b=lvtNtakpY1rLWmqrSB5v03A0WUCfSfx4uTdLT6h17DaLG7HxAi0NMBLgRRg+BwtGxE
 rqhCeVhjYHid1StYJRoceDnInGIMgrPTMJaRA5QOkAxOP9E4esFc6PZ1HAZkGx4JpUXY
 duLh7ubtTcrRvfNdo8Rvie1b7OLqnmSWNLw1UxPsYNYAB8yKAoDtkBAe4wqu/sUBANsK
 AcjlyFfZbvRw61ueL6WNT0k9IzucUMhgwF+D9laLzKiEySZ2XFi49V61DF7x4CkJZN29
 p3Uzrgf+RSuF861lHrqMbgcZaFXW8QgP+1SSYKKIinMXbSqvS8DAxBlbJ6nw/7FlmWpE
 bn9A==
X-Forwarded-Encrypted: i=1;
 AJvYcCW9WLem//gNksIgsEGc3kHSp6eAcSphGNGPjY9JXlTBz3cejA24juUBxvfFR9o1eIcb2TygwR2/XbM=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yxx3EmP50V3IRUPKXYnaKXhbpdwTF91HcBXvlhIqeF/Saic3ipf
 VX6aiJerfn5KL44l+YxstrmrDZUgZpX9oa7Lw1x+edXbUS+NrxuiYsC5BJp1VoB0+8RVVHKMZUa
 iVq0VP1ZmzJwDNvmxsPuCtTYtVMQvh686Z+LxhhUj842dk6HtTOVcLkKi8RG/13siiXtkIA==
X-Gm-Gg: ASbGncub28E2BnBgeSkVLMZZ770t2SL0IAFzSuq9ZhzO4aCgqxhYOnpjMl7yAR9yEIA
 KEJNJsLPHO3cGwZA1fG4iJvmDPxFZMjEDhxDkY/nGskL+2yLYodquDhv2XDlSLdM0KjjddA1aTb
 5ePuOe7WMTe/+1dhnjRorMM7iGngzX10oaOAnpxoV18u2dzqU2nqph1wclIROV9lHBYK4MSaEce
 5aFBghKYYABO/KoBCOplDyvzf0+zcFvK5jvw/YzJzJ6UwL4uJTR0p3c448KD/OqTYnaDgajSwGh
 2D7LwFoiaIEseJgyku1KkvSuqRwn71EqyCLH+Nq1nyFz2+zOz6UWI2lwKba9uBMMZpmNUMea2ku
 ET3y+VZ+Gwwl/avD2m4KeVM941MzndgrFrTuoXQ==
X-Received: by 2002:a17:902:f68f:b0:234:a734:4ab1 with SMTP id
 d9443c01a7336-244584af4ffmr8494795ad.3.1755121065292; 
 Wed, 13 Aug 2025 14:37:45 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHuzWbzDav9fzDkocxmSvr5IQCdvgg5HSGiPWY/6Um64YBLDMk04VNr0wYVwa0mHQaKsHAjBA==
X-Received: by 2002:a17:902:f68f:b0:234:a734:4ab1 with SMTP id
 d9443c01a7336-244584af4ffmr8494365ad.3.1755121064760; 
 Wed, 13 Aug 2025 14:37:44 -0700 (PDT)
Received: from [192.168.0.74] (n1-41-240-65.bla22.nsw.optusnet.com.au.
 [1.41.240.65]) by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-3232578248dsm983697a91.16.2025.08.13.14.37.38
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 13 Aug 2025 14:37:44 -0700 (PDT)
Message-ID: <a93b9788-92ef-4b5a-89ca-7e7733697eed@oss.qualcomm.com>
Date: Thu, 14 Aug 2025 07:37:35 +1000
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
Content-Language: en-US
From: Amirreza Zarrabi <amirreza.zarrabi@oss.qualcomm.com>
In-Reply-To: <f015c644-1176-47b3-8ce2-2567e529081e@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=IuYecK/g c=1 sm=1 tr=0 ts=689d05aa cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=hi51d+lTLNy/RbqRqnOomQ==:17
 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10 a=KKAkSRfTAAAA:8 a=COk6AnOGAAAA:8
 a=EUspDBNiAAAA:8 a=nTCLsnt1AoGLxjTXAKEA:9 a=QEXdDO2ut3YA:10
 a=GvdueXVYPmCkWapjIL-Q:22 a=cvBusfyB2V15izCimMoJ:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: E0-aWm07qvlcnTkhjcObdzlPJB516Ry_
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODA5MDAyNSBTYWx0ZWRfX522vEGek2S8q
 37DAIRf1uzTm6slnWI0U2Fn1P3fC53fwDDSHf92RKC+BwY4DoIaZRth5keHTTWrAlyPqLJJFmJP
 6b7D5G+C2coH1e131L489paffxou+xEGzJsPriF74h7AzOgrhW1AAfqljexn+ZdJMfUpy/zvzkl
 m19ILuysmReg3QbZVaDK1sUfjaCGx3wOv+sS0Fs+6BkXYvA3frBs/TdHOa0d981mfdWSFXxO8sV
 VB5/zHSqYVA/tP0hKLZKmZVpJFZyN38VFprl0Od1luriudeRPHuyo1YR/WceTfJH7613j3XTw8u
 Ya2AReOGU/MUVMo2KagClcR4O/SboSdOs2TTjhbvB2awe1Va1GvzrWF8PWsoZ3+L1Ss/Pbo/eY3
 FvQ0zN05
X-Proofpoint-GUID: E0-aWm07qvlcnTkhjcObdzlPJB516Ry_
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-13_01,2025-08-11_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 spamscore=0 priorityscore=1501 adultscore=0
 clxscore=1015 phishscore=0 suspectscore=0 bulkscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2508090025
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



On 8/13/2025 7:53 PM, Konrad Dybcio wrote:
> On 8/13/25 2:35 AM, Amirreza Zarrabi wrote:
>> Qualcomm TEE (QTEE) hosts Trusted Applications (TAs) and services in
>> the secure world, accessed via objects. A QTEE client can invoke these
>> objects to request services. Similarly, QTEE can request services from
>> the nonsecure world using objects exported to the secure world.
>>
>> Add low-level primitives to facilitate the invocation of objects hosted
>> in QTEE, as well as those hosted in the nonsecure world.
>>
>> If support for object invocation is available, the qcom_scm allocates
>> a dedicated child platform device. The driver for this device communicates
>> with QTEE using low-level primitives.
>>
>> Tested-by: Neil Armstrong <neil.armstrong@linaro.org>
>> Tested-by: Harshal Dev <quic_hdev@quicinc.com>
>> Signed-off-by: Amirreza Zarrabi <amirreza.zarrabi@oss.qualcomm.com>
>> ---
> 
> [...]
> 
>> +int qcom_scm_qtee_invoke_smc(phys_addr_t inbuf, size_t inbuf_size,
>> +			     phys_addr_t outbuf, size_t outbuf_size,
>> +			     u64 *result, u64 *response_type)
>> +{
>> +	struct qcom_scm_desc desc = {
>> +		.svc = QCOM_SCM_SVC_SMCINVOKE,
>> +		.cmd = QCOM_SCM_SMCINVOKE_INVOKE,
>> +		.owner = ARM_SMCCC_OWNER_TRUSTED_OS,
>> +		.args[0] = inbuf,
>> +		.args[1] = inbuf_size,
>> +		.args[2] = outbuf,
>> +		.args[3] = outbuf_size,
>> +		.arginfo = QCOM_SCM_ARGS(4, QCOM_SCM_RW, QCOM_SCM_VAL,
>> +					 QCOM_SCM_RW, QCOM_SCM_VAL),
>> +	};
>> +	struct qcom_scm_res res;
>> +	int ret;
>> +
>> +	ret = qcom_scm_call(__scm->dev, &desc, &res);
>> +	if (ret)
>> +		return ret;
>> +
>> +	*response_type = res.result[0];
>> +	*result = res.result[1];
> 
> These are dereferenced without checking, which will surely upset static
> checkers (and users)
> 

There is no consistency in qcom_scm.c; I see multiple instances where
similar dereferencing is already happening in this file. However, I'll
add the if (...) check to be sure. The reason I initially skipped it
is that this API has a single user -- the TEE subsystem.

> I see that res.result[2] should also return some (aptly named) "data"
> which you handled in v1, but dropped in v2 (without a comment AFAICT)
> 
> Looking at it, we could probably wrap it in qcom_scm_qseecom_call()
> which this seems to be fit for
> 

I cannot use qcom_scm_qseecom_call() because this is not a qseecom
transport. It's a new transport called smcinvoke, which, for instance,
does not require a lock.

The data field is intended for qseecom over smcinvoke, which we will
never support -- so there's no reason to return it.

>> +
>> +	return 0;
>> +}
>> +EXPORT_SYMBOL(qcom_scm_qtee_invoke_smc);
>> +
>> +/**
>> + * qcom_scm_qtee_callback_response() - Submit response for callback request.
>> + * @buf: start address of memory area used for outbound buffer.
>> + * @buf_size: size of the memory area used for outbound buffer.
>> + * @result: Result of QTEE object invocation.
>> + * @response_type: Response type returned by QTEE.
>> + *
>> + * @response_type determines how the contents of @buf should be processed.
>> + *
>> + * Return: On success, return 0 or <0 on failure.
>> + */
>> +int qcom_scm_qtee_callback_response(phys_addr_t buf, size_t buf_size,
>> +				    u64 *result, u64 *response_type)
> 
> These should be aligned

Ack.

> 
>> +{
>> +	struct qcom_scm_desc desc = {
>> +		.svc = QCOM_SCM_SVC_SMCINVOKE,
>> +		.cmd = QCOM_SCM_SMCINVOKE_CB_RSP,
>> +		.owner = ARM_SMCCC_OWNER_TRUSTED_OS,
>> +		.args[0] = buf,
>> +		.args[1] = buf_size,
>> +		.arginfo = QCOM_SCM_ARGS(2, QCOM_SCM_RW, QCOM_SCM_VAL),
>> +	};
>> +	struct qcom_scm_res res;
>> +	int ret;
>> +
>> +	ret = qcom_scm_call(__scm->dev, &desc, &res);
>> +	if (ret)
>> +		return ret;
>> +
>> +	*response_type = res.result[0];
>> +	*result = res.result[1];
> 
> this also seems like a good candidate for qcom_scm_qseecom_call()
> 

ditto.

> [...]
> 
>>  /**
>>   * qcom_scm_is_available() - Checks if SCM is available
>>   */
>> @@ -2326,6 +2444,16 @@ static int qcom_scm_probe(struct platform_device *pdev)
>>  	ret = qcom_scm_qseecom_init(scm);
>>  	WARN(ret < 0, "failed to initialize qseecom: %d\n", ret);
>>  
>> +	/*
>> +	 * Initialize the QTEE object interface.
>> +	 *
>> +	 * This only represents the availability for QTEE object invocation
>> +	 * and callback support. On failure, ignore the result. Any subsystem
>> +	 * depending on it may fail if it tries to access this interface.
>> +	 */
>> +	ret = qcom_scm_qtee_init(scm);
>> +	WARN(ret < 0, "failed to initialize qcomtee: %d\n", ret);
> 
> This will throw a WARN on *a lot* of platforms, ranging from
> Chromebooks running TF-A (with a reduced SMC handler), through
> platforms requiring QCOM_SCM_SMCINVOKE_INVOKE_LEGACY (0x00) cmd
> 

Are you suggesting I remove the WARN? If so, how should the user be notified?
Should the error simply be ignored?

> Konrad

Thanks,
Amir


