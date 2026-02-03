Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kMogJT/lgWl0LwMAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Tue, 03 Feb 2026 13:08:31 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E95BED8CE4
	for <lists+dri-devel@lfdr.de>; Tue, 03 Feb 2026 13:08:30 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BA56A10E1E5;
	Tue,  3 Feb 2026 12:08:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="Nl6YtP03";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="bpoxKbed";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C392E10E1E5
 for <dri-devel@lists.freedesktop.org>; Tue,  3 Feb 2026 12:08:27 +0000 (UTC)
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 6136fCai278229
 for <dri-devel@lists.freedesktop.org>; Tue, 3 Feb 2026 12:08:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 B7h20MCirN2R6w9UGWVeyGVzBsz4bKvBB1VWC/VSR0k=; b=Nl6YtP03sJmlmlWI
 NqhiqSHHqr2Fs9mO0HZyIujupk60wK48NPFS2lVwy68IfD69aVohvyccLBC7TzYw
 Aa0NpohjhVVepb8/SL5awQg2IlhioIe6jxcLQpIil2VweZWPeZtSAiTDf8uuVZha
 FvhuZ4TfyD4VP3+JI2G7dAaBpy9PcSyJWZqCKTorJ8ldXnW4419eI9EHRbPvV3kS
 5BTHKlKqgBt5KtynGAsQpECtV5C2BmXGawvsfj0oD4iXF3TuN5m4l4mAN2sxMsm9
 ezgSt8qQoXatu95irv9AH2weX0b1go6WyGAm0cy7S4RjJZ3W+ylXvojq6mP+z2g1
 Pd1BpA==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com
 [209.85.215.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4c32s3ahe3-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Tue, 03 Feb 2026 12:08:26 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id
 41be03b00d2f7-c5539b9adbcso11374277a12.3
 for <dri-devel@lists.freedesktop.org>; Tue, 03 Feb 2026 04:08:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1770120505; x=1770725305;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:in-reply-to:cc:from:content-language
 :references:to:subject:user-agent:mime-version:date:message-id:from
 :to:cc:subject:date:message-id:reply-to;
 bh=B7h20MCirN2R6w9UGWVeyGVzBsz4bKvBB1VWC/VSR0k=;
 b=bpoxKbedCYE9PRM+UtHwtwVbIMJF/cyNVFLezN8IPKBxfSUWP2r49Yewzi9IZqoZD7
 EDpkLjez9K6ouh+VJ5JGWAF+6TuBHTiu3BqSF+MssIGocrQoUvRzLl0a6LGOG/95bAdL
 4SDP+YMsYKZk2UaT+Cxse2DdlLGJLXmuKAAweCXdUaS91ckhdyzV5fVCFgOnkBPnZJHb
 PiM+AZ/1E7cJBzhX/geWev82cqcN9sEFsXGqste5As1v7+39HvUPi+BIQgmgwX9iXyP6
 fd3x9giMbtKUOXjEHdAjK57f9Bm0f1fo58xP86E9PieszoRJgGnmEq9Dbh3CseH9x6yE
 ZSug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1770120506; x=1770725306;
 h=content-transfer-encoding:in-reply-to:cc:from:content-language
 :references:to:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=B7h20MCirN2R6w9UGWVeyGVzBsz4bKvBB1VWC/VSR0k=;
 b=EQeoA8XSmL4h3Z3lFNnTfoFlSXOSjeP7A+fnkbwxuBsVD/+NPJTY04Q6gDUw+3RGm1
 Dj3OJh2jwHm6PmO5oTWL32qD0Z4T1boxKzFjmGZ0cdfxL5aqLHEAgAhTv5HJYv2O16/d
 2f++6eEaDIGIy/1ixcXFgcsEikn4sFXgKzzDqDIPxymzshclyu3WFXgZIhdAnG9mRiO3
 mmsJgH5Uqt7J/vkpKG7mPUeWxdhaHaHP8BNARCo0/dCTA3NbcGQ3KNaMWJKQ32G+bIEX
 cyh33fyY0e4UmtfuwElPqb5RPux+gbO3cN4Vb19/Hy5ygbvGPNcmmiaCrka2Y5+WB/bF
 z5Qg==
X-Forwarded-Encrypted: i=1;
 AJvYcCVO3VhVSK3Jfj8FQNHhYiPVvfE6NvPyy3Lfb39u3yiY/iQtvu40/7/yIGHrSlu5jEo4IcDuA2OWpmI=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwKk6Y4RyF7ni6ETrQVbVa7KEw/AnUGMwSTbvlTNr2cKZ788hqZ
 lZQUwj5Yc3E3rcqY8XqwvGhbxy8gOtnnCaFSluBYAerv9FGhkd9mkJPmFYxxeCiliuJIy8duQPL
 i2moo5mX2ijK+5aY6SQp3ltyjPQWQWMFlov++VjZb9dd7+9ILDIo5qpXv+xDXauFup2GC3j8=
X-Gm-Gg: AZuq6aL3nO41NNRzcI9W9tf3V4Zse7VbB9fup6DX+PaOEdMqZa56KD1LqBj9bvc3ntE
 ZE7NNKcroWyykE+OmMQsneYnCXWSRPaPLffWm0se2YWKHm6j5wByVUig66DUNokCv3v45Lg2lF0
 UoWNWCtWnyuvWyRZmi/yWvGCa3sCqMYcgC2+r2LuIxs6OqbdercGA1lUpcc+fQBbRh8xXjKuddc
 wsMGqLrM/3YOQffyJaxfr2bo/1+SXY8P+WZQPrxO8dO/7nEjpaZ2pqPkM/gzAvGZrflqDuN0Uhx
 RuTm+UJwOMhIBgHXi6sJn3wZE2eTBchGtaLQKgB5gGwW52DHRtXFEG/JGO9S3L0t+4OqpscP1ZT
 EHEGAgmEH+z5TsQaU77psiNKedwwZPhPvkBMAeOSZXUz+IED7bV5JWqNFwLmr7x20Y5gdP2RqNJ
 wjpiU=
X-Received: by 2002:a05:6a00:3a1d:b0:81f:adb3:21c7 with SMTP id
 d2e1a72fcca58-823ab684020mr14247657b3a.22.1770120505612; 
 Tue, 03 Feb 2026 04:08:25 -0800 (PST)
X-Received: by 2002:a05:6a00:3a1d:b0:81f:adb3:21c7 with SMTP id
 d2e1a72fcca58-823ab684020mr14247634b3a.22.1770120505146; 
 Tue, 03 Feb 2026 04:08:25 -0800 (PST)
Received: from [10.133.33.16] (tpe-colo-wan-fw-bordernet.qualcomm.com.
 [103.229.16.4]) by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-82379c5a190sm22756121b3a.68.2026.02.03.04.08.20
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 03 Feb 2026 04:08:24 -0800 (PST)
Message-ID: <592129fa-cd8e-44b5-a18c-1fb6c6ed102b@oss.qualcomm.com>
Date: Tue, 3 Feb 2026 20:08:16 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/4] misc: fastrpc: Add NULL check to fastrpc_buf_free
 to prevent crash
