Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A31C2B51BAC
	for <lists+dri-devel@lfdr.de>; Wed, 10 Sep 2025 17:32:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2D1C610E946;
	Wed, 10 Sep 2025 15:32:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="M2pY150G";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 93C6010E94E
 for <dri-devel@lists.freedesktop.org>; Wed, 10 Sep 2025 15:32:09 +0000 (UTC)
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58ACgTAC004009
 for <dri-devel@lists.freedesktop.org>; Wed, 10 Sep 2025 15:32:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 +lQ+oYNt3WeGVVFIvjUy2y179TQJ656VsJ9sQPc6/zk=; b=M2pY150GjX/MSr10
 fpKXKUJ2RfzoEJUzI0bN215ZKEEThP+l6mwDM2zm4KRQmk0tajMRxKFtVQOaFNeq
 E7S8iEMvI4FtNwQiFT+CI4qUA0Qp70FydLHo59IBo9hCSbW7S2G/ZG9No3ZHTexz
 y/e7UlJfecgIM2DI9nHCN+gNW6VlNXVr4DggN8GHi+dk5KxgsoGLS/OAjNpAv5K7
 1MneM6hxiK+mZqJ0qBuJtZD5RMnfTA/aKXNcf+hfB94psLdYHFTOW2iqvZfTuZXv
 4Ty7jAkSyYixwaW+Eayn5GyxoFe350q/obHdJKocIJkKCv1d1i0wfkq1DcIhRKEb
 X0KmtQ==
