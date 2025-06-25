Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DF09AE84C8
	for <lists+dri-devel@lfdr.de>; Wed, 25 Jun 2025 15:33:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5D3EF10E726;
	Wed, 25 Jun 2025 13:33:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="hHBQ+xaS";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6C2B310E72C
 for <dri-devel@lists.freedesktop.org>; Wed, 25 Jun 2025 13:33:00 +0000 (UTC)
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55PA337I032470
 for <dri-devel@lists.freedesktop.org>; Wed, 25 Jun 2025 13:32:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=ugc15VkAieW92BplKCsOFTA9
 oTVM65uOh8ZQRu0jejs=; b=hHBQ+xaS+LqzXBmVTkE4eDbwL10mVelmSH9lWmG5
 TXd/0DW+Fqdu0XP1B+HDulem07hJhsGfvwtzOAZ+Za/e7vGsfLP5SdCrt0n4Eahl
 UxFnw58m2znu2fpyqPr1MgACD3XoGHL0vTNHnCwTkclKRMsv+cD+SA84qTmAkHCd
 fPW6Q2ZySWWswb06WEn0RMydk9fQtl1S7xemooUBf2IK9ivkCUhHbASyptvDr+1C
 AvbPF3mw+x007AF2//lDxQsYw4giydqUDSMJbEkIZ/Ab06xkieT+99siSyIinY7s
 ME+J1oEUjnndax06m0LCmaVVlCgJECEwnrSH/0T38wRsTQ==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47fbm1xkrn-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Wed, 25 Jun 2025 13:32:59 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id
 af79cd13be357-7d3e90c3a81so565876485a.1
 for <dri-devel@lists.freedesktop.org>; Wed, 25 Jun 2025 06:32:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1750858378; x=1751463178;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ugc15VkAieW92BplKCsOFTA9oTVM65uOh8ZQRu0jejs=;
 b=nNOjLtvaIkQ6Cew2cw2f1yyjoIVp0Je8WFe0PjI4tNf3wC3ANL+5CLt/pFsmQGAX1s
 qMiMnCwfTGE0Yfb3SXs0LoYQbRPUaMGczeZ6qmV9egoH0mXqQJE3DIBcdacXj0zEduTj
 MVRlAfKfM4ZmpY7voX/2gQ3k8UZXsRmd9qJ07Se28pjlp9HeB/2B+SXuqjvBjn1TBShV
 CiY3cPsdPER/eUq8tmca2w8e311UxubXdbM3kx+bvXvzv0oGy0jvEbQBe0fV+D4DoxLe
 8FbXuZB3wXwYcapH2OUHA/ZspsmKFRF2fUxKfTTsW2JaLMhK5+UGEUKKVBJWJx1y255K
 0+WA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUfbnVHkXwNVmGluvq+goCTzOUxf4NtWQ0jAkB1DFhgoqLDhvTbMrI38pHuiEXhTh21rZUu/bA5+a8=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxiWzNHkfGoE1xUlkHmftWAQi25HtLr8dabk6wbKA4fR3diPT1g
 Vra7k2hAXKaWmsWSLgcVzwMxB1zjRHupLtaszPm1CCNaGQkICNbilBw4mtDfzQpYI2V3Wk+avOg
 6j/GhWsBzpLlb4wOZyhmxR7aCylM/G/3NCp2N38CUY21D644VF4tkPtmd3uzCFbpNiIcZQVc=
X-Gm-Gg: ASbGncvdnutP5Q2mfxoW/s9orThO19gonZwlbxrMKcQBs+w8ycoBT+7Dsiyfmuup+8a
 WQkV3DjAGU+2sKXWpdYn22uF0ZlwRzVgThcGBqllJoIdXgp3dA62wlxVlOVebH+tEEsC094NLQK
 GhpHOYwhn8vL7YNLto/b/mHWc1N1Fj6csbkKMAw4o7c4R6ptH4pl0BAr2gw9KG7iRD4/5CtCQyP
 vPQSPYIWFjJhLwVZ+CxPgB8E0WJd3QyWtr0gleFD+FR9YrPGaY1j4UYsQOm4AmkgqzhgTRcAy2E
 Kw4w0DJSIZ8t0qI/prBj6XTGOBswBlTF9EoN+3/yKAFt6XLuAZ89WLS2rqCagpT/z+r9RVcgk9O
 TkCdx6iDFJdQtSPFaxfxDvs7U9dlPGLUFNwI=
