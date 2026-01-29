Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id EGE9EP01e2mGCQIAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Thu, 29 Jan 2026 11:27:09 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 835A2AEA2D
	for <lists+dri-devel@lfdr.de>; Thu, 29 Jan 2026 11:27:08 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B3F8C10E32A;
	Thu, 29 Jan 2026 10:27:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="YqzbJf3X";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="KqDnWPZQ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 10E7F10E32A
 for <dri-devel@lists.freedesktop.org>; Thu, 29 Jan 2026 10:27:03 +0000 (UTC)
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 60T39xsO1429065
 for <dri-devel@lists.freedesktop.org>; Thu, 29 Jan 2026 10:27:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 poJxw3O33HGhuN9ILVRF83I2m99nsoSK8pXDKw4sctc=; b=YqzbJf3XVsErNCF9
 VBNz/ct0U2LFzE4j2NVfNJi3vOZ6st1Jo3CMmFt8e6i/yGgrwGbQePinMlmLIcPV
 d31XwpI0A0b5ocpuQeExeqdzs+PC5ob4THW0ArXYLqh0b0X2uHZR51cAGzNaF8f8
 xVzcO4pCduevy3mViJARVHFmmiZ9wYs39HmlkP45vU6cC5CwW5d5YlXgBKJiuYGv
 NJBSv/9UM5Mq1jeECQQ1mKpEmolMgQg+5xtwwZPNfYKjX99kw7y/lhnyrVAWMed+
 saV+RfxGOqSmF3940xlfohnT//8p9jpxASW0DX+8ubI217QTXm+BVVBY+ur83OdU
 8v+24Q==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com
 [209.85.215.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4byydh18ta-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Thu, 29 Jan 2026 10:27:02 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id
 41be03b00d2f7-c54e81eeab9so562028a12.3
 for <dri-devel@lists.freedesktop.org>; Thu, 29 Jan 2026 02:27:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1769682422; x=1770287222;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=poJxw3O33HGhuN9ILVRF83I2m99nsoSK8pXDKw4sctc=;
 b=KqDnWPZQhMOs18m+JpC3V7DVHFAxVEGzasjyCykwZlnq5fPpj09gZPW3iyo2dbgx9N
 4U9NVNfUUliFQftzYsaqbX9aJ7bGJJzgMxY8vkLWFAD/SHhe/YTHwUCDWTkQqIk7FQYy
 VdYEozXZN9gYeOgl8Hx611f2LPozN88QxhZdsQBp8B0tjsGMdvujhJNYvwPwknFIQlOb
 9EBmIVFj5V/0Zg4F+VbId+WQJtGFy4p1BouFs8IxVXYxWX+Jg8YWqjuko+oCZ9XaUkYr
 x3ezdgHhDVIlrTUQhH1SGneCW47vEoboYGcCXvItMJabnXXGk8uJhcFbyr9taPFzcGQM
 j8iQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1769682422; x=1770287222;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=poJxw3O33HGhuN9ILVRF83I2m99nsoSK8pXDKw4sctc=;
 b=X9+7GkEES1oGVT5KD1nmrw6mz3L485JpzcrvEuoUANotvJDUu31bc0hehfAILXNfCM
 OEKHDu+miVDrbG7e9bx/rC8neWZMhq8ckUaBdPJST4jh4figYUdQiciRdfkxlLbrcO8V
 HgMeRnJVNVnATnkPAcBZPDsvLkqqK3yUP8MJem/V9McktfMjiSb/zvDxuOSFCHbwnpmK
 a8UYYhdzfTH2JRYEPuOefwUzbrYMvDJXKCV6gOzzW0kSz+26AtRPVW6qIAS4Io6ehdJe
 orWPIiACaTpI+HnvJE0/qAAjjMYaA4QddacSlLYNkKN/z0w8tHRj/tf/FIqPf4BH7F+4
 8zuw==
X-Forwarded-Encrypted: i=1;
 AJvYcCW+ZFIonTfMTCG2DHMxL+TwPNDxse+sO+Jk5RimcF4qQ0NLb9SQ7HNCi6jRzGuS1adEnhFj4VYGSTo=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxCMaO5SsVtTLDjwkmat8cmKlWRpITQixXbsFWQajFaKwMmxDip
 j6zY52tj1S/TMYSXy71QcBfiMvGpFHNKEUFFF42zrGIK8jF+tde1yWa38xK9VHnlz/Vasl9kQ9I
 DCo6jSlMyyCCccAxj6KIoOIjpCBwSGyIaws/xn3We4A4jcRcvTO3YTahljjUAVCIpmyGRyxE=
X-Gm-Gg: AZuq6aJE9XBHHuyvq1+x2eVw028J50Q+WAnTaTYSQpqJcjSvMeoEALemzFlQ8vjN2gT
 p1aKVITo0KBl4VLHHrhUSNFerW6q6Ts0yNzQ1lVTUcitFjLIRG9bZILq6ml0wB/Mz9jft4AH65p
 rkZDzvuNg+KRDyPDswO9MbRV/U38NcNU6pA4qQyOHF35K+Laj2ju3j4hZNXm4IFAerGIrwJ4bHX
 cAWTdZTrscmgYpLdraL0SOSC2TTA7kuv/fYog/1p4YkQDBO6KSH62UOLBeFHY8ae2ryqJEDtiSD
 ESSlDGgypS0ALG2vR8WxHzik/jUxWCbxr4zFv6FRQ8FiKRUKXjcPkX7IL3hQkG/0ZygSmVO27dD
 hOh3pP7eb1dSpNSzslDpw8mW9tsFfUTYnxHy0mg==
X-Received: by 2002:a17:903:2a87:b0:29f:e787:2b9b with SMTP id
 d9443c01a7336-2a870dd93a8mr83226755ad.41.1769682421778; 
 Thu, 29 Jan 2026 02:27:01 -0800 (PST)
X-Received: by 2002:a17:903:2a87:b0:29f:e787:2b9b with SMTP id
 d9443c01a7336-2a870dd93a8mr83226545ad.41.1769682421301; 
 Thu, 29 Jan 2026 02:27:01 -0800 (PST)
Received: from [10.206.99.28] ([202.46.23.25])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2a88b426ae4sm45721695ad.43.2026.01.29.02.26.57
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 29 Jan 2026 02:27:00 -0800 (PST)
Message-ID: <37e2876f-6998-4e79-8696-c7f97307a28f@oss.qualcomm.com>
Date: Thu, 29 Jan 2026 15:56:55 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 3/4] misc: fastrpc: Expand context ID mask for DSP
 polling mode support
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: srini@kernel.org, linux-arm-msm@vger.kernel.org,
 gregkh@linuxfoundation.org, quic_bkumar@quicinc.com,
 linux-kernel@vger.kernel.org, quic_chennak@quicinc.com,
 dri-devel@lists.freedesktop.org, arnd@arndb.de,
 konrad.dybcio@oss.qualcomm.com
