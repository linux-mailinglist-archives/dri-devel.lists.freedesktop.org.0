Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E285BC97F1
	for <lists+dri-devel@lfdr.de>; Thu, 09 Oct 2025 16:26:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 89B9610EA6D;
	Thu,  9 Oct 2025 14:26:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="YR8u+Gs/";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2DB5310EA6D
 for <dri-devel@lists.freedesktop.org>; Thu,  9 Oct 2025 14:26:52 +0000 (UTC)
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5996EIgI022311
 for <dri-devel@lists.freedesktop.org>; Thu, 9 Oct 2025 14:26:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=G2KvXnwbuscjouOeX9M2xhbN
 j+kin2y5TQrFozgduvU=; b=YR8u+Gs/wtwLU58ZURivOsxW92bTU+ngTcRJDdn6
 ZT/eU6WoX5YaoxxHNjuTJDjBKUj+rqCxM6EdVLaLxxr4cCP984JzbUP0kiKJrEw9
 9uzHclNOl6GuTNUt+7C/bFvMJH37oEAe1qbuDg7eLOuaKnv6h+kJyhgLmER9g8ja
 5hJNLuV2OSVu8yVHQsxnV0W61H2fLrtR8lD+pFyfJZQQ48r419N7pX+Lm81VY3IV
 wKC2GhXO6ORGFm5eoMYHQg31fOyiNwcpObEW8SfbzIJbV/gH2FcGVlTvMVjnm4Nz
 HxI8mDhBhy+Z2hFnDceypl06uTyHHBRsZ/qZYmdtp2aTuQ==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com
 [209.85.219.69])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49nv4sk593-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Thu, 09 Oct 2025 14:26:51 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id
 6a1803df08f44-792f273fd58so27933846d6.0
 for <dri-devel@lists.freedesktop.org>; Thu, 09 Oct 2025 07:26:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1760020010; x=1760624810;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=G2KvXnwbuscjouOeX9M2xhbNj+kin2y5TQrFozgduvU=;
 b=HxhnFnTCxGmMROCinEu7s8At/VCdJiR/5hl7eZnN3Ey6lMSWBJIbEqbHvztkimVPdE
 wEikXAUWPF/CgTssCwT9UWjmMlUTUoBd5ZfPUA5Q4/IqcF38XSM7C4pJFSLMz4PYQydP
 gD0v4ZaWRrU7QNelEA1cMnYDrQPbmsr48rPZoF39UIeZvlIeDOdHnXkrnSWCZ01zCYTN
 vZ0H+qFsWps/yUD3eyK5x/QqYnMK80ADOiIxqQJlPm7p6EJdy2tCi3hHrNpmwqzRU60D
 gxFF/fg4E1p54AF2USLJJaHim9nFj7Ma3rvuvsb3CIUd/DcUwW3BUkXZSu6dxAeRCgVQ
 4D/g==
X-Forwarded-Encrypted: i=1;
 AJvYcCXuWMUaPt5C2sV50ZC4OXAaXYJRoxQv8qS1PKPWN2jm/ptcQwHUFzVlMFVBt5LipL+WYh45+9vut7Q=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yx2s5HJXlT+q3QA7ue7r7pifFG8NXkjrBQZUiNusNr3nZBTKYrA
 UyrsgxRVWxOvqhje2vkNRri021PoLjykq/VlMfYlcNxzwWOQoyvn8b2jxSCPnmCoI2eT2/U92h5
 W1CQIfkdgnLEKwJWbNd6Ds+xILtVD2AXwqTTvPQqdtwQiNG8zEpgsHj1nvRJQ0ke+LRUlPWc=
X-Gm-Gg: ASbGncscmsUmtaT6qGJpGDxHuuoswJZ8gYjS09U/tsI/El+e+bNOajZw/x+tcG5X5Hf
 MzdVBLm6emEr+n+TmdQSw8UmN14qEUyEo/teAVU6ZjezmRuQSj6bTs6mYF8F6bi5MV0rzhvi8SS
 PcZZvzMhKNyGW95AUQlktlYhzjtnyuDub/mbEH/t6L23SJKm+0Jq2lCd3fwjJvHWTrbfSEzB8NO
 sBQt2oXil+JYdbFCNkGRfsGN1WSUMZPmTcxk8SJriqkwVoMNNOTizkE5IHfaocpyRWmE0rqnIvK
 KC98XmiMY7/vxmcnf68Ig5ORb9WBYTEs1n2ylhrHH3frMvFdvaeRScPRPla+YLtml5Qh3EXky7R
 hVlJdUNkfUkrh851igEXkhLG0fNWgmV+STmHYGUlOYsHaIu5QW7xstUP1tw==
X-Received: by 2002:a05:6214:2aac:b0:783:2157:5a34 with SMTP id
 6a1803df08f44-87b2f02ba73mr98394016d6.65.1760020007784; 
 Thu, 09 Oct 2025 07:26:47 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGdTWGuZxMQcCYadLFdJmdthwUCJVxPbcp/MQRks6lOTZwcbWtf0yNa8g4UdjMUG53579SmMg==
X-Received: by 2002:a05:6214:2aac:b0:783:2157:5a34 with SMTP id
 6a1803df08f44-87b2f02ba73mr98390956d6.65.1760020003398; 
 Thu, 09 Oct 2025 07:26:43 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-375f3b63f1bsm28387511fa.31.2025.10.09.07.26.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 09 Oct 2025 07:26:42 -0700 (PDT)
