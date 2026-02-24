Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id OBhtCwAcnWmPMwQAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Tue, 24 Feb 2026 04:33:20 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8CA1C181662
	for <lists+dri-devel@lfdr.de>; Tue, 24 Feb 2026 04:33:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6CB8B10E1EA;
	Tue, 24 Feb 2026 03:33:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="MpsmBFFf";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="kmvg99d8";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8F3E910E1EA
 for <dri-devel@lists.freedesktop.org>; Tue, 24 Feb 2026 03:33:15 +0000 (UTC)
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 61O3Koac1334249
 for <dri-devel@lists.freedesktop.org>; Tue, 24 Feb 2026 03:33:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 cw5oOYysEVaaTcVwIagtgtb1acPAUP70RqJhekAP7Zs=; b=MpsmBFFfOVHfn/pk
 Gg4QcxaaZhK4U4eeUQBi7urMNKOvTDwSza1oS2UzSLIHLFy6kA7W7NleuM4sn6pl
 M4x4z6TjyHPZgg4ou/d8h8DibM3bcqEdiwQu0FeW7LgGxLih+lLSrErJxFh5rbzX
 joWxCc85TVP2OaJiKwZxzYkKcrm6kl8YijJF6ZMr0v7LH8HP2qqM6Z0p5yvz6YbR
 XjQe9GyKv84EeXPKNaDjKC9RSLpcMfINW3laTZ+VfF97K/O+0n8fHtp5xtJi4egN
 BJECOTqR8p85DNs0EfpaZlyZzaGKFuO8gdAkbKig/BVcURryr6jTJC7DzqVx83T0
 W1ob0w==
Received: from mail-dl1-f71.google.com (mail-dl1-f71.google.com [74.125.82.71])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cgn8ttr57-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Tue, 24 Feb 2026 03:33:14 +0000 (GMT)
Received: by mail-dl1-f71.google.com with SMTP id
 a92af1059eb24-12711967e0eso7024352c88.0
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Feb 2026 19:33:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1771903994; x=1772508794;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=cw5oOYysEVaaTcVwIagtgtb1acPAUP70RqJhekAP7Zs=;
 b=kmvg99d8f8MnEHByb1r2O2Qe/WjkgIBSGgr0iWlISwqCIaQoDhUjQKWI/+lZj0zLjj
 JGdwJU2rrYZ+ORhSqAJkklOM6ImxdRjIfxXzX5hvU13vBpHj7sokY7O1f4T7CDmlIbOw
 Q1aiZJQOQKPvYPUAPioBpJ4YrGBJTy1Y+pUe91kOY2+8JY8UVAB86/lZMKnOdqq4yorX
 SBCZTO8Kg+NqmZwM8wpfjGH8O8fVNY0eCD/iTkkmawDS7sHZejLwowd6j7BAaaEUYw0L
 THrD+lfnK0rNJ1IjwrU+odh+AamuFYTDHMd5grVxd5avM/50+kFRZ3GFuS2CvRSEeeFf
 mBVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1771903994; x=1772508794;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=cw5oOYysEVaaTcVwIagtgtb1acPAUP70RqJhekAP7Zs=;
 b=eYtY0QFYII0/aJhYK7D8sn2G7H04WOkYJi94gLdwvUMbKHtF6d/xjmiaDkoEW5IzYW
 0l1khIz+V5K3cptIYDPlvtcx67kwnu4CdMF1m6RqyYrkaCyEW0aySzrbM9f1XjBAvTFK
 Pvz85FtMHRQs+4veCZopyWcRnX9oK4yfDLauvUbNVcLV7CFhvUUOkrf/L0lAInRiPgof
 9mnB+rbguDCxJBd0BYn3e30G/ovIl/2VtLUT17pd4n41VvR35qvQY4dfPnmAp3gvlFkW
 alEkilcVxvhy5kLjCyp0RNRAROMH2S4si9TgzoVB2WJPP/atmbfQW2KhE6BlMnbDLGs6
 UO5g==
