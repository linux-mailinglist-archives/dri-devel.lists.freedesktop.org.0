Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0OsHN59UpWnR9AUAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Mon, 02 Mar 2026 10:13:03 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 422A11D559E
	for <lists+dri-devel@lfdr.de>; Mon, 02 Mar 2026 10:13:03 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 04CE810E467;
	Mon,  2 Mar 2026 09:13:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="fzf41Olr";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="HAFzpTBt";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2901210E233
 for <dri-devel@lists.freedesktop.org>; Mon,  2 Mar 2026 09:12:58 +0000 (UTC)
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 6227Y75K3458026
 for <dri-devel@lists.freedesktop.org>; Mon, 2 Mar 2026 09:12:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 RUKup/XfO3qrGbQJzWHbBXV03Pa7ritqjhXq2ej50ho=; b=fzf41OlrSKkpQ6wi
 cPQXO5M+H1/gKBOaYXUE9BMMfcSeGx6uEDuGZwsV6Lq/my7EBWG7XVuLcNdZVZOB
 tSNDpjP9FtPPM6iRJHZNHDS+OOflGy+z5cH3tFGhNqlwtxYdGJW5wbNWdZTgWQOk
 V1kdZnXxUtPv83ZpKQnB8FeCY9+wu6Mxz4I2dyAN6IX6diuuKNaFkAlazxJdsoaw
 gYzC3Kk1n4VHbhHDUmxRT4knmV/BOZd0Lbb80uMjPOqswfxyFGS+h51ftHuBN74E
 QHtVo1SnCm+zRdOYV2YUkcg2ExftgfTOXynvwoGd2evfkuzDo09ACqGAovNTqVLA
 fk8GnA==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com
 [209.85.216.70])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cksfyvuvq-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Mon, 02 Mar 2026 09:12:57 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id
 98e67ed59e1d1-35979a03106so1895208a91.1
 for <dri-devel@lists.freedesktop.org>; Mon, 02 Mar 2026 01:12:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1772442776; x=1773047576;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=RUKup/XfO3qrGbQJzWHbBXV03Pa7ritqjhXq2ej50ho=;
 b=HAFzpTBtfrZkR5eNJtGiv6U0sn8UrooBMnyCmzN7VzPZ35KJ4HE3EjPPoJtAc0YS0T
 Vf1PF1NkOaeDzxw9AtcirjJ97TUiDpVYfnn4GcDOPqc0wjCa2gkYUNqoqPi7aXVbpTKh
 VtsnEfPRn70so2W54IWR46a59JV4BRON/yhqgK/nT/PrEbFIbWcc9l3Nb3MbxSUMguaG
 YM2cPhPUOkpLn/Xb7DhgvsGmypYFBFoSJFnGl+PizKWhJdFeeSqa+q4gVzZUCaZ2cQKd
 JFPO3uTWYiTW2P4P/Nnnja1AsJPuLQFBVpuPLnLaicnwmriN8KYmivB7EMH70UKm4yh0
 dp7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1772442776; x=1773047576;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=RUKup/XfO3qrGbQJzWHbBXV03Pa7ritqjhXq2ej50ho=;
 b=BcHyvjaqX5H8l0fYVZnuXyrZsrxG/oBfJkdDfbOpR3Gf5JGnHzBOTxCjWeZn7xIJhp
 nM3l6wji/XxAW0u4spDZ8AdM7VePN1N0lnwhSK/GFkTkNN9GzlOTp6PLX0ZjmzUh9TFs
 XZQ+cFysRfyXplZF2YsgvxE30xNCTS/ezM7ZvfhgBGAZe8r4fW6jSesXarpHuYq1PzxA
 oz5cLSfJrPwZQJnWcXd2iSMDV9OitSZMXtqoPUva3I9tCjR+pEqM5+4QejFT+mtyYyqv
 RD8P1H9viM4mVIok/HWD475Y2U0nfUkcLUfULudqNinWTPZh7DI1IwrlyWO18TaTxUzb
 sM3A==
X-Gm-Message-State: AOJu0YwyBHUv+KuouqcCL2Brt9bhW6JxYJFvbTzDz6WwXA222RuAS07c
 HSYBdV3qsD9mtLeLsyC5CxLjgyyhhEouOUijXa00DsSLH2tYtuTp8H58igES2I9WauMTMFVfZBP
 mKpUEShCOpdwFbIuHVV9xD9jEgU2Bei6XdcLs0vtkcy6DiH+/EuQwJtnjlOJsNBQz+U0/yTM=
