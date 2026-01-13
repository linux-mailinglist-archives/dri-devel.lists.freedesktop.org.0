Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 04475D19F1E
	for <lists+dri-devel@lfdr.de>; Tue, 13 Jan 2026 16:36:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EC1CD10E4FF;
	Tue, 13 Jan 2026 15:36:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="HVAg5nl8";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="eyAuL6Xj";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 478FB10E4FF
 for <dri-devel@lists.freedesktop.org>; Tue, 13 Jan 2026 15:36:26 +0000 (UTC)
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 60DBsvSW3810617
 for <dri-devel@lists.freedesktop.org>; Tue, 13 Jan 2026 15:36:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 EZ2/IbZkEd6N3FMPn0lY4+x3iY0Qz+kyyjWVOoANMOA=; b=HVAg5nl8cM8zVS55
 yzTwaJZofsza0OYMHTHTAKvCUU8PwAc/De1TvXO1ZmV9nkOPOSeTH6bMSxP7H2WJ
 o7D1DcsNroLmWfv7RdYZPOHZCynwKsBEpO+Gs8u1DnP9h093OA4GGM4I2gWtjt0p
 sUvkKsgalPsVQG1miyVlGLl25lFud7Ow2y+TJxrg67b5CrMM56JF+6gTMtUxCoJu
 rqypROXHFElreUUe1o7jip78/+JEhWI8Wi60Zii/nXcHaSW+iZaTaQfi/XcrVrCC
 BLTd926XILVDqK75JciZnD+k5DReXMxXhj51ndYCIQgqCCbaLsjS3EeqK8YruFz4
 lJ4vCA==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com
 [209.85.222.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bng55svvc-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Tue, 13 Jan 2026 15:36:25 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id
 af79cd13be357-8b2ea2b51cfso172639385a.0
 for <dri-devel@lists.freedesktop.org>; Tue, 13 Jan 2026 07:36:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1768318585; x=1768923385;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=EZ2/IbZkEd6N3FMPn0lY4+x3iY0Qz+kyyjWVOoANMOA=;
 b=eyAuL6XjVH5cdIb2fnUQhKhYK00iaL5b8M6SEGe5Zq0nRVM7gT22wEIm6DhfmPoTS+
 GQ0+rB4f7jexkCrBTxc3epFVIlonCeiCsgus1eHd/2HWtLkUCgxjjSKiHqDZkSxMGR9o
 HqWOO3RQgN2T1DL5cm7vgEoaL1O9jwL3TdL1Ht5A8VYQ5VgPLJR2UyTopBFySVvK7u+g
 lPSdRSbfasFLPWxYLGzOg5m9VhcUs+uojjREXNgsihBLI3Bs2wCCziYAsW7CTXXu73H8
 WByW0WNzJpmCvwBjNljdvVy1/qQxRj9I4MgPf7HHzOjpcdNLeQni9ltv/qvaqz2xcyiy
 bZ/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1768318585; x=1768923385;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=EZ2/IbZkEd6N3FMPn0lY4+x3iY0Qz+kyyjWVOoANMOA=;
 b=k004hcFSDknbeVa6IYCJbPX/s/YJSpveqZxAb/JxWUIISmw8CeBde3Yh/NZz5WUWUc
 tliHKUjYGRReAEchbPwWVl2iueGpWHK0A3U1o3zwThP3V/J6gDuE/+8/AXwu+GzlPI8C
 Lawvw4Xa3IJCnKyO+sTEt3fdxHf5aEixmidMDbN4JuHXbaMzRe+ZTbPkErWwQhcF+KM3
 b5qRD29CqgKFlckMTY0f4GJFk85YqlH67YvzyULyI5U5nlgP5sc2gD3P6eD6mjTFrGXJ
 csxxbfIzt9OPlrT+qLQaMSdhKXFbeLj7o4Auc1ss1Wsbss0u0jzofkiC4yOrbvxffvzl
 4S9g==
X-Forwarded-Encrypted: i=1;
 AJvYcCUSOd4MLSlBqIqUHuWfrg/AHahh/an2/E+fJDtx+6ZslNTrDcs33gOQAzgucct/j7Y0sJtX7CAI57I=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwcNH553sASgwo8T2PJEuG+PDoEAUH8boe0WpySYUMbR4WXy7Va
 PfXFrw3/Zjg1xCbA9XRBjcmcSuRJJRnebpMzIqEk7YKWIGV1lktFssLigZK6DkVW4r5yih51DSN
 jvne+s2FTELtRjpOL8hQW+Ow34+WF7hb8hZzyCjeL8KtSmeNlIGMKac+4VISSOubx1cLwW8M=
X-Gm-Gg: AY/fxX7yMHiWKiR/b1smoZyyCfz6aAcBV9uL3auYMCPGyvhz+YsTPm8Aas4erwNcN3k
 ynB6AXdzGzfdLAhAxSOGdMPGcRB5buJUzEy8IticigAcz9fZjBhXsOeqSEUTLaiGM7op/8IZzHA
 t6C2gxesGpCl7m9WIkyjGmYzDZttjZUxs3/hAZZexPpYhDkT0KFA+yn3RFL0VxmDaZ/sv5uBLwi
 1cmZTmq8hUwxubD9+sbB20RD0Pc0LYLDw6OUqiMGIBB6kSiPWx7WF0Nl4y284XfM31PnVD0y/az
 vvWPrQCVRS9F3LXBrDJdrdb1iWJt4c1e+x3DuWLgHUMnUo2I13YXA1QFyOBROSibv4BM5nL+/xV
 NcrfMQ0Sb3V5PLJz0BOzcsc8McrYexZyg/A4KlEaRU2GarolROo5nfQWF16++E+UYGFE=
X-Received: by 2002:a05:620a:1794:b0:89f:63e7:b085 with SMTP id
 af79cd13be357-8c389410364mr2118450185a.10.1768318584809; 
 Tue, 13 Jan 2026 07:36:24 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEMLwqRlVP/7fKfi+RZDpnX5OZ7Qgk9Q1gQb/STq85+GeJMS+CL71WIBqS8kpTydKMXpn6Oqw==
X-Received: by 2002:a05:620a:1794:b0:89f:63e7:b085 with SMTP id
 af79cd13be357-8c389410364mr2118445685a.10.1768318584257; 
 Tue, 13 Jan 2026 07:36:24 -0800 (PST)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl.
 [78.88.45.245]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b870889ac26sm819561366b.28.2026.01.13.07.36.21
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 13 Jan 2026 07:36:23 -0800 (PST)
Message-ID: <40193ace-36b9-4e05-83b3-9539534bb1ac@oss.qualcomm.com>
Date: Tue, 13 Jan 2026 16:36:20 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/3] soc: qcom: ubwc: Get HBB from SMEM
To: Bjorn Andersson <andersson@kernel.org>,
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Konrad Dybcio <konradybcio@kernel.org>, Kees Cook <kees@kernel.org>,
 "Gustavo A. R. Silva" <gustavoars@kernel.org>,
 Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
 Akhil P Oommen <akhilpo@oss.qualcomm.com>,
 Dmitry Baryshkov <lumag@kernel.org>, Abhinav Kumar
 <abhinav.kumar@linux.dev>, Jessica Zhang <jesszhan0024@gmail.com>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 linux-hardening@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org
