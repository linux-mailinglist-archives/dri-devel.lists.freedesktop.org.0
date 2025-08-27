Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E2233B37A23
	for <lists+dri-devel@lfdr.de>; Wed, 27 Aug 2025 08:06:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A098710E2AC;
	Wed, 27 Aug 2025 06:06:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="n06+6yXW";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 42FC310E0AC
 for <dri-devel@lists.freedesktop.org>; Wed, 27 Aug 2025 06:06:27 +0000 (UTC)
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57R5Yqwd001856
 for <dri-devel@lists.freedesktop.org>; Wed, 27 Aug 2025 06:06:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 IvtoMULgukZ1V1cgtQetdWBAfSoYzONqp4myym0U6ZU=; b=n06+6yXW0wU0IpKz
 /+cogiaPfyl+lmuJ7TkprUJ72V/3CKRv7h/oJxp36crzCJpUNmcMeyRp09RunAMn
 C21412ZnXj3muBeVY7sPWwXYZ+vkj9n3ZZEehipGEvQAXd7J0BY3VBxwbvuOX4qi
 6KmthjfMvu8hO4TkUwZQzP1C8fyypOa/EylDhNmDMHedafqFBS7SQj706WS/YC39
 SLkxUBa39PGF7SHrIoO/Bg9etaQjwvWUl0LcaiJM4b/BduiSIBozd/bJ3EmK61+Y
 h4FQlyPWG4avYytuEIDHAXJq33C7x91FRUn6hYgjQLMUC2475PDhbS/nq3ou/dWt
 SE9oQw==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com
 [209.85.210.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48sh8ahury-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Wed, 27 Aug 2025 06:06:26 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id
 d2e1a72fcca58-76e2e60221fso11986805b3a.0
 for <dri-devel@lists.freedesktop.org>; Tue, 26 Aug 2025 23:06:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1756274786; x=1756879586;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=IvtoMULgukZ1V1cgtQetdWBAfSoYzONqp4myym0U6ZU=;
 b=mCrf7r2PCqt7+Fe3LsnrnF47G563uUs2zeHBX5kCSpDbM69BRydvgBhyMW99OZMCK2
 +stwAMsoHUsyC1OkBTAST5RL2XdXiXdYm68QxINTwSa0N3AOXo2E9gtHILh8r6ebWfsW
 HXd+hfuRRe8ZfJ3aM3MU/mCaN2hDfIlWItDs1nUfy6wSmPjOweiAt6zoLnd8+2p9rZCm
 XPVOh2Ymacs+7XHxPQ/6p5MIlhZcnBjarCk4X7xIrtU9dZnZQWWV6NlgLAgqyzlQhvg1
 JW1TVDvY9Tl2ot5N233s4zEF8ST0oZsMxg7C6+gIFmCUU42JOmU+9hDb0aG9uytdb/zC
 arzQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWtG7bXAEFllt8i1KOcKSLkbGLCZ/yWvpY1vaUWRMAbheswBX7y0orOVXJ7+vO6RqgUKJokCmjeCLY=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxjGEY5U8Bnnv7L8KjUCrRRTXg0FfiCZACpQCEeWxVmXyVAUs2J
 UOnLx8Li+0GsdJmP4F+VUHTIdHQdBeNJ/KeoCRbGL6wAFIrHBL/lowCHsAeeDmdM72i8Kck0Ddm
 +NN7B5cjcSunK+nGWWt8nbeSAZjaU84/UHOIXp5RoK3PYxXF+V25eAOHeF+iTp3nXIeaDZA==
X-Gm-Gg: ASbGncvS2hAi2LMwwpKUdfHaTByLdGudiHD0K/ybyn0vd4BboDmPLmLlWkU+g2HN9NJ
 2SsLdBQ3ZNc775XGXNPNs3rpjKVk6FYMPKpXdV7xTSnIOmAV42OPpyM7CAq24OSNR0NPiVx5gtw
 swCoaEQ/bOGuYgm0jl9W//nJIxcM5hOr7J64xZGepkYlAXpyZusMJbtQ2c+qJKMilus2koiTT9R
 ln6MFTJmM/070DEdU+39xZ58HDM1GLclGba1iOzmuI4nZe4BtnwE1hX3hplsvlpDT0Rcj+QZ/sL
 2Oj1SXBgRnEO0yWszB0151gv9xOQwx3HFzVvvC14aSSRsvnJ/W1USmEpKWriIxui09BzEH3TtVJ
 H4KdvzVrFfDVeB4YWLIEP3iLCb5/UIDdobMpX6g==
X-Received: by 2002:a05:6a00:340e:b0:771:ea51:690e with SMTP id
 d2e1a72fcca58-771ea5170d6mr9587247b3a.20.1756274785583; 
 Tue, 26 Aug 2025 23:06:25 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEjXY9tZYbdaHdBkaKUQPtpmPxg/EWHTA5baJ83nFS3+u9isarHBBJ/FYnGHhPcbEv04uBR8Q==
X-Received: by 2002:a05:6a00:340e:b0:771:ea51:690e with SMTP id
 d2e1a72fcca58-771ea5170d6mr9587212b3a.20.1756274785081; 
 Tue, 26 Aug 2025 23:06:25 -0700 (PDT)
Received: from [192.168.0.74] (n1-41-240-65.bla22.nsw.optusnet.com.au.
 [1.41.240.65]) by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-771ecc4454esm6208226b3a.0.2025.08.26.23.06.18
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 26 Aug 2025 23:06:24 -0700 (PDT)
Message-ID: <265e23fb-8865-4dee-99ed-f08450975ba8@oss.qualcomm.com>
Date: Wed, 27 Aug 2025 16:06:16 +1000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 06/11] firmware: qcom: scm: add support for object
 invocation
