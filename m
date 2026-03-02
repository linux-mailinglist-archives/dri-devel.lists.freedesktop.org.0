Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SPjeNWJNpWmt8AUAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Mon, 02 Mar 2026 09:42:10 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4DF4E1D4C01
	for <lists+dri-devel@lfdr.de>; Mon, 02 Mar 2026 09:42:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5641B10E45B;
	Mon,  2 Mar 2026 08:42:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="nLtkOm2A";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="W6y2tCRh";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6E11210E45B
 for <dri-devel@lists.freedesktop.org>; Mon,  2 Mar 2026 08:42:07 +0000 (UTC)
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 6226h9av2504590
 for <dri-devel@lists.freedesktop.org>; Mon, 2 Mar 2026 08:42:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 piXcJzMeuC1GQTW+z56AL0+ix8P0FjngV+9YFbX1rVM=; b=nLtkOm2AHu9HoX1v
 oa1xnNMoezDDTz1ISvqkk7cJbAS2xyrhLYLVIWnZA80l/l2cOkEG2/KpwDkvyB8e
 jO9I8AvstnA0YOlfbm6jKlc/BfzpNQUQhO7M8CbWaa/iIZBeku+grClltUlY1Vmq
 EJ6/mh3P31+KsvQppLQFGemEp5R+T6T9EjirlueknNDz/uN5Sn4RQbIV+FM9Pxe9
 NMh2Xtqnbbox/mLdZoK/Lgp9YfcRJXJI3/0cn9RIf2b9mRwcEszcYeBDUGaFcd79
 IYruUus9C3cl6zA4w23dEUx1wOHUIpN9YKm/kH6d1tiKBMgLjt2l8AYHTe0gX2wj
 6+eHkQ==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com
 [209.85.215.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cn5hercy1-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Mon, 02 Mar 2026 08:42:06 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id
 41be03b00d2f7-b6097ca315bso21575198a12.3
 for <dri-devel@lists.freedesktop.org>; Mon, 02 Mar 2026 00:42:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1772440926; x=1773045726;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=piXcJzMeuC1GQTW+z56AL0+ix8P0FjngV+9YFbX1rVM=;
 b=W6y2tCRhsvN6ExQ/llCeIztXk6SrDQHBpXewpk8nHe52IrEuW1quH3cFfXWYWfEdsG
 ZR6kl9M3XszJNA67dJXwsjSdbASGjTSvDMLsk7HIX/2tM5exq1Jwy6IdFqqHGfvHIYtK
 kmNYbmjvIB9SXnmsosbKxmHhwloeVhbHq0OKz+extFBQ+h0B2s9uEFp9CadQHTRscUOc
 nRaifhKu8nbA0pPu+sgXcQkmX+d1Ht98Ifh79SNkigzYYHnYIW2Nd6o94ROMjkyTFan0
 WtNufSYCzeCCxVMsl6E2E8huC87QoMLf13g8BT+3Df57622KCcFvZYLZqrYVupq3nKO+
 erhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1772440926; x=1773045726;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=piXcJzMeuC1GQTW+z56AL0+ix8P0FjngV+9YFbX1rVM=;
 b=Pa4gYXFNuPVYYdbR1lnL16v/w0VWla/+prD/9dEG3lgVT9LkhFFkfV9lWbOTyIdjtK
 mmd9hJVYCDa8eICgpOF7OZsXm9msVtWwlZYQCi0E7T6oJSoy9XwPtrVEnCtg9L+bXlz8
 /LwT3qX2bDL7aFPbgZQRUj9eX+PZYEA5604I/M1uqdAGL81AUJRCjonPIYqWhwdxiUfM
 bXitMlynWfzdpW1vAPiR6N3KmuFsQGXrJ0PnkAbHxCl1Qk4Q6Cj2zL2ZLKMsuD4ki7x8
 W7mJV7QXExkwQ80dFkxSSVhXs+WgvV6isLCi6iVREwo6aXquSfR1jKM9lIza48F5V4TY
 5SDw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXA0IKLNTMzEydh/koWGW1ou0NKHgg1zFnTNGCXqc9pkL+hs4NteIDtyrtVXJqdkavDX28MSFyBeDw=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yz0cmMHhbRttyA0vm/Dlxm3oKJ2WltxkuZtuPPTyI68/A2rAnvT
 6qAPMlVNoyhmLeYVqWi2icyFbk4ndiPHFw6fs6KZIeqqd2Frfw4NiFSXxLV58T9yTFJ7uZw3yGp
 eWIRDVKn/G3KRpNQG2WzS1tnciVSQyb8OFjFUsQwmMaWqGZlYTQztzhQXT4ckCiXhmA9H69Y=
X-Gm-Gg: ATEYQzxkrd4M+yNFvOvVosej/yy0Ujdw1ybKHi4fWkjfE+lRsDZ1cyenObWVx7eRql+
 gtX0GU8N6xu4c6oOA0dxvWE1Z73OEjCcDX/9kIzQbwUDziRXlBO4M9Ni63nPvbIoc/V26xnc4+t
 sVOPHwszRyfYGSbALo22tuGxh8MM713YDQgnvTcx9qZdIeOi/BQDQAXCBQGPlmU/B7HUOouOTdJ
 KdWaU4IffDor03pgO5DAOABLMSz2at88XL4s6KJ8jhwUz/5oDwsRNYGSG054VvQsxIumMlf2eGg
 uh+NDzR+nOgBvuljBajNxbMycbFTYvuQymejskZTmx5+1ELyWM27x2iz2ms8/hsqDM+QXpVBoYd
 YjG7qYAPu4pD322ZGQDgXm4qeG1/UmudERu1okuc18+7GYZBdQg==
X-Received: by 2002:a05:6a00:2d09:b0:821:8492:7f73 with SMTP id
 d2e1a72fcca58-8274da7a78fmr12008586b3a.63.1772440926239; 
 Mon, 02 Mar 2026 00:42:06 -0800 (PST)
X-Received: by 2002:a05:6a00:2d09:b0:821:8492:7f73 with SMTP id
 d2e1a72fcca58-8274da7a78fmr12008567b3a.63.1772440925746; 
 Mon, 02 Mar 2026 00:42:05 -0800 (PST)
Received: from [10.206.99.28] ([202.46.23.25])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-8273a01a99esm15377234b3a.47.2026.03.02.00.41.58
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 02 Mar 2026 00:42:05 -0800 (PST)
Message-ID: <207b4008-b32e-45d0-9ebb-a32b2a5edfd1@oss.qualcomm.com>
Date: Mon, 2 Mar 2026 14:11:57 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC 18/18] MAINTAINERS: Add MAINTAINERS entry for QDA
 driver
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Oded Gabbay <ogabbay@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
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
 <20260224-qda-firstpost-v1-18-fe46a9c1a046@oss.qualcomm.com>
 <zideovhb7djvsbydqmdyxbgh6cte7xc5ouhm6gsreww6klqqae@o6w6wd4tic4r>
