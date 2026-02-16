Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yKtqJrP6kmlx0gEAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Mon, 16 Feb 2026 12:08:35 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EBBFB142AD4
	for <lists+dri-devel@lfdr.de>; Mon, 16 Feb 2026 12:08:34 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 145FA10E03F;
	Mon, 16 Feb 2026 11:08:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="oiPYhh5T";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="P0uGOdp7";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AF20710E03F
 for <dri-devel@lists.freedesktop.org>; Mon, 16 Feb 2026 11:08:30 +0000 (UTC)
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 61G9r4HL2696782
 for <dri-devel@lists.freedesktop.org>; Mon, 16 Feb 2026 11:08:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 qQL+pFG63JDiXngr1sR9R3WtgDi2LDQphCbXmKzPr0c=; b=oiPYhh5TaJXW7iMj
 La0ivJN3nLt9RDP5Io4FGGH2GabPKg6RntoldgOleNB4F4BRKMRIhvFFnAJII68e
 eHTZ0sdKvEp4qhMXERv6m1pQkTimzUWYB3WjF8SBhz3ZjJItsj/oPpWlk8auEq9+
 0oTZ7Gnd0Merv3A/L9NU3ZJp/6yV5Fc/1drazGTZ0Xy+j9hIIQrKXyCjAxlJk968
 x+z+33XkRUYRHessQqhJNvJ4ULxoIEC//Pfu5q3QC5fgg2X/EPwUhpuxEe0riUXd
 2dlWucvXRoDlXQ2uaSv8hSHcd0K4zuubVJDwGE9jvcgSr5Ckw6oNtVKwSwCvR4AA
 gmOSYQ==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com
 [209.85.160.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cahtcm6f2-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Mon, 16 Feb 2026 11:08:30 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id
 d75a77b69052e-505e8451617so24754081cf.0
 for <dri-devel@lists.freedesktop.org>; Mon, 16 Feb 2026 03:08:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1771240109; x=1771844909;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=qQL+pFG63JDiXngr1sR9R3WtgDi2LDQphCbXmKzPr0c=;
 b=P0uGOdp7Mvglg6q+LFKLxXbQXsk0VfRmgLaOU1hixff573B4tjoi/7rLXCVQuN6TkV
 oppXdo8iZb+e39903d4oyR+Dn+1PqjWn50hdwyq2qZDoJRE62rsZJAIaHXzxu+y4feN/
 TW/75wmr3PSRl+Yz0f6uxMl2t71efH1Q9qd1Pk/QrzjPRHKism59oCVZeovi75nb5WPp
 0ip7T6bZ92bXA4QP7/eKoUArBl/M60y/E4M3GC3YtpALoBQyMPjX7DYuWahLWtPB7Aiq
 9jttdkg6Q3emDK0enNwBHooIi4tQQkX+3XWoWlmCVw5Nct/5Z5yjMTyvMMVgOo+HjdIA
 9TRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1771240109; x=1771844909;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=qQL+pFG63JDiXngr1sR9R3WtgDi2LDQphCbXmKzPr0c=;
 b=lgtkWoGA92qTwlE9LU3ja1pQTtEJvEnFIqCLpDWqRyCsX5INqI7JZmx/MNTCGHc13g
 5PuJQqbaURyiVrIioElqM9JoG6orAaIl/MLIKRJxJO0/1Ar52vYcDX2P56DrR6xOMy92
 DVM9ZseEEhqMMu4T5q8LeKrscrZFCPIm87tutrOvPDfZwTKpRzVGU5xqM+vFEh3egwZD
 d8pOD2JIhFFfVeHD9iPyAzQx4ti2j2p0TspFdMdkN0VodskGyVhcZaNS9/oD15fqC2v4
 gLi9lz+/ralFAtWV2QIp4l5M/NXJbe/ufBkyi3diL00pSppwEP6I0O4kxBGTI1n6hBNh
 5sUg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUIiKMndgWMGK74E6HU6AUdoMSbq9bjtYYS9lMQFzan7W4NdtUam+QayH2zXNYoucIMS8py+W1RLSs=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yy7N/sd+gjiwj62eZukndZ8llSnyb5LX51JdeK7stg735mAuKO3
 HnraKl/0ihlI9ezSSjLLQUEos1bCRJcLidWDULcGDZXCRS/SUnlrAPypz2S0aML9r5CY4LxvR73
 V9mNZf0C7SmQB0nvKRFfM0WxzmbZ0DnA+CGpF9LOCdowK9CJgJtAKHXRsIbQIPeO51bkhTy8=
X-Gm-Gg: AZuq6aJc/dLOeZkqwxzlf+FwT7YMdNJ/wOqWplIDeRaGb/fwGh5Ldi3YLLMFRgPmUPD
 3j4uxfvhwTNoeL83B+TlOLPyAUKGu/QlD90XPpiuyYfo9ge09oAsSdvZYXiSenbtn66R4uZnI89
 UE3Qgi7A1JcpxQN4d7toK+etSAmKhmgQNbzmiVsPGgiE+e+BmONiosxZviTSCNnV+YnM+J9lVlF
 VUzhnoKPgSMGma/5NcviiPYfL/2cpxtQU8+CgoJcgP73yLpfddcCACoSEyjfdCPvxY3Fm7w493N
 R9nlmtFIc58rW5d75VL+0m7SvoCMLzNrx4/OVeCCXVp0cp3DdFAPdrXWKQelYhp3nn6MDbgb90q
 CJN5zB4y+ruj+9Y01GV+Hy4/+/J0RYHqkMQqg6fZehNeogiXov+CLSNTTM/XB8ZA1Spyy9C9JGN
 3PLI0=
X-Received: by 2002:ac8:5ccb:0:b0:506:bb3d:384c with SMTP id
 d75a77b69052e-506bb3d4c96mr67700761cf.10.1771240108718; 
 Mon, 16 Feb 2026 03:08:28 -0800 (PST)
X-Received: by 2002:ac8:5ccb:0:b0:506:bb3d:384c with SMTP id
 d75a77b69052e-506bb3d4c96mr67700581cf.10.1771240108211; 
 Mon, 16 Feb 2026 03:08:28 -0800 (PST)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl.
 [78.88.45.245]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-65bad3e39ebsm1793360a12.18.2026.02.16.03.08.25
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 16 Feb 2026 03:08:27 -0800 (PST)
Message-ID: <1e7adc39-8e85-4c59-a47c-7850f6c53e70@oss.qualcomm.com>
Date: Mon, 16 Feb 2026 12:08:24 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 2/4] misc: fastrpc: Replace hardcoded ctxid mask with
 GENMASK
