Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BF460B4081C
	for <lists+dri-devel@lfdr.de>; Tue,  2 Sep 2025 16:57:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 84CF310E77E;
	Tue,  2 Sep 2025 14:57:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="eu3j3OhN";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3BEA410E77E
 for <dri-devel@lists.freedesktop.org>; Tue,  2 Sep 2025 14:57:15 +0000 (UTC)
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 582EqCdo019600
 for <dri-devel@lists.freedesktop.org>; Tue, 2 Sep 2025 14:57:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=TsmfkgMBnp9SJQN3L5y7Bh9L
 sMiuyaGhK5Ns/kSaNZc=; b=eu3j3OhN8NE52GVbTnYhN5bolGpchquaY6Oo8k/l
 ZIq1js7kPg4ehpJhc5KyjfsJFAH4PuF77ImvKVVyLchpgfZVrYhzELTaL3Z9voCb
 omQZTL90PlEPBphxQuuykkCUPnLUzlNvsjDl5vSrGvOVrnwZMkmMk/5QU6a2iggr
 O/SzQYmNFf7PoYqZaaVSCk6DFHVh2V0r+iG6vvAfQ1Tq3KW/sCIrEe3hU5UTWcuL
 obseSgjLOqRVhF5dHpbiQuqVGnqB/No/IgASByuaos+JmEB5Ygs56lGJtSKKqoKB
 4uCxCvZP7OT+Ir/3FozajGUA06obmmqQ2nmw3djLIVI/5g==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com
 [209.85.160.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48urw0077w-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Tue, 02 Sep 2025 14:57:14 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id
 d75a77b69052e-4b3476fbe7eso17759971cf.2
 for <dri-devel@lists.freedesktop.org>; Tue, 02 Sep 2025 07:57:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1756825033; x=1757429833;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=TsmfkgMBnp9SJQN3L5y7Bh9LsMiuyaGhK5Ns/kSaNZc=;
 b=wfvoLiTCg9DBLSlFE3izGUKWCY/nEpwHaRsfiBj4vuHq3P/t2Z5IhKlItJZc0Lrznf
 LgsRArBkGEAlG9r9kab0IkhxvSCGJm1RXVSY5iRV5wIcUHGmJ/CoyZP+BMDiTVKYiSDG
 54cF8g78aiYaiNmb3BMGRC6Eh2A1I3ekMqKatgckM0CXrtCKVc9U2aRRwCc9HG7G0+Ue
 mPaQHg1v4kbbGH8YtTBLj2Uz1nwQYFkerQn66JGlT0tzNDe9PrQJVXNWTF+RxaMIb75i
 OsicCAY4vgXuTbHJXdAb7D5icmRZLrRSH/KrgLDlYm3htVq/88aA5amxNGywyhJjUS8l
 M/aA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWSWIuzJUSieFs/Y7BIUMSo26VAwgIpaeBNDbgg4NiP7AvgB6JD8rwvEFJ80GjfZAonVdM/K3dVSQQ=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxZwUEjWsupeNifXqGNiQ2ICU3RRNCM/fD6y/Aep2ZAUGNE2jCD
 xm6Eebg2cRNn8GsjQcn0L8PlYSYwS39AbRoz9NSu3WVq2f75x29suQh/+kasiBd+SGEhwtIs9rW
 5c18bZSKesFrdc9IIUPu9lD+gpIZOo+Y4YHElGy+9grCSiFKHgqHv/JMKE0ig3DBbdH3WNJ8=
X-Gm-Gg: ASbGncvMYAkq/aPlN2ok8gkbUg9q0O1hs5YA/2/u/N0fh/fZd9TrStLXsUKF93FrqBD
 xgCXyin9K/kgVOHerP/4rBxlcekk0/NIBez2RYgW8GMcGhVVrDwR+b6pkfxY3vWGBPpsPHc5hHP
 ERJLKNwI9dC9/oJNQpP8x50IeuVr6wabZb4g0ygIJQrfRFqXjdoRUmyLviOL9JS1Hat0uRerDhb
 4hjYFfaP9Vh3NeOW1T+poiVUBqYQk8OUTmblPbL6yV4VTKUNHHvgxilkbwdOCnjArtUCdfTu0Qa
 59pKtY0UrTRB4VgMOL/PrCQM7FzKSQrpLBvNwreYsTQQM+UsLgPupUzvhjt4/OI5RoJ5FiUYi8A
 ytq4+toCawXvk8p4B62YS0ZoDOfps+mREepPbI2Pcfi2lt1TxvSK0
X-Received: by 2002:a05:622a:1103:b0:4b3:9f3:8f86 with SMTP id
 d75a77b69052e-4b31da25423mr131231331cf.43.1756825033221; 
 Tue, 02 Sep 2025 07:57:13 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEZq3/yRV8lo2PEycPVb24whKPiXTRJq33EprBVrpg4tMMnhbq/xhljHZVKKCnnnAke8vRMXw==
X-Received: by 2002:a05:622a:1103:b0:4b3:9f3:8f86 with SMTP id
 d75a77b69052e-4b31da25423mr131230811cf.43.1756825032575; 
 Tue, 02 Sep 2025 07:57:12 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-560827b3ac5sm751954e87.147.2025.09.02.07.57.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 02 Sep 2025 07:57:11 -0700 (PDT)
Date: Tue, 2 Sep 2025 17:57:09 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Jun Nie <jun.nie@linaro.org>
Cc: Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <lumag@kernel.org>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Jessica Zhang <quic_jesszhan@quicinc.com>,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v15 00/13] drm/msm/dpu: Support quad pipe with
 dual-interface
