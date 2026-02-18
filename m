Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +JhBAO/OlWnjUwIAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Wed, 18 Feb 2026 15:38:39 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2545615719F
	for <lists+dri-devel@lfdr.de>; Wed, 18 Feb 2026 15:38:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EB45310E5C6;
	Wed, 18 Feb 2026 14:38:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="Pgitkos0";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="QM9k8kWw";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9E51B10E5C6
 for <dri-devel@lists.freedesktop.org>; Wed, 18 Feb 2026 14:38:33 +0000 (UTC)
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 61I5OURF4024971
 for <dri-devel@lists.freedesktop.org>; Wed, 18 Feb 2026 14:38:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 WH1nlO52NiOo/le5purWnObw/9prSk/Tj9AQuM4+OCw=; b=Pgitkos0R+Ukh3CH
 zon02hkMtAfJAK2tDb0BrcWHvlTd0qmrE/GbRo/oOHR7X3VKfTe8OO/6Hmnj6vnT
 ajsm877NO6d7EdrEWU7zPMQ6i5bOxLiTgw7HD33l+zJ0DTTyae6twW+TPKCOKP/i
 N8f60N91m2UIliHdgFmQW7D53a4T9fHXu1dlzPtahuZ3QfoIy1UVjYj8FGKx+kzp
 eLKjJNtP5bXSGUE7BBrKecNQ9WfQlQQxV4m1rLEcUQEc8dTgFptsV008p9uEr7+8
 K97XZAljV6W1vV2A3YeY6LOrw3gIVe3hSCfZaCxzBuRF9oIIwjxHgXarmQXG1ufK
 V8cDRw==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com
 [209.85.222.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cd78c1bq7-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Wed, 18 Feb 2026 14:38:32 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id
 af79cd13be357-8c710279d57so403470385a.3
 for <dri-devel@lists.freedesktop.org>; Wed, 18 Feb 2026 06:38:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1771425512; x=1772030312;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=WH1nlO52NiOo/le5purWnObw/9prSk/Tj9AQuM4+OCw=;
 b=QM9k8kWwBgmclmNOpe0IcqZmQ1LhGYbTlvDxiDNShnIjBkjyP0lAOQWJQixeXQGBOv
 KubDFY5llT5No+icKlBeUN3QyMeZ6ZBIgyWz3FgICkOUwxakt1isKT9K1xQlD8TcX7wU
 c5+7GjHkN0vfBjhsBfEu361B+NZqgOR4nlFBNMz58qqvNjK4tb8+T1sJG44Wksvl6yOr
 3MXwbJjxE+kPH38FRPvCl8qglRiveh2EuxwTXdGgItRx4szIm35k+X9m7Uocqx9tcIGN
 nxXf28aj+SXaYTGvotxne3f8R88J/u5Yb+yUqqelbetJaqklQdeyp7Nxo0vSKe/wK2Te
 vnlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1771425512; x=1772030312;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=WH1nlO52NiOo/le5purWnObw/9prSk/Tj9AQuM4+OCw=;
 b=UlqLysl6YurVyd08al4J05Kxa+Jd+LazJgHnqKXs5aovPYkM/BP2WlQVED8tZ8+/hI
 99R/86XDOxibVT0DYP94+uNNu5eYl//x0dqTf22Z0rfUevfv9zIhxQEd0gg0aNUIOV4D
 Ujzf+augYdhtQ8PfyQCqrWe8aNxTmqO0RI889zpeuFJ+9vY/lqkGLajddQoCMwSGrC+p
 fUTw1hbJyj2AmcchjSdfsUzbK+QYaYHS4LOnwQdIVoaLQDtnWyzDDZ35TdIQyV4TGbTX
 v9kn8Os/r1t0/y6uG3dg4H4kFfMD0aEDBUxkD9sa60TGUVbCCjDmNCN3JE7kRgq/2Xyb
 PA5w==
X-Forwarded-Encrypted: i=1;
 AJvYcCUfxqp1v1ixF0YJniWxkrJP3PeBYmS5wboW//46/NeEGByKc1ujKxZfNW7aP6LSkJm3JY8DC1vCHt8=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyvrT2ehZkX41Hr1CPwsw2MW9IYXU6vTLT8Q7rE1GD7hM9X2Gyp
 09H6a41qkE5eIf7uH7vFAxMB2L42Q4w5KkDkfEWcjObVbUT/Jd3KBSMQqqIo576EZYL2sCp0w7V
 BoB5qkp7LhmFbT81vNwwir+Bj58VvY9haQEG+ztJpfZXLNjFkj98TzgMV2zPaqHo1G1A5l7s=
X-Gm-Gg: AZuq6aKXaOsT6i4D5WVf2GZn1hNGDqLSDlXYIZzalM/YvsavBAAmMGOYtzUs8jGPcMY
 h/myzmc7tPkSJ1gMCXJkibRzp4W0ZjNn3ngYnigPypbtQM2TYHnSIoDDkTDOh5bcWPkmMj8M2Sw
 KpctAFfZaeHoU3lPLNvb23zxy7iBjbb5JddO6EoYn9KVIwHL4h/Thv74asB/Uafc7jKaf+GpGop
 AmAycqELD8wi/8tgPHqgl+NI8cSwQ0L5F+p4vhyYwqCmO6/T7v84QbpZ6Aq6hVxaLXKqHZFRi1J
 pGAV3QasPxteTh7qCHYtq9+110b2HESqGJ3RoKh59CRJ78HG91go/nPskR5pNuiEymsPmmqVbEN
 pkSU6GW906co0VqSvu/vRUMEORkF+oVGh4R2uZxUNAEsBJiPlWRlnor+BZiNEbNWzEUQOtmrlai
 xnnyVDT9zhNzGUvA==
X-Received: by 2002:a05:620a:4410:b0:8c0:cec5:148c with SMTP id
 af79cd13be357-8cb4090644dmr1660825685a.11.1771425511632; 
 Wed, 18 Feb 2026 06:38:31 -0800 (PST)
X-Received: by 2002:a05:620a:4410:b0:8c0:cec5:148c with SMTP id
 af79cd13be357-8cb4090644dmr1660821885a.11.1771425511092; 
 Wed, 18 Feb 2026 06:38:31 -0800 (PST)
Received: from [192.168.0.242] (078088045245.garwolin.vectranet.pl.
 [78.88.45.245]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b8fc7665345sm459517566b.53.2026.02.18.06.38.29
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 18 Feb 2026 06:38:30 -0800 (PST)
Message-ID: <81faa130-b497-4248-a6c6-7c421646451a@oss.qualcomm.com>
Date: Wed, 18 Feb 2026 15:38:28 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 4/4] misc: fastrpc: Add polling mode support for
 fastRPC driver
To: Bjorn Andersson <andersson@kernel.org>,
 Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
Cc: srini@kernel.org, linux-arm-msm@vger.kernel.org,
 gregkh@linuxfoundation.org, quic_bkumar@quicinc.com,
 linux-kernel@vger.kernel.org, quic_chennak@quicinc.com,
 dri-devel@lists.freedesktop.org, arnd@arndb.de,
 dmitry.baryshkov@oss.qualcomm.com
References: <20260215182136.3995111-1-ekansh.gupta@oss.qualcomm.com>
 <20260215182136.3995111-5-ekansh.gupta@oss.qualcomm.com>
 <wipphezpxtuuxtwhpwamsmvhwgwuesexmy5ev5pcqb65vov5kz@vuzzyyqnu7ci>
 <1707a83d-d717-43b7-b450-90f8400a65fb@oss.qualcomm.com>
 <lkwod3c3mubtcthy63aneumxq77lfik4nywi5oxjhnc3lmdk4s@eaygdb5vwlr3>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <lkwod3c3mubtcthy63aneumxq77lfik4nywi5oxjhnc3lmdk4s@eaygdb5vwlr3>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: 4SxsAWzpPHZ_Zk8ZkMczXWvRNF5iTqIl
X-Proofpoint-ORIG-GUID: 4SxsAWzpPHZ_Zk8ZkMczXWvRNF5iTqIl
X-Authority-Analysis: v=2.4 cv=P5k3RyAu c=1 sm=1 tr=0 ts=6995cee8 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Mpw57Om8IfrbqaoTuvik:22 a=GgsMoib0sEa3-_RKJdDe:22
 a=PCWUlEzcUK1kj1-k8vkA:9 a=QEXdDO2ut3YA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjE4MDEyNCBTYWx0ZWRfX2tFQCYzIQV9h
 wLFjPvqK1FnZr82xBx+P2MBB2jGYba7gSBwpDYXvbacHJmIPAM65m0kXJOmXVD8nDhQWMRsVAXV
 Lod7WUfKIYDV5i/XIzIu8sXD7p4KWv1hoF/V7YTsE4D8wuFDqPOXahKdyUAE+oBubUOqUSLlJK9
 bQM2TTTn5clNQHtuUuDJAeLWF/7zEuU1wDL8rTzTcyTW3CGb15VHgaKBJg7QJUiJR0u89CBP6iA
 AwZJV+cCZUjwVZ2c10RfBFa8tfrzrFhZcKbti2TOF+1fWfIjuJJsVz75CCb9RssNGLc26gvRQlW
 2aHAW+mRpmr+ISWaXq1AWVftlxU8uTBuC6d76KvShdjGAhNqtAN22Xx//wP+K93cQSCKz6l+ev0
 Y5nE/xkBPj4soTe4a/u6ODdp+tkow4wvnCRqz87SBTiLhxrgfDbvXID7bIYqITCansiB0dbwZqF
 VZau/6aKwJQDL7u7Htg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-18_02,2026-02-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 phishscore=0 lowpriorityscore=0 clxscore=1015 impostorscore=0
 bulkscore=0 spamscore=0 suspectscore=0 priorityscore=1501 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2602180124
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
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:andersson@kernel.org,m:ekansh.gupta@oss.qualcomm.com,m:srini@kernel.org,m:linux-arm-msm@vger.kernel.org,m:gregkh@linuxfoundation.org,m:quic_bkumar@quicinc.com,m:linux-kernel@vger.kernel.org,m:quic_chennak@quicinc.com,m:arnd@arndb.de,m:dmitry.baryshkov@oss.qualcomm.com,s:lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER(0.00)[konrad.dybcio@oss.qualcomm.com,dri-devel-bounces@lists.freedesktop.org];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,dri-devel-bounces@lists.freedesktop.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,oss.qualcomm.com:mid,oss.qualcomm.com:dkim,qualcomm.com:dkim]
X-Rspamd-Queue-Id: 2545615719F
X-Rspamd-Action: no action



