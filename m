Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SKiZIHVurmn8EAIAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Mon, 09 Mar 2026 07:53:41 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DCFAF23471D
	for <lists+dri-devel@lfdr.de>; Mon, 09 Mar 2026 07:53:40 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7C03E10E48B;
	Mon,  9 Mar 2026 06:53:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="UsIEUek4";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="QF68UbUm";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C32AF10E48B
 for <dri-devel@lists.freedesktop.org>; Mon,  9 Mar 2026 06:53:35 +0000 (UTC)
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 628LJLxh2798716
 for <dri-devel@lists.freedesktop.org>; Mon, 9 Mar 2026 06:53:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 mVgFqX2DBPDBaFLa3PVw54gA+GcENZGtutXAv5LndUk=; b=UsIEUek4Fe3f4Aqn
 fxQRIA/Kk6hOUiaqGNLJsR2oFJYcB3CDNQlg/Hb46GLjLpfJngErRAaLpqsnRq/4
 FSNYnFEIsCGfpt6WEzzUinND8smSGzsVEC+gj9sxjAtZSU2Li1gZCTJPT0weTD7w
 7BzN5yu3jPZ9FUkyo0Pb1cCM2yTwpmGzzZ5Klv6LBzCxJwELQM+Ttm3Abc0ogiV7
 JytN8LDB7w9uVRnVv5ARinNUO3H5lEPndqIQ9KgWMLFs8HnK51AN/be03hiQ+uS4
 V9OqsfmOJpvRXgd0UgEc4ziMwn9c2ZJWHV5jD55sisvRHFWv09Gv1SbonyLYpkl/
 YZDBfQ==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com
 [209.85.210.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cr9qevhxq-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Mon, 09 Mar 2026 06:53:35 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id
 d2e1a72fcca58-829ad8a2896so7054338b3a.0
 for <dri-devel@lists.freedesktop.org>; Sun, 08 Mar 2026 23:53:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1773039215; x=1773644015;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=mVgFqX2DBPDBaFLa3PVw54gA+GcENZGtutXAv5LndUk=;
 b=QF68UbUmcVTqoREkgQen/vWMuR7FTYkst7+ivVBonye4xlVcvH3qT9fMzpctGOygT9
 46ctQMarM8qcmahAjoS4/ugpA21W/jggsg31Drthp3Pf+BVZXEwPc4Ysk67NMWtIqu62
 4tSZ0HBMRfwEemvVmoIzH5TRjYOW2fcyVXVIW9Wp6wRCJCaGJN9vpiw4KObs6nf2dtsq
 Gggb/+F0bvKoDx9CiCyWFJuqf/QQPh98+kLHAwKifSz26E0UGFIJ+jWDi3tJjYqf4icD
 u+p9gbjPF+4hi8pcV2O/jovv3nERzQarXTYsZILCLLlbwkcoRrLugwzh+lKixZbTeIqS
 WLuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1773039215; x=1773644015;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=mVgFqX2DBPDBaFLa3PVw54gA+GcENZGtutXAv5LndUk=;
 b=epCtzB4cbZ35e/aD8mBeCZxwWbY0HvJyWJOECEJ1CL8JFsd1KiN/RMp1qBvf2mkaF3
 CRZ5DIHvvO+Dw6mxOmTtGimG4BlSJs5TD4gGQQpsg16aqt47XiIVAtjJcwpSungvQWN4
 gFnsDF6//sJS6v33PyrgB5ymDu3oi+wvnZz5xjh0kFL1hB4LyN85/1jtebpuN4Hbg6jU
 ZjbcCzVEY61kcF0mxPbwCHy+rCwX/E+lHxP7NVjr+it4dZhufvJ+uIeznMf9jXOA4GNb
 2STIQvGW6eN7umMojzPPDkRVjYI+FycDuLxopsbEwYu0xddw5bDgJEt/NSCzqFiUJVCC
 pC5A==
X-Forwarded-Encrypted: i=1;
 AJvYcCXX3lh1GoygIlRUFUs8KKB7nebb6/IbocCpvJBMIqyfFf0O9zPVwLEKvjWhJN3DA3+8Or64Slq9j0A=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxmlDnSSS5ui1Y4yCAoXt2Vb7OC9iOZ60ulKDrw1Utt2t9LrMpc
 vzMtpBqsX10q6G5C3WIemAx91vdEC9ecLx0w0Pi1znt+SgG6x97E04TozdV0sNlJULDEhsCsS7Z
 W+AH9ip+q1xPolpmW8MC1c4dmVGtDKxfI+jTgbu/8pVrkpnxp6Lj3844WJOXiAQpGDBSceus=
X-Gm-Gg: ATEYQzwdixcBRu7VH+JT+arv5Yb1OGx0zMBbGaH9IP4HOEqZRaYT7y79nJgQJHaFIl1
 OZpk/pQKYxs6w3dr4gRg4GC9V5hPNHsl8uUsjigaakdZHRhA9UVSK4J/HNm1K/fdBvuyi4xF1DR
 qXHW79eugXTrswIk4+9SNrMX/3rPOUkU4f1uq55NesmGCIDaIqAaCsnrLpmW54nNW46H1s9ELD9
 8XmFK67EjXbDiLOSnq1gt8ySE01vX5KkMVVg7cguJpDB0hUyZUHjQ1lcxxNIHUYoRzpdVngZjJ3
 jlTFVzWF0q2RGV982n8QrEIJsfqU7kjMnUkbIBJzXRob2P81b8IqvXNMaPzuri8OnBPLv3TZGjM
 PJHWuCszrDpNlK/3AiBcRAGjRudKdQj2BVkvYKq+TVRixonLybA==
X-Received: by 2002:a05:6a00:1805:b0:829:7692:cddc with SMTP id
 d2e1a72fcca58-829a2e5a4b2mr10500549b3a.21.1773039214508; 
 Sun, 08 Mar 2026 23:53:34 -0700 (PDT)
X-Received: by 2002:a05:6a00:1805:b0:829:7692:cddc with SMTP id
 d2e1a72fcca58-829a2e5a4b2mr10500515b3a.21.1773039214023; 
 Sun, 08 Mar 2026 23:53:34 -0700 (PDT)
Received: from [10.206.99.28] ([202.46.23.25])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-829a48a54cesm9002319b3a.48.2026.03.08.23.53.26
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 08 Mar 2026 23:53:33 -0700 (PDT)
Message-ID: <b4751c57-8ed2-4bed-8c0f-34f0a2e54345@oss.qualcomm.com>
Date: Mon, 9 Mar 2026 12:23:25 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC 14/18] accel/qda: Add FastRPC dynamic invocation
 support
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
 <20260224-qda-firstpost-v1-14-fe46a9c1a046@oss.qualcomm.com>
 <57we5xzyxvctwzgggqpemlqf7q524mbaqnczqxua6eaehqv6vw@bq4raxwkbava>
