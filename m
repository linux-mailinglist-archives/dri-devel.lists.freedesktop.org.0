Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 407A0C5B44D
	for <lists+dri-devel@lfdr.de>; Fri, 14 Nov 2025 05:10:40 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 52B6510E9A0;
	Fri, 14 Nov 2025 04:10:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="mSi4Yuw3";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="FYrJq8wT";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1217810E99F
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Nov 2025 04:10:36 +0000 (UTC)
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 5ADMbF2k1497489
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Nov 2025 04:10:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=crP9H9A4OcxAdHeYBDCioqy1
 FA03fE0Brnx4WcqsdO8=; b=mSi4Yuw3Zykfknp8ri+j5F8O/r3CUUMYtJehaVrZ
 s9UZm8BvQtKUNoDJGqI7M2xBBb8P4yUkf13VHfyHHtGOltqpoOg1ZIR3IvIcbhBk
 IW39H3CSBnlLqKQbNgf3gP2bgcCsnzXdbhs9inJCIn/3UgXSIzVJ4MvIfwj9OzMF
 +FzwF8WsWiP5XDktwsu3xvUPsgbbpT3qz7UfPWT2tX9iUVNO00EqpCz19RrGoxxo
 TZz9mMCr0Jh3aUz3rr3PX++Nlfn4LqMOAjz1sUO91Z9Iji0R1ez/soV6A41VGUcB
 hGuSWvLNUH4QlPJnCKmnEq+0wZqbWvmgzsuBXRzT/NmnkQ==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com
 [209.85.160.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4adr9hrrhx-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Nov 2025 04:10:34 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id
 d75a77b69052e-4ed782d4c7dso34474661cf.2
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Nov 2025 20:10:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1763093434; x=1763698234;
 darn=lists.freedesktop.org; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=crP9H9A4OcxAdHeYBDCioqy1FA03fE0Brnx4WcqsdO8=;
 b=FYrJq8wTBK0QmhJ4/2R/TkerdGWLeHD8QBiF7hkJKI4F2pOjVbQP2rpUSY4zRVy7ym
 qXJ3FefzkSlKE+oWncdJpbGnCFmcckSRr6ucLpnrZe0KjG6+cI3onz0ViSbc13IOXuKv
 oaM5QieUfuVmf4JB5EMAoWQXIwA6POgRmwJPc9wEDoD2hJH4oEQ93JhOXubTrr6Pgw60
 Q/4uuCHz5TO5AX4GBdcDhm8cP+aW0D8vUX1IqVHnN+oZj3jPxsuxX3md3I4XBhEa7MpS
 GfHGIDomW65ONtGpYfgl6JAMl7+1ChRNiLiV98+6ajRnMI5N5gQuzwb4PpfESSfYOaS/
 QRNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1763093434; x=1763698234;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=crP9H9A4OcxAdHeYBDCioqy1FA03fE0Brnx4WcqsdO8=;
 b=LRMxP5/8Fmmdd1JNFmLdLtR4mZYdmxF/v2Ujk2tAWmEaNu1XFV2q6KbkBJUe5Z8yVP
 etvUM1F9x6gL1uEkh3Mxrgxnkn0Scb32R5DLwQZ+06n+RA1uOc2coMgza9rMjiu4J507
 GRi5/lmgszb0sskyk87UqlH5pBOvp1QDEyOge5IJyz4j6ZZpb96Dbrro/BZ70nN2wKZ3
 w3fB1FSost9y7pzl1VDpzcbQ2EBCPVPsbtOTGJFYWawY1kImBqTn+bIEofMZcR+ggiKz
 DOTi6xu61AQl44i0qOsxgTOfvhU7OYozLT5Vig7m0G6CYMvuHhQx4dF5Pn5b7WTcBCCC
 n+sA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUH9cCnvlSUSM3+WU1lh7Dxw6we2tGVzaL58YkP4wFipGQll3JflyTueQOb60Qs6mUiYV2xwjNWJd4=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwICc3pp2pkKkFRG2s87o1brYcjdk62e2wVnsP8u838Bh2QnoUx
 9Gc3wGl/Spbc2TgVST7glldrMOx6WvoBN4TLFo9DqtwgYSd3KeoiWsCMaH41sLKl1R010XENT91
 mFDW7JtZazGMCrlOGwJyJX0IM8BAD503cCvnJN3tGpOga8u4U+89VJA58+6JuMIOtMADdsfA=
X-Gm-Gg: ASbGncv8UaGALXXN2m1V5tutXGb4lGW8hxX6TKmGMTaismEr2op6RKy7Wio+9vIIiNn
 8PQmpdtFCrhIdeNocE8o+dTPB+4TVdBzjTNJYszgbpwAvagUvCuuI/tAkRYI8rYlCgrg3LyqkuI
 pyO0h2UnwgYw6wieK++3KUVnvGUTZGdi7MBE/N8sIaaeRszXEJnN9Yk69Svbjnpj7rymutVcC5Q
 +xSW/VJAvblGpiViyS5HUH/oGKO7joQb9AATBY6rPVAeBmldw3u4EHVhUHtERw/MOooTBccBjYu
 xzvSHkeqqkO2RIiMo62lCHGUdJHf2C0O0+dWcGqF2nAjuwdMlGWsUL7U+CrsmBkpmtcHwTCKAg0
 nwoX0gQujbwic+v0VglrPV+VdnAeo/3TLxqUBZz7BcC2VKLsgjchS94pVvfbu7aBjEA7zTSRoqJ
 YhKioT+aAoXrjw
X-Received: by 2002:a05:622a:101:b0:4ed:1ae1:5390 with SMTP id
 d75a77b69052e-4edf20548bfmr28626601cf.18.1763093434137; 
 Thu, 13 Nov 2025 20:10:34 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHkrItC4byFnxIb/MoLRr+P54Wcvm8Kw5FEvzyr+iEPn+IuRhxLLOuNt9CdpWzfVeAdyLyKdA==
X-Received: by 2002:a05:622a:101:b0:4ed:1ae1:5390 with SMTP id
 d75a77b69052e-4edf20548bfmr28626361cf.18.1763093433637; 
 Thu, 13 Nov 2025 20:10:33 -0800 (PST)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-5958040d89csm781380e87.107.2025.11.13.20.10.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 13 Nov 2025 20:10:32 -0800 (PST)
Date: Fri, 14 Nov 2025 06:10:31 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Teguh Sobirin <teguh@sobir.in>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] drm/msm/dpu: Set vsync source irrespective of mdp top
 support
