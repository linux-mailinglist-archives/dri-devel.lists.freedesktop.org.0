Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E7B9AAC6DAC
	for <lists+dri-devel@lfdr.de>; Wed, 28 May 2025 18:16:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6614C10E63C;
	Wed, 28 May 2025 16:16:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="pNa+2p9Z";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2824210E63C
 for <dri-devel@lists.freedesktop.org>; Wed, 28 May 2025 16:15:58 +0000 (UTC)
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54S6uSna001232
 for <dri-devel@lists.freedesktop.org>; Wed, 28 May 2025 16:15:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=0gI5oH5wVtb0UAnjoDixYRCS
 /R30DexWdEZ/g8LW7xM=; b=pNa+2p9Z46vGb9NaB3B0Cq3D13AWihW5QSQ4waHd
 pYlbClDLFsnAF8q2gOWs1eWiEusVfyTskLIHeK1eQdiXKeruOjZD30+u2u1yR5m/
 Mc7w6uyWiNlOvh0bimWjnsYzMZjLLb7trCpARjZ3t/2scDa1g9ToI7rz3J2vl8SI
 vdQqS+SOmtWPLAEvZfz74HfUgpOYoshhyQ25KeUEa7jREA+ClOJe6h1T6SoNmNq1
 /07aku6zd6IJVCRF/W+zYCNbu/pX5emDiTlYlNVdXZEALGRvwhlFTuGzKT0NDVC9
 dvRYWL8bOGkjiuLm901YgW/bbfeTB2LXi4EbHtPqv5koaw==
Received: from mail-ot1-f71.google.com (mail-ot1-f71.google.com
 [209.85.210.71])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46u6g92tu3-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Wed, 28 May 2025 16:15:55 +0000 (GMT)
Received: by mail-ot1-f71.google.com with SMTP id
 46e09a7af769-72bc266dc24so6425683a34.2
 for <dri-devel@lists.freedesktop.org>; Wed, 28 May 2025 09:15:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1748448954; x=1749053754;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=0gI5oH5wVtb0UAnjoDixYRCS/R30DexWdEZ/g8LW7xM=;
 b=kplXL0Oe1xY+HjBEHGAzARKFIJ/txaQzfpsyJm/cbUNdqdWEYuHo+IS49OzvK38896
 kqZjcVteCSqj3+AWowDQ/nDlXve+eRpjxAJeiWEEdNOdO8AMwDD5Xce4RkYxj1wK4dru
 SqcrD7dnwP9dBPR+r/K2AqMNv+M8RcadyYFXQsEjAJEBauVn7yX1Q9GSMVOy2Oh4x8Q5
 d9OZiIzUTRKtrTjsJDOOPLGftZThoYlCla7rQtHLXKY4aKD8XcCE5USt8lhkZZ1H8aCq
 /vC6/noBgFhsVEE4YDO8XW8MEBzhPrDa4w5nBYNjbnyyislgVY3wf2AZz5Wx9LhffA67
 6rKQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVbHcvOS+xd8SXRmYYNPrWkJZASIyIi4NJalowOePCQjVXU2AyPl1h5tO5vFjIrMTg8actyQdPK2EE=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwxHxgCDopQwExACb3gjrsWkuaXqBtZavpyb2pF3di0ue+fay3N
 SQ/EEwTAKRhhhiHQXmWi5zCUAoGpzs5uFgZPQxuqHKQR/oDCT8Dpqz4/OnRkbhHU4Y1dZRlQxhF
 sWjnMgQkHWfj9WSEZmNwkaUuzkm8PwtKywC9fQ1ER+ZHHGihOrzL54GuKPSCf+impf7sheqg=
