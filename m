Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4IpzDVdFgGkE5gIAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Mon, 02 Feb 2026 07:33:59 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 92792C8CE8
	for <lists+dri-devel@lfdr.de>; Mon, 02 Feb 2026 07:33:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C322110E267;
	Mon,  2 Feb 2026 06:33:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="b/whkhJQ";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="BiduI80e";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A3A0910E267
 for <dri-devel@lists.freedesktop.org>; Mon,  2 Feb 2026 06:33:55 +0000 (UTC)
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 611NuIhM721506
 for <dri-devel@lists.freedesktop.org>; Mon, 2 Feb 2026 06:33:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 SmudMRzI4gMTA4iimv99L9nomB2MGIhNGyeIOMqavVQ=; b=b/whkhJQ/csK2XSk
 dp69c0L3RKpWtoiQOYci4aoVNd0WplVf6npNfxyeHyTHIns1Li0UatUe+1ApAWTJ
 lZqQzUvM0iSobXYymulYseDqiGanKI26KD+zrA8y85d6swR1RHtcXHNInECiSAw9
 Ad8Dg1r3YRbTpLWeoeFT6q0O7dxf4C7okk2UFovm9hgxZh4ZBycsEBpmhojVueLU
 dCGZlrhiDH9iKFkqc5lT0Y2hX3kQxa7Sl/CfngiBxIvLiwI7zxVPwwLW7xlUl2qF
 NPNswd4CVwwyO5dZwFEpKpB3bLAzIY8WEg5qgaMjchGy5yIbKImD7tQm3Hr1QamG
 eGJFMg==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com
 [209.85.216.71])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4c1arec6nf-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Mon, 02 Feb 2026 06:33:54 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id
 98e67ed59e1d1-34c314af2d4so3135271a91.3
 for <dri-devel@lists.freedesktop.org>; Sun, 01 Feb 2026 22:33:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1770014033; x=1770618833;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:in-reply-to:from:cc:content-language
 :references:to:subject:user-agent:mime-version:date:message-id:from
 :to:cc:subject:date:message-id:reply-to;
 bh=SmudMRzI4gMTA4iimv99L9nomB2MGIhNGyeIOMqavVQ=;
 b=BiduI80egx3Zl3EIPNii9P/+WzTmPQhFLB4lketFxBUjGHU5vapsZsu8aCWfIeVf7n
 hbhL9gSQ6aDGOj3iTaeM2lbM1lr+Fj2/TV/2fWUdiUv+XH6eMBadgcVG4XFx1B5tKiFa
 3oQDqWw+rnQojbRcUS+TGzuG1NQBiuVJd7ECHZt70yZ9s/+LKDBzRqdndX8XVzNhj14R
 8LeWjMI7U2MY4GNQvAKPRwBpwUjd3LZP7Y/qq0pn5ThVK5S7A7B6ZFaDbgAKxDOhQ4WP
 0/gANA1OLDIgLOSH6QVFNK77+2UP71HGhAH4WhXlH4Q+NPcRHHd2FDoxksJK743Ol8PC
 D03Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1770014033; x=1770618833;
 h=content-transfer-encoding:in-reply-to:from:cc:content-language
 :references:to:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=SmudMRzI4gMTA4iimv99L9nomB2MGIhNGyeIOMqavVQ=;
 b=X7C6WudkVnDauQaxixVVQ2YbmkwTNdOuktD1tLQ/GoSzW25I41x8LJKDStzT4dRPgD
 x1AlCHY+8lO5iqbC4VAtP7bvdd2xjf1kQg3JtCyy0EEYhxuNIysr3nHziu4TgOLlh5r1
 +mJ8BwQ7LO1MbZ+nj34aof7mAuAES6L/nhh3bNd3K6fG5MG0e/mT7OT8ZiX9pOMiZoIc
 zeuetpumvm60WdWwphzg9urGU54bVbK7Bb/6n+w5ZulAMecmFe0WK7LF1q3a84lh1UY1
 v6QzyeLk58eT/olplPQ2PRSGO6w7PEpXjXWo0ohQxe3tvcaBD4P/Ki3IRPd+uIv4a9Fo
 Fp5Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCXXCNegJkN4cl5nDXfwPMhrgLQo2xlSk1+6RzwLVY1NBDO3sjEpwfdnKqeIjoj1hcYsc5kthszNl5c=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxTCKwrs3F2gZjmsaEn56A/pXHzLbY0l24NdJ4oXrC3lfCrtUZU
 Z2txwkIgwd/7CDJFZtCZYIZHmPAANQFs+5jSwh3Yoa5qkm0lLdLdIeZSg8Mx1USVlYPVcv60B6q
 2Xlx1l/k5AZIr0U+q4zt5Wj7czbb6NqX9B3Zbqr9PoQJSjNfWgBo0oK/pkONd/KWp9ZK16o6hjr
 uelb0=
