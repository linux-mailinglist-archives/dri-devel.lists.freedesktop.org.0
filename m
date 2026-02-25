Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WCcaJU+Dn2lrcgQAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Thu, 26 Feb 2026 00:18:39 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E23A419EB22
	for <lists+dri-devel@lfdr.de>; Thu, 26 Feb 2026 00:18:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CFEC710E037;
	Wed, 25 Feb 2026 23:18:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="JpmL+CkW";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="QQEdwGtt";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0756710E070
 for <dri-devel@lists.freedesktop.org>; Wed, 25 Feb 2026 23:18:33 +0000 (UTC)
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 61PN3bhJ3095062
 for <dri-devel@lists.freedesktop.org>; Wed, 25 Feb 2026 23:18:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 k1ncu6ArYzJhC1oWtoKaTbf490HS3AonBnLenM3Jd0c=; b=JpmL+CkWYUP0rhkq
 yvcnpyP/EsHfwQoW0K88N1JAwbxTi+LLkZjH9DnYvIiobtYH5J/g8+9NO85fBMy2
 kviXPZxgDBjU9X/GvP4DBmN+EQ3kZmoyKjP7w6eVnJVJzNDhRfpq2IsfE81WQkuh
 SqGKaB0hOvmonmXYz8t/bTRs9L/qyP0J6vhfIpk7hwpr4X/Oa++bWNC8h1FEQnM0
 aRUSD8losKzsY6bDy0GwTFFfO5k1NBw/RQLoC5/2zk+aY+Gn89MIwAMaa4NJeH2v
 SO1uWYK0vdnDIr369SYLjwZ1kJxo32PT1fieroRk0aGGqmVEoRy2LpCjqL1JCwzX
 OLvqSw==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com
 [74.125.82.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cjae0r0xr-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Wed, 25 Feb 2026 23:18:32 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id
 5a478bee46e88-2bd3bf5dde4so208228eec.1
 for <dri-devel@lists.freedesktop.org>; Wed, 25 Feb 2026 15:18:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1772061512; x=1772666312;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=k1ncu6ArYzJhC1oWtoKaTbf490HS3AonBnLenM3Jd0c=;
 b=QQEdwGttGIqMG2KwQ37WVjtL6RCOWCW5nnrmN8ymUyRzrLeRw1RrTgLbaVaCEMLcY9
 ZThm5wmqKZoS+mz+h2qzPKQnOyyT/spBKnwBZcqCD955poJHTRKBQq3WEacGzuojhp/Q
 sQkCeaZsaObE1f5jGTY9iqf7LYwvux7jMneP6Mf4l7ev0lZM6zelq85CYC1LkUSSyaxm
 dAuIGIZWpEHj5YplnTC2RX9/L1tsmfLMqmsJ3+QsEuyh3pMwBzOrt1hiOgf+1zGi/4i5
 e0g49tdWRvySfe02tcdAMaVslK3r8pHqESRtn18XjeDoM4GwMUWUsEiNO3dqgtfSPqpv
 aHyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1772061512; x=1772666312;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=k1ncu6ArYzJhC1oWtoKaTbf490HS3AonBnLenM3Jd0c=;
 b=O/0H/8H7iyz8FeV/xVbsUkOD7+bghB+nRL+nB8UKf3gAzXagktCA0ESFAfaDG1lPjo
 bBd5TN6/gpVcgFVlJQQ3chc29JAW8YVgOVIdOGdHwr1BcYCTp6upaRrE/BPztdl8Q+ko
 UMCwklvRZT394EMc7Xp0VmFWOk9kI6NJZqUX9Z7/aVzw9DcpiaL7hihCxKKKitm/giT2
 0HfHi90V+Uyxsq7bgAOTpFc2OqKY94Mmz7NRIK1XSea1X+LVRCoPmY+37Fza/rIulYs7
 CGyNXE1+VpD08456N9UOK1qypaouh1up5fupD7L6jN7MqLJ6uhM0QPtFU5nfu7mroYoR
 sC3w==
X-Forwarded-Encrypted: i=1;
 AJvYcCXMvOAnuvBQdT1I2Ta53OLMfFa1oOJk9Lw1lubGZzKwlP1TVBJMTjYKbG/DIZvJVQmqnfNNpGWBIP8=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyAy9Ro6x8wu5LyUzaLKN5aqUNnAj/RS/12XL7FMKUsHRwrU6mx
 /61v+PG1ks+MlIxkIWKEi/VdeZi/6mmo2+V/YkllVWTqf14IoQFe5jF+sOE9zXTb+Eg3YTsUTIP
 w0hSzMBNIkt3FUov8JkPEZqtAJafLin1AWrbWk6SYIebU05+qQ0jMov1WIPRAXg6WQk48uDY=
X-Gm-Gg: ATEYQzyx/ZK/QGnx9pRU4kLGzyS9nVBrgmo0SV9wAdFUkt1QZfzlcM9Vt3nwjKxWiRH
 oSLwT+dPyXvVbzocFviDM4jk/KqdjfuA0O4LV+/LL8CRqsad8HTdIUxolUaP2xKtiwkqn08sOs3
 hSNhrq9WVb6sU5Odd9ZbLRo5HyXvVnwRcNqhIJO3xfxwiBZTcggWmS7C0uifpQicccxAa28j+C/
 2ZqD7va2Ac4Zp35UaoGomjSmZYF0toYmsFNAwjnXFFcYoUf0qVZyXVaR/p4Uw2IN7l1uTf+j5+m
 vEzSpmSYRVDRAI/KwgO0et5JpXi7/iRLmf51FWKVRq7oPO7V/FW4JLpQ/bkv1Y+jEtk5lg+JXEB
 aGFWI0ZmzXl+AVhClGFZ2jm8UuHYvo5ZvfpJOHxHhj2B4ur8Jb4ftTouV9HIBmvl8rIo9Xj6cWi
 jhClkf
X-Received: by 2002:a05:7300:538e:b0:2b7:1abc:a6eb with SMTP id
 5a478bee46e88-2bdcbf4440dmr892764eec.7.1772061511632; 
 Wed, 25 Feb 2026 15:18:31 -0800 (PST)
X-Received: by 2002:a05:7300:538e:b0:2b7:1abc:a6eb with SMTP id
 5a478bee46e88-2bdcbf4440dmr892750eec.7.1772061510969; 
 Wed, 25 Feb 2026 15:18:30 -0800 (PST)
Received: from [10.134.65.116] (i-global254.qualcomm.com. [199.106.103.254])
 by smtp.gmail.com with ESMTPSA id
 5a478bee46e88-2bdd1cf0115sm357385eec.8.2026.02.25.15.18.29
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 25 Feb 2026 15:18:30 -0800 (PST)
Message-ID: <3f06453a-ac7e-46e0-8d37-e0f9980b438d@oss.qualcomm.com>
Date: Wed, 25 Feb 2026 15:18:29 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC 01/18] accel/qda: Add Qualcomm QDA DSP accelerator
 driver docs
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
 Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>,
 Oded Gabbay <ogabbay@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
 Shuah Khan <skhan@linuxfoundation.org>, Joerg Roedel <joro@8bytes.org>,
 Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Sumit Semwal <sumit.semwal@linaro.org>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 dri-devel@lists.freedesktop.org, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 iommu@lists.linux.dev, linux-media@vger.kernel.org,
 linaro-mm-sig@lists.linaro.org,
 Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>,
 Bharath Kumar <quic_bkumar@quicinc.com>,
 Chenna Kesava Raju <quic_chennak@quicinc.com>