To: Bjorn Andersson <andersson@kernel.org>
Cc: Jens Wiklander <jens.wiklander@linaro.org>,
 Sumit Garg <sumit.garg@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>,
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
 Apurupa Pattapu <quic_apurupa@quicinc.com>, Kees Cook <kees@kernel.org>,
 "Gustavo A. R. Silva" <gustavoars@kernel.org>,
 Sumit Semwal <sumit.semwal@linaro.org>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 Harshal Dev <quic_hdev@quicinc.com>, linux-arm-msm@vger.kernel.org,
 op-tee@lists.trustedfirmware.org, linux-kernel@vger.kernel.org,
 linux-hardening@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linaro-mm-sig@lists.linaro.org, linux-doc@vger.kernel.org,
 Neil Armstrong <neil.armstrong@linaro.org>
References: <20250820-qcom-tee-using-tee-ss-without-mem-obj-v8-0-7066680f138a@oss.qualcomm.com>
 <20250820-qcom-tee-using-tee-ss-without-mem-obj-v8-6-7066680f138a@oss.qualcomm.com>
 <itpdolgmxp4ofdv3vf2ghulo7slj5wjby2tvawehihwvenbep2@ub5sdgf6gxeh>
Content-Language: en-US
From: Amirreza Zarrabi <amirreza.zarrabi@oss.qualcomm.com>
In-Reply-To: <itpdolgmxp4ofdv3vf2ghulo7slj5wjby2tvawehihwvenbep2@ub5sdgf6gxeh>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=cLDgskeN c=1 sm=1 tr=0 ts=68aea062 cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=hi51d+lTLNy/RbqRqnOomQ==:17
 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10 a=3sczFqAQEyrjP0LPqEUA:9
 a=QEXdDO2ut3YA:10 a=2VI0MkxyNR6bbpdq8BZq:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODI2MDE1MyBTYWx0ZWRfX/V3od7MdrL6m
 t18MCel84amUMCp0t7XVLZGjjNQRuPB6VGrwiSWgNLTF/WvcOVz0wVW9MuLL4aiN5oIVbdzeHCU
 0P75CqEKq2TDwLdJxeNYLXZg4jU3vLIKTT5xthyTVxoLAqvK7KFb0tgeYE46ZP8cxbKD8YWfbLs
 F3kOtoaCtIVfzyOVDEOJYEULBk8sxIQ9QLdXu5d0dheXpuVFO/HQm7UxLRj8qNFJu7DGo++k0o1
 0FdXp/MyHYgWdMOPUpEbrXi1SknFyPugmgX6ZE6IOobsE6ZNGA0OSTgDuQs+r4LOFxERhnfoiTD
 MLxXIQ5G1K5p7nC9ZMuFweU7+eXsUkd1bpg2MI8sp+XHPCRFuN43Fr5nAggVli2N8NeoAeVmI1y
 VT/I6drP
