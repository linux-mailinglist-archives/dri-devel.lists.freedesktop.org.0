Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D9BAB44458
	for <lists+dri-devel@lfdr.de>; Thu,  4 Sep 2025 19:29:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4B56510E343;
	Thu,  4 Sep 2025 17:29:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="o5RlK2Nt";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 26F4F10E343
 for <dri-devel@lists.freedesktop.org>; Thu,  4 Sep 2025 17:29:16 +0000 (UTC)
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5849XDFs013673
 for <dri-devel@lists.freedesktop.org>; Thu, 4 Sep 2025 17:29:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 U4HSqJJKUJgHemW3ItHKzJuo91NgrXy7FmK7UmSqX0Y=; b=o5RlK2NtZhXh/To8
 HGTDqprDWTCdb3Uv0MLTr9XBz7AGVAOGsMBa924oyD28uRFBUguVz47Vw36w3aQ9
 GEjEmkSjFoNUz8vWNaaN2GFLT+kVidJB5ovdUoJQTMLGEbELElXfhtzCnjKzW8t5
 eCHjmdOIi5TyquYgcWdoVOGtCLXq6VghiCmoVz/grGWRXb8GolZV4V7AxMWSjOpB
 mIEzF43zpojRWkMG8fSqPZio0EAYteIbnGbx+aj04Rvnc3M7j9CfKA9gxMkyiUBg
 VqPICSnwK8LUk6M0aU4qGt0+CUj8wo8vC9cr6cZDFsZdCiWUa1ajlxo8EXoah1qo
 mGi45Q==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com
 [209.85.160.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48w8wyc9wj-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Thu, 04 Sep 2025 17:29:15 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id
 d75a77b69052e-4b5d5cc0f25so20088761cf.2
 for <dri-devel@lists.freedesktop.org>; Thu, 04 Sep 2025 10:29:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1757006954; x=1757611754;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=U4HSqJJKUJgHemW3ItHKzJuo91NgrXy7FmK7UmSqX0Y=;
 b=RUpOu9yvsL3n/IK9iTMPmNuFBQaJ0VW6KKKyKN5TWK+hEP4yYzMc1T3mE7iskgNlQu
 6+VZnzpLL+eju2om+jnJW2XOw9LjLOVTvR5XaVpyGKcF4hBRHwmFKA9vdR35ZOSjVK2m
 mk3Bdmw/i5DpdLrADQBYufhlW7n3WV+xL7KzT0jOBJn8ZuCRRXvtySjSznYpdOX7nIrh
 6RTzJM4XXj1gXsvpRGrgF5rxZVP4ifYI6PyEJSJDeN2tzTZ3wmpzn1NQjU4fIKQF7I5a
 3A6shzt+bEo4dov0QC67sLxwo7ORdrvQhTQ5xaXOeyKO4Q6pPpO/hDhhmfVnfFkA4/9x
 dHRg==
X-Forwarded-Encrypted: i=1;
 AJvYcCVmooeK+FX4vBRJyQp1QJIXPwF1bEhJyznoTA/9WK1RN8yOpxoixgqVWWrxrfQlTYi26HHobeU8/1k=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzTXtba9tN3cPi1AlUmf9FcrP2EWbESwgZQjU8JjVh7wpsJc3Ly
 YUauf+WiolmYRR6N4cp7/jjsatz72vU6mAW8E5OA/3s6TB1/v7yfsa6VEk5VVgIbU3xY1rQ33ok
 fcgbj+EniLN9qz65f+8E6btYVDSaHgcax6WV+D6z7/zlw9XZgJbkmCfiTPmpXSh/C1QR2c/w=
X-Gm-Gg: ASbGncup2i+8BB98O/mo1KizkUIwwJCbJdxsB4tM3mjZP+wLICkuPx2gG19sx4eo0dH
 wMqEY68NKsd/bD8wEDvJNUeEoREm/uOvfzt9eaaFXxkQPFdTvDkTm48yi/wSHb4Tm7Bhz6nfEPw
 8SfSq8MefFm+qNbYHClmDKCLyvApuJcuMAdWvegQFjte1suJW6yBYLWwYdhNEmfUz/afjZuck23
 s4ab7t91MEewRTkTmGd7wDaeCqYEC55lJNJdWyUluXdHR/rmymSwjA+zaV36EgrmqwYFRL41tPU
 jxxD8RALsBPLt4ZkE2lAxD2Uil6tw4GNO5PT2dJukek4Dra/kG9Y47w8Mbng344auVe0eERS+mv
 p5DFSuGC8a4k5hUyXHYDQ1MznulH40NBiol++c++tpS8gF/PKLML/
X-Received: by 2002:a05:622a:4e:b0:4b2:fbbb:cd47 with SMTP id
 d75a77b69052e-4b31dd1ffe2mr257449571cf.79.1757006949734; 
 Thu, 04 Sep 2025 10:29:09 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHNSvNTXAJpiFlDTiLw2UNIBHVhJ1puSDzs/X0PalMSkD4/kVf+SzhWlkUHsBE8oJ71Jpu99g==
X-Received: by 2002:a05:622a:4e:b0:4b2:fbbb:cd47 with SMTP id
 d75a77b69052e-4b31dd1ffe2mr257449121cf.79.1757006949162; 
 Thu, 04 Sep 2025 10:29:09 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-337f4c90454sm16554751fa.18.2025.09.04.10.29.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 04 Sep 2025 10:29:07 -0700 (PDT)
Date: Thu, 4 Sep 2025 20:29:03 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Jun Nie <jun.nie@linaro.org>
Cc: Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <lumag@kernel.org>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Jessica Zhang <quic_jesszhan@quicinc.com>,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v15 12/13] drm/msm/dpu: support plane splitting in
 quad-pipe case
