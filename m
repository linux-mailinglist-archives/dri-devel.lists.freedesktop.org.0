Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F1E71B533C1
	for <lists+dri-devel@lfdr.de>; Thu, 11 Sep 2025 15:30:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3828310E0A4;
	Thu, 11 Sep 2025 13:29:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="IUiT6jJz";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D869710E0A4
 for <dri-devel@lists.freedesktop.org>; Thu, 11 Sep 2025 13:29:57 +0000 (UTC)
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58BB1ixx026347
 for <dri-devel@lists.freedesktop.org>; Thu, 11 Sep 2025 13:29:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=Ey2Z4JMsId+WF9VnovhxbF+7
 8pVNuM6IZRJDnfyjy2I=; b=IUiT6jJzIUMzkChyaP0MALicLXWe5kSE8M37EaXc
 /mgBwHrMxAmKtBjT0Vr0FlrxLbmVRH2evnfOqk/tj5WHnDLAMX1zze4sHhcqTuF+
 gw9bTymHdDo1qRGZZdHoR38rncoHRpzWuyXwBO4ndj2vXbCHNkLIr8WJf0HacWCL
 fmAEWKKZdlgqvSKvHb0k8uMdl05K8/rdeKo7sKvLDxlObBPFV4aaaJkipSbnB84N
 pyyv9MOk03u5IaaF9/eKO1lH/gl68ChvV5+D6InBUDSlRPwsFnt3gPRvjbQsImmc
 87i/SHOhIMJzkGSa9YU14HC93lqV7ig+1wACQSMDrrx+aA==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com
 [209.85.160.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 490cj0yqya-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Thu, 11 Sep 2025 13:29:56 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id
 d75a77b69052e-4b5f4e4fe41so25956901cf.2
 for <dri-devel@lists.freedesktop.org>; Thu, 11 Sep 2025 06:29:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1757597396; x=1758202196;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Ey2Z4JMsId+WF9VnovhxbF+78pVNuM6IZRJDnfyjy2I=;
 b=rnrzYLyDNPPR4kU4+ahLWWlixtaJE/OggWJNEp+KQvfQu1jN06+wNne/FZeyNsfuM1
 B/PEZfNbNt/bhZX5d5HoQ3InSq/268zvzC47ktmxFYiO4OPvf2QCIGBW8tntfjFtVy+g
 2wWO1XM0nxOBrf37OQHJUeCjA28cMFfJHFHg5ZiYJlaG7p+BBfLxpryE4gdpDodo4DMv
 +bqMcwuJ/M2g7pPOZM8y5EXrK6olMT64tPePdBGGDYMUDQyqM781bDXSfubJBFo/JZRq
 lnrXJK4VhHKUeUN4fG9XrIubXAXyaovON6aWPvnuj3numBz2l8zMpibCzreY7b2CnAaQ
 UOhQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWTIePNqZYSz/wmlbosq+fAnbm7GfyFDYz8xqQBdWXeIxrzYkCFreNvC1J7+BrknMCreqyqCK2P4VI=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzgbKXxFGMSJlx1MmZuForvjGzVHQXX7mv12R/9UMv5eTvRUztD
 oZd6eTq8T/0nXfmfGJQAHMPd6eBB+C2LnUzvuSBX7Cf3F6h0UqSSVxTFYrCDHlLibHky0YQ1wvM
 jGvl+8Di+OTYJJa1IT/cwZOOoWAwkFtl+Cray4cYYc2seux1PmRBEJk+pXmJGx+BDAz/7lzI=
X-Gm-Gg: ASbGnctTCSQcze+Gw8Dit2plZ/3oQhAP+AGF7XFLDSW4GbhrEqGK6BTbI3hoJ7KNPIl
 6dgZYTGZvbAI6OjublizGZ2yBUTUktWMKgir/4VtqDntgru044F9KWC1loag3c5YyWKLVT/qKK5
 u8jSyMovZ/rK1B2H4TQAc3QgZnirIuqoRcj5PUYBD2F1tJ9oOFOxZEWnXTv61LgJ5KDGfrpydRg
 LCqbSv9LMJk64cza9wsZhVetOhbuzkiO8X701vwlsFGP8J7gSosPdJ461U85yeAdNlnLWBni81v
 snkLorS37O52LPuJwuxeHjRZhrn8EVnKJn7j7Appvr5BMI8SPQk+HbnbQAKXIz3jnsiGBgeDjOX
 S26aDc8LZpDqdLXvPtVMeRY6zuv0ejM5LMX6yj0Pmt54tYhC8Qlxp
X-Received: by 2002:a05:622a:5c92:b0:4b3:122f:89d6 with SMTP id
 d75a77b69052e-4b5f8445a73mr256204341cf.45.1757597396145; 
 Thu, 11 Sep 2025 06:29:56 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEOBNwwY5vu2F6YDZFmUYGcnQ9hxKYIQ7ZgYbQqAmh+km6PDS9gBX8NbKd9eTG/XrE/5BOGWg==
X-Received: by 2002:a05:622a:5c92:b0:4b3:122f:89d6 with SMTP id
 d75a77b69052e-4b5f8445a73mr256203741cf.45.1757597395496; 
 Thu, 11 Sep 2025 06:29:55 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-56e5c3b5fadsm438580e87.6.2025.09.11.06.29.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 11 Sep 2025 06:29:54 -0700 (PDT)
Date: Thu, 11 Sep 2025 16:29:53 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Abel Vesa <abel.vesa@linaro.org>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
 Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Kuogee Hsieh <quic_khsieh@quicinc.com>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/6] drm/msm: Add display support for Glymur platform
