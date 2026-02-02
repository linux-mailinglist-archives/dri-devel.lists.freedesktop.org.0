Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SI0pKYBHgGkE5gIAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Mon, 02 Feb 2026 07:43:12 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E2ECC8E89
	for <lists+dri-devel@lfdr.de>; Mon, 02 Feb 2026 07:43:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A4E5610E176;
	Mon,  2 Feb 2026 06:43:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="Nu70XBL9";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="kth2N1Vd";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6538510E176
 for <dri-devel@lists.freedesktop.org>; Mon,  2 Feb 2026 06:43:08 +0000 (UTC)
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 611Lxx1N593872
 for <dri-devel@lists.freedesktop.org>; Mon, 2 Feb 2026 06:43:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 leBHcha+xx0Mjdv7gXom56khxN7YVJH9u22bC5K4cNk=; b=Nu70XBL9d6kaVyiy
 pvI352fi69qp3GEJDRWPOPmRuEp6CVB163B9BW9/l/2K6NsufX4q40tUnFP/V/+I
 EPhbeGeeLnSi2zj1wzp5QdBQFN/ndEm/D2m7SmFpEaooXm5VcsVE47wX0kVFSp76
 Ye7uMFCeladw6kpZItB+ygbogTR19oyQ9YwnJp5cIz3dWIKwHCUbQuwQWu3Jqzv9
 MRuMBlgT8bCnL13HV528BmT7DprY8UpErw+6SWvb0zS2Zjz6xR/t4KsoX+/jh+4b
 bmb1v33Py/7lP6610MLldkOwi+WtEAYw0FkBwq5kLpcj8zSmWfvr5qa+mR9t9UYC
 g4BF3A==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com
 [209.85.214.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4c1avx46vt-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Mon, 02 Feb 2026 06:43:07 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id
 d9443c01a7336-2a07fa318fdso42406825ad.0
 for <dri-devel@lists.freedesktop.org>; Sun, 01 Feb 2026 22:43:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1770014586; x=1770619386;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:in-reply-to:cc:from:content-language
 :references:to:subject:user-agent:mime-version:date:message-id:from
 :to:cc:subject:date:message-id:reply-to;
 bh=leBHcha+xx0Mjdv7gXom56khxN7YVJH9u22bC5K4cNk=;
 b=kth2N1VdcPeSFK7dq+UmlXHmhoUrF2fp0CGtCl5/eyxJ20m+moEjxYlDSLRIweiDe6
 QiGFu/UagtTOQj2Q7dtrXJU6URg/j6H2wchVAOwJxJ6DhNOp9IxP1sCwEpjvR9Vzwrcd
 EZKlVxVNXb8//ycnwO1uNNiFA9t73icvGrvKa02OZN+ruGAmBEZZ82q8Q6mrYntWypr1
 hWfS3KSu+Lb1JqikL4gztj5G6zDMrBZk16YQv3q0c9eGhgAbftcZD11e5OC9TmSuCvbw
 rlTRqi2A/hNtSUMU6eTRK+z9T7iNcpTovQvkMtcSLwp7c1AIPfu33NPxARAoNNeQMPKr
 8G9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1770014586; x=1770619386;
 h=content-transfer-encoding:in-reply-to:cc:from:content-language
 :references:to:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=leBHcha+xx0Mjdv7gXom56khxN7YVJH9u22bC5K4cNk=;
 b=KT1Ry+du6PgSR4zWAA9SS91W8WU8e3Ko0sTuyj2I14wN/+Gdj7l/c7G/TuJooljhFT
 Xb7FZr2KRFoDpYA2gm4elvvtQh/u9JiyKrHTIkhRiBwu4kS5AIl6HTlHMzAKIui7fR2G
 7R+ClpanH9b4AX68iegtZ1Sh1DUHwwzb7+7G5izYImmX6YsxK2x5NloLIvfnd7Dsi0g1
 DfCZvz27i/NU9WsecCt6QuDzhcB+/6QWAf/zeCLvfXRhRf68tAKqcWFZ4pDEfwSqJqio
 GS3XRlMWIo8PhPdSxFVoFc7V1jdsZgwwnkagPaTb0hKK4auAPVkWnRk3ArINhM4PiiP2
 3XMA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVhoLiIbBMdO06E3tBn+2wQR49yIoWfaG770G//xnYlsJGH+t1BcNQ11vAeuDd0Oje9QPBDKIh6T9w=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzmjoCckw7gctoqkkuFmAztHDsxW4jbBjdA/BZExB5gP0j3s0/c
 Vz36eSDoviMEWErt1R582W9cyIWj8O+TPzfZpMfjFfwoGDaXGgnLuo1g/IEwRI1ZLJb3e7ef3Ew
 zAnXZcCZy6WXXvfc5dC4QGkWWOkv95ExZTOJdChIeL/buf54LjO+F+/RdGTEirH7guhU/Zyg=
X-Gm-Gg: AZuq6aLDv3rqRVom6O3zsupiseUlMZ4wXSxdBRKyR5NF7xsFL1GYhIhdBXyt6rlOYGX
 IqOumUaK2btN9933GkJHkKXU8sirUULGs/C9oYjCtBQqfjpsGyxVpzQdGfkD2BN+dRS8gTRkVUk
 dqjptJhfZ1kTfIM9Z9EnM4loNn9vdnQAV3DrUYXG/XGRfvfOjgnvFWZxzr0Imd/4LaNwualvo9t
 Xct8OF15X+TtrLhz31TiC3dwv47vjR4Kh5QQBy7eoIXhb/pEzKZZmETWo2faTP1rQ7HyDEZvIhe
 6SXOiF+8zycaVXm14/DE8sr61og5YN7lc6yfOYNs4TGe1c/FTiUNMnatkD03Ox2G+9030nrQnaz
 57qUtA2BddopOr/ICLSv5sD9+aI1i3pfWBdqY407WCL64deeR6hU5luEih/BkEXFDICV5S/0ZqE
 5ezlmI
X-Received: by 2002:a17:903:1a2e:b0:2a7:cecb:9845 with SMTP id
 d9443c01a7336-2a8d9a51c32mr114092995ad.52.1770014586309; 
 Sun, 01 Feb 2026 22:43:06 -0800 (PST)
X-Received: by 2002:a17:903:1a2e:b0:2a7:cecb:9845 with SMTP id
 d9443c01a7336-2a8d9a51c32mr114092675ad.52.1770014585790; 
 Sun, 01 Feb 2026 22:43:05 -0800 (PST)
Received: from [10.133.33.100] (tpe-colo-wan-fw-bordernet.qualcomm.com.
 [103.229.16.4]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2a8b47f4717sm126072825ad.18.2026.02.01.22.43.02
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 01 Feb 2026 22:43:05 -0800 (PST)
Message-ID: <8b696463-ec6e-4671-8176-432add3b0e70@oss.qualcomm.com>
Date: Mon, 2 Feb 2026 14:42:59 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/4] misc: fastrpc: Fix initial memory allocation for
 Audio PD memory pool
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
References: <20260115082851.570-1-jianping.li@oss.qualcomm.com>
 <20260115082851.570-3-jianping.li@oss.qualcomm.com>
 <gfi4s3wn6ssmq2242ws5fduz7s46lrb3wgzvyn3y5djpdqtkqj@v4c5knprxotm>
Content-Language: en-US
From: Jianping <jianping.li@oss.qualcomm.com>
Cc: srini@kernel.org, amahesh@qti.qualcomm.com, arnd@arndb.de,
 gregkh@linuxfoundation.org, linux-arm-msm@vger.kernel.org,
 Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>,
 thierry.escande@linaro.org, abelvesa@kernel.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 quic_chennak@quicinc.com, stable@kernel.org
In-Reply-To: <gfi4s3wn6ssmq2242ws5fduz7s46lrb3wgzvyn3y5djpdqtkqj@v4c5knprxotm>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: tqGlmKJgPk0Zt-A4PMk8D_Dm-6-Sd9JC
X-Proofpoint-GUID: tqGlmKJgPk0Zt-A4PMk8D_Dm-6-Sd9JC
X-Authority-Analysis: v=2.4 cv=P4w3RyAu c=1 sm=1 tr=0 ts=6980477b cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8
 a=5IayI-uhQhADWBiAsg0A:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjAyMDA1NiBTYWx0ZWRfXzP7PZUFy2oKV
 mIWtMj4f/DNyrwz+hGiG3oH/rQjcZZF1c9cnbsSB7U3U90OQhYEPZARGxGoxvgb/Te9jkrjvEXw
 2yE6jEKWJeFUBlHE9cI+6Ijv0z9tecOi5MJDus4Iez4ctA/qn3g0yGe7u0JY+l6jdvZUSXgHr3C
 CuR+pR3USz5GdI4iOWfP7RaOociphuQ9taJBKGCSD4a7DKM0C1qF6akjhqy8a2BD5u6pb3A90q+
 MyHhUVNxx5dbwLVfbXE2K2VS59yu75v4UmIUPNEFyEFx3nqiPkmjj7WumCpCxjPIqfF24/8H4cB
 c+oIC8Uz/BW49k2PRE/8nkwRcAr2RhIrU3hILxOCJTKEjwtTHe9ZMjQakir3873xiPW+Z0YtdzX
 ZSv6z+Kph7IYB2llT2/gORgsCYjljA9sINBW/DeZVpkcpWl7UW8eng+EiNncvk50L/6f8vOPFMG
 /9fauEaRjABqiv3EZvg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-02_02,2026-01-30_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 phishscore=0 lowpriorityscore=0 adultscore=0
 priorityscore=1501 impostorscore=0 suspectscore=0 spamscore=0 clxscore=1015
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2601150000
 definitions=main-2602020056
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
	FORGED_RECIPIENTS(0.00)[m:dmitry.baryshkov@oss.qualcomm.com,m:srini@kernel.org,m:amahesh@qti.qualcomm.com,m:arnd@arndb.de,m:gregkh@linuxfoundation.org,m:linux-arm-msm@vger.kernel.org,m:ekansh.gupta@oss.qualcomm.com,m:thierry.escande@linaro.org,m:abelvesa@kernel.org,m:linux-kernel@vger.kernel.org,m:quic_chennak@quicinc.com,m:stable@kernel.org,s:lists@lfdr.de];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,oss.qualcomm.com:mid,oss.qualcomm.com:dkim,qualcomm.com:email,qualcomm.com:dkim]