Message-ID: <hzkvl7zyuq2fsavp2butdvbfykpzw5lz4f2eg2rzu4hgbxxq4j@tmoxnq2t5koq>
References: <20250819-v6-16-rc2-quad-pipe-upstream-v15-0-2c7a85089db8@linaro.org>
 <20250819-v6-16-rc2-quad-pipe-upstream-v15-12-2c7a85089db8@linaro.org>
 <xcq25wmw7roelcmoljypn3ozt7kqvylgibz2cloxghaeurcwvs@jjay7hton6md>
 <CABymUCNXVfZyhCbkiqzJ-K2zGe=bofD82OD20d-CG+a-KkgN5Q@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CABymUCNXVfZyhCbkiqzJ-K2zGe=bofD82OD20d-CG+a-KkgN5Q@mail.gmail.com>
X-Authority-Analysis: v=2.4 cv=Ycq95xRf c=1 sm=1 tr=0 ts=68b9cc6b cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=yJojWOMRYYMA:10 a=sWKEhP36mHoA:10 a=e5mUnYsNAAAA:8 a=EUspDBNiAAAA:8
 a=KKAkSRfTAAAA:8 a=oA6wIzCi5S8-5R6LlW4A:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=kacYvNCVWA4VmyqE58fU:22 a=Vxmtnl_E_bksehYqCbjh:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: nnkWQRrAv7j-s35UFGaMhYryFzVkA7R2
X-Proofpoint-ORIG-GUID: nnkWQRrAv7j-s35UFGaMhYryFzVkA7R2
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTAxMDEwMSBTYWx0ZWRfXz0v7IOR+nmu+
 INFG9FQGsiJP4d+U5dgch65U12/6ORTYW0mFLbx2/tQIuK2az4avvrAk/4PMkKzFH27/vDdtTg3
 WZmEbErFpCSvbb4JZVaG2O+mzCh94PsOY5nNdxNQAbeAcHuF+iTFed9v1dY9ys9NrXiWQpEixWC
 h1uVkc2WC0mJfoZCW6ggVa5MMjZnYCru42PPlikrYljEtKoJZtaT8dbpicMgLcLwkYv2skkGJaQ
 kPBelPO1Gl9XT7brydGiSiLzK1nU55vOVuyIFg4Uc8b7RV6dFRmasL4t7ogxnpo2bEjM5Y4debl
 QYKRKb+C+5dJAy9/grnkTmx3oScZ8L3fOLekw0WB0dmzUt//50aYCDkXIaMX9vId1BOzTAnbOtG
 HUt24OxG
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-04_06,2025-09-04_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 adultscore=0 phishscore=0 malwarescore=0
 bulkscore=0 suspectscore=0 impostorscore=0 spamscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2509010101
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

On Fri, Sep 05, 2025 at 12:09:52AM +0800, Jun Nie wrote:
> Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com> 于2025年9月3日周三 17:39写道：
> >
> > On Tue, Aug 19, 2025 at 09:31:06AM +0800, Jun Nie wrote:
> > > The content of every half of screen is sent out via one interface in
> > > dual-DSI case. The content for every interface is blended by a LM
> > > pair in quad-pipe case, thus a LM pair should not blend any content
> > > that cross the half of screen in this case. Clip plane into pipes per
> > > left and right half screen ROI if topology is quad pipe case.
> > >
> > > The clipped rectangle on every half of screen is futher handled by two
> > > pipes if its width exceeds a limit for a single pipe.
> > >
> > > Signed-off-by: Jun Nie <jun.nie@linaro.org>
> > > Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> >
> > I've run several CI workloads. This is the first commit which breaks IGT
> > tests. See https://gitlab.freedesktop.org/drm/msm/-/pipelines/1503075
> 
> Thanks for the work! I did test locally with all my patch set on sm8650 and
> did not reproduce the issue. The baseline is not aligned with msm-next-lumag
> yet because I need to port my platform patches to it. I will do it tomorrow.
>  Do you think this issue is related to difference of sm8650 and sm8350?
> Regarding all failure cases are write back related.

First of all, It's not only about SM8350. Tests also fail on SC7180.

Second, it's not about write back. I see various test failures. Please
rerun the test suite with virtual planes being disabled on SM8650 HDK.

-- 
With best wishes
Dmitry
