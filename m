Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CB6F6B54B10
	for <lists+dri-devel@lfdr.de>; Fri, 12 Sep 2025 13:35:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E28E210EC17;
	Fri, 12 Sep 2025 11:35:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="PJD+coNo";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D6E5610EC17
 for <dri-devel@lists.freedesktop.org>; Fri, 12 Sep 2025 11:35:54 +0000 (UTC)
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58C9fMu9017879
 for <dri-devel@lists.freedesktop.org>; Fri, 12 Sep 2025 11:35:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=batHstE5cPVe/iEJdpRC0Az2
 jhHV3oaHtrZXg6JQFZQ=; b=PJD+coNoOdQ9nvOu9veDvFESDwp5vvSE/a+2JmjA
 NFwW6N3GKkUOkQL1OMFxBaRkFCfIkGVbqcCUPpiMcHeWqfoVV6SUhPmr6bPjquRS
 /Xvs3PJxmgLtA/Z1LNfMMEHTcFR2xBQiOFj8b/YQcSs+HIYvurkREhSUxj/cSLA6
 /Yw8FsDXi4psf0tCyuhPF+uR3WNty0/tk5bceWbqAJpk2du8uqa9Mxft7WUdXGjj
 rflnjwjm12cLUoo+EmgprEWNBSdafIGNmAyp5ZZwYTAef6MI8icwA/teNk0qbN/w
 gCQM5Fl7RxmalIibM8/kdyUBboc4DSZ/PCM2JlE7Ll8yrQ==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com
 [209.85.160.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 490db8ujdw-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Fri, 12 Sep 2025 11:35:53 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id
 d75a77b69052e-4b3aac677e1so19644871cf.1
 for <dri-devel@lists.freedesktop.org>; Fri, 12 Sep 2025 04:35:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1757676953; x=1758281753;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=batHstE5cPVe/iEJdpRC0Az2jhHV3oaHtrZXg6JQFZQ=;
 b=q7Bb66EAFw3hteNzOh0HZzu5O/cxEEVFPfohL28LGNKfzl8PgOV57/gZ4Fs9Zqcbgk
 5CTW7WOI74ip828nM7r/kwBKajlsqty1HE+y1yIr71xUv/zqJzLVq2EIl5zmIjGzhG9o
 t5nbiJys6+6AQpCP5CVuItKiZF2OZTA4RE6RaiJQDnZWXbEEWJmDznD4KaXafBDngbtA
 psMQsqwsZ/sW6BW8OlZDEYXqhPhIuFPbSqpMk/p4Gwe4h72P/DVGD6ajhRJ8Z9sZffpx
 /d4p45s6uXrB/JMLdsfI76LKZjDcGNBmItzcFzrbroJphaNanIzR1KJrwhozHuyWlTnC
 Wqeg==
X-Forwarded-Encrypted: i=1;
 AJvYcCWXyJw8G96f0Gu14DXx3xc0otNhWReNjYD0AXksbNUm8NjIF6kPqlF9VmaafGB20cvm4lMnqZNjdds=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yw8GmBZtMJgLEewpA3GiIo1j/6PBex/vS8LiHkXAj83H0lLFd7o
 tu21eat0xf+NPCBBvU5jYTn+uIw8Blvl0hYeC4CIuxgP7UddpW8/FAi4GUJSuF0aBsEhTAq3d/u
 v0EO4yD7hBu+EIPmvppIr4ORVtSLn4HO+QGWHcnwljKkuRZsoaXlNBAtE3CkosonWXp5gr1A=
X-Gm-Gg: ASbGncscKi+7dsrAimC6pmiHC2L9aQKJVAaNJvdpkoo/XChRcyJF735gHuFvPU+opiP
 B9iCJhnGhGxseLhP3V4YiKybpOhNtJZVwfjII7e+S/a2Wtnj2iP3Vr6rlVI7YZDP5zYNU3HQhLb
 fB2OIFLH5Wr1lL/65ZXU2cF1KVj70+wWBdPD61VINWZ/koAd8eeG4MdeRY8vIyxNQLQYEjg1bKn
 F3ySLYgXNfNoWgf0tCyp2t9Yo3c+kjTf/uGx9msWdnz+3Z+Qz5vS7wC+KW74p5iwlyjfRh8Tvdv
 naw6LN1hPHMdo2kgIt2CXah1/gfHDVUpUJ2ZJX/ryQC/CKaznOiMhc8g0JSG+HTTUIfC7HW/wqa
 rZ8GfGBK6Tdwu5RTlbBvR0bSFCe92nH1TP+nd64B6rIV/6d6iL5Bl
X-Received: by 2002:ac8:5f0c:0:b0:4b3:509b:8048 with SMTP id
 d75a77b69052e-4b77d08930dmr26685491cf.45.1757676952966; 
 Fri, 12 Sep 2025 04:35:52 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFROb0xZp9Rvgv2adavalmKsqHLfU8/KA8mNM14Xqc42eIicOFb6cnSvUsMAx7DV/IVH8dmwQ==
X-Received: by 2002:ac8:5f0c:0:b0:4b3:509b:8048 with SMTP id
 d75a77b69052e-4b77d08930dmr26685171cf.45.1757676952396; 
 Fri, 12 Sep 2025 04:35:52 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-570ba3d222bsm499760e87.104.2025.09.12.04.35.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 12 Sep 2025 04:35:51 -0700 (PDT)
Date: Fri, 12 Sep 2025 14:35:49 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Dave Stevenson <dave.stevenson@raspberrypi.com>
Cc: Maxime Ripard <mripard@kernel.org>,
 =?utf-8?B?TWHDrXJh?= Canal <mcanal@igalia.com>,
 Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Dmitry Baryshkov <lumag@kernel.org>
Subject: Re: [PATCH RESEND v7] drm/vc4: hdmi: switch to generic CEC helpers
Message-ID: <kg7adf363xjpragtvkub3gkstul6ycivr6jz4hld2isxjebdlz@z2cewulo3jwd>
References: <20250705-drm-hdmi-connector-cec-v7-1-d14fa0c31b74@oss.qualcomm.com>
 <pz5luqbagulactqp7h237apoostl64rcrnvmu53eauvtb6cqly@nsmzsvbfixrr>
 <bmbu6dfhr4i37fxlqo7ltalkzz6bocb5whuv34x437k3crie5j@ndtqjrv64n5j>
 <CAPY8ntD-q6nZcVJmo5OG_6U5cxdOVdwKLJChsQZd_ZFjCRuGZQ@mail.gmail.com>
 <CAPY8ntAspTdWB6nNXrkNpZ9TYUtbkxJc_QB3ZmF5iGC31_U33Q@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAPY8ntAspTdWB6nNXrkNpZ9TYUtbkxJc_QB3ZmF5iGC31_U33Q@mail.gmail.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTA2MDAzMSBTYWx0ZWRfX/Ry6y5DXq8+E
 OE6BU3gWGMAsRAdHX1EaJ0F/UOmk56MKlsSToGPhWB8LEbuPOrVHksv/o71ujMxg2vIm/Sup8t8
 p7VLl3PqHRmUc8pBHNGucwFDiTLIYIofBsNi7zpyc5JkCfhN0HRfjKk+IC2WXZC/6Ii1lch21HE
 klty+K3p9DGZd8jh8El7iq5ZjHxHC4X3JeVU5rolpjeD4Qe6N2ZlQXp4ndf4nINjsrFFqoAXara
 +RAfmUUL9W6rwasndUsB9U1gWjWcblibARh9LiyKvGxdoH4PHKdT6BkRh3/Tj8EMfVhEwAdsKE4
 9IEmq/qzddso0sSAhTFoiHE0/jPC3yY2nXMddZ4CyHmH5av66jFduBYh9pawabwkGSMRGWvIKC+
 f/Ez6uqI
X-Proofpoint-ORIG-GUID: gQpt6qTlCrzeFIwB0oIMNBK93xkxRMTp
X-Proofpoint-GUID: gQpt6qTlCrzeFIwB0oIMNBK93xkxRMTp
X-Authority-Analysis: v=2.4 cv=VIDdn8PX c=1 sm=1 tr=0 ts=68c4059a cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=yJojWOMRYYMA:10 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=RF00TdSWAAAA:8
 a=KKAkSRfTAAAA:8 a=Tw4uHNu3hZ8oP4iaKF8A:9 a=CjuIK1q_8ugA:10
 a=kacYvNCVWA4VmyqE58fU:22 a=_nx8FpPT0le-2JWwMI5O:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-12_04,2025-09-11_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 spamscore=0 suspectscore=0 bulkscore=0
 phishscore=0 adultscore=0 clxscore=1015 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509060031
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

On Thu, Sep 11, 2025 at 06:37:18PM +0100, Dave Stevenson wrote:
> On Wed, 10 Sept 2025 at 15:21, Dave Stevenson
> <dave.stevenson@raspberrypi.com> wrote:
> >
> > Hi Dmitry
> >
> > On Fri, 5 Sept 2025 at 17:51, Dmitry Baryshkov
> > <dmitry.baryshkov@oss.qualcomm.com> wrote:
> > >
> > > On Fri, Aug 15, 2025 at 06:11:57PM +0300, Dmitry Baryshkov wrote:
> > > > On Sat, Jul 05, 2025 at 01:05:13PM +0300, Dmitry Baryshkov wrote:
> > > > > Switch VC4 driver to using CEC helpers code, simplifying hotplug and
> > > > > registration / cleanup. The existing vc4_hdmi_cec_release() is kept for
> > > > > now.
> > > > >
> > > > > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> > > > > Reviewed-by: Maxime Ripard <mripard@kernel.org>
> > > > > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> > > > > ---
> > > > > This is a part of the HDMI CEC rework, posting separately to let it be
> > > > > tested by the maintainers.
> > > > > ---
> > > > > Changes in v7:
> > > > > - Dropped all applied patches, keeping just VC4
> > > > > - Link to v6: https://lore.kernel.org/r/20250517-drm-hdmi-connector-cec-v6-0-35651db6f19b@oss.qualcomm.com
> > > > >
> > > >
> > > > Can I please get Tested-by for this patch? It has been R-B'ed, but I
> > > > totally don't think it should be applied without testing on the actual
> > > > hardware...
> > >
> > > And another ping to get it tested by...
> >
> > Apologies - I'll find a display or AVR that supports CEC tomorrow to test.
> 
> I've only got a Sony soundbar here that supports CEC, but I can
> control the volume and mute status of that from the Pi, read the
> status back, and monitor mode is reporting power on/off events.
> 
> A colleague is going to give it more of a test via Kodi when he gets a
> chance, but I'm happy to give it a:
> 
> Tested-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
> 
> Sorry for the delay in doing that testing.

No worries, thank you!

-- 
With best wishes
Dmitry