X-Received: by 2002:a05:620a:1921:b0:7d0:a165:60f8 with SMTP id
 af79cd13be357-7d429745a9fmr410211885a.25.1750858378306; 
 Wed, 25 Jun 2025 06:32:58 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEYktJIbhNyuz8SUko28l7s/gB3q+K8KaX5gg77YQ8irCoTNQczVvRWQpLjlZxw1oZ297XRBw==
X-Received: by 2002:a05:620a:1921:b0:7d0:a165:60f8 with SMTP id
 af79cd13be357-7d429745a9fmr410207085a.25.1750858377778; 
 Wed, 25 Jun 2025 06:32:57 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-553e41d2e38sm2189145e87.240.2025.06.25.06.32.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 25 Jun 2025 06:32:56 -0700 (PDT)
Date: Wed, 25 Jun 2025 16:32:55 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Yongxing Mou <quic_yongmou@quicinc.com>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
 Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Abhinav Kumar <quic_abhinavk@quicinc.com>
Subject: Re: [PATCH v2 01/38] drm/msm/dp: split msm_dp_panel_read_sink_caps()
 into two parts and drop panel drm_edid
Message-ID: <buvgxzf5u5wkj2nxd6rquvcktjmxoclwrkkmxeih6pnikubqe3@yoytvnayvxtv>
References: <20250609-msm-dp-mst-v2-0-a54d8902a23d@quicinc.com>
 <20250609-msm-dp-mst-v2-1-a54d8902a23d@quicinc.com>
 <g6wqvbszbrw6gnvxz7cjmhx4rc53kyulcr5wjekfjaisontikl@723odzngtlnd>
 <326bbd02-f414-48e3-a396-4b94f19054f7@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <326bbd02-f414-48e3-a396-4b94f19054f7@quicinc.com>
X-Authority-Analysis: v=2.4 cv=YYu95xRf c=1 sm=1 tr=0 ts=685bfa8b cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=6IFa9wvqVegA:10 a=COk6AnOGAAAA:8 a=joTRkb4bluirJX-87acA:9 a=CjuIK1q_8ugA:10
 a=PEH46H7Ffwr30OY-TuGO:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: BG2qWg4coSFYmTjdLbMJSQXVfhS8EKzR
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjI1MDA5OSBTYWx0ZWRfX1WRsACdcbx+P
 1QldAyBzGZOyuHQc+rHXcUjymJqYgSbC/5RdKgqyyCXD03xjWZLzQERGONoAu6O9NIAodPn3zNN
 VLfTwy6j0EKEMuhSQCS40eXcRXPeijyJx4zALD/c2sdWQzCmPWarH83Hs4/+WQ9Dp60YRvZHebv
 Td7dhQR/eeGlhnnz+dw622hegkgGwRqcsOXogXp+Gg4X2o04NuCgJM83nlwpbh1taTi3QxZK6Pk
 wci4Rk/yN9VUs6WkUx0cAPNRA6dK4JV2PiLi5l0/AeB8VoYZaIDBKEcNQxFVDR0EA1QaSLLSqPl
 v3d0jwLeqVyMmQVo77wJ2KqwI+Z3pcGu/n5v/cg0d/RCTbJjGJEHrkJ6VISxVJ2rA/eb6/NLBlN
 dYlnkM73eDDgOJ74Ml5G4AT2bui0s4a2ql4OVl0w1+wYGj76wjXnBf5/ij04NOCOmOlvQa9d
X-Proofpoint-ORIG-GUID: BG2qWg4coSFYmTjdLbMJSQXVfhS8EKzR
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-06-25_03,2025-06-25_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0 spamscore=0 impostorscore=0 suspectscore=0
 lowpriorityscore=0 priorityscore=1501 phishscore=0 mlxlogscore=999
 clxscore=1015 mlxscore=0 bulkscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506250099
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

