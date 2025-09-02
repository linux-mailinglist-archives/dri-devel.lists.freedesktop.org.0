Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B638CB3FCE8
	for <lists+dri-devel@lfdr.de>; Tue,  2 Sep 2025 12:42:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7773910E658;
	Tue,  2 Sep 2025 10:42:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="k5FGj8Bc";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ED49010E658
 for <dri-devel@lists.freedesktop.org>; Tue,  2 Sep 2025 10:42:52 +0000 (UTC)
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5822Rxco012621
 for <dri-devel@lists.freedesktop.org>; Tue, 2 Sep 2025 10:42:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 8HGSFKsLXaVM0YQCxvDcTSEB0RtFGcIdJeQwMuf7cA0=; b=k5FGj8BcmA1eiPhp
 bQChXRO2Bur6Fh3Abwsc5WbKS43zZtdYjhR+gVXcxZ8iE6izst9b4mEIr4tocXqH
 gpM64rn8Tk2zuPKnVTwj2T+KwYHN2nWSJWvVBjBXxJ7v16hMdMGDa0Iag5jZFcML
 nWKtyXfjdbGGxEcxHVW5kkIMiVnJ86XEXqEO0z0ptexxMh0JMah1q0PFDaPzfGM0
 RQhtKehrck1xSC95qAtKUxdiPuJUr5Pr1uf7K1Y4pZyGaEkPuQlemMsoFhhtIZmw
 XhoULg+Uj0XEpri08k9zaukT3nCuBlgHzFsTzMFezCjVacu7UbRzYUDBXp364Y5e
 atzo+g==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com
 [209.85.160.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48uq0efmt2-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Tue, 02 Sep 2025 10:42:52 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id
 d75a77b69052e-4b109af71a5so20235851cf.1
 for <dri-devel@lists.freedesktop.org>; Tue, 02 Sep 2025 03:42:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1756809771; x=1757414571;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=8HGSFKsLXaVM0YQCxvDcTSEB0RtFGcIdJeQwMuf7cA0=;
 b=psNXhJcPyS1yMAl4lLlC7KRrcx9S1Y4iOWFi+GszL7Q7Vh/bSpBP3xh6cSQxrHUbGf
 vpX+FLc3nsv5aoG9IaSSOXXJHVSZWpMkB9JJAoosZnyFqfB6PIR1c3uobjk/qw6iskaa
 XcCVd3+nOpgbDlH5W2dIesL11MiRWR4Ylp87Pny1MzI2REzyyXAOY96ddUfMfqDJ3paz
 MNEFXZ9MeEBFnRp3oqiFT0xMu2H7aT/xZJUT4Et9gebIAP767KFDWmkWGQ6NW8FdeG0M
 FWL96TKWDQNV4ZPy/TbRymjfX7iuPk5IO6NuaG1l1nQFfJiUOWeNTW9xf5C2m2ijs62Y
 Zp/Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCV+AzDAEylnCHBfDcqrdWyywsOSmR+C7FJOaAEmnbnGp8DzoUZhvOVCeN98OiqTSSgcVeAcrqcNGVk=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzV4gz3AZ+C2PRcPkC3iVaRmqQZIELe6Njqz/XEFlF73FcQwEVT
 P3Cy0kkJbpicN8iayVznwTCa4AUCLuHGT2T83o+ZQbP7SxpN7X5kG/oiTpMQS34gEPI/QPe41UH
 tz4k2XyDqIYhyfToqqkBXLiW86MC3CFzOf4juQ4ueailZ0nq1doy9z2CuOrg/fp7qEeoc6sg=
X-Gm-Gg: ASbGncurkCKfBbKnMay2Zg1U6SZi2B9fhg9cDveMILjb2ccLYs88rz8pisjitdTIIS0
 F73yH/FPXKYYY1OpAnws2/OTF6mc/znGD1vmfW1+qedgiqzYz4bofLQa8dKRBbUXqMJ0vOsQ/s4
 uKcM0G7I522q5l3SiHc8RWrvd/1j1P43E+inUZPUr90qIj5C2MpYvWbUe1D8as4hmktXdakH3qe
 xvo0SLZPMZojNLzxvOWR6RNlWzEhHZvvHt0px8PssTFD0Ou136jtZERzbOcyVZPXvqZXNhYDFef
 oULen+xkEG/uUdwgdDraqrsmAF5pjtzJE5DaHnJmr+d0vxTumzHBU3sw7ZaD0DrR5skjKnR9H3j
 UzRj4PGuzZRbUnaraUUlaFA==
X-Received: by 2002:ac8:58ca:0:b0:4ab:63f8:ef30 with SMTP id
 d75a77b69052e-4b30e90634emr127554571cf.3.1756809770664; 
 Tue, 02 Sep 2025 03:42:50 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEIa+zdu/DvCI2hhATthcW4/zvfigbUW8Sknvl3mmHIrbuZ2hMWV/w4jclDKRuy1HZUPW0xbA==
X-Received: by 2002:ac8:58ca:0:b0:4ab:63f8:ef30 with SMTP id
 d75a77b69052e-4b30e90634emr127554151cf.3.1756809769909; 
 Tue, 02 Sep 2025 03:42:49 -0700 (PDT)
Received: from [192.168.149.223] (078088045245.garwolin.vectranet.pl.
 [78.88.45.245]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-61cfc4bbc6bsm9385161a12.29.2025.09.02.03.42.46
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 02 Sep 2025 03:42:49 -0700 (PDT)
Message-ID: <f49b34be-89d3-498d-8b85-ff6b0be01acf@oss.qualcomm.com>
Date: Tue, 2 Sep 2025 12:42:44 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 01/14] dt-bindings: display/msm: dp-controller: Add
 sm6150
To: Xiangxu Yin <xiangxu.yin@oss.qualcomm.com>,
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>,
 Dmitry Baryshkov <lumag@kernel.org>, Abhinav Kumar
 <abhinav.kumar@linux.dev>, Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
 Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Kuogee Hsieh <quic_khsieh@quicinc.com>, Vinod Koul <vkoul@kernel.org>,
 Kishon Vijay Abraham I <kishon@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-phy@lists.infradead.org, fange.zhang@oss.qualcomm.com,
 yongxing.mou@oss.qualcomm.com, tingwei.zhang@oss.qualcomm.com,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, quic_lliu6@quicinc.com
References: <20250820-add-displayport-support-for-qcs615-platform-v3-0-a43bd25ec39c@oss.qualcomm.com>
 <20250820-add-displayport-support-for-qcs615-platform-v3-1-a43bd25ec39c@oss.qualcomm.com>
 <75ra2ofecqu6tid6kr4hnyuztpl6jjaq2ksyquafyajhq2sa4d@4tkggrdqky7y>
 <8918feef-219e-4e69-8901-367189f5066d@oss.qualcomm.com>
 <28b33851-24eb-428f-b046-b145342fd982@oss.qualcomm.com>
 <75f8789d-9d97-49d9-97b0-908a5692c325@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <75f8789d-9d97-49d9-97b0-908a5692c325@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: rVBs8Az8b5WeD0Lfo7HsG10TU2RLBeGv
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODMwMDAwNCBTYWx0ZWRfXx8gREkvbSBMp
 qB5/d5GmaTWEkOwUAYHMxNMWT8Uc2xxgsgMY5wqW9nzqYDQzsl+cn5msDNHwBnqy2Zg2+3qSY+4
 3hZ5KL6XE5ISpUWhCpldkd5z26wTbxwDgvN3Hw8I4TQY1PV1pdPKE2cq92YsnEKCgRvETDFlMxo
 7Mk/PTT5jlxawFz1PldEQNPKkep/3rW2YXiLl+FaGwcXm+Mt7TFVXTFJy6v1c21DavKlf8DL6Gx
 LV2wEOjLfREbJU5SkMNVnFJygNuNf6ccWnZCJWPuGe5SzC9I5TShW8wqUBANypMBd9hFnNAWETx
 DiubpFmZRUfjfirP7hZa5hu/f6iy/igOlX6GrPMX+v1X1Ce2Gf71s12ia6S4+wfixTlqcIhPkNN
 NdfzPxjY
X-Proofpoint-ORIG-GUID: rVBs8Az8b5WeD0Lfo7HsG10TU2RLBeGv
X-Authority-Analysis: v=2.4 cv=ea09f6EH c=1 sm=1 tr=0 ts=68b6ca2c cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=zKpf_v0BVtz8pCFJhw8A:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-02_03,2025-08-28_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 clxscore=1015 malwarescore=0 phishscore=0
 bulkscore=0 spamscore=0 priorityscore=1501 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2508300004
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

On 9/1/25 2:32 PM, Xiangxu Yin wrote:
> 
> On 8/28/2025 7:05 PM, Dmitry Baryshkov wrote:
>> On 28/08/2025 07:51, Xiangxu Yin wrote:
>>>
>>> On 8/20/2025 6:18 PM, Dmitry Baryshkov wrote:
>>>> On Wed, Aug 20, 2025 at 05:34:43PM +0800, Xiangxu Yin wrote:
>>>>> Add DisplayPort controller for Qualcomm SM6150 SoC.
>>>>> While SM6150 currently shares the same configuration as SC7180,
>>>>> its hardware capabilities differ. Explicitly listing it ensures clarity
>>>>> and avoids potential issues if SC7180 support evolves in the future.
>>>> I assume, it has no MST support. Am I right?
>>>
>>>
>>>  From sm6150 ipcat, I found MST-related registers and pixel1 clk definition.
>>
>> Then please describe MST as the main difference between SM6150 and SC7180 (which doesn't have MST).
>>
>> Also this needs to be rebased on top of the MST bindings. I've picked up the latest posted revision, but basing on the on-list discussion I might need to drop it and post another iteration. 
>>
> 
> Would you prefer I keep the current patch and update the description of the
> MST capability difference with SC7180 in the commit message, or rebase on
> your series and update the dt-binding accordingly?
> https://lore.kernel.org/all/20250829-dp_mst_bindings-v7-0-2b268a43917b@oss.qualcomm.com
> 
> Since MST support is not yet mainlined in the DP driver, even if I rebase
> now, the final implementation may require redefining msm_dp_desc for
> SM6150 in both the dt-binding and the driver once MST lands.

dt-bindings must describe the hardware regardless of the current driver
functionality (which is unfortunately something we've not paid sufficient
attention to before and we're now untangling some messy files..)

Konrad