X-Gm-Gg: ASbGncu0XFueEoMF4V8QR38OL7ehthy6wem1BAINydBaVFALOP08Fai9vE5+D0iXdVy
 ZnEMXvzSelGvd7jqO2lLdh9Uwpuxqy2P4tHcbH0cnj9oy+WY/RORfNmpxFPPBy5TWHuK5sMHF1m
 /uFlpk/M5MFbyRBLmUeL3PEG/g/MNedERIoInzl08xaNSLCNRZLxu5aaW3HiSkq/C6fuqclSWuB
 7BIlatwHEOT9fCdWrX+o2J2i38tdpXU+u7dsdyKFHfQC6U1o4OZGdgqvjZBPbXwbDVz4zkmflyo
 l5qnkVOM/yKAgKCQCnt+JfwyyXrL6Xt2PJEr+lsAnYCsQ7YLMzTE9C06D3z4pLY95vIvXB4Thw0
 =
X-Received: by 2002:a05:6830:f95:b0:72b:9e3b:82be with SMTP id
 46e09a7af769-7355cf4e473mr10325991a34.7.1748448954500; 
 Wed, 28 May 2025 09:15:54 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEKYwrXg6faG2a+Jm8PE28X/HbDkL+0E2l18X5AHSQXLcRbVwR7vfI1Mutzhzw+1inWKHRoFw==
X-Received: by 2002:a05:6830:f95:b0:72b:9e3b:82be with SMTP id
 46e09a7af769-7355cf4e473mr10325944a34.7.1748448954067; 
 Wed, 28 May 2025 09:15:54 -0700 (PDT)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-5532f62a93asm339330e87.95.2025.05.28.09.15.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 28 May 2025 09:15:51 -0700 (PDT)
Date: Wed, 28 May 2025 19:15:50 +0300
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
Subject: Re: [PATCH 11/45] drm/msm/dp: split dp_ctrl_off() into stream and
 link parts
Message-ID: <6hwh4bstjunf5kp2ruepsj5clztvjjtxfvxamttwpvhsdpg7ep@24w2uq4qurzd>
References: <20241205-dp_mst-v1-0-f8618d42a99a@quicinc.com>
 <20241205-dp_mst-v1-11-f8618d42a99a@quicinc.com>
 <iplgkmgma3li3jirsxlwr6mrbaepcfhqg2kuz44utvm56vwgpb@4ayjjqehmgw2>
 <3992e14b-7a5c-4787-9bd9-71a2190c1e64@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <3992e14b-7a5c-4787-9bd9-71a2190c1e64@quicinc.com>
X-Authority-Analysis: v=2.4 cv=d4b1yQjE c=1 sm=1 tr=0 ts=683736bb cx=c_pps
 a=OI0sxtj7PyCX9F1bxD/puw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=dt9VzEwgFbYA:10 a=COk6AnOGAAAA:8 a=hmVhL5nSZav6zxmTOrAA:9 a=CjuIK1q_8ugA:10
 a=Z1Yy7GAxqfX1iEi80vsk:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: 6rE1ezkDRh7FJgqFxZOXYd4TkeB_SEXE
X-Proofpoint-GUID: 6rE1ezkDRh7FJgqFxZOXYd4TkeB_SEXE
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTI4MDE0MSBTYWx0ZWRfX5ARfkyc/NNOe
 E7157Rxt+NT1zfK4otQeb8BWqJmj0GXvQd8fI/iDHXTi6AS4sQ4nXVUejlqfFozxtNoiHGuLGfc
 pHgTOjDMlmBxZZIv1CAZUlCKBqJ08n3W+iQeS0jqXqdmfwLi2W50Cwg/s+nxG6QvRl9dh4HG0sO
 UWTS4lNcRrHvNX2ZAO8HsQxAoFA3bjTArBqkVDYHuZwhVbqINZD4i5Vz2ZRjCzFKx/mFvprg/SV
 ik5Ugyk14G7QTVBKir2stdDGmcIA9xnJPkGBaYO/VwJq5p9awjRXoTYTsO5RIOEtnYdNQe4uFm2
 ZjwGyok9k9ujt/xUR1XQkEoCyWV6Bse4nrOwzYDghHCzazVGRG6BnkEfkNNg4xodW/A4ty9ibAP
 CP0ALaQRfmZY7Z34gppZBB7Hrg6g6+yC31YSYvIi8jQD3VWFUx8JX32ht+44n+pJHz9Qw2MR
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-28_08,2025-05-27_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 suspectscore=0 malwarescore=0 phishscore=0 mlxlogscore=999
 lowpriorityscore=0 priorityscore=1501 bulkscore=0 spamscore=0 clxscore=1015
 impostorscore=0 mlxscore=0 classifier=spam authscore=0 authtc=n/a authcc=
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

