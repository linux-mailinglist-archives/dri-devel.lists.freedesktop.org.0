Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YEbeJZ5PlGktCQIAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Tue, 17 Feb 2026 12:23:10 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C0D814B4AE
	for <lists+dri-devel@lfdr.de>; Tue, 17 Feb 2026 12:23:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 23A5210E0FA;
	Tue, 17 Feb 2026 11:23:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="IsnF3Gnn";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="GSBToLQ1";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7FB1910E21C
 for <dri-devel@lists.freedesktop.org>; Tue, 17 Feb 2026 11:23:06 +0000 (UTC)
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 61H9GsOL1601350
 for <dri-devel@lists.freedesktop.org>; Tue, 17 Feb 2026 11:23:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 CLaDJ4loHiaVAWlFSAgg1xguJUSqstbP17hVYmDKCYs=; b=IsnF3Gnn5ye/iHcw
 Ybegrhzv4Dn8vOTIoswtCGxJln3J7pFCnQuBWp3mLmeR5KTtDBFLQRMuSCYpExW0
 jUwYtfKlIaLiUrNnH1nx74+sGAj0/wjvZGrNWpDO5PyPkClIWx6nET5WGqjolTzL
 lwjqV20oMJtnyuImRrWOPv03M0iTpp8F0qraTl/PlytuZQ3bCnMIQrkLIeahBKOU
 4PK3QwGS7kmlwExRGS6mo99T1E139RX//TCmFGuCuKNl0H8xgpwbCoBwKgEYS+wR
 N42BQaJOB0LlmT7wzNY//GhGVKgYzTlPi6oTFwNey00FKrUqLxqmMjQqTXdb+CfV
 pKguzQ==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com
 [209.85.219.69])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cc6tma0rs-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Tue, 17 Feb 2026 11:23:05 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id
 6a1803df08f44-89496f5086dso34058046d6.3
 for <dri-devel@lists.freedesktop.org>; Tue, 17 Feb 2026 03:23:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1771327385; x=1771932185;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=CLaDJ4loHiaVAWlFSAgg1xguJUSqstbP17hVYmDKCYs=;
 b=GSBToLQ16hok8hACvBke6vgo9gTXYoHJ0mAc7bq/JVk3TfnRe7zUXyxjZoU3iCjbpy
 xfLor5n43y4myaH09NCsFRD0v73P+9Hngg0oEcLdsaOcVcBG+vI0CAJjpdmuGkvOe6iD
 7H5vAtPpGEo36jXGHT1uTTjXpAyl55+RW1u3nl2QhidW8EqdBKmwpFf7ASo+QGvT98Qw
 uFMuoEZHBA0tNLC6WBDXduI8uqWoD9J6kKVPhz9HnsCp/V5stlnJl+/DX7fikrl4bFHb
 aXZZZcpyoOrJMqtkahyYyXqB9V5CHfB+BjCD3fBN2yHx1Q7a0tha77PttaOqAXGeTub1
 uDrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1771327385; x=1771932185;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=CLaDJ4loHiaVAWlFSAgg1xguJUSqstbP17hVYmDKCYs=;
 b=THg7/MnfeALg8Pai6rZWDYU7tfVng03mSe8mPBJ9HswMJobInigFFs8FOGdZZC5PQx
 ZbKwqBlnPRsx/9gA6pHgoJPbKW3jkb94288DErkfi/4ZanKOz0oQRuktvMUXCNaaOz3f
 FQ9MFJgUdXSa52GEW9NZB4NuUaXflN1VAsxjP2lvM0rspoWr7CsajxS5WxRwGsIgmsbZ
 wN486D+CNjIbb+Lqck8+QR3Vk0/t3K9FN4KfIQOg1LbGjsFa77gQ8dfvOrxDUjjeU1fX
 HTFsYp2fRLOa8uRSBrA3DHCQ9jnkwlKsHswjUJzoKm9blNBamml/5yvevNmyJIrml/ZH
 eqPQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXPCkvuzCTAUBEW9jLmWA+46uvdKfmZTzWmVmcB7zy0ic54HU2ZL+1/Vz3Du311BimBpr6PuNJkA6M=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyqSI6j9Pj6qWphWZKbLvOJsR5Jri13yH2tWRkrYA8cnT+v23r4
 JQjtEizXHMu/V5QiTpX8P5kdeFsSNqhdip659bSJ9/Ckio6GSA1OqK4n6DLuXlCsINAmT05Y43T
 2IlzGtnwn6dniE1jtCn7DBJCABT+yh6xXs0xibvdqqTcRkNmUPVFXhgkjBJ3aLcq9LAnIdnQ=
