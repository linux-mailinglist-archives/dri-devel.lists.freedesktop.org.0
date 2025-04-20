Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C6F1A949F0
	for <lists+dri-devel@lfdr.de>; Mon, 21 Apr 2025 00:56:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 333FA10E16D;
	Sun, 20 Apr 2025 22:56:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="BSEymIiQ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 28F0D10E16D
 for <dri-devel@lists.freedesktop.org>; Sun, 20 Apr 2025 22:56:23 +0000 (UTC)
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53KMtHiU002637
 for <dri-devel@lists.freedesktop.org>; Sun, 20 Apr 2025 22:56:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 Xvn+40VSMfKHw9Atpx6GI08HqlWsAWGLqMxnAItzGRw=; b=BSEymIiQ8U8vArr6
 PqR3V49zLVY0ra5VQINsF37QoBq9acBK7YH/Rvb6opHudyuhQ6qRiiL2JDQjVgeF
 tJF7KHLN+UI/0BGXnB30s9kxFLvHC5gflgkRYcYPW8UmNCWg/Rj1N5nsbGQ5ZhiC
 wTxdxHZqVJGu/Ioo01HeLZWbf1CyQRMZeenzstYViFXy6Zub9vDzUD7/kZsYHQcJ
 EWpL+wsvu6qH5T/N93KrG5EH9Qf6XheBQnLtprZEo7dUFQJABn4zL3r07rj2/emP
 tEJm8LFIwf2Y5co6kfpI3DizRyJ1mt5+TETWTXTiuM1NvhNEZQblGMXH3Wd+NoY2
 SiRH1A==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com
 [209.85.219.71])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46450pae4r-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Sun, 20 Apr 2025 22:56:22 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id
 6a1803df08f44-6e905e89798so63361996d6.3
 for <dri-devel@lists.freedesktop.org>; Sun, 20 Apr 2025 15:56:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1745189781; x=1745794581;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Xvn+40VSMfKHw9Atpx6GI08HqlWsAWGLqMxnAItzGRw=;
 b=aNu1qu+Y+G7uCqWFAx+GKbjgD+l2wsigoO9tw3XVbTjtX95wDMM3AMX25UoFym6iFw
 wF59GwQuUwTdTlkHIQORgH/V2giN02mfeOKL/EoDsxnXGgCRYAvoA0ZsHmxfmcMb0uM5
 mewLGrL1HPt57iKqQ2ZSR5TW2VBPcbcaLGM9gheALifjmJi7+DW07wjOXJwXQzl7EHMJ
 4Rvotcz6Mm29Rt6bks68jwQv/qWorQj8TcaBVB7XotNbMEafy4S7H6Rv6S9jXZp2fUOX
 WC2dDSZUZjVaFRgET8Y1HzxLNcjR/2vnKExAcWI2zGxa6KrLrK5J6PuJOp8S6ea2hEs0
 ZyCA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWmalN079U6QtgZL5dPe60+s3EqB/tkhriu5LMEpnV1f7WZZpmpFwp1y2YObP41hcuvzNkHMmwkg7c=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwODZnE51dbagHeYqmNawNQvFGfxv3EzO+eh+PTRbHvLse5vuEi
 MiCkqRGgmwOqw6NHFSY3mg40LiIyIUTF4+qh8TYXw7aOkxEkfoTYlbpJhzWcgaP4a9m/RFKVC9T
 C5+Fih7j7iT2WwOoCG7w3vrETf5EzHVhyEn7cHwSCKCVylTYQE4CuPRfVeLvCBtJFod0=