X-Gm-Gg: AZuq6aK3MxqOCFH8gatlwwOHzoNXdQlhNqUGrDRT8Y8gQhqEdLoSOmEUKda8lHKJSuV
 k0diEMgFjc17hkQPpAGfB96PgTjVcLUc7fv/aOi53NGnoHJWqcTz6kWqmUfhupJMhWxorgQB0DG
 I7ebYgtsSZw40um+lOWl0+84LsA3tPSNhCQPx33dpzWnTuW8FN0sNfIzRa3KfzCxBMwCi0G8J/j
 1cBlPflpqrjtLObdPcbobbZlVloH+GrY5V6YypSLMFv5y8+ga3NMjUhIpDIJWgHFTjNa7CnH/gX
 GYXlHuvcoKPtv1HFSWSSyimCnbaK+NTPBnQvEdU/hbt2WzSts14sWA+O5hCtYw82L9br6vLFUVn
 7QZmo4QoHgZQi7+iECQmLeUeo//1TVlIksHaLnYUZfCuudZMFlzcdu+JWH5Yfet86Gpkt24fWBb
 2BpPoJ
X-Received: by 2002:a05:6300:404c:b0:38d:e87c:48c2 with SMTP id
 adf61e73a8af0-392e015baabmr10217883637.58.1770014033355; 
 Sun, 01 Feb 2026 22:33:53 -0800 (PST)
X-Received: by 2002:a05:6300:404c:b0:38d:e87c:48c2 with SMTP id
 adf61e73a8af0-392e015baabmr10217852637.58.1770014032879; 
 Sun, 01 Feb 2026 22:33:52 -0800 (PST)
Received: from [10.133.33.100] (tpe-colo-wan-fw-bordernet.qualcomm.com.
 [103.229.16.4]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2a88b4c3d2bsm143216935ad.53.2026.02.01.22.33.49
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 01 Feb 2026 22:33:52 -0800 (PST)
Message-ID: <9572d8a9-de90-45ca-903c-a11bc69d0213@oss.qualcomm.com>
Date: Mon, 2 Feb 2026 14:33:45 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/4] misc: fastrpc: Add NULL check to fastrpc_buf_free
 to prevent crash
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
References: <20260115082851.570-1-jianping.li@oss.qualcomm.com>
 <20260115082851.570-2-jianping.li@oss.qualcomm.com>
 <6usjefc55acdchitwe3usqtkr6ca4rtaen3at5knwygakdkze7@caqxdadvnz44>
Content-Language: en-US
Cc: srini@kernel.org, amahesh@qti.qualcomm.com, arnd@arndb.de,
 gregkh@linuxfoundation.org, linux-arm-msm@vger.kernel.org,
 thierry.escande@linaro.org, abelvesa@kernel.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>, quic_chennak@quicinc.com,
 stable@kernel.org
