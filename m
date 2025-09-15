Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CD4AAB56DAE
	for <lists+dri-devel@lfdr.de>; Mon, 15 Sep 2025 02:59:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2F61F10E269;
	Mon, 15 Sep 2025 00:59:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="H3yUNixg";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6243810E269
 for <dri-devel@lists.freedesktop.org>; Mon, 15 Sep 2025 00:59:14 +0000 (UTC)
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58EMBfpR023928
 for <dri-devel@lists.freedesktop.org>; Mon, 15 Sep 2025 00:59:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=UfRqEKTg6HnyeZ87SHp5YFsc
 cbY821HrlTCvH9SfgKY=; b=H3yUNixgAaVa2b7mjvOEmvgKsO0k+HDVyZ0cq0fF
 6EMo80MQFeQMlTD/3a3W8rDQCLuYLgKLJSFuZ6u0d62gBTDEq+W0Wb+r7qNEF+T6
 RSB71H7OzP0JXYXrsdfqEcM8UgdWRaNqK7nx8fdUH+L7NQs7P5NNwoo2pb1/MRZ3
 Z0rj7uv64k/5teTZEJBbh4zZ9vhJgYR+sRH2H+1BHJY4n3+ri3WWWc3+U6BNGchY
 7m2MyD59XPJMkG8Y1BmyUAqMVt6DBxaSfL/Jt0jIBADlcNxCKgBUsXYXWsmc5lHB
 xxMskO9/b7apZ8VQ8ozObLDXmEaExqcX/R1bBweXDp2ovA==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4951wbawnf-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Mon, 15 Sep 2025 00:59:13 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id
 af79cd13be357-7e86f8f27e1so1041892185a.0
 for <dri-devel@lists.freedesktop.org>; Sun, 14 Sep 2025 17:59:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1757897950; x=1758502750;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=UfRqEKTg6HnyeZ87SHp5YFsccbY821HrlTCvH9SfgKY=;
 b=aqop/2RCKQusQA5NZT0GMqKK1W78pmY9Tt55MIzrFpjRaXfkWLeX1wDRbphEXPFKWU
 UjqshjiSypnxPX/cBlM4PgJ5sWHloYK9+DbHukL3W6FnRFXeSgWxmhR8/92nvl6OBLEQ
 TqVKUSHoUw0fVildXPB1188a9teWeuz+KZYo+TCFEbapiQos2ejHeRKMKXQlCfNmNhvV
 Vjqx/nMfYj7rnJ9PToZagHLhERCuAMemRS2hh9VJl99w5U4mh9m8O4FG92u/3XQ4C5bI
 aV4EitAFu7xwnga1OM2pRpRDqIeE8zD3H+4Q0gw+fLiDyMAo0HGi1Hp88AjD3ux/+kyS
 K/ag==
X-Forwarded-Encrypted: i=1;
 AJvYcCUQC/WEdh6ZUZm1xkmenF6JZtuKzxbAb8hDrMCqL9YzHFLcZdS237AHJjEi9ySoDImuQkr0MSGe7kw=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxvqLNnRA9WHl9RQEq3m1mC5Iwees43g64ldtrcPJO/BwFv4bdM
 iSH9tUPW3cr5jkligheb4naXMoXg6LyHHixVB3wbggtwWcsQPWBMTZlb+W6qTANq6VxrBHDx1sA
 VOV9lybn8lPa8C2pYt6RAOGv5IcgRS6AlbxT6anwIMUStx7gTVkDo/7lcfdvKJzOk5UaVjhk=
X-Gm-Gg: ASbGncsB681mlxYQUn0nnjOQ5YwBjR4axLUr0mCFudYJojqoaIPqbI8eRzNzC7Y6WTl
 6tWRg13mKABZSEdEUQmP+QxTwO10c7jglg7+qvVf6bIBQIy7GM7hOlO5mzGZNiYH7BgdpSWVoMb
 XxhFG9EHQH/CZvpPW8EvSgG0idBywp7BE+Q6nUgNSYs4oA5MrAgOKQh4nXa+Wa5l77Z7ksgZtUj
 HquIbVz8GlspDE13GL9yhuKFSfiRYZvqvqnUnTD7Ph7M1bVMSiAwHuBV3OwB1mMHdfBK4PyOgvc
 nZdpTNcpljSxCxheyC33TkrboMSz/PHGuVF36aSHZxk5jihTBzZbxn3wfxgPGvYN81M26hPJPin
 6JGzvIyBOiCuQf94sH9LKU+l9827Q8IJFRtasH0Gyp16r8Ty5olAo
