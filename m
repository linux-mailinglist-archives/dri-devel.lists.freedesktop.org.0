Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aI1tC1+zpWlaEgAAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Mon, 02 Mar 2026 16:57:19 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 754A21DC40A
	for <lists+dri-devel@lfdr.de>; Mon, 02 Mar 2026 16:57:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 63F9C10E52F;
	Mon,  2 Mar 2026 15:57:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="a+ZZvVYl";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="HPDjdd+r";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1D3E710E363
 for <dri-devel@lists.freedesktop.org>; Mon,  2 Mar 2026 15:57:14 +0000 (UTC)
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 622F4js3352152
 for <dri-devel@lists.freedesktop.org>; Mon, 2 Mar 2026 15:57:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 8vyvR83xrrtCU77jvjKIBTD0soAKN/hIqxbrkw2O4Eg=; b=a+ZZvVYlo4wLtBeZ
 mODk+bsqfzDxlaQMCa5Nb/TM3dvekABo4uq/BUsHzK1Pb0vFDXQl9IDHpCrZrvan
 Gy+Oqm2ACVA27CW//s2cPoXfFPOUtdSrPpzsyN1BIONwz9MQl7n65UrxpQKhdCtZ
 paYzk8RKggGp0IvZ21Nf+jjsl87nnfG2fjcbI9h0HJ0zL0dak/Bg8uTF60f3gKE/
 GPsd/zyrYpqTjI7c0lZLm1vajjB4+vKhSXvoatUqNzV5GVigiMR8e8VLxiV9djHR
 RRgRIbLG/ROGR6wFZN1JGbb+MS1rSZiv5ndWd/iZ8dbVn6ji/sccvremCddphhnA
 QbMf/A==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cmw64b1tp-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Mon, 02 Mar 2026 15:57:13 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id
 af79cd13be357-8cb413d0002so3878602485a.1
 for <dri-devel@lists.freedesktop.org>; Mon, 02 Mar 2026 07:57:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1772467032; x=1773071832;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=8vyvR83xrrtCU77jvjKIBTD0soAKN/hIqxbrkw2O4Eg=;
 b=HPDjdd+rE19+FFXmgApbFPxCZCbjjugA0A/yZot6Xj+wWClJqHuFmmRCcM6NHRy08C
 8ohFKm0zvlY765k7Vey2jWY296rzejmnGbRWE3AcLxNkFpvw64jaGjlbKhRz/pNBlYha
 PgsUisJn1Q8HXlx9a+fb3X4bgzd3gIjcGCI+mUWbHLhBuiW4XDQV0kopDGd2Dy7oaJ0K
 aVXj/4JZKDfF86BWRmlS8Y8WEe4ZUL922KiosdInnnZkus/g23ZwC9Zwwe7AIf+kMV8E
 ZtYJ95y/Llr1TdU/iA2QPFd1h5AbbypCDqNd1ivUtjn5qt3D/aRLr/k79uE8zh1HbKD0
 vYEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1772467032; x=1773071832;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=8vyvR83xrrtCU77jvjKIBTD0soAKN/hIqxbrkw2O4Eg=;
 b=d08AqiRyIsCwE97jTITKcFpKwt/r3267e6AGhrHBiTDVsszjNcOWb7r1EVlXMm1vj+
 qwVEiGNBhDzjEpLJNd6elfprUYwD6W0Ap5sHQ6zn2XghX8W/MUuyhfYOGhScLRquvp2/
 ZrFvfpN+QbOjAb742RhrD8gXwmq+mJxtsmDBCJLJw+rp35MgzBfRc0345j49vskmMg+N
 2dw1ADdudfQnTX9YQ0bQjOc2mFcFUTt3pYQ8hnvmn8heX9bJafU+P3ya7B2acWfVeaS+
 g2+PNHRvs9RJDoISdBXr5irD4DEwziDMlGDvc0Vq4j95xK6V5INciKhAXPiBCgZprr+Z
 dGQQ==
X-Gm-Message-State: AOJu0Yy9Z/YlZDkRUuTGmXCNc8Y+a94fmpeMgYJK7v3FNYIuuekCBkc5
 bNcfMG+viY/WD7XWlDXaYNdweK5L/E8ibvRC4Hu+aof779BDBbZ2IFLjYbGYR2DHGDQbxfJR/HM
 4PFiDbl/mHAqoizfC1XAjgcSGVZM0A5/FS/ODmdk7D32BMZrJvNTj92y5sKIRAGSCQluB53c=
