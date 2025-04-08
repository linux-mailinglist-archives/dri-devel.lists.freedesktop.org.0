Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CF580A80DD2
	for <lists+dri-devel@lfdr.de>; Tue,  8 Apr 2025 16:26:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7E8F710E6C9;
	Tue,  8 Apr 2025 14:26:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="n25rDri1";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8AD3810E6C9
 for <dri-devel@lists.freedesktop.org>; Tue,  8 Apr 2025 14:26:33 +0000 (UTC)
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 538AcPqn014098
 for <dri-devel@lists.freedesktop.org>; Tue, 8 Apr 2025 14:26:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=o7D2vba2qxhE/7GMEyr0f0Bv
 HKyDq1U5eu/ARQN9ZTg=; b=n25rDri1TWv46Bg1Cp7AjUKt6I+YtZTCNm2L0LpW
 z6MPXdCWz/S508/Cm0CfQ+VxWeRvyd2Vb5wuQwEuJPSuQjtOnFMa0fGZskTlVuTM
 xb6fihigjLAN6+DV9/cICW8Hpx2RYHxa5ABZpp6VIwh0LN7SvD+ACTArw5hTEdbt
 DBynayUyx9rJCQmrihffi8pjwQmgqlQUU9+0tASAYaCvXyQEcNuEz2vpscN9cKMB
 yFaeaE9uBR3DFh0945FrwEj5qmux09ySzCsxsHGgKE1pWxXEjCqafCkrgwsohoK9
 WfgNP1uo2vVqm2nBrjbJ843nn3l0nvpY5cWHe9riX2wJNQ==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com
 [209.85.222.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45twpm80gq-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Tue, 08 Apr 2025 14:26:33 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id
 af79cd13be357-7c5f876bfe0so941520785a.3
 for <dri-devel@lists.freedesktop.org>; Tue, 08 Apr 2025 07:26:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1744122392; x=1744727192;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=o7D2vba2qxhE/7GMEyr0f0BvHKyDq1U5eu/ARQN9ZTg=;
 b=SzH1qkm/HNxi1ZzZZWyMCmW3Z++WIR8+hKxnc8u9L9dc5z15GHt7xXCr1gloxrBZoV
 qjlGtJsD2pdCGnCnRfzMcQJWhsTdXlFpTS6wRwzgggiyAf3O9UCfzfbfr5bvBg/++cDR
 vdTgMxWpX6nKLGTxu2nuOi53lr9H3H/zP1Fr0CE9JLXHLLI/SNepbtGhR5r/+2ERj7ON
 AlwQc2o5VFEQEBOrc8n0Tq2TL2LQVGQYUFLwl7F5cbul0GHouUw4FHq5z9lAtVZ1rZJq
 1wQCYYAunwJPSm/9CFYi/j6rddK7gutQgLT8AFycGwwdOj+6A1oBj7k8m7tCm6F4Xbee
 mccA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVHFHrgx/ref42opaO2GIf74snGm8z9l6AAw8sjIoE/dLgJYuhkBBwzURIVvRPPVdzBdvo3eelq5G0=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwOnY4MhGQIXyVsi9tyNM00b4U7xO4+eFDkjemDMe4ymbCBL3tl
 3ZARXSvWtMFnsXvtLTB8nBXXqM2TQamiF2dJThzpEXH8E1Sjs7GdrzEFgykGM33HXq6XB731EpA
 lkb8PyYfttlORko7I/V2k8YsetLkafP38YJHMnAwUJJXFwr8BDp50AnKslgb+LMHWeKk=
X-Gm-Gg: ASbGncu1wUMP0sSCU1k/2A84OMH0mQvO1mDejLjfV/P2EPyMTsMAE4VKb8RFxCrxXIU
 gQV63iTPlr/+jXbjBR83TdGo0brfj91dhhTzOjEhOuKhhqWeZ064hYKhmnjszD2+8OOcCP0rAKd
 YUcnmv2aVLUoDvnOd2OLQ5CxrNB3Pel0AyOYHzmy/4uk0MVJrI9uSUZh090k1noqp+MjSR6N5bv
 Tf49s2EMmuj1AyrA6BXAzXo4fAsH9pp0OaR9yHQJW5R57qMQLlKJrF8R8jruRk+AX8dO6h5Pu/t
 ZaWsDiXDAsoHq+m/nu9y4qGjCMMpoSKkJPMq3YeAxhSiWmXIjHMhw91sTHL7qoYh0PJwjmU2sL1
 KFQg=
X-Received: by 2002:a05:620a:4409:b0:7c5:5584:dc1b with SMTP id
 af79cd13be357-7c77ddde0f5mr2556510885a.54.1744122391456; 
 Tue, 08 Apr 2025 07:26:31 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE1CXPNzIxksI1Sc/Nw+rGc934zFFHpftogdgR9xLiJV8g256P7E0nAw6VVDl0PG2vC6pWH7g==
X-Received: by 2002:a05:620a:4409:b0:7c5:5584:dc1b with SMTP id
 af79cd13be357-7c77ddde0f5mr2556501885a.54.1744122390721; 
 Tue, 08 Apr 2025 07:26:30 -0700 (PDT)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-54c1e65d526sm1528721e87.177.2025.04.08.07.26.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 08 Apr 2025 07:26:28 -0700 (PDT)
Date: Tue, 8 Apr 2025 17:26:27 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Jani Nikula <jani.nikula@linux.intel.com>
Cc: "Borah, Chaitanya Kumar" <chaitanya.kumar.borah@intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 "Dixit, Ashutosh" <ashutosh.dixit@intel.com>,
 Anusha Srivatsa <asrivats@redhat.com>, "Deak, Imre" <imre.deak@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Jessica Zhang <quic_jesszhan@quicinc.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Linus Walleij <linus.walleij@linaro.org>, Joel Selvaraj <jo@jsfamily.in>,
 Douglas Anderson <dianders@chromium.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 04/10] panel/auo-a030jtn01: Use refcounted allocation in
 place of devm_kzalloc()
