Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GOHtInxGpWkg7AUAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Mon, 02 Mar 2026 09:12:44 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EF5391D47B3
	for <lists+dri-devel@lfdr.de>; Mon, 02 Mar 2026 09:12:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5382910E44F;
	Mon,  2 Mar 2026 08:12:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="Zcdf6M3T";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="FBzy7ZFm";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B95BB10E452
 for <dri-devel@lists.freedesktop.org>; Mon,  2 Mar 2026 08:12:40 +0000 (UTC)
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 62267SAO2644298
 for <dri-devel@lists.freedesktop.org>; Mon, 2 Mar 2026 08:12:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 YsoqRWEnmbezHwWXwK/cDOGeLeQ6w9y75yey82wwwm4=; b=Zcdf6M3TDZSqgLfi
 2fOACi2y03BjI9OAyOXRdu+xMXNoPtWdj6Ek1x0Qy/8C4fGtH76ZW/iXVF3mWHAA
 ztFRrpNZLG/8+C5HjF+ze1OXv5Y42H48tv31J8YAeKOdKDxcmE2vUM4XHdK1SH8N
 jqX0S6BVY+TTHOKa8leb4b0QIf0+mKpOvK/3mI1ThRJe9zUEqvEukp/XDr4nbxUA
 jTo+HvAOgYjTVPbYEgaxGiCkubU/Qs+Ysfngq2+QgLtFbQ/5LSG4vly1R6QsXvWS
 TMUF1Drizz87ppE9SsMzmlkgV+Ggb5Rd3yAQJTIXDHGPAD5hIZQufb/rTITsRA5J
 nkpwuA==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com
 [209.85.210.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cksf6mk4b-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Mon, 02 Mar 2026 08:12:39 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id
 d2e1a72fcca58-82740488112so10926255b3a.2
 for <dri-devel@lists.freedesktop.org>; Mon, 02 Mar 2026 00:12:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1772439159; x=1773043959;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=YsoqRWEnmbezHwWXwK/cDOGeLeQ6w9y75yey82wwwm4=;
 b=FBzy7ZFm8pnQcSKJrw1BOzw5k8Fh9vD+oNBvH1VAu/QLMgLuVoNZi3zX9ejRY+iBfI
 SUJnED/IKiIX5wEbZxtXlkzsZHY1y7ceLjjKOyJHyoy+HPUUriIhMc8pgJY8efjeOOpk
 /ezLaVyIbOsSO1ckgEZSPjwnj4uBLrrWQ7GUElrBRiEFgIOEVG6mD5iMeGvnqMHe89Es
 fgGU5dCvRkMmtA7NamyydUvozvVPQhV4bc73KfqXFIPf4OLh1YPRxzehKHPi1VG3orJS
 oLgOPbpc9ECmKN965A/n/ihak+39OuW7XV2TpKetrtJD55NSs7V2zIXSL5tIVRO7aQvC
 hwuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1772439159; x=1773043959;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=YsoqRWEnmbezHwWXwK/cDOGeLeQ6w9y75yey82wwwm4=;
 b=uE3MZTmG3HvCquf2dWHVa+GE7idz8QXIN4kFATFlo4/2bbAPhyzSpB1bxCK5l7AcFK
 ssLQuVcKBPVuN9Pq9LDAVIPPeQJ9zCIxSoXV2JgNixiaDMmo1fkipqlkRdcs+2K/SOCZ
 h3fofIKa+x6fsgZ9SQ7Gwy0Yf9X9GV+sAvnGeBlUXrJ0/BFjzIXeeOAA908dt5GOhv99
 wnH75hZQcrdPhFsZ9iw7tVUaeYfC3CJiLaBoQTPeq4Lz8gDDeGYLITpKz3+mrCH2We5A
 AagK9y5s+sENhSL7lFMJjMhhQyw8GVlFqTK8UmzriS2xiwymOm0ZnfloIqtt2SpFOzBk
 JRqQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWm1jayi1qjPGILk8H2WfVfOXXpPzY3W0aicrhhWYCQ3lhLyVc9+0iR5DTjymiPIw+ZCm+XMlJI8EQ=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyNA2bsTTi9RmNwsYMFTVT/lnTkcVCFtZg58orNWx84vix7SZJg
 1XRkNPWzOF2CBM+F7OOpJ+mpxiEpi8mrCPsLR9q+3vLzNITbMCNMW2i9A7azZvE8GPtZnJMLkSq
 Y4IRLAh1MB3OnRG/YgRDR7UtCbCPOcw7/tSWa9AcpxA48df/vVOZAcw64DXDIdxH4v4DWu9o=
X-Gm-Gg: ATEYQzy0FpuXV/htOpYAwqxpPiWHySHZ2WoOAaJ9IWfCC7HBF7cE1mOIUwaOU/+bosj
 sjTWyGX8ie1JhfULK4yJe3SONg0kEkBZBt6PIWk9J2Av+fVi5e+mbX78sJvccAosQPg20pDoOKJ
 +HgadI9RZ9HI3UDK8lzsfqVKrAEn3NMVNS6Qx6t+WyC2jzlGQhSAzHNAUPBfOeGQnLejAkoSuH8
 RLfW9hn9AcxPVMrsyhfSgGIATCAL/rOGlfkjtVs+x8w/ieYHCDNlj0lR83VctcbkYILOsynRI0s
 Tlj5Mq/WgFgVLKXSrxENLtR2TCbDezzrZF9ydvQa8HfAJehTGIuZPHQBzV8RglRHLjvqlo58AA2
 x4hoao9Uco92ciCdZhjTQqEq8jX8Z0uIpuKM1NSvEEfXnEFehcw==
X-Received: by 2002:a05:6a00:414a:b0:81b:8872:ae10 with SMTP id
 d2e1a72fcca58-8274d8090eemr11013994b3a.0.1772439158706; 
 Mon, 02 Mar 2026 00:12:38 -0800 (PST)
X-Received: by 2002:a05:6a00:414a:b0:81b:8872:ae10 with SMTP id
 d2e1a72fcca58-8274d8090eemr11013957b3a.0.1772439158150; 
 Mon, 02 Mar 2026 00:12:38 -0800 (PST)
Received: from [10.206.99.28] ([202.46.23.25])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-8273a060071sm12915292b3a.63.2026.03.02.00.12.31
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 02 Mar 2026 00:12:37 -0800 (PST)
Message-ID: <7c795b4b-3a3f-47fb-9ef9-0b13601f584c@oss.qualcomm.com>
Date: Mon, 2 Mar 2026 13:42:30 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC 04/18] accel/qda: Add built-in compute CB bus for QDA
 and integrate with IOMMU
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
 <20260224-qda-firstpost-v1-4-fe46a9c1a046@oss.qualcomm.com>
 <ox7jnqkjo3frhbgpp63sse7ram72obihe4qlbbn4z22wbw4szr@7pzoeecdvsyg>
 <e82443ff-f6c1-4b8e-b573-f4620dd0f17c@oss.qualcomm.com>
 <x6zseuf7g3ngtdlszf3vxj3nqexlkbtrp5kifo4tg4muzdef4n@5rngfg4gu47m>
