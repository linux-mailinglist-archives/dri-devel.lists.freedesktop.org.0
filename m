Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5792DAA0CEC
	for <lists+dri-devel@lfdr.de>; Tue, 29 Apr 2025 15:08:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A37E110E30C;
	Tue, 29 Apr 2025 13:08:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="IoMznvEv";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 775C810E30C
 for <dri-devel@lists.freedesktop.org>; Tue, 29 Apr 2025 13:08:00 +0000 (UTC)
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53TAFTtu020857
 for <dri-devel@lists.freedesktop.org>; Tue, 29 Apr 2025 13:08:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=3iycI3ZTNsOLa0MGqAVtc71f
 WejZqL8jSxO6Snm5fiY=; b=IoMznvEvvdlStb0Rbk11LLtBu7NMG2nowZ2iwo4B
 fSEf08qftmKZKeH+PHWsH34CVZjWvTGK7iytfGpnB984TB2Kukc1An41CckNTid3
 Jzg2sneWcJCzRuujj+2RNmczljMozW0lvIn9wweC9lytef2jsgUp6UfNSaaiEOux
 60pQeVIFuygGzFVuXwMy+eKzeKmTRy1vHWD+NEXKfxsuy/go2sFHit33kqG8l2bf
 tOaLec4r3VhhVNDl8aGRO2JYpKF6K9YfgGPUq4PbAwOccwrejy40BnFLnnezIE7Y
 1g8ZnCuy0Qu89+QTHu+pMU5XvEHn/GkfQOGkDKk6+0Vzyg==
