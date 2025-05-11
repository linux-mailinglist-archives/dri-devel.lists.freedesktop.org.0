Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B16FAB2B84
	for <lists+dri-devel@lfdr.de>; Sun, 11 May 2025 23:13:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A28C110E2A7;
	Sun, 11 May 2025 21:13:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="gD/ClAWw";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F245C10E2A7
 for <dri-devel@lists.freedesktop.org>; Sun, 11 May 2025 21:13:47 +0000 (UTC)
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54BLDNat007910
 for <dri-devel@lists.freedesktop.org>; Sun, 11 May 2025 21:13:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 8XaiI9UiHHaa4h3ZDY6Ph8BoQyfXmu1/32HzoVTmShU=; b=gD/ClAWwC8+97Kue
 esIEUPrEaCCedZKvJTtKXL6w/v9zYpJtK5epmz7C98ktOicAJF0LtQhPn1jwgNCU
 4wTeMcnMb9ampIu44n3xOHwpZQwGwG7q7SBoAxx4fxXpUJ9oRPes3T7xTZOciqaJ
 /85E6M2pd12pWulAStVeW6x91p1GMeG7oaI9dNEvHz35zisHsP0QJ92i26VJE+Lc
 lTA6nWudh6ufCrdVwhLyEyZ430mxt0YQTSbw/H4aiR5FGWMUR0dvDlemI8G+D8s3
 +Z/GHUcFabZMt9WXPKTB5HxhLliOQJtSxtKl/T7THr5D++z3RPtPauIlNlQe3Bpu
 rt8gfQ==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46j03bacfw-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Sun, 11 May 2025 21:13:46 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id
 af79cd13be357-7cabd21579eso330806285a.3
 for <dri-devel@lists.freedesktop.org>; Sun, 11 May 2025 14:13:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1746998025; x=1747602825;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=8XaiI9UiHHaa4h3ZDY6Ph8BoQyfXmu1/32HzoVTmShU=;
 b=eJ3zbXl/4BDlSwXgJPh0k+4w2DDZQ9AaulfD8biuhJ6moRm8Zs7GbTjXyoh6QHFvsB
 7BOlaAIp2D6WhuRIizE1zi7UkRYDPHvHkWgQMm6ocm9c5io3QR0yFkZ6gc1CLc3Gjp2O
 lcvTaYwycJCwz7bi9+AztYmUsSxtBaokLoZ4zGV4zkYC9pJgGH7HN/Ba9EJakjtp+r+Y
 /LYGiq22fi1tpAsGywrWp/52UC+7CQQgBrHt9FY5l8mdTa6cghsi2zK9ypfkEPuPKBt6
 3khGUhvhk0R2yySWyYnB7X/mEgCTd9ibtxwk4sUChbHV5FPhOn96z+oQ7oqtRw0xBlM5
 sUIg==
X-Forwarded-Encrypted: i=1;
 AJvYcCXwLD3wu4BTM4nuZJKmrqJgbylOvfdZGy8gqcRaxJ9ckx2Vjrscxdu7ujxZ7hz3E9s14Xp9NKQF7R4=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxQRXu0Uq9ZsaaTkFamrNDby6E6KOdkGwlpbUXq30bLrcNubgBo
 wiu7lmnGZUAtseHzLZebSuG1FOvOhXbgxoniRehtpWDLlEChgV8ykEdrtfpQpwDEc/6OjwxPlkq
 HPqbIlVqbk3CgUV6e7tzL/aRTitf4kv1iQFVkZ/WBwE+zt7gBuVClBRCjUeIRwuTOiIc=
X-Gm-Gg: ASbGncsqy66wj0GYJT8QQwq8HLnT9eE9lAt0ws3VfyIFFZiT7YW7RSY3k3CnIlDbQ8E
 +7+yi5IaHLzlmSo/Z0O6YXJ3m2pLAjp1gSRq/p0/1BeOw3/Y//atabD5ZLz6wGqGoB7Da8QcUlr
 Pfr9jG91wP8zNclMoTVqtaG4Pe+ZAeId9nWZ+gY3iMm5la+IWuM9CIFS0/M41LMSYwklj1Doqvl
 FhDvLIZmgRiLvKkZVKYZ1HsiOXZPP/slUVO3LinSCPY9dlJqc94oHUAYLRxXmZp7eQUm5SykKGM
 cWBzZRFhrntXNoJMiQQD5YW1bljuY0Ze6OFtnJY78JK7GtDrgRpXwMKA3magn1P2UPbVsQMaCic
 =
X-Received: by 2002:a05:620a:4106:b0:7c7:a538:490 with SMTP id
 af79cd13be357-7cd010f3f58mr1553894985a.2.1746998025364; 
 Sun, 11 May 2025 14:13:45 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHG9kjNTS7QVk/IBI3fAZ7q6HPf68wGUS7tIWiANtFyYY/r9CODAeCGOJFnFzMk3+bULTdImQ==