Content-Language: en-US
From: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
In-Reply-To: <x6zseuf7g3ngtdlszf3vxj3nqexlkbtrp5kifo4tg4muzdef4n@5rngfg4gu47m>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: MJoHGLyL6FtW6LJXNuyxjRp7ZtPzM-Eu
X-Authority-Analysis: v=2.4 cv=JoL8bc4C c=1 sm=1 tr=0 ts=69a54677 cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=jwkSyuDCPDQl0KFoS7wA:9 a=QEXdDO2ut3YA:10 a=2VI0MkxyNR6bbpdq8BZq:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzAyMDA3MCBTYWx0ZWRfXyZZzlchgIrDz
 9SKZCynhc0EA/xHMLFIFMLJ+9/Wk1ev143L9KOLe8XXt7gbQ6aumG4eJepub+NEQL0FKhdpHFax
 fiP0kx9N5Oldx1z0NDGfUky7S88jfdXOuYv2p48PqHaZj/KugbFV2IARAYi48f/VtLYk/O7aeK4
 fqq6YGB2OVeF/xDZwjKUQEIny28gqhJoQojRfc4gAhstM8mMQQM5kxCNxSzIJ2y1fw2t/j2ifLq
 q4UKHtMkK4dGKNyP1c7DhCfrfklOeTSR8UblIQt+x7MlDFDfuedTgVFOgAyzQEQ/xHEy8nysskv
 XSmXUOh9F1B9NFFFAHLUQ0qyE2WAisnnB7Zqt66EhESuB2VJrK5RpScYrhEoYorIfMbAut4u/Q/
 gCYxMKdQlP+Zt5LaeQW3YhVlrmWaFE3xht/MCSkHpEvC2wRamO03luI2CM0BQHbv47ta2v8Zv/7
 LOclulydawaGHJjtzpw==