Received: from mail-il1-f199.google.com (mail-il1-f199.google.com
 [209.85.166.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 468n6jkx71-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Tue, 29 Apr 2025 13:07:59 +0000 (GMT)
Received: by mail-il1-f199.google.com with SMTP id
 e9e14a558f8ab-3d438be189bso31945515ab.3
 for <dri-devel@lists.freedesktop.org>; Tue, 29 Apr 2025 06:07:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1745932079; x=1746536879;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=3iycI3ZTNsOLa0MGqAVtc71fWejZqL8jSxO6Snm5fiY=;
 b=beFl/VvCCF0t6Ji5EkoLZve/OLAjyVcgM/pJQ6fpbJ/fxLDi1Lid4VPS4VF7LDP+Uv
 KE4DdhZYFuGzovb+vpO9SLs0VMBeBEelaLyOAaFPD6bkIu5W9FbN+g/vMnik+nF9zDOM
 OEKUZ2psvjxymFb147FknQZvS14mWjm9qNkI7/2KTXef4UdbXW6cYptya8DLaUbfILgb
 P1t0ISfOrDe3Cvi8hX2iHNKj3M1eXsz1L0PD31o4dTUM/BMIsAMqG4k4BLKheiV3uPy9
 ZAzL2RZkD/GalZkPGAcvJQTez8ngkwkX5W21ib1ywwl7isbZSAM/lcYsi2zfageQr4Dh
 ND8Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCXSNeGZ4qH04mAOEIlfJUDprXse4KKZwopdwnHHuk/M9ZNXQQI7nrZYEXSRRUDTwwLZGtq4JgwYl08=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzM5C9xJGDyh6mY5clR1H29sORt3plZhTO1Gh9cOnEeAi+vvfb8
 JCZO13Q3eSaUCY7jMLa0DiujfeSQqj0VOmYfpBjlJFU2yRmbIH7a+pYiCJoLAyv7F2ivsXXRqCm
 35W+hA+oNaGlb8sN7hxR4402q3dx8NxYOesBeVwtQ7joLv/MQHCUCl1jGixNiJiM20xk=
X-Gm-Gg: ASbGnctYHmLBHVvXNZNSTUHpfHF/RlzaG0tWNWcDFKN2S4DmwMH+jsGscSnyb7TbqRs
 BEQbO5LW8sLybk0tKB1+4Ml+4aGqxfUlPLC0OPWh/FYhkRL5FFtE82cwNAH7kXoqjdMBfh5isUf
 4h+7jfJA4V9IqCEeQmHj8AkmkguOuP/xeAPDKVJqPNoaYSTWXjLkBYGcXH/qbeykLHmMAICd1/D
 WCY0d65UnnWG7sL6qGS1uzC912HGzjJ63+Ryp5cHpTsUf3mdCykSqpVdMMEO0CTnO2wNpB2io/T
 6+HGTcwA3UyvzDxcrWC7a2TvD0F0+RssTp06+kNnNcWbCDGplGCHE1sMCIro0pm0WU598LPgxGI
 =
X-Received: by 2002:a05:6e02:3d84:b0:3d3:db70:b585 with SMTP id
 e9e14a558f8ab-3d95e037fb5mr29829345ab.21.1745932078932; 
 Tue, 29 Apr 2025 06:07:58 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFxYKe64KrJHOVGDGU//vPn33RLxakuwv3sE5bOFok85OIRMr67JhLX/wsIASignHrLnq4UpQ==
X-Received: by 2002:a05:6e02:3d84:b0:3d3:db70:b585 with SMTP id
 e9e14a558f8ab-3d95e037fb5mr29828975ab.21.1745932078596; 
 Tue, 29 Apr 2025 06:07:58 -0700 (PDT)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-54e7cca7fbbsm1878954e87.159.2025.04.29.06.07.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 29 Apr 2025 06:07:56 -0700 (PDT)
Date: Tue, 29 Apr 2025 16:07:53 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Aleksandrs Vinarskis <alex.vinarskis@gmail.com>
Cc: Johan Hovold <johan@kernel.org>, Abel Vesa <abel.vesa@linaro.org>,
 Dmitry Baryshkov <lumag@kernel.org>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Rob Clark <robdclark@gmail.com>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 laurentiu.tudor1@dell.com
Subject: Re: drm/msm/dp: Introduce link training per-segment for LTTPRs
Message-ID: <gcy2ka6d57pcyymaqeilwuo224jydudxvfwd47d2ufkoycjydz@7lf2bjbz7kl4>
References: <20250417021349.148911-1-alex.vinarskis@gmail.com>
 <aA8yFI2Bvm-lFJTl@hovoldconsulting.com>
 <CAMcHhXpmii=Rc9YVeKXaB17mYv0piSFs02K=0r8kWe5tQGk7eA@mail.gmail.com>
 <aA94yOjsayZHNDpx@hovoldconsulting.com>
 <aA+N8YHX0DZ6h9Uj@linaro.org>
 <aBB-gl150GVaZPn5@hovoldconsulting.com>
 <aBCE3wSG2g5pp7jg@linaro.org>
 <aBCH4oo7dbG8ajvP@hovoldconsulting.com>
 <CAMcHhXrDEVrM4fEyMwZ9TDgqgY=s_mTcKZMacCoUuZ2fa8FhWg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAMcHhXrDEVrM4fEyMwZ9TDgqgY=s_mTcKZMacCoUuZ2fa8FhWg@mail.gmail.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNDI5MDA5OCBTYWx0ZWRfX23+/xPuZhp6o
 cwg2w0pLes+OqMnxfv/m9s0YVH4HEvXz2Nz0iiBxf/HPu5eBX7ZhZgmZo5C1AVRN2X0lzRFYyAG
 fh+XkE52mMN/GwQ2pgHk1EOxIfKrGzC2HMJMXCX+YyCMi+geeHOWOlwS3eVrU9APdMLvzzgS/eJ
 wfZmmqnd0UjdkBtSCRmYayeBlrnNuTnAS9RKIFHt3cdA1w0PC3Z2Tx9UeIAsz9tbxN5ujht2Sm8
 J1hmIvEzHdg0JMQ5SuH4XUomxyS0Eu2kgkXDhpRhhVX8C1EoAHKwTY41fo6zT7h7H27/73vGfZH
 h8AmM3LAOAyrnGgknCQ895o2YiAsrsuHBvraTuxaFCFrGjLdMZrLXIJ1c2Ep+YMCIDbKs8N7Cdd
 vAaz/6EIg7wmoPMawMAPerelacR7dd80CXBSAQiWHMEqTPNW6d7EHKDiQBb7CJz50DGPcmJx
X-Proofpoint-GUID: vpPLIpqFf8CutP6SP3VYUPPJOOu93DDO
X-Proofpoint-ORIG-GUID: vpPLIpqFf8CutP6SP3VYUPPJOOu93DDO
X-Authority-Analysis: v=2.4 cv=C8fpyRP+ c=1 sm=1 tr=0 ts=6810cf2f cx=c_pps
 a=vy3nvQW9C2dqy/lMnN3IYg==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=XR8D0OoHHMoA:10 a=VwQbUJbxAAAA:8 a=x2CRZeuriRqWQSmQ5gwA:9 a=CjuIK1q_8ugA:10
 a=mHQ74H5e8mo-RpSg_uaF:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-04-29_04,2025-04-24_02,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 phishscore=0
 mlxlogscore=709 priorityscore=1501 clxscore=1015 spamscore=0 adultscore=0
 malwarescore=0 lowpriorityscore=0 suspectscore=0 bulkscore=0 mlxscore=0
 classifier=spam authscore=0 authtc=n/a authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2504290098
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

On Tue, Apr 29, 2025 at 12:57:16PM +0200, Aleksandrs Vinarskis wrote:
> On Tue, 29 Apr 2025 at 10:03, Johan Hovold <johan@kernel.org> wrote:
> >
> > On Tue, Apr 29, 2025 at 10:50:55AM +0300, Abel Vesa wrote:
> > > On 25-04-29 09:23:46, Johan Hovold wrote:
> > > > On Mon, Apr 28, 2025 at 05:17:21PM +0300, Abel Vesa wrote:
> > > > > On 25-04-28 14:47:04, Johan Hovold wrote:
> > > > > > On Mon, Apr 28, 2025 at 11:06:39AM +0200, Aleksandrs Vinarskis wrote:
> > > > > > > On Mon, 28 Apr 2025 at 09:45, Johan Hovold <johan@kernel.org> wrote:
> >
> > > > > > > > Does this mean that the incomplete LTTPR support in 6.15-rc1 broke
> > > > > > > > adapters or docks with retimers in transparent mode?
> >
> > > > Ok, but my concern is if they may have worked in a default transparent
> > > > mode.
> > >
> > > But if they are by default in transparent mode, doing the setup to
> > > transparent mode will not break it in any way.
> >
> > It looks like it will, see below.
> >
> > > > > X13s doesn't have LTTPRs on-board so when reading the caps, LTTPRs count
> > > > > would return 0 and none of the of the transparent/non-transparent setup
> > > > > would happen.
> > > >
> > > > But this is the crux; does any off-board LTTPRs in transparent mode add
> > > > to the count or not? If they don't, how would you ever learn that there
> > > > are any LTTPRs? If they do, it seems we may have a problem here.
> > >
> > > Count gets increased either way. It doesn't matter if they are in
> > > transparent mode or not.
> >
> > Thanks for confirming. So then it seems we do have a problem as since
> > 6.15-rc1 drm_dp_lttpr_init() will switch all LTTPRs to non-transparent
> > mode.
> 
> In this case, let me add Fixes to the entire series. Do you think we
> could land it in 6.15-rcX then? The second option proposed to roll
> back current LTTPR support and wait until 6.16 will completely break
> DP output on all X1E, so it's very undesirable.

It should be possible, if you rebase onto 6.15-rc, add Fixes tags and
send it quickly enough.

> This series was tested quite a bit on at least the X1E/X1P devices,
> both with and without docking stations, as it is also (v2 iirc) part
> of Ubuntu's concept tree since little over a month ago. You have
> confirmed that x13s also works with this change but without a docking
> station. If someone could confirm that x13s with this change does work
> with a docking station as well, it would be safe to merge the entire
> series as fix to 6.15, correct? I could reach out on #aarch64-laptops,
> perhaps someone has both x13s (or another qcom-based non X1(E) device)
> and a docking station.
> 
> Thanks,
> Alex
> 
> >
> > Johan

-- 
With best wishes
Dmitry
