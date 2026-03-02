Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id ILaBNKZTpWnR9AUAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Mon, 02 Mar 2026 10:08:54 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3EBE71D5468
	for <lists+dri-devel@lfdr.de>; Mon, 02 Mar 2026 10:08:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7313A10E466;
	Mon,  2 Mar 2026 09:08:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="Ls3MwxnS";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="OeRxCPms";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AC31210E466
 for <dri-devel@lists.freedesktop.org>; Mon,  2 Mar 2026 09:08:50 +0000 (UTC)
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 6226h9P32504591
 for <dri-devel@lists.freedesktop.org>; Mon, 2 Mar 2026 09:08:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 Gwaj2fAAVlaePOzG7WDXhDqR0zvBqc8L7FKmuItcwFw=; b=Ls3MwxnSvG7BIlnK
 IyfnLH5p9oe0dLepe1a+nqOGmpRu/4qG+sSO2gKmIHFKo06/ya1XPUOlwIW8eJLo
 2pI6ZrmU7TWboPLUzkOpLJrZS0MdecFq3rnqNKndUzd3HTHAzh2h05tEBXCHKNWw
 UUnXHYIFMOHVnoduZQXFCNyXoMdMckQOumOzGjKlJMap5hlsoeJjDo95nd5KKVrk
 MLS5arA2twyVRrIQrypnewUMTD/4e7RD6eerC/2c4QVVBBTiAfeeZg5qDvJoZUCv
 4ZHwYUF9OM8jLqjubqvJqSVdZEqjaym+yMXm0R4xenGrRwgqPN/2Bum3YHPUdqNR
 Hf4F2A==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com
 [209.85.210.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cn5herh9p-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Mon, 02 Mar 2026 09:08:50 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id
 d2e1a72fcca58-8274bf81f2eso1118161b3a.0
 for <dri-devel@lists.freedesktop.org>; Mon, 02 Mar 2026 01:08:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1772442530; x=1773047330;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=Gwaj2fAAVlaePOzG7WDXhDqR0zvBqc8L7FKmuItcwFw=;
 b=OeRxCPmsTKHvNdskKUQtvc1CG8wSioCghuKvO/g/hwmaOknxG3x9EAQhRxfpyvMEoD
 NUc55r6NtOj8j7AiztAQq+UsyfTP3qMwaCE9Cc0kOJAbu6suveKPLvSI26zELaYWVbGk
 Db1Y9W/jHzNH30upHtAFc/NBCtXnKZerxOLdfgsnyemRJ9VmYrQPaSDOiWqX9qqY01cf
 CNp7OiBF0rnrZwmwNK5ee6CWueoNuKq5o3SHUKivzMGWAfXF0GidbDknIa/uIh/cp2bo
 24en9lhIVURMx9gpec03O9Ud+GPN31pwqs+mexmPcycbQaOICTUZbEafPOFezA+I6Scl
 InbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1772442530; x=1773047330;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Gwaj2fAAVlaePOzG7WDXhDqR0zvBqc8L7FKmuItcwFw=;
 b=qAbE/iWk5xOlSupl28fc36ZLPM6OhQmSByaF1kLBL+JAJbJYienLIweRUyvMchroNP
 C4++Tyv++5P6L+xCeNDfEWqxj+M4qw0mvct50Nk/twrdM5HXhFvDnRPwbSHpsGdbIemY
 Kh255j9WFEgBlfBW9mlOz2bsWcwO7RLiOyT0+x9S/OkIyX7Y9vClojjO8I/pwofCdaSl
 QUnHKAMAu+JmFNUfQQgayBwuWBD/AzEzCHu1gOZZ2zSZM4WARWOX4M9cT/uJnZPlBFqQ
 qYyWq1M3cPsiNVpJnL3IXa/szFJbbdaeTVkXKT6aeIfhqWOXD8IajOZDvkUeuIPeyJdL
 ju6A==
X-Gm-Message-State: AOJu0Yw2YjAhVbJIwaR1PLdaHgloLkhXwZ0JXU8ITB0WCQgnYDZjoWGN
 LBtl8GpBOgBhLOuXhGhvDd1gBWsY4k9JLHavDdn+2wQvJPr9LYqkCezrRv0hom37yegjD6H7QBb
 cuPGnHLxZ0cOW6AyNLx2G44VbC7o0spXMPq1fSAiwWEprX1M+yctab4MIzDk4d+1xgs5LwuA=
X-Gm-Gg: ATEYQzw6+oss58/TeFrNKPiH7C0Mo7ZxPssmUjnfnGcN8VIrSKEGBCkIPfh2wbv+D7/
 h0rvXlmZpZUTl9XpD+A3zoT8b588Ia/7AW9O/H9pqyMZUNYVyK3ZfjQb1qBTY5ha5Xl2XSlVZZY
 2oIbEEPaVkhiTugerAr8CYSDbmFofv3DnwS3FBpwMD0umqrFLLbKk+EqixrB179h9OsQyt1cudl
 y61hW+njHXG+ycKTkBiITMehgmTzOMQ5QDL1imBe8mZvM1oHhE29uX2SntSX7XnCi9Lj1YG9y8r
 8RDO+xtuEyBD2mEOoQ6S/6XBCRe+VW2rd0Ycn15NrloW5AsaqWJySnzS2bKxS14M7xzXeY/n5BP
 r7XQSgV6I8L8WjPxdF1U69cnoZSbqib/lrEBcVrZioQcr99FMJQ==
X-Received: by 2002:a05:6a00:22d2:b0:81f:5238:5560 with SMTP id
 d2e1a72fcca58-8274d93af23mr10970996b3a.13.1772442529573; 
 Mon, 02 Mar 2026 01:08:49 -0800 (PST)
X-Received: by 2002:a05:6a00:22d2:b0:81f:5238:5560 with SMTP id
 d2e1a72fcca58-8274d93af23mr10970955b3a.13.1772442529070; 
 Mon, 02 Mar 2026 01:08:49 -0800 (PST)
Received: from [10.206.99.28] ([202.46.23.25])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-82739ff1c9esm13696576b3a.32.2026.03.02.01.08.42
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 02 Mar 2026 01:08:48 -0800 (PST)
Message-ID: <a46bd6ea-ec33-431a-bcc2-1ade0b40c5ce@oss.qualcomm.com>
Date: Mon, 2 Mar 2026 14:38:41 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC 11/18] accel/qda: Add GEM_CREATE and GEM_MMAP_OFFSET
 IOCTLs