References: <20260108-topic-smem_dramc-v3-0-6b64df58a017@oss.qualcomm.com>
 <20260108-topic-smem_dramc-v3-2-6b64df58a017@oss.qualcomm.com>
 <you4xijwc5g4ngcnhxm4ecn7opexnsdfayvd5wiiqpl7734r7w@bdkpjqmlzxre>
 <b2pqfrs2ptaoxxeanzumxyibmydsoiqslcsg6yrm4hihynowj4@mzazqnrptnyf>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <b2pqfrs2ptaoxxeanzumxyibmydsoiqslcsg6yrm4hihynowj4@mzazqnrptnyf>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: WQdMeMn7WMQRXc74lXYoA_AzJacEHF2c
X-Proofpoint-ORIG-GUID: WQdMeMn7WMQRXc74lXYoA_AzJacEHF2c
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTEzMDEzMCBTYWx0ZWRfXzoJLNHjrMXPE
 iZGoUXasty1MBwwo3kEhIOpzq2WIa57TM13UCNt4iGe5r56YOXYnIjVNKgJdDB5czT2RBsGB/uw
 gGk4g6JMroRnDPGotTuQ81FOIBBpOrN2f8b0tCPOEkvmC0EgaLhwGrbxcZPXcgEBgAHwomdgj2y
 n/5U1dEGYPnotfpEVD4A/QjDzVM7Xk2liBDU5l4atDG/d1AeULZ4SWZ9fMcGEw7LgDrj2cXpAeH
 EJ51NwYukw3VI3s6V+nmAvldRyTCwpw5wCPDPjPiqacfhUsxH6fUH7PKC6cJUda0is5hZGt11il
 Tr1ghqryKXMm8M03QTKHGqA+37tzCTz+yH4KA1h52aPu99Xu7el2sThDyW/9JaB/CIEkiHxXZhP
 QQzCvncR7/ZfpaJ8DaFsmEL/DUnd/xwZdmSYu7pD4QTKlxYtojrP9C6kvxDGzEXMqTf9TqF5ULR
 U78t3KVw55w9IdkYdCw==