References: <20260224-qda-firstpost-v1-0-fe46a9c1a046@oss.qualcomm.com>
 <20260224-qda-firstpost-v1-1-fe46a9c1a046@oss.qualcomm.com>
 <e94ce683-d47c-4c8e-8b26-cd327c891cc8@oss.qualcomm.com>
 <5a278b02-f2ad-408b-b0ad-f2297817bd7e@oss.qualcomm.com>
 <opjniedtfhkv7vlb57g3xyikcfkxelthx3lmspmypws4vxz4oc@4uypmmf4t6fb>
 <4e4b50fe-1091-451e-b854-f7b061ebd88d@oss.qualcomm.com>
 <jmv4jkwku5x5acxno3vyar4cozl3makdz6vzdyjsitf2vtyhp6@cxtl7zmaayvq>
Content-Language: en-US
From: Trilok Soni <trilokkumar.soni@oss.qualcomm.com>
In-Reply-To: <jmv4jkwku5x5acxno3vyar4cozl3makdz6vzdyjsitf2vtyhp6@cxtl7zmaayvq>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjI1MDIyMiBTYWx0ZWRfX1IOuCUQHkS/L
 dPDH27Eb7tn5/INXwzfnrZcso84cDVb7g2xs/W/RNajFzY1xQuaDJvMDVD3xrgISmduUhs78+F5
 nBukK53+4qWWAUElxYKIZcngpWUbY2YkSzlWiLii0rjLjKChSrmkclnmWUDxCUtHKyx8Ig2HStZ
 N/HwT+UtiZR2yoYxGaE3mQnU5wSttzVFAIrkRi77mUMEGRYKX04M1P9LAknafWdobNCRwusw0gA
 Ia6c2Krk/YJZIh/FHoZy7H86JSdanCjxJyZfCTGsE/p/cKglrf/NCjMxDgfQLOUbNW3z+KXgbAS
 1Fniha9xVpH5ETqOarWBZV7FCo6gSzzHeL5jyCtU7OFfeAlM3PxH0SybCnPlYBHtznEuueHNN8j
 CUsZNMK0ztNuSqqeh3Ng4rnNXlYRz9UgwjQJn82TqwQmZ0a3AbPOtECqiI8eoH3Cf012IzVR5+R
 kVGtaP5K0hwpwUSMvHw==