On Mon, May 26, 2025 at 08:47:22PM +0800, Yongxing Mou wrote:
> 
> 
> On 2024/12/6 17:14, Dmitry Baryshkov wrote:
> > On Thu, Dec 05, 2024 at 08:31:42PM -0800, Abhinav Kumar wrote:
> > > Split dp_ctrl_off() into stream and link parts so that for MST
> > > cases we can control the link and pixel parts separately.
> > 
> > Please start by describing the problem.
> Got it.
> > 
> > > 
> > > Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
> > > ---
> > >   drivers/gpu/drm/msm/dp/dp_ctrl.c    | 29 +++--------------------------
> > >   drivers/gpu/drm/msm/dp/dp_ctrl.h    |  2 +-
> > >   drivers/gpu/drm/msm/dp/dp_display.c |  4 +++-
> > >   3 files changed, 7 insertions(+), 28 deletions(-)
> > > 
> > > diff --git a/drivers/gpu/drm/msm/dp/dp_ctrl.c b/drivers/gpu/drm/msm/dp/dp_ctrl.c
> > > index 118f5ed83e464f9f27f813eb39624f9c3189f5ac..485339eb998cc6c8c1e8ab0a88b5c5d6ef300a1f 100644
> > > --- a/drivers/gpu/drm/msm/dp/dp_ctrl.c
> > > +++ b/drivers/gpu/drm/msm/dp/dp_ctrl.c
> > > @@ -1739,7 +1739,8 @@ static int msm_dp_ctrl_process_phy_test_request(struct msm_dp_ctrl_private *ctrl
> > >   	 * running. Add the global reset just before disabling the
> > >   	 * link clocks and core clocks.
> > >   	 */
> > > -	msm_dp_ctrl_off(&ctrl->msm_dp_ctrl);
> > > +	msm_dp_ctrl_stream_clk_off(&ctrl->msm_dp_ctrl);
> > > +	msm_dp_ctrl_off_link(&ctrl->msm_dp_ctrl);
> > 
> > Huh? What happened with the rest of the msm_dp_ctrl_off() code sequence?
> > It got dropped, but the commit message tells nothing about it.
> > 
> The function msm_dp_ctrl_off has been split into two parts, stream_clk_off
> and off_link, so it got dropped. This part is a bit confusing, will make it
> clearer.


Then msm_dp_ctrl_off_link() should be a part of this patch.

> > >   	ret = msm_dp_ctrl_on_link(&ctrl->msm_dp_ctrl);
> > >   	if (ret) {
> > > @@ -2042,7 +2043,7 @@ int msm_dp_ctrl_on_stream(struct msm_dp_ctrl *msm_dp_ctrl, struct msm_dp_panel *
> > >   	return ret;
> > >   }
> > > -static void msm_dp_ctrl_stream_clk_off(struct msm_dp_ctrl *msm_dp_ctrl)
> > > +void msm_dp_ctrl_stream_clk_off(struct msm_dp_ctrl *msm_dp_ctrl)
> > >   {
> > >   	struct msm_dp_ctrl_private *ctrl;
> > > @@ -2110,30 +2111,6 @@ void msm_dp_ctrl_off_link(struct msm_dp_ctrl *msm_dp_ctrl)
> > >   		phy, phy->init_count, phy->power_count);
> > >   }
> > > -void msm_dp_ctrl_off(struct msm_dp_ctrl *msm_dp_ctrl)
> > > -{
> > > -	struct msm_dp_ctrl_private *ctrl;
> > > -	struct phy *phy;
> > > -
> > > -	ctrl = container_of(msm_dp_ctrl, struct msm_dp_ctrl_private, msm_dp_ctrl);
> > > -	phy = ctrl->phy;
> > > -
> > > -	msm_dp_catalog_panel_disable_vsc_sdp(ctrl->catalog);
> > > -
> > > -	msm_dp_catalog_ctrl_mainlink_ctrl(ctrl->catalog, false);
> > > -
> > > -	msm_dp_catalog_ctrl_reset(ctrl->catalog);
> > > -
> > > -	msm_dp_ctrl_stream_clk_off(msm_dp_ctrl);
> > > -
> > > -	dev_pm_opp_set_rate(ctrl->dev, 0);
> > > -	msm_dp_ctrl_link_clk_disable(&ctrl->msm_dp_ctrl);
> > > -
> > > -	phy_power_off(phy);
> > > -	drm_dbg_dp(ctrl->drm_dev, "phy=%p init=%d power_on=%d\n",
> > > -			phy, phy->init_count, phy->power_count);
> > > -}
> > > -
> > >   irqreturn_t msm_dp_ctrl_isr(struct msm_dp_ctrl *msm_dp_ctrl)
> > >   {
> > >   	struct msm_dp_ctrl_private *ctrl;
> > > diff --git a/drivers/gpu/drm/msm/dp/dp_ctrl.h b/drivers/gpu/drm/msm/dp/dp_ctrl.h
> > > index 547155ffa50fbe2f3a1f2c2e1ee17420daf0f3da..887cf5a866f07cb9038887a0634d3e1a0375879c 100644
> > > --- a/drivers/gpu/drm/msm/dp/dp_ctrl.h
> > > +++ b/drivers/gpu/drm/msm/dp/dp_ctrl.h
> > > @@ -22,7 +22,7 @@ int msm_dp_ctrl_on_stream(struct msm_dp_ctrl *msm_dp_ctrl, struct msm_dp_panel *
> > >   int msm_dp_ctrl_prepare_stream_on(struct msm_dp_ctrl *dp_ctrl, bool force_link_train);
> > >   void msm_dp_ctrl_off_link_stream(struct msm_dp_ctrl *msm_dp_ctrl);
> > >   void msm_dp_ctrl_off_link(struct msm_dp_ctrl *msm_dp_ctrl);
> > > -void msm_dp_ctrl_off(struct msm_dp_ctrl *msm_dp_ctrl);
> > > +void msm_dp_ctrl_stream_clk_off(struct msm_dp_ctrl *msm_dp_ctrl);
> > >   void msm_dp_ctrl_push_idle(struct msm_dp_ctrl *msm_dp_ctrl);
> > >   irqreturn_t msm_dp_ctrl_isr(struct msm_dp_ctrl *msm_dp_ctrl);
> > >   void msm_dp_ctrl_handle_sink_request(struct msm_dp_ctrl *msm_dp_ctrl);
> > > diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
> > > index c059f749c1f204deac9dfb0c56f537f5545d9acb..b0458bbc89e934ca33ed5af3f2a8ebca30b50824 100644
> > > --- a/drivers/gpu/drm/msm/dp/dp_display.c
> > > +++ b/drivers/gpu/drm/msm/dp/dp_display.c
> > > @@ -911,7 +911,9 @@ static int msm_dp_display_disable(struct msm_dp_display_private *dp)
> > >   	if (dp->link->sink_count == 0)
> > >   		msm_dp_ctrl_psm_config(dp->ctrl);
> > > -	msm_dp_ctrl_off(dp->ctrl);
> > > +	msm_dp_ctrl_stream_clk_off(dp->ctrl);
> > > +
> > > +	msm_dp_ctrl_off_link(dp->ctrl);
> > >   	/* re-init the PHY so that we can listen to Dongle disconnect */
> > >   	if (dp->link->sink_count == 0)
> > > 
> > > -- 
> > > 2.34.1
> > > 
> > 
> 

-- 
With best wishes
Dmitry
