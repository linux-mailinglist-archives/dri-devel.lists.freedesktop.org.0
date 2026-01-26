Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id MK9HOE8+d2mMdQEAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Mon, 26 Jan 2026 11:13:35 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 97EE786816
	for <lists+dri-devel@lfdr.de>; Mon, 26 Jan 2026 11:13:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3A231890BB;
	Mon, 26 Jan 2026 10:13:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="fMOcTvId";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ALTi+5rB";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9B56688A3E
 for <dri-devel@lists.freedesktop.org>; Mon, 26 Jan 2026 10:13:31 +0000 (UTC)
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 60Q8ojwx286436
 for <dri-devel@lists.freedesktop.org>; Mon, 26 Jan 2026 10:13:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 919VH1z/KO4piWrGs8r1dcfvIGrj9JNBtgoqDYAJ5XY=; b=fMOcTvIdQPDgjFDs
 jIZ/0VcEtKXXBFy5xxrmD5Nq40m/Pw/IjAbClC1TmASJKArPtajLCpXMOBLZsHVV
 AtZlppsW6LVHVa2OmThj7ZY3LOAtnG/Q5ilSoB4J5AyCsAGKJTyNL44C2tHilIJu
 8jgkcmoWWy7ixir7WVNLFCXLkJDXF5Jk0J9NBSxUEm+YdsutMGZQZFWWU0ntPEPg
 MudHEfoc1YGNi/vPbV23OJGivXO8K1fDJqRMx87iUlWwnxhrvRcTsg0qQAhjvYxo
 diK75qgPtyAAZM+Dyz+YgL5/R65hXNw5+NIkWskIX4pvDWeXslOqjsySoc2DayIz
 RlKuUw==
Received: from mail-vs1-f70.google.com (mail-vs1-f70.google.com
 [209.85.217.70])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bvq9qm6e7-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Mon, 26 Jan 2026 10:13:30 +0000 (GMT)
Received: by mail-vs1-f70.google.com with SMTP id
 ada2fe7eead31-5f535184cc5so4097243137.1
 for <dri-devel@lists.freedesktop.org>; Mon, 26 Jan 2026 02:13:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1769422410; x=1770027210;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=919VH1z/KO4piWrGs8r1dcfvIGrj9JNBtgoqDYAJ5XY=;
 b=ALTi+5rBW+sHQP30ZGyYHEzqAM+jBSlEf6j4HqovR7LH35TrmlTzm8AWFS35EEnBpt
 PXR2f2BlfKRoYRuQEs4/zD7xS6/kdHeSgF7sRCMKiaDOgHN9ihzstnfguNIoHaXeuLmH
 ixtJydjq8AfDzP8KFR93UTF/Ihjyj4j/tTkdHTo3Q68GCBQSI4K/dQ+98WLdWMk4huUw
 GmOcDR7ilTuzd9ZImtSng7+M2qiBT8C9T90pJ5pcQ5pBJ3LcmkS+L1RqOmhUHHyG8i34
 KbbxuGuhdOXz2IiDDEgAyDoJd+V3/ddK/gfEhVjdLyMyKZ3ozm1ElXCZaiEGoidqHbz7
 dU/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1769422410; x=1770027210;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=919VH1z/KO4piWrGs8r1dcfvIGrj9JNBtgoqDYAJ5XY=;
 b=UAUA/mpLl2lfvpqOCmeYO8yaG26FcafLyyEXFSfDg1BozD/QQgmW3cxMrbwBoNUYbh
 3ud9reNNGqDkCBriGqTiVv3CovGYJQTFy6cv6GBWTkT6wOzIuLXVADOuJuo2f6dwM+r8
 KMUu/aOBOrPD5VZk7Izbsxx4n4Dp/C4hxYqSG3vfR352Uort6mt7MbdLS23Z6cyNeRII
 Pe5tHmsGJsL/LuN8meIao0dG7ZAMw4Vonu/LBbOH8wP4eU7xYJG6TIR5yLqwoTOi3G9p
 MCJzf5hmEeH5RHeLgVP2p041J3ROpPlK7yXfuOPDvlzKiaQ6kDe6QxUusnhyNlVCC9EC
 dP5g==
X-Forwarded-Encrypted: i=1;
 AJvYcCVUnu0rBAIGfO+70qf7ZFPlKZedY5w2lFywlL66V2i7XsbCOmgQBz6kzGw6gv9YHKoa9EEUAJnlSdM=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Ywj9IzV7EfOMI6uk0yjxK7YrQ9ytO0VQdlUlqlaQRRlGdm7zqRz
 X/H5vPtebLHW/vlV/nqmvcNfpiT/9zlZbckGJKNwrjOXBUS8WHh+RtfZ60P2gta8KLwIYtRb6Lp
 qZmZ2IfAxsZg7EDy5PO32TL6tgREJSjA6RhQH1uAsrlENY0AXSnJEbKOMdOZ7XfUr+2pVZ0k=