Date: Thu, 9 Oct 2025 17:26:40 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: David Heidelberg <david@ixit.cz>
Cc: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Thierry Reding <thierry.reding@gmail.com>, Sam Ravnborg <sam@ravnborg.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Casey Connolly <casey.connolly@linaro.org>,
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 phone-devel@vger.kernel.org
Subject: Re: [PATCH v2 1/7] dt-bindings: panel: Add Samsung S6E3FC2X01 DDIC
 with panel
Message-ID: <3mbngf2r3rvbn5fr4vxbk64ouvm3voo5o2r63vg3clyswnceoh@64r6ujb5qr65>
References: <20251008-s6e3fc2x01-v2-0-21eca1d5c289@ixit.cz>
 <20251008-s6e3fc2x01-v2-1-21eca1d5c289@ixit.cz>
 <7askbazrkbny5jlw6cpxcpjyw5nyiozmksoyj5b5momcc7w5hn@r3x6kddatf3u>
 <74893f76-1b7d-4cfb-ba7a-9fd64427762b@oss.qualcomm.com>
 <bmsxmwfdwx7wlmngaqpvz7c2nudcoukspkxgq6zqh2mdlolfxg@fsdbafotp5q2>
 <75011ead-8bd8-4939-ae7b-1c127eba8aa8@ixit.cz>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <75011ead-8bd8-4939-ae7b-1c127eba8aa8@ixit.cz>
X-Proofpoint-GUID: 8o3FFkMAYqhGlELo4G-2HxXgyK7UxH9y
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDA4MDEyMSBTYWx0ZWRfX51VPGxI0oMS5
 /AXtQwV7RkQYCe9tFXhuVGBNQTxZUU7cU4SIAUxVQov1dgMBCkQLpxVUUndi1rhsjfg8BEKLSg0
 ZYLd8VAd786cGXCZOEYtn1wyflneC8fvBz2cdwd/sZxAnOmEer2PlZAW/X1apPCxKjqzP2igihT
 C4tn4eQzk/p402gW1e0octaevDLp+2KG5BJ2dqJekJulKFmJhD6a03/ThRA+Leo476QFpg9z6zF
 CttteTsRz9hNQuXcgN4Y35ahsLKF8Fo+qyJz1zsYVdmLsu46K/Oiyi1Y1G/aKTLHMF6vPHuoXv7
 gjOcRacha1KqIghWxysu2iHF5YGZvTyJ5JAc6n/PDVOsflp8QaQIQIOGrvfa16Trjw6fTOuv9ZW
 MuvG17zshshBFsw4tR+WQe6wDtqf9g==
X-Authority-Analysis: v=2.4 cv=SfL6t/Ru c=1 sm=1 tr=0 ts=68e7c62b cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=x6icFKpwvdMA:10 a=df2SJZlNlAcoaDSKSIcA:9 a=CjuIK1q_8ugA:10
 a=OIgjcC2v60KrkQgK7BGD:22
X-Proofpoint-ORIG-GUID: 8o3FFkMAYqhGlELo4G-2HxXgyK7UxH9y
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-09_04,2025-10-06_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 clxscore=1015 malwarescore=0 bulkscore=0 priorityscore=1501
 suspectscore=0 impostorscore=0 lowpriorityscore=0 phishscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2510020000 definitions=main-2510080121
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

On Thu, Oct 09, 2025 at 03:32:22PM +0200, David Heidelberg wrote:
> 
> 
> On 09/10/2025 15:21, Dmitry Baryshkov wrote:
> > On Thu, Oct 09, 2025 at 10:51:31AM +0200, Konrad Dybcio wrote:
> > > On 10/8/25 8:57 PM, Dmitry Baryshkov wrote:
> > > > On Wed, Oct 08, 2025 at 04:05:28PM +0200, David Heidelberg via B4 Relay wrote:
> > > > > From: David Heidelberg <david@ixit.cz>
> > > > > 
> > > > > Basic description for S6E3FC2X01 DDIC with attached panel AMS641RW.
> > > > > 
> > > > > Samsung AMS641RW is 6.41 inch, 1080x2340 pixels, 19.5:9 ratio panel
> > > > > 
> > > > > Signed-off-by: David Heidelberg <david@ixit.cz>
> > > > > ---
> > > > >   .../bindings/display/panel/samsung,s6e3fc2x01.yaml | 78 ++++++++++++++++++++++
> > > > >   MAINTAINERS                                        |  5 ++
> > > > >   2 files changed, 83 insertions(+)
> > > > > 
> > > > 
> > > > Please also describe, why it's not enough to use defined compatible,
> > > > samsung,s6e3fc2x01. Why do we need a separate schema and can't use the
> > > > panel-simple-dsi.yaml
> > > 
> > > panel-simple works for 'dumb' (perhaps a harsh word for 'made with
> > > just the in-spec DCS commands in mind') panels, but Samsungs are
> > > widely known to require a ton of vendor magic
> > 
> > The question is about the _schema_. I think it's fine to have a driver
> > for a panel covered by panel-simple-dsi.yaml.
> 
> see display/panel/samsung,amoled-mipi-dsi.yaml
> the OLED display don't fit well, but I wouldn't mind consolidating at some
> point, but since we know very little (no datasheets), it's hard to do for
> now. Maybe in the future when there will be more panels schemas, we can find
> a way to consolidate into one big?

I'm looking for a simple answer ATM: it doesn't fit
panel-simple-dsi.yaml because it needs foo bar baz, which is not a part
of that schema.

> 
> > 
> > > 
> > > Perhaps the original change was made with an "oh it just works
> > > surely there's no drawbacks possible" attitude, as the panel
> > > was left initialized by the bootloader

-- 
With best wishes
Dmitry