X-Gm-Message-State: AOJu0Yxw3xfYn+HC2SMY0E3095Wtjm9A5VqP2SB9N2cKgWXccqdjxrJz
 guGwiFWQp4fTm3zmpJ6KrUymHBoYtZzx7ZfotD2ZXE28yua3zZ9GoOL+Vo4zoJg0LxPfaA40P/i
 CNkzsB0AYjVtoetKQBb0BYdC0oE2UrE8sTNSM08Bww//CM9ok3D0UGp4gpfwqRY5DttHfYcg=
X-Gm-Gg: AZuq6aLHCNJZJR7z9JFiWM3OIEHDEMdPg01+uipINS3zFxg6eAFtZ5yfbJ3d6RWLe4R
 hTEubuAyi5ONtzHHoaUDOJMPTdmVNOrfgzBs21E7iyWddHrEIc6CaJZMxBKweUK33EOJgXqmegM
 uTiwuqIPhibakEefZrbNzJpdZYgPsb6CKB4EhGyGKgISuwHsrGI2oTf4DVZvd2CXWFWbiFDx1MM
 Ihara/5Zc/NPzdC88v5bJi6ERxKvZ2Wa0LRG0oguybh0EyQgPTe8EHPTF2+cMNkpNTKvTNfCCVD
 +4hFoI++mm58Royb8wUZCXCpL9RaR2HjVw6Ks2Jzdy1ws6UTenmGJXe45RdK9GelWigqLXkp+r0
 f7IaouqIutGbBAaS7/8znuGiOLfRAQfW0YJ69LcSgM1/D82G7tMksrwE=
X-Received: by 2002:a05:7022:4387:b0:121:9f05:c4c2 with SMTP id
 a92af1059eb24-1276ad18ec5mr3365905c88.23.1771903994061; 
 Mon, 23 Feb 2026 19:33:14 -0800 (PST)
X-Received: by 2002:a05:7022:4387:b0:121:9f05:c4c2 with SMTP id
 a92af1059eb24-1276ad18ec5mr3365882c88.23.1771903993530; 
 Mon, 23 Feb 2026 19:33:13 -0800 (PST)
Received: from [192.168.86.165] ([76.176.48.107])
 by smtp.gmail.com with ESMTPSA id
 a92af1059eb24-1276af20fc8sm10325680c88.6.2026.02.23.19.33.11
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 23 Feb 2026 19:33:12 -0800 (PST)
Message-ID: <e94ce683-d47c-4c8e-8b26-cd327c891cc8@oss.qualcomm.com>
Date: Mon, 23 Feb 2026 19:33:10 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC 01/18] accel/qda: Add Qualcomm QDA DSP accelerator
 driver docs
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
 Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>,
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
 Bharath Kumar <quic_bkumar@quicinc.com>,
 Chenna Kesava Raju <quic_chennak@quicinc.com>
References: <20260224-qda-firstpost-v1-0-fe46a9c1a046@oss.qualcomm.com>
 <20260224-qda-firstpost-v1-1-fe46a9c1a046@oss.qualcomm.com>
Content-Language: en-US
From: Trilok Soni <trilokkumar.soni@oss.qualcomm.com>
In-Reply-To: <20260224-qda-firstpost-v1-1-fe46a9c1a046@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=X7Jf6WTe c=1 sm=1 tr=0 ts=699d1bfa cx=c_pps
 a=JYo30EpNSr/tUYqK9jHPoA==:117 a=lsoD3MMNObdLvy1227ExmA==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=88Pab4rnIKjo3RbOS5oA:9 a=QEXdDO2ut3YA:10 a=Fk4IpSoW4aLDllm1B1p-:22