References: <20251230062831.1195116-1-ekansh.gupta@oss.qualcomm.com>
 <20251230062831.1195116-4-ekansh.gupta@oss.qualcomm.com>
 <xrudy7p267tuu6q5qrndw35677noevqq23zooxmsacxlswzpub@2cqtvc6e3aw4>
Content-Language: en-US
From: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
In-Reply-To: <xrudy7p267tuu6q5qrndw35677noevqq23zooxmsacxlswzpub@2cqtvc6e3aw4>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: dC_QS00O8SCXYJoRiT8MrJ0YhzxeNGe2
X-Proofpoint-ORIG-GUID: dC_QS00O8SCXYJoRiT8MrJ0YhzxeNGe2
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTI5MDA2OCBTYWx0ZWRfXy8gTGoPlEJRh
 Ttz/BFQeGy0KykjcaRNBJ+RyLoHAjmaJaOPXq7etjglnfx3nV0Z6xX24b3J8FA3mwcJwUs0Qibh
 JReMXmGTGEMS3cFa3URLzOz8noR1IyC60RQCxTBtLVYEo8Fvwcr8MBoeAQ3MvMGrGixrqLD67uG
 kIHunnsBvqzojB1Jv3ieYhH1K0UXSzZ1AcFK6VBJWkJuEZn2U/vYvkot/bIuoDTVWokLH1EQSVW
 pQIQTbre35STxCYKDzUkPM26oN0pA9PnsagOystN9UHR1mc28+UsVN+aIMW0GE00ffGFfjpg1sn
 2fvx19iQuUBqWOeHIoklxJQzblif/zd+Fac1TqpXexKhdJXr2GPOfRJ+qN2tNusIiefyZ06X0Zb
 fwwWXsYHLbbPxFePCJJLN0+Nh0wjGYeESvLFwMB0WLPF+uJPUfyw5hgiTSoLsegq+JTU2iCN5vp
 RQ2kJBU7T3L9y6yrxPw==