Content-Language: en-US
From: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
In-Reply-To: <zideovhb7djvsbydqmdyxbgh6cte7xc5ouhm6gsreww6klqqae@o6w6wd4tic4r>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=BI++bVQG c=1 sm=1 tr=0 ts=69a54d5e cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8 a=e5mUnYsNAAAA:8 a=f53fbDee1N-zenCa03cA:9
 a=QEXdDO2ut3YA:10 a=3WC7DwWrALyhR5TkjVHa:22 a=Vxmtnl_E_bksehYqCbjh:22
X-Proofpoint-GUID: yzTRltigHGqyvsDxxS_LOF8TvCcuODPv
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzAyMDA3NiBTYWx0ZWRfXy2uv2GT+Hp+z
 Jei2R4WU20Qbr3k1+72aN35YtImPh0YVf1muyGTUx/qqNmekG0U0Rq6MXXPRSSNpe1Os2JPcce1
 gH+Ug1VOnUvz7gdFCbOxW8xjebdnLiu8NJCY9/6LypFRoyOdQ6KQ8vsUlwln3rpyJl7g0uIKkdT
 cNVlgZB9d404ngiYrpgaiN6fZ3LxW4mSAKa4K+cUUBajlNSZUlMfnnk1OjU25DAhMgJyMoqNZAO
 QTfxavLAFtW+tM1D+mWhAOB+npK4oR5NAtXJI7MXiT40bOmqqJA4MKWAs6qj64p42ZP6obZtOir
 9lduDjf4WS3NHk0yWWR/2dKj75+xYytxmFfEAmALLwclBiy4sYuMRb+m9Vmz6e4PwwVgKzUhudg
 51sYtPpSK8sGszjIRlOoxSgW9DXFPuS4UIM2ue7Mm5MOW/sKvnW7Bsfizak3hQ27OvkP3uuxj0Z
 d8hSwlGtKKuFAxYYpxA==
