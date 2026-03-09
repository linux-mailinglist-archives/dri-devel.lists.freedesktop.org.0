Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2HPoJbltrmmaEAIAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Mon, 09 Mar 2026 07:50:33 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D189D234630
	for <lists+dri-devel@lfdr.de>; Mon, 09 Mar 2026 07:50:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BF35D10E0F3;
	Mon,  9 Mar 2026 06:50:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="ZG25O7CU";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="cT2ane56";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AEBFB10E0F3
 for <dri-devel@lists.freedesktop.org>; Mon,  9 Mar 2026 06:50:28 +0000 (UTC)
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 629604ai1667805
 for <dri-devel@lists.freedesktop.org>; Mon, 9 Mar 2026 06:50:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 +YUGKJcVHDwmTEA5k0xIPcnwbj0zeLWcGJuZoADg3mk=; b=ZG25O7CUf4aP/nyJ
 oGb6PnYcrfrij5y3O5A8MSken0+2uEN2mfbCNJhpP8J9btClt0K5NMjS0mSD0eti
 NEXM27G7XagA31lFGjZxtTo0I/zo/b4Y+KQoI8EaEfbyYzVUDVSfUjGWK37NMkO9
 x8uJgaNd3YyK9h8ZywZEI8CoGN29vKLIGnGv93PVJ0DAng86PoslIwb2eipFcDd3
 WmutjcsjqSbtvRQYU3eZJi/++OI6y7OjWkpa5mA2alPKbv5usyFRJgkvsAO2zG4K
 ThHVGjkogcHuGION2VIejvD5tlhFXUR2nyph40amKS8hh0voDpPK1ZfWwYoTW6St
 GhkIUQ==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com
 [209.85.210.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4crc83c6rd-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Mon, 09 Mar 2026 06:50:27 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id
 d2e1a72fcca58-829b20cc6faso1278879b3a.1
 for <dri-devel@lists.freedesktop.org>; Sun, 08 Mar 2026 23:50:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1773039027; x=1773643827;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=+YUGKJcVHDwmTEA5k0xIPcnwbj0zeLWcGJuZoADg3mk=;
 b=cT2ane56Qt3RZ846gcmE+b0K+UU/8H9RSzPFF7D98Tfn0TkP5aj9cgVyX4HiLhGVOa
 MudYaIxNKDPWxOCcN4e9e67Or+h2tlhtEfbABFmmy106rnBUDDafEO40sXLUt96cUWaW
 60wzWRNXciizQ8xcDwojgnyU0KX6Ut7+qTqecDKTy4bmtTvryu83rE7wdnoZRtJvzbth
 ZW3Lw3ts0iKMrDFriaGEBIpSvvRwipbnPIW6aPeh0Usdyn1EZqJ6KV3R7jNG9Vdi8c3c
 dUN0OBJlXMEvO1ISKXq4Up7FhEywXCNHqNplqYnwZ7jlepi7gqVAo871zdklNzlC2+7z
 aWpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1773039027; x=1773643827;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=+YUGKJcVHDwmTEA5k0xIPcnwbj0zeLWcGJuZoADg3mk=;
 b=Eik8g11jCXaNE7EqeVegPqYUCVMywbYQtAUFBhG9aQy4RrsCw7O7vN8y+AHJXiQSAz
 HecahtuZHuOae8OrzJ4fl1+qZmxKPQCMzG7OiD620ncG33c7Lt0rn76YXgQW7jpznZi1
 1qsgpAcfFRj+0YmHwipuMyasRtGyzGlyyk9X0SFVlj4ETD5vUqP1+p+8RgWfQGulybMR
 GbYr2hl0MEMDgM+slwiuLitZYu9r5N/R0XrkLlWQpSja42tOHPdx3CS4DQbmlA5Mvx/F
 6UGd/n61sRrHc1vbYuj5092mfyi+b3FoTrsc1n9KnOERSZYIrPlo1eovIdtrRESSa/zg
 sjUA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVHf5+O7i2UMuolmIJcHgUP9dmSPkZoIYHcQjHSEmWsyebLqivf3hEdo7RAfBkhFBV/G3n/1JubcoA=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yz0U8ppRe+CWac/d+GCVWRAnl9PuKPvGke0Ct4oRXAHPFGau8AS
 spbdUZVtBTOMAXtmUDP/kSSEeHWSM/NzEWoyih/+mvQewYGebNrRlXeS/+5tSrJsHwKghbixDTd
 748KIwib6ILIhBtl4yiZ0SVtOu1p8q/PcOixCyQUWKUtZe6RCaeKxkheLX/grv5mf47ObRd8=
X-Gm-Gg: ATEYQzwrUbiCJGbBfwecDt/Z0xh9O9SVl/hdAuVJltgvvUtmwHraElrBEzrhbJetemq
 aj8lF5v/83qS9QoscEAww4OaPWP9vWmIQ/W7qZesw6APBm7+PiuojenFmF079qjiDLQ6qcS7Xh9
 QQAc9pFlqpCyN9ONofpuaeFZ+zPeSyN/mzjIvqqGT4t2lpc7bBhOhEQYn/fvOM6m9U/X/3tFZEV
 EDtg9wtn2tIbtmvME5J2eC2FbOO/Qw/6m/UovjrYBP3slCng7hFSV1QveiYXyAsNgTviONFChop
 ZYclItn6CzIXfJ66EngHtO5iFWg5qarP/jsYVSt1K/X7bykA22tzygErhW5Sf3RWUe0ot19KNQ0
 qe/6RVtJGURsDewguCr7g55TTg1HOWvcWgx0KANbJ3LWaMXviXw==
X-Received: by 2002:a05:6a00:1795:b0:829:7a62:6a with SMTP id
 d2e1a72fcca58-829a2a9b1c9mr8067875b3a.22.1773039026810; 
 Sun, 08 Mar 2026 23:50:26 -0700 (PDT)
X-Received: by 2002:a05:6a00:1795:b0:829:7a62:6a with SMTP id
 d2e1a72fcca58-829a2a9b1c9mr8067853b3a.22.1773039026072; 
 Sun, 08 Mar 2026 23:50:26 -0700 (PDT)
Received: from [10.206.99.28] ([202.46.23.25])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-829a4657445sm9479122b3a.17.2026.03.08.23.50.18
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 08 Mar 2026 23:50:25 -0700 (PDT)
Message-ID: <fe0cc8c5-1227-4c2a-a212-1020ed77134c@oss.qualcomm.com>
Date: Mon, 9 Mar 2026 12:20:16 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC 13/18] accel/qda: Add initial FastRPC attach and
 release support
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
 <20260224-qda-firstpost-v1-13-fe46a9c1a046@oss.qualcomm.com>
 <ftmqbinzip5n7i3r2xkqs7suuk6f7hyhda2k2uh33lespel2zt@zgzikm4zttvn>
Content-Language: en-US
From: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
In-Reply-To: <ftmqbinzip5n7i3r2xkqs7suuk6f7hyhda2k2uh33lespel2zt@zgzikm4zttvn>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=R9UO2NRX c=1 sm=1 tr=0 ts=69ae6db4 cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=6T967LmF1jFX1ZZhiZQA:9 a=sCzgb49JE9CtH6OP:21
 a=QEXdDO2ut3YA:10 a=2VI0MkxyNR6bbpdq8BZq:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzA5MDA2MSBTYWx0ZWRfXxrKohnDa1CDL
 Q7v8+PBZK8WUi7HwqF2gW3gyE5ENgfIX6pYA5UvUwi74zMUOCuniwTvefwU4b/2x3oE9+nqcKgm
 k7SZ1TIgmaNplnmFi3gnOcTgSQIu6sM+3Udyi/wRQ1aZs8zsPgNuA7dh0KZFcphCIH05w2gHydR
 xpDfrPc7ATbdDBUZq2yNijYEW/668fLXRCQx5uZ6kwQJn1mw75ySEUBuHZPrb1h0VUqexGbBfoj
 DVPYQi/hOnYDHDNHzTOAdD+Cr8vVE6dJpRnxS02f6UtJxxUnmpYAOEmhfeKv8VjrYuNQYExl3y2
 VaiVurgR8do4jQcgOz+JVxv4R+Evb3Zlg28g5tuMcsIE44XBHnL71PM93dANLlo8L8FtueHb2S9
 xxWjSm9uVRi2LdvhdBVe5mPnMohDOsEG6xy0ETEX09gbLly6CbpbGdyiZ7AAErAmj/DtlecPOrX
 CjiZxbwzux+TqNs0Hjg==