X-Gm-Gg: ASbGnctg8kyi+0a2a3YveiqUYWZNK/nyVo5euAvyTv6MSLadrBPpXQbP9ndvLwZHaTy
 kZNE2j/rh/aDKa39a7utMplRo1Wq1Va8eLZhXrK3G+RykfBRJSDBQ8C6SAsy5aQyC9FQoc4Hce6
 tCabcDSTxrAOyoRuVtJo1oBb3XS8YLPB6rCcb66N5ErA87c8z3ZFSZLRC6nNLYEZZ/krKhzjyBQ
 2mz0ivIIJoMmgP/fBFO1d/Zd1vjva/+HY3+aZzT9bwpAgSA17CpzGfVJ7hRvFYeJvQrpS1Fm3mG
 nX/MGmuvbj3AbzznrK+BZwb1MMwlFg2v5fgzOd7qBjO/omt+FhbdvVxeN2L0ETubST/YN0qtRQw
 =
X-Received: by 2002:a05:6214:21e2:b0:6e8:98c0:e53d with SMTP id
 6a1803df08f44-6f2c46a07dbmr151565326d6.45.1745189781074; 
 Sun, 20 Apr 2025 15:56:21 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEfLiS9Q2SZkjbwKgidL/WAe6f7m5zfoiOXLznuv9bCK+P7PXy93vNK3MPMChR2OHq4BZDfTQ==
X-Received: by 2002:a05:6214:21e2:b0:6e8:98c0:e53d with SMTP id
 6a1803df08f44-6f2c46a07dbmr151565026d6.45.1745189780583; 
 Sun, 20 Apr 2025 15:56:20 -0700 (PDT)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-3109075e385sm10042561fa.17.2025.04.20.15.56.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 20 Apr 2025 15:56:19 -0700 (PDT)
Date: Mon, 21 Apr 2025 01:56:18 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Damon Ding <damon.ding@rock-chips.com>
Cc: Laurent.pinchart@ideasonboard.com, airlied@gmail.com,
 andrzej.hajda@intel.com, dri-devel@lists.freedesktop.org,
 jernej.skrabec@gmail.com, jonas@kwiboo.se,
 linux-kernel@vger.kernel.org, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, neil.armstrong@linaro.org,
 quic_jesszhan@quicinc.com, rfoss@kernel.org, simona@ffwll.ch,
 tzimmermann@suse.de
Subject: Re: [PATCH 1/7] drm/bridge: analogix_dp: drop extra calls to
 analogix_dp_prepare_panel()
Message-ID: <53fglsklfc62tlpcg6xcbnw5dssik6tntlabf6c34d4myzb444@f7oqsqhtpg4z>
References: <20250401-panel-return-void-v1-0-93e1be33dc8d@oss.qualcomm.com>
 <20250401-panel-return-void-v1-1-93e1be33dc8d@oss.qualcomm.com>
 <6b662c34-7a1d-4e07-aaa7-752bc0c7575f@rock-chips.com>
 <d0641e38-0d89-49ea-84c6-66707021406b@rock-chips.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <d0641e38-0d89-49ea-84c6-66707021406b@rock-chips.com>
X-Authority-Analysis: v=2.4 cv=Hd0UTjE8 c=1 sm=1 tr=0 ts=68057b96 cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=xqWC_Br6kY4A:10 a=8nJEP1OIZ-IA:10
 a=XR8D0OoHHMoA:10 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=s8YR1HE3AAAA:8
 a=1emaVgkjSvq9T-tW4EkA:9 a=3ZKOabzyN94A:10
 a=wPNLvfGTeEIA:10 a=1HOtulTD9v-eNWfpl4qZ:22 a=jGH_LyMDp9YhSvY-UuyI:22
X-Proofpoint-GUID: 4XKq2ssweqg8sh2LDNzeY6IDtkZzzPDl
X-Proofpoint-ORIG-GUID: 4XKq2ssweqg8sh2LDNzeY6IDtkZzzPDl
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-20_10,2025-04-17_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0
 priorityscore=1501 mlxscore=0 malwarescore=0 suspectscore=0 bulkscore=0
 adultscore=0 mlxlogscore=999 phishscore=0 clxscore=1015 spamscore=0
 impostorscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504200190
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

