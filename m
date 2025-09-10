Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 452CAB50C69
	for <lists+dri-devel@lfdr.de>; Wed, 10 Sep 2025 05:47:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EF30E10E359;
	Wed, 10 Sep 2025 03:47:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="bO0ZFmIS";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4048F10E359
 for <dri-devel@lists.freedesktop.org>; Wed, 10 Sep 2025 03:47:51 +0000 (UTC)
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 589I2q94003664
 for <dri-devel@lists.freedesktop.org>; Wed, 10 Sep 2025 03:47:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 xCNWr/PJnqEbKjEwmwT0GXBJuKsMc1dJPKa7LjJl8Cc=; b=bO0ZFmISrnVuDKrf
 yWEU/jW/fo1RofMz4p+NKil33EeiqO5YEkL2Nm+pr4KA+mKcoMs8pGZ+bmDUs76t
 JsfW9k/jxoJh6lrXqCu6vIqKKBTXpEg4ZmYxSOYlPswtM2F4CGbn+24b3gP0pRxL
 IVW924tkw6wBGw45ZQasAFGgN8Kbe/kNue7FqbN2UaqXyO24QLoM1mqUlRflIbCr
 vPY7nYzIopkorbyzPH/HzoQS9roVSPvWHnJaaSucI5uPasvRfoWqJEM8Wgpsa4Nh
 S+PKYBO8Au1dUrKJ92mAA637/pr3PiUKbUW7X9iRl5iFtquawHf3umuu0pKOQnqx
 3M9OsQ==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com
 [209.85.160.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 490aapjs9b-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Wed, 10 Sep 2025 03:47:49 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id
 d75a77b69052e-4b49666c8b8so134533761cf.3
 for <dri-devel@lists.freedesktop.org>; Tue, 09 Sep 2025 20:47:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1757476069; x=1758080869;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=xCNWr/PJnqEbKjEwmwT0GXBJuKsMc1dJPKa7LjJl8Cc=;
 b=kfsrrqr39D3x9bhxeJlI90DZjJI2pWzGbPaNFDQ6p/ZYk9YqrFJFnh+L0oluZM6ZmS
 /rFtU3/hhDH2cdoId22sSXHAVvl3DYCj8o0uvO3pdbrlQeLEda/IwlGTJr4ijlwnzTk7
 0KSI3M726bW8mXs5JFCVJ1V7pC/9wu7Mo7J8Dfnp07zfCTY1YQKPm/UMUPLfgsOE8VqV
 /B2wYQkclGHTy5y4VcDFGLaZQ5brTF/dNdPP8GBCSfzXhlAXIueDfHaE+GWX8WmePIml
 n7AmslmUGxBahmpK/TbZIFyuMolSteSnJefQv4EdtaAvFFhBVXeyEuXi+qYp8hp6kkLU
 8eng==
X-Forwarded-Encrypted: i=1;
 AJvYcCUiH3M+76Od08RRB5r1ay8WhnIS1ubOk42KtdCRfEw06UiapZaPpSP6hy4lAW+vwHPdwCw0pkec0BE=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxZeeOsKG63qVs/kqPt9BB4J1pTDA5QKNph2zM0JKToYgmO0wIJ
 3xCYi+71gWf2WZWC1u2bRWTAUlVXKcUmX9ZwHrtuJmXScaSGMAEJsp1hob8KY6+qACNihTTCtbx
 jQSyODbJ9cuVo1lhjjCpDtdSNIjUayanJ5PywRv315hkrqf9DmVIYrVPm8Q7rt4348LsEzr0=
X-Gm-Gg: ASbGnctQm7wHVL2NIzWMhJr7gTl50A3mZ5VODXEPgFFC314QGdir5XVQu34dwuc0xL6
 mJmqnZkZDfPI1xEC6foOJHr2kHBpsSvwBELWkHyFSCxR96OgqLKQ7063P4OjUPFIypjrRQwWN85
 5Ho5WohsRTIc9X0Wmv/t0PTR+rvHY7VccWMtKkfd7mKadBXmSNW5IWI6DSVm2AJSl58FspsMExA
 QnBeD5LQ0Jzm65VS6hjuakqILuJ6y3Z09IA58dYjYtPNLSGLTc0jlzFR5hNnC737JPwV1GP7NUh
 lPwU8aVHz//k9GW+N++6VCMR9geWMim9TbAstIXEjCSnZLqdaWprcnx9b7p5rL8tYO/Dln8MCXp
 45vz4hGh7kjY7J7KGrjucllvZIInQC560nSMieQeXtq2v2jyIOxRl
X-Received: by 2002:ac8:7fcf:0:b0:4b5:e8f4:3f51 with SMTP id
 d75a77b69052e-4b5f849015fmr159824751cf.70.1757476068998; 
 Tue, 09 Sep 2025 20:47:48 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHBudYc2wJoSz9sQAyJALk/PMOSPicrmz6rnXiONp/vs+u27Z5JjCV3Irks4nh10TLA3Cg8nA==
X-Received: by 2002:ac8:7fcf:0:b0:4b5:e8f4:3f51 with SMTP id
 d75a77b69052e-4b5f849015fmr159824381cf.70.1757476068434; 
 Tue, 09 Sep 2025 20:47:48 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-56817f5759asm960690e87.97.2025.09.09.20.47.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 09 Sep 2025 20:47:47 -0700 (PDT)
Date: Wed, 10 Sep 2025 06:47:45 +0300
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
Message-ID: <75tzn4xg2k2zxdqko4b3xsplbtnolhrxzbowisdqogoo2qhfkl@szr3ar5dg5zd>
References: <20250819-wb-drop-encoder-v3-0-b48a6af7903b@oss.qualcomm.com>
 <20250819-wb-drop-encoder-v3-4-b48a6af7903b@oss.qualcomm.com>
 <78c764b8-44cf-4db5-88e7-807a85954518@wanadoo.fr>
 <zw23hgjduxgijown52jyiomungxx4cjyv63qixtnx5nbm3w7xb@2yy65777ydnj>
 <654e04e3-d80e-4d34-a1a0-21f66d43875b@wanadoo.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <654e04e3-d80e-4d34-a1a0-21f66d43875b@wanadoo.fr>
X-Authority-Analysis: v=2.4 cv=eMETjGp1 c=1 sm=1 tr=0 ts=68c0f4e5 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=8nJEP1OIZ-IA:10
 a=yJojWOMRYYMA:10 a=VwQbUJbxAAAA:8 a=TSbVqHtbAAAA:8 a=W6uVGjgryeCiZygU9GUA:9
 a=3ZKOabzyN94A:10 a=wPNLvfGTeEIA:10 a=dawVfQjAaf238kedN5IG:22
 a=NJcUIoPEKLAEIzHnl83t:22
X-Proofpoint-GUID: wHqB8mKHD8tsRbRd_7pBmMm-bp82g5Sw
X-Proofpoint-ORIG-GUID: wHqB8mKHD8tsRbRd_7pBmMm-bp82g5Sw
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTA2MDAwMCBTYWx0ZWRfX5FQ0/PMczoWd
 0vGnr8rM80+rKgdMi+8SrnpHh69Jlta2kqH/n+slhelCO/fqVt4lI2E0n45XYvYzIVASxHws5Jz
 6jwLQ4cEmM1+BcRRm0bo+0nUXssc5Dr108jDQ53nm2CFogc94DjCej5JsRnu+cYj6RWF9XC3YTU
 Nj36rH/CZfw9yB1Zaq3qWZTSsQgauPWqCm0aUcsmRg6rcNPmz/J6GW0a87HJj1JFfuId1a1q91K
 S9BKfpNLD80Lj6RX08+p0TK2q6TVqy6DJRqBaxfu7+7fYDuGw01D/IvE6ACpI8iLHeKEkm22W5U
 Vdx2PNcowGka5TrRkEYPBuBl+VfZw4R4hS+8LvyvZ53aACI84kc3UHt3rNuV+kPUDOd7/k1neNH
 +XsLZChb
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-09_03,2025-09-08_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 priorityscore=1501 malwarescore=0 clxscore=1015 adultscore=0
 bulkscore=0 phishscore=0 spamscore=0 suspectscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2509060000
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

On Mon, Sep 08, 2025 at 11:38:44PM +0200, Christophe JAILLET wrote:
> Le 08/09/2025 à 23:26, Dmitry Baryshkov a écrit :
> > On Mon, Sep 08, 2025 at 11:09:07PM +0200, Christophe JAILLET wrote:
> > > Le 19/08/2025 à 22:32, Dmitry Baryshkov a écrit :
> > > > Use drmm_plain_encoder_alloc() to allocate simple encoder and
> > > > drmm_writeback_connector_init() in order to initialize writeback
> > > > connector instance.
> > > > 
> > > > Reviewed-by: Louis Chauvet <louis.chauvet-LDxbnhwyfcJBDgjK7y7TUQ-XMD5yJDbdMReXY1tMh2IBg@public.gmane.org>
> > > > Reviewed-by: Suraj Kandpal <suraj.kandpal-ral2JQCrhuEAvxtiuMwx3w-XMD5yJDbdMReXY1tMh2IBg@public.gmane.org>
> > > > Reviewed-by: Jessica Zhang <jessica.zhang-5oFBVzJwu8Ry9aJCnZT0Uw-XMD5yJDbdMReXY1tMh2IBg@public.gmane.org>
> > > > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov-5oFBVzJwu8Ry9aJCnZT0Uw-XMD5yJDbdMReXY1tMh2IBg@public.gmane.org>
> > > > ---
> > > >    drivers/gpu/drm/msm/disp/dpu1/dpu_writeback.c | 10 +++-------
> > > >    1 file changed, 3 insertions(+), 7 deletions(-)
> > > > 
> > > > diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_writeback.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_writeback.c
> > > > index 8ff496082902b1ee713e806140f39b4730ed256a..cd73468e369a93c50303db2a7d4499bcb17be5d1 100644
> > > > --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_writeback.c
> > > > +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_writeback.c
> > > > @@ -80,7 +80,6 @@ static int dpu_wb_conn_atomic_check(struct drm_connector *connector,
> > > >    static const struct drm_connector_funcs dpu_wb_conn_funcs = {
> > > >    	.reset = drm_atomic_helper_connector_reset,
> > > >    	.fill_modes = drm_helper_probe_single_connector_modes,
> > > > -	.destroy = drm_connector_cleanup,
> > > >    	.atomic_duplicate_state = drm_atomic_helper_connector_duplicate_state,
> > > >    	.atomic_destroy_state = drm_atomic_helper_connector_destroy_state,
> > > >    };
> > > > @@ -131,12 +130,9 @@ int dpu_writeback_init(struct drm_device *dev, struct drm_encoder *enc,
> > > >    	drm_connector_helper_add(&dpu_wb_conn->base.base, &dpu_wb_conn_helper_funcs);
> > > > -	/* DPU initializes the encoder and sets it up completely for writeback
> > > > -	 * cases and hence should use the new API drm_writeback_connector_init_with_encoder
> > > > -	 * to initialize the writeback connector
> > > > -	 */
> > > > -	rc = drm_writeback_connector_init_with_encoder(dev, &dpu_wb_conn->base, enc,
> > > > -			&dpu_wb_conn_funcs, format_list, num_formats);
> > > > +	rc = drmm_writeback_connector_init(dev, &dpu_wb_conn->base,
> > > > +					   &dpu_wb_conn_funcs, enc,
> > > > +					   format_list, num_formats);
> > > >    	if (!rc)
> > > >    		dpu_wb_conn->wb_enc = enc;
> > > > 
> > > 
> > > dpu_wb_conn is allocated a few lines above using devm_kzalloc().
> > 
> > That's a valid point, thanks!
> 
> I've not analyzed in details all the patches of the serie, but at least
> patch 2/8 and 6/8 seems to have the same pattern.

Not quite, 2/8 and 6/8 use drmm_kzalloc(), it is fine to be used with
drmm_writeback_connector_init(). This one is indeed incorrect.

> 
> CJ
> 
> > 
> > > 
> > > Based on [1], mixing devm_ and drmm_ is not safe and can lead to a uaf.
> > > 
> > > Is it correct here?
> > > If the explanation at [1] is correct, then &dpu_wb_conn->base would point to
> > > some released memory, IIUC.
> > > 
> > > 
> > > just my 2c.
> > > 
> > > CJ
> > > 
> > > [1]: https://web.git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/commit/drivers/gpu/drm/xe/xe_hwmon.c?id=3a13c2de442d6bfaef9c102cd1092e6cae22b753
> > 
> 

-- 
With best wishes
Dmitry