To: Greg KH <gregkh@linuxfoundation.org>
References: <20260115082851.570-1-jianping.li@oss.qualcomm.com>
 <20260115082851.570-2-jianping.li@oss.qualcomm.com>
 <2026011621-fang-moneywise-d6b2@gregkh>
 <2255b500-f4fd-4d7a-a5d9-5b4fb55c78b2@oss.qualcomm.com>
 <2026020245-catalog-outburst-f805@gregkh>
Content-Language: en-US
From: Jianping <jianping.li@oss.qualcomm.com>
Cc: srini@kernel.org, amahesh@qti.qualcomm.com, arnd@arndb.de,
 linux-arm-msm@vger.kernel.org, ekansh.gupta@oss.qualcomm.com,
 thierry.escande@linaro.org, abelvesa@kernel.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 quic_chennak@quicinc.com, stable@kernel.org
In-Reply-To: <2026020245-catalog-outburst-f805@gregkh>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=Zc4Q98VA c=1 sm=1 tr=0 ts=6981e53a cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=X5nBk1X44HCHp22wJVoA:9 a=QEXdDO2ut3YA:10 a=bFCP_H2QrGi7Okbo017w:22
X-Proofpoint-ORIG-GUID: LWJQAXTnOkJbFMuVeI8H8nqT5zqCKbzS
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjAzMDA5NiBTYWx0ZWRfXx0jFy8xRM/3w
 RZaynBxHqsBfIPcgHwn2Lhjbw6uQfbkKCRQBlF3o30KrlOvHE0pPyTeWEGP4luNxsBZkE8BTPY7
 iPXxcR0InLY1neeOcWm7roCZT0xEUjds9Dp/peKGBx5kl38IyGSOVnq/HchVny7XtHjeQVghsvV
 wH57WDbyybmI5Sgbm8PxoIBtcmkwKBcH4cVPHgikqOMv9tsJKMlK/23/ruvobFNEVPJfaT+Xg6r
 0DJFE6iremzoGFpfpxkc3PCjX8F6tRdMh3bw+J3C8l98ZGD6kiwpLrxd4zspDJxOr0Wy/JvPQYM
 Utu6CIf9KJ8kgskIcHeQ9uKLCdo8wsUnjrbwb4OuUfjwNv6aHibR1HDSaJsKiv6edNbBBViSRVr
 pyyBQcWsdKex4rAGQswIk6BqIQHJQPrBJZLdxhAPYyPuvOoAeSmhutBhdlODlR6VH1sF1abDThH
 XYe5+XFK7GGGlHbLCAg==