X-Gm-Gg: AZuq6aLcgxWTfRl7/tC9LaXrrwcuYwR2M8LQIfJnP3JedCYkXQW5kURNYW/l8A41on0
 L/wZSHvegrnwTq35fD40gcQe06MCHuhqamxS8rnRovhDWYiwBSkeGKstPN5Ce5dqlMPSnTLlXae
 9OqNy4pTedH/XzM99e+7FsNMkyJZbQpXZedC/6kdyMOy9O53AdD/khtyghxWloWnR8pO9Tz3rim
 FHEP3rPEplwQxL6nGtqaWmim8etOnXNgil+dMlvvwLjhXFd1QbdPCGhqGAD9q7jNXzrqoRJZqWe
 qINFe3fnlIsnebZPKwGxMy34rXHah7xhJFC/OS8hNdV3esVK9m96CrQ67/VOJnhyF0CUdZSW9SQ
 BTNo9rRC8HT/lhpaIPrLZEfJ4BYqP8zJ1y49s+IdfZRFQUfNXOJ6jJquicuQ6QyNy
X-Received: by 2002:a05:6102:3ec6:b0:5f5:37f6:2b4e with SMTP id
 ada2fe7eead31-5f57654956amr978555137.40.1769422409654; 
 Mon, 26 Jan 2026 02:13:29 -0800 (PST)
X-Received: by 2002:a05:6102:3ec6:b0:5f5:37f6:2b4e with SMTP id
 ada2fe7eead31-5f57654956amr978543137.40.1769422409217; 
 Mon, 26 Jan 2026 02:13:29 -0800 (PST)
Received: from [10.205.56.101] (84-253-213-87.bb.dnainternet.fi.
 [84.253.213.87]) by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-59de48e5d0asm2542556e87.22.2026.01.26.02.13.27
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 26 Jan 2026 02:13:28 -0800 (PST)
Message-ID: <91d590de-fa00-4df3-923f-b49ad00cd9da@oss.qualcomm.com>
Date: Mon, 26 Jan 2026 12:13:27 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v17 2/4] drm/msm/dpu: Defer SSPP allocation until CRTC
 check
To: Jun Nie <jun.nie@linaro.org>
Cc: Abhinav Kumar <abhinav.kumar@linux.dev>,
 Dmitry Baryshkov <lumag@kernel.org>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Rob Clark <robin.clark@oss.qualcomm.com>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <20260121-msm-next-quad-pipe-split-v17-0-6eb6d8675ca2@linaro.org>
 <20260121-msm-next-quad-pipe-split-v17-2-6eb6d8675ca2@linaro.org>
 <6kzd2g4hgffqz5ipaqbourgiefuxxh3njj44n35blo37z6hhhj@us7lzlgmjuld>
 <CABymUCMf8LxX6VWUuzNJP+G1y3Xi5-CVYhaqLR7F=kU6ZgdcgA@mail.gmail.com>
 <c56e4ylgwcqni23btaxegdbfg3tbkyp2vtjtboeb3kbvcfk27u@vrlh276djtfr>
 <CABymUCP6ZDGtEJeQSZ48x8TZyJ4gKVDC+JzJRz-tZ0ksCUCqsA@mail.gmail.com>
Content-Language: en-US
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
In-Reply-To: <CABymUCP6ZDGtEJeQSZ48x8TZyJ4gKVDC+JzJRz-tZ0ksCUCqsA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: LoB5IzHhS8Z-cMVRUMQSqTYKyxylkgYT
X-Proofpoint-GUID: LoB5IzHhS8Z-cMVRUMQSqTYKyxylkgYT
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTI2MDA4NyBTYWx0ZWRfX/mOZuLAzy5vX
 K5HUdfMW38EI7DcBnZCF8vAikClDRYWOUaU6t0OPxI/VzrL5TA2xBaRKRc0Z66Zr6lyvRr0H733
 zGebc/p6HHb4/kq3JzrhGCA8tUZ9BCqz5PSqO1Ox4Dpj2jd0EaNOOxi5W2WDvF3pgoxpRrJOb53
 yZtTSzrOf1xRsEDdxMmfVZ08XSIm9E0+vYrbO2N2IvO0AAJMLc8OlCbmzmxz45MuBhcSf4LdX2D
 s9stZSrigpaOIp3Gzldin9IVJjCEZI2ORCnSdYi7zvWf3T3/c76oqIerwBbsRTnpIoDJA5k+9eb
 OtT9WKidj4FoXjAtbuaFOACpVHbUTj3TiTh4JqljEPfztxSt6sPYKMIy8zM0l7rSJGBuw79+3r7
 4JJRGmPht0gQfrHQKxTn/BlehXtBmSnMtUm6FgXDBbXtObEI89Nd/9n4LgAbApXxJsFtUJAoNNP
 fEIyKdSb04XUWY+7cVw==
