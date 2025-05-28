Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id ABACEAC6E97
	for <lists+dri-devel@lfdr.de>; Wed, 28 May 2025 18:59:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1C57E10E685;
	Wed, 28 May 2025 16:59:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="i9A7msKs";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3D76210E685
 for <dri-devel@lists.freedesktop.org>; Wed, 28 May 2025 16:59:19 +0000 (UTC)
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54S9Xmst010205
 for <dri-devel@lists.freedesktop.org>; Wed, 28 May 2025 16:59:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 OZ/GIA0WSr9eJOkPJDxd+ZEymhaMmc/jbzotcFP/Tp0=; b=i9A7msKs9T4m7sQ7
 9TD0U0CZGjMVxxWKsjjZmpIQsmp7adNbwlUWZXuzAZKzX5KDDt1EoS4kEuZhEYr/
 IiAeunODH+51QL6PYly/6Y1PXn5EtynYXcqJWvcXzgfPa3TVHq8eFVNcltF/FXdO
 TpitkVRaBXjkrp8FcuuaQDqCYGOmHvdNBX33NKDPpctYR5KWk64UG/6Njg1fmw2Y
 0KzcgDVF2XdtNG4pLKnpDb7TSUfM6QFM1Pr+lpV4iyRepkMNFoVvgIyVImeWqCZL
 rW+Jkzhwvdif3WtjI3WJnY9WIwAlVRtKvESEtEz66/fHq6y5wkL4NPDdc2FHSpak
 am3X3Q==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com
 [209.85.160.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46wavkvr9v-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Wed, 28 May 2025 16:59:18 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id
 d75a77b69052e-476783cbdb8so8353331cf.1
 for <dri-devel@lists.freedesktop.org>; Wed, 28 May 2025 09:59:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1748451557; x=1749056357;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=OZ/GIA0WSr9eJOkPJDxd+ZEymhaMmc/jbzotcFP/Tp0=;
 b=XFtRl5gUcFU8JF1ifcvzY90psN6wHrOuU9Esu0CFjJDrA6KoDmUYHvYnvZUE33wY8j
 Adds1m0vNNAxEyv0tqXX7iKAnsmsM5YPJ88+8Wwe2EYiGbutrCOH94WjzsEZ36pwxPuJ
 95Iq783lIIgPunrQGrLlmOI0IMgmjOW6HmybYttlKoC4xvFaEKp1ScXOAkIXGEB+ESct
 5MF6zh2DiALCSWJmJVIlDf1CXHKgIipat5qVC+obNl7GuM+URhvm8h00ZKry1TV5W+OX
 oz60j7Vj4pCkuTieTNkuVC9/13PjfRM3apjl2vsJomULneal8HgcRtux4Epwn4xxrhwb
 es1Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCW0c3cJPPa0ua/SBG9HvoYKr3CkH+kXz2WkZf/WN3vJPMWcMQWN8DGbLFDzKEYD4qevXcmR4TcDuSQ=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxNxxYd3o59VZO5kM2rgu1AbudVk83wMat1YXq7fHIeny/ykHnG
 aDCONT8gFDuQAEMrb1SFhsf62Zb9Jbx7f2Udppa24ttngOiGwEd5EhBHEqZUATlw0oF8WYaQm7I
 vperin9xXdF8G29Yd/QFGNUYbb+nnoageQQahEt5yRKjdfPxYOie3qUaQY/9V++egm4OPBUA=
X-Gm-Gg: ASbGnctADt9cQmxQHE9pTLyjBQUMrMVD9p+4FmTYKhm76siYD5PJ2pZyTu7oDlQS4rY
 8GSFzv0AS508sq4DZLT7OSYv16v/x2ntC8von9AJjALzEs0QUYHKTioKwq5dWMlLBuWSNHxagdF
 CsAimL1ri/prbWp4GKrjlRenachMIZ5/kDlr09Q0cdFGJ4pgGm7GDhtnIhoBC1k0e2St0YMJnPK
 +fSmtfteF8syXXTiUjv5PV+xjUHh6CODNKcR6DQ2Sxfx1xdxvUnEQ8+dNDFe8aEaR9zCCX5AY5K
 gt/3LWsoUjKl3suA62rx8b4TqtiwqkDhn6C4Pn36dKHloEyDlUuZPIDkQYcNWd9JkA==
X-Received: by 2002:a05:620a:40cd:b0:7c7:5384:fa53 with SMTP id
 af79cd13be357-7ceecbf4af7mr968131585a.6.1748451557390; 
 Wed, 28 May 2025 09:59:17 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHAL+YqMQeWpvXAQsu9NOtyQO1XUv8gfuWwheXdpWcfFgbiPN1ZK8NrIvSTpLX2pyw7cfpnQw==
X-Received: by 2002:a05:620a:40cd:b0:7c7:5384:fa53 with SMTP id
 af79cd13be357-7ceecbf4af7mr968128385a.6.1748451556936; 
 Wed, 28 May 2025 09:59:16 -0700 (PDT)
Received: from [192.168.65.90] (078088045245.garwolin.vectranet.pl.
 [78.88.45.245]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-ad8a1b29351sm136692966b.98.2025.05.28.09.59.13
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 28 May 2025 09:59:16 -0700 (PDT)
Message-ID: <a669eb4a-8e4d-4bdf-8bf0-7699d9a99e63@oss.qualcomm.com>
Date: Wed, 28 May 2025 18:59:12 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 5/5] arm64: dts: qcom: Add Lenovo ThinkBook 16 G7 QOY
 device tree
To: Rob Clark <robdclark@gmail.com>,
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
 Aleksandrs Vinarskis <alex.vinarskis@gmail.com>,
 jens.glathe@oldschoolsolutions.biz, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Matthias Kaehlcke <mka@chromium.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Douglas Anderson <dianders@chromium.org>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Jessica Zhang <quic_jesszhan@quicinc.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, Johan Hovold <johan+linaro@kernel.org>,
 linux-usb@vger.kernel.org, dri-devel@lists.freedesktop.org
References: <20250524-tb16-dt-v4-0-2c1e6018d3f0@oldschoolsolutions.biz>
 <20250524-tb16-dt-v4-5-2c1e6018d3f0@oldschoolsolutions.biz>
 <g7vlyqma6ow6tdsaqt2rfwvblxqwbqlwmoueio7i4vqvjy76kw@5bz4g33pq4t7>
 <CAMcHhXoYkQru_0n5siMGGkTcHu8yWRZWfT4ByiD8D0ieZHF+wQ@mail.gmail.com>
 <vwoixgdyjjzcjlv4muwrzv7wztnqyidtj7ghacgkjg6hgkkyl7@ji53bhiltaef>
 <CAMcHhXqDFuo+x99KOK0pQFj-FyTdQoZS_JvehNE2AC_JSoQ2gQ@mail.gmail.com>
 <rvyfkow43atquc64p6slck6lpfsot67v47ngvfnuhxqo222h6k@kdvbsmf3fwsr>
 <CAF6AEGvr_foMVwaE_VSVWLT50cbGi8i3UGwo2e=rORD-1JmTmA@mail.gmail.com>
 <152f5150-30b0-400c-9816-13e4710a4156@oss.qualcomm.com>
 <kbmqr7gjkd72hgorbhbwb7ttvmecfbb6pg72st7zwt5ogxju6p@itycxk6vriy5>
 <CAF6AEGsTtEA=So1CDhvg8H5+Z-RJ9OnhgSzDoa+zkWSPO3cvnA@mail.gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <CAF6AEGsTtEA=So1CDhvg8H5+Z-RJ9OnhgSzDoa+zkWSPO3cvnA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: ZX40O4dsiwmEFf1MV6K_F-2ZIUhiUR__
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTI4MDE0NyBTYWx0ZWRfX8DivjVKGx8NN
 YDNYbzCPnlhOgagE7ojaRfF40M9rD1xpgUtWRbTNax2rJvi7Vjd6AwQCwkB8lfyJ9xv1+MywpJ/
 Mxw07449UqNChQofUpayLvNNV/YGMEIRHp4o4YIE9gDGAs2yL+fKUjph3+RBwqDHps7ApwgFaUB
 N+Xckn4iNyskgokkPDpMG9bIzYZ4NzHFIGEWJsf115LNtNTKF/BQsP5YTSAiND1gZVisbDRAPfB
 grNIFNSwSsxateYZk0/+WGY/hD6Gm/OKPCN9CnC2GnnC8fe3aBlj4JbcTbf80iy039qbp3Dqon3
 kphVIF2FpDtAuEGo6Pc4e5bPnY01WpLie9Kg5qmCG4J+1fL/SNa6yPkvikmZGfe9KzPKmVWu3rq
 +eBpw8i2ICqXNS5tMsoVhRSjUGKh5M8SNBlcr5s4PyCxPUPWoquvdLPVwC0hKV62iX4xlXXK
X-Authority-Analysis: v=2.4 cv=fMk53Yae c=1 sm=1 tr=0 ts=683740e6 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=EUspDBNiAAAA:8 a=fSamKcmLYGn2YG_ZD4IA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-ORIG-GUID: ZX40O4dsiwmEFf1MV6K_F-2ZIUhiUR__
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-28_08,2025-05-27_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0 impostorscore=0 phishscore=0 suspectscore=0
 spamscore=0 priorityscore=1501 lowpriorityscore=0 clxscore=1015 mlxscore=0
 mlxlogscore=999 bulkscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505160000
 definitions=main-2505280147
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

On 5/28/25 6:50 PM, Rob Clark wrote:
> On Tue, May 27, 2025 at 11:18 AM Dmitry Baryshkov
> <dmitry.baryshkov@oss.qualcomm.com> wrote:
>>
>> On Tue, May 27, 2025 at 12:55:06PM +0200, Konrad Dybcio wrote:
>>> On 5/26/25 5:28 PM, Rob Clark wrote:
>>>> On Mon, May 26, 2025 at 1:36 AM Dmitry Baryshkov
>>>> <dmitry.baryshkov@oss.qualcomm.com> wrote:
>>>>>
>>>>> On Sun, May 25, 2025 at 09:43:36PM +0200, Aleksandrs Vinarskis wrote:
>>>>>> On Sun, 25 May 2025 at 15:33, Dmitry Baryshkov
>>>>>> <dmitry.baryshkov@oss.qualcomm.com> wrote:
>>>>>>>
>>>
>>> [...]
>>>
>>>>> Yes, please. Don't set okay status for the GPU until it gets enabled.
>>>>
>>>> Drive-by: Shouldn't the dtb describe the hw and not the state of the
>>>> linux kernel's support for the hw?  Ie. if bad things happen if we
>>>> describe hw which is missing driver support, shouldn't we fix that in
>>>> the driver.
>>>>
>>>> (In the case of the GPU there is the slight wrinkle that we don't have
>>>> a gpu-id yet so there is no compatible in the dtb yet.)
>>>
>>> My two cents are that it's okay to enable it, at least in this case..
>>
>> That would most likely make display unavailable as DPU driver uses GPU
>> as one of the components.
> 
> Hmm, perhaps we should allow the gpu to probe, but just fail to create
> priv->gpu, similarly to how we handle missing firmware?

Yes, let's stop killing the entire combo-stack in all scenarios..

Konrad
