Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id MA90LlPVgWkCKgMAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Tue, 03 Feb 2026 12:00:35 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F3D4CD803C
	for <lists+dri-devel@lfdr.de>; Tue, 03 Feb 2026 12:00:34 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1ACC410E31A;
	Tue,  3 Feb 2026 11:00:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="ovCclxQZ";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Ev6pjJwP";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BE88610E31A
 for <dri-devel@lists.freedesktop.org>; Tue,  3 Feb 2026 11:00:30 +0000 (UTC)
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 6137PJ261320605
 for <dri-devel@lists.freedesktop.org>; Tue, 3 Feb 2026 11:00:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 oQkZfToFq8BT06VP1uFHEcrlVvgBQYb05e9o8S8pTFg=; b=ovCclxQZfTBJZHCj
 kvFChiXP97GakvAnTtA0UXKk0axdw2C6A/HEH5S/6SIPfoHT7qm8+Enh3DVjS7P0
 zVr5M24ui5l6c4TqD/NiVaBKrrhsMxZ/Qh8iinaRLc74DBlaFe5sfWpSJG9PIWq/
 LeSfugWP2yFY24hDDfwOhznjON2sPRNzF9UQsShXTkmNdz6DtdbiIDNuSUlkdtVL
 ZVaI+Lmmjo2W0U2lZ2La1A8DIkPCIQ7UTSHx5p/VE1QpxkwRtGGwlo2gUTxWhU/S
 VrzPqrr9sTnvN/Nt9xevL+JpzIcMJ4ryxdJ65SOYoQSvOlbgsVjFDBVFUKj/gTk9
 qGnYfA==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com
 [209.85.214.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4c3cm70nr6-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Tue, 03 Feb 2026 11:00:29 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id
 d9443c01a7336-2a8fc061ce1so16704995ad.0
 for <dri-devel@lists.freedesktop.org>; Tue, 03 Feb 2026 03:00:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1770116429; x=1770721229;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:in-reply-to:cc:from:content-language
 :references:to:subject:user-agent:mime-version:date:message-id:from
 :to:cc:subject:date:message-id:reply-to;
 bh=oQkZfToFq8BT06VP1uFHEcrlVvgBQYb05e9o8S8pTFg=;
 b=Ev6pjJwPr8y/zb5UBnDrYTosa83s9nTgo/EqNe7/uajANjm1PgW+m1yNxgVKc38u2R
 cp/+ex931g0ncDP53OP0fxdxHDFCXtlDaEQuUV5sKPI8K7lVOsbRBMLEhsknGJRtQ7pT
 JItMbu5kxuCfcdjkHWW8t5zWdMF8GmVxYurvdplj7TO/LXTc6CRFvNPEe5U+AqhL0mUM
 UxxcrUJwZcqMyXTfHNMYUqI4ZhRxL/E0EqTOP4lhfkrSRA9HoJ63zflWRWIA7QczCRnv
 ezlWQ3qW3zpIZP9TPy9gRF0FwJEXDurGRpkKF1seLeZCyMFZ5BqD8pVDijF3/ONZ9Gct
 yxiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1770116429; x=1770721229;
 h=content-transfer-encoding:in-reply-to:cc:from:content-language
 :references:to:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=oQkZfToFq8BT06VP1uFHEcrlVvgBQYb05e9o8S8pTFg=;
 b=l/fNZ60IGjZQLDT3v4QEjfbPDxl+T2sHDAbNTaJW5/ezaj2cFCOmvFzwixGHKo/xw7
 hAzlN8NIW+YXLvFvbjzQcXp09gNHJr76QGj/AvTre8ZYcfFWs05/TGCDvXwqXpp0ndA+
 JU/OV9PVrqyC/h5wKzqWOqEQXsopVqTcQPji2ZsAsx7YjrajX5bLXFEeGHUNnxATeqKq
 auAajaRdHso7xEhUgA6ji5MMdEZi96Rm0HCHZcpZAk5dB/fptxuzNxVh0isLkMxdWjvc
 wJA2xcxZFyAcC7wTQ44ZEeutuz2FX/A58+9IA77WKvLbBSmD1CVuSZhYpl30JNCFltM9
 F78A==
X-Forwarded-Encrypted: i=1;
 AJvYcCXdjBlY9CRxGy9D33jVQbS/tJH9exJ1LQ/h64FBUoUbWeB67d7fc45clvnTcmuMik34X4ZtYElUh8o=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yyk2CUFa/RtrUMBGVit6OKLBJOJBSaw9NxejbXpSbcKMaNx66RZ
 LNla/AOkXB2JdnDPx4RpfGhRkSsWuPVmR8Lp7OVDmEK7lD1gSl+IuhHe+aBvyyeDyhAO5SKx/CF
 jrz6J6NcyQ0oRSnZHT3zgsJgYEzI9EMpydnpDaPYFwRIm8mhOkhh2Ou1HeC7OpkH9j2bAJek=
X-Gm-Gg: AZuq6aIB/GuRuYbbwl8gLxlxKw9ilLWVMmepZ1lbCXReSRNfuAgQm70NygYHl4MhClA
 /aG91WXyRBItfvEKxexpxg8F0DwBlukS8bvjEp+5o/I3uAXdCenhu72YojeKCwp7neCl8QZFfKw
 jLsRUX+AlGM3DThfUtbi0irwfOsO/ExKx/6lY7lzcEYoWx3/tt3TLNkQZAboqKvPNkXdYRHJu5g
 lmA3g5hUJiv7WhvyKIWd07usrYaAIhshnFByqxXHPbZ5OX6D8fBxftGDmUK7V2h+qhwFXAgr6JQ
 6oWr35KeP5YmIv1ckE/SOmCwDAaqzbZxyF0/+p+XZE9qiB1TKRRnD8VODSfA4qzw/EzLRYWZK/4
 baHSYE69cybOZ5CsaqrlgUwdXjulqIxx4yw==
X-Received: by 2002:a17:903:2ec8:b0:2a1:388c:ca63 with SMTP id
 d9443c01a7336-2a8d9919665mr138993185ad.31.1770116428363; 
 Tue, 03 Feb 2026 03:00:28 -0800 (PST)
X-Received: by 2002:a17:903:2ec8:b0:2a1:388c:ca63 with SMTP id
 d9443c01a7336-2a8d9919665mr138992885ad.31.1770116427866; 
 Tue, 03 Feb 2026 03:00:27 -0800 (PST)
Received: from [10.64.69.250] ([114.94.8.21]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2a88b4c3db4sm180801255ad.50.2026.02.03.03.00.23
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 03 Feb 2026 03:00:27 -0800 (PST)
Message-ID: <a7fc9f94-4a64-4e5f-8c9d-858e7e9df7f8@oss.qualcomm.com>
Date: Tue, 3 Feb 2026 19:00:17 +0800
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
 linux-arm-msm@vger.kernel.org,
 Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>,
 thierry.escande@linaro.org, abelvesa@kernel.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 quic_chennak@quicinc.com, stable@kernel.org
In-Reply-To: <2026020245-catalog-outburst-f805@gregkh>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjAzMDA4OCBTYWx0ZWRfX6PoW4KbMN1Kb
 x5GDPRSjGWDFUshS2uY09aDVso2sFXs0nJmYNCx4aAesCuc+VEiwzpGahlAkWwNIDOss2IWa3qr
 ydSDRLB/yVYrt9i6T6ko68lQWyPYatKM1GXuvhPxSTVw5la+f0di3ya3mcM/KP1Q6kf+ZtiE3md
 V2gJz1c5kc+4BYIaTJrcKamkk8tTgetwZNvG4Q553O0d1Oi1Yqo0zz/2gHmlOuD0F8dJm5m3eiu
 vpU4niiobKF9XoxhOx3qT1HijZLFAzGcDU//AlmNfcUw5zA/HxLJ3Rc85m3WwRjqo5QmtLXkayX
 mu+Vb2ZuKMx1wShW1V7R/X0mKCwZ1/CWIizao77VD3Jtr5pN6qg/FxlcK2we9I7/Jd//ygSdH4m
 7U+127Xs46YEwMpEet99/tpidiOOe5M5B9TcIdDJqNDh06RhowAatvhd8B0/TFl1aT9PCfIMahe
 7YuJqtLKQGDqwvf68Qw==
X-Proofpoint-ORIG-GUID: 6vk923NrZW8_qb9peyoonRkkL1YHqElc
X-Authority-Analysis: v=2.4 cv=L4sQguT8 c=1 sm=1 tr=0 ts=6981d54d cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=Uz3yg00KUFJ2y2WijEJ4bw==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=X5nBk1X44HCHp22wJVoA:9 a=QEXdDO2ut3YA:10 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-GUID: 6vk923NrZW8_qb9peyoonRkkL1YHqElc
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-03_03,2026-02-02_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 phishscore=0 malwarescore=0 spamscore=0 bulkscore=0
 clxscore=1015 priorityscore=1501 suspectscore=0 lowpriorityscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2601150000
 definitions=main-2602030088
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
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177];
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
X-Rspamd-Queue-Id: F3D4CD803C
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

[1]https://lore.kernel.org/all/c80c48a1-f1b6-4520-9d7c-3a83915c7717@oss.qualcomm.com/
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
You are correct, I will modify the commit text that caused the 
misunderstanding.
> 
> thanks,
> 
> greg k-h

