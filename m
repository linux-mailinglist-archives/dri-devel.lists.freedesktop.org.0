Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1CAE4B18023
	for <lists+dri-devel@lfdr.de>; Fri,  1 Aug 2025 12:31:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 47E8C10E150;
	Fri,  1 Aug 2025 10:30:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="JTfPhGUP";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0626510E150
 for <dri-devel@lists.freedesktop.org>; Fri,  1 Aug 2025 10:30:57 +0000 (UTC)
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57197AB3020633
 for <dri-devel@lists.freedesktop.org>; Fri, 1 Aug 2025 10:30:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 L84CyF+woWXvkwBzd7M9RuuiXRAGPXc2Q4DgUeAC+f8=; b=JTfPhGUPPA8j0Ovh
 zlYaGqbYQbcMEk+9sj9CeEoEZ8yVfvu1NvmEonIV4+m1eZtYr2geyQb6zadeS98c
 PfPg44biaWsvMGO4GFtG5lengPCT4tyr5FC18ejZI3u16akjFJ2iLIi6MAVnxJ1Z
 gp+ky7rZSxSSjUpL8jXQGASTZvJS4KNGCRyKyEOnacA6JT0xQraDWb1eywQYlt1m
 RQFCMtq5gt+dlRMsOhNgy01tIjI3iKl2YAuohmo8YKjLhXECwbRyXgtzdOR+hcJ3
 /r+huZ9FlAIBinJTpZ7L96oubmy1Z+rKKYd3VNb2n6hNx6jTcpkTUH2H6fND7fcg
 AeFhEw==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com
 [209.85.160.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 484p1aucgv-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Fri, 01 Aug 2025 10:30:56 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id
 d75a77b69052e-4ab55eb74bbso14163981cf.0
 for <dri-devel@lists.freedesktop.org>; Fri, 01 Aug 2025 03:30:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1754044256; x=1754649056;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=L84CyF+woWXvkwBzd7M9RuuiXRAGPXc2Q4DgUeAC+f8=;
 b=MXxSf+E9fuRWLKV591fWttJpUp5BLoNN3QgbjoJcRBqnH6qaEGoGP4urEMdyaZa3KL
 LjMFykytnBu9bS2VayyA2ypwxdoAsTvx34Qtcw+Z0M9imZlduqWjT2TzO6ZqoQcfxngM
 rvWdQaXm+4bh/MJ0RRdy2yyMgYfUhHK+o7UfrQ6TXCAuuQNVsZ4cQJs6+8j3g909FkBu
 l1mgvbAUvC/bLFKYhkDiFGVixigAtAeZSkrE0LsGel2Lyddu/+Eyvxfli/Yts1vpGE5o
 xy1TV8ILXWt6gS8uqRxOE5ch6qZMGigF4/5hT0TZyiGtQtJl1dDkn+Q1WcjhZVsk42Cf
 3c+g==
X-Forwarded-Encrypted: i=1;
 AJvYcCUdzYvx87MamN2mBQgW+6heA4EdIEJntH6KkryzQrIz/e4iKrT3q3WZRCWpzOb/g80HYG/cw3h7KVY=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzM61dTer4EevTd8r/fW+Qwjdrr+UZQUFVw2UfMBfatp63VucQg
 ACCQ9DNdqiTEMi0NSHVPB7ELpGnFGJXR/ee2jgI4I9dGoLyW54AJSRdV0v7llZOWM+0bbRqKgMV
 58NsJAxVXKBR3gEZBVSNniGzcZVj0gX5cXX5RwwEEQPjdKUKVXr7xXEDYveNzGGnr+Og2zaw=
X-Gm-Gg: ASbGncudUgc7y645GpiBV54CIDiZHzTPqHpuHmrLt3qL+UU8YCfAdXxe3ITw5DkBQPC
 idIFm//5QT1f69mCkXpLKAHGp7BC8032kDqSVcK2H7WrdNjO53cDs+7wlvtafJxYTM7eqj9JZd0
 NFUt881QRWCTEtJrFVWKzQpuuczRoFsdtljoFbK6fAcJ2w+Pf3hoVOJWHmYoQb+yr2/KgGceJ96
 bNkZIRJnH2NzV2lA/ri2T56ruiFmXyVIfAlecwjlCo1TRDwHeIjjWE6f03oH0Gg47BqusP8rOfd
 Fn377l+GFCKkEGmuljL+1maXrBFP2tUPiZB1Dk55S1hnFlddmKqCbY9bEUwotdt9pQyqvsgsFJk
 rKNLE3UtHbmGlyjC1KD8too7NnnotEmH2CpZT7yWUJdNQBKMMGkfQ
X-Received: by 2002:a05:622a:1921:b0:4ab:5b3a:5f14 with SMTP id
 d75a77b69052e-4aedb9584d0mr162698751cf.4.1754044255854; 
 Fri, 01 Aug 2025 03:30:55 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHJTrlqeDQwfKaCw8yyW7SIaGimL48nbTtFzI8FnF8q1lx/G/dFdELduNg51Bv5DRhilMLjzg==
X-Received: by 2002:a05:622a:1921:b0:4ab:5b3a:5f14 with SMTP id
 d75a77b69052e-4aedb9584d0mr162698231cf.4.1754044255332; 
 Fri, 01 Aug 2025 03:30:55 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-55b88ca314bsm532410e87.128.2025.08.01.03.30.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 01 Aug 2025 03:30:54 -0700 (PDT)
Date: Fri, 1 Aug 2025 13:30:52 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Andy Yan <andyshrk@163.com>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>,
 Simona Vetter <simona.vetter@ffwll.ch>, Andy Yan <andy.yan@rock-chips.com>,
 Intel Graphics <intel-gfx@lists.freedesktop.org>,
 DRI <dri-devel@lists.freedesktop.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: build warning after merge of the drm-misc tree
Message-ID: <cn3l445yzdhehsyyxurjn4x5stnyo34beogguupk7wsjqrloh5@d2berut7dn3l>
References: <20250716203115.6e02e50c@canb.auug.org.au>
 <20250801144354.0ac00f39@canb.auug.org.au>
 <7304e450.4ca8.198645108de.Coremail.andyshrk@163.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <7304e450.4ca8.198645108de.Coremail.andyshrk@163.com>
X-Proofpoint-ORIG-GUID: c-UbBFNFYr3VP3-_9J_QHEPCfX_dFHXK
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODAxMDA3NyBTYWx0ZWRfX6eqGxJhVZiQP
 8cL4qWYWOTGse0mNV6CGVD7ARz582MmxmIuz65Ky8bYcXBvZTHkcniUOE2uCdjERwSsTlUvcPPR
 aRKFBFc19w9w8L7pCyhj2LbgisKZUYOEGXM3WrCIOrLgcR8go9eAlp9PDtpfCSpQOOdN+GQ2SBI
 yscZ1Ay/gnSrdmsncoEZsHaXovNTl5M8eW0cH7aoRKj8nRPr/5FHM+kf7P8e0I/rx9pkCUtUQLf
 ZHx/qAcvyKiCl4rIJrq0pow0YUUm8X5i2MD5txr/f5Rbka5B3U3bNnj3EWUvTV6egMbaxaBHIG6
 6WpEsPa0dG461fNrH0EiseeDsGXncwwRyCSqveDNkkG45P2G5sWTyhHo3jCjqLjz29Gdzjbkj6m
 bydLqgk7D2azca3XXihLQYR3Xh5QNbOWixJwIMhDZD+52lnWl4fmvM1LRlVAvJ11WxrYlxiF
X-Proofpoint-GUID: c-UbBFNFYr3VP3-_9J_QHEPCfX_dFHXK
X-Authority-Analysis: v=2.4 cv=KtNN2XWN c=1 sm=1 tr=0 ts=688c9760 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=2OwXVqhp2XgA:10 a=VwQbUJbxAAAA:8 a=Byx-y9mGAAAA:8 a=rOUgymgbAAAA:8
 a=7bnOuvaNDU_t_1VFS9oA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=kacYvNCVWA4VmyqE58fU:22 a=MP9ZtiD8KjrkvI0BhSjB:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-01_03,2025-07-31_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 lowpriorityscore=0 suspectscore=0
 adultscore=0 mlxlogscore=999 bulkscore=0 spamscore=0 impostorscore=0
 mlxscore=0 malwarescore=0 phishscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2508010077
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

On Fri, Aug 01, 2025 at 02:28:09PM +0800, Andy Yan wrote:
> 
> Hello，
> 
> At 2025-08-01 12:43:54, "Stephen Rothwell" <sfr@canb.auug.org.au> wrote:
> >Hi all,
> >
> >On Wed, 16 Jul 2025 20:31:15 +1000 Stephen Rothwell <sfr@canb.auug.org.au> wrote:
> >>
> >> After merging the drm-misc tree, today's linux-next build (htmldocs)
> >> produced this warning:
> >> 
> >> drivers/gpu/drm/drm_bridge.c:1242: warning: Function parameter or struct member 'connector' not described in 'drm_bridge_detect'
> >> 
> >> Introduced by commit
> >> 
> >>   5d156a9c3d5e ("drm/bridge: Pass down connector to drm bridge detect hook")
> >
> >I am still seeing that warning.  That commit is now in Linus' tree.
> 
> 
> The fix is here：
> 
> https://lore.kernel.org/dri-devel/20250716125602.3166573-1-andyshrk@163.com/
> 
> Hope that a Maintainer can review and apply it.

I tried picking it up into the drm-misc-next-fixes branch, but I could
not do it: the offending commit is present in drm-misc-next-2025-07-17,
while drm-misc-next-fixes is based on drm-misc-next-2025-07-10.

-- 
With best wishes
Dmitry