Content-Language: en-US
From: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
In-Reply-To: <57we5xzyxvctwzgggqpemlqf7q524mbaqnczqxua6eaehqv6vw@bq4raxwkbava>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: JlQnW_jNB_4saswgkvVQ7FnOwAuIo9R8
X-Proofpoint-GUID: JlQnW_jNB_4saswgkvVQ7FnOwAuIo9R8
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzA5MDA2MiBTYWx0ZWRfXyYIeBjMgqCND
 4cKPOTDCNXSf8Oc4i3GuzKtiQcsz+Neuk5jSXtSdofzFdaobl1Hpsky7+K/DmmaFU9JJLNqFaFG
 oG0OAGbeXnZGcNLx30sNSuUwUEEj7obcMjii24i1A2kLI7ggqNUrZwlW8WYqS3OY72O5tQv1btJ
 9HAUwKyganP9V2UEeP643dufZtrKl2GZi/vihS3L2wA4ngTm3OJoTEIFTKoG8nHt/wn89gbl9bb
 YmfNf5HB8V25wJPQkE9VqFkjyO9jgV8M9YRPO2tIZ8uP2sgEEb5ao9lvLXsZrdXNow9obPhCFAX
 mbAaMsK8i99FsCu+WblpYqFoLhm3LIMVuYO8+g/ixOYGN7KKBLf5FiIGnQC1Qq4F6cffNkm0JN7
 HjsInCoYT7zE60YLVLLzwfux+LCUP1qefdqIxh+ALPSalTSmSZNUlrZbZEH/B2JyMc+fGALrsN0
 XHlLLFxAcedomzHl7qw==