X-Authority-Analysis: v=2.4 cv=Cs6ys34D c=1 sm=1 tr=0 ts=697b35f6 cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=XpT7ApHK0yhPgYAQ0KkA:9
 a=QEXdDO2ut3YA:10 a=_Vgx9l1VpLgwpw_dHYaR:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-01-29_02,2026-01-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 clxscore=1015 spamscore=0 phishscore=0 bulkscore=0
 malwarescore=0 priorityscore=1501 adultscore=0 impostorscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2601290068
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
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.31 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:dmitry.baryshkov@oss.qualcomm.com,m:srini@kernel.org,m:linux-arm-msm@vger.kernel.org,m:gregkh@linuxfoundation.org,m:quic_bkumar@quicinc.com,m:linux-kernel@vger.kernel.org,m:quic_chennak@quicinc.com,m:arnd@arndb.de,m:konrad.dybcio@oss.qualcomm.com,s:lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER(0.00)[ekansh.gupta@oss.qualcomm.com,dri-devel-bounces@lists.freedesktop.org];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[ekansh.gupta@oss.qualcomm.com,dri-devel-bounces@lists.freedesktop.org];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[10];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:dkim,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns]
X-Rspamd-Queue-Id: 835A2AEA2D
X-Rspamd-Action: no action



On 1/6/2026 8:23 AM, Dmitry Baryshkov wrote:
> On Tue, Dec 30, 2025 at 11:58:30AM +0530, Ekansh Gupta wrote:
>> Current FastRPC context uses a 12-bit mask:
>>   [ID(8 bits)][PD type(4 bits)] = GENMASK(11, 4)
> Is it Linux-only representation or is it also used by the DSP? Will it
> work with MSM8916?
Apologies for the delay in response, had to go back to check on older DSP software.

DSP will also use this but it handled properly across platforms. DSP get PD details from PD bits
and mask it to use further for async call checks. Other than async call check, the context ID is
majorly used for book-keeping on DSP side(no functional utility).

So, it should also work on MSM8916,
>
>> This works for normal calls but fails for DSP polling mode.
>> Polling mode expects a 16-bit layout:
>>   [15:8] = context ID (8 bits)
>>   [7:5]  = reserved
>>   [4]    = async mode bit
>>   [3:0]  = PD type (4 bits)
>>
>> If async bit (bit 4) is set, DSP disables polling. With current
>> mask, odd IDs can set this bit, causing DSP to skip poll updates.
>>
>> Update FASTRPC_CTXID_MASK to GENMASK(15, 8) so IDs occupy upper
>> byte and lower byte is left for DSP flags and PD type.
>>
>> Reserved bits remain unused. This change is compatible with
>> polling mode and does not break non-polling behavior.
>>
>> Bit layout:
>>   [15:8] = CCCCCCCC (context ID)
>>   [7:5]  = xxx (reserved)
>>   [4]    = A (async mode)
>>   [3:0]  = PPPP (PD type)
>>
>> Signed-off-by: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
>> ---
>>  drivers/misc/fastrpc.c | 2 +-
>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>

