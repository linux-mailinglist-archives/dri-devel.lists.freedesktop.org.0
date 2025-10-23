Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D71CEBFFF34
	for <lists+dri-devel@lfdr.de>; Thu, 23 Oct 2025 10:35:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DB1E110E8D4;
	Thu, 23 Oct 2025 08:35:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="BOKFdwmp";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 57B7B10E8D4
 for <dri-devel@lists.freedesktop.org>; Thu, 23 Oct 2025 08:35:49 +0000 (UTC)
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59N7E0H3023034
 for <dri-devel@lists.freedesktop.org>; Thu, 23 Oct 2025 08:35:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 LCyk7hNB1J09n2mOoRdLCnMNhi+K220v852ILW4KCJc=; b=BOKFdwmpp2fVKu0l
 N0CmXfulyJdI/eBBugnP65Gtnd/NMfWQx+FMoT87VuMvnfNddIaGbkj2UrPqX+w8
 b78a82RgO+0sZUR+lHkuNygiZyR8cVccxIozJDPDsoSS+kkl/sxFZA0/8wBWoMBp
 2eXGY2o0e55SqetS+ih6PJCQ4AHNwhIV3Z5uOpOiLOdMmysD/JG8IgQXZOeQfcYQ
 5DKtOVsP8wbVOzAprlZovoHlOdvYd9+PQ6d1+De3rRJNwYKLGBieVnQzR8UBUaID
 FY/+7tdQ8CWR6SbLh0dpH41Hb1OcppsNb72tjWKoxtE7z+40f5hf+baWTih18qHx
 0KvvUA==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com
 [209.85.214.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49v1w87n7n-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Thu, 23 Oct 2025 08:35:48 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id
 d9443c01a7336-27eca7298d9so15412895ad.0
 for <dri-devel@lists.freedesktop.org>; Thu, 23 Oct 2025 01:35:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1761208546; x=1761813346;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=LCyk7hNB1J09n2mOoRdLCnMNhi+K220v852ILW4KCJc=;
 b=af4NTdacohP8ZhxWST0TefQGOfdIksv4cA1rJqZlDfY8zn0A1JPy5glSl225SUWQ0t
 xlsmksXaGPs1gzURWONHqKhFfOUPhw3rgMDTmHabRXHRjcYwsye+tNMtJUhYD0CrpEmB
 VbCyuLBhufxMuY7G4wVIktK8obH3lmY1TKjT6M8DbMGO4hURYQQQsgGrDKhP/ZDBuh5N
 BWCidZ2Uoc8BofSk0Fi75tRs53dN3z3dQl+9UyrZaHT+mSfG0ODC+gtGHSYz6j1AWZjV
 Zl1ZnqEqqD8by2g/Vdiv/EsZhFrnnEzIc4dUx+atSLJzF77T42M8AK1s54vkLSI0fe1u
 7BSg==
X-Forwarded-Encrypted: i=1;
 AJvYcCV8v6VgNFbM0N+XL7iuuNlLPDaxR/S6/DUkOyaXZ13rfOaw3/opwXqCXPoMGFNJqnTNBvzh6+Gj6v0=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyzmuKaPhgvwpDk044E2Y1zq/lAck4oACibf/jHpgIpmkO/lAg9
 1xY36EZ9YF7fhr5w/mmBWAmQjSVCy1znVvOh8ZW4dJNNfYqnk4OuYQvhDbC1x6t8dK4mEOQ64j8
 iSEVn60HeAaMjm4xvcylJpYop46pmxxb4x/2A0Ghuqb+xtMVWIAN2Omim8qP3/kuwoBMYRYU=
X-Gm-Gg: ASbGnctASagGXSjQndYD8S3c8cwtJn3pMus17K7cANugjgrDCBaN1p+PYkBO081Mjwp
 /V8JF52K9gJNO+rht+q2Myv81A5GT/aTZNy1ZIrz2pSzUWpnhcoXrTA6+lW7twA6liNCNycNtf7
 bliU6vkPDiwYtI7kQ7yNWP/iG76zqLVW5ITvSfC3letgakWcBkP32ZXnDnkeiFz1ax8TR9FSCu2
 yWG2DLkaGytecCGgzKkJlscBNhagk9QvhixhxEd8OvuFgyjx+WcoLQrhS2J83CN9omGUo/zlMCZ
 d8XoBGZRarWiiD+u2GYPuLtnImMlrAWVTeIrqPUZAAzpIjjV64eJgT3IsDmaQf0u6qaMtbBG2fF
 6L5vBko/vk5sWZevBfiUKDAe1DBAgEsA=
X-Received: by 2002:a17:902:dac2:b0:269:8f2e:e38 with SMTP id
 d9443c01a7336-290c9cf97b1mr286140515ad.6.1761208545702; 
 Thu, 23 Oct 2025 01:35:45 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGfmtH7W7Rcd+PsGcEWkEwyiE1ex2CnHHoTYcplW882/icjOQlxkppW8FqSKUpD2rm3Jy5Mxg==
X-Received: by 2002:a17:902:dac2:b0:269:8f2e:e38 with SMTP id
 d9443c01a7336-290c9cf97b1mr286140165ad.6.1761208545219; 
 Thu, 23 Oct 2025 01:35:45 -0700 (PDT)
Received: from [10.204.86.125] ([202.46.23.25])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2946de1a6e3sm15703915ad.52.2025.10.23.01.35.40
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 23 Oct 2025 01:35:44 -0700 (PDT)
Message-ID: <b3e905af-639a-4390-8fb7-50a947bf4fcf@oss.qualcomm.com>
Date: Thu, 23 Oct 2025 14:05:39 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/3] misc: fastrpc: Add support for new DSP IOVA
 formatting
