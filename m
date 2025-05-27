Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 24BCDAC4C7D
	for <lists+dri-devel@lfdr.de>; Tue, 27 May 2025 12:55:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0A1A110E12C;
	Tue, 27 May 2025 10:55:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="Otw7rrQu";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1095E10E425
 for <dri-devel@lists.freedesktop.org>; Tue, 27 May 2025 10:55:14 +0000 (UTC)
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54RAV5PQ016126
 for <dri-devel@lists.freedesktop.org>; Tue, 27 May 2025 10:55:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 0QaN0jDgPB/5r3SY7bQD6QOdm26/CK5MylAtZs3M0Wg=; b=Otw7rrQu9o3Bd9nY
 gqO8p+fVniWgwLC6FBk5cDzZ4kUoQn/DCksFoErmbw2QWh++0rtmWf7o3RLWYbON
 H/WwCT6n1luUYXqetqtpkY3fPG8T4o4otAA4gvnY5Ou7mzAl7eE6WUgLp0mKbYHi
 cvVlQALrNXSiss0hbpwCRH6ZEJ87s8NeH9uqXr8IHbLqxhSnRVh/Pa6rlBBPnZu9
 iWE++XbHf5tYnWkfxqixFIVwUZ/qGS7CAETBBzabGGdE4xWMD0c43N6WLSZi0Ta/
 sFXwAeI7NkthQsX6rzcq24cwXa4msauUXZzXWEltHR5vHMn22QLlO4igclXTB7i1
 mN7FRQ==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com
 [209.85.219.71])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46u6b5pnhg-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Tue, 27 May 2025 10:55:11 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id
 6a1803df08f44-6faa4abbe6eso4850566d6.2
 for <dri-devel@lists.freedesktop.org>; Tue, 27 May 2025 03:55:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1748343310; x=1748948110;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=0QaN0jDgPB/5r3SY7bQD6QOdm26/CK5MylAtZs3M0Wg=;
 b=E+7l/3a0Iimelcq72M2Csjg/hMyqMBdsp7ijeQQhDgY41n7YJNEIkvNxQ23yP6PuEM
 bW2nu0JKZBt5uVWlbV6FMa+ieKOSUkAE2MauR9YTmHDA1o55EjHsEwvbwswzBBd4jzbE
 ZJy2pDKYaPFq2ndfjMLwKnqzfItYXXCjUk8eXFRSPd7jAnfGsWCy3Qt1Xts/xDOgo5cI
 EVudEPaLoVrJ/IPOkUZlc0MsCCwwQUcmAS6q7EoRc4UjCjdFYfV86+jr5k6wvQc9nAOz
 JQJzbL/u0Q7jDjX/F4WneVXCd98CLtQooEf3Lotw2WKNZBW6PprBDoTtTeJ7Hd5xQENt
 BPjQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVVagwLAmWTK4c2yaUjlpulN8hSycMZ4vZ08ukasd0x7or8Vv4VBRopQYIf0hMiTHyZfWhmA7NsU+4=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzWzHtEYmZRFJOM4fAR0jQ8Qq7oJCd3t3uJgPRzuPcQ3Hg1EZDS
 SDj0jWfsVyf0PXUJgzFDXgmjFW8q2cvczXN8loS4J/N/PjXStGxkD9KdOleh6vtXwqEPen1cDYb
 YEjsl581r6xzl4Dmp9sePjg0ANO0Z727MPNXaYqMzWy0gADEabnHtROTZw9v4GSQwBtuTDvI=
X-Gm-Gg: ASbGncs9hYnmbnGwYmL3/i4GyQKbOk9ymV1Sq6XcFuqvMmf0HyvhhU3c0YfivgzhATM
 V/mpEj288VOyiv0zihMc+Ihdj1w5arpv6NXDPTSSDfmZZ5W9vEj7mrj52Xw6PM/i5JvOUMG3/SS
 oGx+qJAwVouo5lqA2ujuunPRNkR0mkxVmRT8VaoB3cUYbjLnz45r5LDnMvV4L13y7EobNfhCNHr
 pZq3YjEVAQcMtqxFAi0xKi07sqEDn9FBk7hhjrGQMskxk8W5J9gPELaXTY0gwPRQYmn17NG1FSC
 5nKR2dLqrRvYX7JSJBSM/RqgfEl74yhFrFvX/wQMVHXAajLkiN5JJZJShgWEJEAKDQ==