Message-ID: <4ixxpk4shsva6ryut4vdvbsafuefpwhiydzb7f5gky2sbl7mkv@4nrigdhvz3z2>
References: <20250401-b4-drm-panel-mass-driver-convert-v1-4-cdd7615e1f93@redhat.com>
 <Z_P0A9lxWD0aAdjp@ideak-desk.fi.intel.com>
 <85a58rsgjj.wl-ashutosh.dixit@intel.com>
 <87bjt7eca8.wl-ashutosh.dixit@intel.com>
 <87a58re8hj.wl-ashutosh.dixit@intel.com>
 <854iyzs3na.wl-ashutosh.dixit@intel.com>
 <SJ1PR11MB6129F0A86E4A543021A636E6B9B52@SJ1PR11MB6129.namprd11.prod.outlook.com>
 <20250408-industrious-impetuous-wombat-f6d7dc@houat>
 <SJ1PR11MB61291B6DC29337864C59210FB9B52@SJ1PR11MB6129.namprd11.prod.outlook.com>
 <87o6x6yd5u.fsf@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87o6x6yd5u.fsf@intel.com>
X-Proofpoint-GUID: mpF4H8zfCG64ZCqTKs_ZTBl3W5FsY5G9
X-Proofpoint-ORIG-GUID: mpF4H8zfCG64ZCqTKs_ZTBl3W5FsY5G9
X-Authority-Analysis: v=2.4 cv=MpRS63ae c=1 sm=1 tr=0 ts=67f53219 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=XR8D0OoHHMoA:10 a=e5mUnYsNAAAA:8 a=QyXUC8HyAAAA:8 a=NtLb_cBUabAe4dSeclwA:9
 a=CjuIK1q_8ugA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22 a=Vxmtnl_E_bksehYqCbjh:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-08_06,2025-04-08_03,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0
 mlxlogscore=999 clxscore=1015 priorityscore=1501 impostorscore=0
 spamscore=0 bulkscore=0 suspectscore=0 malwarescore=0 adultscore=0
 phishscore=0 mlxscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504080101
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

On Tue, Apr 08, 2025 at 04:51:25PM +0300, Jani Nikula wrote:
> On Tue, 08 Apr 2025, "Borah, Chaitanya Kumar" <chaitanya.kumar.borah@intel.com> wrote:
> >> > We will need more changes than fixing the variable names.
> >> >
> >> > I get this error
> >> >
> >> > ERROR: modpost: "__devm_drm_panel_alloc"
> >> [drivers/gpu/drm/panel/panel-auo-a030jtn01.ko] undefined!
> >> > make[2]: *** [scripts/Makefile.modpost:147: Module.symvers] Error 1
> >> > make[1]: ***
> >> > [/home/chaitanya/exodus/repos/drm-tip-sandbox/Makefile:1956:
> >> modpost]
> >> > Error 2
> >> > make: *** [Makefile:248: __sub-make] Error 2
> >> >
> >> > after making the following change.
> >> 
> >> I couldn't reproduce this one on current drm-misc-next with arm64 and
> >> x86 allmodconfig. Could you share your configuration?
> >> 
> >
> > Here is the config that our CI uses
> >
> > https://gitlab.freedesktop.org/drm/xe/ci/-/raw/main/kernel/kconfig
> 
> There's
> 
> CONFIG_DRM_PANEL=y
> # CONFIG_OF is not set
> 
> but __devm_drm_panel_alloc is inside #ifdef CONFIG_OF. I don't know that
> it should be.
> 
> There are some stubs in drm_panel.h for !CONFIG_OF but not this one.
> 
> Finally, DRM_PANEL_AUO_A030JTN01 does not depend on OF.
> 
> 
> That's the issue, but I don't know what the correct fix would be.

I'l send a patch.

> 
> 
> BR,
> Jani.
> 
> 
> -- 
> Jani Nikula, Intel

-- 
With best wishes
Dmitry
