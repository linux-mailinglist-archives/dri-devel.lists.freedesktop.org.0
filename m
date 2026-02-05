Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id E3/RGsNdhGnS2gMAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Thu, 05 Feb 2026 10:07:15 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D5B29F04B8
	for <lists+dri-devel@lfdr.de>; Thu, 05 Feb 2026 10:07:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 16C3110E810;
	Thu,  5 Feb 2026 09:07:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="mHT74PHt";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="FLra0Ydw";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3EE8A10E810
 for <dri-devel@lists.freedesktop.org>; Thu,  5 Feb 2026 09:07:11 +0000 (UTC)
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 6153e24D3031260
 for <dri-devel@lists.freedesktop.org>; Thu, 5 Feb 2026 09:07:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 +5xOzbjY5n//2YI4Dvmh3UhyPEnWdJUEu8SsC0/t6bg=; b=mHT74PHtlYZNN/Nw
 3tp1IuaDFlDV2fjzoTN2yrqEvhO3tMdhXl7Z4fv/1q2m2q9gylsXjs1xGM7G68Ax
 dR0geiPoU67gUya+pHe1uULVJs+4Y9/jbDnRcDoMKWXkRnNgH+mVwNJAs89DA10m
 UtRfIidzF4Ck7qSeuKCtTYKfscod92dqmButriRx1K5fFxOhCcKTGeK1Jwd+/G6x
 axudXvmyTVVrL5+7wDMekS377suhIXoCasL43EWusBQFhQ7wr1H92WV+HEDTK/iG
 wbst1nOcGHnOucXWxt+T5Dig2XsacO/n1nKdZ6XJYde/xtxvdSGm/08i5EZ0+9S0
 fGjd0w==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com
 [209.85.210.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4c4a7tjhya-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Thu, 05 Feb 2026 09:07:10 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id
 d2e1a72fcca58-81f5381d17dso754747b3a.1
 for <dri-devel@lists.freedesktop.org>; Thu, 05 Feb 2026 01:07:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1770282430; x=1770887230;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:in-reply-to:cc:from:content-language
 :references:to:subject:user-agent:mime-version:date:message-id:from
 :to:cc:subject:date:message-id:reply-to;
 bh=+5xOzbjY5n//2YI4Dvmh3UhyPEnWdJUEu8SsC0/t6bg=;
 b=FLra0Ydw1Dxp+I1N0/iSNGFukk+cwKqtaOHU3CZhtPBa5UesOEN37OV7Uflh1ihwdM
 W7bPakABJY3cPi+vfnSmT41VpsQ4DrzcwTUyxKEdyr8JCDaju4zE8WvHLJx8VrMv+Ncp
 dJbmK9oW8hx44PjHyDbN21uD5WS97qBLCEiiOxR/ZQyF5ko8i+4PbRASAzBFujj2J95A
 nvzIJIgfS8a09eGj0KybMXiTJMDK+bJI5Eovwo+5JXbGtYenOlBOvm/2pbEQYd2Fef8K
 tV8Rp0xftcHT6GTekjbQBIdlv7JrHj2Kd9g44GMXhpAg1UTOtZe+RsmNdJcRaDVr5L7m
 8tZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1770282430; x=1770887230;
 h=content-transfer-encoding:in-reply-to:cc:from:content-language
 :references:to:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=+5xOzbjY5n//2YI4Dvmh3UhyPEnWdJUEu8SsC0/t6bg=;
 b=e6C+rb84kRx6ZqS1LoUKW+CG2ONSrfMIlL4v7sBXwu+G7qTDVs1jO4JKmFEkKTGOis
 FIIE5z6B2KVO8/axSlo4hBS2VSElKSjISuiVJ+bOQTuEZlikY0Xteslaue0Co3FFdUlV
 nSBRqVhROkdDPT5du8RBpNbrTKPRwZ+DGEC7PntuSFcwZ7raWN4LAxH1CIhCJB8M+4AZ
 5Z+cDDqVEV+PSGNbHUhVvoGF5jxmD7zB7dAqhU17yN4QSP3ZzZoxi2hvTN8cXukmgTQ0
 c2fqf+OsXbEiS7ot+gtXMg90ko6ILxqRQuhnEt/JD7vRNhYYTy9zMofv8RINETwDWCLn
 fhog==
X-Forwarded-Encrypted: i=1;
 AJvYcCVuxmYpkHmvELDKxXMxgjN16x/tOpJoP6xpBG0zH/Ivu+CPXufLB4PNJs2dUn4wtPKSv/x24Bkm4c0=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yzmhj5gH7E5nIsYrBfhtCoVyQFfm1BHZwubruZlkG/DaOyLovwK
 mc7UCEvFWubKwroZiRjx/4DIYIqYrg2uiN9CtxhNzXSckMUCz5kNDNJXZRL7AHfRG6sxk0fzKd9
 k38BhIeGMoWCfqNQG2swkpnRZZ216/15TIC43Z7Z/VreRgZ0+EGGEpfo0vjPXsW3ZLAPJ2hY=
X-Gm-Gg: AZuq6aKO2sF7UaY6n1SwsBi3ObLt2HWv9ucEEx1yCr9IAh57h/RYzgN4EnmI1ESft9O
 MjMMD0HyvTEMUKSGeEaoG0rH6ij+VijOkaGA0zTnpb/p+2brfVx9CyhgILbjtfq1luAU2x2nSDu
 g0adlsQ7CVmUF805F8D59rFRI9LPkXZDXDJSn1+F/wYGeSfIhfSK7A5WUyPkkBHNknZ/1dlxBJy
 9iYqKn3HTUlSprbM2tCjoDKA97ivvzX6+D5uLjZ/g3Nhh9HxyBVO+r/rvhTMDn6l9yU3SAAaNGg
 dBQGgkKnGaXHgw+6mE88wpAUqXQ0bi8XVJS4BCrCB/trBShFkkZfr/9W8vJqnKGtrVKyV+qItxO
 tvlsCAx+9F3EGKt+Rr08leK3yk5k6G0qFflqvRulsG1sC5fcNO6g79bWR4w7xGz479+ChAcU3+u
 88hwMq
X-Received: by 2002:a05:6a00:a907:b0:81f:3c7c:8591 with SMTP id
 d2e1a72fcca58-8241c645c19mr5011473b3a.50.1770282429913; 
 Thu, 05 Feb 2026 01:07:09 -0800 (PST)
X-Received: by 2002:a05:6a00:a907:b0:81f:3c7c:8591 with SMTP id
 d2e1a72fcca58-8241c645c19mr5011450b3a.50.1770282429436; 
 Thu, 05 Feb 2026 01:07:09 -0800 (PST)
Received: from [10.133.33.108] (tpe-colo-wan-fw-bordernet.qualcomm.com.
 [103.229.16.4]) by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-8241d1c08e8sm5361366b3a.22.2026.02.05.01.07.05
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 05 Feb 2026 01:07:09 -0800 (PST)
Message-ID: <fac9526e-a184-4c4d-9d29-b37400bf47fe@oss.qualcomm.com>
Date: Thu, 5 Feb 2026 17:07:03 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/4] misc: fastrpc: Add NULL check to fastrpc_buf_free
 to prevent crash
