Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 99FB1AC6D9E
	for <lists+dri-devel@lfdr.de>; Wed, 28 May 2025 18:13:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6ED3610E679;
	Wed, 28 May 2025 16:13:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="UwxdCW0X";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 246E410E649
 for <dri-devel@lists.freedesktop.org>; Wed, 28 May 2025 16:13:19 +0000 (UTC)
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54SE5bsg028239
 for <dri-devel@lists.freedesktop.org>; Wed, 28 May 2025 16:13:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=9+Mg2L1QBDl92rjfoNAlCPsR
 ORQMv0jh6Aoaq4vKOlQ=; b=UwxdCW0XgvFtVccaGS3wRZ6akRXte2qSsXmoqoS3
 CltOgng+fdZ+KZBEyB+3rwrxvI1kx9hWfzVucFNG0jG+1P/3/YfAgBNOnsCuwPAn
 NoircCYqIk/Ho9mJ4V0Bnjb1lJO8uKPUjGEc/a5LA6G34uJOEzzPbjIYN0bS05EH
 acwSqBHb9nbin9wykrzk8bQWysYBmn77CnJlsHDrhZsFPKs2i1GSu+CWt1EzV67X
 gzSBuCrpzSgH2GSGfNirvmfCSqVWv3b7n6XhfRM9IfU4Nb7zkXTAnKyswsnjTLSB
 1hwh1gzQeW1oWJaL9oVceakOvOdG/hZCIfNDITan6IAs6w==
Received: from mail-oo1-f69.google.com (mail-oo1-f69.google.com
 [209.85.161.69])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46w992mvsf-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Wed, 28 May 2025 16:13:18 +0000 (GMT)
Received: by mail-oo1-f69.google.com with SMTP id
 006d021491bc7-6049acdc5c5so3354975eaf.0
 for <dri-devel@lists.freedesktop.org>; Wed, 28 May 2025 09:13:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1748448797; x=1749053597;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=9+Mg2L1QBDl92rjfoNAlCPsRORQMv0jh6Aoaq4vKOlQ=;
 b=SCW6N7o8Zq+vxT41NBE+FMozRMK4N53LfkVssmiUDquGN8h5d0XcwY+khaUIDZuEJk
 S7/qCjfcUpq/d3ejIIV2avifsz9voGxS8IayJJ125X7r1YIyn6YMeKnaUTPl0vAHVDzP
 dnmnj+0m1t6lUa0/+xOeEP6tKKpfx5ro3rg4B/E14kROeWRNfnaC5K9u+DstHOSQqypP
 ZsGO3gz+j761GbIffnGMXnRRUZL376PkRpxL+QQwrMMh1BJgi24YDLTo8W2uZ5Wdp8F2
 je2wo1cpC2Ekjok3SvxUVKffwFyw8swnibfi4q7gO/2YAIMn8GcQLPlHuXnr9XEMElhL
 HiaQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWrIFoO1YyDQHPMq+4/UJr2KPPV1VQbiqGvDZULSKyo4E/BQii8siqNR19whfUJheVk6Ox/e8Wz7bg=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyPC/P1HmWRV6IFAmMePbQ62ABQdGhH1Za98tl5ZwA6uIaeRnCZ
 INL7ZGz8AkYMQsv5VY68ECSfJj41cJuvxU2H30NqFYe2hgAEkrFLH1JKxno0DL5M/zXHRWIfbRC
 r4/knwiJJdsiAMI6gVdGe1JeSu1M944MWnmvnEDT/amXGh2J1ErdbpiJaVP90w6JS0+FCj64=
X-Gm-Gg: ASbGncsignZq/8zv/VkIeIFIkjHOjQqLrTpShbHsBVk+PpBLSQ39cJMfev0ufM+IP/c
 jIUawl48rA6YcbYiD6f3+fCOvW8s3z8YFjlhi5+c9GrM9upHf0oxdhON27QgYH3iReyD3q2j8NB
 Nu1fZss3tZV7Ei+MW9fa/MqbS28fMmv03B1Nc/pBYTCn8jEE7NYkWGqgjTewaD3o1GHO/qC3/XK
 Rp7xd4R4w9DSHdetTd2UWD61xvspC/3X99H8tz+NolqO6mQFpxypUqTH8dzOMaEM9m2oh5Wpv3c
 sBhYSpP/dg45NFo/wrjlHDM6Xy/+1SPFVafemj+jCVVdlhoSnZJnOC7il1GPF6PA+3aOP2z5NNg
 =