X-Rspamd-Queue-Id: 0E2ECC8E89
X-Rspamd-Action: no action



On 1/16/2026 4:45 AM, Dmitry Baryshkov wrote:
> On Thu, Jan 15, 2026 at 04:28:49PM +0800, Jianping Li wrote:
>> From: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
>>
>> The initially allocated memory is not properly included in the pool,
>> leading to potential issues with memory management. The issue is
> 
> Define "properly" and be more explicit about "potential issues". Please
> be more precise in commit messages.
By “properly” I mean that the initially allocated buffer is supposed to 
be added into the Audio PD memory pool by setting pageslen accordingly.

With pageslen = 0, this buffer is never registered and therefore never 
becomes part of the pool.
I will drop the vague wording and describe the exact problem.
> 
>> actually a memory leak because the initial memory is never used by
> 
> Why is it not used?
Because pageslen = 0 indicates that no pages are provided.

As a result, Audio PD immediately issues a remote heap request, ignoring 
the initially allocated memory entirely.

That initial buffer becomes unreachable and is effectively leaked.
> 
>> Audio PD. It will immediately make a remote heap request as no memory is
> 
> Ok, you've described one issue. Beforehand it was "issues". Are there
> any others? if not, please drop the "potential issues" part.
There are no additional issues beyond the memory leak caused by the 
unused initial buffer.

I will remove the “potential issues” phrasing and state explicitly that 
the problem is a memory leak due to the initial buffer never being added 
to the pool.
> 
>> added to the pool initially. Set the number of pages to one to ensure
>> that the initially allocated memory is correctly added to the Audio PD
>> memory pool.
>>
>> Fixes: 0871561055e66 ("misc: fastrpc: Add support for audiopd")
>> Cc: stable@kernel.org
>> Co-developed-by: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
>> Signed-off-by: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
>> Signed-off-by: Jianping Li <jianping.li@oss.qualcomm.com>
>> ---
>>   drivers/misc/fastrpc.c | 8 ++++----
>>   1 file changed, 4 insertions(+), 4 deletions(-)
>>
> 
> The patch  LGTM.
> 