X-Gm-Gg: ATEYQzytq9n79UBYBvTWq0tDW6qIbNWlVp09RI+fQg4UaKWh7b6+DshPI3bwPpeGY0P
 75dzqWkXIt4ILCkrryXPfZlPA2AbodkQB7LI/xQqrNQn4lCHviMSgjOV1GOvyJmOmdY6Ls9ixJ6
 17sady3TZhAJMwqXn8cQDgkZhYKFUTNFxmv5Ih3R9jiItNhBXn7wqtZKSSY/+FbI/DtfoXfcX3U
 NlRQMNDDe/3k6v1c72+KLWL9T8Az+QzCoMYOho+LNSZstn2bR59wgIveNBiA9uc7V8F8GsepX+u
 bOwOjo/aXfU3VAs5/5Eo/v+cbxIXui6AKOSYR5PVLiJPL2lfGw3/miIcU5Kn2kMyj9USoSo9hXq
 2Rvj1pfyTI537NYiCN228/qnXm3Mpa335Onek2NX20AZYwuL6Xw==
X-Received: by 2002:a17:902:d58b:b0:2ae:5655:b16 with SMTP id
 d9443c01a7336-2ae56551006mr12820435ad.21.1772442776081; 
 Mon, 02 Mar 2026 01:12:56 -0800 (PST)
X-Received: by 2002:a17:902:d58b:b0:2ae:5655:b16 with SMTP id
 d9443c01a7336-2ae56551006mr12820065ad.21.1772442775550; 
 Mon, 02 Mar 2026 01:12:55 -0800 (PST)
Received: from [10.206.99.28] ([202.46.23.25])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2adfb5b0691sm178825005ad.11.2026.03.02.01.12.48
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 02 Mar 2026 01:12:54 -0800 (PST)
Message-ID: <4abcb402-8d57-4bd3-ab8f-3a96c11b3410@oss.qualcomm.com>
Date: Mon, 2 Mar 2026 14:42:47 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC 16/18] accel/qda: Add FastRPC-based DSP memory mapping
 support
To: Krzysztof Kozlowski <krzk@kernel.org>, Oded Gabbay <ogabbay@kernel.org>,
 Jonathan Corbet <corbet@lwn.net>,
 Shuah Khan <skhan@linuxfoundation.org>, Joerg Roedel <joro@8bytes.org>,
 Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Sumit Semwal <sumit.semwal@linaro.org>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Cc: dri-devel@lists.freedesktop.org, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 iommu@lists.linux.dev, linux-media@vger.kernel.org,
 linaro-mm-sig@lists.linaro.org,
 Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>,
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
 Bharath Kumar <quic_bkumar@quicinc.com>,
 Chenna Kesava Raju <quic_chennak@quicinc.com>
References: <20260224-qda-firstpost-v1-0-fe46a9c1a046@oss.qualcomm.com>
 <20260224-qda-firstpost-v1-16-fe46a9c1a046@oss.qualcomm.com>
 <fd7a2ac7-796a-4cdb-a55f-91e42f08109c@kernel.org>
Content-Language: en-US
From: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
In-Reply-To: <fd7a2ac7-796a-4cdb-a55f-91e42f08109c@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzAyMDA3OCBTYWx0ZWRfX2o9elF+Lgogr
 eb5gYicF+CwdJv0k52Kvln+XCiNMIdpUjm96/NK3dywB8cysyDrXcUarkQmxlAXKvRazC1UWKKY
 dY6evadWrIoJAofQlxz9VXonwQsroYgOXe80kEqvAnWcKXVSV4Ir8RjgEIRtvTchIZhq4LPzlXg
 Dbn8ZVfM/sW1nTWwnYZY8XmKMRG8o7XqOajubo8xs4O6C1JteJpiVgVgR/Bgkw9xXhMbMrEJTnD
 2DAHWYIGTjz1U2RAB91Ra/C5Ugr7Ry3yRXqQJqcvppKfCh5SEu0IMa9siG7h76dvPgFMd3WD1rx
 OtWRx43o4GztJ3TrufTB3pyL7vJF5sqEoIMZ8ZFCDq7bD0k67TKBzw846iKbPK53r1Lzr1lJozc
 UNTNBAlq93oWWUxcx16G7uRRE79hWgAiQIYmmpikPwmihaCYIgvewolCjm15nX5ffYvkvdzhV9G
 Yw9EI8qJpKyliPzoABQ==