X-Gm-Gg: AZuq6aICfEWcNV0R03S4PxhQCsbdrj7yLcT/hFOFL5fvEN/8UzI9p53B4B65vJBGqkG
 QnRXq8eDing/Yn0srsaM12yr5Tv3kUCLNfxYiNl6znVdX8Gurzt2k2LCKTrbS2wip6w8eIxuFKL
 ax0xmiE4ah0FJTeJoy/XL0QZYEJNclbOXztkBKiZ2UIXKqvajhL6sBr89TqfjnVdh2elHvHg5zL
 sWBHFD+0eOpbqKn1G/gjvxTuVQrxu9EmkAhmKVy+jTc91nWwWPDV8AHF2oznpe+nPxa03aHTRbE
 OuWwniepygtS6YgLHt+EZBFPXTp/IJef/niKnsa2Xqc/OUjUUGR6S5G20QTf7GR13FUPONMuZfd
 eWncCF5ILl8Nr6fmH/DalZ87IzP9vaRfR3see+4Uz4p9jHDtvUuGswcnDi4cNbudxpRg6LX8tfI
 vzU3Y=
X-Received: by 2002:a05:620a:d8a:b0:8b2:e346:de7b with SMTP id
 af79cd13be357-8cb40820215mr1409355785a.1.1771327384729; 
 Tue, 17 Feb 2026 03:23:04 -0800 (PST)
X-Received: by 2002:a05:620a:d8a:b0:8b2:e346:de7b with SMTP id
 af79cd13be357-8cb40820215mr1409354085a.1.1771327384207; 
 Tue, 17 Feb 2026 03:23:04 -0800 (PST)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl.
 [78.88.45.245]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b8fc73f102dsm336964566b.26.2026.02.17.03.23.02
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 17 Feb 2026 03:23:03 -0800 (PST)
Message-ID: <c99beabf-9841-44cd-9450-2f339d1d5c41@oss.qualcomm.com>
Date: Tue, 17 Feb 2026 12:23:01 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 0/3] Retrieve information about DDR from SMEM
To: Connor Abbott <cwabbott0@gmail.com>, rob.clark@oss.qualcomm.com
Cc: Konrad Dybcio <konradybcio@kernel.org>,
 Bjorn Andersson <andersson@kernel.org>, Kees Cook <kees@kernel.org>,
 "Gustavo A. R. Silva" <gustavoars@kernel.org>,
 Sean Paul <sean@poorly.run>, Akhil P Oommen <akhilpo@oss.qualcomm.com>,
 Dmitry Baryshkov <lumag@kernel.org>, Abhinav Kumar
 <abhinav.kumar@linux.dev>, Jessica Zhang <jesszhan0024@gmail.com>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 linux-hardening@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org
References: <20260108-topic-smem_dramc-v3-0-6b64df58a017@oss.qualcomm.com>
 <CACu1E7EDmLPhUFyouD=W6n+U7=oo7+6PY0Gz9=3pVpT2Qu9Z6w@mail.gmail.com>
 <CACSVV00iiAXGOqV2HZs9KREoqatE0eNBZjFH9hSFMmNaX3_RXw@mail.gmail.com>
 <CACu1E7Fh=GbLTiedj6OqtUxWiZbCVcKmsEzV6FYan5G6r1uyUA@mail.gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <CACu1E7Fh=GbLTiedj6OqtUxWiZbCVcKmsEzV6FYan5G6r1uyUA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: 8PtxacL99_GjG8xzlqx1tJe0p_MehGyM
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjE3MDA5NSBTYWx0ZWRfX9RlpwoHX/Bik
 XE3NNa6SKI6QApFFYw3kdeRfqOEWfTYk89fSrvWGor+0/B15MXTmIl6IC6oZVkroRVA3gR/8JPk
 eMe5cQzy6WXfhYDiNsXC1rYrF8ejvLIDLTAkwl8dtqMjGlPkdlD5AqRah8uldOo70VKHUTD9Juc
 3tK337MWzEeejjAsMm+UvonsKfF20cOVqthIxA8AFg2xQJ33gNbS+IVf/bcfVowdis5CY/XW4sw
 9vTO9bOD6E2MgomgoG0AP6u4PS95hg+CFFMITtAYt76WBB0UD/r22h2WQX2923xbsIeTiynZa5O
 2C4hCFw0GN40Ja3xiOJI/6Iq6/NFwe8SD6Z/XvqXKIHdD2/oC5B1zJKWrj6oAupAhhPNQwsFp0C
 AHZ5toy6f8vjP3iEjlcSr1+RBZLfFYsT4pAwBSWWDtmFfy+if3izkGrizc1tOTiL4uymbTarND4
 dT5DjX8gyI8IdAU6YNw==