On Wed, Jun 25, 2025 at 04:43:55PM +0800, Yongxing Mou wrote:
> 
> 
> On 2025/6/9 20:41, Dmitry Baryshkov wrote:
> > On Mon, Jun 09, 2025 at 08:21:20PM +0800, Yongxing Mou wrote:
> > > From: Abhinav Kumar <quic_abhinavk@quicinc.com>
> > > 
> > > In preparation of DP MST where link caps are read for the
> > > immediate downstream device and the edid is read through
> > 
> > EDID, not edid. Please review all your patches for up/down case.
> > 
> Got it. Thanks~
> > > sideband messaging, split the msm_dp_panel_read_sink_caps() into
> > > two parts which read the link parameters and the edid parts
> > > respectively. Also drop the panel drm_edid cached as we actually
> > > don't need it.
> > 
> > Also => separate change.
> > 
> Got it.
> > > 
> > > Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
> > > Signed-off-by: Yongxing Mou <quic_yongmou@quicinc.com>
> > > ---
> > >   drivers/gpu/drm/msm/dp/dp_display.c | 13 +++++----
> > >   drivers/gpu/drm/msm/dp/dp_panel.c   | 55 ++++++++++++++++++++-----------------
> > >   drivers/gpu/drm/msm/dp/dp_panel.h   |  6 ++--
> > >   3 files changed, 40 insertions(+), 34 deletions(-)
> > > 
> > > diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
> > > index 6f05a939ce9e648e9601597155999b6f85adfcff..4a9b65647cdef1ed6c3bb851f93df0db8be977af 100644
> > > --- a/drivers/gpu/drm/msm/dp/dp_display.c
> > > +++ b/drivers/gpu/drm/msm/dp/dp_display.c
> > > @@ -389,7 +389,11 @@ static int msm_dp_display_process_hpd_high(struct msm_dp_display_private *dp)
> > >   	dp->link->lttpr_count = msm_dp_display_lttpr_init(dp, dpcd);
> > > -	rc = msm_dp_panel_read_sink_caps(dp->panel, connector);
> > > +	rc = msm_dp_panel_read_link_caps(dp->panel);
> > > +	if (rc)
> > > +		goto end;
> > > +
> > > +	rc = msm_dp_panel_read_edid(dp->panel, connector);
> > >   	if (rc)
> > >   		goto end;
> > > @@ -720,7 +724,6 @@ static int msm_dp_irq_hpd_handle(struct msm_dp_display_private *dp, u32 data)
> > >   static void msm_dp_display_deinit_sub_modules(struct msm_dp_display_private *dp)
> > >   {
> > >   	msm_dp_audio_put(dp->audio);
> > > -	msm_dp_panel_put(dp->panel);
> > >   	msm_dp_aux_put(dp->aux);
> > >   }
> > > @@ -783,7 +786,7 @@ static int msm_dp_init_sub_modules(struct msm_dp_display_private *dp)
> > >   		rc = PTR_ERR(dp->ctrl);
> > >   		DRM_ERROR("failed to initialize ctrl, rc = %d\n", rc);
> > >   		dp->ctrl = NULL;
> > > -		goto error_ctrl;
> > > +		goto error_link;
> > >   	}
> > >   	dp->audio = msm_dp_audio_get(dp->msm_dp_display.pdev, dp->catalog);
> > > @@ -791,13 +794,11 @@ static int msm_dp_init_sub_modules(struct msm_dp_display_private *dp)
> > >   		rc = PTR_ERR(dp->audio);
> > >   		pr_err("failed to initialize audio, rc = %d\n", rc);
> > >   		dp->audio = NULL;
> > > -		goto error_ctrl;
> > > +		goto error_link;
> > >   	}
> > >   	return rc;
> > > -error_ctrl:
> > > -	msm_dp_panel_put(dp->panel);
> > >   error_link:
> > >   	msm_dp_aux_put(dp->aux);
> > >   error:
> > > diff --git a/drivers/gpu/drm/msm/dp/dp_panel.c b/drivers/gpu/drm/msm/dp/dp_panel.c
> > > index 4e8ab75c771b1e3a2d62f75e9993e1062118482b..d9041e235104a74b3cc50ff2e307eae0c4301ef3 100644
> > > --- a/drivers/gpu/drm/msm/dp/dp_panel.c
> > > +++ b/drivers/gpu/drm/msm/dp/dp_panel.c
> > > @@ -118,14 +118,13 @@ static u32 msm_dp_panel_get_supported_bpp(struct msm_dp_panel *msm_dp_panel,
> > >   	return min_supported_bpp;
> > >   }
> > > -int msm_dp_panel_read_sink_caps(struct msm_dp_panel *msm_dp_panel,
> > > -	struct drm_connector *connector)
> > > +int msm_dp_panel_read_link_caps(struct msm_dp_panel *msm_dp_panel)
> > >   {
> > >   	int rc, bw_code;
> > >   	int count;
> > >   	struct msm_dp_panel_private *panel;
> > > -	if (!msm_dp_panel || !connector) {
> > > +	if (!msm_dp_panel) {
> > >   		DRM_ERROR("invalid input\n");
> > >   		return -EINVAL;
> > >   	}
> > > @@ -160,26 +159,29 @@ int msm_dp_panel_read_sink_caps(struct msm_dp_panel *msm_dp_panel,
> > >   	rc = drm_dp_read_downstream_info(panel->aux, msm_dp_panel->dpcd,
> > >   					 msm_dp_panel->downstream_ports);
> > > -	if (rc)
> > > -		return rc;
> > > +	return rc;
> > > +}
> > > -	drm_edid_free(msm_dp_panel->drm_edid);
> > > +int msm_dp_panel_read_edid(struct msm_dp_panel *msm_dp_panel, struct drm_connector *connector)
> > > +{
> > > +	struct msm_dp_panel_private *panel;
> > > +	const struct drm_edid *drm_edid;
> > > +
> > > +	panel = container_of(msm_dp_panel, struct msm_dp_panel_private, msm_dp_panel);
> > > -	msm_dp_panel->drm_edid = drm_edid_read_ddc(connector, &panel->aux->ddc);
> > > +	drm_edid = drm_edid_read_ddc(connector, &panel->aux->ddc);
> > > -	drm_edid_connector_update(connector, msm_dp_panel->drm_edid);
> > > +	drm_edid_connector_update(connector, drm_edid);
> > > -	if (!msm_dp_panel->drm_edid) {
> > > +	if (!drm_edid) {
> > >   		DRM_ERROR("panel edid read failed\n");
> > >   		/* check edid read fail is due to unplug */
> > >   		if (!msm_dp_catalog_link_is_connected(panel->catalog)) {
> > > -			rc = -ETIMEDOUT;
> > > -			goto end;
> > > +			return -ETIMEDOUT;
> > >   		}
> > >   	}
> > > -end:
> > > -	return rc;
> > > +	return 0;
> > >   }
> > >   u32 msm_dp_panel_get_mode_bpp(struct msm_dp_panel *msm_dp_panel,
> > > @@ -208,15 +210,20 @@ u32 msm_dp_panel_get_mode_bpp(struct msm_dp_panel *msm_dp_panel,
> > >   int msm_dp_panel_get_modes(struct msm_dp_panel *msm_dp_panel,
> > >   	struct drm_connector *connector)
> > >   {
> > > +	struct msm_dp_panel_private *panel;
> > > +	const struct drm_edid *drm_edid;
> > > +
> > >   	if (!msm_dp_panel) {
> > >   		DRM_ERROR("invalid input\n");
> > >   		return -EINVAL;
> > >   	}
> > > -	if (msm_dp_panel->drm_edid)
> > > -		return drm_edid_connector_add_modes(connector);
> > > +	panel = container_of(msm_dp_panel, struct msm_dp_panel_private, msm_dp_panel);
> > > +
> > > +	drm_edid = drm_edid_read_ddc(connector, &panel->aux->ddc);
> > > +	drm_edid_connector_update(connector, drm_edid);
> > 
> > If EDID has been read and processed after HPD high event, why do we need
> > to re-read it again? Are we expecting that EDID will change?
> > 
> Here we indeed don't need to read the EDID again, so we can directly call
> drm_edid_connector_add_modes. Thanks.
> > > -	return 0;
> > > +	return drm_edid_connector_add_modes(connector);
> > >   }
> > >   static u8 msm_dp_panel_get_edid_checksum(const struct edid *edid)
> > > @@ -229,6 +236,7 @@ static u8 msm_dp_panel_get_edid_checksum(const struct edid *edid)
> > >   void msm_dp_panel_handle_sink_request(struct msm_dp_panel *msm_dp_panel)
> > >   {
> > >   	struct msm_dp_panel_private *panel;
> > > +	const struct drm_edid *drm_edid;
> > >   	if (!msm_dp_panel) {
> > >   		DRM_ERROR("invalid input\n");
> > > @@ -238,8 +246,13 @@ void msm_dp_panel_handle_sink_request(struct msm_dp_panel *msm_dp_panel)
> > >   	panel = container_of(msm_dp_panel, struct msm_dp_panel_private, msm_dp_panel);
> > >   	if (panel->link->sink_request & DP_TEST_LINK_EDID_READ) {
> > > +		drm_edid = drm_edid_read_ddc(msm_dp_panel->connector, &panel->aux->ddc);
> > 
> > And again....
> > 
> Here we need the struct edid,since we drop the cached drm_edid, so we need
> to read it again. Or we can return the drm_edid from msm_dp_panel_read_edid
> and pass it to msm_dp_panel_handle_sink_request, then we don't need to read
> drm_edid here. Emm, I'm still a bit curious why we can't cache the drm_edid?
> It would help us to access it when needed. Emm, i see other drivers also
> cache it.

Yes, they can cache EDID. However, in this case we don't even need it at
all. This piece needs to be rewritten to use
drm_dp_send_real_edid_checksum(), connector->real_edid_checksum.

Corresponding changes can be submitted separately.


-- 
With best wishes
Dmitry