X-Proofpoint-GUID: LWJQAXTnOkJbFMuVeI8H8nqT5zqCKbzS
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-03_03,2026-02-02_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 suspectscore=0 impostorscore=0 adultscore=0
 phishscore=0 bulkscore=0 lowpriorityscore=0 clxscore=1015 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2602030096
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
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:gregkh@linuxfoundation.org,m:srini@kernel.org,m:amahesh@qti.qualcomm.com,m:arnd@arndb.de,m:linux-arm-msm@vger.kernel.org,m:ekansh.gupta@oss.qualcomm.com,m:thierry.escande@linaro.org,m:abelvesa@kernel.org,m:linux-kernel@vger.kernel.org,m:quic_chennak@quicinc.com,m:stable@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	ARC_NA(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER(0.00)[jianping.li@oss.qualcomm.com,dri-devel-bounces@lists.freedesktop.org];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	FROM_NEQ_ENVFROM(0.00)[jianping.li@oss.qualcomm.com,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[dri-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:mid,oss.qualcomm.com:dkim,qualcomm.com:email,qualcomm.com:dkim,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns]
X-Rspamd-Queue-Id: E95BED8CE4
X-Rspamd-Action: no action



On 2/2/2026 4:41 PM, Greg KH wrote:
> On Mon, Feb 02, 2026 at 03:13:10PM +0800, Jianping wrote:
>>
>>
>> On 1/16/2026 10:49 PM, Greg KH wrote:
>>> On Thu, Jan 15, 2026 at 04:28:48PM +0800, Jianping Li wrote:
>>>> From: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
>>>>
>>>> The fastrpc_buf_free function currently does not handle the case where
>>>> the input buffer pointer (buf) is NULL. This can lead to a null pointer
>>>> dereference, causing a crash or undefined behavior when the function
>>>> attempts to access members of the buf structure. Add a NULL check to
>>>> ensure safe handling of NULL pointers and prevent potential crashes.
>>>
>>> What caller passes in NULL here?  I did a quick look, and see where the
>>> callers check this properly if it could be NULL, otherwise it all looks
>>> sane to me.  What in-kernel user is causing a crash here?  Why not fix
>>> the caller up instead?
>>>
>>> thanks,
>>>
>>> greg k-h
>>
>> It's a saftety coding: to eliminate NULL checks on the caller side, as we do
>> in a lot of other kernel API.
> 
> But you do not do that for all functions in the kernel, otherwise the
> kernel would be full of checks that are never hit at all.
To clarify the intention: this change was not triggered by any real 
crash in current callers. The motivation came from the v1 review 
discussion [1], where it was suggested that a NULL check in 
fastrpc_buf_free() would allow simplifying some of the caller paths.

[1] 
https://lore.kernel.org/all/c80c48a1-f1b6-4520-9d7c-3a83915c7717@oss.qualcomm.com/
> 
>> And it was pointed out in the v1 patch discussion that this change was
>> needed:
>> https://lore.kernel.org/all/c80c48a1-f1b6-4520-9d7c-3a83915c7717@oss.qualcomm.com/
> 
> Were the checks removed from the caller side like was asked for?

Currently, I have placed the check inside the API and removed all the 
checks outside the API.

> 
> Also, your changelog makes it sound like this is a real bugfix for
> something, when it is not at all, which is what I object to the most.
> Don't make scary changelogs for things that are not actually happening.

You are correct. I will modify the commit text that caused the 
misunderstanding.

> 
> thanks,
> 
> greg k-h

