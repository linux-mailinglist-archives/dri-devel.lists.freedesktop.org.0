Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D585EABC1AD
	for <lists+dri-devel@lfdr.de>; Mon, 19 May 2025 17:08:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B41DE10E348;
	Mon, 19 May 2025 15:08:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="n4J51pG8";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3A26910E348
 for <dri-devel@lists.freedesktop.org>; Mon, 19 May 2025 15:08:19 +0000 (UTC)
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54J9IUnm028604
 for <dri-devel@lists.freedesktop.org>; Mon, 19 May 2025 15:08:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=pnbK04rSw5LfgSejzbkh3QJ3
 tYtMCLEGOFKCm7S1tuY=; b=n4J51pG8BVZa1SayKI0SpSjmp257mTlLVz2mPke/
 GP4Ws9bG81sl4rgTq/gVV2Qabr1qPr27513kQ4Qr9364x0oL4oSEBbHeJXg3XCds
 8fOo03NrIYOPGR95kIvQzlE/buW2JkN4Y5c7UgiIdGAUXPRs+BvKJyyLbTtPhn+b
 uJOuOg1fBh6vihIbR1syPZDRUJ81nMZzHWucLdijEGSwNfGO6bQCEzXPcmptBYLj
 KvtjpHs4ft9EMQpYmevTyn/E3DC6gIuZgeFCVweO0/bMSvJssF6chY8LOklWV9Xo
 Mct3swrsEpuvpY25JZHecb13xCTn+x+cVimMyLMFVtrkXw==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com
 [209.85.219.70])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46pju7cr1m-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Mon, 19 May 2025 15:08:18 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id
 6a1803df08f44-6f53913e2b6so69385766d6.2
 for <dri-devel@lists.freedesktop.org>; Mon, 19 May 2025 08:08:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1747667294; x=1748272094;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=pnbK04rSw5LfgSejzbkh3QJ3tYtMCLEGOFKCm7S1tuY=;
 b=jqNj6RAjQaET2J39B+1Ldono2p/iOtYbOrF5RBbqShz72ennwRvnCZh3HKWK2TXIwZ
 wHyDy5w3IzEiBTCD1eUb5l565eBjK93oaAu+DavrgvcQda6ZCVqp9NPFnd/1OEqRFrMh
 E+obfKwaTtudH5nvqVbjBg18Cc2lj3oGU6IyP+3CFlnjW2ql4s4L85qnJ54KreDltJcr
 p6Z9fH0i7lW+fQZ3NTSUCGfx7KTtP2Qkd9QursjFAbtx20UhRVSDS7Uumr5JzihaIzgL
 yCDYDiLd4YYW7Dcx8g/2w06hYhUUnvwnjm8oY6rPTNdLfnAuONzmErI/hSQfe3FB08Y+
 rwFw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUthttZHnSxA6yMafmqF2lJyKH689Sr8rv8ZzNOUtjrWX7JTI2T5V4MxXSDo7NsLDZKJ3hWgvxPNJI=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yww47eVRqDPkCCDeKuBfZjZI4xjvaRsR4kCDwN60hiWhP6o8iEf
 bKN+HmQcpnG44DRIqPB3cE/AVr6iqhoGBikpxCcMgSWSK7itQ31h1fv2yXAf1k4DLyTiuEJ8mD4
 GK0yrAp/fOnPnKlooJQdZmlK4ocLhsjcHhqKrT+/5B3IWbbaS/SYcGkMJ5Eq88dBRip0BRI1/Xv
 GCCH0=
X-Gm-Gg: ASbGncstbz+g8pi24Xf0CN1dMc5OdT7OzbP9LAC5ujAgqWooOTlBHsfmGXQI5fVnzsN
 sPqU/4Q0eihEKaP73PzyO0Kf9J45OSZIwQWuyoAgz3U89/0T14qgo7cRYzSrhLlRqYSDG8i8KyH
 JPcE59059XOcD2Qbd1OoEaACv/1AU1VIuo2BgotuIO9eLE9vVgRRKS2d1byWMiQ+mH754s8/zQ5
 o1JBD3cw43jC24l9ErybdZ8HiGHjlZ6Nw/HWNeSXA+5znMgLmQCYl56ffm6gI9Uhrl+ekgLCyjw
 dKSd5+0CPLhgJh8WBYEcZ69Rz4jqT+a4QAFlNLbsSmWeLh6dtOMT82cgs5VwcuZNV5Ro8lRp/hU
 =
X-Received: by 2002:a05:6214:e85:b0:6f5:117c:76cf with SMTP id
 6a1803df08f44-6f8b08ed84emr227883246d6.40.1747667294304; 
 Mon, 19 May 2025 08:08:14 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFS7ZI9iTUTS3skWTcOcofhzUOZ7bKXIr+bJqh1BroaJVamHikSdw6gyrDyo62FkE6ExDiHnw==