Message-ID: <w3fffuitwki7imcpc75m2e5kv5fpg5nj6udpxytm55kqa4mkud@rkl2ywspwm5y>
References: <TYUPR06MB6099CBBE5090DB12A2C187E3DDFDA@TYUPR06MB6099.apcprd06.prod.outlook.com>
 <ukz4djjytsne3y2w3epkdc7gzegmeeijpcqblvftcx73ccs43p@es6b4ew4nrzx>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ukz4djjytsne3y2w3epkdc7gzegmeeijpcqblvftcx73ccs43p@es6b4ew4nrzx>
X-Proofpoint-GUID: aHo7h4UVhlJ8jyx6AZOPwF4FEYyUmo6U
X-Proofpoint-ORIG-GUID: aHo7h4UVhlJ8jyx6AZOPwF4FEYyUmo6U
X-Authority-Analysis: v=2.4 cv=N+Qk1m9B c=1 sm=1 tr=0 ts=6916abba cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=UYdELWV9MdadiCxCyV8A:9 a=CjuIK1q_8ugA:10 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTE0MDAyOSBTYWx0ZWRfXybqzsiYHQAqE
 rYz/5ydioIyNAopiWf1hbrxS+fyGlQEuY6HnHxlSOBjwhHBsaUfeymZmZokXYyBJH7kqzAVdxn6
 9ivJoUdrzlLpdraJHC935vEzp193DExSJKV+tHi8l3DHRwcgxm6Iz30AlxZ59gAWZhQuh/KqPel
 fcIm0TDN7QqalohVwcwSROCodyvnUJXjp9BXZumZIK3wafw/Wh5dzc2WNYCsxXJw6afkg3XY6Ig
 FLO2+PrWESq2cD+lV+Xs3Ysv7foZ1ktf6F8/7ewBqBeQrN7Wgms/wdhkTQRBuue8wuOyBl7h4TT
 Kx7/q1ZjBbrBN7ymHCVzCXaes928JAbpIrd3PJchS9lmjym+FD+qn33mWtX+DFgvMeCuIMwgpaU
 AbqjRFrgDibtIFf5W3AkVGTVAqSycA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-13_07,2025-11-13_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 priorityscore=1501 spamscore=0 suspectscore=0 impostorscore=0
 clxscore=1015 malwarescore=0 bulkscore=0 lowpriorityscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511140029
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

On Tue, Oct 28, 2025 at 07:02:28PM +0200, Dmitry Baryshkov wrote:
> On Tue, Oct 28, 2025 at 08:36:35PM +0800, Teguh Sobirin wrote:
> > Move the loop over phys_encs outside the
> > hw_mdptop->ops.setup_vsync_source block.
> > This way, vsync_sel() is called for each interface.
> > 
> > This change ensures TE vsync selection works
> > even if setup_vsync_source is not implemented.
> 
> Please see Documentation/processs/submitting-patches.rst. Don't describe
> the change and pleasw wrap the commit message on 72-75 chars boundary.
> 
> I can suggest something like this:
> 
> Since DPU 5.x the vsync source TE setup is split between MDP TOP and
> INTF blocks.  Currently all code to setup vsync_source is only exectued
> if MDP TOP implements the setup_vsync_source() callback. However on
> DPU >= 8.x this callback is not implemented, making DPU driver skip all
> vsync setup. Move the INTF part out of this condition, letting DPU
> driver to setup TE vsync selection on all new DPU devices.
> 
> The patch itself looks good to me.


Teguh, any updates on the patch?

-- 
With best wishes
Dmitry
