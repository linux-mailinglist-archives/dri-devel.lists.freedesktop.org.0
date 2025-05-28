Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EAB5EAC6DBA
	for <lists+dri-devel@lfdr.de>; Wed, 28 May 2025 18:17:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 59CE610E676;
	Wed, 28 May 2025 16:17:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="HQG8jL2K";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8690310E682
 for <dri-devel@lists.freedesktop.org>; Wed, 28 May 2025 16:17:20 +0000 (UTC)
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54S748Yf003397
 for <dri-devel@lists.freedesktop.org>; Wed, 28 May 2025 16:17:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=VxpVLFBQGSAU+ebxYoQdGVlC
 qZnUme8PP63pkL+w6mw=; b=HQG8jL2KEaz3iRI7+/X70BOGq0pySi6cBM+txh6p
 wwfS2VZ87Whfg9qHLepHGDouRDd+QwZHiq2TCtS3T5HrXpxyPZ4/QUEwG1Qq0fTy
 qcwoRgB2BVUHGd1rP6AjofhexVwRmoH7LbceKGqCzOdnpXm4PGvlkanS/+sB/21l
 axt1rK1+T7z6M6WJy+zTGfImJxTbM9Zpgoh/siYhtXDu0qbQdbOslqAp7G76ml6j
 rDYYX8YwkfBsRCS90CxTlvEEhsz+yeiw4L+z0UiAOa12GFDZdpmpBLl2LvL3snPu
 yQUgCx/hRIHs2NMtJdRMO9qC3SM5ZBbcgDo7iq6hVtIgHg==
Received: from mail-ot1-f71.google.com (mail-ot1-f71.google.com
 [209.85.210.71])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46wavkvmmb-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Wed, 28 May 2025 16:17:19 +0000 (GMT)
Received: by mail-ot1-f71.google.com with SMTP id
 46e09a7af769-734df68e9f3so3845455a34.2
 for <dri-devel@lists.freedesktop.org>; Wed, 28 May 2025 09:17:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1748449039; x=1749053839;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=VxpVLFBQGSAU+ebxYoQdGVlCqZnUme8PP63pkL+w6mw=;
 b=c+8AHhstBJmQpVQfgqN86HfVY2PXE+OHNvsenBAxNIRiMCYH4EGntGXOJjXPksxrMz
 1RCbNSnHQxKs/Po6IBba6YwnnGpfrrHrlhIV73lCUQ+D05F7niIvG4Xwj1v9Ieoat+GH
 rvhJ1STh6+D4bAxNluKj62QBvJWQe6ETt5zH7lFVQfv9uER1Knuots6IPxI4Ls2/9WE9
 +Fia9QpI/XE+bb80tv3dBn+Y2XHgr3POzO8ZGAC92UR94ItB4Rt4bhMgb1Y038pseQzw
 6rGX/FFBXEckEmk/APnDU80mOZ34R7/SKvZRnOqeD/TVdSWn8qD3FDwBIHSKLm1ukILG
 u9Qw==
X-Forwarded-Encrypted: i=1;
 AJvYcCV87HPQHZJ0XvncCfvpZ37cvyDaVS1h0rrXMyBhpTvXEsQsttye7AiVwgBfwTU/PL9RrLfBq0JfI2I=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwmBogWQDIjYtK4vZftAmsO4gUAWaQhI7eURy/ZyWESOKLB/Pog
 BovlDMntKOJVZtdLkqnu882XH/DnyhbJUwycZaNvZm2q0ouKS1I1aL82FTd5S0xqAc4+0zkdg1h
 YVoIbtWoHLMtq4ZhIU+GHk+iiXtQnfdsSslbknslXVfTVpxoJJhjomgks0e75n1rhWpk1l5I=
X-Gm-Gg: ASbGncs11uOBVnFtwvehJEfWyVeZxCWoNE+YTCtBs4TgJJ10t5Io00Gm+DDRAf3g741
 2NQPnv5TTlG0abYi8K+ES66jptO7rS5J215CDjsWIpU6BVHcLreZEu0MeToAWntFj9GcwxLSof3
 HHBza/3lTodwgkr/5pYXG2fsyaEWUcEtwdbfdhF1/ssFUeuw0/Wd9kgdOdFeOwuOeUfnO6yvgoj
 Lg+lzD6ZJ4sv/3oKNEp3y7Q/MaSxOJjtQPcTgsgbpRYHXPsIi1kJXilwwMKFUMQFLG6XChvX5Q8
 /ZG490+elwptrNehLOEmiLNgsubls0bjxCApF5waRwi6LBEnjKbwGZuPZ3wmngQQadDt1fKgZSc
 =
X-Received: by 2002:a05:6830:7010:b0:72b:8326:f0c7 with SMTP id
 46e09a7af769-7355d1ca50emr11492056a34.28.1748449038806; 
 Wed, 28 May 2025 09:17:18 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHymD5QPdG3sq4BRZVWcnUYrodeFvRGV9A9NykcrdI34F0kJ6xyyBvUoKiYlRqJdH2mRLZZDA==
X-Received: by 2002:a05:6830:7010:b0:72b:8326:f0c7 with SMTP id
 46e09a7af769-7355d1ca50emr11492023a34.28.1748449038359; 
 Wed, 28 May 2025 09:17:18 -0700 (PDT)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-5532f6b39dcsm340216e87.215.2025.05.28.09.17.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 28 May 2025 09:17:17 -0700 (PDT)
