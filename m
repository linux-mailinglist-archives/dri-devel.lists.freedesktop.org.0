Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4174AC0FC79
	for <lists+dri-devel@lfdr.de>; Mon, 27 Oct 2025 18:51:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6D49C10E538;
	Mon, 27 Oct 2025 17:51:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="cRPeAO3D";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 644A110E538
 for <dri-devel@lists.freedesktop.org>; Mon, 27 Oct 2025 17:51:11 +0000 (UTC)
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 59RCKwEK2750475
 for <dri-devel@lists.freedesktop.org>; Mon, 27 Oct 2025 17:51:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 Oc3I6eQ5vlnsRGL0FgP7OAU89DvmitRm0td3ZPgIKrk=; b=cRPeAO3DRqArc7aI
 GcI/c+Z1BTjITzbTFIaiR//D6/LTwVrOqcEiPlrO8fpxoCMbkIKoOqvAUbo8UUSg
 8WWbQwRiNw86DIiUGCv9VRyezslpgpDMsIGFvrS+dNg07SNngqxK997xvTwUN3JL
 ca9zoIwrSUrBS7glJiy3GtqTZyN3YJSZFebci6GPzOTalyekUa3lC1lekueDunAA
 3HXZ1uddvy9G5KE+u/UzGiMrOG/fBBiGqc2o+QL2eTUBXAg9+MSE3YwLsbyTcpJT
 K0Bc4uQD6hP8QTDRouYDiJF9h70Ox28yJVXF+D6+dsFMImFI1nH4A+wGuYdCmj5x
 AJ9e5g==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com
 [209.85.214.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4a28nss41d-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Mon, 27 Oct 2025 17:51:10 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id
 d9443c01a7336-28973df6a90so35575905ad.2
 for <dri-devel@lists.freedesktop.org>; Mon, 27 Oct 2025 10:51:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1761587470; x=1762192270;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Oc3I6eQ5vlnsRGL0FgP7OAU89DvmitRm0td3ZPgIKrk=;
 b=gPvXM+snXD9Mzvu7OP7FLUw3XcQMwm/JJ8X0zD8MNsySLtuyR8ZlfxHD6miK2IRNK+
 qRkHzTn5bxpFjEDQDJoQ9FCqFCas3Rm0hqUt6hrttamia4di47JjCPSmWVzimmPTgBCt
 NJcpfNsY9RmDJgxzd9i55PgkmUxERNXze++earXt4WSy/WSKECeu2u/ZZoPScyiggcWm
 1MMlgPh5CidmQVFuZMhveo5cwrnxKyMHQz94EFxyZoGmtr2a80MnAgZraZ6sjTlkSrkj
 WV9tjODcM3BPLwm5l9snj/Gpdhyhae6ia0thDMlGh2WaR14TDh753dmx7lmlaa7rm9+1
 6d+Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCXgUmSHkyrnbTzNmFyl/qUH3Sno/rH4HkXvpSHPv5oSQIYEXUny5CnlDXuW2hxF6k/RS2Rg0Z9emdY=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyRZJXWTI/8yOQLZzdBtNiRk86OMLS7OLojAkjmTh8Vhjbo2HhU
 fI0syYhJnGYBCLjKlGeW61RUXaTR4aX+8COfAwV7t1yqYA4Cc+uyBbUICQK1bZHXrk39fBdkK/k
 mKPaIyhSJjYvXVl8J/DOKMpVnpFePqVzwNDPyDwB7VdiMmsgKsRE1Uxhde8xG3xZRFO/8HMg=
X-Gm-Gg: ASbGncs/2jDNhTYsoH6SfPmAVEYASEhEZlYrpwnohKNrVytHOQ5U+ifkjXLBSkD5Bhr
 XmFiLBeuTrBt8kAOXtfebhv0b14YAvIgvyd3fO9xtstU55aSUVD8st5DSMAw5U+VF7rEiNq8P8h
 UyRCB0Xn2soC00LB4ANBA9FVjWSAYzdQ7j1Cx/TjKZ/cgEl5xi7+gOU/Ea41LJ7GjQgFUIK7TAa
 dWDISoasnSB63bns5Y78pNBrs94EK8fcA9doc5gJKLXoAnhQgMnbrFDA7fYnJ9XHSXaYnXW4sAX
 Wm1Pk8rFvpf3dyih2mhXp1xbdNC2gwHuRl50WfN3Z2F3SI+CxchFx4Sqlxs1UD2+GKxX+0CUbl7
 aJ3C9/T4YzYSHJozljZVLV9zB8iL7qww99vxn1E1zw7Vxyrq4NZMK
X-Received: by 2002:a17:902:d50c:b0:293:e0f:3e3 with SMTP id
 d9443c01a7336-294cb52e567mr7378485ad.29.1761587470178; 
 Mon, 27 Oct 2025 10:51:10 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE86t0avflsAWGB3DYHKso44bMq8V2RnGM7ODfwDlqrvydnglrQAqzfCOvgkNkOR5jRMLTA3A==
X-Received: by 2002:a17:902:d50c:b0:293:e0f:3e3 with SMTP id
 d9443c01a7336-294cb52e567mr7378085ad.29.1761587469709; 
 Mon, 27 Oct 2025 10:51:09 -0700 (PDT)
Received: from [10.226.59.182] (i-global254.qualcomm.com. [199.106.103.254])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-34028fc5cc5sm71942a91.0.2025.10.27.10.51.08
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 27 Oct 2025 10:51:09 -0700 (PDT)
Message-ID: <bf677e6d-8cb1-4e6d-8f50-39ca20ed6494@oss.qualcomm.com>
Date: Mon, 27 Oct 2025 11:51:07 -0600
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] accel/qaic: Update the sahara image table for AIC200
To: Youssef Samir <youssef.abdulrahman@oss.qualcomm.com>,
 carl.vanderlip@oss.qualcomm.com, troy.hanson@oss.qualcomm.com,
 zachary.mckevitt@oss.qualcomm.com
