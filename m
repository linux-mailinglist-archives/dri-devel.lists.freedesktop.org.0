Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A4564CFE2AC
	for <lists+dri-devel@lfdr.de>; Wed, 07 Jan 2026 15:08:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BB47D10E5EA;
	Wed,  7 Jan 2026 14:08:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="UBmKmXa8";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="cm9vtgvh";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0B2BA10E5E7
 for <dri-devel@lists.freedesktop.org>; Wed,  7 Jan 2026 14:08:09 +0000 (UTC)
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 6079c6GH2877508
 for <dri-devel@lists.freedesktop.org>; Wed, 7 Jan 2026 14:08:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 mCbn5kuKUVOa7StqdNfdgtoPVjIvEhpYuWWE9PJhHbI=; b=UBmKmXa8lJdanWPk
 9kQMooo71A92HE7SGebPQ9STM8M+9pq6NRg8hbacBluETQb8u+OeIvIxmi5QV1Jr
 PPJdfU+cqC24l9Ui5QXrV8HaJWZmBMNoge3SDtRbrJNE4HUPdYuKhXIEComH/kSZ
 ZnhYEQ7tTCAp6G+VtP/I5N7zVGPQ9+bew655fML/x62frlELdJzEj/T7Y7Pr8W4j
 +6BtDdiCIzQzxFA77rKgy/Wm1hyR48d4HPmcPVkRzJGwjpMmxbFcMLvd8YLzLmPQ
 3nm0I42bAyVexV9CKB79GExN/2KYdHL/O9gl4baTg83yDBqG04DgH+YNuoCP39+I
 A+qYtw==
Received: from mail-yx1-f71.google.com (mail-yx1-f71.google.com
 [74.125.224.71])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bhn1crrv5-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Wed, 07 Jan 2026 14:08:09 +0000 (GMT)
Received: by mail-yx1-f71.google.com with SMTP id
 956f58d0204a3-6455321ccc7so387811d50.3
 for <dri-devel@lists.freedesktop.org>; Wed, 07 Jan 2026 06:08:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1767794888; x=1768399688;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=mCbn5kuKUVOa7StqdNfdgtoPVjIvEhpYuWWE9PJhHbI=;
 b=cm9vtgvh+OqzEsV+w7T9+oyi4wSo3dDxqN36UrVC+z98lmsUZspFyJpkRSuINAK8Q+
 HN4U0b1bitJMe81k/0EI5mb2fqJEAd5E6N3M4nobUaPtaIPZR7T7dm+X0pQn47r5HTpp
 WI0YV1yFVMTNNxSDlOOROvdhF8skTyhgIHs96HiR9h11ge9YVuuQn3JObvX429KqoBMg
 92eoyNitDv8xqa0Ijl7CsvnODULREyB+hAip4L3bEeDMqJ8w4jGrpRPVCs/MjYNQsZYy
 Ll9t3Yjpp/N1h1WCnBZVrApZRvCOFpMhfwfXwcZP02Rew4HrI8byaIZPZ7l0OqACC7ZS
 qN+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1767794888; x=1768399688;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=mCbn5kuKUVOa7StqdNfdgtoPVjIvEhpYuWWE9PJhHbI=;
 b=tNWbx+ge5uqbs4Zjr+kkEWIKXSiz3v3+4KDyGCig5JuO8+DvMPSAzeAESeDcPwfLC0
 Ghc1bIMLcix/HRL/TQ/D2FlYN5YVQwQcXh26OtjKLA0aNRUXjSOHMrUQdTYZ6VnWqY13
 kRgKnDJ7y8FV+vI6KR8UdOyok++R7809i4wcvHcgzZ/PSUzUY3/ZamHjyL+qk7E4aDcb
 MV/zleGTGhkPDlRkZcjREWPSaJ+iV73mwjvAsPiZe9X9zHdQ3GWTgEsnGA9vljR8ADGZ
 UDVmDCRpH23LzSHcjhqRsBVD5FbMjkGBd7uhlcBfBXfsmBFjBPM1hneFfLI/mddmoTRr
 UJ5A==
X-Gm-Message-State: AOJu0YzEddj6o1lFXcDDYFS0K8xqN950OTwZpg7VIDhIqaAWw/N3bmqi
 mQMbbkO57OiQrUMTGeao/h7by9XvawISiy/wt/H7ZLs1W+HaELXyCWOPAXjLWUtxn64m5z4w+P4
 Col3X0/SLoBOoam7fF8QT1IxS1E72JnHMIQQweHvGwQJYh9uYntXsamSlTh5Y5v6HbJnSTXY=
X-Gm-Gg: AY/fxX4z2tUv9LTzoGorZkUtWxugFd6+WeCQZ4Y2nvhqktgEU0sGFaXNMbgRhwd2TMW
 dMqZHJyBdQLETg5GCVjelZ2IpWaa3wwtJcZ7I6QBrumZOUKmM4eP6LFXlkkVFndvZjqasiountX
 MgDJhxde2TsAeG+Tc4HRsHe35rVcGlSSuzhGxYbQn4miEl/iVo7R+2TXA3Cp7eV1D7xd7m7HDYB
 9+S0ka/yokGN9ZYCHGchgqIHQslPW2n/OyCkaBYBaKHAhuKt8EMRlCc6obZ7+sVCNOhViTAGIx1
 IPh7zzEOa3YJALpnyynBsMTeDDUAHwEjHC9a+wFNA1q3La+xuISUafxrFdJebDmdqpbbXgPavzX
 tIVxZ9DISH1HOAVsOQA7BBqK4cqWwQA2qvXNE2QmivSgfv4S//PkSzmKqQ3oUYdvAtKo=