X-Authority-Analysis: v=2.4 cv=TsTrRTXh c=1 sm=1 tr=0 ts=69773e4a cx=c_pps
 a=N1BjEkVkxJi3uNfLdpvX3g==:117 a=oW9j1mrv7lfAxSiOe78TcA==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=JU2WE-GTjbXmrkkuVJ4A:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=crWF4MFLhNY0qMRaF8an:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.20,FMLib:17.12.100.49
 definitions=2026-01-26_02,2026-01-22_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 clxscore=1015 phishscore=0 adultscore=0 lowpriorityscore=0
 bulkscore=0 spamscore=0 priorityscore=1501 malwarescore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2601260087
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
	FORGED_RECIPIENTS(0.00)[m:jun.nie@linaro.org,m:abhinav.kumar@linux.dev,m:lumag@kernel.org,m:sean@poorly.run,m:marijn.suijten@somainline.org,m:airlied@gmail.com,m:simona@ffwll.ch,m:robin.clark@oss.qualcomm.com,m:neil.armstrong@linaro.org,m:linux-arm-msm@vger.kernel.org,m:freedreno@lists.freedesktop.org,m:linux-kernel@vger.kernel.org,s:lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[linux.dev,kernel.org,poorly.run,somainline.org,gmail.com,ffwll.ch,oss.qualcomm.com,linaro.org,vger.kernel.org,lists.freedesktop.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	ARC_NA(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[13];
	FORGED_SENDER(0.00)[dmitry.baryshkov@oss.qualcomm.com,dri-devel-bounces@lists.freedesktop.org];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	TAGGED_RCPT(0.00)[dri-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,oss.qualcomm.com:mid,oss.qualcomm.com:dkim,qualcomm.com:email,qualcomm.com:dkim]
X-Rspamd-Queue-Id: 97EE786816
X-Rspamd-Action: no action

On 26/01/2026 12:06, Jun Nie wrote:
> Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com> 于2026年1月22日周四 18:22写道：
>>
>> On Thu, Jan 22, 2026 at 02:03:25PM +0800, Jun Nie wrote:
>>> Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com> 于2026年1月21日周三 17:30写道：
>>>>
>>>> On Wed, Jan 21, 2026 at 04:01:51PM +0800, Jun Nie wrote:
>>>>> Currently, plane splitting and SSPP allocation occur during the plane
>>>>> check phase. Defer these operations until dpu_assign_plane_resources()
>>>>> is called from the CRTC side to ensure the topology information from
>>>>> the CRTC check is available.
>>>>
>>>> Why is it important? What is broken otherwise?
>>>
>>> I see. Thanks! Will add below lines in next version.
>>>
>>> By default, the plane check occurs before the CRTC check.
>>> Without topology information from the CRTC, plane splitting
>>> cannot be properly executed. Consequently, the SSPP
>>> engine starts without a valid memory address, which triggers
>>> an IOMMU warning.
>>
>> What is plane splitting? Write commit message for somebody who doesn't
>> exactly know what is going on.
> 
> Thanks for the suggestion! Any more revise is needed?

Sadly enough the text below is not a significant improvement.

> 
> Currently, splitting plane into SSPP rectangles the allocation occur
> during the plane check phase, so that a plane can be supported by
> multiple hardware pipe.

What does this mean? Without virtual planes in place, there are no 
multiple hardware pipes.

> While pipe topology is decided in CRTC check.

?? What does it mean here?

> By default, the plane check occurs before the CRTC check in DRM
> framework. Without topology information from the CRTC, plane splitting
> cannot be properly executed.

What does 'properly' mean here? How is it executed? What happens?

> Consequently, the SSPP engine starts
> without a valid memory address, which triggers IOMMU warning.

IOMMU faults. There are no "warnings".

> 
> Defer above plane operations until dpu_assign_plane_resources()
> is called from the CRTC side to ensure the topology information from
> the CRTC check is available.



-- 
With best wishes
Dmitry