To: Bjorn Andersson <andersson@kernel.org>
References: <20260115082851.570-1-jianping.li@oss.qualcomm.com>
 <20260115082851.570-2-jianping.li@oss.qualcomm.com>
 <2026011621-fang-moneywise-d6b2@gregkh>
 <2255b500-f4fd-4d7a-a5d9-5b4fb55c78b2@oss.qualcomm.com>
 <2026020245-catalog-outburst-f805@gregkh>
 <592129fa-cd8e-44b5-a18c-1fb6c6ed102b@oss.qualcomm.com>
 <gjmq3xbu567ymkj5lc5u44pbehbn5spyshqj3wgi434q2ing75@lztciattj5pv>
Content-Language: en-US
From: Jianping <jianping.li@oss.qualcomm.com>
Cc: Greg KH <gregkh@linuxfoundation.org>, srini@kernel.org,
 amahesh@qti.qualcomm.com, arnd@arndb.de, linux-arm-msm@vger.kernel.org,
 Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>,
 thierry.escande@linaro.org, abelvesa@kernel.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 quic_chennak@quicinc.com, stable@kernel.org
In-Reply-To: <gjmq3xbu567ymkj5lc5u44pbehbn5spyshqj3wgi434q2ing75@lztciattj5pv>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: xBO7kp4WTrIjQc3ndeg6Gaf38Zu-AO5q
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjA1MDA2NSBTYWx0ZWRfXw3qupKdzfc1X
 l4MvJ0kUtTBktBWjLs5Tv9xh/ukzm+R35HjqYirglNna8P7HyYB80kG1QQW43nlXnEJ7iCBlfF+
 tcsZ1MiS8A4/x9ZLTYrKTrWo1NJvhahAFzgpvnaYIu57dkA9VfJ2b4wdSuXpZa6Os4iGzB52QJM
 /ehvdVpflPz8a+qRYx9cZgW9e3UOgt6dS0+NJV7CCWABuX1WIus0dpMuWfdxGi+J1BkzWz/Hm5n
 eYLl3lbXF7vbe54N26K/0BuWolEvwPcoIGmpMj2nTsLXDI4MMg8Gc39Jy/DvEVcU0WqUe2xdQRZ
 J0zkQMEY4Lr3oiadVntkx30SvSnAB6EH33KZV43fPBGZZinMJ8CQcflpCIj/81y1Yz/FGI/rPep
 RdK3F6LW8G//9My/cTuotpATOO6W76iw8gyAjsrcdHTX2kEpk86ZojGkBwLHKURAweS27EJlWs3
 Bg9gsiZe7mi14CMAtqg==
