Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mL86BHUEn2mZYgQAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Wed, 25 Feb 2026 15:17:25 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 49EC9198961
	for <lists+dri-devel@lfdr.de>; Wed, 25 Feb 2026 15:17:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5628C10E774;
	Wed, 25 Feb 2026 14:17:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="Ujpyutbf";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="QE6NKmeJ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4DF5F10E774
 for <dri-devel@lists.freedesktop.org>; Wed, 25 Feb 2026 14:17:20 +0000 (UTC)
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 61P9SCvO806718
 for <dri-devel@lists.freedesktop.org>; Wed, 25 Feb 2026 14:17:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 ghT7JDNMf0qUDVWiQwz9lqduowwivTxtJyYYgUsqveE=; b=UjpyutbfEqKkZYGW
 i6kNlF9sQC7810SDSSgkU8qIP2h1NJNWIAo4UfV0mRnzviKkCvRAo52AoTF2bTS7
 CneBdh+Sr0XyU2zVaDbqwh9u495udpm8r++TK3HGvLUHiaNWDugOI9DATLA063uv
 LkpzZasUEP9ivAozPL1zzagcggPjxVkicPDNpziwIwuiSzI4MiJlfe8j/Yx4KKki
 srhd9JRj5Fk/2/hPWEM4x2Ph1Tpr51ftHEpOcKM1aGxVGV6vLlTZ1fmsClhU6v+1
 A1ko3K8cDD38EZJo9JpgkcsSbRaS1N3EK0YrR22Fb0ZLNHCusRdMWdoMT2zRyXdO
 SOT0hg==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com
 [209.85.210.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4chr5p9v8e-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Wed, 25 Feb 2026 14:17:19 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id
 d2e1a72fcca58-8272825e843so465856b3a.1
 for <dri-devel@lists.freedesktop.org>; Wed, 25 Feb 2026 06:17:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1772029038; x=1772633838;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=ghT7JDNMf0qUDVWiQwz9lqduowwivTxtJyYYgUsqveE=;
 b=QE6NKmeJCdKrYTQVd4R6Dq24+No6dYoPE+/dk2wBjea03yYWyYbrPK7n4gJmY9CNUl
 FPAf4W5NhWUX+THPS2EJV4YivjsyTyNlPwx7LvKZYE9d01ogEb3J8vsT6RRNr8zphRzS
 jTH8F8MikzGILblLJTTATOG/qPg+O4MSdgsNKPH8WErutSqiJzQ4FscPd9x0UplPfUl6
 Wef7OpbZB+55/3+LxAxay0eqOUqkn8XzV3lBP82bhOgyXt/VdBCW8HnS65J9AwTSTBFW
 uG2mKgwSxXbLOtwfDsTduozidhfTQfD63haBlTlPMZC8E7CPAFRVeog9bBpeBvF5Y4+t
 0GTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1772029038; x=1772633838;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=ghT7JDNMf0qUDVWiQwz9lqduowwivTxtJyYYgUsqveE=;
 b=IN8GXgVImAKK3NN49LLYx0phTwQQlp+oJeKmDieWSMzpqZT+ZLgkQy3WmmkclFM4HW
 7EkYbHImd0k8Dg8peXS52oOhn595EdGuiz6/muWmwiyKm/xl2QaKPoXGCP1xck6M7muK
 JQ579u2CbknnIfIgWTNVfzr8GUxfnnb3SXKu6432GVAai2z0shj400M76CdIvK1312CQ
 vYhUCDKrsmVh3nQIZkv4rYFldToim4+mrv6xqEOilztaHkyPte1V8zRc3s9V5H26L34e
 X3W67q65fI5r9dFrGWmZpsI5L8JhGEgJT5KJ1SLxfq9mJ1Z9DGsGSYpEG76oKNLKj9vL
 x/1A==
X-Gm-Message-State: AOJu0Yy3urbRTxK07baHjFNovxpBGAc7oRvdxjRsCngZg4JuBCA/tynI
 aEvwWZSj1RbiXM0DjA9/7MSCpZDlSD2VUGhN9kdCGGvlOU4Q/nu0D5+G6wrYxPx0rMICv97W8xv
 KGQ1IKxPs4mJ+mRfe3DW+wYTuSVa0VahGzmqcyMjljCKrm1cEjtUgVL8M1Q0gJvy+ckLr36o=
X-Gm-Gg: ATEYQzxxc3KPfZSMkKiw6nkc1/qP7qXe/T1OiMOSndP7ySwNFR5vrAFR50QYt/pZrmW
 to664/K9dWTxnE83QS6lNlt+ebEOUzfXZ8B3seab6V+uY24bxaX6OMXuwqhlvZ/a2143wZHX3Sh
 dYVW8wSMNlanLF2kYaEmtyzSgS76Jv+Odmg5bzm26ziRbYcqC62OUZ4qtu6gWcYIVF6Hv+/HLzo
 o7sVsyOIBFM3IGGQf9WWXaNFTa40SavbKRrWn8R/V7iKCnEDvf0nR59pgt2k7VEIPX2HdEY7Eio
 iaE5ISShqsbJ8qaWenubUnm+RBoRWucQbvdDmlU/urjzqARK/MvcfBDBzGhtfUViv+W5PTPAMPp
 69yNznhwU+BN1H03mJ2d6N2PvbvjeOtmyfsOoRUe3JK95HfFXxEo=
X-Received: by 2002:a05:6a00:2407:b0:81f:33a6:e9cd with SMTP id
 d2e1a72fcca58-826daa82b31mr16934491b3a.57.1772029038311; 
 Wed, 25 Feb 2026 06:17:18 -0800 (PST)
X-Received: by 2002:a05:6a00:2407:b0:81f:33a6:e9cd with SMTP id
 d2e1a72fcca58-826daa82b31mr16934446b3a.57.1772029037741; 
 Wed, 25 Feb 2026 06:17:17 -0800 (PST)
Received: from [192.168.1.5] ([171.61.227.247])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-826dd641040sm13758026b3a.10.2026.02.25.06.17.10
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 25 Feb 2026 06:17:16 -0800 (PST)
Message-ID: <5a278b02-f2ad-408b-b0ad-f2297817bd7e@oss.qualcomm.com>
Date: Wed, 25 Feb 2026 19:47:08 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC 01/18] accel/qda: Add Qualcomm QDA DSP accelerator
 driver docs