Date: Wed, 28 May 2025 19:17:15 +0300
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
Subject: Re: [PATCH 17/45] drm/msm/dp: use stream_id to change offsets in
 dp_catalog
Message-ID: <ujrlphqfh6j6n2qz7wslapidmwacnj32cgdhwahmqpjpylmmk4@daraslg4fdk3>
References: <20241205-dp_mst-v1-0-f8618d42a99a@quicinc.com>
 <20241205-dp_mst-v1-17-f8618d42a99a@quicinc.com>
 <45awcx2az5m5v4etpuaycqx2dolzjkrcjg6ehmooivwuqb6ac3@euo7rsoccqup>
 <187d55f0-f4ec-4d5e-a449-708ebed1ab45@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <187d55f0-f4ec-4d5e-a449-708ebed1ab45@quicinc.com>
X-Proofpoint-GUID: z_oeEpD1OF4HGJpDoIwzCek6HXTscVT9
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTI4MDE0MSBTYWx0ZWRfX3LD2Go9iSaVL
 ReCxW8j12BPrALJf4bV7oenNz83PAb6xX+M6AifqprOmgWAEnnoyH2NoycTqZLkYufp5JiBLMIF
 Gy4/gMEB1GlAY6Sm95Qb/3zxcwtTw5aL7QQ1MHijpwp1Vo9lvHGd8WhzTCBNQrPoqDMTmp14qMS
 bE45V7Aq/apRECu0PlYr6M011qMQBVuFqZqzh9vhbqVHJtfMFR7t0UFDi2nzkpFvc7hGpunWrPm
 Y5Hm62JamYu9wUV1fWTbZoyUEToz7wtw30fymmhvNGRdP5RWr+FyDV+fnnob1BDS/hKUvi+UB1K
 +yZlUVXDCCcytUE7WL6HIIC/ocGVhLtzJeTrzt06Qe/IduNe+LOMbsH9rcEMjaq/o8xOHciXhlx
 VvQCqVUkv99ZaqKWsT8SIxa3CKpl0ClT0nitm/n3FLDYGCGcZt62WpJMs3eiS3VAykbj7shc
X-Authority-Analysis: v=2.4 cv=fMk53Yae c=1 sm=1 tr=0 ts=6837370f cx=c_pps
 a=OI0sxtj7PyCX9F1bxD/puw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=dt9VzEwgFbYA:10 a=COk6AnOGAAAA:8 a=aWFAwB44HXOIBnsjnyQA:9 a=CjuIK1q_8ugA:10
 a=Z1Yy7GAxqfX1iEi80vsk:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: z_oeEpD1OF4HGJpDoIwzCek6HXTscVT9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-28_08,2025-05-27_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0 impostorscore=0 phishscore=0 suspectscore=0
 spamscore=0 priorityscore=1501 lowpriorityscore=0 clxscore=1015 mlxscore=0
 mlxlogscore=999 bulkscore=0 classifier=spam authscore=0 authtc=n/a authcc=
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

On Mon, May 26, 2025 at 08:57:35PM +0800, Yongxing Mou wrote:
> 
> 
> On 2024/12/8 13:42, Dmitry Baryshkov wrote:
> > On Thu, Dec 05, 2024 at 08:31:48PM -0800, Abhinav Kumar wrote:
> > > Use the dp_panel's stream_id to adjust the offsets for stream 1
> > > which will be used for MST in the dp_catalog. Also add additional
> > > register defines for stream 1.
> > > 
> > > Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
> > > ---
> > >   drivers/gpu/drm/msm/dp/dp_catalog.c | 99 ++++++++++++++++++++++++++++---------
> > >   drivers/gpu/drm/msm/dp/dp_catalog.h |  9 ++--
> > >   drivers/gpu/drm/msm/dp/dp_ctrl.c    |  3 ++
> > >   drivers/gpu/drm/msm/dp/dp_panel.c   |  2 +
> > >   drivers/gpu/drm/msm/dp/dp_reg.h     | 13 ++++-
> > >   5 files changed, 99 insertions(+), 27 deletions(-)
> > > 
> > > diff --git a/drivers/gpu/drm/msm/dp/dp_panel.c b/drivers/gpu/drm/msm/dp/dp_panel.c
> > > index 172de804dec445cb08ad8e3f058407f483cd6684..662bf02b8b1a5165f927835bef3c11ac091ddce6 100644
> > > --- a/drivers/gpu/drm/msm/dp/dp_panel.c
> > > +++ b/drivers/gpu/drm/msm/dp/dp_panel.c
> > > @@ -309,7 +309,9 @@ static int msm_dp_panel_setup_vsc_sdp_yuv_420(struct msm_dp_panel *msm_dp_panel)
> > >   	panel = container_of(msm_dp_panel, struct msm_dp_panel_private, msm_dp_panel);
> > >   	catalog = panel->catalog;
> > > +
> > >   	msm_dp_mode = &msm_dp_panel->msm_dp_mode;
> > > +	catalog->stream_id = msm_dp_panel->stream_id;
> > 
> > Why is it a proper place to set catalog->stream_id? It doesn't looks
> > like it to me.
> Ok, maybe msm_dp_display_set_stream_id is more proper place. Or can we drop
> stream_id in catalog totally, and f the stream_id is needed in the catalog
> function, pass it as a parameter to the catalog function. just like that:
> int msm_dp_ctrl_***(struct msm_dp_ctrl *ctrl, enum msm_dp_stream_id
> stream_id,***);


LGTM.


-- 
With best wishes
Dmitry
