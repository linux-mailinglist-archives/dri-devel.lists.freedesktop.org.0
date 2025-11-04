Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BBB30C327F0
	for <lists+dri-devel@lfdr.de>; Tue, 04 Nov 2025 19:01:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E0A4C10E2A7;
	Tue,  4 Nov 2025 18:01:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="FGhEO709";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="cqA0Lv++";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9955E10E2B2
 for <dri-devel@lists.freedesktop.org>; Tue,  4 Nov 2025 18:01:10 +0000 (UTC)
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 5A4GgVJS2441908
 for <dri-devel@lists.freedesktop.org>; Tue, 4 Nov 2025 18:01:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 62pxMELWDAsKAfPNLhqLMVBmVN0ymcdnSZ8wuYDyxfA=; b=FGhEO709SinN5yzS
 KHgtyx61p09qMiuovNtCq5NHTccSd+yFfRAOyhky6zL9qm6c/JWuklE1yKECOrin
 hmJo0V9J6Zps4rGM7BkD3XyeMVZlSQAXbLHcz4FVXRJuz0t7Q7L7wYhGb5rbgMUm
 mk9b9D8Bbd0/gvmpsj/V2EA+qYaUq5gpQuStWmCFWsR42YKb7yojF4f/OySKbyrT
 k1EohjvJEJLQELr/YXDpBdm6s662xrYXeLbBvuKDQPWwkPNXB8Xb7g8QPsyfnVdo
 DdC2ndmbVYKd1T6vIO3EbF4IseeMBIoK/SQ/6WXBSmh+59/FL4gDsQiBeNecOjIU
 wdm2sg==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com
 [209.85.210.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4a7me5reet-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Tue, 04 Nov 2025 18:01:09 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id
 d2e1a72fcca58-76e2ea9366aso5579770b3a.2
 for <dri-devel@lists.freedesktop.org>; Tue, 04 Nov 2025 10:01:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1762279269; x=1762884069;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=62pxMELWDAsKAfPNLhqLMVBmVN0ymcdnSZ8wuYDyxfA=;
 b=cqA0Lv++Tw4fYED/dKtsHW27fLzwW2LdkL1VcadN5Vwi+HZvITm8CT1ietZaliedYl
 lSvdmhaP4EWEquR2nHbRUFc49z0ESIcmaL3ZN4bM5fjZiB+ui7yMcb83uWKw3Qpa5c5S
 6biYKcZHKA9I2JObDTyIcRp2+XCnPBbRqFsWq0H/HrSqSWs2OGTlYL41EoxInsymtaZF
 oVmoLLAMJ7UpZAewLg/3mapVFdmNp4gVf2mfkhyDRScqAP9SidniJipovFMzSDA55boQ
 dcpQnhczk/nnoBqT8WhvR9OdBZ5gfFz3bBRY61MRNgpncO6QlBgmAuugyPbVMu4vl/JY
 sLSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1762279269; x=1762884069;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=62pxMELWDAsKAfPNLhqLMVBmVN0ymcdnSZ8wuYDyxfA=;
 b=i2458uLk5N4f9zFrZrLpe7TujimZXWojGq37IUBggZjxQqb5UXp5M3W6cMy90jTXBE
 E6XNr/Gx1pZX0RxsAr2Xv0IjwfX/CDrPvEuZcpa1UWnicfupG3T87xgWTDJdMlNVRtPE
 1Q394mYXPEQVatr0wbJnehO2ER4zZM4vGHCFZXsAWms+6DG3yo7lln6z2rD+gAPA6GOE
 qo17zcdMrpRpbJgh+Z47897k7gOoTcdTwDrxlAm6atAJNw5nZCs27t+Ti7fuhXvCcp7R
 j5TCe2AciJyCrxPYIVDgRbi5cHtBlbhbEeIzdsFgYPQiPoAuEZwu8L4S5En1cg90ohet
 a4zw==
X-Forwarded-Encrypted: i=1;
 AJvYcCX2p3Jua5iUXMk8iSUW28TB2QUdLIAlSoVsiifnDThOUPwENJWolr1KddLjCBPJh1kc3GEQsECifVM=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yx1pXwg1/DN8LuRoAG8iKj+fiCj24anzLIaLiSpPNg0+v6hO9Kt
 Ug5FHEtBrOD5XyjF5y5oDyYXjLITuE7Uy0xKpxemGERQnEvBjjxX7gaR3jEsOI30NfqqaBFi/dS
 Nhmg60vEpjYtb7utMnSfcMmCLTfVBmeT0nvVirKLErSdztmRohB+/v5d4ESUcRQBVqSaRuPI=
X-Gm-Gg: ASbGncvn3DUzvpTBAgABbiE7bT1Zk8YZichx/8Hx+ECkGHSl4guBXczDNfbbSb/I1YV
 4BIF72BQaM/0ZC+lXG378Ns6qjlGPRel80aL2DkP+LMkCuvQFQOusuhrghOi+3v1b5mLJYMkMxK
 hZIbKKnLWbiKlI9Css/lRekqcsQYa8wp1j3/ri63MGBEXSGUdRUcRmLsggv02d/PiLzw0+Akspc
 nNa/W6qjTUakLBXi1PJengM6DTQIexi1ljUly82Woy5aiisK/eFZwaCejZuoj8APPop4vTfzblj
 lNBp7vtni+5WbeifRHZ3jKJt17Byuu04x7ioRW5Nm567W81gf+oRx3F9ncpQ+GuSjd72YK64IMH
 GmZ44hH98bcRAKQrOGK28KOPTxku0kFhWQEptykTzkkzuxtwILqFA
X-Received: by 2002:a05:6a00:1496:b0:781:556:f33 with SMTP id
 d2e1a72fcca58-7ae1cb64038mr237853b3a.5.1762279268811; 
 Tue, 04 Nov 2025 10:01:08 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFE9tugqN30bxmhx6FvT8pRNO4wEnXJbc3gujzL9VkJySc9thcO6lhWATMfnEzHJ9Ljz5Vt+g==
X-Received: by 2002:a05:6a00:1496:b0:781:556:f33 with SMTP id
 d2e1a72fcca58-7ae1cb64038mr237781b3a.5.1762279268154; 
 Tue, 04 Nov 2025 10:01:08 -0800 (PST)
Received: from [10.226.59.182] (i-global254.qualcomm.com. [199.106.103.254])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-7acd586ccfcsm3684351b3a.41.2025.11.04.10.01.07
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 04 Nov 2025 10:01:07 -0800 (PST)
Message-ID: <0ec71586-638b-4a9e-beb4-f7e95bfac14d@oss.qualcomm.com>
Date: Tue, 4 Nov 2025 11:01:06 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] accel/ivpu: Improve debug and warning messages
To: Karol Wachowski <karol.wachowski@linux.intel.com>,
 dri-devel@lists.freedesktop.org