To: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 Oded Gabbay <ogabbay@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
 Shuah Khan <skhan@linuxfoundation.org>, Joerg Roedel <joro@8bytes.org>,
 Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Sumit Semwal <sumit.semwal@linaro.org>
Cc: dri-devel@lists.freedesktop.org, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 iommu@lists.linux.dev, linux-media@vger.kernel.org,
 linaro-mm-sig@lists.linaro.org,
 Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>,
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
 Bharath Kumar <quic_bkumar@quicinc.com>,
 Chenna Kesava Raju <quic_chennak@quicinc.com>
References: <20260224-qda-firstpost-v1-0-fe46a9c1a046@oss.qualcomm.com>
 <20260224-qda-firstpost-v1-11-fe46a9c1a046@oss.qualcomm.com>
 <d620fb9b-3e52-412c-b687-4b464615430e@amd.com>
Content-Language: en-US
From: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
In-Reply-To: <d620fb9b-3e52-412c-b687-4b464615430e@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=BI++bVQG c=1 sm=1 tr=0 ts=69a553a2 cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=ukUgU1k7PXLouMuqi7QA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=OpyuDcXvxspvyRM73sMx:22
X-Proofpoint-GUID: Ou-DvxP3NuxRjwUnEb-PWBD0Mp3me90c
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzAyMDA3OCBTYWx0ZWRfXyx1c5eNj8QcQ
 oILqxQTwGSfMP50VtNQUaGiMxtHiEJv2nBhQu4Lo7K3HV9/YIhM3rFoJivFwVMLVgzDRxH6KnWP
 e/rDxr1qlcZizBjVaYzyDw9BBK8W1sR8cqDKXhPVw/XC4Ve98NbGkWyzPpANO4B80mI0aZKuw0K
 3Cs3Q+46P/t4Cmi6T0e34otlW9ZGvY5WMGVDgwy3BKqkibnBbjFuktQngJNrpECrl5f31pvgsk/
 XlRwQNIVgdm2p/GCCUn2XixYRP46q6VkNpMEA5ZD+0ZecaR9oJn447emJorMxMY/d55OmRm/uFJ
 PhZ/ieOd5v1hg3ZIP7dmdGrMIKu73tu3fmZwYAIcwPHHpSjmMjaHdIjixUgHiu4ndXFO5YxsWri
 6OsHAsrjXItI4EQWFoqmvk9YyC+2Ox0gXfon0JpZu/1jrhfY4uqbFfARYFnTeS2XXEnN1rv5eTz
 7AFZX9SfTkSKgVIMfJw==