X-Received: by 2002:a05:620a:6cc4:b0:829:a168:f68f with SMTP id
 af79cd13be357-829a1692d6bmr225968985a.29.1757897950294; 
 Sun, 14 Sep 2025 17:59:10 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFzyJwLCCpr41fr69R1CS3ZBmsLrfYfnC3rLU3utJzTMC5zoN+1V7QRWVG0vHwYSXfPVg4McA==
X-Received: by 2002:a05:620a:6cc4:b0:829:a168:f68f with SMTP id
 af79cd13be357-829a1692d6bmr225967185a.29.1757897949860; 
 Sun, 14 Sep 2025 17:59:09 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-356cf10d020sm9217501fa.12.2025.09.14.17.59.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 14 Sep 2025 17:59:07 -0700 (PDT)
Date: Mon, 15 Sep 2025 03:59:04 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Marius Vlad <marius.vlad@collabora.com>
Cc: Maxime Ripard <mripard@kernel.org>, dri-devel@lists.freedesktop.org,
 wse@tuxedocomputers.com, andri@yngvason.is, sebastian.wick@redhat.com,
 daniel.stone@collabora.com, jani.nikula@linux.intel.com,
 tzimmermann@suse.de, simona.vetter@ffwll.ch, harry.wentland@amd.com,
 christian.koenig@amd.com, derek.foreman@collabora.com
Subject: Re: [PATCH 5/8] drm: Pass supported color formats straight onto
 drm_bridge
Message-ID: <qrxatycvws27hf5sca6akjhfkxcmxoloin4d33kxcqjw6bdv7f@oueaddyttlg5>
References: <20250911130739.4936-1-marius.vlad@collabora.com>
 <20250911130739.4936-6-marius.vlad@collabora.com>
 <20250912-efficient-pistachio-tiger-a7ce06@penduick>
 <aMRwAmxQmHCmWBzY@xpredator>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aMRwAmxQmHCmWBzY@xpredator>
X-Authority-Analysis: v=2.4 cv=XYKJzJ55 c=1 sm=1 tr=0 ts=68c764e1 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=yJojWOMRYYMA:10 a=U39ks5Nh-S5dbaOu_sgA:9 a=CjuIK1q_8ugA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-ORIG-GUID: UC2v-jLmDkNXZAzjKMD26Kg9IpTvcMAZ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTEzMDA0MiBTYWx0ZWRfX0f+6v+HhorPC
 sS9jn+HjWtl1IRsYiUd7ElbJR2DRf+djjn9xoPIzZdrpYqOXaUcZxMoY8Sa1pY6Wgo1hUhtpb2y
 a1hkkPvw0/n04C6pgj3SBMri6+Li/IvaFeUtQrENHAYd/G+KZIvFsf677RfvHPYMs2sUEvtr5nB
 KAG0t7FWCb76HI/yNsnCAYsuEdwxDS6wL1MYCNCrt2nRDWw5jyruBSTE4Km04a3ud+GVDOvzTiF
 h/MgV8LnHTbwfL42FyBbqkmO1CZcak8fJJB6X7gQAk1N4ZXWFdv9qXVOv1outrRAp+2UxrZpUTZ
 JYQD5XP3eVYt7Tl/zIU3yTa9j9kcQ0etsRobTtZ8IZxYXGq4eq3TjeNTKUiC0ob6fC/TP1VTA34
 4K+2DvV5
X-Proofpoint-GUID: UC2v-jLmDkNXZAzjKMD26Kg9IpTvcMAZ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-14_08,2025-09-12_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 suspectscore=0 impostorscore=0 clxscore=1015 priorityscore=1501
 malwarescore=0 bulkscore=0 adultscore=0 phishscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2509130042
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