X-Received: by 2002:a05:6830:488e:b0:72a:48d4:290b with SMTP id
 46e09a7af769-734f6b88831mr9233068a34.26.1747667282670; 
 Mon, 19 May 2025 08:08:02 -0700 (PDT)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-328085f097bsm19317971fa.110.2025.05.19.08.08.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 19 May 2025 08:08:00 -0700 (PDT)
Date: Mon, 19 May 2025 18:07:59 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Jessica Zhang <quic_jesszhan@quicinc.com>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Krishna Manikandan <quic_mkrishn@quicinc.com>,
 Jonathan Marek <jonathan@marek.ca>, Kuogee Hsieh <quic_khsieh@quicinc.com>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Rob Clark <robdclark@gmail.com>, Bjorn Andersson <andersson@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 Rob Clark <robdclark@chromium.org>, linux-clk@vger.kernel.org,
 Srinivas Kandagatla <srini@kernel.org>
Subject: Re: [PATCH v5 00/24] drm/msm: Add support for SM8750
Message-ID: <pbg537yuu3sy2ueho5gcfu6cuvgmkobzgvtfemghvp5w6errtv@f4gbobbeqosk>
References: <20250430-b4-sm8750-display-v5-0-8cab30c3e4df@linaro.org>
 <75f503ea-e8cf-48f3-b39e-388ac456821f@quicinc.com>
 <24e49307-7d75-4736-9b5c-2e6286fe57a3@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <24e49307-7d75-4736-9b5c-2e6286fe57a3@linaro.org>
X-Authority-Analysis: v=2.4 cv=XKEwSRhE c=1 sm=1 tr=0 ts=682b4962 cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=dt9VzEwgFbYA:10 a=VwQbUJbxAAAA:8 a=KKAkSRfTAAAA:8 a=mreiCzLEixqGZhZwl8gA:9
 a=CjuIK1q_8ugA:10 a=iYH6xdkBrDN1Jqds4HTS:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: skS4JwPvJKxXXNRNljlB01fw85zz-ROV
X-Proofpoint-GUID: skS4JwPvJKxXXNRNljlB01fw85zz-ROV
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTE5MDE0MCBTYWx0ZWRfX8A7ui3aRjR9g
 zLmIlEiqHJg2LBYpxABNzwBRm7efpYkzqxeopxtK9BEX2G8AASYNDrHhv6JvMWfFou0MyRywfDv
 Q6R/7rp0bRLIu7z3VTG/Dg5k2aEPKqmTq4HKfVruEJB9zKWcXVx2Bndl2uM9B29M/dtHMEQ6mvj
 gcd+LSdZvixICZYEI5bfyT/vysJu/b5oWc/79GhkkyWiWI++sh9pf6UCsCvepdze+aSDmuNpsKO
 Zr+Y7XBMuuFqMvoRnlJuqBuf0H2b+byuALwyQS2Ulmofa0xnJK5FCOEMQ0qP66DjDdXQOWkkOzF
 FWEeeZB/01rbOtMQddHyQighN2FmPrsmJ0S9aQO4HJNJCSdzgV9f1ybbNeIe68lEbgqCGA1iyyi
 wmYVraQkYBOregx9uha6MmM9KVUnSzMLaQrYi1M2Pfcwn4BW38Ai/GZnL5RKSRwvuZA+VLE5
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-19_06,2025-05-16_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 priorityscore=1501 impostorscore=0 clxscore=1015
 spamscore=0 suspectscore=0 malwarescore=0 adultscore=0 mlxscore=0
 mlxlogscore=999 phishscore=0 bulkscore=0 classifier=spam authscore=0
 authtc=n/a authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505070000 definitions=main-2505190140
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

On Mon, May 19, 2025 at 04:52:15PM +0200, Krzysztof Kozlowski wrote:
> On 17/05/2025 02:08, Jessica Zhang wrote:
> > 
> > 
> > On 4/30/2025 6:00 AM, Krzysztof Kozlowski wrote:
> >> Hi,
> >>
> >> Dependency / Rabased on top of
> >> ==============================
> >> https://lore.kernel.org/all/20241214-dpu-drop-features-v1-0-988f0662cb7e@linaro.org/
> > 
> > Hey Krzysztof,
> > 
> > JFYI, I think there was some discussion on IRC (specifically #linux-msm) 
> > about having the feature bit dependency back in February.
> > 
> > I believe both Abhinav and Dmitry agreed that you can keep the changes 
> > to do version checks and drop this dependency.
> > 
> > There are still some ongoing discussions regarding the feature bit 
> > series, so this way your series isn't blocked by that.
> 
> I was asked by Dmitry to rebase this on his rework. That was quite an
> effort. Now I hear the dependency - Dmitry's rework - won't come in and
> I need to rebase back, which will be more effort. Can you all ack this
> so I won't be needing third rebase?

Please wait with the rebase. I still plan to get it in, it is an ongoing
topic. Anyway, I think there are several open issues even with the
current version.

-- 
With best wishes
Dmitry