Cc: ogabbay@kernel.org, lizhi.hou@amd.com, karol.wachowski@linux.intel.com,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Zack McKevitt <zmckevit@qti.qualcomm.com>,
 Aswin Venkatesan <aswivenk@qti.qualcomm.com>
References: <20251017173432.1207656-1-youssef.abdulrahman@oss.qualcomm.com>
Content-Language: en-US
From: Jeff Hugo <jeff.hugo@oss.qualcomm.com>
In-Reply-To: <20251017173432.1207656-1-youssef.abdulrahman@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDI3MDE2NSBTYWx0ZWRfX7RbxrVt+0A1F
 Hiv0Jjz2vwvnX7Mabu4qIM+tz7gmnR44jnAbWeKgffB7Ji6uLHFLqyJbFYrOuzr8mBahuGCUG3y
 Lnq9ceYHX3Wa1Jq+7aqeJ9s4bWbcxNPtTkQJSqF6mfx2waokumfiZVUCYpswswg4lOHzV3++0Mu
 GV/YsnTpTshJX9cUIhRebRLqhGliT6cVbfNItcg5M8BODec3vzqMN8dBy4AkwNeEaMD6jGyBvnu
 2YG2o52oKayPBtDJiuzic4VaEIEPjOs/PobA2rmvbt4CETcO0pXB5uvCGPODNcnunU0v+mCxqg/
 pk+4Iewum8y1ca3f/nZ2xF0Z8b+NSuQp+B7wMWr130YYsu5RlHE8SI1jhNPINVKmvMXVV3VcYbS
 aEIwbD6Jhq0HYb8uy4junDBaO5Rs5g==
X-Authority-Analysis: v=2.4 cv=RIW+3oi+ c=1 sm=1 tr=0 ts=68ffb10e cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8 a=QoCwUzDOKqydt9tafI0A:9 a=QEXdDO2ut3YA:10
 a=zZCYzV9kfG8A:10 a=1OuFwYUASf3TG4hYMiVC:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: I9ADEGc7q15c9NIuJeoZ3LSPN0UggxzC
X-Proofpoint-GUID: I9ADEGc7q15c9NIuJeoZ3LSPN0UggxzC
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-27_07,2025-10-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0 impostorscore=0 adultscore=0 priorityscore=1501
 malwarescore=0 clxscore=1015 bulkscore=0 phishscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510020000 definitions=main-2510270165
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

On 10/17/2025 11:34 AM, Youssef Samir wrote:
> From: Youssef Samir <quic_yabdulra@quicinc.com>
> 
> Update the Sahara image table for the AIC200 to add entries for:
> - qupv3fw.elf at id 54
> - xbl_config.elf at id 38
> - tz_qti_config.mbn at id 76
> And move pvs.bin to id 78 to avoid firmware conflict.
> 
> Co-developed-by: Zack McKevitt <zmckevit@qti.qualcomm.com>
> Signed-off-by: Zack McKevitt <zmckevit@qti.qualcomm.com>
> Co-developed-by: Aswin Venkatesan <aswivenk@qti.qualcomm.com>
> Signed-off-by: Aswin Venkatesan <aswivenk@qti.qualcomm.com>
> Signed-off-by: Youssef Samir <quic_yabdulra@quicinc.com>
> Signed-off-by: Youssef Samir <youssef.abdulrahman@oss.qualcomm.com>

Reviewed-by: Jeff Hugo <jeff.hugo@oss.qualcomm.com>