From: Jianping <jianping.li@oss.qualcomm.com>
In-Reply-To: <6usjefc55acdchitwe3usqtkr6ca4rtaen3at5knwygakdkze7@caqxdadvnz44>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=NNfYOk6g c=1 sm=1 tr=0 ts=69804552 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8
 a=erMO1dRUYXsmLKenB8oA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-GUID: kcT093zDSuhGI_CbGawBMOfprv_UiuzR
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjAyMDA1NSBTYWx0ZWRfX48pEHG4uJPt4
 tOApGT/y8b1jRwil1IdMxU2JePl3pwe5xO5n9AEsivx3ui0Klb7ffmdzU0TN1k+UV5d/AF5c1WJ
 pCuSwPnvaKC2teUACGIGBomZittfbMx3Ci7bPRu8ZM5VxLqcc2Nct574NQWQqG7OxWcWmgo1Voe
 p1u/xqtQ3+el9iZTWjY4tVqk65EdMQ2bFYFkZ2Vg46o4kDMndxtN+wuSp62tX2/jyMMWVjYZ/J5
 ohjGV7JvWGzm/69JzM79gvE7kA6uTiNzInfIzmcJiaS48Nb4wSbj8vbwlvlLOxM3v6Mpwlkvfdz
 2IjovU7qVkr6cEYxZablj1TCoUuJ3TTVrXhNGspIwvtp0tFG5sju72UzlF0C9Kz+rIWEZS2sn8+
 v79dquAEUTKTl8iPOm9cO7sG2zJ0UVtuAWhylTPF0NcgXYrmitjYL7nP7nnPn9TIrYtZZG9zgNg
 fQVTYmKv3rGeewbyWYw==
X-Proofpoint-ORIG-GUID: kcT093zDSuhGI_CbGawBMOfprv_UiuzR
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-02_02,2026-01-30_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 lowpriorityscore=0 adultscore=0 priorityscore=1501
 clxscore=1015 suspectscore=0 spamscore=0 phishscore=0 bulkscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2601150000
 definitions=main-2602020055
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
	FORGED_RECIPIENTS(0.00)[m:dmitry.baryshkov@oss.qualcomm.com,m:srini@kernel.org,m:amahesh@qti.qualcomm.com,m:arnd@arndb.de,m:gregkh@linuxfoundation.org,m:linux-arm-msm@vger.kernel.org,m:thierry.escande@linaro.org,m:abelvesa@kernel.org,m:linux-kernel@vger.kernel.org,m:ekansh.gupta@oss.qualcomm.com,m:quic_chennak@quicinc.com,m:stable@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[jianping.li@oss.qualcomm.com,dri-devel-bounces@lists.freedesktop.org];
	RCPT_COUNT_TWELVE(0.00)[13];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:mid,oss.qualcomm.com:dkim,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,qualcomm.com:email,qualcomm.com:dkim]
X-Rspamd-Queue-Id: 92792C8CE8
X-Rspamd-Action: no action



On 1/16/2026 4:43 AM, Dmitry Baryshkov wrote:
> On Thu, Jan 15, 2026 at 04:28:48PM +0800, Jianping Li wrote:
>> From: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
>>
>> The fastrpc_buf_free function currently does not handle the case where
>> the input buffer pointer (buf) is NULL. This can lead to a null pointer
>> dereference, causing a crash or undefined behavior when the function
>> attempts to access members of the buf structure. Add a NULL check to
>> ensure safe handling of NULL pointers and prevent potential crashes.
> 
> When does it happen? Do you have a backtrace or is it a safety coding?
> Do you pass NULL buffer pointers to the function?
Thanks, Dmitry.
Yes, this change is mainly for safety‑coding purposes.

This is reachable on during remove/deinit sequences when a buffer was 
never allocated or allocation failed part‑way and cleanup proceeds.

It's a saftety coding: to eliminate NULL checks on the caller side, as 
we do in a lot of other kernel API.

At the same time, there is a possibility that this buffer passes NULL, 
and during verification, this can cause the kernel to crash.

The patch makes fastrpc_buf_free() NULL‑tolerant and simplifies callers 
by removing duplicated if (ptr) checks, reducing the chance of future 
omissions.
> 
>>
>> Fixes: c68cfb718c8f9 ("misc: fastrpc: Add support for context Invoke method")
>> Cc: stable@kernel.org
>> Co-developed-by: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
>> Signed-off-by: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
>> Signed-off-by: Jianping Li <jianping.li@oss.qualcomm.com>
>> ---
>>   drivers/misc/fastrpc.c | 12 ++++++------
>>   1 file changed, 6 insertions(+), 6 deletions(-)
>>
> 

