Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D69AFA78A25
	for <lists+dri-devel@lfdr.de>; Wed,  2 Apr 2025 10:39:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8066610E713;
	Wed,  2 Apr 2025 08:39:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="IXlwdO1m";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 31A5910E713
 for <dri-devel@lists.freedesktop.org>; Wed,  2 Apr 2025 08:39:06 +0000 (UTC)
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5323xWuh024546
 for <dri-devel@lists.freedesktop.org>; Wed, 2 Apr 2025 08:38:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 GXqn91oM87dfs6ORjh1DbmH5yqUbfVcBo3QmJoJCJ5E=; b=IXlwdO1mKEyHcZRa
 8XSR1STQl06bFOaPLdH9iaSGLzlA9YfEP6OuEh+Z2fr0jaVqR7WlSSsYxnxDuW/l
 lKp8Il1cNNRE8ogH3Op9dQpHjk/cEWzrlRgH4tpW/ICDPoy8OwKxgjMmmUlZq+m6
 qKtTB6gtGPcEx10ZwJDThTxQUC60vmOLe2OwcVMqhywt+bx5MjeQfDmRqQV1lFEw
 pwUp1s1HvcI4RdmCX6mw6T9wQh4rntseYmAdYeuCPf8fUv8tZ1QOVarBldiebvEi
 Sej2G+1ZFD9lrDE7kAoWY5Tz/0+TNsbytrhyjUv7OUhEuJpSGVNLmGqLYiPPkRUa
 iqqXng==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com
 [209.85.216.71])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45rbpyusp5-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Wed, 02 Apr 2025 08:38:57 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id
 98e67ed59e1d1-2ff8340d547so11404318a91.2
 for <dri-devel@lists.freedesktop.org>; Wed, 02 Apr 2025 01:38:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1743583136; x=1744187936;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=GXqn91oM87dfs6ORjh1DbmH5yqUbfVcBo3QmJoJCJ5E=;
 b=ZCDg/ExApYuc1KrCNpCnGBWgNlbTfDNQGVmTYgsWiP0lARnlveUyCQ7loaWbO/MosE
 7xuF2wgj0H+m7Qq/XtT6+sVyr2wXB/Rylww0BomAxXsHdqOI5Vl/IQTN4mydWU0y88xa
 xb9CuXGNhTlmAzrXHb0TbZ96Bd8K7HucrOkN37854egZykoHUMMgzmFf4/NKwbVZThBV
 IAJ34lkRPKoGucbEQ36BrPDTSkpmjqjXf4JQ5UtibGtTvWOqzJw5lUQ79MnjbTVPBzD8
 USmOq2Aor1cNzRWjrlJZE2JRqBrlyrh6unykrX3aQOg5mjTwMQtBQJtSYC1M8iiPWHlI
 Dnpg==
X-Forwarded-Encrypted: i=1;
 AJvYcCVqm+iVURUO+Nf+lpV0W1yq2eTuDV2YxTNB2lMaGtk6rixp9NIitNJUOqOXm5En2g7qmgo11uGg0o0=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwWS31rSvHAXw8wt7WzD63hlaaVjMMkioWlO3wkzyAXDMEdwprA
 QNhNlvPX5L8FccAmLnGbBAMr9Om3McgCVZ+99zNE5+PpeKLasnuJYaSbT+836LDmqf2xsiDlKwY
 PdRu1RqcXAqDwkzmvfpqWHtD9Oy3MOPfRB88zEWjgKKSNakSDmjsmxeL/3HIgA7/I0G8=
X-Gm-Gg: ASbGnctGlTfnFJDuR6k0rYsoYSj3afT93cnR2S2NiJ5EXM8CXVjQ3NYgiXDU6RlIYSP
 fNlDYfNZT1HrIxVL29Ty8vSIjBg59yc9RqROZHkkYkVa2c/f0nVR5uq2rEa/oASLiULAArIAduA
 Guc58h64ZVLkkNQ2JPTm+43S3Aodmi2owTKcf44LsazhPWbq85EC+m+A98fmD+yr+Ok8vYiW2vT
 +eouB9lbPc925xzqcHAursaKpCgmd+7c4hHiNHXBfWBxeFAwUr8/bWdBxLJrd8PfCwfFNz3dXwk
 VRX1mhe11m5QQXl/bhRtLk0JJsW3PPlungdmjOC5
X-Received: by 2002:a17:90b:4c12:b0:305:2d27:7cb0 with SMTP id
 98e67ed59e1d1-305320b95e3mr21253099a91.21.1743583136530; 
 Wed, 02 Apr 2025 01:38:56 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGxpsxlI6jN778d4IK6ZYalPCibRjZVRcQJLRGaiqCKzoGfBMcE5UhmULWg6FxU234tpItMNQ==
X-Received: by 2002:a17:90b:4c12:b0:305:2d27:7cb0 with SMTP id
 98e67ed59e1d1-305320b95e3mr21253061a91.21.1743583136052; 
 Wed, 02 Apr 2025 01:38:56 -0700 (PDT)
Received: from [10.204.65.49] ([202.46.23.25])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2291eec52cbsm103025065ad.37.2025.04.02.01.38.51
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 02 Apr 2025 01:38:55 -0700 (PDT)
Message-ID: <412fe24e-ce70-4733-ace5-d3fbe43476c4@oss.qualcomm.com>
Date: Wed, 2 Apr 2025 14:08:49 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/3] misc: fastrpc: add support for gpdsp remoteproc
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Ling Xu <quic_lxu5@quicinc.com>, andersson@kernel.org,
 konradybcio@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, amahesh@qti.qualcomm.com, arnd@arndb.de,
 gregkh@linuxfoundation.org, quic_kuiw@quicinc.com,
 quic_ekangupt@quicinc.com, linux-arm-msm@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