X-Authority-Analysis: v=2.4 cv=avS/yCZV c=1 sm=1 tr=0 ts=69a55499 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=A3mkvOHymaTnmgbQ1zAA:9 a=QEXdDO2ut3YA:10
 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-GUID: ElRf-ykgCDjyk_Je5GtrVeYPJev9tD86
X-Proofpoint-ORIG-GUID: ElRf-ykgCDjyk_Je5GtrVeYPJev9tD86
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-02_02,2026-02-27_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 adultscore=0 impostorscore=0 clxscore=1015 suspectscore=0
 phishscore=0 malwarescore=0 spamscore=0 lowpriorityscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603020078
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
	FORGED_RECIPIENTS(0.00)[m:krzk@kernel.org,m:ogabbay@kernel.org,m:corbet@lwn.net,m:skhan@linuxfoundation.org,m:joro@8bytes.org,m:will@kernel.org,m:robin.murphy@arm.com,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:tzimmermann@suse.de,m:airlied@gmail.com,m:simona@ffwll.ch,m:sumit.semwal@linaro.org,m:christian.koenig@amd.com,m:linux-doc@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:iommu@lists.linux.dev,m:linux-media@vger.kernel.org,m:linaro-mm-sig@lists.linaro.org,m:srinivas.kandagatla@oss.qualcomm.com,m:dmitry.baryshkov@oss.qualcomm.com,m:quic_bkumar@quicinc.com,m:quic_chennak@quicinc.com,s:lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[kernel.org,lwn.net,linuxfoundation.org,8bytes.org,arm.com,linux.intel.com,suse.de,gmail.com,ffwll.ch,linaro.org,amd.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	ARC_NA(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[25];
	FORGED_SENDER(0.00)[ekansh.gupta@oss.qualcomm.com,dri-devel-bounces@lists.freedesktop.org];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	FROM_NEQ_ENVFROM(0.00)[ekansh.gupta@oss.qualcomm.com,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	NEURAL_HAM(-0.00)[-0.998];
	TAGGED_RCPT(0.00)[dri-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,oss.qualcomm.com:mid,oss.qualcomm.com:dkim,qualcomm.com:email,qualcomm.com:dkim]
X-Rspamd-Queue-Id: 422A11D559E
X-Rspamd-Action: no action



On 2/26/2026 4:18 PM, Krzysztof Kozlowski wrote:
> On 23/02/2026 20:09, Ekansh Gupta wrote:
>> Add a DRM_QDA_MAP ioctl and supporting FastRPC plumbing to map GEM
>> backed buffers into the DSP virtual address space. The new
>> qda_mem_map UAPI structure allows userspace to request legacy MMAP
>> style mappings or handle-based MEM_MAP mappings with attributes, and
>> encodes flags, offsets and optional virtual address hints that are
>> forwarded to the DSP.
>>
>> On the FastRPC side new method identifiers FASTRPC_RMID_INIT_MMAP
>> and FASTRPC_RMID_INIT_MEM_MAP are introduced together with message
>> structures for map requests and responses. The fastrpc_prepare_args
>> path is extended to build the appropriate request headers, serialize
>> the physical page information derived from a GEM object into a
>> fastrpc_phy_page array and pack the arguments into the shared message
>> buffer used by the existing invoke infrastructure.
>>
>> The qda_ioctl_mmap() handler dispatches mapping requests based on the
>> qda_mem_map request type, reusing the generic fastrpc_invoke()
>> machinery and the RPMsg transport to communicate with the DSP. This
>> provides the foundation for explicit buffer mapping into the DSP
>> address space for subsequent FastRPC calls, aligned with the
>> traditional FastRPC user space model.
>>
>> Signed-off-by: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
>> ---
>>  arch/arm64/configs/defconfig    |   2 +
> Not relevan there. Don't stuff other subsystem code into your patches.
> Especially without any reasons (your commit msg must explain WHY you are
> doing things).
Please ignore this, it's a mistake pulled from my local test branch. I'm not going to add any
defconfig changes as part of this patch series.

Thanks for pointing this out.
>
>>  drivers/accel/qda/qda_drv.c     |   1 +
>>  drivers/accel/qda/qda_fastrpc.c | 217 ++++++++++++++++++++++++++++++++++++++++
>>  drivers/accel/qda/qda_fastrpc.h |  64 ++++++++++++
>>  drivers/accel/qda/qda_ioctl.c   |  24 +++++
>>  drivers/accel/qda/qda_ioctl.h   |  13 +++
>>  include/uapi/drm/qda_accel.h    |  44 +++++++-
>>  7 files changed, 364 insertions(+), 1 deletion(-)
>>
>
>
> Best regards,
> Krzysztof