On 18-Feb-26 15:36, Bjorn Andersson wrote:
> On Mon, Feb 16, 2026 at 02:36:40PM +0530, Ekansh Gupta wrote:
>> On 2/16/2026 8:51 AM, Bjorn Andersson wrote:
>>> On Sun, Feb 15, 2026 at 11:51:35PM +0530, Ekansh Gupta wrote:
>>>> @@ -1812,6 +1912,30 @@ static int fastrpc_get_info_from_kernel(struct fastrpc_ioctl_capability *cap,
>>>>  	return 0;
>>>>  }
>>>>  
>>>> +static int fastrpc_set_option(struct fastrpc_user *fl, char __user *argp)
>>>> +{
>>>> +	struct fastrpc_ioctl_set_option opt = {0};
>>>> +	int i;
>>>> +
>>>> +	if (copy_from_user(&opt, argp, sizeof(opt)))
>>>> +		return -EFAULT;
>>>> +
>>>> +	for (i = 0; i < ARRAY_SIZE(opt.reserved); i++) {
>>>> +		if (opt.reserved[i] != 0)
>>>> +			return -EINVAL;
>>>> +	}
>>>> +
>>>> +	if (opt.req != FASTRPC_POLL_MODE)
>>>> +		return -EINVAL;
>>>> +
>>>> +	if (opt.value)
>>> Would it make sense to allow the caller to affect the poll timeout using
>>> the other 31 bits of this value?
>> I was planning to bring that control[1], but it's might be difficult for the caller
>>
> 
> Skimming through the thread, it seems you're discussing how to determine
> if the DSP supports polling or not; that sounds like a separate problem
> in my view. Not sure if you settled that discussion, but couldn't that
> be handled through FASTRPC_IOCTL_GET_DSP_INFO?
> 
> I assume though, this would be subject to firmware changes. How do you
> determine downstream if polling should be used or not today?
> 
> 
> For my specific question here, I'm merely wondering if the timeout value
> should be a boolean or have a unit. We could punt on that question, to
> not block this feature from making progress upstream, by defining that
> only 0 and 1 are valid values today (all other result in -EINVAL).
> 
> This would leave the door open for having 0 == off, 1 == default, > 1

Giving '1' a special non-numerical meaning sounds odd.. maybe 0:default,
-1:off (or the opposite)?

Konrad