To: Krzysztof Kozlowski <krzk@kernel.org>, kpallavi@qti.qualcomm.com,
 srini@kernel.org, amahesh@qti.qualcomm.com, arnd@arndb.de,
 gregkh@linuxfoundation.org
Cc: quic_bkumar@quicinc.com, ekansh.gupta@oss.qualcomm.com,
 linux-kernel@vger.kernel.org, quic_chennak@quicinc.com,
 dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
 jingyi.wang@oss.qualcomm.com, aiqun.yu@oss.qualcomm.com,
 ktadakam@qti.qualcomm.com
References: <20251015045702.3022060-1-kumari.pallavi@oss.qualcomm.com>
 <20251015045702.3022060-3-kumari.pallavi@oss.qualcomm.com>
 <14213195-29fa-48d9-8fc4-ccdc9b6f7ecc@kernel.org>
Content-Language: en-US
From: Kumari Pallavi <kumari.pallavi@oss.qualcomm.com>
In-Reply-To: <14213195-29fa-48d9-8fc4-ccdc9b6f7ecc@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDE4MDAxNSBTYWx0ZWRfXzGSBTETtrff8
 YW02jfnY3w7vg3BMOQs9rlEZY0C6ojlO/F3qudJWP+uKn77r6KAIvD+GEwZ0UuLynX4kjTv2wKo
 ogqhA3ptp+rh1GqCKUh5IkLm2SvbYQFHB/DlvpG9V6+Z66invKACmfSnebCgyxqw66AHKMRpeG6
 Mqg1tGXEOPaLnyFwyP5lXEzxIb/qdct/9SU0ZPn/XISINpLXyf1fy1qvxspFgq+nuNTNqjk/fN+
 SYoz1DmswauIdZXHWQod+B2PEOPYwpeYqwxIc9fxQgzWXmInf1Tu3shOCSixGPIbcprmSELokQj
 Ok0zNKq/jBzj4Ql8/apNzn1VeWC4QL7LHpWv76rLNfueLpRn/L7XUH+sftmdC3OntgjPEcUMHAH
 KD8hU8rcc8PM/89vgMQc7C7ho+PW6g==
X-Authority-Analysis: v=2.4 cv=bNUb4f+Z c=1 sm=1 tr=0 ts=68f9e8e4 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=VwQbUJbxAAAA:8 a=TfANz5PKPoX1PYxfYcwA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-GUID: 6nW9dlk6Gl2pGVR618q2yv7go_yNEE04
X-Proofpoint-ORIG-GUID: 6nW9dlk6Gl2pGVR618q2yv7go_yNEE04
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-22_08,2025-10-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 phishscore=0 malwarescore=0 lowpriorityscore=0 clxscore=1015
 priorityscore=1501 suspectscore=0 adultscore=0 spamscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2510020000 definitions=main-2510180015
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



On 10/18/2025 10:54 PM, Krzysztof Kozlowski wrote:
> On 15/10/2025 06:57, Kumari Pallavi wrote:
>>   static int fastrpc_rpmsg_probe(struct rpmsg_device *rpdev)
>>   {
>>   	struct device *rdev = &rpdev->dev;
>> @@ -2291,6 +2319,22 @@ static int fastrpc_rpmsg_probe(struct rpmsg_device *rpdev)
>>   	const char *domain;
>>   	bool secure_dsp;
>>   	unsigned int vmids[FASTRPC_MAX_VMIDS];
>> +	struct device_node *root;
>> +	const struct of_device_id *match;
>> +	const struct fastrpc_soc_data *soc_data = NULL;
>> +
>> +	root = of_find_node_by_path("/");
>> +	if (!root)
>> +		return -ENODEV;
>> +
>> +	match = of_match_node(qcom_soc_match_table, root);
> 
> This is really odd way of doing things. You want to check machine, not
> some node. Use proper API for that.
> 
> OTOH, I don't understand why you are checking machine in the first
> place. If your device is different, then please follow writing bindings
> - it explains exactly this case here.
> 

On the Kaanapali SoC, enabling ADSP and CDSP functionality requires new 
DSP IOVA formatting and hardware-specific configuration. Going forward, 
SoC will support the updated IOVA format.
To handle this, we referred to the implementation in
https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/tree/drivers/soc/qcom/qcom_pd_mapper.c, 
which aligns well with the requirements and serves as a suitable 
reference for our use case.
If there are alternative approaches or suggestions for handling this 
more effectively, we’re happy to discuss and consider them.

>> +	of_node_put(root);
>> +	if (!match || !match->data) {
>> +		 soc_data = &default_soc_data;
>> +		 dev_dbg(rdev, "no compatible SoC found at root node\n");
>> +	} else {
>> +		 soc_data = match->data;
>> +	}
>>   
> 
> 
> Best regards,
> Krzysztof


Thanks,
Pallavi