To: Trilok Soni <trilokkumar.soni@oss.qualcomm.com>,
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
 <e94ce683-d47c-4c8e-8b26-cd327c891cc8@oss.qualcomm.com>
Content-Language: en-US
From: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
In-Reply-To: <e94ce683-d47c-4c8e-8b26-cd327c891cc8@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjI1MDEzNiBTYWx0ZWRfX6FnhTwQzTps2
 wYQihA6wPLsISXkEIsox6FQYYmO7ZeG4E+CoxBeP2i31KWkXXRUbw1sVTy66BTysiEPbj7YjfMd
 8ub8rUWwoUM+0MHEy24yW7lwClvadyU5duaorzeF5eQ09tC1jAKlf9rS4bbflQ71lbgTpcqSPJG
 nSQ/1Sg9oJMeANP2DrWJ77u5uDrqY24+2BI2WtjQEiAkVqcYp9QEyt19W5ah6CIWzbleVNTuYFz
 zLsf2Wkfz0/oYPLCe7kw653UfCkGxCeFeZCYurzsuhLHVM2h8o32qBtXt/q/7v1Wdq0ZoPY9aUl
 5XqKSd9d0OTGVJnXKf4QefWhC9b7yJvt28sT5x7TfXpXynj/u0nA24TiEAz1jxV8miQFZZrVy/p
 b4KphgRtqTj4N7yu+VyF8ag5qLDkVeKJ7+ZOsgCoaBRWJIssceRv99ALaYsYaLdfwLfssOW6wYS
 sQQkZ02crs3STcv9Bdg==