X-Received: by 2002:a05:6808:11d1:b0:406:67b7:8b62 with SMTP id
 5614622812f47-40667b79907mr1137204b6e.38.1748448797369; 
 Wed, 28 May 2025 09:13:17 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH7kOaXTktpHw46oOtWRKpilwDLDgGTq8IbcVMN13DgegxQWs9io4EyuZpQO8J6P6zyCxUueg==
X-Received: by 2002:a05:6808:11d1:b0:406:67b7:8b62 with SMTP id
 5614622812f47-40667b79907mr1137186b6e.38.1748448796931; 
 Wed, 28 May 2025 09:13:16 -0700 (PDT)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-32a79e9a765sm3031921fa.10.2025.05.28.09.13.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 28 May 2025 09:13:16 -0700 (PDT)
Date: Wed, 28 May 2025 19:13:14 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Yongxing Mou <quic_yongmou@quicinc.com>
Cc: Abhinav Kumar <quic_abhinavk@quicinc.com>, Rob Clark <robdclark@gmail.com>,
 Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Stephen Boyd <swboyd@chromium.org>,
 Chandan Uddaraju <chandanu@codeaurora.org>,
 Guenter Roeck <groeck@chromium.org>,
 Kuogee Hsieh <quic_khsieh@quicinc.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Vara Reddy <quic_varar@quicinc.com>,
 Rob Clark <robdclark@chromium.org>,
 Tanmay Shah <tanmay@codeaurora.org>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 Jessica Zhang <quic_jesszhan@quicinc.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Subject: Re: [PATCH 05/45] drm/msm/dp: add a helper to read mst caps for
 dp_panel
Message-ID: <abxm6ppegxbesl6wztyxg46elhanh2mo5kxn43olbucw37cyon@aeqikyr4ord5>
References: <20241205-dp_mst-v1-0-f8618d42a99a@quicinc.com>
 <20241205-dp_mst-v1-5-f8618d42a99a@quicinc.com>
 <aksnudxy2oyojjzwm73i4mulftcxccdsnddcdamypmscn6skpq@ijtp7x76m3pt>
 <df3807e5-c381-4440-be64-9bd49a2ecd9d@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <df3807e5-c381-4440-be64-9bd49a2ecd9d@quicinc.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTI4MDE0MSBTYWx0ZWRfX5gKvZWHs2Hje
 S6EvNOngvBnl/Rt5fDfMFrA7tjtfHGIMAknwrg6MjTg0DjEdAhorh4QJuixAxJy+SlVvbZM7+P0
 iECX6ucfC+1N+pjYoqWIqdjw7EBCRa31ZNTo5vOsOLqOK2RP9zHoFO/PgKr4j99LyvcpfMAzSbX
 OL4bTuxO16Lk7dGxVvVb3KdZCAWu7/58Taa0WseoKuOCI2EMWDTFWmC9ICBwWVHBKi3GOSPGW30
 /i32taiC6Jzhn2/IBwuGQGmULCtNzimy2pltNBf5hC1TsTFliLiaa/f5Che/euf1MI1xorovobD
 58VXmfUAT+ujiz2Bse21ZYXBnT21f7TGmUp+N90u/YMGNUbcOTBfxsU+AmBO3P248ijWKFrpElY
 MD7h/KwQMOscbj44F0HQO7Ulk3ai1tXgwvcSgHelg6elm4yTLTE+bSBY2oK9++oCFy4HXSeH
X-Authority-Analysis: v=2.4 cv=Fes3xI+6 c=1 sm=1 tr=0 ts=6837361e cx=c_pps
 a=lVi5GcDxkcJcfCmEjVJoaw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=dt9VzEwgFbYA:10 a=COk6AnOGAAAA:8 a=_S4K8tOYiQSLrvZx2BEA:9 a=CjuIK1q_8ugA:10
 a=rBiNkAWo9uy_4UTK5NWh:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: W2bcTfEy2ovaXJc7poxnDBAJdq9-162v
X-Proofpoint-ORIG-GUID: W2bcTfEy2ovaXJc7poxnDBAJdq9-162v
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-28_08,2025-05-27_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 malwarescore=0 impostorscore=0 phishscore=0 clxscore=1015
 lowpriorityscore=0 bulkscore=0 priorityscore=1501 mlxlogscore=999 spamscore=0
 adultscore=0 suspectscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505160000
 definitions=main-2505280141
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

