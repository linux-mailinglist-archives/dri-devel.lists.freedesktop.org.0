Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 90A55C9A127
	for <lists+dri-devel@lfdr.de>; Tue, 02 Dec 2025 06:24:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A173D10E01F;
	Tue,  2 Dec 2025 05:24:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="f+nd2SlU";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="JkLUdmaK";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E9B1010E01F
 for <dri-devel@lists.freedesktop.org>; Tue,  2 Dec 2025 05:24:47 +0000 (UTC)
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 5B1MnmVN1906625
 for <dri-devel@lists.freedesktop.org>; Tue, 2 Dec 2025 05:24:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 oGOKj+IpPr9kgfuB7fmrBnwFZOVXU/LLUPAP6NBz7xI=; b=f+nd2SlUDZEDgRaR
 00ERgxCiuMZwjsO6DAJb7YRkC6HBC2KpekRIPXXvqIL1RFqxP+uMLENChio3Rr6V
 3DKkBOC8kiaHYyGc0svmUwwv0ZdVb/4DRYWtfXLotc6Li17mqyp5BikIJ74TWyRd
 AVutewBV6w0gKdu1rxfpmeUD35D2H0jHUqqnD6zVz0xLfyvunX3cchi1lNDiD5Cx
 +2uRbbFKX++EjoaF10y1XHCUjy8iEbA/gunChA46bwQ6/XGWjsin4vN5HshhXUtu
 4EVi4Hj2ywvl+kIGLKN360NcjWSWoeIEbjJGyz/GUl6Qxh7gQi0adaXLoJPsYQyr
 7hJ0lg==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com
 [209.85.214.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4asm5e0vcr-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Tue, 02 Dec 2025 05:24:46 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id
 d9443c01a7336-2954d676f9dso35779235ad.0
 for <dri-devel@lists.freedesktop.org>; Mon, 01 Dec 2025 21:24:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1764653086; x=1765257886;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=oGOKj+IpPr9kgfuB7fmrBnwFZOVXU/LLUPAP6NBz7xI=;
 b=JkLUdmaKW84Yesm5qOXEos1wkgVfWooAM+AmTNMneqf1/YWNscBdMF88SM6uVaCww8
 SvwQlBSfOxVht2F/9CFCS9ZKR+eCS4nts1kjiK8JZvrU5RA99xFCvkoOoliZVe0ORMDw
 jEbMLzP89Fsjxn3fB6b5TjyJvgsphEAmy90EV59WqlwztGENpHArJo5lMGyMUP7RwU27
 FUZaPnaq+d1CcBwYg38HI6kpX+CXlFPeoWMG11V2EDdSdhvpR01MtOOK7etDZvLJZpac
 v0ofiQgaf3q1357oVezzeTsP1Au4/a71LPD7GeLbdI3ydRCUbuHNOvd736yjmUijNP5f
 pcMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1764653086; x=1765257886;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=oGOKj+IpPr9kgfuB7fmrBnwFZOVXU/LLUPAP6NBz7xI=;
 b=dSotov6EQLh66PcXxHfChhZ0U8EA76Fn8yW9fp7zZgogeSmAnFUA7oOEO4RhS66gUv
 rVB36qGJ+CXgzRl6q5BIp7Zx4Wh6TMcf/69x05s7NrT/KHzb9u+Ibrj2UaYShwk3Qfhk
 3pI3ICq1hWly4/sZZ6oQqxiymn3ij0uFwFMkz3khJEcwd4R2voS0TkBWgu2xUUpNs1UZ
 JP5QLOafaWlbrsexLy/S//C+rba5DxQk9czkdylnetDSiG0v0C1ZXHxog6AKAodbJApo
 +6Dc6VGtN3uZYt7bIT2+o5LIWQCa4TujC9eBTRViST1ZY3Lk9FflV31DrroNRVa3n1LB
 d9Bg==
X-Forwarded-Encrypted: i=1;
 AJvYcCWhPwGNyzYUtZxBHjs3eUTrnHzwKkLxj/2SiRgEpcetxK6p27cpPXDVrxTyB1Hlf+rEgeoGtfTflLs=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwDZx5NP2XJhJrFqE3G//EKgGPmUiZtlQk/zchXOcZw0HDRml08
 tGpIRF4oxQ8MAs+kQTdmRlWwQn55bPwwec6jSgyrQ4/2VCmAT0KZd2ai4FJIjzHLgOAIeu+aaS6
 /8WIlO58tewd6frxv0CBslSjEf6BANk71d0u0vTQKPTbx+0/5x9nqhXRcMk58RYITDMFyh4A=
X-Gm-Gg: ASbGncv13OijHhuRFWPFNM/DH3gBZHv2utiDSkAFYcOBHWSKHPRFMMPYJKiGFC+AnH/
 7EUMukYX0l5P3trC1UfQPv6t1wUrMoapz/RrqAdB3NTuHdUVIIUbdlTeQIvm1RdlXN3OnyGay8v
 EoKLVYp/PHRViXxR/lgKakA3yE36+YUDQfbRFLi3PNE9wn1Jx1tkguZGjvO1/qIcJpHJnClSxKH
 o/1IYLrQ0+YDIStNDTNNU1VQKm8zPNjjHSCMpDv9q/UOCIRksBAPH89MRaxQ5Vn/0pABdegUptE
 KEx1f+KY8nVak6cJ/L3fnRNxb0T0gKuSNG7S833wHg7XsdhG6OvRRxrIGwFFDrOniMhffXUIZLh
 P1o1rJB5RRqwKngw+M7uw8jW+t/ZZ0o0SXyJaUJ+0
X-Received: by 2002:a17:903:4b47:b0:295:738f:73fe with SMTP id
 d9443c01a7336-29bab167de2mr339040195ad.30.1764653085782; 
 Mon, 01 Dec 2025 21:24:45 -0800 (PST)
X-Google-Smtp-Source: AGHT+IG2u+kk0lx9QjdKmPw63AUmE+//BtRpagGxZVyUTpm7aV61e0ljRt/FouY6IS9t2SvBQ9OMvg==
X-Received: by 2002:a17:903:4b47:b0:295:738f:73fe with SMTP id
 d9443c01a7336-29bab167de2mr339039935ad.30.1764653085233; 
 Mon, 01 Dec 2025 21:24:45 -0800 (PST)
Received: from [10.206.107.125] ([202.46.23.25])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-29bce2e676esm138657005ad.0.2025.12.01.21.24.42
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 01 Dec 2025 21:24:44 -0800 (PST)
Message-ID: <dcf552d6-dc1e-493d-9039-b7531ebb6a7f@oss.qualcomm.com>
Date: Tue, 2 Dec 2025 10:54:40 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 3/4] misc: fastrpc: Expand context ID mask for DSP
 polling mode support
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, srini@kernel.org,
 linux-arm-msm@vger.kernel.org
