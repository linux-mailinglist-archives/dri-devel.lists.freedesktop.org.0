Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C37C8BD7FF0
	for <lists+dri-devel@lfdr.de>; Tue, 14 Oct 2025 09:48:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1E38610E570;
	Tue, 14 Oct 2025 07:48:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="p3eyfRP4";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 574E210E576
 for <dri-devel@lists.freedesktop.org>; Tue, 14 Oct 2025 07:48:45 +0000 (UTC)
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59E6rmZt031289
 for <dri-devel@lists.freedesktop.org>; Tue, 14 Oct 2025 07:48:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 7lgQF7EpyJKKLU5XszH0WS1iI/dWpktDkSnmDk5Sjrk=; b=p3eyfRP4SwqteDia
 EYafs3c0ZdEZqqEv2tOlsKKZoQeLUAa2feNSHgPCGbforTZ6o4jrM4TsRLIxC+Ot
 HJpTLK4ON9SghxTa86ZtdcTXZx0xOupey0Hv22N/V1VZCm5caCWNVLdgf2Rmu5Cn
 pDuq5mE4mnLzxf6Vc8uiogna37n0rIQR/6WGZOHDPXMF2MCYOFC7+L9t8mqmrsQt
 9AN2oWpHTS8V342BzVER8nlLWamnZqKfs+dmJ7ZSw5SVHcVoJs5PpuVoFVBdvjlA
 Wee2hkY7E8d3TyRHnUcBonkyYsMBbfxRB481pus14u49r2OLxS2jE/z3oTcn+dx9
 g9DJfg==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com
 [209.85.219.71])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49qgdfyfwy-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Tue, 14 Oct 2025 07:48:44 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id
 6a1803df08f44-7f5798303b3so26504256d6.3
 for <dri-devel@lists.freedesktop.org>; Tue, 14 Oct 2025 00:48:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1760428123; x=1761032923;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=7lgQF7EpyJKKLU5XszH0WS1iI/dWpktDkSnmDk5Sjrk=;
 b=we0ry7EBql+XGEYu4wjSp01Cax0kQZ5tOjzNwNl825x8sk2nLqIgYcpdff23lHB1Ta
 e4wOKSETeDn/v+QqE3gbwLM1A3eih1ckkoKQrKFTupmDMuZzA+5vrEa8qQELFaK0izby
 f10cMyvoYQJCAfwRNXAzdAPEPlAWz+6WFsLRySwf+sRODmfclC5Sc1PPkmKaheimc50L
 S7iTwJRqcoUPx3pFpXnv+KzduNEf4EhLOXxIl3McgrjMUIffSl+l+bPHtZ2TcRwdyGPs
 Q7T/AUrVE7RGjFUny6Yqa6+pvoiZlMOwfAlTCnMsH9r4svDULxPfkhDTvdf7Q0HbEqF7
 Xygg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUuD56jpDt75kJC+oV5JrLqEPXGAyAHsVliu0ylZHo2oYhjnOxRA5rOz/bgeCidf7dzrJ/YXYeX2G0=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwYgWjSzRjC+dXLV0GvhKwymNOWTJUntxRaaXk2XRiStpU95m+Z
 fDSQWhhilyL/3G3e1DlqlZpK2uAoTD1CziKivsfT8PRr5bdF43J7oH8NZm37g/I1/ZGZclm5wZY
 t7aZS+3L2nDeKwe/7rfYixKxN8MPn+31uv9Rd6GqT/5PuYGegzFCft+xYganpM7lB6sXdNX0=
X-Gm-Gg: ASbGncsdre+ROuxEyCwGbFkyhvRXkBuJBWYXcIEw9yQC3E+6AnytuBM4LFtqgQ8yNOa
 A/Y6OxEfxkD/aH1/UzR3tsOVBgabRpuuARTT3r/Rs8ESVZP7r2c8VIY1A1c6g2m60JKwqGKyKlf
 784dje8iX6craWkb+tloVV5z7Wg3Wyi4YkrUtRlfUvQkJ1rlFcF6gxjeenG4Ea6KsfFCotUOfvN
 VQTpcuP7TcxQvb3f6LJc6gm3RB94571nR6/vw97zmKxkpDZ/suIVhDTkdfVTdPrgVqui17jO08D
 skKa5IIjIC4TcYvJdEloP0DP2p2G6rYISS19Z3ZFT6cGZpaACIPwYb5fOajZmAZgWbVMoX4fsHc
 mxLpYkGrRN7Jy2Z0v//JRJA==
X-Received: by 2002:a05:6214:1044:b0:87b:b675:c079 with SMTP id
 6a1803df08f44-87bb675c186mr138835296d6.3.1760428123402; 
 Tue, 14 Oct 2025 00:48:43 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGK/9FgHc+mDtU/vg1IM2MbqJ1IQXUDO73G3f7pDCJd158k+UkhB0NXrUrd+oKqvAQezTg7YA==
X-Received: by 2002:a05:6214:1044:b0:87b:b675:c079 with SMTP id
 6a1803df08f44-87bb675c186mr138835176d6.3.1760428122944; 
 Tue, 14 Oct 2025 00:48:42 -0700 (PDT)