Received: from mail-vk1-f197.google.com (mail-vk1-f197.google.com
 [209.85.221.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 490bwscere-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Wed, 10 Sep 2025 15:32:09 +0000 (GMT)
Received: by mail-vk1-f197.google.com with SMTP id
 71dfb90a1353d-544b3b6ae70so3511633e0c.0
 for <dri-devel@lists.freedesktop.org>; Wed, 10 Sep 2025 08:32:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1757518328; x=1758123128;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=+lQ+oYNt3WeGVVFIvjUy2y179TQJ656VsJ9sQPc6/zk=;
 b=sQH6AA4T9tw/TovWvJGDFE6HoLao60NUKLtPOy75zVldI2XHulBJ1Lj5OdyAAfpJ2h
 WaHnT5c99KTRqFKWvLA0zdIkbjihy1TrMq/KllqVCUU0qsXv58+qEbGXeTMc8EPh+ucq
 rUwBQXt9P4eVL4cOfjyK6sj135yQQsnoHBu8vEza3SjucMEquiuLdu+uibLbLPuiIGIj
 K7lGsNccNKslc+Wozp0eMM+fsRjlcK7eb7jJkx/yHM6TjwPedlh9wDOu6ORxYGn/5q8I
 vWPItEjVQKPDGEg8BaMmV8zlkf8aMWkvuFlUoeZs6f/ozoRTGTnzizhGCyqVmr8ajAzO
 7n7g==
X-Forwarded-Encrypted: i=1;
 AJvYcCX21mwC3aDoDiwV17PJ5Xp1N5L3WjQLa3jfdxi0fgGXT11nqjDfG/r85Tp0Zct7JB2VPKwX0XPghQE=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yxtaf9m40YjVGwjfUrHzik4/DsAPy96xhJNMaELQHszsJzmdWdV
 nrs8Z40uaWPkFNPGR7Nrz8qGQwRQj4rA+aTXi7Rhl2F7IP+3h2d1xNWuP6cOuGN7qX5VD6B5S7t
 xzuj6rv/RLY7urEu4B8Rw55cNLkV78BekbqqDtqv8+MfKWMf/Cuq6Txqhv29ZIFOqO1HsX6g=
X-Gm-Gg: ASbGnctEWFlrVArO3qrkajPB+tHOEQWkfNGfgAYHKMq76yhV2Nonm91pNu8v7Ehqt3e
 sHn5L5U4wITVuI7SA3nsIDvm+ygdX1krl8XhYUhwAKVyVCtkb1TnVqvbnLJ4wdJxYGHwGHjqzBg
 3uArK58+twLhd6bfRo5KiIvkP/1Fxhy4WKgpgJnzflsZSDbFAGLQhySLDAqpV69pTGdN8MTapVo
 cEXnxeZx/Oi5yx0myKH7GkruMx4Lcc1vLfeDHYg5NnWUG0NuKfjjz2DW1UsDEstf8zxQTCmsxQd
 YqdG4r2HMJvQ7pIPaE+cDEQWLqgpLEErpVMWUmLEo6496A4qH4EGR0r6+KDf4GO98HT/h3fllcz
 Vxroe5WAvcnwUciRoUKJj3i14AM7nwRCXYmiRf9U2D0gbm95mXCVZ
X-Received: by 2002:a05:6122:250d:b0:543:e955:d5fa with SMTP id
 71dfb90a1353d-5471d655e55mr4220306e0c.0.1757518327067; 
 Wed, 10 Sep 2025 08:32:07 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE/UH50wdrBGFR5Q3r5dgsOMEP45qmCh9JfN+fdHiiP/fiLQJRmv2nniCeeSVJR551+wmA8jQ==
X-Received: by 2002:a05:6122:250d:b0:543:e955:d5fa with SMTP id
 71dfb90a1353d-5471d655e55mr4220207e0c.0.1757518326248; 
 Wed, 10 Sep 2025 08:32:06 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-337f50328fcsm44301751fa.40.2025.09.10.08.32.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 10 Sep 2025 08:32:04 -0700 (PDT)
Date: Wed, 10 Sep 2025 18:32:02 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Cc: abhinav.kumar@linux.dev, airlied@gmail.com, alexander.deucher@amd.com,
 amd-gfx@lists.freedesktop.org, christian.koenig@amd.com,
 dave.stevenson@raspberrypi.com, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, geert+renesas@glider.be,
 harry.wentland@amd.com, jani.nikula@linux.intel.com,
 jessica.zhang@oss.qualcomm.com, kernel-list@raspberrypi.com,
 kieran.bingham+renesas@ideasonboard.com,
 laurent.pinchart+renesas@ideasonboard.com,
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-renesas-soc@vger.kernel.org, liviu.dudau@arm.com,
 louis.chauvet@bootlin.com, lumag@kernel.org,
 maarten.lankhorst@linux.intel.com, magnus.damm@gmail.com,
 marijn.suijten@somainline.org, mcanal@igalia.com, mripard@kernel.org,
 robin.clark@oss.qualcomm.com, sean@poorly.run, simona@ffwll.ch,
 siqueira@igalia.com, sunpeng.li@amd.com, suraj.kandpal@intel.com,
 tomi.valkeinen+renesas@ideasonboard.com, tzimmermann@suse.de
Subject: Re: [PATCH v3 4/8] drm/msm/dpu: use drmm_writeback_connector_init()
Message-ID: <elql7sqecqlik7shmgvpgnghgapzp5oe4mf4vlklx4ml6z5664@f5mw6g4fvjff>
References: <20250819-wb-drop-encoder-v3-0-b48a6af7903b@oss.qualcomm.com>
 <20250819-wb-drop-encoder-v3-4-b48a6af7903b@oss.qualcomm.com>
 <78c764b8-44cf-4db5-88e7-807a85954518@wanadoo.fr>
 <zw23hgjduxgijown52jyiomungxx4cjyv63qixtnx5nbm3w7xb@2yy65777ydnj>
 <654e04e3-d80e-4d34-a1a0-21f66d43875b@wanadoo.fr>
 <75tzn4xg2k2zxdqko4b3xsplbtnolhrxzbowisdqogoo2qhfkl@szr3ar5dg5zd>
 <ae40f623-4cfc-4a49-9eed-affb08efdfd1@wanadoo.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <ae40f623-4cfc-4a49-9eed-affb08efdfd1@wanadoo.fr>
X-Proofpoint-ORIG-GUID: TURJBlBh29lZZiwDRal9rX1MSepwKx8G
X-Proofpoint-GUID: TURJBlBh29lZZiwDRal9rX1MSepwKx8G
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTA2MDAxOCBTYWx0ZWRfXwxRFoEfnY1R9
 x4wtBcDc4UcxyZ1y87+hRP6PJUrw6q9dM518k/yOstWdDx/QIjkXbNAAgy9lhQQo1zy3Cm2l6Pl
 h8BKN1rpoVmxe5ACZR3SHjKqq6saeuN/5ZME9hTExv5sV+GaVU8tzZupHpD5RMZel2lU1XJCqeL
 BFuQrHQrZ58DFvVBP237Vhig4ZvT+g/udOeMtbpyu59M3VAx+aBD+MSZFnMAmQDAK/u9A1bjD3o
 xWstYIucANsqq3zpHFwYkb7pV4g0c1IN5mws+qv73JH6QH9MlEBYhRDJ0AM9nH2mxGnITfxL8fu
 HaiTHph/pQF5U3Mgpkrc2NBpXu62O+hlJ87JO1ArAi9IWBmLaYQWFp5y/JsQKVETCvyt7qy0B5S
 Eh1Ve7Ee
X-Authority-Analysis: v=2.4 cv=G4kcE8k5 c=1 sm=1 tr=0 ts=68c199f9 cx=c_pps
 a=JIY1xp/sjQ9K5JH4t62bdg==:117 a=xqWC_Br6kY4A:10 a=8nJEP1OIZ-IA:10
 a=yJojWOMRYYMA:10 a=P-IC7800AAAA:8 a=VwQbUJbxAAAA:8 a=TSbVqHtbAAAA:8
 a=AbdpToo3CINEX3bgUq4A:9 a=3ZKOabzyN94A:10 a=wPNLvfGTeEIA:10
 a=tNoRWFLymzeba-QzToBc:22 a=d3PnA9EDa4IxuAV0gXij:22 a=NJcUIoPEKLAEIzHnl83t:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-10_02,2025-09-10_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 bulkscore=0 suspectscore=0 clxscore=1015
 malwarescore=0 adultscore=0 impostorscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509060018
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

On Wed, Sep 10, 2025 at 07:32:51AM +0200, Christophe JAILLET wrote:
> Le 10/09/2025 à 05:47, Dmitry Baryshkov a écrit :
> > On Mon, Sep 08, 2025 at 11:38:44PM +0200, Christophe JAILLET wrote:
> > > Le 08/09/2025 à 23:26, Dmitry Baryshkov a écrit :
> > > > On Mon, Sep 08, 2025 at 11:09:07PM +0200, Christophe JAILLET wrote:
> > > > > Le 19/08/2025 à 22:32, Dmitry Baryshkov a écrit :
> > > > > > Use drmm_plain_encoder_alloc() to allocate simple encoder and
> > > > > > drmm_writeback_connector_init() in order to initialize writeback
> > > > > > connector instance.
> > > > > > 
> > > > > > Reviewed-by: Louis Chauvet <louis.chauvet-LDxbnhwyfcJBDgjK7y7TUQ-XMD5yJDbdMReXY1tMh2IBg-XMD5yJDbdMReXY1tMh2IBg@public.gmane.org>
> > > > > > Reviewed-by: Suraj Kandpal <suraj.kandpal-ral2JQCrhuEAvxtiuMwx3w-XMD5yJDbdMReXY1tMh2IBg-XMD5yJDbdMReXY1tMh2IBg@public.gmane.org>
> > > > > > Reviewed-by: Jessica Zhang <jessica.zhang-5oFBVzJwu8Ry9aJCnZT0Uw-XMD5yJDbdMReXY1tMh2IBg-XMD5yJDbdMReXY1tMh2IBg@public.gmane.org>
> > > > > > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov-5oFBVzJwu8Ry9aJCnZT0Uw-XMD5yJDbdMReXY1tMh2IBg-XMD5yJDbdMReXY1tMh2IBg@public.gmane.org>
> > > > > > ---
> > > > > >     drivers/gpu/drm/msm/disp/dpu1/dpu_writeback.c | 10 +++-------
> > > > > >     1 file changed, 3 insertions(+), 7 deletions(-)
> > > > > > 
> > > > > > diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_writeback.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_writeback.c
> > > > > > index 8ff496082902b1ee713e806140f39b4730ed256a..cd73468e369a93c50303db2a7d4499bcb17be5d1 100644
> > > > > > --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_writeback.c
> > > > > > +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_writeback.c
> > > > > > @@ -80,7 +80,6 @@ static int dpu_wb_conn_atomic_check(struct drm_connector *connector,
> > > > > >     static const struct drm_connector_funcs dpu_wb_conn_funcs = {
> > > > > >     	.reset = drm_atomic_helper_connector_reset,
> > > > > >     	.fill_modes = drm_helper_probe_single_connector_modes,
> > > > > > -	.destroy = drm_connector_cleanup,
> > > > > >     	.atomic_duplicate_state = drm_atomic_helper_connector_duplicate_state,
> > > > > >     	.atomic_destroy_state = drm_atomic_helper_connector_destroy_state,
> > > > > >     };
> > > > > > @@ -131,12 +130,9 @@ int dpu_writeback_init(struct drm_device *dev, struct drm_encoder *enc,
> > > > > >     	drm_connector_helper_add(&dpu_wb_conn->base.base, &dpu_wb_conn_helper_funcs);
> > > > > > -	/* DPU initializes the encoder and sets it up completely for writeback
> > > > > > -	 * cases and hence should use the new API drm_writeback_connector_init_with_encoder
> > > > > > -	 * to initialize the writeback connector
> > > > > > -	 */
> > > > > > -	rc = drm_writeback_connector_init_with_encoder(dev, &dpu_wb_conn->base, enc,
> > > > > > -			&dpu_wb_conn_funcs, format_list, num_formats);
> > > > > > +	rc = drmm_writeback_connector_init(dev, &dpu_wb_conn->base,
> > > > > > +					   &dpu_wb_conn_funcs, enc,
> > > > > > +					   format_list, num_formats);
> > > > > >     	if (!rc)
> > > > > >     		dpu_wb_conn->wb_enc = enc;
> > > > > > 
> > > > > 
> > > > > dpu_wb_conn is allocated a few lines above using devm_kzalloc().
> > > > 
> > > > That's a valid point, thanks!
> > > 
> > > I've not analyzed in details all the patches of the serie, but at least
> > > patch 2/8 and 6/8 seems to have the same pattern.
> > 
> > Not quite, 2/8 and 6/8 use drmm_kzalloc(), it is fine to be used with
> > drmm_writeback_connector_init(). This one is indeed incorrect.
> > 
> 
> Hmm, for patch 2/8, I looked at the source, not what was changes by your
> patch... Sorry. :(
> 
> For 6/8, I agree with you.
> 
> For patch 1/8, I think there is a issue too, becasue of [1], IIUC.

There is a different issue then. It's a memory leak inside the AMD
driver (since the memory for WB connector will not be kfree()'d by
anything).

> 
> CJ
> 
> 
> [1]: https://elixir.bootlin.com/linux/v6.17-rc5/source/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c#L5257
> 
> > > 
> > > CJ
> > > 
> > > > 
> > > > > 
> > > > > Based on [1], mixing devm_ and drmm_ is not safe and can lead to a uaf.
> > > > > 
> > > > > Is it correct here?
> > > > > If the explanation at [1] is correct, then &dpu_wb_conn->base would point to
> > > > > some released memory, IIUC.
> > > > > 
> > > > > 
> > > > > just my 2c.
> > > > > 
> > > > > CJ
> > > > > 
> > > > > [1]: https://web.git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/commit/drivers/gpu/drm/xe/xe_hwmon.c?id=3a13c2de442d6bfaef9c102cd1092e6cae22b753
> > > > 
> > > 
> > 
> 

-- 
With best wishes
Dmitry
