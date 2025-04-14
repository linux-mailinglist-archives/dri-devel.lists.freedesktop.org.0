Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4920BA88057
	for <lists+dri-devel@lfdr.de>; Mon, 14 Apr 2025 14:28:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8D34610E52A;
	Mon, 14 Apr 2025 12:28:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="Yd+9BpfE";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 55CDE10E52A
 for <dri-devel@lists.freedesktop.org>; Mon, 14 Apr 2025 12:28:44 +0000 (UTC)
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53E99qha016550
 for <dri-devel@lists.freedesktop.org>; Mon, 14 Apr 2025 12:28:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=pcD1hnXGwP4oWvtyhTXiHED+
 7VwXoSi69a6mb6yqA1g=; b=Yd+9BpfEuiDZ4o/Ei13vwKatWPUgywArkggTGnCI
 aUqEK9J9iWqvBpLlxSiHIiQQq5PJg/vPsNHry2jB3eKMYj/wSY2m16gPSoy6SrAn
 hNPTp5iVvDB9KiH4NXikB+J1aiQk9I7pOHGl2jCV12mTCbyDnL1rr41hr1+9h3wV
 RUNUCh1oBMbfacU+FgGhTNHxEs22+Uql/ZBoqUJLm5/Kr48jRxmNQe2uG14YoYFB
 4DL8er5NgTCnE8LEpuHwQBBArM49t9h30D13KxV509+j7X7Pw5FjpTKg/t0GRPUt
 NlSf8BfEFiNA3jePsKh4MUpwx3yn1v7r2WCvwJUE01XksA==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45yf69mk0x-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Mon, 14 Apr 2025 12:28:43 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id
 af79cd13be357-7c53e316734so734900385a.2
 for <dri-devel@lists.freedesktop.org>; Mon, 14 Apr 2025 05:28:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1744633722; x=1745238522;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=pcD1hnXGwP4oWvtyhTXiHED+7VwXoSi69a6mb6yqA1g=;
 b=qlqgbfVdE7FwLffwARPUyCtchdfHE1v+s8RLqTON7WmoBKgGuU4iSFSOLpZrZrHqa2
 nHwVCzhoHY5+kOJgeLnVmib35SuQNwnMa9O3xisVewsln6/qgtxjTwofPS4KSvOuoEOO
 wz34YImj9sc6uV6BCZhaBPd0cVQV7ju+jMKqROU6bmBrWfdJ06QXWCdxFNt5L04r4PNA
 5BLdm6UQD+13xBfAhaHsxulgLj+K1E3pv6NC5SwwXYIxQYZ9f9nSSZEg8YUoaDT9r9sB
 vaTY0EqPv1CVuXKbRBoob9XqbaoxIIDsqWJr2peOG/7As0uI0FDORmtR0IUQu4PoAy1w
 B9gA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWBfFTattmwLZ2M2CpwjhKHBKs0AV8Ma4VFSYo6cUhN6hbr9za2b/ikr3Y0XPVBFQW2k0nYzOVLBqE=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxwFKGKldlvQYdATlPJvMaiqt/S2qnI9qzalFbGMvQ98sXSeFIR
 zgBpZqxle6poQt2q+FIWOSjQErgqNIvh1KNrA0Di608zcm36eOeiF/USoqN/uZaHn3ehIXt8Cuk
 9V6qARx13KVugUahnr8iz3PEzVhRSlnsDHqNP2tmEssUwTWRJhEjQq4+f2IVMcDcGFiffjpPc/m
 /KDvop
X-Gm-Gg: ASbGncuBInUXruQ5MYZnJ1EU7aDyVJIWrQZgQ4CREPdkp80NWIz0EogqVmYKCZUxIBd
 n0j2Y4/j4idJ73mSwQJXM7D6REcmKNKWubd+FK+3L5dzWezVYMcfH7PwhlxXbSE45KsY4s00MeX
 Rk/Wji+xnNqZyowpi9CPG7CaYEIJUhkPFmxAsSiph0c2OV+LcNcl7Pmer9/Fz2tyYBomxJy9tJi
 k/BTTJTSE7ppUPouBS0lsoQaR/2revtJ9rHJc0FnkHfiFCnEID4K6/8xdq72cMb690JvCyHPTRR
 nbRYjvlQpOWtFlG68x2rWIMp3mkxc1wnK3S/AkY5AoBUKQmqvHobulRJzkPFyvw1mYSzP1CoxtQ
 =
X-Received: by 2002:a05:620a:178d:b0:7c5:3c62:804c with SMTP id
 af79cd13be357-7c7af10c99cmr1793639185a.21.1744633722086; 
 Mon, 14 Apr 2025 05:28:42 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFsetSET612d6fMhQCBXpRJnTz65qWucBdrgE0bNMyx8ZlJtaAzw/28Nhs4mXaotD4AP0m9Gg==
X-Received: by 2002:a05:620a:178d:b0:7c5:3c62:804c with SMTP id
 af79cd13be357-7c7af10c99cmr1793633485a.21.1744633721593; 
 Mon, 14 Apr 2025 05:28:41 -0700 (PDT)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-54d3d238b8bsm1084415e87.88.2025.04.14.05.28.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 14 Apr 2025 05:28:40 -0700 (PDT)