Message-ID: <53z5v73r4ixmecpo6z3a6rnsmkgjjftbrwke24bf7mkr5ffh64@2viglv4lnows>
References: <20250819-v6-16-rc2-quad-pipe-upstream-v15-0-2c7a85089db8@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250819-v6-16-rc2-quad-pipe-upstream-v15-0-2c7a85089db8@linaro.org>
X-Proofpoint-GUID: 8n44vRLpCO5FlFiKEBWSbpDnu2b1VYUf
X-Proofpoint-ORIG-GUID: 8n44vRLpCO5FlFiKEBWSbpDnu2b1VYUf
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODMwMDAyNyBTYWx0ZWRfX1MItUZ+sUTKi
 Ap7M888MgZbg+mZfJCuTcUcW6gNp9WEIH74fLDWGvluLWMi5ep0EmQp8RiY/Xg2YBKBwpq9tIMP
 SQexM453RswrMCnO3IvWE4gcXl+JDHepVXffRVBVCXjhNTcUw8sJlS6HXmkklLmZs7ImvZ29aaN
 4jHmzwtjJGm/v8HEbnXehde0IYEmQnQyfnbrC5/gEn45kj7iMO7RQSZ760YH+nvS2HletJfaiW9
 CGVnc0yG7E3muLAmDe0gsM0apyB5+Y4cCZBOurlkFQDh+p35YPo504vUoo7Cs/JLxo6Z685fbFj
 AhOsqsgXWWXhiaVaNBEg714ZLPsVw6Xx+VIuCH7KsAkKWXsqihoPj1ayMnpPFLMnONsErCMb3ts
 LzVjLycf
X-Authority-Analysis: v=2.4 cv=NrDRc9dJ c=1 sm=1 tr=0 ts=68b705ca cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=yJojWOMRYYMA:10 a=VwQbUJbxAAAA:8 a=KKAkSRfTAAAA:8 a=e5mUnYsNAAAA:8
 a=NuLzGU6fH5aT33uQb0QA:9 a=CjuIK1q_8ugA:10 a=kacYvNCVWA4VmyqE58fU:22
 a=cvBusfyB2V15izCimMoJ:22 a=Vxmtnl_E_bksehYqCbjh:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-02_05,2025-08-28_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 malwarescore=0 priorityscore=1501 phishscore=0
 impostorscore=0 spamscore=0 bulkscore=0 adultscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2508300027
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

On Tue, Aug 19, 2025 at 09:30:54AM +0800, Jun Nie wrote:
> 2 or more SSPPs and dual-DSI interface are need for super wide panel.
> And 4 DSC are preferred for power optimal in this case due to width
> limitation of SSPP and MDP clock rate constrain. This patch set
> extends number of pipes to 4 and revise related mixer blending logic
> to support quad pipe. All these changes depends on the virtual plane
> feature to split a super wide drm plane horizontally into 2 or more sub
> clip. Thus DMA of multiple SSPPs can share the effort of fetching the
> whole drm plane.
> 
> The first pipe pair co-work with the first mixer pair to cover the left
> half of screen and 2nd pair of pipes and mixers are for the right half
> of screen. If a plane is only for the right half of screen, only one
> or two of pipes in the 2nd pipe pair are valid, and no SSPP or mixer is
> assinged for invalid pipe.
> 
> For those panel that does not require quad-pipe, only 1 or 2 pipes in
> the 1st pipe pair will be used. There is no concept of right half of
> screen.
> 
> For legacy non virtual plane mode, the first 1 or 2 pipes are used for
> the single SSPP and its multi-rect mode.
> 
> Changes in v15:
> - Polish logic in sspp check and assignment.
> - Link to v14: https://lore.kernel.org/r/20250801-v6-16-rc2-quad-pipe-upstream-v14-0-b626236f4c31@linaro.org

I tried picking up these patches into the msm-next-lumag, however they
seem to trigger a lot of IGT test failures. See [1]. Could you please
take a look at those failures? Note, virtual planes are still disabled
by default.

[1] https://gitlab.freedesktop.org/drm/msm/-/pipelines/1502582


-- 
With best wishes
Dmitry