X-Received: by 2002:a05:690c:9:b0:78c:2c4d:3df9 with SMTP id
 00721157ae682-790b54b5af8mr27270587b3.0.1767794888346; 
 Wed, 07 Jan 2026 06:08:08 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHyUpA3k3b3g5qtKWK7Tl1X2D7wG2aBAVLD35CZGCs0GMhgDfMQ+H933I+o6Rq2dV0QTyPUnQ==
X-Received: by 2002:a05:690c:9:b0:78c:2c4d:3df9 with SMTP id
 00721157ae682-790b54b5af8mr27270177b3.0.1767794887752; 
 Wed, 07 Jan 2026 06:08:07 -0800 (PST)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl.
 [78.88.45.245]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b842a56962esm529552466b.66.2026.01.07.06.08.05
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 07 Jan 2026 06:08:07 -0800 (PST)
Message-ID: <09a4642a-3552-44e7-97bd-b26e6937ad8b@oss.qualcomm.com>
Date: Wed, 7 Jan 2026 15:08:04 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/5] arm64: dts: qcom: msm8953-xiaomi-vince: correct wled
 ovp value
To: =?UTF-8?B?QmFybmFiw6FzIEN6w6ltw6Fu?= <barnabas.czeman@mainlining.org>,
 Lee Jones <lee@kernel.org>, Daniel Thompson <danielt@kernel.org>,
 Jingoo Han <jingoohan1@gmail.com>, Pavel Machek <pavel@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Kiran Gunda <quic_kgunda@quicinc.com>, Helge Deller <deller@gmx.de>,
 Luca Weiss <luca@lucaweiss.eu>, Konrad Dybcio <konradybcio@kernel.org>,
 Eugene Lepshy <fekz115@gmail.com>, Gianluca Boiano <morf3089@gmail.com>,
 Alejandro Tafalla <atafalla@dnyon.com>
Cc: dri-devel@lists.freedesktop.org, linux-leds@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 Daniel Thompson <daniel.thompson@linaro.org>,
 linux-arm-msm@vger.kernel.org, linux-fbdev@vger.kernel.org
References: <20260107-pmi8950-wled-v1-0-5e52f5caa39c@mainlining.org>
 <20260107-pmi8950-wled-v1-3-5e52f5caa39c@mainlining.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260107-pmi8950-wled-v1-3-5e52f5caa39c@mainlining.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTA3MDEwOSBTYWx0ZWRfX+XiR6XDbqwPp
 I/gjFQ623VJCUA+RIntFE1EQwSjmWMOc1BrzuB8SUThJfj997cmEhG0v9J8zI6zgSC9wzbgyfsw
 mLHX4Ew/vnvx6LeXR9JA//Otkm8aYKUBNHA2tJE92Ji0Ml7UO36FFep23E70/b13qboeUcSalHo
 WWTBNHDqtFV40XF5DrkfPcTAKkAbSfoXDe0s4DznsW8wnbK0ELkZa7LHhuutkNA3QoEk6pwH4eN
 CzsXM4SBaId8Mf8JbxWLOTEf3usjq6azrtWL1USh2dBXmICnJeEdmms9w3LEXWVBy/hU4qYcIRH
 wnirz5Y7Zl553TtVrALRw8MLgGh5WQwEZODD+Zgle/f1RTKJjpOL8PRcRNomI08h80TyVzeTkA8
 IfIXUtlBcucG0k3AYtPyN3RL+mNes50MWwk/PU2nsZx7ssfHDRVmufQjcV53uvKg16+FhZ9Puib
 Hbig9+VxJq+t7EHQAhA==
X-Authority-Analysis: v=2.4 cv=INwPywvG c=1 sm=1 tr=0 ts=695e68c9 cx=c_pps
 a=ngMg22mHWrP7m7pwYf9JkA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=cwWn7d2NfpHSwl1uxIYA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=yHXA93iunegOHmWoMUFd:22
X-Proofpoint-ORIG-GUID: jpwcrtJN_IxilfnM1aVLmKBpZ7QGixIH
X-Proofpoint-GUID: jpwcrtJN_IxilfnM1aVLmKBpZ7QGixIH
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-07_02,2026-01-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 spamscore=0 impostorscore=0 lowpriorityscore=0 malwarescore=0
 priorityscore=1501 adultscore=0 clxscore=1015 suspectscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601070109
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

On 1/7/26 2:31 PM, Barnabás Czémán wrote:
> Correct wled ovp value from 29600 to 29500.

This tells us what the fix is, but not why the fix needs to be made.
We can infer the former from the patch contents, but it's really
important that the next reader, perhaps in 5 years, can find out the
reason it was made.

How about:

"""
PMI8950 doesn't actually support setting an OVP threshold value of
29.6 V. The closest allowed value is 29.5 V. Set that instead.
"""

With this or similar commit message:

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