On Mon, May 26, 2025 at 08:26:47PM +0800, Yongxing Mou wrote:
> 
> 
> On 2024/12/6 16:52, Dmitry Baryshkov wrote:
> > On Thu, Dec 05, 2024 at 08:31:36PM -0800, Abhinav Kumar wrote:
> > > Add a helper to check whether a dp_panel is mst capable.
> > > 
> > > Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
> > > ---
> > >   drivers/gpu/drm/msm/dp/dp_aux.h   |  1 +
> > >   drivers/gpu/drm/msm/dp/dp_panel.c | 14 ++++++++++++++
> > >   drivers/gpu/drm/msm/dp/dp_panel.h |  1 +
> > >   3 files changed, 16 insertions(+)
> > > 
> > > diff --git a/drivers/gpu/drm/msm/dp/dp_aux.h b/drivers/gpu/drm/msm/dp/dp_aux.h
> > > index 39c5b4c8596ab28d822493a6b4d479f5f786cdee..cb97a73cdd6ea74b612053bec578247a42214f23 100644
> > > --- a/drivers/gpu/drm/msm/dp/dp_aux.h
> > > +++ b/drivers/gpu/drm/msm/dp/dp_aux.h
> > > @@ -8,6 +8,7 @@
> > >   #include "dp_catalog.h"
> > >   #include <drm/display/drm_dp_helper.h>
> > > +#include <drm/display/drm_dp_mst_helper.h>
> > >   int msm_dp_aux_register(struct drm_dp_aux *msm_dp_aux);
> > >   void msm_dp_aux_unregister(struct drm_dp_aux *msm_dp_aux);
> > > diff --git a/drivers/gpu/drm/msm/dp/dp_panel.c b/drivers/gpu/drm/msm/dp/dp_panel.c
> > > index d277e9b2cbc03688976b6aa481ee724b186bab51..172de804dec445cb08ad8e3f058407f483cd6684 100644
> > > --- a/drivers/gpu/drm/msm/dp/dp_panel.c
> > > +++ b/drivers/gpu/drm/msm/dp/dp_panel.c
> > > @@ -108,6 +108,20 @@ static u32 msm_dp_panel_get_supported_bpp(struct msm_dp_panel *msm_dp_panel,
> > >   	return min_supported_bpp;
> > >   }
> > > +bool msm_dp_panel_read_mst_cap(struct msm_dp_panel *msm_dp_panel)
> > > +{
> > > +	struct msm_dp_panel_private *panel;
> > > +
> > > +	if (!msm_dp_panel) {
> > > +		DRM_ERROR("invalid input\n");
> > > +		return 0;
> > > +	}
> > > +
> > > +	panel = container_of(msm_dp_panel, struct msm_dp_panel_private, msm_dp_panel);
> > > +
> > > +	return drm_dp_read_mst_cap(panel->aux, msm_dp_panel->dpcd);
> > 
> > So, it's a one-line wrapper. Do we actually need it?
> It beacuse the point of aux is in msm_dp_panel_private, so if we want to
> call drm_dp_read_mst_cap in other file, we need this wrapper.

It is being used from dp_display, which also ->aux pointer.

> > 
> > > +}
> > > +
> > >   int msm_dp_panel_read_link_caps(struct msm_dp_panel *msm_dp_panel,
> > >   				struct drm_connector *connector)
> > >   {
> > > diff --git a/drivers/gpu/drm/msm/dp/dp_panel.h b/drivers/gpu/drm/msm/dp/dp_panel.h
> > > index 7a38655c443af597c84fb78c6702b2a3ef9822ed..363b416e4cbe290f9c0e6171d6c0c5170f9fea62 100644
> > > --- a/drivers/gpu/drm/msm/dp/dp_panel.h
> > > +++ b/drivers/gpu/drm/msm/dp/dp_panel.h
> > > @@ -67,6 +67,7 @@ int msm_dp_panel_get_modes(struct msm_dp_panel *msm_dp_panel,
> > >   		struct drm_connector *connector);
> > >   void msm_dp_panel_handle_sink_request(struct msm_dp_panel *msm_dp_panel);
> > >   void msm_dp_panel_tpg_config(struct msm_dp_panel *msm_dp_panel, bool enable);
> > > +bool msm_dp_panel_read_mst_cap(struct msm_dp_panel *dp_panel);
> > >   /**
> > >    * is_link_rate_valid() - validates the link rate
> > > 
> > > -- 
> > > 2.34.1
> > > 
> > 
> 

-- 
With best wishes
Dmitry