X-Proofpoint-ORIG-GUID: 8PtxacL99_GjG8xzlqx1tJe0p_MehGyM
X-Authority-Analysis: v=2.4 cv=IOoPywvG c=1 sm=1 tr=0 ts=69944f99 cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Mpw57Om8IfrbqaoTuvik:22 a=GgsMoib0sEa3-_RKJdDe:22
 a=EUspDBNiAAAA:8 a=pGLkceISAAAA:8 a=VwQbUJbxAAAA:8 a=cGCGxpJvRk8pEJ-QcToA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=OIgjcC2v60KrkQgK7BGD:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-17_01,2026-02-16_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 lowpriorityscore=0 adultscore=0 clxscore=1015
 suspectscore=0 malwarescore=0 bulkscore=0 phishscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2602170095
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
	FORGED_RECIPIENTS(0.00)[m:cwabbott0@gmail.com,m:rob.clark@oss.qualcomm.com,m:konradybcio@kernel.org,m:andersson@kernel.org,m:kees@kernel.org,m:gustavoars@kernel.org,m:sean@poorly.run,m:akhilpo@oss.qualcomm.com,m:lumag@kernel.org,m:abhinav.kumar@linux.dev,m:jesszhan0024@gmail.com,m:marijn.suijten@somainline.org,m:airlied@gmail.com,m:simona@ffwll.ch,m:linux-kernel@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-hardening@vger.kernel.org,m:freedreno@lists.freedesktop.org,s:lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[kernel.org,poorly.run,oss.qualcomm.com,linux.dev,gmail.com,somainline.org,ffwll.ch,vger.kernel.org,lists.freedesktop.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[konrad.dybcio@oss.qualcomm.com,dri-devel-bounces@lists.freedesktop.org];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_TO(0.00)[gmail.com,oss.qualcomm.com];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	ARC_NA(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	RCPT_COUNT_TWELVE(0.00)[19];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	TO_DN_SOME(0.00)[]
X-Rspamd-Queue-Id: 4C0D814B4AE
X-Rspamd-Action: no action

On 1/9/26 10:03 PM, Connor Abbott wrote:
> On Fri, Jan 9, 2026 at 3:41 PM Rob Clark <rob.clark@oss.qualcomm.com> wrote:
>>
>> On Fri, Jan 9, 2026 at 11:11 AM Connor Abbott <cwabbott0@gmail.com> wrote:
>>>
>>> On Thu, Jan 8, 2026 at 9:22 AM Konrad Dybcio <konradybcio@kernel.org> wrote:
>>>>
>>>> SMEM allows the OS to retrieve information about the DDR memory.
>>>> Among that information, is a semi-magic value called 'HBB', or Highest
>>>> Bank address Bit, which multimedia drivers (for hardware like Adreno
>>>> and MDSS) must retrieve in order to program the IP blocks correctly.
>>>>
>>>> This series introduces an API to retrieve that value, uses it in the
>>>> aforementioned programming sequences and exposes available DDR
>>>> frequencies in debugfs (to e.g. pass to aoss_qmp debugfs). More
>>>> information can be exposed in the future, as needed.
>>>>
>>>> Patch 3 should really be merged after 1&2
>>>
>>> No. The HBB value currently returned by the bootloader is *not* always
>>> the same as what we use currently, because some SoCs (like SM8250)
>>> with the same DT ship with multiple different DRAM configurations and
>>> we've been using a sub-optimal value the whole time. After all, that's
>>> the whole point of using the bootloader value. But patches 1&2 will
>>> only make the DPU use the bootloader value for HBB, not the GPU. So on
>>> one of the affected SoCs, it will introduce a mismatch. You can't
>>> change anything until the GPU side uses the new ubwc config as its
>>> source of truth.
>>
>> Hmm, how is this even working today if DPU is using HBB from the
>> global table but GPU is not?  Are we just getting lucky with
>> compositors that don't know about modifiers and end up scanning out
>> linear?
> 
> It works out as well as it's always worked out, i.e. we try to make
> GPU and DPU config match and pray that we didn't mess it up. At least
> now we'll get a warning when they don't match.
> 
>>
>> We do log warnings when the global ubwc config does not match the
>> "fixed up" config.. google search for those msgs doesn't seem to turn
>> up anything other than the patch which introduced them.  Idk if that
>> is conclusive in any way, but I hope that means we could just delete
>> the fixup code on the GPU side.  I suppose we could add:
>>
>>        *cfg = *common_cfg;
>>
>> after the warning as a first step.  That would maybe get some bug
>> reports along with enough details in dmesg?
> 
> Yes, the plan was always to delete the fixup code in the GPU config.
> And even that first step would be enough to prevent regressions when
> switching to the bootloader HBB value.
> 
> There is a problem in that ubwc_swizzle isn't as well tested. Older
> parts supporting UBWC 1.0-3.0 partially or entirely ignore
> ubwc_swizzle, because it wasn't configurable back then, but we rely on
> it being set correctly in Mesa for VK_EXT_host_image_copy and sparse
> textures. So if ubwc_swizzle is incorrect you probably wouldn't
> notice, until you hit the HIC codepath in zink or some game using
> sparse textures. I think we fixed up all the cases where it was
> incorrectly set to 0x1 instead of 0x7, but it would be worth it to
> check again.

Just to double-check, is your expectation to just double-check the kernel
settings, or would that require some intervention on the mesa side too?

Konrad