X-Proofpoint-ORIG-GUID: yzTRltigHGqyvsDxxS_LOF8TvCcuODPv
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-02_02,2026-02-27_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 clxscore=1015 lowpriorityscore=0 bulkscore=0 phishscore=0
 spamscore=0 adultscore=0 impostorscore=0 priorityscore=1501 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603020076
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
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:dmitry.baryshkov@oss.qualcomm.com,m:ogabbay@kernel.org,m:corbet@lwn.net,m:skhan@linuxfoundation.org,m:joro@8bytes.org,m:will@kernel.org,m:robin.murphy@arm.com,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:tzimmermann@suse.de,m:airlied@gmail.com,m:simona@ffwll.ch,m:sumit.semwal@linaro.org,m:christian.koenig@amd.com,m:linux-doc@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:iommu@lists.linux.dev,m:linux-media@vger.kernel.org,m:linaro-mm-sig@lists.linaro.org,m:srinivas.kandagatla@oss.qualcomm.com,m:quic_bkumar@quicinc.com,m:quic_chennak@quicinc.com,s:lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[kernel.org,lwn.net,linuxfoundation.org,8bytes.org,arm.com,linux.intel.com,suse.de,gmail.com,ffwll.ch,linaro.org,amd.com,lists.freedesktop.org,vger.kernel.org,lists.linux.dev,lists.linaro.org,oss.qualcomm.com,quicinc.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	ARC_NA(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[24];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:mid,oss.qualcomm.com:dkim,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,qualcomm.com:email,qualcomm.com:dkim]
X-Rspamd-Queue-Id: 4DF4E1D4C01
X-Rspamd-Action: no action



On 2/24/2026 4:10 AM, Dmitry Baryshkov wrote:
> On Tue, Feb 24, 2026 at 12:39:12AM +0530, Ekansh Gupta wrote:
>> Add a new MAINTAINERS entry for the Qualcomm DSP Accelerator (QDA)
>> driver. The entry lists the primary maintainer, the linux-arm-msm and
>> dri-devel mailing lists, and covers all source files under
>> drivers/accel/qda, Documentation/accel/qda and the UAPI header
>> include/uapi/drm/qda_accel.h.
>>
>> This ensures that patches to the QDA driver and its public API are
>> tracked and routed to the appropriate reviewers as the driver is
>> integrated into the DRM accel subsystem.
> Please add it in the first patch.
ack
>
>> Signed-off-by: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
>> ---
>>  MAINTAINERS | 9 +++++++++
>>  1 file changed, 9 insertions(+)
>>
>> diff --git a/MAINTAINERS b/MAINTAINERS
>> index 71f76fddebbf..78b8b82a6370 100644
>> --- a/MAINTAINERS
>> +++ b/MAINTAINERS
>> @@ -21691,6 +21691,15 @@ S:	Maintained
>>  F:	Documentation/devicetree/bindings/crypto/qcom-qce.yaml
>>  F:	drivers/crypto/qce/
>>  
>> +QUALCOMM DSP ACCELERATOR (QDA) DRIVER
>> +M:	Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
>> +L:	linux-arm-msm@vger.kernel.org
>> +L:	dri-devel@lists.freedesktop.org
>> +S:	Supported
>> +F:	Documentation/accel/qda/
>> +F:	drivers/accel/qda/
>> +F:	include/uapi/drm/qda_accel.h
>> +
>>  QUALCOMM EMAC GIGABIT ETHERNET DRIVER
>>  M:	Timur Tabi <timur@kernel.org>
>>  L:	netdev@vger.kernel.org
>>
>> -- 
>> 2.34.1
>>