To: kernel test robot <lkp@intel.com>,
 Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>, srini@kernel.org,
 linux-arm-msm@vger.kernel.org
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
 gregkh@linuxfoundation.org, quic_bkumar@quicinc.com,
 linux-kernel@vger.kernel.org, quic_chennak@quicinc.com,
 dri-devel@lists.freedesktop.org, arnd@arndb.de,
 dmitry.baryshkov@oss.qualcomm.com
References: <20260215182136.3995111-3-ekansh.gupta@oss.qualcomm.com>
 <202602161009.M2K52X34-lkp@intel.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <202602161009.M2K52X34-lkp@intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjE2MDA5NCBTYWx0ZWRfX4nQ4R9/i6xrf
 +ViDzkHmr5Mej1C+adnbvgnpqgOhxeUOH0as26QDCrpEjS/HYNbw0OVGhfEbn6QkVQx1cdfR5ej
 5wfmPKzKlT0npVpfsxgDSsRXMiXV9VUqtgtSgmnM0LXVhSp1+3k4D6NIyvpNQ+UpeVRuNiMA9Sd
 QZNUyTISidmie2qM2A6HXAWrExY/3in2ObQy2wBuAburvN474Y1q/dSTK3hFsBk1gf8XtuQGEVk
 jdCJLbBzHDQxmZ1fDz4aMWQcfkscOmD47e+/SY/gWaI0fFbp4zP9Ec8iQz8RT40RP0HN8Qt+OYp
 EPtLx7RYM+WTpTyIpQM+zRL0cXerfkeLY5dhp2ZpmOQ8Ka370dOhXVeY5MQVPv3Tji4xhLvx1pM
 cHNh2/Je3cp/o0rtYS3PgwZeIq/qzKaA6jj4jz28O7Yr40AlAHSW229DTzg57YtbwlQ+cUohGbf
 QlPy3ElgFX640xuBGjw==