X-Proofpoint-ORIG-GUID: McB17C5KxV9lqo4xdmKdw5ggx2CvQWkr
X-Proofpoint-GUID: McB17C5KxV9lqo4xdmKdw5ggx2CvQWkr
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-09_02,2026-03-06_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 lowpriorityscore=0 phishscore=0 bulkscore=0
 adultscore=0 priorityscore=1501 spamscore=0 malwarescore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603090061
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
X-Rspamd-Queue-Id: D189D234630
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
	NEURAL_HAM(-0.00)[-0.995];
	TAGGED_RCPT(0.00)[dri-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,gabe.freedesktop.org:rdns,gabe.freedesktop.org:helo,qualcomm.com:dkim,qualcomm.com:email]
X-Rspamd-Action: no action



On 2/24/2026 4:37 AM, Dmitry Baryshkov wrote:
> On Tue, Feb 24, 2026 at 12:39:07AM +0530, Ekansh Gupta wrote:
>> Add the initial FastRPC invocation plumbing to the QDA accelerator
>> driver to support attaching to and releasing a DSP process. A new
>> fastrpc_invoke_context structure tracks the state of a single remote
> So, why does it embed kref?
I'll remove kref from ctx.
>
>> procedure call, including arguments, overlap handling, completion and
>> GEM-based message buffers. Contexts are indexed through an xarray in
>> qda_dev so that RPMsg callbacks can match responses back to the
>> originating invocation.
> Again, IDR? Or not?
Same comment as other patches
>
>> The new qda_fastrpc implementation provides helpers to prepare
>> FastRPC scalars and arguments, pack them into a QDA message backed by
>> a GEM buffer and unpack responses. The FastRPC INIT_ATTACH and
>> INIT_RELEASE methods are wired up via a new QDA_INIT_ATTACH ioctl and
>> a postclose hook that sends a release request when a client file
>> descriptor is closed. On the transport side qda_rpmsg_send_msg()
>> builds and sends a fastrpc_msg over RPMsg, while qda_rpmsg_cb()
>> decodes qda_invoke_rsp messages, looks up the context by its id and
>> completes the corresponding wait.
>>
>> This lays the foundation for QDA FastRPC method support on top of the
>> existing GEM and RPMsg infrastructure, starting with the attach and
>> release control flows for DSP sessions.
> I think the FastRPC backing code should be a separate commit,
> INIT_ATTACH another, separate commit.
ack
>
>> Signed-off-by: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
>> ---
>>  drivers/accel/qda/Makefile      |   1 +
>>  drivers/accel/qda/qda_drv.c     |   5 +
>>  drivers/accel/qda/qda_drv.h     |   2 +
>>  drivers/accel/qda/qda_fastrpc.c | 548 ++++++++++++++++++++++++++++++++++++++++
>>  drivers/accel/qda/qda_fastrpc.h | 303 ++++++++++++++++++++++
>>  drivers/accel/qda/qda_ioctl.c   | 107 ++++++++
>>  drivers/accel/qda/qda_ioctl.h   |  25 ++
>>  drivers/accel/qda/qda_rpmsg.c   | 164 +++++++++++-
>>  drivers/accel/qda/qda_rpmsg.h   |  40 +++
>>  include/uapi/drm/qda_accel.h    |  19 ++
>>  10 files changed, 1212 insertions(+), 2 deletions(-)
>>
>> diff --git a/include/uapi/drm/qda_accel.h b/include/uapi/drm/qda_accel.h
>> index ed24a7f5637e..4d3666c5b998 100644
>> --- a/include/uapi/drm/qda_accel.h
>> +++ b/include/uapi/drm/qda_accel.h
> [moved this file to the beginning of the patch to ease reviewing]
ack.
>
>> @@ -21,6 +21,7 @@ extern "C" {
>>  #define DRM_QDA_QUERY	0x00
>>  #define DRM_QDA_GEM_CREATE		0x01
>>  #define DRM_QDA_GEM_MMAP_OFFSET	0x02
>> +#define DRM_QDA_INIT_ATTACH		0x03
>>  /*
>>   * QDA IOCTL definitions
>>   *
>> @@ -33,6 +34,7 @@ extern "C" {
>>  						 struct drm_qda_gem_create)
>>  #define DRM_IOCTL_QDA_GEM_MMAP_OFFSET	DRM_IOWR(DRM_COMMAND_BASE + DRM_QDA_GEM_MMAP_OFFSET, \
>>  						 struct drm_qda_gem_mmap_offset)
>> +#define DRM_IOCTL_QDA_INIT_ATTACH	DRM_IO(DRM_COMMAND_BASE + DRM_QDA_INIT_ATTACH)
>>  
>>  /**
>>   * struct drm_qda_query - Device information query structure
>> @@ -76,6 +78,23 @@ struct drm_qda_gem_mmap_offset {
>>  	__u64 offset;
>>  };
>>  
>> +/**
>> + * struct fastrpc_invoke_args - FastRPC invocation argument descriptor
>> + * @ptr: Pointer to argument data (user virtual address)
>> + * @length: Length of the argument data in bytes
> And the data is defined... where?
>
>> + * @fd: File descriptor for buffer arguments, -1 for scalar arguments
>> + * @attr: Argument attributes and flags
> Which attributes and flags?
this struct is taken similar to the existing fastrpc uAPI. I'll add more details.
>
>> + *
>> + * This structure describes a single argument passed to a FastRPC invocation.
>> + * Arguments can be either scalar values or buffer references (via file descriptor).
> Can't it just be GEM handle + offset inside the handle?
Yes, fd is actually getting replaced with GEM handle.
>
>> + */
>> +struct fastrpc_invoke_args {
>> +	__u64 ptr;
>> +	__u64 length;
>> +	__s32 fd;
>> +	__u32 attr;
>> +};
>> +
>>  #if defined(__cplusplus)
>>  }
>>  #endif
>>
>> diff --git a/drivers/accel/qda/Makefile b/drivers/accel/qda/Makefile
>> index 8286f5279748..82d40e452fa9 100644
>> --- a/drivers/accel/qda/Makefile
>> +++ b/drivers/accel/qda/Makefile
>> @@ -14,5 +14,6 @@ qda-y := \
>>  	qda_gem.o \
>>  	qda_memory_dma.o \
>>  	qda_prime.o \
>> +	qda_fastrpc.o \
>>  
>>  obj-$(CONFIG_DRM_ACCEL_QDA_COMPUTE_BUS) += qda_compute_bus.o
>> diff --git a/drivers/accel/qda/qda_drv.c b/drivers/accel/qda/qda_drv.c
>> index 4adee00b1f2c..3034ea660924 100644
>> --- a/drivers/accel/qda/qda_drv.c
>> +++ b/drivers/accel/qda/qda_drv.c
>> @@ -120,6 +120,8 @@ static void qda_postclose(struct drm_device *dev, struct drm_file *file)
>>  		return;
>>  	}
>>  
>> +	fastrpc_release_current_dsp_process(qdev, file);
> No, this is not the fastrpc driver.
ack.
>
>> +
>>  	qda_file_priv = (struct qda_file_priv *)file->driver_priv;
>>  	if (qda_file_priv) {
>>  		if (qda_file_priv->assigned_iommu_dev) {
>> @@ -159,6 +161,7 @@ static const struct drm_ioctl_desc qda_ioctls[] = {
>>  	DRM_IOCTL_DEF_DRV(QDA_QUERY, qda_ioctl_query, 0),
>>  	DRM_IOCTL_DEF_DRV(QDA_GEM_CREATE, qda_ioctl_gem_create, 0),
>>  	DRM_IOCTL_DEF_DRV(QDA_GEM_MMAP_OFFSET, qda_ioctl_gem_mmap_offset, 0),
>> +	DRM_IOCTL_DEF_DRV(QDA_INIT_ATTACH, qda_ioctl_attach, 0),
>>  };
>>  
>>  static struct drm_driver qda_drm_driver = {
>> @@ -195,6 +198,7 @@ static void cleanup_iommu_manager(struct qda_dev *qdev)
>>  
>>  static void cleanup_device_resources(struct qda_dev *qdev)
>>  {
>> +	xa_destroy(&qdev->ctx_xa);
> I thought xarray was in some other patch. What is this ctx_xa?
ctx_xa is for ctxid allocations.
>
>>  	mutex_destroy(&qdev->lock);
>>  }
>>  
>> @@ -213,6 +217,7 @@ static void init_device_resources(struct qda_dev *qdev)
>>  	mutex_init(&qdev->lock);
>>  	atomic_set(&qdev->removing, 0);
>>  	atomic_set(&qdev->client_id_counter, 0);
>> +	xa_init_flags(&qdev->ctx_xa, XA_FLAGS_ALLOC1);
>>  }
>>  
>>  static int init_memory_manager(struct qda_dev *qdev)
>> diff --git a/drivers/accel/qda/qda_drv.h b/drivers/accel/qda/qda_drv.h
>> index bb0dd7e284c6..bb1d1e82036a 100644
>> --- a/drivers/accel/qda/qda_drv.h
>> +++ b/drivers/accel/qda/qda_drv.h
>> @@ -92,6 +92,8 @@ struct qda_dev {
>>  	char dsp_name[16];
>>  	/* Compute context-bank (CB) child devices */
>>  	struct list_head cb_devs;
>> +	/* XArray for context management */
>> +	struct xarray ctx_xa;
>>  };
>>  
>>  /**
>> diff --git a/drivers/accel/qda/qda_fastrpc.c b/drivers/accel/qda/qda_fastrpc.c
>> new file mode 100644
>> index 000000000000..eda7c90070ee
>> --- /dev/null
>> +++ b/drivers/accel/qda/qda_fastrpc.c
>> @@ -0,0 +1,548 @@
>> +// SPDX-License-Identifier: GPL-2.0-only
>> +// Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
>> +#include <linux/slab.h>
>> +#include <linux/uaccess.h>
>> +#include <linux/sort.h>
>> +#include <linux/completion.h>
>> +#include <linux/dma-buf.h>
>> +#include <drm/drm_gem.h>
>> +#include <drm/qda_accel.h>
>> +#include "qda_fastrpc.h"
>> +#include "qda_drv.h"
>> +#include "qda_gem.h"
>> +#include "qda_memory_manager.h"
>> +
>> +static int copy_to_user_or_kernel(void __user *dst, const void *src, size_t size)
>> +{
>> +	if ((unsigned long)dst >= PAGE_OFFSET) {
>> +		memcpy(dst, src, size);
>> +		return 0;
>> +	} else {
>> +		return copy_to_user(dst, src, size) ? -EFAULT : 0;
> Huh?
Can you please tell me what is wrong here? Should I drop else case completely if
DRM is ensuring kernel pointer?
>
>> +	}
>> +}
>> +
>> +static int get_gem_obj_from_handle(struct drm_file *file_priv, u32 handle,
>> +				   struct drm_gem_object **gem_obj)
>> +{
>> +	if (handle == 0)
>> +		return -EINVAL;
> Let the system do its job.
ack
>
>> +
>> +	if (!file_priv)
>> +		return -EINVAL;
> Can it be NULL?
I'll re-evaluate and remove this check.
>
>> +
>> +	*gem_obj = drm_gem_object_lookup(file_priv, handle);
>> +	if (*gem_obj)
>> +		return 0;
>> +
>> +	return -ENOENT;
>> +}
>> +
>> +static void setup_pages_from_gem_obj(struct qda_gem_obj *qda_gem_obj,
>> +				     struct fastrpc_phy_page *pages)
>> +{
>> +	if (qda_gem_obj->is_imported)
>> +		pages->addr = qda_gem_obj->imported_dma_addr;
>> +	else
>> +		pages->addr = qda_gem_obj->dma_addr;
> Why do you need tow kinds of addresses?
not really needed as I have already added a flag suggesting imported buffer, I'll fix this
>
>> +
>> +	pages->size = qda_gem_obj->size;
>> +}
>> +
>> +static u64 calculate_vma_offset(u64 user_ptr)
>> +{
>> +	struct vm_area_struct *vma;
>> +	u64 user_ptr_page_mask = user_ptr & PAGE_MASK;
>> +	u64 vma_offset = 0;
>> +
>> +	mmap_read_lock(current->mm);
>> +	vma = find_vma(current->mm, user_ptr);
>> +	if (vma)
>> +		vma_offset = user_ptr_page_mask - vma->vm_start;
>> +	mmap_read_unlock(current->mm);
>> +
>> +	return vma_offset;
>> +}
>> +
>> +static u64 calculate_page_aligned_size(u64 ptr, u64 len)
>> +{
>> +	u64 pg_start = (ptr & PAGE_MASK) >> PAGE_SHIFT;
>> +	u64 pg_end = ((ptr + len - 1) & PAGE_MASK) >> PAGE_SHIFT;
>> +	u64 aligned_size = (pg_end - pg_start + 1) * PAGE_SIZE;
>> +
>> +	return aligned_size;
>> +}
>> +
>> +static void setup_single_arg(struct fastrpc_invoke_args *args, void *ptr, size_t size)
>> +{
>> +	args[0].ptr = (u64)(uintptr_t)ptr;
> What kind of address is it? If ptr is on the DSP side, then it should
> not be void* here.
Not a DSP side ptr. It's pointer to different arguments that are being passed to DSP.
>
>> +	args[0].length = size;
>> +	args[0].fd = -1;
>> +}
>> +
>> +static struct fastrpc_invoke_buf *fastrpc_invoke_buf_start(union fastrpc_remote_arg *pra, int len)
>> +{
>> +	struct fastrpc_invoke_buf *buf = (struct fastrpc_invoke_buf *)(&pra[len]);
>> +	return buf;
>> +}
>> +
>> +static struct fastrpc_phy_page *fastrpc_phy_page_start(struct fastrpc_invoke_buf *buf, int len)
>> +{
>> +	struct fastrpc_phy_page *pages = (struct fastrpc_phy_page *)(&buf[len]);
>> +	return pages;
>> +}
>> +
>> +static int fastrpc_get_meta_size(struct fastrpc_invoke_context *ctx)
>> +{
>> +	int size = 0;
>> +
>> +	size = (sizeof(struct fastrpc_remote_buf) +
>> +		sizeof(struct fastrpc_invoke_buf) +
>> +		sizeof(struct fastrpc_phy_page)) * ctx->nscalars +
>> +		sizeof(u64) * FASTRPC_MAX_FDLIST +
>> +		sizeof(u32) * FASTRPC_MAX_CRCLIST;
>> +
>> +	return size;
>> +}
>> +
>> +static u64 fastrpc_get_payload_size(struct fastrpc_invoke_context *ctx, int metalen)
>> +{
>> +	u64 size = 0;
>> +	int oix;
>> +
>> +	size = ALIGN(metalen, FASTRPC_ALIGN);
>> +
>> +	for (oix = 0; oix < ctx->nbufs; oix++) {
>> +		int i = ctx->olaps[oix].raix;
> whts olaps?
>
> Why do you need to specially track it?
olaps are the buffer overlapping details

this is for copy buffers(non-GEM buffers), which gets copied to the meta-data
>
>
>> +
>> +		if (ctx->args[i].fd == 0 || ctx->args[i].fd == -1) {
>> +			if (ctx->olaps[oix].offset == 0)
>> +				size = ALIGN(size, FASTRPC_ALIGN);
>> +
>> +			size += (ctx->olaps[oix].mend - ctx->olaps[oix].mstart);
>> +		}
>> +	}
>> +
>> +	return size;
>> +}
>> +
>> +void fastrpc_context_free(struct kref *ref)
>> +{
>> +	struct fastrpc_invoke_context *ctx;
>> +	int i;
>> +
>> +	ctx = container_of(ref, struct fastrpc_invoke_context, refcount);
>> +	if (ctx->gem_objs) {
>> +		for (i = 0; i < ctx->nscalars; ++i) {
>> +			if (ctx->gem_objs[i]) {
>> +				drm_gem_object_put(ctx->gem_objs[i]);
>> +				ctx->gem_objs[i] = NULL;
>> +			}
>> +		}
>> +		kfree(ctx->gem_objs);
>> +		ctx->gem_objs = NULL;
> You are going to kfree ctx. Why do you need to zero the field?
ack
>
>> +	}
>> +
>> +	if (ctx->msg_gem_obj) {
>> +		drm_gem_object_put(&ctx->msg_gem_obj->base);
>> +		ctx->msg_gem_obj = NULL;
>> +	}
>> +
>> +	kfree(ctx->olaps);
>> +	ctx->olaps = NULL;
>> +
>> +	kfree(ctx->args);
>> +	kfree(ctx->req);
>> +	kfree(ctx->rsp);
>> +	kfree(ctx->input_pages);
>> +	kfree(ctx->inbuf);
> Generally it feels like there are too many allocations and frees for a
> single RPC call. Can all these buffers be embedded into the context
> instead?
I'll check this.
>
>> +
>> +	kfree(ctx);
>> +}
>> +
>> +#define CMP(aa, bb) ((aa) == (bb) ? 0 : (aa) < (bb) ? -1 : 1)
>
>
>> +
>> +static int olaps_cmp(const void *a, const void *b)
>> +{
>> +	struct fastrpc_buf_overlap *pa = (struct fastrpc_buf_overlap *)a;
>> +	struct fastrpc_buf_overlap *pb = (struct fastrpc_buf_overlap *)b;
>> +	int st = CMP(pa->start, pb->start);
>> +	int ed = CMP(pb->end, pa->end);
>> +
>> +	return st == 0 ? ed : st;
> wist?
the sorting logic is taken from fastrpc.
>
>> +}
>> +
>> +static void fastrpc_get_buff_overlaps(struct fastrpc_invoke_context *ctx)
>> +{
>> +	u64 max_end = 0;
>> +	int i;
>> +
>> +	for (i = 0; i < ctx->nbufs; ++i) {
>> +		ctx->olaps[i].start = ctx->args[i].ptr;
>> +		ctx->olaps[i].end = ctx->olaps[i].start + ctx->args[i].length;
>> +		ctx->olaps[i].raix = i;
>> +	}
>> +
>> +	sort(ctx->olaps, ctx->nbufs, sizeof(*ctx->olaps), olaps_cmp, NULL);
>> +
>> +	for (i = 0; i < ctx->nbufs; ++i) {
>> +		if (ctx->olaps[i].start < max_end) {
>> +			ctx->olaps[i].mstart = max_end;
>> +			ctx->olaps[i].mend = ctx->olaps[i].end;
>> +			ctx->olaps[i].offset = max_end - ctx->olaps[i].start;
>> +
>> +			if (ctx->olaps[i].end > max_end) {
>> +				max_end = ctx->olaps[i].end;
>> +			} else {
>> +				ctx->olaps[i].mend = 0;
>> +				ctx->olaps[i].mstart = 0;
>> +			}
>> +		} else {
>> +			ctx->olaps[i].mend = ctx->olaps[i].end;
>> +			ctx->olaps[i].mstart = ctx->olaps[i].start;
>> +			ctx->olaps[i].offset = 0;
>> +			max_end = ctx->olaps[i].end;
>> +		}
>> +	}
>> +}
>> +
>> +struct fastrpc_invoke_context *fastrpc_context_alloc(void)
>> +{
>> +	struct fastrpc_invoke_context *ctx = NULL;
>> +
>> +	ctx = kzalloc_obj(*ctx, GFP_KERNEL);
>> +	if (!ctx)
>> +		return ERR_PTR(-ENOMEM);
>> +
>> +	INIT_LIST_HEAD(&ctx->node);
>> +
>> +	ctx->retval = -1;
>> +	ctx->pid = current->pid;
>> +	init_completion(&ctx->work);
>> +	ctx->msg_gem_obj = NULL;
>> +	kref_init(&ctx->refcount);
>> +
>> +	return ctx;
>> +}
>> +
>> +static int process_fd_buffer(struct fastrpc_invoke_context *ctx, int i,
>> +			     union fastrpc_remote_arg *rpra, struct fastrpc_phy_page *pages)
>> +{
>> +	struct drm_gem_object *gem_obj;
>> +	struct qda_gem_obj *qda_gem_obj;
>> +	int err;
>> +	u64 len = ctx->args[i].length;
>> +	u64 vma_offset;
>> +
>> +	err = get_gem_obj_from_handle(ctx->file_priv, ctx->args[i].fd, &gem_obj);
>> +	if (err)
>> +		return err;
>> +
>> +	ctx->gem_objs[i] = gem_obj;
>> +	qda_gem_obj = to_qda_gem_obj(gem_obj);
>> +
>> +	rpra[i].buf.pv = (u64)ctx->args[i].ptr;
>> +
>> +	if (qda_gem_obj->is_imported)
>> +		pages[i].addr = qda_gem_obj->imported_dma_addr;
>> +	else
>> +		pages[i].addr = qda_gem_obj->dma_addr;
>> +
>> +	vma_offset = calculate_vma_offset(ctx->args[i].ptr);
>> +	pages[i].addr += vma_offset;
>> +	pages[i].size = calculate_page_aligned_size(ctx->args[i].ptr, len);
>> +
>> +	return 0;
>> +}
>> +
>> +static int process_direct_buffer(struct fastrpc_invoke_context *ctx, int i, int oix,
>> +				 union fastrpc_remote_arg *rpra, struct fastrpc_phy_page *pages,
>> +				 uintptr_t *args, u64 *rlen, u64 pkt_size)
> What is direct buffer?
it's for GEM buffers.
>
>> +{
>> +	int mlen;
>> +	u64 len = ctx->args[i].length;
>> +	int inbufs = ctx->inbufs;
>> +
>> +	if (ctx->olaps[oix].offset == 0) {
>> +		*rlen -= ALIGN(*args, FASTRPC_ALIGN) - *args;
>> +		*args = ALIGN(*args, FASTRPC_ALIGN);
>> +	}
>> +
>> +	mlen = ctx->olaps[oix].mend - ctx->olaps[oix].mstart;
>> +
>> +	if (*rlen < mlen)
>> +		return -ENOSPC;
>> +
>> +	rpra[i].buf.pv = *args - ctx->olaps[oix].offset;
>> +
>> +	pages[i].addr = ctx->msg->phys - ctx->olaps[oix].offset + (pkt_size - *rlen);
>> +	pages[i].addr = pages[i].addr & PAGE_MASK;
>> +	pages[i].size = calculate_page_aligned_size(rpra[i].buf.pv, len);
>> +
>> +	*args = *args + mlen;
>> +	*rlen -= mlen;
>> +
>> +	if (i < inbufs) {
>> +		void *dst = (void *)(uintptr_t)rpra[i].buf.pv;
>> +		void *src = (void *)(uintptr_t)ctx->args[i].ptr;
> Huh?
do you see any problem here, I've copied this from existing fastrpc.
>
>> +
>> +		if ((unsigned long)src >= PAGE_OFFSET) {
>> +			memcpy(dst, src, len);
>> +		} else {
>> +			if (copy_from_user(dst, (void __user *)src, len))
>> +				return -EFAULT;
>> +		}
>> +	}
>> +
>> +	return 0;
>> +}
>> +
>> +static int process_dma_handle(struct fastrpc_invoke_context *ctx, int i,
>> +			      union fastrpc_remote_arg *rpra, struct fastrpc_phy_page *pages)
>> +{
>> +	if (ctx->args[i].fd > 0) {
>> +		struct drm_gem_object *gem_obj;
>> +		struct qda_gem_obj *qda_gem_obj;
>> +		int err;
>> +
>> +		err = get_gem_obj_from_handle(ctx->file_priv, ctx->args[i].fd, &gem_obj);
>> +		if (err)
>> +			return err;
>> +
>> +		ctx->gem_objs[i] = gem_obj;
>> +		qda_gem_obj = to_qda_gem_obj(gem_obj);
>> +
>> +		setup_pages_from_gem_obj(qda_gem_obj, &pages[i]);
>> +
>> +		rpra[i].dma.fd = ctx->args[i].fd;
>> +		rpra[i].dma.len = ctx->args[i].length;
>> +		rpra[i].dma.offset = (u64)ctx->args[i].ptr;
>> +	} else {
>> +		rpra[i].buf.pv = ctx->args[i].ptr;
>> +		rpra[i].buf.len = ctx->args[i].length;
>> +	}
>> +
>> +	return 0;
>> +}
>> +
>> +int fastrpc_get_header_size(struct fastrpc_invoke_context *ctx, size_t *out_size)
>> +{
>> +	ctx->inbufs = REMOTE_SCALARS_INBUFS(ctx->sc);
>> +	ctx->metalen = fastrpc_get_meta_size(ctx);
>> +	ctx->pkt_size = fastrpc_get_payload_size(ctx, ctx->metalen);
>> +
>> +	ctx->aligned_pkt_size = PAGE_ALIGN(ctx->pkt_size);
>> +	if (ctx->aligned_pkt_size == 0)
>> +		return -EINVAL;
>> +
>> +	*out_size = ctx->aligned_pkt_size;
>> +	return 0;
>> +}
>> +
>> +static int fastrpc_get_args(struct fastrpc_invoke_context *ctx)
>> +{
>> +	union fastrpc_remote_arg *rpra;
>> +	struct fastrpc_invoke_buf *list;
>> +	struct fastrpc_phy_page *pages;
>> +	int i, oix, err = 0;
>> +	u64 rlen;
>> +	uintptr_t args;
>> +	size_t hdr_size;
>> +
>> +	ctx->inbufs = REMOTE_SCALARS_INBUFS(ctx->sc);
>> +	err = fastrpc_get_header_size(ctx, &hdr_size);
>> +	if (err)
>> +		return err;
>> +
>> +	ctx->msg->buf = ctx->msg_gem_obj->virt;
>> +	ctx->msg->phys = ctx->msg_gem_obj->dma_addr;
>> +
>> +	memset(ctx->msg->buf, 0, ctx->aligned_pkt_size);
>> +
>> +	rpra = (union fastrpc_remote_arg *)ctx->msg->buf;
>> +	ctx->list = fastrpc_invoke_buf_start(rpra, ctx->nscalars);
>> +	ctx->pages = fastrpc_phy_page_start(ctx->list, ctx->nscalars);
>> +	list = ctx->list;
>> +	pages = ctx->pages;
>> +	args = (uintptr_t)ctx->msg->buf + ctx->metalen;
>> +	rlen = ctx->pkt_size - ctx->metalen;
>> +	ctx->rpra = rpra;
>> +
>> +	for (oix = 0; oix < ctx->nbufs; ++oix) {
>> +		i = ctx->olaps[oix].raix;
>> +
>> +		rpra[i].buf.pv = 0;
>> +		rpra[i].buf.len = ctx->args[i].length;
>> +		list[i].num = ctx->args[i].length ? 1 : 0;
>> +		list[i].pgidx = i;
>> +
>> +		if (!ctx->args[i].length)
>> +			continue;
>> +
>> +		if (ctx->args[i].fd > 0)
>> +			err = process_fd_buffer(ctx, i, rpra, pages);
>> +		else
>> +			err = process_direct_buffer(ctx, i, oix, rpra, pages, &args, &rlen,
>> +						    ctx->pkt_size);
>> +
>> +		if (err)
>> +			goto bail_gem;
>> +	}
>> +
>> +	for (i = ctx->nbufs; i < ctx->nscalars; ++i) {
>> +		list[i].num = ctx->args[i].length ? 1 : 0;
>> +		list[i].pgidx = i;
>> +
>> +		err = process_dma_handle(ctx, i, rpra, pages);
>> +		if (err)
>> +			goto bail_gem;
>> +	}
>> +
>> +	return 0;
>> +
>> +bail_gem:
>> +	if (ctx->msg_gem_obj) {
>> +		drm_gem_object_put(&ctx->msg_gem_obj->base);
>> +		ctx->msg_gem_obj = NULL;
>> +	}
>> +
>> +	return err;
>> +}
>> +
>> +static int fastrpc_put_args(struct fastrpc_invoke_context *ctx, struct qda_msg *msg)
>> +{
>> +	union fastrpc_remote_arg *rpra = ctx->rpra;
>> +	int i, err = 0;
>> +
>> +	if (!ctx || !rpra)
>> +		return -EINVAL;
>> +
>> +	for (i = ctx->inbufs; i < ctx->nbufs; ++i) {
>> +		if (ctx->args[i].fd <= 0) {
>> +			void *src = (void *)(uintptr_t)rpra[i].buf.pv;
>> +			void *dst = (void *)(uintptr_t)ctx->args[i].ptr;
>> +			u64 len = rpra[i].buf.len;
>> +
>> +			err = copy_to_user_or_kernel(dst, src, len);
>> +			if (err)
>> +				break;
>> +		}
>> +	}
>> +
>> +	return err;
>> +}
>> +
>> +int fastrpc_internal_invoke_pack(struct fastrpc_invoke_context *ctx,
>> +				 struct qda_msg *msg)
>> +{
>> +	int err = 0;
>> +
>> +	if (ctx->handle == FASTRPC_INIT_HANDLE)
>> +		msg->client_id = 0;
>> +	else
>> +		msg->client_id = ctx->client_id;
>> +
>> +	ctx->msg = msg;
>> +
>> +	err = fastrpc_get_args(ctx);
>> +	if (err)
>> +		return err;
>> +
>> +	dma_wmb();
>> +
>> +	msg->tid = ctx->pid;
>> +	msg->ctx = ctx->ctxid | ctx->pd;
>> +	msg->handle = ctx->handle;
>> +	msg->sc = ctx->sc;
>> +	msg->addr = ctx->msg->phys;
>> +	msg->size = roundup(ctx->pkt_size, PAGE_SIZE);
>> +	msg->fastrpc_ctx = ctx;
>> +	msg->file_priv = ctx->file_priv;
>> +
>> +	return 0;
>> +}
>> +
>> +int fastrpc_internal_invoke_unpack(struct fastrpc_invoke_context *ctx,
>> +				   struct qda_msg *msg)
>> +{
>> +	int err;
>> +
>> +	dma_rmb();
>> +
>> +	err = fastrpc_put_args(ctx, msg);
>> +	if (err)
>> +		return err;
>> +
>> +	err = ctx->retval;
>> +	return err;
>> +}
>> +
>> +static int fastrpc_prepare_args_init_attach(struct fastrpc_invoke_context *ctx)
>> +{
>> +	struct fastrpc_invoke_args *args;
>> +
>> +	args = kzalloc_obj(*args, GFP_KERNEL);
>> +	if (!args)
>> +		return -ENOMEM;
>> +
>> +	setup_single_arg(args, &ctx->client_id, sizeof(ctx->client_id));
>> +	ctx->sc = FASTRPC_SCALARS(FASTRPC_RMID_INIT_ATTACH, 1, 0);
>> +	ctx->args = args;
>> +	ctx->handle = FASTRPC_INIT_HANDLE;
>> +
>> +	return 0;
>> +}
>> +
>> +static int fastrpc_prepare_args_release_process(struct fastrpc_invoke_context *ctx)
>> +{
>> +	struct fastrpc_invoke_args *args;
>> +
>> +	args = kzalloc_obj(*args, GFP_KERNEL);
>> +	if (!args)
>> +		return -ENOMEM;
>> +
>> +	setup_single_arg(args, &ctx->client_id, sizeof(ctx->client_id));
>> +	ctx->sc = FASTRPC_SCALARS(FASTRPC_RMID_INIT_RELEASE, 1, 0);
>> +	ctx->args = args;
>> +	ctx->handle = FASTRPC_INIT_HANDLE;
>> +
>> +	return 0;
>> +}
>> +
>> +int fastrpc_prepare_args(struct fastrpc_invoke_context *ctx, char __user *argp)
>> +{
>> +	int err;
>> +
>> +	switch (ctx->type) {
>> +	case FASTRPC_RMID_INIT_ATTACH:
>> +		ctx->pd = ROOT_PD;
>> +		err = fastrpc_prepare_args_init_attach(ctx);
>> +		break;
>> +	case FASTRPC_RMID_INIT_RELEASE:
>> +		err = fastrpc_prepare_args_release_process(ctx);
>> +		break;
>> +	default:
>> +		return -EINVAL;
>> +	}
>> +
>> +	if (err)
>> +		return err;
>> +
>> +	ctx->nscalars = REMOTE_SCALARS_LENGTH(ctx->sc);
>> +	ctx->nbufs = REMOTE_SCALARS_INBUFS(ctx->sc) + REMOTE_SCALARS_OUTBUFS(ctx->sc);
>> +
>> +	if (ctx->nscalars) {
>> +		ctx->gem_objs = kcalloc(ctx->nscalars, sizeof(*ctx->gem_objs), GFP_KERNEL);
>> +		if (!ctx->gem_objs)
>> +			return -ENOMEM;
>> +		ctx->olaps = kcalloc(ctx->nscalars, sizeof(*ctx->olaps), GFP_KERNEL);
>> +		if (!ctx->olaps) {
>> +			kfree(ctx->gem_objs);
>> +			ctx->gem_objs = NULL;
>> +			return -ENOMEM;
>> +		}
>> +		fastrpc_get_buff_overlaps(ctx);
>> +	}
>> +
>> +	return err;
>> +}
>> diff --git a/drivers/accel/qda/qda_fastrpc.h b/drivers/accel/qda/qda_fastrpc.h
>> new file mode 100644
>> index 000000000000..744421382079
>> --- /dev/null
>> +++ b/drivers/accel/qda/qda_fastrpc.h
>> @@ -0,0 +1,303 @@
>> +/* SPDX-License-Identifier: GPL-2.0-only */
>> +/*
>> + * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
>> + */
>> +
>> +#ifndef __QDA_FASTRPC_H__
>> +#define __QDA_FASTRPC_H__
>> +
>> +#include <linux/completion.h>
>> +#include <linux/list.h>
>> +#include <linux/types.h>
>> +#include <drm/drm_drv.h>
>> +#include <drm/drm_file.h>
>> +
>> +/*
>> + * FastRPC scalar extraction macros
>> + *
>> + * These macros extract different fields from the scalar value that describes
>> + * the arguments passed in a FastRPC invocation.
>> + */
>> +#define REMOTE_SCALARS_INBUFS(sc)	(((sc) >> 16) & 0x0ff)
>> +#define REMOTE_SCALARS_OUTBUFS(sc)	(((sc) >> 8) & 0x0ff)
>> +#define REMOTE_SCALARS_INHANDLES(sc)	(((sc) >> 4) & 0x0f)
>> +#define REMOTE_SCALARS_OUTHANDLES(sc)	((sc) & 0x0f)
>> +#define REMOTE_SCALARS_LENGTH(sc)	(REMOTE_SCALARS_INBUFS(sc) +   \
>> +					 REMOTE_SCALARS_OUTBUFS(sc) +  \
>> +					 REMOTE_SCALARS_INHANDLES(sc) + \
>> +					 REMOTE_SCALARS_OUTHANDLES(sc))
>> +
>> +/* FastRPC configuration constants */
>> +#define FASTRPC_ALIGN		128		/* Alignment requirement */
>> +#define FASTRPC_MAX_FDLIST	16		/* Maximum file descriptors */
>> +#define FASTRPC_MAX_CRCLIST	64		/* Maximum CRC list entries */
>> +
>> +/*
>> + * FastRPC scalar construction macros
>> + *
>> + * These macros build the scalar value that describes the arguments
>> + * for a FastRPC invocation.
>> + */
>> +#define FASTRPC_BUILD_SCALARS(attr, method, in, out, oin, oout)  \
>> +				(((attr & 0x07) << 29) |		\
>> +				((method & 0x1f) << 24) |	\
>> +				((in & 0xff) << 16) |		\
>> +				((out & 0xff) <<  8) |		\
>> +				((oin & 0x0f) <<  4) |		\
>> +				(oout & 0x0f))
>> +
>> +#define FASTRPC_SCALARS(method, in, out) \
>> +		FASTRPC_BUILD_SCALARS(0, method, in, out, 0, 0)
>> +
>> +/**
>> + * struct fastrpc_buf_overlap - Buffer overlap tracking structure
>> + *
>> + * This structure tracks overlapping buffer regions to optimize memory
>> + * mapping and avoid redundant mappings of the same physical memory.
> I think you are spending much more efforts on optimizing it than the
> actual cost of mapping the same region twice. Or is there something more
> than the optimization?
The current design is to take both DMABUF and non-DMABUF buffers over RPC calls.
I'm checking if the copy approach can be completely moved to userspace. If that is possible
this kernel logic might not be needed.
>
>> + */
>> +struct fastrpc_buf_overlap {
>> +	/* Start address of the buffer in user virtual address space */
>> +	u64 start;
>> +	/* End address of the buffer in user virtual address space */
>> +	u64 end;
>> +	/* Remote argument index associated with this overlap */
>> +	int raix;
>> +	/* Start address of the mapped region */
>> +	u64 mstart;
>> +	/* End address of the mapped region */
>> +	u64 mend;
>> +	/* Offset within the mapped region */
>> +	u64 offset;
>> +};
>> +
>> +/**
>> + * struct fastrpc_remote_dmahandle - Structure to represent a remote DMA handle
>> + */
>> +struct fastrpc_remote_dmahandle {
>> +	/* DMA handle file descriptor */
>> +	s32 fd;
>> +	/* DMA handle offset */
>> +	u32 offset;
>> +	/* DMA handle length */
>> +	u32 len;
>> +};
>> +
>> +/**
>> + * struct fastrpc_remote_buf - Structure to represent a remote buffer
>> + */
>> +struct fastrpc_remote_buf {
>> +	/* Buffer pointer */
>> +	u64 pv;
>> +	/* Length of buffer */
>> +	u64 len;
>> +};
>> +
>> +/**
>> + * union fastrpc_remote_arg - Union to represent remote arguments
>> + */
>> +union fastrpc_remote_arg {
>> +	/* Remote buffer */
>> +	struct fastrpc_remote_buf buf;
>> +	/* Remote DMA handle */
>> +	struct fastrpc_remote_dmahandle dma;
>> +};
>> +
>> +/**
>> + * struct fastrpc_phy_page - Structure to represent a physical page
>> + */
>> +struct fastrpc_phy_page {
>> +	/* Physical address */
>> +	u64 addr;
>> +	/* Size of contiguous region */
>> +	u64 size;
>> +};
>> +
>> +/**
>> + * struct fastrpc_invoke_buf - Structure to represent an invoke buffer
>> + */
>> +struct fastrpc_invoke_buf {
>> +	/* Number of contiguous regions */
>> +	u32 num;
>> +	/* Page index */
>> +	u32 pgidx;
>> +};
>> +
>> +/**
>> + * struct qda_msg - Message structure for FastRPC communication
>> + *
>> + * This structure represents a message sent to or received from the remote
>> + * processor via FastRPC protocol.
>> + */
>> +struct qda_msg {
>> +	/* Process client ID */
>> +	int client_id;
>> +	/* Thread ID */
>> +	int tid;
>> +	/* Context identifier for matching responses */
>> +	u64 ctx;
>> +	/* Handle to invoke on remote processor */
>> +	u32 handle;
>> +	/* Scalars structure describing the data layout */
>> +	u32 sc;
>> +	/* Physical address of the message buffer */
>> +	u64 addr;
>> +	/* Size of contiguous region */
>> +	u64 size;
>> +	/* Kernel virtual address of the buffer */
>> +	void *buf;
>> +	/* Physical/DMA address of the buffer */
>> +	u64 phys;
>> +	/* Return value from remote processor */
>> +	int ret;
>> +	/* Pointer to qda_dev for context management */
>> +	struct qda_dev *qdev;
>> +	/* Back-pointer to FastRPC context */
>> +	struct fastrpc_invoke_context *fastrpc_ctx;
>> +	/* File private data for GEM object lookup */
>> +	struct drm_file *file_priv;
>> +};
>> +
>> +/**
>> + * struct fastrpc_invoke_context - Remote procedure call invocation context
>> + *
>> + * This structure maintains all state for a single remote procedure call,
>> + * including buffer management, synchronization, and result handling.
>> + */
>> +struct fastrpc_invoke_context {
>> +	/* Unique context identifier for this invocation */
>> +	u64 ctxid;
>> +	/* Number of input buffers */
>> +	int inbufs;
>> +	/* Number of output buffers */
>> +	int outbufs;
>> +	/* Number of file descriptor handles */
>> +	int handles;
>> +	/* Number of scalar parameters */
>> +	int nscalars;
>> +	/* Total number of buffers (input + output) */
>> +	int nbufs;
>> +	/* Process ID of the calling process */
>> +	int pid;
>> +	/* Return value from the remote invocation */
>> +	int retval;
>> +	/* Length of metadata */
>> +	int metalen;
>> +	/* Client identifier for this session */
>> +	int client_id;
>> +	/* Protection domain identifier */
>> +	int pd;
>> +	/* Type of invocation request */
>> +	int type;
>> +	/* Scalars parameter encoding buffer information */
>> +	u32 sc;
>> +	/* Handle to the remote method being invoked */
>> +	u32 handle;
>> +	/* Pointer to CRC values for data integrity */
>> +	u32 *crc;
>> +	/* Pointer to array of file descriptors */
>> +	u64 *fdlist;
>> +	/* Size of the packet */
>> +	u64 pkt_size;
>> +	/* Aligned packet size for DMA transfers */
>> +	u64 aligned_pkt_size;
>> +	/* Array of invoke buffer descriptors */
>> +	struct fastrpc_invoke_buf *list;
>> +	/* Array of physical page descriptors for buffers */
>> +	struct fastrpc_phy_page *pages;
>> +	/* Array of physical page descriptors for input buffers */
>> +	struct fastrpc_phy_page *input_pages;
>> +	/* List node for linking contexts in a queue */
>> +	struct list_head node;
>> +	/* Completion object for synchronizing invocation */
>> +	struct completion work;
>> +	/* Pointer to the QDA message structure */
>> +	struct qda_msg *msg;
>> +	/* Array of remote procedure arguments */
>> +	union fastrpc_remote_arg *rpra;
>> +	/* Array of GEM objects for argument buffers */
>> +	struct drm_gem_object **gem_objs;
>> +	/* Pointer to user-space invoke arguments */
>> +	struct fastrpc_invoke_args *args;
>> +	/* Array of buffer overlap descriptors */
>> +	struct fastrpc_buf_overlap *olaps;
>> +	/* Reference counter for context lifetime management */
>> +	struct kref refcount;
>> +	/* GEM object for the main message buffer */
>> +	struct qda_gem_obj *msg_gem_obj;
>> +	/* DRM file private data */
>> +	struct drm_file *file_priv;
>> +	/* Pointer to request buffer */
>> +	void *req;
>> +	/* Pointer to response buffer */
>> +	void *rsp;
>> +	/* Pointer to input buffer */
>> +	void *inbuf;
>> +};
>> +
>> +/* Remote Method ID table - identifies initialization and control operations */
>> +#define FASTRPC_RMID_INIT_ATTACH	0	/* Attach to DSP session */
>> +#define FASTRPC_RMID_INIT_RELEASE	1	/* Release DSP session */
>> +
>> +/* Common handle for initialization operations */
>> +#define FASTRPC_INIT_HANDLE		0x1
>> +
>> +/* Protection Domain(PD) ids */
>> +#define ROOT_PD		(0)
>> +
>> +/**
>> + * fastrpc_context_free - Free an invocation context
>> + * @ref: Reference counter for the context
>> + *
>> + * This function is called when the reference count reaches zero,
>> + * releasing all resources associated with the invocation context.
>> + */
>> +void fastrpc_context_free(struct kref *ref);
>> +
>> +/*
>> + * FastRPC context and invocation management functions
>> + */
>> +
>> +/**
>> + * fastrpc_context_alloc - Allocate a new FastRPC invocation context
>> + *
>> + * Returns: Pointer to allocated context, or NULL on failure
>> + */
>> +struct fastrpc_invoke_context *fastrpc_context_alloc(void);
>> +
>> +/**
>> + * fastrpc_prepare_args - Prepare arguments for FastRPC invocation
>> + * @ctx: FastRPC invocation context
>> + * @argp: User-space pointer to invocation arguments
>> + *
>> + * Returns: 0 on success, negative error code on failure
>> + */
>> +int fastrpc_prepare_args(struct fastrpc_invoke_context *ctx, char __user *argp);
>> +
>> +/**
>> + * fastrpc_get_header_size - Get the size of the FastRPC message header
>> + * @ctx: FastRPC invocation context
>> + * @out_size: Pointer to store the header size in bytes
>> + *
>> + * Returns: 0 on success, negative error code on failure
>> + */
>> +int fastrpc_get_header_size(struct fastrpc_invoke_context *ctx, size_t *out_size);
>> +
>> +/**
>> + * fastrpc_internal_invoke_pack - Pack invocation context into message
>> + * @ctx: FastRPC invocation context
>> + * @msg: QDA message structure to pack into
>> + *
>> + * Returns: 0 on success, negative error code on failure
>> + */
>> +int fastrpc_internal_invoke_pack(struct fastrpc_invoke_context *ctx, struct qda_msg *msg);
>> +
>> +/**
>> + * fastrpc_internal_invoke_unpack - Unpack response message into context
>> + * @ctx: FastRPC invocation context
>> + * @msg: QDA message structure to unpack from
>> + *
>> + * Returns: 0 on success, negative error code on failure
>> + */
>> +int fastrpc_internal_invoke_unpack(struct fastrpc_invoke_context *ctx, struct qda_msg *msg);
>> +
>> +#endif /* __QDA_FASTRPC_H__ */
>> diff --git a/drivers/accel/qda/qda_ioctl.c b/drivers/accel/qda/qda_ioctl.c
>> index d91983048d6c..1066ab6ddc7b 100644
>> --- a/drivers/accel/qda/qda_ioctl.c
>> +++ b/drivers/accel/qda/qda_ioctl.c
>> @@ -6,6 +6,8 @@
>>  #include "qda_drv.h"
>>  #include "qda_ioctl.h"
>>  #include "qda_prime.h"
>> +#include "qda_fastrpc.h"
>> +#include "qda_rpmsg.h"
>>  
>>  static int qda_validate_and_get_context(struct drm_device *dev, struct drm_file *file_priv,
>>  					struct qda_dev **qdev, struct qda_user **qda_user)
>> @@ -85,3 +87,108 @@ int qda_ioctl_prime_fd_to_handle(struct drm_device *dev, struct drm_file *file_p
>>  {
>>  	return qda_prime_fd_to_handle(dev, file_priv, prime_fd, handle);
>>  }
>> +
>> +static int fastrpc_context_get_id(struct fastrpc_invoke_context *ctx, struct qda_dev *qdev)
>> +{
>> +	int ret;
>> +	u32 id;
>> +
>> +	if (!qdev)
>> +		return -EINVAL;
>> +
>> +	if (atomic_read(&qdev->removing))
>> +		return -ENODEV;
>> +
>> +	ret = xa_alloc(&qdev->ctx_xa, &id, ctx, xa_limit_32b, GFP_KERNEL);
>> +	if (ret)
>> +		return ret;
>> +
>> +	ctx->ctxid = id << 4;
>> +	return 0;
>> +}
>> +
>> +static void fastrpc_context_put_id(struct fastrpc_invoke_context *ctx, struct qda_dev *qdev)
>> +{
>> +	if (qdev)
>> +		xa_erase(&qdev->ctx_xa, ctx->ctxid >> 4);
>> +}
>> +
>> +static int fastrpc_invoke(int type, struct drm_device *dev, void *data,
>> +			  struct drm_file *file_priv)
>> +{
>> +	struct qda_dev *qdev;
>> +	struct qda_user *qda_user;
>> +	struct qda_msg msg;
>> +	struct fastrpc_invoke_context *ctx;
>> +	struct drm_gem_object *gem_obj;
>> +	int err;
>> +	size_t hdr_size;
>> +
>> +	err = qda_validate_and_get_context(dev, file_priv, &qdev, &qda_user);
>> +	if (err)
>> +		return err;
>> +
>> +	ctx = fastrpc_context_alloc();
>> +	if (IS_ERR(ctx))
>> +		return PTR_ERR(ctx);
>> +
>> +	err = fastrpc_context_get_id(ctx, qdev);
>> +	if (err) {
>> +		kref_put(&ctx->refcount, fastrpc_context_free);
>> +		return err;
>> +	}
>> +
>> +	ctx->type = type;
>> +	ctx->file_priv = file_priv;
>> +	ctx->client_id = qda_user->client_id;
>> +
>> +	err = fastrpc_prepare_args(ctx, (char __user *)data);
>> +	if (err)
>> +		goto err_context_free;
>> +
>> +	err = fastrpc_get_header_size(ctx, &hdr_size);
>> +	if (err)
>> +		goto err_context_free;
>> +
>> +	gem_obj = qda_gem_create_object(qdev->drm_dev,
>> +					qdev->drm_priv->iommu_mgr,
>> +					hdr_size, file_priv);
>> +	if (IS_ERR(gem_obj)) {
>> +		err = PTR_ERR(gem_obj);
>> +		goto err_context_free;
>> +	}
>> +
>> +	ctx->msg_gem_obj = to_qda_gem_obj(gem_obj);
>> +
>> +	err = fastrpc_internal_invoke_pack(ctx, &msg);
>> +	if (err)
>> +		goto err_context_free;
>> +
>> +	err = qda_rpmsg_send_msg(qdev, &msg);
>> +	if (err)
>> +		goto err_context_free;
>> +
>> +	err = qda_rpmsg_wait_for_rsp(ctx);
>> +	if (err)
>> +		goto err_context_free;
>> +
>> +	err = fastrpc_internal_invoke_unpack(ctx, &msg);
>> +	if (err)
>> +		goto err_context_free;
>> +
>> +err_context_free:
>> +	fastrpc_context_put_id(ctx, qdev);
>> +	kref_put(&ctx->refcount, fastrpc_context_free);
>> +
>> +	return err;
>> +}
>> +
>> +int qda_ioctl_attach(struct drm_device *dev, void *data, struct drm_file *file_priv)
>> +{
>> +	return fastrpc_invoke(FASTRPC_RMID_INIT_ATTACH, dev, data, file_priv);
>> +}
>> +
>> +int fastrpc_release_current_dsp_process(struct qda_dev *qdev, struct drm_file *file_priv)
>> +{
>> +	return fastrpc_invoke(FASTRPC_RMID_INIT_RELEASE, qdev->drm_dev, NULL, file_priv);
>> +}
>> diff --git a/drivers/accel/qda/qda_ioctl.h b/drivers/accel/qda/qda_ioctl.h
>> index d454256f5fc5..044c616a51c6 100644
>> --- a/drivers/accel/qda/qda_ioctl.h
>> +++ b/drivers/accel/qda/qda_ioctl.h
>> @@ -38,4 +38,29 @@ int qda_ioctl_query(struct drm_device *dev, void *data, struct drm_file *file_pr
>>  int qda_ioctl_prime_fd_to_handle(struct drm_device *dev, struct drm_file *file_priv,
>>  				 int prime_fd, u32 *handle);
>>  
>> +/**
>> + * qda_ioctl_attach - Attach to DSP root protection domain
>> + * @dev: DRM device structure
>> + * @data: User-space data for the attach operation
>> + * @file_priv: DRM file private data
>> + *
>> + * This IOCTL handler attaches to the DSP root PD (Protection Domain)
>> + * to enable communication between the host and DSP.
>> + *
>> + * Return: 0 on success, negative error code on failure
>> + */
>> +int qda_ioctl_attach(struct drm_device *dev, void *data, struct drm_file *file_priv);
>> +
>> +/**
>> + * fastrpc_release_current_dsp_process - Release DSP process resources
>> + * @qdev: QDA device structure
>> + * @file_priv: DRM file private data
>> + *
>> + * This function releases all resources associated with a DSP process
>> + * when a user-space client closes its file descriptor.
>> + *
>> + * Return: 0 on success, negative error code on failure
>> + */
>> +int fastrpc_release_current_dsp_process(struct qda_dev *qdev, struct drm_file *file_priv);
>> +
>>  #endif /* _QDA_IOCTL_H */
>> diff --git a/drivers/accel/qda/qda_rpmsg.c b/drivers/accel/qda/qda_rpmsg.c
>> index b2b44b4d3ca8..96a08d753271 100644
>> --- a/drivers/accel/qda/qda_rpmsg.c
>> +++ b/drivers/accel/qda/qda_rpmsg.c
>> @@ -5,7 +5,11 @@
>>  #include <linux/of_platform.h>
>>  #include <linux/of.h>
>>  #include <linux/of_device.h>
>> +#include <linux/completion.h>
>> +#include <linux/wait.h>
>> +#include <linux/sched.h>
>>  #include "qda_drv.h"
>> +#include "qda_fastrpc.h"
>>  #include "qda_rpmsg.h"
>>  #include "qda_cb.h"
>>  
>> @@ -15,7 +19,104 @@ static int qda_rpmsg_init(struct qda_dev *qdev)
>>  	return 0;
>>  }
>>  
>> -/* Utility function to allocate and initialize qda_dev */
>> +static int validate_device_availability(struct qda_dev *qdev)
>> +{
>> +	struct rpmsg_device *rpdev;
>> +
>> +	if (!qdev)
>> +		return -ENODEV;
>> +
>> +	if (atomic_read(&qdev->removing)) {
>> +		qda_dbg(qdev, "RPMsg device unavailable: removing\n");
>> +		return -ENODEV;
>> +	}
>> +
>> +	mutex_lock(&qdev->lock);
>> +	rpdev = qdev->rpdev;
>> +	mutex_unlock(&qdev->lock);
>> +
>> +	if (!rpdev) {
>> +		qda_dbg(qdev, "RPMsg device unavailable: rpdev is NULL\n");
>> +		return -ENODEV;
>> +	}
>> +
>> +	return 0;
>> +}
>> +
>> +static struct fastrpc_invoke_context *get_and_validate_context(struct qda_msg *msg,
>> +							       struct qda_dev *qdev)
>> +{
>> +	struct fastrpc_invoke_context *ctx = msg->fastrpc_ctx;
>> +
>> +	if (!ctx) {
>> +		qda_dbg(qdev, "FastRPC context not found in message\n");
>> +		return ERR_PTR(-EINVAL);
>> +	}
>> +
>> +	kref_get(&ctx->refcount);
>> +	return ctx;
>> +}
>> +
>> +static void populate_fastrpc_msg(struct fastrpc_msg *dst, struct qda_msg *src)
>> +{
>> +	dst->client_id = src->client_id;
>> +	dst->tid = src->tid;
>> +	dst->ctx = src->ctx;
>> +	dst->handle = src->handle;
>> +	dst->sc = src->sc;
>> +	dst->addr = src->addr;
>> +	dst->size = src->size;
>> +}
>> +
>> +static int validate_callback_params(struct qda_dev *qdev, void *data, int len)
>> +{
>> +	if (!qdev)
>> +		return -ENODEV;
>> +
>> +	if (atomic_read(&qdev->removing))
>> +		return -ENODEV;
>> +
>> +	if (len < sizeof(struct qda_invoke_rsp)) {
>> +		qda_dbg(qdev, "Invalid message size from remote: %d\n", len);
>> +		return -EINVAL;
>> +	}
>> +
>> +	return 0;
>> +}
>> +
>> +static unsigned long extract_context_id(struct qda_invoke_rsp *resp_msg)
>> +{
>> +	return (resp_msg->ctx & 0xFF0) >> 4;
>> +}
>> +
>> +static struct fastrpc_invoke_context *find_context_by_id(struct qda_dev *qdev,
>> +							 unsigned long ctxid)
>> +{
>> +	struct fastrpc_invoke_context *ctx;
>> +
>> +	{
>> +		unsigned long flags;
>> +
>> +		xa_lock_irqsave(&qdev->ctx_xa, flags);
>> +		ctx = xa_load(&qdev->ctx_xa, ctxid);
>> +		xa_unlock_irqrestore(&qdev->ctx_xa, flags);
>> +	}
>> +
>> +	if (!ctx) {
>> +		qda_dbg(qdev, "FastRPC context not found for ctxid: %lu\n", ctxid);
>> +		return ERR_PTR(-ENOENT);
>> +	}
>> +
>> +	return ctx;
>> +}
>> +
>> +static void complete_context_processing(struct fastrpc_invoke_context *ctx, int retval)
>> +{
>> +	ctx->retval = retval;
>> +	complete(&ctx->work);
>> +	kref_put(&ctx->refcount, fastrpc_context_free);
>> +}
>> +
>>  static struct qda_dev *alloc_and_init_qdev(struct rpmsg_device *rpdev)
>>  {
>>  	struct qda_dev *qdev;
>> @@ -62,9 +163,68 @@ static int qda_populate_child_devices(struct qda_dev *qdev, struct device_node *
>>  	return success > 0 ? 0 : (count > 0 ? -ENODEV : 0);
>>  }
>>  
>> +int qda_rpmsg_send_msg(struct qda_dev *qdev, struct qda_msg *msg)
>> +{
>> +	int ret;
>> +	struct fastrpc_invoke_context *ctx;
>> +	struct fastrpc_msg msg1;
>> +	struct rpmsg_device *rpdev;
>> +
>> +	ret = validate_device_availability(qdev);
>> +	if (ret)
>> +		return ret;
>> +
>> +	ctx = get_and_validate_context(msg, qdev);
>> +	if (IS_ERR(ctx))
>> +		return PTR_ERR(ctx);
>> +
>> +	populate_fastrpc_msg(&msg1, msg);
>> +
>> +	mutex_lock(&qdev->lock);
>> +	rpdev = qdev->rpdev;
>> +	if (!rpdev) {
>> +		mutex_unlock(&qdev->lock);
>> +		kref_put(&ctx->refcount, fastrpc_context_free);
>> +		return -ENODEV;
>> +	}
>> +
>> +	ret = rpmsg_send(rpdev->ept, (void *)&msg1, sizeof(msg1));
>> +	mutex_unlock(&qdev->lock);
>> +
>> +	if (ret) {
>> +		qda_err(qdev, "rpmsg_send failed: %d\n", ret);
>> +		kref_put(&ctx->refcount, fastrpc_context_free);
>> +		return ret;
>> +	}
>> +
>> +	return 0;
>> +}
>> +
>> +int qda_rpmsg_wait_for_rsp(struct fastrpc_invoke_context *ctx)
>> +{
>> +	return wait_for_completion_interruptible(&ctx->work);
>> +}
>> +
>>  static int qda_rpmsg_cb(struct rpmsg_device *rpdev, void *data, int len, void *priv, u32 src)
>>  {
>> -	/* Dummy function for rpmsg driver */
>> +	struct qda_dev *qdev = dev_get_drvdata(&rpdev->dev);
>> +	struct qda_invoke_rsp *resp_msg = (struct qda_invoke_rsp *)data;
>> +	struct fastrpc_invoke_context *ctx;
>> +	unsigned long ctxid;
>> +	int ret;
>> +
>> +	ret = validate_callback_params(qdev, data, len);
>> +	if (ret)
>> +		return ret;
>> +
>> +	ctxid = extract_context_id(resp_msg);
>> +
>> +	ctx = find_context_by_id(qdev, ctxid);
>> +	if (IS_ERR(ctx))
>> +		return PTR_ERR(ctx);
>> +
>> +	complete_context_processing(ctx, resp_msg->retval);
>> +
>>  	return 0;
>>  }
>>  
>> diff --git a/drivers/accel/qda/qda_rpmsg.h b/drivers/accel/qda/qda_rpmsg.h
>> index 348827bff255..b3e76e44f4cd 100644
>> --- a/drivers/accel/qda/qda_rpmsg.h
>> +++ b/drivers/accel/qda/qda_rpmsg.h
>> @@ -7,6 +7,46 @@
>>  #define __QDA_RPMSG_H__
>>  
>>  #include "qda_drv.h"
>> +#include "qda_fastrpc.h"
>> +
>> +/**
>> + * struct fastrpc_msg - FastRPC message structure for remote invocations
>> + *
>> + * This structure represents a FastRPC message sent to the remote processor
>> + * via RPMsg transport layer.
>> + */
>> +struct fastrpc_msg {
>> +	/* Process client ID */
>> +	int client_id;
>> +	/* Thread ID */
>> +	int tid;
>> +	/* Context identifier for matching request/response */
>> +	u64 ctx;
>> +	/* Handle to invoke on remote processor */
>> +	u32 handle;
>> +	/* Scalars structure describing the data layout */
>> +	u32 sc;
>> +	/* Physical address of the message buffer */
>> +	u64 addr;
>> +	/* Size of contiguous region */
>> +	u64 size;
>> +};
>> +
>> +/**
>> + * struct qda_invoke_rsp - Response structure for FastRPC invocations
>> + */
>> +struct qda_invoke_rsp {
>> +	/* Invoke caller context for matching request/response */
>> +	u64 ctx;
>> +	/* Return value from the remote invocation */
>> +	int retval;
>> +};
>> +
>> +/*
>> + * RPMsg transport layer functions
>> + */
>> +int qda_rpmsg_send_msg(struct qda_dev *qdev, struct qda_msg *msg);
>> +int qda_rpmsg_wait_for_rsp(struct fastrpc_invoke_context *ctx);
>>  
>>  /*
>>   * Transport layer registration
>> -- 
>> 2.34.1
>>