X-Proofpoint-GUID: MJoHGLyL6FtW6LJXNuyxjRp7ZtPzM-Eu
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-02_02,2026-02-27_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 suspectscore=0 malwarescore=0 priorityscore=1501
 adultscore=0 bulkscore=0 clxscore=1015 impostorscore=0 spamscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2602130000
 definitions=main-2603020070
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:dkim,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns]
X-Rspamd-Queue-Id: EF5391D47B3
X-Rspamd-Action: no action



On 2/26/2026 12:39 AM, Dmitry Baryshkov wrote:
> On Wed, Feb 25, 2026 at 11:26:52PM +0530, Ekansh Gupta wrote:
>>
>> On 2/24/2026 4:14 AM, Dmitry Baryshkov wrote:
>>> On Tue, Feb 24, 2026 at 12:38:58AM +0530, Ekansh Gupta wrote:
>>>> Introduce a built-in compute context-bank (CB) bus used by the Qualcomm
>>>> DSP accelerator (QDA) driver to represent DSP CB devices that require
>>>> IOMMU configuration. This separates the CB bus from the QDA driver and
>>>> allows QDA to remain a loadable module while the bus is always built-in.
>>> Why? What is the actual problem that you are trying to solve?
>> Bus needs to be built-in as it is being used by iommu driver. I'll add more details here.
> It's an implementation detail. Start your commit message with the
> description of the issue or a problem that you are solving.
Ack.
>
>>>> A new bool Kconfig symbol DRM_ACCEL_QDA_COMPUTE_BUS is added and is
>>> Don't describe the patch contents. Please.
>> Ack.
>>>> selected by the main DRM_ACCEL_QDA driver. The parent accel Makefile is
>>>> updated to descend into the QDA directory for both built-in and module
>>>> builds so that the CB bus is compiled into vmlinux while the driver
>>>> remains modular.
>>>>
>>>> The CB bus is registered at postcore_initcall() time and is exposed to
>>>> the IOMMU core through iommu_buses[] in the same way as the Tegra
>>>> host1x context-bus. This enables later patches to create CB devices on
>>>> this bus and obtain IOMMU domains for them.
>>> Note, there is nothing QDA-specific in this patch. Please explain, why
>>> the bus is QDA-specific? Can we generalize it?
>> I needed a custom bus here to use for the compute cb devices for iommu
>> configurations, I don't see any reason to keep it QDA-specific. The only requirement
>> is that this should be enabled built in whenever QDA is enabled.
> Why? FastRPC uses platform_bus. You need to explain, why it's not
> correct.
Ack.
>
>> But if I keep it generic, where should this be placed? Should it be accel(or drm?) specific?
> drivers/base? Or drivers/iommu? That would totally depend on the issue
> description. E.g. can we use the same code for host1x?
I'll evaluate and bring this change separately for fastrpc and host1x.
>
>