X-Proofpoint-GUID: d_PQNF9Y_G_tPHJIAV5-faV5-LyPVMpn
X-Proofpoint-ORIG-GUID: d_PQNF9Y_G_tPHJIAV5-faV5-LyPVMpn
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-26_02,2025-08-26_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 clxscore=1015 malwarescore=0 spamscore=0 adultscore=0
 impostorscore=0 suspectscore=0 priorityscore=1501 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2508260153
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

Hi Bjorn,

On 8/27/2025 1:52 AM, Bjorn Andersson wrote:
> On Wed, Aug 20, 2025 at 04:38:53PM -0700, Amirreza Zarrabi wrote:
>> diff --git a/drivers/firmware/qcom/qcom_scm.c b/drivers/firmware/qcom/qcom_scm.c
> [..]
>> +static void qcom_scm_qtee_free(void *data)
>> +{
>> +	struct platform_device *qtee_dev = data;
>> +
>> +	platform_device_unregister(qtee_dev);
>> +}
>> +
>> +static int qcom_scm_qtee_init(struct qcom_scm *scm)
>> +{
>> +	struct platform_device *qtee_dev;
>> +	u64 result, response_type;
>> +	int ret;
>> +
>> +	/*
>> +	 * Check if QTEE supports smcinvoke:
>> +	 * This will fail due to invalid buffers, but first, it checks whether
>> +	 * the call is supported in QTEE syscall handler.
>> +	 * If not supported, -EIO is returned.
>> +	 */
>> +	ret = qcom_scm_qtee_invoke_smc(0, 0, 0, 0, &result, &response_type);
>> +	if (ret == -EIO)
>> +		return -EIO;
>> +
>> +	/* Setup QTEE interface device. */
>> +	qtee_dev = platform_device_alloc("qcomtee", -1);
>> +	if (!qtee_dev)
>> +		return -ENOMEM;
>> +
>> +	qtee_dev->dev.parent = scm->dev;
>> +
>> +	ret = platform_device_add(qtee_dev);
>> +	if (ret) {
>> +		platform_device_put(qtee_dev);
>> +		return ret;
>> +	}
> 
> Wouldn't this work instead of the alloc + parent + add?
> 
> 	qtee_dev = platform_device_alloc_data(scm->dev, "qcomtee", -1, NULL, 0);
> 	if (IS_ERR(qtee_dev))
> 		return PTR_ERR(qtee_dev);
>

You are right, I'll replace it with platform_device_register_data().

>> +
>> +	return devm_add_action_or_reset(scm->dev, qcom_scm_qtee_free, qtee_dev);
>> +}
>> +
>>  /**
>>   * qcom_scm_is_available() - Checks if SCM is available
>>   */
>> @@ -2326,6 +2450,16 @@ static int qcom_scm_probe(struct platform_device *pdev)
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
>> +	dev_warn_probe(scm->dev, ret, "Failed to initialize qcomtee\n");
> 
> A successful boot of db410c (APQ8016) now has the following in the log:
> 
> [    0.161437] qcom_scm firmware:scm: error -EIO: Failed to initialize qcomtee
> 
> If the target doesn't implement qtee, I'd expect that you tell me that -
> or preferably stay silent.
> 
> Looking at the other error conditions, we find -ENOMEM, for which you
> should also avoid printing. In fact, I believe all other error paths of
> qcom_scm_qtee_init() will have printed an error already (if not, please
> move the error print to the place(s) where it's needed).
> 
> As you're ignoring the return value, please then also change the return
> type of the function to void.
> 
> Regards,
> Bjorn
> 

Sure, a successful QTEE boot already logs its version from TEE SS,
along with any internal error messages. Based on those logs,
it's quite clear whether this function failed or succeeded at the
beginning. I'll remove the print statements.

Regards,
Amir

>> +
>>  	return 0;
>>  }