X-Authority-Analysis: v=2.4 cv=O7Q0fR9W c=1 sm=1 tr=0 ts=699f8348 cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=AmUwcyaVtIZmdcZSVHAA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=bBxd6f-gb0O0v-kibOvt:22
X-Proofpoint-ORIG-GUID: tlK6idIrSKZqc37iEa4y29hTU1U-UW8N
X-Proofpoint-GUID: tlK6idIrSKZqc37iEa4y29hTU1U-UW8N
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-25_04,2026-02-25_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 suspectscore=0 adultscore=0 impostorscore=0
 lowpriorityscore=0 phishscore=0 spamscore=0 clxscore=1015 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2602250222
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
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:dmitry.baryshkov@oss.qualcomm.com,m:andersson@kernel.org,m:ekansh.gupta@oss.qualcomm.com,m:ogabbay@kernel.org,m:corbet@lwn.net,m:skhan@linuxfoundation.org,m:joro@8bytes.org,m:will@kernel.org,m:robin.murphy@arm.com,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:tzimmermann@suse.de,m:airlied@gmail.com,m:simona@ffwll.ch,m:sumit.semwal@linaro.org,m:christian.koenig@amd.com,m:linux-doc@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:iommu@lists.linux.dev,m:linux-media@vger.kernel.org,m:linaro-mm-sig@lists.linaro.org,m:srinivas.kandagatla@oss.qualcomm.com,m:quic_bkumar@quicinc.com,m:quic_chennak@quicinc.com,s:lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[kernel.org,oss.qualcomm.com,lwn.net,linuxfoundation.org,8bytes.org,arm.com,linux.intel.com,suse.de,gmail.com,ffwll.ch,linaro.org,amd.com,lists.freedesktop.org,vger.kernel.org,lists.linux.dev,lists.linaro.org,quicinc.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[trilokkumar.soni@oss.qualcomm.com,dri-devel-bounces@lists.freedesktop.org];
	RCPT_COUNT_TWELVE(0.00)[26];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	FROM_NEQ_ENVFROM(0.00)[trilokkumar.soni@oss.qualcomm.com,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	TAGGED_RCPT(0.00)[dri-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns]
X-Rspamd-Queue-Id: E23A419EB22
X-Rspamd-Action: no action

On 2/25/2026 11:40 AM, Dmitry Baryshkov wrote:
> On Wed, Feb 25, 2026 at 11:16:26AM -0800, Trilok Soni wrote:
>> On 2/25/2026 7:12 AM, Bjorn Andersson wrote:
>>> On Wed, Feb 25, 2026 at 07:47:08PM +0530, Ekansh Gupta wrote:
>>>>
>>>>
>>>> On 2/24/2026 9:03 AM, Trilok Soni wrote:
>>>>> On 2/23/2026 11:08 AM, Ekansh Gupta wrote:
>>>>>> Add initial documentation for the Qualcomm DSP Accelerator (QDA) driver
>>>>>> integrated in the DRM accel subsystem.
>>>>>>
>>>>>> The new docs introduce QDA as a DRM/accel-based implementation of
>>>>>> Hexagon DSP offload that is intended as a modern alternative to the
>>>>>> legacy FastRPC driver in drivers/misc. The text describes the driver
>>>>>> motivation, high-level architecture and interaction with IOMMU context
>>>>>> banks, GEM-based buffer management and the RPMsg transport.
>>>>>>
>>>>>> The user-space facing section documents the main QDA IOCTLs used to
>>>>>> establish DSP sessions, manage GEM buffer objects and invoke remote
>>>>>> procedures using the FastRPC protocol, along with a typical lifecycle
>>>>>> example for applications.
>>>>>>
>>>>>> Finally, the driver is wired into the Compute Accelerators
>>>>>> documentation index under Documentation/accel, and a brief debugging
>>>>>> section shows how to enable dynamic debug for the QDA implementation.
>>>>> So existing applications written over character device UAPI needs to be
>>>>> rewritten over new UAPI and it will be broken once this driver gets
>>>>> merged? Are we going to keep both the drivers in the Linux kernel
>>>>> and not deprecate the /char device one? 
>>>>>
>>>>> Is Qualcomm going to provide the wrapper library in the userspace
>>>>> so that existing applications by our customers and developers
>>>>> keep working w/ the newer kernel if the char interface based
>>>>> driver gets deprecated? It is not clear from your text above. 
>>>> Thanks for raising this, Trilok.
>>>>
>>>> This is one of the open items that I have. I'm not exactly sure what would be the
>>>> acceptable way for this. 
>>>>
>>>> As you mentioned, applications that rely on /dev/fastrpc* might not work on QDA
>>>> without modification.
>>>>
>>>> I was thinking in the same lines as you have mentioned and  having some shim/compat
>>>> driver to translate FastRPC UAPI to QDA. The compat driver would expose the existing
>>>> character devices and route the calls to QDA. The compat driver could be built via Kconfig.
>>>>
>>>
>>> This is a fundamental requirement, you need to address this in order for
>>> this to move forward.
>>>
>>> Which makes me wonder if it would be possible to reach an accel driver
>>> through incremental transition of the current driver, instead of just
>>> dropping in a few thousand lines of new code/design.
>>>
>>>> However, I haven’t encountered an example of such a UAPI‑translation driver in the kernel
>>>> before, so I would want guidance from maintainers on whether this is an acceptable
>>>> model or not.
>>>>
>>>> Regarding your question about library, all the APIs exposed by github/fastrpc library are kept
>>>> unchanged in terms of definitions and expectation. The same project can be build for both
>>>> FastRPC and QDA based on configure options. So, the applications using github/fastrpc should
>>>> not face any problem if the libs is built with proper configure options.
>>>>
>>>
>>> You're assuming that the kernel and userspace are a unified piece of
>>> software, they are not. It must be possible for me to install a new
>>> kernel package without having to replace the userspace libraries.
>>
>> Thank you Bjorn for providing the inputs. 
>>
>> I also foresee that we will be stop adding (or already happened) new features
>> into the existing fastrpc driver, so calling the new driver as an alternative
>> is in oversold category.
>>
>> You are pretty much began the deprecating the existing fastrpc driver, so let's
>> just mention it if that is the case and provide migration/shim path so that
>> existing binaries doesn't break.
> 
> I agree that we need a migration path, but I'd really focus on it after
> getting at least basic parts of the QDA reviewed and agreed upon.
> Otherwise the shim layer will be reworked again and again with no
> immediate added benefit.
> 

I am fine with the review to be continued, this is RFC series anyway. We should also decide
the design of the shim layer here as well. I prefer to not have multiple
RFC revisions here if we don't agree on the basic requirements which
leads to acceptance of this new driver. 

---Trilok Soni