X-Proofpoint-GUID: xBO7kp4WTrIjQc3ndeg6Gaf38Zu-AO5q
X-Authority-Analysis: v=2.4 cv=QaVrf8bv c=1 sm=1 tr=0 ts=69845dbe cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=uBvRbRIBWN_UjP92ZHQA:9 a=QEXdDO2ut3YA:10 a=zc0IvFSfCIW2DFIPzwfm:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-05_01,2026-02-05_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 bulkscore=0 adultscore=0 impostorscore=0
 lowpriorityscore=0 clxscore=1015 malwarescore=0 phishscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2602050065
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
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:andersson@kernel.org,m:gregkh@linuxfoundation.org,m:srini@kernel.org,m:amahesh@qti.qualcomm.com,m:arnd@arndb.de,m:linux-arm-msm@vger.kernel.org,m:ekansh.gupta@oss.qualcomm.com,m:thierry.escande@linaro.org,m:abelvesa@kernel.org,m:linux-kernel@vger.kernel.org,m:quic_chennak@quicinc.com,m:stable@kernel.org,s:lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[jianping.li@oss.qualcomm.com,dri-devel-bounces@lists.freedesktop.org];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	ARC_NA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[13];
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
	TO_DN_SOME(0.00)[]
X-Rspamd-Queue-Id: D5B29F04B8
X-Rspamd-Action: no action



On 2/4/2026 5:32 AM, Bjorn Andersson wrote:
> On Tue, Feb 03, 2026 at 08:08:16PM +0800, Jianping wrote:
>>
>>
>> On 2/2/2026 4:41 PM, Greg KH wrote:
>>> On Mon, Feb 02, 2026 at 03:13:10PM +0800, Jianping wrote:
>>>>
>>>>
>>>> On 1/16/2026 10:49 PM, Greg KH wrote:
>>>>> On Thu, Jan 15, 2026 at 04:28:48PM +0800, Jianping Li wrote:
>>>>>> From: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
>>>>>>
>>>>>> The fastrpc_buf_free function currently does not handle the case where
>>>>>> the input buffer pointer (buf) is NULL. This can lead to a null pointer
>>>>>> dereference, causing a crash or undefined behavior when the function
>>>>>> attempts to access members of the buf structure. Add a NULL check to
>>>>>> ensure safe handling of NULL pointers and prevent potential crashes.
>>>>>
>>>>> What caller passes in NULL here?  I did a quick look, and see where the
>>>>> callers check this properly if it could be NULL, otherwise it all looks
>>>>> sane to me.  What in-kernel user is causing a crash here?  Why not fix
>>>>> the caller up instead?
>>>>>
>>>>> thanks,
>>>>>
>>>>> greg k-h
>>>>
>>>> It's a saftety coding: to eliminate NULL checks on the caller side, as we do
>>>> in a lot of other kernel API.
>>>
>>> But you do not do that for all functions in the kernel, otherwise the
>>> kernel would be full of checks that are never hit at all.
>> To clarify the intention: this change was not triggered by any real crash in
>> current callers. The motivation came from the v1 review discussion [1],
>> where it was suggested that a NULL check in fastrpc_buf_free() would allow
>> simplifying some of the caller paths.
>>
>> [1] https://lore.kernel.org/all/c80c48a1-f1b6-4520-9d7c-3a83915c7717@oss.qualcomm.com/
>>>
>>>> And it was pointed out in the v1 patch discussion that this change was
>>>> needed:
>>>> https://lore.kernel.org/all/c80c48a1-f1b6-4520-9d7c-3a83915c7717@oss.qualcomm.com/
>>>
>>> Were the checks removed from the caller side like was asked for?
>>
>> Currently, I have placed the check inside the API and removed all the checks
>> outside the API.
>>
>>>
>>> Also, your changelog makes it sound like this is a real bugfix for
>>> something, when it is not at all, which is what I object to the most.
>>> Don't make scary changelogs for things that are not actually happening.
>>
>> You are correct. I will modify the commit text that caused the
>> misunderstanding.
>>
> 
> You should then also drop Cc: stable and Fixes:, as this is no longer a
> bug fix. And make sure you don't put actual bug fixes after this one in
> the series (i.e. it probably shouldn't be patch 1/4).
> 
> Regards,
> Bjorn

Thank Bjorn for the reminder, I will adjust the order of my patch.

> 
>>>
>>> thanks,
>>>
>>> greg k-h
>>
>>