X-Gm-Gg: ATEYQzzZKIOGpKTz+HwT+OX5VOU4N4+Af/g7oB1IUS9yA2TR9XQVbcp3zmtK/oPFI15
 ykVQnWjUuzPleleHgMmkcIlGbEa0hqzOFfpEL3Nm9AW/ewlkQVVvWlIkzNpjfbwqrWsVo2yty3p
 q74WGcZfsWQnC/gmY1oVtCPxCe1iO/fPySZxmcIm5jv9qfGpndyYIV8ecZwFRxH6mcsLoCJSH15
 ofgB6mtecgmxEcNBjKEfkC7oTOuZQQ07yLBtYPG/KpiTqNYbLclyKfOFb9a20n8syD1ildp6lnj
 4QXis0VhzT1/VSY2OCdFKVxO7dSauIFuF5LiivW+8IbsirJVCh0vPudKcI9tNoYRYDbxYk7WHhs
 2K95o6SCb4fCYGT9z5UHBn3P7el8jteHISn+g9hASC5xsSBKs
X-Received: by 2002:a05:620a:2906:b0:8c7:1181:779f with SMTP id
 af79cd13be357-8cbbf3f540dmr1944225685a.35.1772467032126; 
 Mon, 02 Mar 2026 07:57:12 -0800 (PST)
X-Received: by 2002:a05:620a:2906:b0:8c7:1181:779f with SMTP id
 af79cd13be357-8cbbf3f540dmr1944219785a.35.1772467031498; 
 Mon, 02 Mar 2026 07:57:11 -0800 (PST)
Received: from [192.168.68.114] ([5.133.47.210])
 by smtp.googlemail.com with ESMTPSA id
 5b1f17b1804b1-483bfb296bfsm163572955e9.0.2026.03.02.07.57.08
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 02 Mar 2026 07:57:09 -0800 (PST)
Message-ID: <e60c6218-ff33-4603-afc1-28a9b891b61d@oss.qualcomm.com>
Date: Mon, 2 Mar 2026 15:57:07 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC 00/18] accel/qda: Introduce Qualcomm DSP Accelerator
 driver
To: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>,
 Oded Gabbay <ogabbay@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
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
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
 Bharath Kumar <quic_bkumar@quicinc.com>,
 Chenna Kesava Raju <quic_chennak@quicinc.com>
References: <20260224-qda-firstpost-v1-0-fe46a9c1a046@oss.qualcomm.com>
Content-Language: en-US
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
In-Reply-To: <20260224-qda-firstpost-v1-0-fe46a9c1a046@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: 6doYMFpNqIyL_J1dVRTBqJfvfabRXFTB
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzAyMDEzMyBTYWx0ZWRfXyCIZLgm8rrW8
 B3bG/gCCGtiQ/EYIFrEyPrW5Qx68HAZNQ4UKW3bKkLaRokUsjXEcGeSFVnrSWYd9SyUWf1N74Qa
 6VFblfpPcEdVnFDRe2HExPZEmcBTOS55THvzhljl9VZyQ2X1F18oxm2/7U4PxvAk/uXYD6PZMki
 wf5G6i4RLtuX76yMkV4SVaCY96nnXAOURjEZ2hnWY5HYUb0OLFZYSr0Bkj4kxfsWiNY8PZH77Mz
 uaSW/K7JIRDlMHQA+0mFfgJk7ogPkI7KH1C6xO+JK3YUqmK+/Q2LIOs5SFdiiITa3MMAhw4Jtuj
 G0OLi45WjJUx4niYOH7BNjglDxCTrgc+m8OOj13/hrue9I5BKOzGWtZG80TKHS+y2D98Rm47ITm
 9ZpwF9X11l+JYl+2s09RE2mKyqYKQBHYDQuo9EKoyIrYJUjYLiNsnsscV6hBZ4QoHCP23NMK9rn
 JZS0exOh4eqzRraTMFA==