X-Proofpoint-ORIG-GUID: 0Ly4WZ6kNf4arZEf0HMIfTl-BqRjhOQM
X-Authority-Analysis: v=2.4 cv=DJOCIiNb c=1 sm=1 tr=0 ts=6992faae cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Mpw57Om8IfrbqaoTuvik:22 a=GgsMoib0sEa3-_RKJdDe:22
 a=anyJmfQTAAAA:8 a=NEAV23lmAAAA:8 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=i3X5FwGiAAAA:8 a=QyXUC8HyAAAA:8 a=JNKdrcoTLt_OEecmFUQA:9 a=QEXdDO2ut3YA:10
 a=uxP6HrT_eTzRwkO_Te1X:22 a=mmqRlSCDY2ywfjPLJ4af:22
X-Proofpoint-GUID: 0Ly4WZ6kNf4arZEf0HMIfTl-BqRjhOQM
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-16_04,2026-02-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 lowpriorityscore=0 adultscore=0 priorityscore=1501
 impostorscore=0 malwarescore=0 phishscore=0 bulkscore=0 spamscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2601150000
 definitions=main-2602160094
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
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MAILLIST(-0.20)[mailman];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:lkp@intel.com,m:ekansh.gupta@oss.qualcomm.com,m:srini@kernel.org,m:linux-arm-msm@vger.kernel.org,m:llvm@lists.linux.dev,m:oe-kbuild-all@lists.linux.dev,m:gregkh@linuxfoundation.org,m:quic_bkumar@quicinc.com,m:linux-kernel@vger.kernel.org,m:quic_chennak@quicinc.com,m:arnd@arndb.de,m:dmitry.baryshkov@oss.qualcomm.com,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	ARC_NA(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[13];
	FORGED_SENDER(0.00)[konrad.dybcio@oss.qualcomm.com,dri-devel-bounces@lists.freedesktop.org];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	TO_DN_SOME(0.00)[];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,01.org:url,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,oss.qualcomm.com:mid,oss.qualcomm.com:dkim,intel.com:email]
X-Rspamd-Queue-Id: EBBFB142AD4
X-Rspamd-Action: no action

On 2/16/26 3:39 AM, kernel test robot wrote:
> Hi Ekansh,
> 
> kernel test robot noticed the following build errors:
> 
> [auto build test ERROR on char-misc/char-misc-testing]
> [also build test ERROR on char-misc/char-misc-next char-misc/char-misc-linus linus/master v6.19 next-20260213]
> [If your patch is applied to the wrong git tree, kindly drop us a note.
> And when submitting patch, we suggest to use '--base' as documented in
> https://git-scm.com/docs/git-format-patch#_base_tree_information]
> 
> url:    https://github.com/intel-lab-lkp/linux/commits/Ekansh-Gupta/misc-fastrpc-Move-fdlist-to-invoke-context-structure/20260216-022305
> base:   char-misc/char-misc-testing
> patch link:    https://lore.kernel.org/r/20260215182136.3995111-3-ekansh.gupta%40oss.qualcomm.com
> patch subject: [PATCH v6 2/4] misc: fastrpc: Replace hardcoded ctxid mask with GENMASK
> config: hexagon-randconfig-001-20260216 (https://download.01.org/0day-ci/archive/20260216/202602161009.M2K52X34-lkp@intel.com/config)
> compiler: clang version 23.0.0git (https://github.com/llvm/llvm-project e86750b29fa0ff207cd43213d66dabe565417638)
> reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260216/202602161009.M2K52X34-lkp@intel.com/reproduce)
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202602161009.M2K52X34-lkp@intel.com/
> 
> All errors (new ones prefixed by >>):
> 
>>> drivers/misc/fastrpc.c:518:29: error: call to undeclared function 'FIELD_GET'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
>      518 |         idr_remove(&cctx->ctx_idr, FIELD_GET(FASTRPC_CTXID_MASK, ctx->ctxid));


#include <linux/bitops.h>

Konrad