Message-ID: <4qrmzpxbuptm2x42qa74hbulb5k4sfyxmu5ji76j232elo7dnm@pkclmnxb2ijx>
References: <20250911-glymur-display-v1-0-d391a343292e@linaro.org>
 <xjtg6emrb7svloz2fkaotfbj4m2wzmddxdsdnjk5wkbmocqzmd@l656suk46pkd>
 <kasmte3rxr3ukz2eqbwlzbpeam2qq2qimzdqta5dl5xsthnokc@smvts77lhirb>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <kasmte3rxr3ukz2eqbwlzbpeam2qq2qimzdqta5dl5xsthnokc@smvts77lhirb>
X-Proofpoint-ORIG-GUID: iPZ-OQT72Tpp_Z4HKTk9fluc0Lfk8dEq
X-Proofpoint-GUID: iPZ-OQT72Tpp_Z4HKTk9fluc0Lfk8dEq
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTA2MDAyNCBTYWx0ZWRfX+3hMgXRe66jn
 igPl+IfNTAno6BnNdfpwKVpCdBe8NjLRHWFWx608psQm/VIE8KxCyxIycFq7beWE63ow29QCaIQ
 PVhpIaRXGrpNQBujKU0CIEeUNzi7DtHFUfaI2mlmMFf5Rs7IZ3r1Nxybxnu0exbEv8fEgM9CLv3
 uaSkL4wVNxrKppI9+Z02ZnsDIUhCCnimv/qnN9uS9hl8hIfhCOiFNsUrKjWq97OE2UggwRyvQFL
 i8sJKK+NPuw8dK6mOgFzG2mpdJL6nFarle8kr+Kbe1Viql29Fa6TEKI4P8kgjLRdVg8ohS5KZbf
 soUrWU74DcaPVuFs/XXtgmaG4TKo3xxvcPjNo2tMZTeTGhCkDrx7O5tOCxmJ8nr9MAUnOlwsM8k
 CABmQ34p
X-Authority-Analysis: v=2.4 cv=QeFmvtbv c=1 sm=1 tr=0 ts=68c2ced5 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=yJojWOMRYYMA:10 a=KKAkSRfTAAAA:8 a=E1lcnybXH_NDbzajFtMA:9 a=CjuIK1q_8ugA:10
 a=kacYvNCVWA4VmyqE58fU:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-11_01,2025-09-11_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 priorityscore=1501 clxscore=1015 spamscore=0 impostorscore=0
 bulkscore=0 suspectscore=0 adultscore=0 malwarescore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2509060024
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

On Thu, Sep 11, 2025 at 04:10:50PM +0300, Abel Vesa wrote:
> On 25-09-11 16:02:40, Dmitry Baryshkov wrote:
> > On Thu, Sep 11, 2025 at 03:28:47PM +0300, Abel Vesa wrote:
> > > The Glymur MDSS is based on the one found in SM8750, with 2 minor number
> > > version bump. Differences are mostly in the DPU IP blocks numbers and
> > > their base offsets.
> > > 
> > > Signed-off-by: Abel Vesa <abel.vesa@linaro.org>
> > > ---
> > > Abel Vesa (6):
> > >       dt-bindings: display: msm: Document the Glymur Mobile Display SubSystem
> > >       dt-bindings: display: msm: Document the Glymur Display Processing Unit
> > >       dt-bindings: display: msm: Document the Glymur DiplayPort controller
> > >       drm/msm/mdss: Add Glymur device configuration
> > >       drm/msm/dpu: Add support for Glymur
> > >       drm/msm/dp: Add support for Glymur
> > > 
> > 
> > This will not work without the UBWC config for this paltform. Please
> > include it into the next submission.
> 
> Ofcourse it won't work, but wouldn't the UBWC be merged though a different tree?
> I thought I should send it separately because of that.

That depends on Bjorn, currenyly he has been Ack'ing those patches to be
merged through drm/msm.

> 
> I'll add it to this patchset in the next version.

-- 
With best wishes
Dmitry