X-Authority-Analysis: v=2.4 cv=GstPO01C c=1 sm=1 tr=0 ts=699f046f cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=CLJ8B99oKJtQbdnoKiLypA==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=p29BN9gyRe82g0miaHUA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=2VI0MkxyNR6bbpdq8BZq:22
X-Proofpoint-GUID: MMZIO_BwuVkT377Ti93L7doqFnJFW99Z
X-Proofpoint-ORIG-GUID: MMZIO_BwuVkT377Ti93L7doqFnJFW99Z
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-25_01,2026-02-25_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 suspectscore=0 priorityscore=1501 malwarescore=0 impostorscore=0
 phishscore=0 adultscore=0 lowpriorityscore=0 clxscore=1015 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2602250136
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
	FORGED_RECIPIENTS(0.00)[m:trilokkumar.soni@oss.qualcomm.com,m:ogabbay@kernel.org,m:corbet@lwn.net,m:skhan@linuxfoundation.org,m:joro@8bytes.org,m:will@kernel.org,m:robin.murphy@arm.com,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:tzimmermann@suse.de,m:airlied@gmail.com,m:simona@ffwll.ch,m:sumit.semwal@linaro.org,m:christian.koenig@amd.com,m:linux-doc@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:iommu@lists.linux.dev,m:linux-media@vger.kernel.org,m:linaro-mm-sig@lists.linaro.org,m:srinivas.kandagatla@oss.qualcomm.com,m:dmitry.baryshkov@oss.qualcomm.com,m:quic_bkumar@quicinc.com,m:quic_chennak@quicinc.com,s:lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,kernel.org,lwn.net,linuxfoundation.org,8bytes.org,arm.com,linux.intel.com,suse.de,gmail.com,ffwll.ch,linaro.org,amd.com];
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
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[dri-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:dkim,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns]
X-Rspamd-Queue-Id: 49EC9198961
X-Rspamd-Action: no action



On 2/24/2026 9:03 AM, Trilok Soni wrote:
> On 2/23/2026 11:08 AM, Ekansh Gupta wrote:
>> Add initial documentation for the Qualcomm DSP Accelerator (QDA) driver
>> integrated in the DRM accel subsystem.
>>
>> The new docs introduce QDA as a DRM/accel-based implementation of
>> Hexagon DSP offload that is intended as a modern alternative to the
>> legacy FastRPC driver in drivers/misc. The text describes the driver
>> motivation, high-level architecture and interaction with IOMMU context
>> banks, GEM-based buffer management and the RPMsg transport.
>>
>> The user-space facing section documents the main QDA IOCTLs used to
>> establish DSP sessions, manage GEM buffer objects and invoke remote
>> procedures using the FastRPC protocol, along with a typical lifecycle
>> example for applications.
>>
>> Finally, the driver is wired into the Compute Accelerators
>> documentation index under Documentation/accel, and a brief debugging
>> section shows how to enable dynamic debug for the QDA implementation.
> So existing applications written over character device UAPI needs to be
> rewritten over new UAPI and it will be broken once this driver gets
> merged? Are we going to keep both the drivers in the Linux kernel
> and not deprecate the /char device one? 
>
> Is Qualcomm going to provide the wrapper library in the userspace
> so that existing applications by our customers and developers
> keep working w/ the newer kernel if the char interface based
> driver gets deprecated? It is not clear from your text above. 
Thanks for raising this, Trilok.

This is one of the open items that I have. I'm not exactly sure what would be the
acceptable way for this. 

As you mentioned, applications that rely on /dev/fastrpc* might not work on QDA
without modification.

I was thinking in the same lines as you have mentioned and  having some shim/compat
driver to translate FastRPC UAPI to QDA. The compat driver would expose the existing
character devices and route the calls to QDA. The compat driver could be built via Kconfig.

However, I haven’t encountered an example of such a UAPI‑translation driver in the kernel
before, so I would want guidance from maintainers on whether this is an acceptable
model or not.

Regarding your question about library, all the APIs exposed by github/fastrpc library are kept
unchanged in terms of definitions and expectation. The same project can be build for both
FastRPC and QDA based on configure options. So, the applications using github/fastrpc should
not face any problem if the libs is built with proper configure options.

I have noted your point regarding the doc not providing clear details, I have added interface
compatibility information in cover letter and will try pulling the same to Doc.
>
> ---Trilok Soni