X-Authority-Analysis: v=2.4 cv=dcqNHHXe c=1 sm=1 tr=0 ts=69ae6e6f cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=m5BqE4nBN3PhNdyHHPEA:9 a=QEXdDO2ut3YA:10
 a=OpyuDcXvxspvyRM73sMx:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-09_02,2026-03-06_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 bulkscore=0 spamscore=0 lowpriorityscore=0 adultscore=0
 clxscore=1015 impostorscore=0 malwarescore=0 priorityscore=1501 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603090062
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
X-Rspamd-Queue-Id: DCFAF23471D
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
	NEURAL_HAM(-0.00)[-0.996];
	TAGGED_RCPT(0.00)[dri-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,gabe.freedesktop.org:rdns,gabe.freedesktop.org:helo,qualcomm.com:dkim,qualcomm.com:email,inv.sc:url]
X-Rspamd-Action: no action



On 2/24/2026 4:40 AM, Dmitry Baryshkov wrote:
> On Tue, Feb 24, 2026 at 12:39:08AM +0530, Ekansh Gupta wrote:
>> Extend the QDA FastRPC implementation to support dynamic remote
>> procedure calls from userspace. A new DRM_QDA_INVOKE ioctl is added,
>> which accepts a qda_invoke_args structure containing a remote handle,
>> FastRPC scalars value and a pointer to an array of fastrpc_invoke_args
>> describing the individual arguments. The driver copies the scalar and
>> argument array into a fastrpc_invoke_context and reuses the existing
>> buffer overlap and packing logic to build a GEM-backed message buffer
>> for transport.
>>
>> The FastRPC core gains a FASTRPC_RMID_INVOKE_DYNAMIC method type and a
>> fastrpc_prepare_args_invoke() helper that reads the qda_invoke_args
>> header and argument descriptors from user or kernel memory using a
>> copy_from_user_or_kernel() helper. The generic fastrpc_prepare_args()
>> path is updated to handle the dynamic method alongside the existing
>> INIT_ATTACH and INIT_RELEASE control calls, deriving the number of
>> buffers and scalars from the provided FastRPC scalars encoding.
>>
>> On the transport side qda_ioctl_invoke() simply forwards the request
>> to fastrpc_invoke() with the dynamic method id, allowing the RPMsg
>> transport and context lookup to treat dynamic calls in the same way as
>> the existing control methods. This patch establishes the basic FastRPC
>> invoke mechanism on top of the QDA GEM and RPMsg infrastructure so
>> that future patches can wire up more complex DSP APIs.
>>
>> Signed-off-by: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
>> ---
>>  drivers/accel/qda/qda_drv.c     |  1 +
>>  drivers/accel/qda/qda_fastrpc.c | 48 +++++++++++++++++++++++++++++++++++++++++
>>  drivers/accel/qda/qda_fastrpc.h |  1 +
>>  drivers/accel/qda/qda_ioctl.c   |  5 +++++
>>  drivers/accel/qda/qda_ioctl.h   | 13 +++++++++++
>>  include/uapi/drm/qda_accel.h    | 21 ++++++++++++++++++
>>  6 files changed, 89 insertions(+)
>>
>> diff --git a/drivers/accel/qda/qda_drv.c b/drivers/accel/qda/qda_drv.c
>> index 3034ea660924..f94f780ea50a 100644
>> --- a/drivers/accel/qda/qda_drv.c
>> +++ b/drivers/accel/qda/qda_drv.c
>> @@ -162,6 +162,7 @@ static const struct drm_ioctl_desc qda_ioctls[] = {
>>  	DRM_IOCTL_DEF_DRV(QDA_GEM_CREATE, qda_ioctl_gem_create, 0),
>>  	DRM_IOCTL_DEF_DRV(QDA_GEM_MMAP_OFFSET, qda_ioctl_gem_mmap_offset, 0),
>>  	DRM_IOCTL_DEF_DRV(QDA_INIT_ATTACH, qda_ioctl_attach, 0),
>> +	DRM_IOCTL_DEF_DRV(QDA_INVOKE, qda_ioctl_invoke, 0),
>>  };
>>  
>>  static struct drm_driver qda_drm_driver = {
>> diff --git a/drivers/accel/qda/qda_fastrpc.c b/drivers/accel/qda/qda_fastrpc.c
>> index eda7c90070ee..a48b255ffb1b 100644
>> --- a/drivers/accel/qda/qda_fastrpc.c
>> +++ b/drivers/accel/qda/qda_fastrpc.c
>> @@ -12,6 +12,16 @@
>>  #include "qda_gem.h"
>>  #include "qda_memory_manager.h"
>>  
>> +static int copy_from_user_or_kernel(void *dst, const void __user *src, size_t size)
>> +{
>> +	if ((unsigned long)src >= PAGE_OFFSET) {
>> +		memcpy(dst, src, size);
>> +		return 0;
>> +	} else {
>> +		return copy_from_user(dst, src, size) ? -EFAULT : 0;
>> +	}
> Nah, it's a direct route to failure. __user is for user pointers, it
> can't be a kernel data. Define separate functions and be 100% sure
> whether the data is coming from the user (and thus needs to be
> sanitized) or of it is coming from the kernel. Otherwise a funny user
> can pass kernel pointer and get away with your code copying data from or
> writing data to the kernel buffer.
I see, I get your comment on the other patch also, I'll fix this.
>
>> +}
>> +
>>  static int copy_to_user_or_kernel(void __user *dst, const void *src, size_t size)
>>  {
>>  	if ((unsigned long)dst >= PAGE_OFFSET) {
>> @@ -509,6 +519,41 @@ static int fastrpc_prepare_args_release_process(struct fastrpc_invoke_context *c
>>  	return 0;
>>  }
>>  
>> +static int fastrpc_prepare_args_invoke(struct fastrpc_invoke_context *ctx, char __user *argp)
>> +{
>> +	struct fastrpc_invoke_args *args = NULL;
>> +	struct qda_invoke_args inv;
>> +	int err = 0;
>> +	int nscalars;
>> +
>> +	if (!argp)
>> +		return -EINVAL;
>> +
>> +	err = copy_from_user_or_kernel(&inv, argp, sizeof(inv));
>> +	if (err)
>> +		return err;
>> +
>> +	nscalars = REMOTE_SCALARS_LENGTH(inv.sc);
>> +
>> +	if (nscalars) {
>> +		args = kcalloc(nscalars, sizeof(*args), GFP_KERNEL);
>> +		if (!args)
>> +			return -ENOMEM;
>> +
>> +		err = copy_from_user_or_kernel(args, (const void __user *)(uintptr_t)inv.args,
>> +					       nscalars * sizeof(*args));
> So... You are allowing users to specify the address in the kernel
> address space? Are you... sure?
ack, I'll fix this
>
>> +		if (err) {
>> +			kfree(args);
>> +			return err;
>> +		}
>> +	}
>> +	ctx->sc = inv.sc;
>> +	ctx->args = args;
>> +	ctx->handle = inv.handle;
>> +
>> +	return 0;
>> +}
>> +
>>  int fastrpc_prepare_args(struct fastrpc_invoke_context *ctx, char __user *argp)
>>  {
>>  	int err;
>> @@ -521,6 +566,9 @@ int fastrpc_prepare_args(struct fastrpc_invoke_context *ctx, char __user *argp)
>>  	case FASTRPC_RMID_INIT_RELEASE:
>>  		err = fastrpc_prepare_args_release_process(ctx);
>>  		break;
>> +	case FASTRPC_RMID_INVOKE_DYNAMIC:
>> +		err = fastrpc_prepare_args_invoke(ctx, argp);
>> +		break;
>>  	default:
>>  		return -EINVAL;
>>  	}
>> diff --git a/drivers/accel/qda/qda_fastrpc.h b/drivers/accel/qda/qda_fastrpc.h
>> index 744421382079..bcadf9437a36 100644
>> --- a/drivers/accel/qda/qda_fastrpc.h
>> +++ b/drivers/accel/qda/qda_fastrpc.h
>> @@ -237,6 +237,7 @@ struct fastrpc_invoke_context {
>>  /* Remote Method ID table - identifies initialization and control operations */
>>  #define FASTRPC_RMID_INIT_ATTACH	0	/* Attach to DSP session */
>>  #define FASTRPC_RMID_INIT_RELEASE	1	/* Release DSP session */
>> +#define FASTRPC_RMID_INVOKE_DYNAMIC	0xFFFFFFFF	/* Dynamic method invocation */
>>  
>>  /* Common handle for initialization operations */
>>  #define FASTRPC_INIT_HANDLE		0x1
>> diff --git a/drivers/accel/qda/qda_ioctl.c b/drivers/accel/qda/qda_ioctl.c
>> index 1066ab6ddc7b..e90aceabd30d 100644
>> --- a/drivers/accel/qda/qda_ioctl.c
>> +++ b/drivers/accel/qda/qda_ioctl.c
>> @@ -192,3 +192,8 @@ int fastrpc_release_current_dsp_process(struct qda_dev *qdev, struct drm_file *f
>>  {
>>  	return fastrpc_invoke(FASTRPC_RMID_INIT_RELEASE, qdev->drm_dev, NULL, file_priv);
>>  }
>> +
>> +int qda_ioctl_invoke(struct drm_device *dev, void *data, struct drm_file *file_priv)
>> +{
>> +	return fastrpc_invoke(FASTRPC_RMID_INVOKE_DYNAMIC, dev, data, file_priv);
>> +}
>> diff --git a/drivers/accel/qda/qda_ioctl.h b/drivers/accel/qda/qda_ioctl.h
>> index 044c616a51c6..e186c5183171 100644
>> --- a/drivers/accel/qda/qda_ioctl.h
>> +++ b/drivers/accel/qda/qda_ioctl.h
>> @@ -63,4 +63,17 @@ int qda_ioctl_attach(struct drm_device *dev, void *data, struct drm_file *file_p
>>   */
>>  int fastrpc_release_current_dsp_process(struct qda_dev *qdev, struct drm_file *file_priv);
>>  
>> +/**
>> + * qda_ioctl_invoke - Invoke a remote procedure on the DSP
>> + * @dev: DRM device structure
>> + * @data: User-space data containing invocation parameters
>> + * @file_priv: DRM file private data
>> + *
>> + * This IOCTL handler initiates a remote procedure call on the DSP,
>> + * marshalling arguments, executing the call, and returning results.
>> + *
>> + * Return: 0 on success, negative error code on failure
>> + */
>> +int qda_ioctl_invoke(struct drm_device *dev, void *data, struct drm_file *file_priv);
>> +
>>  #endif /* _QDA_IOCTL_H */
>> diff --git a/include/uapi/drm/qda_accel.h b/include/uapi/drm/qda_accel.h
>> index 4d3666c5b998..01072a9d0a91 100644
>> --- a/include/uapi/drm/qda_accel.h
>> +++ b/include/uapi/drm/qda_accel.h
>> @@ -22,6 +22,9 @@ extern "C" {
>>  #define DRM_QDA_GEM_CREATE		0x01
>>  #define DRM_QDA_GEM_MMAP_OFFSET	0x02
>>  #define DRM_QDA_INIT_ATTACH		0x03
>> +/* Indexes 0x04 to 0x06 are reserved for other requests */
>> +#define DRM_QDA_INVOKE			0x07
>> +
>>  /*
>>   * QDA IOCTL definitions
>>   *
>> @@ -35,6 +38,8 @@ extern "C" {
>>  #define DRM_IOCTL_QDA_GEM_MMAP_OFFSET	DRM_IOWR(DRM_COMMAND_BASE + DRM_QDA_GEM_MMAP_OFFSET, \
>>  						 struct drm_qda_gem_mmap_offset)
>>  #define DRM_IOCTL_QDA_INIT_ATTACH	DRM_IO(DRM_COMMAND_BASE + DRM_QDA_INIT_ATTACH)
>> +#define DRM_IOCTL_QDA_INVOKE		DRM_IOWR(DRM_COMMAND_BASE + DRM_QDA_INVOKE, \
>> +						 struct qda_invoke_args)
>>  
>>  /**
>>   * struct drm_qda_query - Device information query structure
>> @@ -95,6 +100,22 @@ struct fastrpc_invoke_args {
>>  	__u32 attr;
>>  };
>>  
>> +/**
>> + * struct qda_invoke_args - User-space IOCTL arguments for invoking a function
>> + * @handle: Handle identifying the remote function to invoke
>> + * @sc: Scalars parameter encoding buffer counts and attributes
> Encoding... how?
I can add more details for this over here or over FASTRPC_BUILD_SCALARS definition.
>
>> + * @args: User-space pointer to the argument array
> Which is defined at...?
>
>
> Can you actually write the user code by looking at your uapi header?
will add more details for this.
>
>> + *
>> + * This structure is passed from user-space to invoke a remote function
>> + * on the DSP. The scalars parameter encodes the number and types of
>> + * input/output buffers.
>> + */
>> +struct qda_invoke_args {
>> +	__u32 handle;
>> +	__u32 sc;
>> +	__u64 args;
>> +};
>> +
>>  #if defined(__cplusplus)
>>  }
>>  #endif
>>
>> -- 
>> 2.34.1
>>