On Mon, Apr 14, 2025 at 10:01:16AM +0800, Damon Ding wrote:
> On 2025/4/14 9:20, Damon Ding wrote:
> > Hi Dmitry,
> > 
> > On 2025/4/1 13:11, Dmitry Baryshkov wrote:
> > > The analogix_dp_prepare_panel() returns immediately if there is no
> > > attached panel. Drop several calls to this function which are performed
> > > when dp->plat_data->panel is NULL.
> > > 
> > > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> > > ---
> > >   drivers/gpu/drm/bridge/analogix/analogix_dp_core.c | 22
> > > +---------------------
> > >   1 file changed, 1 insertion(+), 21 deletions(-)
> > > 
> > > diff --git a/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c b/
> > > drivers/gpu/drm/bridge/analogix/analogix_dp_core.c
> > > index 042154e2d8ccd74ac2dc27fe527e810a50e08a09..ab1cfc340aa95bbf13fe021bd33227b565a5458d
> > > 100644
> > > --- a/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c
> > > +++ b/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c
> > > @@ -1005,17 +1005,11 @@ static int analogix_dp_get_modes(struct
> > > drm_connector *connector)
> > >   {
> > >       struct analogix_dp_device *dp = to_dp(connector);
> > >       const struct drm_edid *drm_edid;
> > > -    int ret, num_modes = 0;
> > > +    int num_modes = 0;
> > >       if (dp->plat_data->panel) {
> > >           num_modes += drm_panel_get_modes(dp->plat_data->panel,
> > > connector);
> > >       } else {
> > > -        ret = analogix_dp_prepare_panel(dp, true, false);
> > > -        if (ret) {
> > > -            DRM_ERROR("Failed to prepare panel (%d)\n", ret);
> > > -            return 0;
> > > -        }
> > > -
> > >           drm_edid = drm_edid_read_ddc(connector, &dp->aux.ddc);
> > >           drm_edid_connector_update(&dp->connector, drm_edid);
> > > @@ -1024,10 +1018,6 @@ static int analogix_dp_get_modes(struct
> > > drm_connector *connector)
> > >               num_modes += drm_edid_connector_add_modes(&dp->connector);
> > >               drm_edid_free(drm_edid);
> > >           }
> > > -
> > > -        ret = analogix_dp_prepare_panel(dp, false, false);
> > > -        if (ret)
> > > -            DRM_ERROR("Failed to unprepare panel (%d)\n", ret);
> > >       }
> > >       if (dp->plat_data->get_modes)
> > > @@ -1087,19 +1077,9 @@ analogix_dp_detect(struct drm_connector
> > > *connector, bool force)
> > >       if (dp->plat_data->panel)
> > >           return connector_status_connected;
> > > -    ret = analogix_dp_prepare_panel(dp, true, false);
> > > -    if (ret) {
> > > -        DRM_ERROR("Failed to prepare panel (%d)\n", ret);
> > > -        return connector_status_disconnected;
> > > -    }
> > > -
> > >       if (!analogix_dp_detect_hpd(dp))
> > >           status = connector_status_connected;
> > > -    ret = analogix_dp_prepare_panel(dp, false, false);
> > > -    if (ret)
> > > -        DRM_ERROR("Failed to unprepare panel (%d)\n", ret);
> > > -
> > >       return status;
> > >   }
> > > 
> > 
> > With the patch series:
> > https://patchwork.kernel.org/project/linux-rockchip/list/?series=942183
> > 
> > When I verify this patch, there will be a small warning:
> > drivers/gpu/drm/bridge/analogix/analogix_dp_core.c:1075:6: warning:
> > unused variable 'ret' [-Wunused-variable]
> >          int ret;
> >              ^
> > 
> > It should be better to remove the unused 'ret'.

I can't reproduce the warning, so I'd like to push the series once patch
3/7 gets an R-B.

> > 
> > Best regards,
> > Damon
> > 
> > 
> > 
> 
> Tested-by: Damon Ding <damon.ding@rock-chips.com>
> 

-- 
With best wishes
Dmitry