X-Received: by 2002:a05:620a:4106:b0:7c7:a538:490 with SMTP id
 af79cd13be357-7cd010f3f58mr1553891885a.2.1746998024994; 
 Sun, 11 May 2025 14:13:44 -0700 (PDT)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-54fc644fd30sm1255824e87.13.2025.05.11.14.13.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 11 May 2025 14:13:42 -0700 (PDT)
Date: Mon, 12 May 2025 00:13:40 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Connor Abbott <cwabbott0@gmail.com>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Bjorn Andersson <andersson@kernel.org>, Rob Clark <robdclark@gmail.com>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Akhil P Oommen <quic_akhilpo@quicinc.com>, Sean Paul <sean@poorly.run>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org
Subject: Re: [PATCH RFT 01/14] soc: qcom: Add UBWC config provider
Message-ID: <yxmlvcnfjk2nvkqz23lyid4itacrptgpair3zptz7wqsrecsr5@27euwgdw3zvn>
References: <20250508-topic-ubwc_central-v1-0-035c4c5cbe50@oss.qualcomm.com>
 <20250508-topic-ubwc_central-v1-1-035c4c5cbe50@oss.qualcomm.com>
 <CACu1E7H6FGm0npQnG+M3Jzn9RSL9CYkkDg3rtH+=on4_caPTZQ@mail.gmail.com>
 <17431c94-7215-4e50-acc9-7df97558af16@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <17431c94-7215-4e50-acc9-7df97558af16@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: ysQQIaO9591RT3-OtnhkBIkHHRRJP6fd
X-Authority-Analysis: v=2.4 cv=DOuP4zNb c=1 sm=1 tr=0 ts=6821130a cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=dt9VzEwgFbYA:10 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=IBcEPC0dAfEB-spL9jgA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-GUID: ysQQIaO9591RT3-OtnhkBIkHHRRJP6fd
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTExMDIyNSBTYWx0ZWRfX4n7u7N2tAF/g
 ZmXWh76qb47x4X2lYtowrfjt+tEIzB9bc2wxKKJQ9/BlFdTElCs5AzcZvg/Jt2Jh0nTigNXBVpu
 90VWfW2/jestAzYVfvVt4/06EAkc3koqLYGJvS7GriEYhHPbiS7hAG+QMn/7YLaDwFMlayRw8Gm
 G+G+K+WEZvw2QdzCcgX2Ag8nHb/s2UzZGaf6DLYLWtEEKfLOsggBa6iu4SboQM/nQFngIjs63JX
 8V9DUpgzrjSLSizUia4Mz1tYTR+IRCaRpLSLQl/+KAanwArnRPAPaKdui+urJSpjetSrkskjSuA
 jzcvbBgAAnQo18gqxsuRffHUf3oPJhJwIx1CyNhAF9dVPzE7C3Xu/1JRlNVLgyDOtXwfAJLA0FU
 F+PUhH4Y2h4eGWVO/LKdVhWAK6ZLtkEPwEd0HdPro6VdzZoWRKmKEzyIj14/4J/Z+gFTPiPG
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-11_08,2025-05-09_01,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 adultscore=0 spamscore=0 clxscore=1015 suspectscore=0
 lowpriorityscore=0 bulkscore=0 malwarescore=0 phishscore=0 impostorscore=0
 priorityscore=1501 mlxlogscore=999 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2504070000 definitions=main-2505110225
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

On Fri, May 09, 2025 at 02:28:55PM +0200, Konrad Dybcio wrote:
> On 5/8/25 10:12 PM, Connor Abbott wrote:
> > On Thu, May 8, 2025 at 2:13 PM Konrad Dybcio <konradybcio@kernel.org> wrote:
> >>
> >> From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> >>
> >> Add a file that will serve as a single source of truth for UBWC
> >> configuration data for various multimedia blocks.
> >>
> >> Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> >> ---
> 
> [...]
> 
> >> +struct qcom_ubwc_cfg_data {
> >> +       u32 ubwc_enc_version;
> >> +       /* Can be read from MDSS_BASE + 0x58 */
> >> +       u32 ubwc_dec_version;
> >> +       u32 ubwc_swizzle;
> >> +       int highest_bank_bit;
> >> +       bool ubwc_bank_spread;
> >> +       bool macrotile_mode;
> >> +       u32 mdss_reg_bus_bw;
> > 
> > This doesn't really seem relevant to UBWC?
> 
> I'll admit I just took it with the rest of properties for a simpler transition.
> 
> Generally, we could ma-a-a-aybe just make up a common value and pray it doesn't
> break anything, as we're taking numbers that translate to ANYTHING_ABOVE_OFF or
> ANYTHING_ABOVE_OFF_PLUS_1 in most cases wrt a cpu-ipblock path.

I'd rather not do that. Let me check if I can cook it on top of your
series.

> 
> > 
> >> +};
> > 
> > The comments should be copied over from the Adreno struct. That was
> > the main way the meaning of most of these was documented and you're
> > deleting it here.
> 
> I'll do that.
> 
> Konrad

-- 
With best wishes
Dmitry