Cc: gregkh@linuxfoundation.org, quic_bkumar@quicinc.com,
 linux-kernel@vger.kernel.org, quic_chennak@quicinc.com,
 dri-devel@lists.freedesktop.org, arnd@arndb.de,
 dmitry.baryshkov@oss.qualcomm.com
References: <20251128050534.437755-1-ekansh.gupta@oss.qualcomm.com>
 <20251128050534.437755-4-ekansh.gupta@oss.qualcomm.com>
 <60fe241d-276f-489e-9c74-677dd154b454@oss.qualcomm.com>
Content-Language: en-US
From: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
In-Reply-To: <60fe241d-276f-489e-9c74-677dd154b454@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjAyMDA0MCBTYWx0ZWRfXxrTsc8jTADZm
 btXo6lqjGZCTYI0hH+pqOGwtu2cLbhfeeHXe6l2lHyW+d/qNshu/KUt+qrGhDsznURlhmPkurTt
 4MO3xGtpOm9WYmVqk+52Rz1daVM5mgTAqhxb10qA+S3E6mYJ7VfEZr5URX3mAozYWtbQV2sfzlQ
 he2vZiRxpZj3ZHmBOQRj8JYHopsaU6DWQlBHjV5ZngFFF8q7xezYOXW+Lf/0CA8Q3GZnlT3aEYT
 OMyMFS7D0k2FHQF90hxM2vsDo0dRFcKbN6Un8Z9VKwNdSNXUx6YkA+IUUHLFCr4lZyBc/735w03
 khXLjk321T9P2rCHD3QRvLtNVePkNDnpFsZKsUCJXL2TX4bAt6djpbk4GkEHUlc4XGO11dE4++D
 B8GePVnYpgEADEP8jVHpGNmEMit2Dw==
X-Proofpoint-GUID: B48OTxOQSKwsk1TCpYLTY_SF0IHYlS7j
X-Proofpoint-ORIG-GUID: B48OTxOQSKwsk1TCpYLTY_SF0IHYlS7j
X-Authority-Analysis: v=2.4 cv=bcxmkePB c=1 sm=1 tr=0 ts=692e781e cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=fmXLCqvIAgF-KMdjZlUA:9 a=QEXdDO2ut3YA:10
 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-28_08,2025-11-27_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 bulkscore=0 impostorscore=0 priorityscore=1501 adultscore=0
 phishscore=0 lowpriorityscore=0 spamscore=0 suspectscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2512020040
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



On 11/28/2025 5:21 PM, Konrad Dybcio wrote:
> On 11/28/25 6:05 AM, Ekansh Gupta wrote:
>> Current FastRPC message context uses a 12-bit mask where the upper
>> 8 bits represent the context ID from idr_alloc_cyclic and the lower
>> 4 bits represent the PD type.
> <newline>
>
>> This layout works for normal FastRPC
>> calls but fails for polling mode because DSP expects a 16-bit context
>> with an additional async mode bit. 
> <newline>
>
>> To enable polling mode support
>> from DSP(DSP writes to poll memory), DSP expects a 16-bit context
>> where the upper 8 bits are context ID, the lower 4 bits are PD type
>> and the 5th bit from the end denotes async mode(not yet upstreamed).
> <newline>
Ack.
>
> so we get
>
> 1
> 5	       0
> CCCCCCCCxxxAPPPP
>
> where C is context ID, A is is_async, and P is PD type
>
> are the x bits reserved, or do they serve some purpose?
x bits are reserved.
>
>> If this bit is set, DSP disables polling. With the current design,
>> odd context IDs set this bit, causing DSP to skip poll memory updates.
> <newline>
>
>> Update the context mask to ensure a hole which won't get populated,
> "to avoid erroneously setting that bit"
Ack.
>
>> ensuring polling mode works as expected. This is not a bug and the
>> change is added to support polling mode.
> I think the main question that remains unanswered here is that you alter
> the non-polling mode mask to become compliant with what polling-mode
> expects.
>
> Is that intended? Will this still work fine without patch 4 and the
> new FASTRPC_IOCTL_SET_OPTION?
Things works fine with or without patch 4. Patch 4 is needed only to
enable polling mode option.

I'll rephrase the commit text to include this information as well.

//Ekansh
>
> Konrad