X-Proofpoint-ORIG-GUID: 6doYMFpNqIyL_J1dVRTBqJfvfabRXFTB
X-Authority-Analysis: v=2.4 cv=I5Vohdgg c=1 sm=1 tr=0 ts=69a5b359 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=9YJduu4mqnAt5a5FaXIA:9 a=QEXdDO2ut3YA:10 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-02_03,2026-03-02_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0 priorityscore=1501 lowpriorityscore=0
 clxscore=1011 phishscore=0 impostorscore=0 bulkscore=0 spamscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2602130000
 definitions=main-2603020133
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
X-Rspamd-Queue-Id: 754A21DC40A
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.31 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:ekansh.gupta@oss.qualcomm.com,m:ogabbay@kernel.org,m:corbet@lwn.net,m:skhan@linuxfoundation.org,m:joro@8bytes.org,m:will@kernel.org,m:robin.murphy@arm.com,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:tzimmermann@suse.de,m:airlied@gmail.com,m:simona@ffwll.ch,m:sumit.semwal@linaro.org,m:christian.koenig@amd.com,m:linux-doc@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:iommu@lists.linux.dev,m:linux-media@vger.kernel.org,m:linaro-mm-sig@lists.linaro.org,m:dmitry.baryshkov@oss.qualcomm.com,m:quic_bkumar@quicinc.com,m:quic_chennak@quicinc.com,s:lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,kernel.org,lwn.net,linuxfoundation.org,8bytes.org,arm.com,linux.intel.com,suse.de,gmail.com,ffwll.ch,linaro.org,amd.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	ARC_NA(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[24];
	FORGED_SENDER(0.00)[srinivas.kandagatla@oss.qualcomm.com,dri-devel-bounces@lists.freedesktop.org];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	FROM_NEQ_ENVFROM(0.00)[srinivas.kandagatla@oss.qualcomm.com,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	NEURAL_HAM(-0.00)[-0.998];
	TAGGED_RCPT(0.00)[dri-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,gabe.freedesktop.org:rdns,gabe.freedesktop.org:helo,qualcomm.com:dkim]
X-Rspamd-Action: no action


On 2/23/26 7:08 PM, Ekansh Gupta wrote:
Thanks Ekansh for this this one out.

> Key Features
> ============
> 
> * Standard DRM accelerator interface via /dev/accel/accelN> * GEM-based buffer management with DMA-BUF import/export support
> * IOMMU-based memory isolation using per-process context banks

> * FastRPC protocol implementation for DSP communication
> * RPMsg transport layer for reliable message passing
> * Support for all DSP domains (ADSP, CDSP, SDSP, GDSP)

To what extent is this support expected ?

> * Comprehensive IOCTL interface for DSP operations
> 
> High-Level Architecture Differences with Existing FastRPC Driver
> =================================================================
> 
> The QDA driver represents a significant architectural departure from the
> existing FastRPC driver (drivers/misc/fastrpc.c), addressing several key
> limitations while maintaining protocol compatibility:
> 
> 3. IOMMU Context Bank Management
> 
> 
> 9. UAPI Design
>   - FastRPC: Custom IOCTL interface
>   - QDA: DRM-style IOCTLs with proper versioning support
>   - Benefit: Follows DRM conventions, easier userspace integration

Can you elaborate this.

Are we really getting leverage from any  of the standard libraries that
are available for drm accel?

In general I would like to understand how standardization of this kernel
driver is helping userspace side of things.

Does this mean that there will be no libfastrpc requirements in future?

If that is not the case then I see no point.

> 
> Open Items
> ===========
> 
> The following items are identified as open items:
> 
> 1. Privilege Level Management
>   - Currently, daemon processes and user processes have the same access
>     level as both use the same accel device node. This needs to be
>     addressed as daemons attach to privileged DSP PDs and require
>     higher privilege levels for system-level operations
>   - Seeking guidance on the best approach: separate device nodes,
>     capability-based checks, or DRM master/authentication mechanisms
> 
> 2. UAPI Compatibility Layer

Simple rule! you can not break anything that is already working with
existing UAPI.

>   - Add UAPI compat layer to facilitate migration of client applications
>     from existing FastRPC UAPI to the new QDA accel driver UAPI,
>     ensuring smooth transition for existing userspace code

What will happen to long term supported devices?

>   - Seeking guidance on implementation approach: in-kernel translation
>     layer, userspace wrapper library, or hybrid solution

> 
> 3. Documentation Improvements
>   - Add detailed IOCTL usage examples
>   - Document DSP firmware interface requirements
>   - Create migration guide from existing FastRPC
> 
> 4. Per-Domain Memory Allocation
>   - Develop new userspace API to support memory allocation on a per
>     domain basis, enabling domain-specific memory management and
>     optimization
> 
> 5. Audio and Sensors PD Support
>   - The current patch series does not handle Audio PD and Sensors PD
>     functionalities. These specialized protection domains require
>     additional support for real-time constraints and power management
Please elaborate, fastrpc support is incomplete without audiopd support.

--srini