On Fri, Sep 12, 2025 at 10:09:54PM +0300, Marius Vlad wrote:
> On Fri, Sep 12, 2025 at 05:33:42PM +0200, Maxime Ripard wrote:
> > On Thu, Sep 11, 2025 at 04:07:36PM +0300, Marius Vlad wrote:
> > > diff --git a/drivers/gpu/drm/mediatek/mtk_dpi.c b/drivers/gpu/drm/mediatek/mtk_dpi.c
> > > index 61cab32e213a..15820e6ba057 100644
> > > --- a/drivers/gpu/drm/mediatek/mtk_dpi.c
> > > +++ b/drivers/gpu/drm/mediatek/mtk_dpi.c
> > > @@ -1057,7 +1057,7 @@ static int mtk_dpi_bind(struct device *dev, struct device *master, void *data)
> > >  	if (ret)
> > >  		goto err_cleanup;
> > >  
> > > -	dpi->connector = drm_bridge_connector_init(drm_dev, &dpi->encoder);
> > > +	dpi->connector = drm_bridge_connector_init(drm_dev, &dpi->encoder, BIT(HDMI_COLORSPACE_RGB));
> > >  	if (IS_ERR(dpi->connector)) {
> > >  		dev_err(dev, "Unable to create bridge connector\n");
> > >  		ret = PTR_ERR(dpi->connector);
> > > diff --git a/drivers/gpu/drm/mediatek/mtk_dsi.c b/drivers/gpu/drm/mediatek/mtk_dsi.c
> > > index d7726091819c..91afdbf676f0 100644
> > > --- a/drivers/gpu/drm/mediatek/mtk_dsi.c
> > > +++ b/drivers/gpu/drm/mediatek/mtk_dsi.c
> > > @@ -930,7 +930,7 @@ static int mtk_dsi_encoder_init(struct drm_device *drm, struct mtk_dsi *dsi)
> > >  	if (ret)
> > >  		goto err_cleanup_encoder;
> > >  
> > > -	dsi->connector = drm_bridge_connector_init(drm, &dsi->encoder);
> > > +	dsi->connector = drm_bridge_connector_init(drm, &dsi->encoder, BIT(HDMI_COLORSPACE_RGB));
> > >  	if (IS_ERR(dsi->connector)) {
> > >  		DRM_ERROR("Unable to create bridge connector\n");
> > >  		ret = PTR_ERR(dsi->connector);
> > > diff --git a/drivers/gpu/drm/meson/meson_encoder_cvbs.c b/drivers/gpu/drm/meson/meson_encoder_cvbs.c
> > > index dc374bfc5951..a475fc34ca23 100644
> > > --- a/drivers/gpu/drm/meson/meson_encoder_cvbs.c
> > > +++ b/drivers/gpu/drm/meson/meson_encoder_cvbs.c
> > > @@ -275,7 +275,8 @@ int meson_encoder_cvbs_probe(struct meson_drm *priv)
> > >  	}
> > >  
> > >  	/* Initialize & attach Bridge Connector */
> > > -	connector = drm_bridge_connector_init(priv->drm, &meson_encoder_cvbs->encoder);
> > > +	connector = drm_bridge_connector_init(priv->drm,
> > > +			&meson_encoder_cvbs->encoder, BIT(HDMI_COLORSPACE_RGB));
> > >  	if (IS_ERR(connector))
> > >  		return dev_err_probe(priv->dev, PTR_ERR(connector),
> > >  				     "Unable to create CVBS bridge connector\n");
> > 
> > Why do we need to pass an HDMI color format for a DSI, DPI or Analog TV
> > driver?
> That's what drm_bridge_connector_init() had initially set as supported
> color format. I just pulled that out for every other driver that made
> use of drm_bridge_connector_init. So I guess the answer is we don't
> actually need to do that.

The problem is that the host controller (which calls
drm_bridge_connector_init() ) doesn't know _at_ _all_ if this is going
to be HDMI connector or not.

-- 
With best wishes
Dmitry