Date: Mon, 14 Apr 2025 15:28:38 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Konrad Dybcio <konradybcio@kernel.org>,
 Bjorn Andersson <andersson@kernel.org>, Kees Cook <kees@kernel.org>,
 "Gustavo A. R. Silva" <gustavoars@kernel.org>,
 Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 linux-hardening@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org
Subject: Re: [PATCH 0/4] Retrieve information about DDR from SMEM
Message-ID: <qdip4rtk2zusxkdlui4ujnybsh7jfqk25tazx477tueytp6cbm@dom2fduk2r6z>
References: <20250409-topic-smem_dramc-v1-0-94d505cd5593@oss.qualcomm.com>
 <685e784c-3f36-4cd1-9c34-7f98c64d50f2@oss.qualcomm.com>
 <0bec3e62-0753-4c3d-abe1-1a43356afc80@oss.qualcomm.com>
 <e7bd2840-dd93-40dd-a1bc-4cd606a34b44@oss.qualcomm.com>
 <CAO9ioeUeNeSxz7ADZ-BbJbhEKkszVS+SmbqaZCgTpL=csak=hg@mail.gmail.com>
 <b04464b6-2ad9-4866-88e9-437e96645726@oss.qualcomm.com>
 <sgjporlde6bgcp2mhr3r5c6wj3a3u37s5nlrrokbutsyizixod@7shpt55muqki>
 <4e265348-3466-49fb-82e2-255205052d1e@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <4e265348-3466-49fb-82e2-255205052d1e@oss.qualcomm.com>
X-Proofpoint-GUID: TSfYwNOLoVFLqJNMoZ1Oa8KWV26tqsgB
X-Authority-Analysis: v=2.4 cv=JNc7s9Kb c=1 sm=1 tr=0 ts=67fcff7b cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=XR8D0OoHHMoA:10 a=EUspDBNiAAAA:8 a=MwWKvEgEnNFHFowGc98A:9 a=CjuIK1q_8ugA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-ORIG-GUID: TSfYwNOLoVFLqJNMoZ1Oa8KWV26tqsgB
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-14_04,2025-04-10_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 malwarescore=0
 suspectscore=0 mlxlogscore=553 lowpriorityscore=0 bulkscore=0
 impostorscore=0 clxscore=1015 phishscore=0 adultscore=0 priorityscore=1501
 spamscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504140091
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

On Fri, Apr 11, 2025 at 12:52:32PM +0200, Konrad Dybcio wrote:
> On 4/11/25 12:50 PM, Dmitry Baryshkov wrote:
> > On Fri, Apr 11, 2025 at 12:03:03PM +0200, Konrad Dybcio wrote:
> >> On 4/11/25 11:57 AM, Dmitry Baryshkov wrote:
> >>> On Fri, 11 Apr 2025 at 12:49, Konrad Dybcio
> >>> <konrad.dybcio@oss.qualcomm.com> wrote:
> >>>>
> >>>> On 4/9/25 5:49 PM, Konrad Dybcio wrote:
> >>>>> On 4/9/25 5:44 PM, Dmitry Baryshkov wrote:
> >>>>>> On 09/04/2025 17:47, Konrad Dybcio wrote:
> >>>>>>> SMEM allows the OS to retrieve information about the DDR memory.
> >>>>>>> Among that information, is a semi-magic value called 'HBB', or Highest
> >>>>>>> Bank address Bit, which multimedia drivers (for hardware like Adreno
> >>>>>>> and MDSS) must retrieve in order to program the IP blocks correctly.
> >>>>>>>
> >>>>>>> This series introduces an API to retrieve that value, uses it in the
> >>>>>>> aforementioned programming sequences and exposes available DDR
> >>>>>>> frequencies in debugfs (to e.g. pass to aoss_qmp debugfs). More
> >>>>>>> information can be exposed in the future, as needed.
> >>>>>>
> >>>>>> I know that for some platforms HBB differs between GPU and DPU (as it's being programmed currently). Is there a way to check, which values are we going to program:
> >>>>>>
> >>>>>> - SM6115, SM6350, SM6375 (13 vs 14)
> >>>>
> >>>> SM6350 has INFO_V3
> >>>> SM6375 has INFO_V3_WITH_14_FREQS
> >>>
> >>> I'm not completely sure what you mean here. I pointed out that these
> >>> platforms disagreed upon the HBB value between the DPU/msm_mdss.c and
> >>> a6xx_gpu.c.
> >>> In some cases (a610/SM6115 and a619/SM6350) that was intentional to
> >>> fix screen corruption issues. I don't remember if it was the case for
> >>> QCM2290 or not.
> >>
> >> As I said below, I couldn't get a good answer yet, as the magic value
> >> is not provided explicitly and I'll hopefully be able to derive it from
> >> the available data
> > 
> > I see...
> > Is this data even supposed to be poked into? The foo_WITH_bar types
> > doesn't sound like a very stable API.
> 
> Yeah, it was designed with both the producer and consumer being part
> of a single codebase, always having the data structures in sync..

I feel somewhat worried about parsing those structures then. But... the
only viable alternative is to have an in-kernel list of possible
platform configurations and parse the /memory@foo/ddr_device_type
property.

-- 
With best wishes
Dmitry