Received: from [192.168.149.223] (078088045245.garwolin.vectranet.pl.
 [78.88.45.245]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-63a52b1de3esm10425328a12.18.2025.10.14.00.48.41
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 14 Oct 2025 00:48:42 -0700 (PDT)
Message-ID: <74703f5a-243f-44ae-bf74-ab5ddfb6f685@oss.qualcomm.com>
Date: Tue, 14 Oct 2025 09:48:40 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] accel/qaic: Add xbl_config image entry for AIC200
To: Carl Vanderlip <carl.vanderlip@oss.qualcomm.com>,
 Youssef Samir <youssef.abdulrahman@oss.qualcomm.com>,
 jeff.hugo@oss.qualcomm.com, troy.hanson@oss.qualcomm.com,
 zachary.mckevitt@oss.qualcomm.com
Cc: ogabbay@kernel.org, lizhi.hou@amd.com, karol.wachowski@linux.intel.com,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org
References: <20251007221528.561242-1-youssef.abdulrahman@oss.qualcomm.com>
 <c3339f06-aaca-490b-997c-8b6b145c93c8@oss.qualcomm.com>
 <148df7bd-6410-4814-94ef-0880b596f363@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <148df7bd-6410-4814-94ef-0880b596f363@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDExMDAyNSBTYWx0ZWRfXwRREtZXa0XYI
 HMNQaIRxjd9OItLDwbEyJ3ZH1TbPfu0KEOAaMDFz6xu7rlfhkLasUBdk+Koj88f/WEIShdf99RU
 7vG57rgGGApb8lfDHwLtD6UyaGEtp1au9+BrBicEk/NWs8k7fBQlwddR2yTH999yxeZ0TFwVuaY
 4lL4xIFcIfd1f/D65/Nn2d9YXpTmyzX9jo6KRRL7t2ze7mKaASy5UzK+KFA4k9gmfkQNjGM9Ozr
 +JaM2mNJLBr9klA/6MV9X0C1LWkhjFg5PAo3Yle0eomw+IpQQnPhdMW1HfKkSFMlOtnoVvdOH4r
 UeeD524KhNEZJ//Oir7haEjHqrmuS3knZura8hJAzWsh4TtrYygd6iJe80viGyZHjqfCLyimKh9
 D6ZL3RBv/BRlJ37ApExEqxouiRcw7A==
X-Proofpoint-GUID: H_uNbGzjAQ5re-YS5cvM_FN_htqQv4ww
X-Proofpoint-ORIG-GUID: H_uNbGzjAQ5re-YS5cvM_FN_htqQv4ww
X-Authority-Analysis: v=2.4 cv=J4ynLQnS c=1 sm=1 tr=0 ts=68ee005c cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=UH78s4YSuxq7AQNSmZkA:9 a=QEXdDO2ut3YA:10
 a=1HOtulTD9v-eNWfpl4qZ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-14_02,2025-10-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 lowpriorityscore=0 priorityscore=1501 adultscore=0
 bulkscore=0 suspectscore=0 clxscore=1015 phishscore=0 spamscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2510020000
 definitions=main-2510110025
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

On 10/14/25 1:47 AM, Carl Vanderlip wrote:
> On 10/8/2025 12:49 AM, Konrad Dybcio wrote:
>> On 10/8/25 12:15 AM, Youssef Samir wrote:
>>> From: Aswin Venkatesan <aswivenk@qti.qualcomm.com>
>>>
>>> Update the Sahara image table for the AIC200 to add an entry for xbl_config image at id 38.
>>>
>>> Signed-off-by: Aswin Venkatesan <aswivenk@qti.qualcomm.com>
>>> Signed-off-by: Youssef Samir <youssef.abdulrahman@oss.qualcomm.com>
>>> ---
>>>  drivers/accel/qaic/sahara.c | 1 +
>>>  1 file changed, 1 insertion(+)
>>>
>>> diff --git a/drivers/accel/qaic/sahara.c b/drivers/accel/qaic/sahara.c
>>> index 3ebcc1f7ff58..04e8acb94c04 100644
>>> --- a/drivers/accel/qaic/sahara.c
>>> +++ b/drivers/accel/qaic/sahara.c
>>> @@ -194,6 +194,7 @@ static const char * const aic200_image_table[] = {
>>>  	[23] = "qcom/aic200/aop.mbn",
>>>  	[32] = "qcom/aic200/tz.mbn",
>>>  	[33] = "qcom/aic200/hypvm.mbn",
>>> +	[38] = "qcom/aic200/xbl_config.elf",
>>
>> This is the third oneliner extending this array you sent within 24h,
>> please get the list of required files and update this list once and
>> for good
>>
>> Konrad
> 
> I wish it was that easy during bring-up.
> 
> These patches are being upstreamed from our internal branch and thus
> reflect the different latencies across the sub-teams to that request.

That's upstream-first-first ;)

I would assume there's a single list of files that get loaded, perhaps
within the device programmer image.. Unless you're altering that on the
fly as well?

Konrad