Cc: oded.gabbay@gmail.com, maciej.falkowski@linux.intel.com, lizhi.hou@amd.com,
 jani.nikula@linux.intel.com
References: <20251104132418.970784-1-karol.wachowski@linux.intel.com>
Content-Language: en-US
From: Jeff Hugo <jeff.hugo@oss.qualcomm.com>
In-Reply-To: <20251104132418.970784-1-karol.wachowski@linux.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: AW2NhQXRaIv_kkqA0R11TPSXnb-KnV4Y
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTA0MDE1MCBTYWx0ZWRfX5kYEJDfzC7KO
 VTvZo1wIq2FkDkVgfkgPwXegltaCdiK4UqZVcm5G2NDg+5OUBDSzrWrxHjEQDaNOyriiXxAUkoQ
 4VlGXiABxxjaT2mT9gva7dk3p9CqyKa1ncHa0Vq/Tip6LktFgiT45G1miejdbGxZNaAv0MIvCaQ
 1rksOihuKJYzdqdG8kNFc47xfZqzluxVlPiHGBFqlDnFs1bECvZ37mAK/GD3bJp6YUqyI/uWxK1
 aH5jsYfETR1x3c3olytljyyHTMGYoGkxvvKvl2TtUNkUEp2NNFz9Z4gVqO/V9bdxD8YGbrRnncq
 oQBv4iEHVkZB6B/UAQlNmp81Y02WA12+2sOgfWxfSWBuMZSNy8OxAVdipKJ5z8bLlTY7XRDv3bR
 BMV+o0MLnb7IUOHxKESgaNG9YYA56A==
X-Proofpoint-ORIG-GUID: AW2NhQXRaIv_kkqA0R11TPSXnb-KnV4Y
X-Authority-Analysis: v=2.4 cv=IpsTsb/g c=1 sm=1 tr=0 ts=690a3f65 cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=QyXUC8HyAAAA:8 a=EUspDBNiAAAA:8
 a=kfWVfVtVOl8sKu9Y-1QA:9 a=QEXdDO2ut3YA:10 a=IoOABgeZipijB_acs4fv:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-04_02,2025-11-03_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 lowpriorityscore=0 bulkscore=0 clxscore=1015
 malwarescore=0 adultscore=0 suspectscore=0 impostorscore=0 phishscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2511040150
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

On 11/4/2025 6:24 AM, Karol Wachowski wrote:
> Add IOCTL debug bit for logging user provided parameter validation
> errors.
> 
> Refactor several warning and error messages to better reflect fault
> reason. User generated faults should not flood kernel messages with
> warnings or errors, so change those to ivpu_dbg(). Add additional debug
> logs for parameter validation in IOCTLs.
> 
> Check size provided by in metric streamer start and return -EINVAL
> together with a debug message print.
> 
> Signed-off-by: Karol Wachowski <karol.wachowski@linux.intel.com>

Reviewed-by: Jeff Hugo <jeff.hugo@oss.qualcomm.com>