References: <20250320091446.3647918-1-quic_lxu5@quicinc.com>
 <20250320091446.3647918-3-quic_lxu5@quicinc.com>
 <30bba296-8e6f-41ee-880e-2d5ecc8fe5a4@linaro.org>
 <qhriqbm6fcy5vcclfounaaepxcvnck2lb7k2gcpbtrojqzehua@khv5lwdgbysc>
 <9962c517-5c0e-4d46-ac0c-2a7bab550156@linaro.org>
Content-Language: en-US
From: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
In-Reply-To: <9962c517-5c0e-4d46-ac0c-2a7bab550156@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: BZXX9ZiYY1xS3jbnSUUwyWfvcsLyETw_
X-Proofpoint-ORIG-GUID: BZXX9ZiYY1xS3jbnSUUwyWfvcsLyETw_
X-Authority-Analysis: v=2.4 cv=ZNLXmW7b c=1 sm=1 tr=0 ts=67ecf7a1 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=COk6AnOGAAAA:8 a=EjjHKn1hvHTiu-shZIMA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=uKXjsCUrEbL0IQVhDsJ9:22
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-02_03,2025-04-01_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0
 lowpriorityscore=0 clxscore=1015 mlxscore=0 adultscore=0 mlxlogscore=999
 priorityscore=1501 bulkscore=0 suspectscore=0 malwarescore=0 phishscore=0
 impostorscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504020054
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



On 3/21/2025 5:53 PM, Srinivas Kandagatla wrote:
>
>
> On 20/03/2025 18:43, Dmitry Baryshkov wrote:
>> On Thu, Mar 20, 2025 at 05:11:20PM +0000, Srinivas Kandagatla wrote:
>>>
>>>
>>> On 20/03/2025 09:14, Ling Xu wrote:
>>>> The fastrpc driver has support for 5 types of remoteprocs. There are
>>>> some products which support GPDSP remoteprocs. Add changes to support
>>>> GPDSP remoteprocs.
>>>>
>>>> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
>>>> Signed-off-by: Ling Xu <quic_lxu5@quicinc.com>
>>>> ---
>>>>    drivers/misc/fastrpc.c | 10 ++++++++--
>>>>    1 file changed, 8 insertions(+), 2 deletions(-)
>>>>
>>>> diff --git a/drivers/misc/fastrpc.c b/drivers/misc/fastrpc.c
>>>> index 7b7a22c91fe4..80aa554b3042 100644
>>>> --- a/drivers/misc/fastrpc.c
>>>> +++ b/drivers/misc/fastrpc.c
>>>> @@ -28,7 +28,9 @@
>>>>    #define SDSP_DOMAIN_ID (2)
>>>>    #define CDSP_DOMAIN_ID (3)
>>>>    #define CDSP1_DOMAIN_ID (4)
>>>> -#define FASTRPC_DEV_MAX        5 /* adsp, mdsp, slpi, cdsp, cdsp1 */
>>>> +#define GDSP0_DOMAIN_ID (5)
>>>> +#define GDSP1_DOMAIN_ID (6)
>>>
>>> We have already made the driver look silly here, Lets not add domain ids for
>>> each instance, which is not a scalable.
>>>
>>> Domain ids are strictly for a domain not each instance.
>>
>> Then CDSP1 should also be gone, correct?
> Its already gone as part of the patch that I shared in this discussion.
>
> I will send a proper patch to list once Ling/Ekansh has agree with it.
>
Thanks, Srini, for sharing this clean-up patch. It looks proper to
me, but I was thinking if we could remove the domain_id dependency
from the fastrpc driver. The addition of any new DSP will frequently
require changes in the driver. Currently, its usage is for creating
different types of device nodes and transferring memory ownership to
SLPI when a memory region is added.

The actual intention behind different types of device nodes can be
defined as follows:

fastrpc-xdsp-secure: Used for signed (privileged) PD offload and for daemons.
fastrpc-xdsp: Should be used only for unsigned (less privileged) PD offload.

The reason for this constraint is to prevent any untrusted process
from communicating with any privileged PD on DSP, which poses a security risk.
The access to different device nodes can be provided/restricted based on UID/GID
(still need to check more on this; on Android-like systems, this is controlled by
SELinux).

There is already a qcom,non-secure-domain device tree property[1] which doesn't
have a proper definition as of today. The actual way to differentiate between
secure and non-secure DSP should be based on its ability to support unsigned PD.

One way to remove the domain_id dependency that I can think of is to use this
property to create different types of device nodes. Essentially, if unsigned PD
is supported (e.g., CDSP, GPDSP), we add this property to the DT node and create
both types of device nodes based on this. Otherwise, only the secure device node
is created.

This raises the question of backward compatibility, but I see that on most older
platform DTs, this property is already added, so both device nodes will be created
there, and applications will work as expected. If any old DT DSP node lacks this
property, we can add it there as well.

Going forward, the qcom-non-secure-property should be added only if unsigned PD
is supported. This way, we can clean up the driver completely to remove the
domain_id dependency.

If this sounds good, I can work on this design and send out a patch.

[1] https://web.git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/tree/Documentation/devicetree/bindings/misc/qcom,fastrpc.yaml#n44

--Ekansh

> --srini
>>
>