X-Proofpoint-ORIG-GUID: Ou-DvxP3NuxRjwUnEb-PWBD0Mp3me90c
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-02_02,2026-02-27_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 clxscore=1015 lowpriorityscore=0 bulkscore=0 phishscore=0
 spamscore=0 adultscore=0 impostorscore=0 priorityscore=1501 malwarescore=0
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
	FORGED_RECIPIENTS(0.00)[m:christian.koenig@amd.com,m:ogabbay@kernel.org,m:corbet@lwn.net,m:skhan@linuxfoundation.org,m:joro@8bytes.org,m:will@kernel.org,m:robin.murphy@arm.com,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:tzimmermann@suse.de,m:airlied@gmail.com,m:simona@ffwll.ch,m:sumit.semwal@linaro.org,m:linux-doc@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:iommu@lists.linux.dev,m:linux-media@vger.kernel.org,m:linaro-mm-sig@lists.linaro.org,m:srinivas.kandagatla@oss.qualcomm.com,m:dmitry.baryshkov@oss.qualcomm.com,m:quic_bkumar@quicinc.com,m:quic_chennak@quicinc.com,s:lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[amd.com,kernel.org,lwn.net,linuxfoundation.org,8bytes.org,arm.com,linux.intel.com,suse.de,gmail.com,ffwll.ch,linaro.org];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:dkim,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns]
X-Rspamd-Queue-Id: 3EBE71D5468
X-Rspamd-Action: no action



On 2/24/2026 2:35 PM, Christian König wrote:
> On 2/23/26 20:09, Ekansh Gupta wrote:
> ...
>> +int qda_ioctl_gem_mmap_offset(struct drm_device *dev, void *data, struct drm_file *file_priv)
>> +{
>> +       struct drm_qda_gem_mmap_offset *args = data;
>> +       struct drm_gem_object *gem_obj;
>> +       int ret;
>> +
>> +       gem_obj = qda_gem_lookup_object(file_priv, args->handle);
>> +       if (IS_ERR(gem_obj))
>> +               return PTR_ERR(gem_obj);
>> +
>> +       ret = drm_gem_create_mmap_offset(gem_obj);
>> +       if (ret == 0)
>> +               args->offset = drm_vma_node_offset_addr(&gem_obj->vma_node);
>> +
>> +       drm_gem_object_put(gem_obj);
>> +       return ret;
> You should probably use drm_gem_dumb_map_offset() instead of open coding this.
>
> Otherwise you allow mmap() of imported objects which is not allowed at all.
Thanks for pointing this, Christian. I'll read more about this and fix as per your suggestion.
>
> Regards,
> Christian.