X-Authority-Analysis: v=2.4 cv=IIsPywvG c=1 sm=1 tr=0 ts=69666679 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=egEcnhzrLz9U2KnhiLcA:9
 a=QEXdDO2ut3YA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-13_03,2026-01-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 malwarescore=0 adultscore=0 clxscore=1015 bulkscore=0
 phishscore=0 priorityscore=1501 suspectscore=0 spamscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601130130
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

On 1/8/26 6:49 PM, Bjorn Andersson wrote:
> On Thu, Jan 08, 2026 at 04:45:49PM +0200, Dmitry Baryshkov wrote:
>> On Thu, Jan 08, 2026 at 03:21:51PM +0100, Konrad Dybcio wrote:
>>> From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
>>>
>>> To make sure the correct settings for a given DRAM configuration get
>>> applied, attempt to retrieve that data from SMEM (which happens to be
>>> what the BSP kernel does, albeit with through convoluted means of the
>>> bootloader altering the DT with this data).
>>>
>>> Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
>>>
>>> ---
>>> I'm not sure about this approach - perhaps a global variable storing
>>> the selected config, which would then be non-const would be better?
>>
>> I'd prefer if const data was const, split HBB to a separate API.
>>
> 
> I agree, but I'd prefer to avoid a separate API for it.
> 
> Instead I'd like to either return the struct by value (after updating
> the hbb), but we then loose the ability to return errors, or by changing
> the signature to:
> 
> int qcom_ubwc_config_get_data(struct qcom_ubwc_cfg_data *data)
> 
> This costs us an additional 16 bytes in each client (as the pointer is
> replaced with the data), but I think it's a cleaner API.

I don't see how that's much better than

static const qcom_ubwc_cfg_data foobar_ubwc_data = {
	...
};

static qcom_ubwc_cfg __data;
const struct qcom_ubwc_cfg_data *qcom_ubwc_config_get_data(void)
{
	...

	if (__data)
		return data;

	__data = of_machine_get_match_data()
	...

	hbb = ...;

	__data->hbb = hbb;

	return data; //still returns a constptr
}

Since we essentially do the same thing, except we save space and rest
assured the various client drivers don't mess with the data they receive

Konrad
