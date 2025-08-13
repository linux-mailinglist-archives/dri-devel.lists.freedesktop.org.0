Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F340BB24628
	for <lists+dri-devel@lfdr.de>; Wed, 13 Aug 2025 11:53:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 557DF10E6C9;
	Wed, 13 Aug 2025 09:53:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="jv1gb4ke";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DE07D10E6C9
 for <dri-devel@lists.freedesktop.org>; Wed, 13 Aug 2025 09:53:34 +0000 (UTC)
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57D6mOxG008774
 for <dri-devel@lists.freedesktop.org>; Wed, 13 Aug 2025 09:53:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 0MpY81TRuNNBDJHPaklTYFI4wsF3yIvIsNOVJLMUbFI=; b=jv1gb4keblqk8Oe8
 0IfDMzKm25CeMTPUr3pF7EbmmsPsOLRWBpI00RvmXRswzIs7e8YQH+a0cRyDckIF
 LA4ZoN1AZjOx5pFVY3yJK4jw/QU8r2bxYcFvbcGdFiorQreKFUbhT07kl9Gi+G2N
 f55HidrgJkXBV5yJUT8BuXqNrt4c5PTtAZP+JnoYr5CYrsGIvfgmUEzGc4h7rmVc
 /DqajI7vnQRNFloz+QUnWILumdJbaJEZiGsizqio23jkwNZSN4z803BRoqhfjI79
 Wes3vpWBA5aKH4D6XyhjXc0Xhyb1iJFF9YTwD+0giYsH3PMGy5fLkWA1jfGrVSci
 OBrGMg==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com
 [209.85.160.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48fem4fa33-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Wed, 13 Aug 2025 09:53:33 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id
 d75a77b69052e-4b0938f0dabso18149181cf.1
 for <dri-devel@lists.freedesktop.org>; Wed, 13 Aug 2025 02:53:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1755078813; x=1755683613;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=0MpY81TRuNNBDJHPaklTYFI4wsF3yIvIsNOVJLMUbFI=;
 b=gWqscUtnaoCbaOXQnPIFHeXYbfUw8iZPoYAWRgvLjMvNh21wVDhSx/ujFI1AeQYSyL
 6FzpQrB0Z+1H7JUjW0/tKJvh2p3vXxYBb2KhiRmqSv9Tn8nQd0MESTANmA+xRKlAcCE/
 ZWEdabeU1UJcCHaSAcMcBJEGUoiP1reVRBSYXrwuOg8sZH+MajuVXscVnGGVdJsYYcvK
 dRzZRY4I4V3lViBsDTY8xTs2X28/WloqYZqZ3Uwi7UPAQoowJj6c9xcmvGUffEW9FuH2
 1bWcj2YWx26B++B7rH22rSmA53V7lnomn6xc5VSgUL6JLcIMQ8jmMejHgrXsOS0/Ou+H
 sLjA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVMIOnHgz/xUJ1h1UM+oYIYnmFI0erxKjfXcb4CpoYUelgCLrv3JJdSeHYJu8hReSljo7W/dMBnS8M=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwXaOZZf9qBgWohWDHNHtE7JCxDkKPdfEyGYmKQh3JgsR2gEoZ0
 ehaqTNosuUtIbcVkpZ5LVc2RWH4lZWiOaTTDP1GjcycPgmY7JMI6YckLH4drahVtpcnaTi0aVRw
 0jwXCAt0DCBlkB+JiLSTdjdHsLz6wDhY54Pp+95ceVSC5PdMKE20JFg7sH6ZPz8lPe/1obWo=
X-Gm-Gg: ASbGncsf3Ux6VzSLydfm7lLVriesNa3FvgFDtg4eZ2ZPkkuuFkDoBmf1WYpLeoFdyCA
 wp0lWB8/voTadatceMb6k3H7R6P4cabjoiFb800aOkHC11NKjkNMt+qf8kzcYgIGKUALvtd4wbs
 qeWdOaqG3ANF1YhGlSq4Um2M7i18clFhQ6Pr6lBacaV9PXO2AideEbkKX9f3/8P4GSjhihZdAht
 4LJvWVgyPwiNAyna9DbHFfMHCF18pOR6fmXSiuHnhXbsAMpUPfP91qeWolEpP/26EJSgBAZGItv
 X1RlZGBJoGkAOOnqvEgbuPyoBS3W7Lp7HVjCHw25OjrJmYz2svhoEFcYgZ8LTNyGt6VUhi3SVf4
 kyR8Hg3zxSCh++kDWEw==
X-Received: by 2002:a05:622a:143:b0:4ab:63f8:ef30 with SMTP id
 d75a77b69052e-4b0fc6f5abamr14652531cf.3.1755078813054; 
 Wed, 13 Aug 2025 02:53:33 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFHL9p/V8kgz7pgbQLj/2LkDGUoYpwD7WnZTmIEKh4brnTqRmXHLFYJ1dJDBYqoeMLjGgWK2g==
X-Received: by 2002:a05:622a:143:b0:4ab:63f8:ef30 with SMTP id
 d75a77b69052e-4b0fc6f5abamr14652161cf.3.1755078812394; 
 Wed, 13 Aug 2025 02:53:32 -0700 (PDT)
Received: from [192.168.43.16] (078088045245.garwolin.vectranet.pl.
 [78.88.45.245]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-af92a2ec9cbsm2254739566b.79.2025.08.13.02.53.29
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 13 Aug 2025 02:53:31 -0700 (PDT)
Message-ID: <f015c644-1176-47b3-8ce2-2567e529081e@oss.qualcomm.com>
Date: Wed, 13 Aug 2025 11:53:28 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 06/11] firmware: qcom: scm: add support for object
 invocation
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
 Neil Armstrong <neil.armstrong@linaro.org>
References: <20250812-qcom-tee-using-tee-ss-without-mem-obj-v7-0-ce7a1a774803@oss.qualcomm.com>
 <20250812-qcom-tee-using-tee-ss-without-mem-obj-v7-6-ce7a1a774803@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250812-qcom-tee-using-tee-ss-without-mem-obj-v7-6-ce7a1a774803@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: FmfdKLJjlWixvNnuRc3GgJteph7nw1Ut
X-Proofpoint-ORIG-GUID: FmfdKLJjlWixvNnuRc3GgJteph7nw1Ut
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODExMDA2OCBTYWx0ZWRfXzXWvWd64N1bD
 dAhla1VDbTLdKT4Gl/wNti13xgnIjxm5SEiBUZH5EuVsouDiI3r3z+DShSElS8VUCAUve8ieIXt
 ys1hcO7NuxwJ05PFmin8yqmRPY5FnYopQhEUzbheRUnzhQosJ5a8FE85RsQ0AKGzSM7W2RCdDIW
 kzY7SEgiUlcHyMWr+NKkgGIVZ3YRMoqpLkDCi13iToflGG04rsoZs129cQvqAunGwR6SZ0oNno5
 Iw7oPK7XXW2qQOXSlWxe/gL0VaY99wwbYeb6u29AoHHBndfjSsmb+C+imyPEWPuoeXEw8Ucty/7
 IpW+xX1kRZMUkP/KHsLyyhP3omN0AEwEFgsEoGrpvctZW3VWWhn9DW3/vucD1ZtrCICCpc2+gaW
 bY0c7RNj
X-Authority-Analysis: v=2.4 cv=YMafyQGx c=1 sm=1 tr=0 ts=689c609e cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10 a=KKAkSRfTAAAA:8 a=COk6AnOGAAAA:8
 a=EUspDBNiAAAA:8 a=ZC-EX8TnQz-G3DLW9GIA:9 a=QEXdDO2ut3YA:10
 a=uxP6HrT_eTzRwkO_Te1X:22 a=cvBusfyB2V15izCimMoJ:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-12_08,2025-08-11_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 clxscore=1015 priorityscore=1501 spamscore=0 suspectscore=0
 adultscore=0 impostorscore=0 malwarescore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2508110068
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

On 8/13/25 2:35 AM, Amirreza Zarrabi wrote:
> Qualcomm TEE (QTEE) hosts Trusted Applications (TAs) and services in
> the secure world, accessed via objects. A QTEE client can invoke these
> objects to request services. Similarly, QTEE can request services from
> the nonsecure world using objects exported to the secure world.
> 
> Add low-level primitives to facilitate the invocation of objects hosted
> in QTEE, as well as those hosted in the nonsecure world.
> 
> If support for object invocation is available, the qcom_scm allocates
> a dedicated child platform device. The driver for this device communicates
> with QTEE using low-level primitives.
> 
> Tested-by: Neil Armstrong <neil.armstrong@linaro.org>
> Tested-by: Harshal Dev <quic_hdev@quicinc.com>
> Signed-off-by: Amirreza Zarrabi <amirreza.zarrabi@oss.qualcomm.com>
> ---

[...]

> +int qcom_scm_qtee_invoke_smc(phys_addr_t inbuf, size_t inbuf_size,
> +			     phys_addr_t outbuf, size_t outbuf_size,
> +			     u64 *result, u64 *response_type)
> +{
> +	struct qcom_scm_desc desc = {
> +		.svc = QCOM_SCM_SVC_SMCINVOKE,
> +		.cmd = QCOM_SCM_SMCINVOKE_INVOKE,
> +		.owner = ARM_SMCCC_OWNER_TRUSTED_OS,
> +		.args[0] = inbuf,
> +		.args[1] = inbuf_size,
> +		.args[2] = outbuf,
> +		.args[3] = outbuf_size,
> +		.arginfo = QCOM_SCM_ARGS(4, QCOM_SCM_RW, QCOM_SCM_VAL,
> +					 QCOM_SCM_RW, QCOM_SCM_VAL),
> +	};
> +	struct qcom_scm_res res;
> +	int ret;
> +
> +	ret = qcom_scm_call(__scm->dev, &desc, &res);
> +	if (ret)
> +		return ret;
> +
> +	*response_type = res.result[0];
> +	*result = res.result[1];

These are dereferenced without checking, which will surely upset static
checkers (and users)

I see that res.result[2] should also return some (aptly named) "data"
which you handled in v1, but dropped in v2 (without a comment AFAICT)

Looking at it, we could probably wrap it in qcom_scm_qseecom_call()
which this seems to be fit for

> +
> +	return 0;
> +}
> +EXPORT_SYMBOL(qcom_scm_qtee_invoke_smc);
> +
> +/**
> + * qcom_scm_qtee_callback_response() - Submit response for callback request.
> + * @buf: start address of memory area used for outbound buffer.
> + * @buf_size: size of the memory area used for outbound buffer.
> + * @result: Result of QTEE object invocation.
> + * @response_type: Response type returned by QTEE.
> + *
> + * @response_type determines how the contents of @buf should be processed.
> + *
> + * Return: On success, return 0 or <0 on failure.
> + */
> +int qcom_scm_qtee_callback_response(phys_addr_t buf, size_t buf_size,
> +				    u64 *result, u64 *response_type)

These should be aligned

> +{
> +	struct qcom_scm_desc desc = {
> +		.svc = QCOM_SCM_SVC_SMCINVOKE,
> +		.cmd = QCOM_SCM_SMCINVOKE_CB_RSP,
> +		.owner = ARM_SMCCC_OWNER_TRUSTED_OS,
> +		.args[0] = buf,
> +		.args[1] = buf_size,
> +		.arginfo = QCOM_SCM_ARGS(2, QCOM_SCM_RW, QCOM_SCM_VAL),
> +	};
> +	struct qcom_scm_res res;
> +	int ret;
> +
> +	ret = qcom_scm_call(__scm->dev, &desc, &res);
> +	if (ret)
> +		return ret;
> +
> +	*response_type = res.result[0];
> +	*result = res.result[1];

this also seems like a good candidate for qcom_scm_qseecom_call()

[...]

>  /**
>   * qcom_scm_is_available() - Checks if SCM is available
>   */
> @@ -2326,6 +2444,16 @@ static int qcom_scm_probe(struct platform_device *pdev)
>  	ret = qcom_scm_qseecom_init(scm);
>  	WARN(ret < 0, "failed to initialize qseecom: %d\n", ret);
>  
> +	/*
> +	 * Initialize the QTEE object interface.
> +	 *
> +	 * This only represents the availability for QTEE object invocation
> +	 * and callback support. On failure, ignore the result. Any subsystem
> +	 * depending on it may fail if it tries to access this interface.
> +	 */
> +	ret = qcom_scm_qtee_init(scm);
> +	WARN(ret < 0, "failed to initialize qcomtee: %d\n", ret);

This will throw a WARN on *a lot* of platforms, ranging from
Chromebooks running TF-A (with a reduced SMC handler), through
platforms requiring QCOM_SCM_SMCINVOKE_INVOKE_LEGACY (0x00) cmd

Konrad