X-Received: by 2002:a05:6214:2482:b0:6f8:b4aa:2a52 with SMTP id
 6a1803df08f44-6fa9d270dd0mr67671246d6.4.1748343310288; 
 Tue, 27 May 2025 03:55:10 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGTJV7hGI3ZkwSkprGN+pDgA9B/aLbKDp2MQye2teLhkvThg0W2kSQO/Ud2VQBEXioadf+3JQ==
X-Received: by 2002:a05:6214:2482:b0:6f8:b4aa:2a52 with SMTP id
 6a1803df08f44-6fa9d270dd0mr67671096d6.4.1748343309770; 
 Tue, 27 May 2025 03:55:09 -0700 (PDT)
Received: from [192.168.65.90] (078088045245.garwolin.vectranet.pl.
 [78.88.45.245]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-602cd35e2fcsm5162433a12.73.2025.05.27.03.55.07
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 27 May 2025 03:55:09 -0700 (PDT)
Message-ID: <152f5150-30b0-400c-9816-13e4710a4156@oss.qualcomm.com>
Date: Tue, 27 May 2025 12:55:06 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 5/5] arm64: dts: qcom: Add Lenovo ThinkBook 16 G7 QOY
 device tree
To: Rob Clark <robdclark@gmail.com>,
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Aleksandrs Vinarskis <alex.vinarskis@gmail.com>,
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
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <CAF6AEGvr_foMVwaE_VSVWLT50cbGi8i3UGwo2e=rORD-1JmTmA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=ZcodNtVA c=1 sm=1 tr=0 ts=68359a0f cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=EUspDBNiAAAA:8 a=vupSWsNl5j4Ukh8iwq0A:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=1HOtulTD9v-eNWfpl4qZ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTI3MDA5MCBTYWx0ZWRfX/QSsZFToyYtb
 zJbKPhzaB8/s8W+Z1zriQA+G2yah4XeHUJrRPvhzFLo90tkj5pF71rRCJxsjGNEr1k5Vcrg8cxT
 IxO9wIlHeQTAtsRVeM9A2vGtuzmZ6ug+q/NehtvqEE46VyfHfaUxwrmxHi8DsAUbvT/625x/Srb
 yKieW7R7WOlCmtBv6/BIiwQhfDsgoGyCqD2/yQfdPz6lZHlBd77fjjwjfNT1w8dzYiPd4f2GbtU
 tdEpAaq48R4XUugTa1BuQQ0cIWsA2HXAEUzwpvLDKPuolCjwyN3V6vQa01DFISOyGzzQHUzzBqC
 IlzVlf44KxdUYJ9iSwd1hMn2drBRkAJBMVNxkzXdnC/dN2V8PAtdSQzWLadgDur0aHNr9x8goNl
 bQ9lKrATwlYIRFq8LAcCfzeqpsn4sb9QR4knq1Qji8dy6SdW6UZ2HB3nEptacw/RpdK4Nda3
X-Proofpoint-GUID: etw-b6hRLiok2NY5uxOc9J-rGjv3fd9R
X-Proofpoint-ORIG-GUID: etw-b6hRLiok2NY5uxOc9J-rGjv3fd9R
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-27_05,2025-05-27_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 malwarescore=0 mlxlogscore=969 bulkscore=0 priorityscore=1501
 spamscore=0 clxscore=1015 suspectscore=0 lowpriorityscore=0 phishscore=0
 impostorscore=0 mlxscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505160000
 definitions=main-2505270090
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

On 5/26/25 5:28 PM, Rob Clark wrote:
> On Mon, May 26, 2025 at 1:36 AM Dmitry Baryshkov
> <dmitry.baryshkov@oss.qualcomm.com> wrote:
>>
>> On Sun, May 25, 2025 at 09:43:36PM +0200, Aleksandrs Vinarskis wrote:
>>> On Sun, 25 May 2025 at 15:33, Dmitry Baryshkov
>>> <dmitry.baryshkov@oss.qualcomm.com> wrote:
>>>>

[...]

>> Yes, please. Don't set okay status for the GPU until it gets enabled.
> 
> Drive-by: Shouldn't the dtb describe the hw and not the state of the
> linux kernel's support for the hw?  Ie. if bad things happen if we
> describe hw which is missing driver support, shouldn't we fix that in
> the driver.
> 
> (In the case of the GPU there is the slight wrinkle that we don't have
> a gpu-id yet so there is no compatible in the dtb yet.)

My two cents are that it's okay to enable it, at least in this case..

Konrad