X-Proofpoint-ORIG-GUID: zNwcK5uhySN2A4xf5mw1Ezzq-5bHFbgw
X-Proofpoint-GUID: zNwcK5uhySN2A4xf5mw1Ezzq-5bHFbgw
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjI0MDAyOCBTYWx0ZWRfXwqlF15G/b2Z7
 AMWWbKiTSYm5p+1eetwlXJmOf6joa7YGk3qJWEMcl0uac8DiUd+0T48qm1YH/Eo1sPLKaU60nY8
 ZHZC1CrVG4TsQ2CDuJ/wxntOPdrxp/iHn88jq6pdlO6m7nW1IsSPSyTC6O9nChX6z9fPevufOyY
 bSrxKBUucxBl+MBubq3zrLmt8Dfyyj3kxmDZ3vDm6PNto5sYpu0ogn1SaljT5OK0yOxX16nvthn
 HxOMDEWgNQr7TkfsV92cf7LBEIFJyKOTA132WJDmOTUF9dmAVgCBxD1YHuxJtxqT7JqJmQggaHP
 0b57WTPfPysEaq6gGdYhWUb+Rh7912bs3PZulDLPSlNuMh1u1wC2if6m2HELFblygEP3s2LCpkY
 aeSGyprap+ntbVFfJxSurDkuJPbGZmI2PxMQ7det7AZpoC+Wz868LtNrsFiwVCFVM5r3NVRitqX
 nEI1OBnFvFd0Q5J/3Fg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-23_06,2026-02-23_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 priorityscore=1501 clxscore=1011 bulkscore=0
 adultscore=0 spamscore=0 impostorscore=0 lowpriorityscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2602240028
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
	FORGED_RECIPIENTS(0.00)[m:ekansh.gupta@oss.qualcomm.com,m:ogabbay@kernel.org,m:corbet@lwn.net,m:skhan@linuxfoundation.org,m:joro@8bytes.org,m:will@kernel.org,m:robin.murphy@arm.com,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:tzimmermann@suse.de,m:airlied@gmail.com,m:simona@ffwll.ch,m:sumit.semwal@linaro.org,m:christian.koenig@amd.com,m:linux-doc@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:iommu@lists.linux.dev,m:linux-media@vger.kernel.org,m:linaro-mm-sig@lists.linaro.org,m:srinivas.kandagatla@oss.qualcomm.com,m:dmitry.baryshkov@oss.qualcomm.com,m:quic_bkumar@quicinc.com,m:quic_chennak@quicinc.com,s:lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,kernel.org,lwn.net,linuxfoundation.org,8bytes.org,arm.com,linux.intel.com,suse.de,gmail.com,ffwll.ch,linaro.org,amd.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	ARC_NA(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[25];
	FORGED_SENDER(0.00)[trilokkumar.soni@oss.qualcomm.com,dri-devel-bounces@lists.freedesktop.org];
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
	NEURAL_HAM(-0.00)[-0.998];
	TAGGED_RCPT(0.00)[dri-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:dkim,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns]
X-Rspamd-Queue-Id: 8CA1C181662
X-Rspamd-Action: no action

On 2/23/2026 11:08 AM, Ekansh Gupta wrote:
> Add initial documentation for the Qualcomm DSP Accelerator (QDA) driver
> integrated in the DRM accel subsystem.
> 
> The new docs introduce QDA as a DRM/accel-based implementation of
> Hexagon DSP offload that is intended as a modern alternative to the
> legacy FastRPC driver in drivers/misc. The text describes the driver
> motivation, high-level architecture and interaction with IOMMU context
> banks, GEM-based buffer management and the RPMsg transport.
> 
> The user-space facing section documents the main QDA IOCTLs used to
> establish DSP sessions, manage GEM buffer objects and invoke remote
> procedures using the FastRPC protocol, along with a typical lifecycle
> example for applications.
> 
> Finally, the driver is wired into the Compute Accelerators
> documentation index under Documentation/accel, and a brief debugging
> section shows how to enable dynamic debug for the QDA implementation.

So existing applications written over character device UAPI needs to be
rewritten over new UAPI and it will be broken once this driver gets
merged? Are we going to keep both the drivers in the Linux kernel
and not deprecate the /char device one? 

Is Qualcomm going to provide the wrapper library in the userspace
so that existing applications by our customers and developers
keep working w/ the newer kernel if the char interface based
driver gets deprecated? It is not clear from your text above. 

---Trilok Soni
