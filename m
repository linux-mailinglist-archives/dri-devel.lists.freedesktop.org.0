Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A73AFBB75AF
	for <lists+dri-devel@lfdr.de>; Fri, 03 Oct 2025 17:44:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D257C10E190;
	Fri,  3 Oct 2025 15:44:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="RQhTjBBW";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B7F7410E190
 for <dri-devel@lists.freedesktop.org>; Fri,  3 Oct 2025 15:44:00 +0000 (UTC)
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 593AacHU005578
 for <dri-devel@lists.freedesktop.org>; Fri, 3 Oct 2025 15:44:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=VpmyCQSwVSHUoaXADoES/PS2
 Nt6wPPE5Oo+SQuYPBFo=; b=RQhTjBBWXy492ZQ5oitl0/ncU2RqsCJsP2iZnU4/
 cUN5xZlWLiZKAgzdI/upQ6hgeHC5hN5lGTsXhIlE2XfbVI9TZY1UHCZD3Gd4muff
 1QUMrbTLtwCnTRi3vQnqUGdb67iiCXim4OwNQdi88K+iJcl0u8bzP3erzkLJVgwJ
 GrOSD4NOcyLp8g74JHe84L71gnkVAYo91PfzFUgQnlj1AH6bPIBy9I6Vt3glm0xv
 uYB6B4ifRgZASNHtWgSGItx8azVoLR2LfRA+ZMnmIX9q/dzd8yUUqIi54P34USpd
 oGdgu/BFubo9pMFvi9GBOx7ztXIYy6oosMUypb4nOTitvQ==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com
 [209.85.160.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49e851u8ta-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Fri, 03 Oct 2025 15:44:00 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id
 d75a77b69052e-4d602229d20so44617971cf.3
 for <dri-devel@lists.freedesktop.org>; Fri, 03 Oct 2025 08:43:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1759506239; x=1760111039;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=VpmyCQSwVSHUoaXADoES/PS2Nt6wPPE5Oo+SQuYPBFo=;
 b=HtDatiwqCv+tf3kCrhaOFZej6Ah9mEtdGkqqjzYHHjy3x4LWcjdzRpVKzBRrQKXXS5
 WxfMTfJVCx2JpvFQfozLAW8Nj5EaGc7K0Q3QKghdTrRNBt6ejK5CMea6El+FzGcUQG9O
 keMm2fuuNlPFQU7UwiXXFp9XV0lR5lOR4cHh6XGaHk844CZnHOt8ltAV2++TXayGfMIY
 9K5ZWSYMAakbyNj4/n0zaFa9oUySFEdKW1mN/7CiRBB0J4ES1Q4ludZrgKGzfEJiQLzh
 JAkDa38STm9Rb1AEOtoPi0KLHfSTXFiD9Y0e990HFvqYllDPuDdBu4LX4fVxMc4kkPM6
 Us4w==
X-Forwarded-Encrypted: i=1;
 AJvYcCUKiqOoRLXO2mXP6Vi5US1elj3A9mZ9y+4V4QrTf+MTL7h4G02rSPVgCUM3njTKtRW+aG2rU7c+uzg=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yx3PNITMlIMo31OZ0priuuvoYwID8XeYdR0DqvAFfA8whL+PbTT
 chhYxmV/haTvy3ESmlm99lvSFL/bjTJVcUm9AJClgnnXf/FIV50hFkuAgyNf5Ojn0irCJI0rBnH
 7CuT74QnWh7famT6wT1SMc5E1xMLfq+u6s3nzTWZX0rM6WbH+Eto3NUDwNBueeS2EFbOypHQ=
X-Gm-Gg: ASbGncvO3OMMATfjlffz8DD11sgYXpIx7gb3Ct/aZjxztzrSmd4De7/k3FMcRkZYWkB
 A/V5RxWk+fSVww3qfBIk6iWcx+mND82aqo79NwvjjmtKCc7i59O/SCic34h1p1XXCwJO7qtMQaw
 NsNEPw9HEyw9FfXDS6LPb0yhMRdsC/wNWzwXf0SbocEkWxzvGv3if0raeBA4oE/608avym7CtTX
 uCSQUfRBYVMXdvOXsBrXJKsPSdHV9Z8t+1k2cKgN9wUwgRKql43dLxdBPettux+3nGxJM+GN6t3
 sRqDsgVKlMzhptmoZr4W4m4p3J/sDvd/bmgpY6iixOk6wWWOMsKBn3XzzCRAmvJffOM0kgp/zs/
 TLH/waZu+EDEAun2buxEo9EvVYw8tEKdydbbzSzZq3S/+HfCoXlGYEGYNfw==
X-Received: by 2002:a05:622a:4c18:b0:4b7:92f1:d641 with SMTP id
 d75a77b69052e-4e576a3c983mr44723651cf.22.1759506237321; 
 Fri, 03 Oct 2025 08:43:57 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEk8KP0+qQBfiT0cQx5+NTnJD4fSS7hPt/F8OokeMKesiR9A8s7Hs/Ap+66bRDgWCPAER6T+w==
X-Received: by 2002:a05:622a:4c18:b0:4b7:92f1:d641 with SMTP id
 d75a77b69052e-4e576a3c983mr44723321cf.22.1759506236780; 
 Fri, 03 Oct 2025 08:43:56 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-58b0118e04asm1929404e87.64.2025.10.03.08.43.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 03 Oct 2025 08:43:55 -0700 (PDT)
Date: Fri, 3 Oct 2025 18:43:54 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Luca Weiss <luca.weiss@fairphone.com>
Cc: Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Rob Clark <robdclark@gmail.com>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 Hermes Wu <Hermes.wu@ite.com.tw>, Dmitry Baryshkov <lumag@kernel.org>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org
Subject: Re: [PATCH v7] drm/msm/dp: reuse generic HDMI codec implementation
Message-ID: <eyr6ipmk7jh5itr662fjvguduwecu54s7meqye6ga5odwelzgy@dgngrukrbogi>
References: <20250423-dp-hdmi-audio-v7-1-8407a23e55b2@oss.qualcomm.com>
 <DD8PK8AI24P7.YK0OGVYC0QFM@fairphone.com>
 <DD8RMPT8EHGF.17VY8M0ECB09R@fairphone.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <DD8RMPT8EHGF.17VY8M0ECB09R@fairphone.com>
X-Authority-Analysis: v=2.4 cv=OJoqHCaB c=1 sm=1 tr=0 ts=68dfef40 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=x6icFKpwvdMA:10 a=VwQbUJbxAAAA:8 a=pGLkceISAAAA:8 a=47WAYy97XgIT4h3jqLYA:9
 a=CjuIK1q_8ugA:10 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTI3MDAzMiBTYWx0ZWRfX1IA22NnSVpX3
 1m0jQTeqAgddsIpzq8fxx+XhJhsjKFX+azWJegzGRL7z/X8lTldIs4ujDjP9iB2mr79mKo0WB41
 Smdw2fTrX8BAESpLjENfFMaJ+9SvQiWnTYLDheqFYeseJrxMoqNu9p797NC+qBo4DV2yxTqfvZi
 lSrM+uWbBK3yxEHw/fAossDy7tyrjdyxAHz5XRZbKxdSWTY2Abhsu+aoj8F52kQIQR4dBb8TRBt
 ZD0YA/3N/wGPmt9lMKXuGdxQ7IXLpy024OebsMt0JKsdrCmg05+vSyD5+UcaaWhwdirv6qIwMb/
 KWl2ApamUR9b0oaFiPheqe5DD9srkD5DMhOoEI9nl+mgJA70pCeJBzL/cB8Sbla+DaY0UogO6rR
 03zv59mEyV4+v8E8XyX/f784SgoTDA==
X-Proofpoint-ORIG-GUID: z-FsAOHcz63d7UPCjF0yXxdNRUkzCoyp
X-Proofpoint-GUID: z-FsAOHcz63d7UPCjF0yXxdNRUkzCoyp
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-03_04,2025-10-02_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 adultscore=0 priorityscore=1501 bulkscore=0 impostorscore=0
 suspectscore=0 lowpriorityscore=0 phishscore=0 malwarescore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2509150000 definitions=main-2509270032
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

On Fri, Oct 03, 2025 at 04:43:59PM +0200, Luca Weiss wrote:
> On Fri Oct 3, 2025 at 3:06 PM CEST, Luca Weiss wrote:
> > Hi Dmitry,
> >
> > On Wed Apr 23, 2025 at 7:52 PM CEST, Dmitry Baryshkov wrote:
> >> From: Dmitry Baryshkov <lumag@kernel.org>
> >>
> >> The MSM DisplayPort driver implements several HDMI codec functions
> >> in the driver, e.g. it manually manages HDMI codec device registration,
> >> returning ELD and plugged_cb support. In order to reduce code
> >> duplication reuse drm_hdmi_audio_* helpers and drm_bridge_connector
> >> integration.
> >
> > A bit late, but it appears that since 6.16 kernel (incl. 6.17) DP audio
> > is broken on qcm6490-fairphone-fp5 (which is using the Elite audio
> > architecture, not Audioreach).
> >
> > Git bisect is pointing to this patch:
> >
> >   98a8920e7b07641eb1996b3c39b9ce27fc05dbb9 is the first bad commit
> >   commit 98a8920e7b07641eb1996b3c39b9ce27fc05dbb9
> >   Author: Dmitry Baryshkov <lumag@kernel.org>
> >   Date:   Fri May 2 01:41:42 2025 +0300
> >
> >       drm/msm/dp: reuse generic HDMI codec implementation
> >
> > It's specifically failing with these errors:
> >
> > [  177.380809] qcom-q6afe aprsvc:service:4:4: AFE enable for port 0x6020 failed -110
> > [  177.380851] q6afe-dai 3700000.remoteproc:glink-edge:apr:service@4:dais: fail to start AFE port 68
> > [  177.380865] q6afe-dai 3700000.remoteproc:glink-edge:apr:service@4:dais: ASoC error (-110): at snd_soc_dai_prepare() on DISPLAY_PORT_RX_0
> > [  177.437004] qcom-q6afe aprsvc:service:4:4: cmd = 0x100e5 returned error = 0x9
> > [  177.437294] qcom-q6afe aprsvc:service:4:4: DSP returned error[9]
> > [  177.437312] qcom-q6afe aprsvc:service:4:4: AFE enable for port 0x6020 failed -22
> > [  177.437332] q6afe-dai 3700000.remoteproc:glink-edge:apr:service@4:dais: fail to start AFE port 68
> > [  177.437343] q6afe-dai 3700000.remoteproc:glink-edge:apr:service@4:dais: ASoC error (-22): at snd_soc_dai_prepare() on DISPLAY_PORT_RX_0
> >
> > Do you have an idea?
> 
> Dmitry pointed me to this patch on IRC which does fix the problem
> described above.
> 
> https://lore.kernel.org/linux-arm-msm/20250925040530.20731-1-liujianfeng1994@gmail.com/

I have been waiting for Srini to respond to the quetions that I have
asked in response to those emails. If he doesn't respond in a sensible
timeframe, I think, we should pick that patch.

-- 
With best wishes
Dmitry
