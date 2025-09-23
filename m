Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6FBACB968AD
	for <lists+dri-devel@lfdr.de>; Tue, 23 Sep 2025 17:20:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 03EFA89B30;
	Tue, 23 Sep 2025 15:20:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="ldyAkNfQ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 177FA89B30
 for <dri-devel@lists.freedesktop.org>; Tue, 23 Sep 2025 15:20:04 +0000 (UTC)
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58NFJuMe003440
 for <dri-devel@lists.freedesktop.org>; Tue, 23 Sep 2025 15:20:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=gCV/pb1tLRPYyn0K5UOzS+G9
 Vkwx7WfFeF/hb+u94DI=; b=ldyAkNfQrUkEvks9ymiBA3QcOdW917vdOVB5XnsG
 b9GruvWrlk/VOcPP0a1Tu9lpjaFCSQT/5zF/6BCkH3IsYu8/FoWkXReUu0VxrvVd
 b5wlXiQEzrrd6hdxswN586AvYOmqKdVUYZKEpL5s4IlJ7N0pN5N1B933makkDA1X
 PzEqLw33ItTUvvDqMDKyn8eXlO/urKu9zmFu5iqIl0/GbhOI6vJP+vpmT41EJ6OU
 U4Qr9JKVlYQZBNg4xgh9p9z89bdfEF/MGLJr7+W712KWiIHMTU2BCpEiQ8glVZxC
 pqpjOdGlXmckYlLRYSsqNmOjCU2TBeBkECtKOuh31xnNMQ==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com
 [209.85.160.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 499kv114a9-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Tue, 23 Sep 2025 15:20:03 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id
 d75a77b69052e-4b302991816so115730261cf.0
 for <dri-devel@lists.freedesktop.org>; Tue, 23 Sep 2025 08:20:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1758640802; x=1759245602;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=gCV/pb1tLRPYyn0K5UOzS+G9Vkwx7WfFeF/hb+u94DI=;
 b=LlTg5zDcs5wyfOL3OKYefVKmt08kfTa2unydFRF8wiUHWGfE7iIFJ266sVEx8FRfwN
 wx830JAILVjBMiXgWscSj1cicUeblzJwJGGlIfSOjqHJLcjDX62D5J+Kr7Yl5IttYJnG
 HV5FiHsgZfQ+75clTg8GhSa9ZYeB/cNJ2gKrsibPTSk2gqSnEZ0/KlWYOE4Cil4TW+8+
 nHQxz1ff4m0dXhXyF8UjGEw2erPGq4cHjcueoJzt/cZoH03iC4c6OLi7P0K9P9+in8yA
 NtQou4rAwRQFVjVS5G1g2Woa4HY3ONveojyXd4DX0gQaJErxIFTWwY1jepZM3K28Lbfv
 L7kw==
X-Gm-Message-State: AOJu0Yw1+49reaVJPuInOaeR3Vftfd+N6KPCLDAqU8wS7wDpd+jR2LWJ
 CVyOg4OwWJuGQje+DbGmYYLgkgnBk0pPpZIRfIjBemW0J3fsE+A4yfZyvq+CJ4MtwyDSNzrPj2a
 6NmVqW8+2iz1B05JLSflyiGEQ2crxt/2wy86bxJIsHPbU2EvAgPjQShT5xkbAWDzeh8q5+y4=
X-Gm-Gg: ASbGnctalTR4SSoCjAevKd7wJ60yfXCmQU/h4W8xUBE4DTb8CfYdC8XwvQ7aMLg2OzA
 ElHyk3rMob2Os49iS1KIQtJr1YHsms92oYGLulkgbM86YwEVocEsUnGtykjSZ6PbleJuxHNkrnG
 tDd3GHAk7pFJ6Rx8S0qcR9/A0Mx8l2IMqZd1x8L//tl1WiKNQtBB9KpNyU30c5qTTVcOJOg4pLi
 b5v20VcuCAmb81UlnxrZ94w3W/pZBP98dlrU75e2GF4Nj5mJPNbz2eWt7WETAxDQd7cXnc6WIbl
 jn5J+xDvcvNtgft4JsknjzgN231emhlmGHbYzcdW5G/xKW3SkLz1uRjRKwmeywoCGtDOeOQVnQA
 JCIPzTTa3oU9Uhab5IZ9sRV5ACQAU/cJnFqC32+wlrqPl1yAlFyEV
X-Received: by 2002:ad4:4e02:0:b0:7e8:bea3:7d9d with SMTP id
 6a1803df08f44-7e8bea3811amr17896126d6.16.1758640801859; 
 Tue, 23 Sep 2025 08:20:01 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGVS0rRmacZYHN6WFNAxnIrqqRssTUR1psPn8W9m/1docVP1AnD3wRfk3EM0Xor1zFPDzdpPw==
X-Received: by 2002:ad4:4e02:0:b0:7e8:bea3:7d9d with SMTP id
 6a1803df08f44-7e8bea3811amr17895876d6.16.1758640801239; 
 Tue, 23 Sep 2025 08:20:01 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-361a8e61bf5sm38486321fa.44.2025.09.23.08.19.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 23 Sep 2025 08:20:00 -0700 (PDT)
Date: Tue, 23 Sep 2025 18:19:58 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Marius Vlad <marius.vlad@collabora.com>
Cc: dri-devel@lists.freedesktop.org, daniel.stone@collabora.com,
 jani.nikula@linux.intel.com, tzimmermann@suse.de,
 simona.vetter@ffwll.ch, derek.foreman@collabora.com
Subject: Re: [PATCH] drm/connector: hdmi: Add a link bpc property
Message-ID: <zyu6reelu7yhthjx27qpoconyrp3x4jg6ppiih7tcm44h77gs7@n5zx5izcoozr>
References: <20250801101750.1726-1-marius.vlad@collabora.com>
 <l6s63vlxu2lrsxcbwrxt5shcn6rnldwjdevggmipstjmluxnyn@7ynu3iygwvxf>
 <aNKNQ8MWPGMyNf63@xpredator>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aNKNQ8MWPGMyNf63@xpredator>
X-Proofpoint-GUID: GKPIeGaU2fmmDjOIHHTYUJgmYVIT7xol
X-Authority-Analysis: v=2.4 cv=RO2zH5i+ c=1 sm=1 tr=0 ts=68d2baa3 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=yJojWOMRYYMA:10 a=QX4gbG5DAAAA:8 a=xVN2UeT8ZDlc9s_1JQMA:9 a=CjuIK1q_8ugA:10
 a=kacYvNCVWA4VmyqE58fU:22 a=AbAUZ8qAyYyZVLSsDulk:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTIwMDAyNSBTYWx0ZWRfX70SoM38CA8SA
 /Uhv3FMSKXkqjbs5g5anLLUxMW/qkxDTxw6S3Lown3or+1Lv8qQ5YwnQj6KGu9htwq5I5929LPu
 40Qwn0CRXZsX971fNlaPqgTM4GIBzY1sqN9rhkCmJ40RzXp94XLGdSNS0/pbh+Iz/13R/0t9Vv3
 Bh+6M5u1Yu13CpVEB2Q/oHfCzMeJn/h2OBrB9DIKj1yU0zVsiq1Ls2CbAe+TA04sO995haaY5B5
 K0QO3EylVeDLMuJAa4zaBrBWOdeZU14NH2nuZ5T3I7TzMRmlLbAK9CupQi3jD2+UhaEe4cyVU6k
 SXyxKa248TtdkdO4Htv8dw6rGDMBuYzydotyIC9WY0UA7X2bBIu00z5N6Nt0IlMgeIcOngbQOCC
 dJBFdxPN
X-Proofpoint-ORIG-GUID: GKPIeGaU2fmmDjOIHHTYUJgmYVIT7xol
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-23_03,2025-09-22_05,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 clxscore=1015 suspectscore=0 priorityscore=1501
 impostorscore=0 spamscore=0 adultscore=0 bulkscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509200025
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

On Tue, Sep 23, 2025 at 03:06:27PM +0300, Marius Vlad wrote:
> Hi Dmitry,
> On Fri, Aug 01, 2025 at 05:09:06PM +0300, Dmitry Baryshkov wrote:
> > On Fri, Aug 01, 2025 at 01:17:50PM +0300, Marius Vlad wrote:
> > > From: Derek Foreman <derek.foreman@collabora.com>
> > > 
> > > Add a way to know the actual bpc of a running link.
> > > 
> > > Drivers might change the current bpc link value due to changes in mode
> > > line or refresh rates. For example when enabling VRR the underlying
> > > hardware might not be able sustain the same bandwidth for a particular
> > > mode line, and it might attempt to lower the bpc. Another example can be
> > > found when switching the color output format, part of YUV420 fallback.
> > > 
> > > This means we might be displaying a stale bpc value although it was
> > > modified for different reasons -- like a refresh rate or an output
> > > color format.
> > > 
> > > This patch introduces a new property 'link bpc' that user-space can
> > > use to get the current bpc value of a running link. In the same
> > > time this would allow user-space set up bpc using 'max_bpc' property.
> > 
> > Could you please point out the userspace implementation which uses this
> > property?
> I'll be adding a MR for Weston for retriving this property. It will compare
> it with 'max bpc' and inform the users that we've noticed a link change.

Thanks!

> > 
> > > 
> > > Signed-off-by: Derek Foreman <derek.foreman@collabora.com>
> > > Signed-off-by: Marius Vlad <marius.vlad@collabora.com>
> > > ---
> > >  drivers/gpu/drm/drm_atomic_uapi.c |  5 +++++
> > >  drivers/gpu/drm/drm_connector.c   | 26 ++++++++++++++++++++++++++
> > >  include/drm/drm_connector.h       |  8 ++++++++
> > >  3 files changed, 39 insertions(+)
> > > 
> > > diff --git a/drivers/gpu/drm/drm_atomic_uapi.c b/drivers/gpu/drm/drm_atomic_uapi.c
> > > index ecc73d52bfae..3a2ffb957ade 100644
> > > --- a/drivers/gpu/drm/drm_atomic_uapi.c
> > > +++ b/drivers/gpu/drm/drm_atomic_uapi.c
> > > @@ -776,6 +776,9 @@ static int drm_atomic_connector_set_property(struct drm_connector *connector,
> > >  						   fence_ptr);
> > >  	} else if (property == connector->max_bpc_property) {
> > >  		state->max_requested_bpc = val;
> > > +	} else if (property == connector->link_bpc_property) {
> > > +		drm_dbg_kms(dev, "only drivers can set link bpc property. Use max_bpc instead\n");
> > > +		return -EINVAL;
> > >  	} else if (property == connector->privacy_screen_sw_state_property) {
> > >  		state->privacy_screen_sw_state = val;
> > >  	} else if (property == connector->broadcast_rgb_property) {
> > > @@ -861,6 +864,8 @@ drm_atomic_connector_get_property(struct drm_connector *connector,
> > >  		*val = 0;
> > >  	} else if (property == connector->max_bpc_property) {
> > >  		*val = state->max_requested_bpc;
> > > +	} else if (property == connector->link_bpc_property) {
> > > +		*val = state->hdmi.output_bpc;
> > >  	} else if (property == connector->privacy_screen_sw_state_property) {
> > >  		*val = state->privacy_screen_sw_state;
> > >  	} else if (property == connector->broadcast_rgb_property) {
> > > diff --git a/drivers/gpu/drm/drm_connector.c b/drivers/gpu/drm/drm_connector.c
> > > index 272d6254ea47..7ed27aec0ccc 100644
> > > --- a/drivers/gpu/drm/drm_connector.c
> > > +++ b/drivers/gpu/drm/drm_connector.c
> > > @@ -542,6 +542,28 @@ int drmm_connector_init(struct drm_device *dev,
> > >  }
> > >  EXPORT_SYMBOL(drmm_connector_init);
> > >  
> > > +static int
> > > +drm_connector_attach_link_bpc_property(struct drm_connector *connector,
> > > +				       int min, int max)
> > > +{
> > > +	struct drm_device *dev = connector->dev;
> > > +	struct drm_property *prop;
> > > +
> > > +	prop = connector->link_bpc_property;
> > > +	if (prop)
> > > +		return 0;
> > 
> > Shouldn't it be:
> > 
> > if (connector->link_bpc_property)
> > 	return -EBUSY;
> Yeah.
> > 
> > > +
> > > +	prop = drm_property_create_range(dev, 0, "link bpc", min, max);
> > > +	if (!prop)
> > > +		return -ENOMEM;
> > > +
> > > +	connector->link_bpc_property = prop;
> > > +
> > > +	drm_object_attach_property(&connector->base, prop, max);
> > > +
> > > +	return 0;
> > > +}
> > > +
> > >  /**
> > >   * drmm_connector_hdmi_init - Init a preallocated HDMI connector
> > >   * @dev: DRM device
> > > @@ -618,6 +640,10 @@ int drmm_connector_hdmi_init(struct drm_device *dev,
> > >  	drm_connector_attach_max_bpc_property(connector, 8, max_bpc);
> > >  	connector->max_bpc = max_bpc;
> > >  
> > > +	ret = drm_connector_attach_link_bpc_property(connector, 8, max_bpc);
> > > +	if (ret)
> > > +		return ret;
> > 
> > Is there a code which sets this property?
> Hmm, the idea is/was that userspace will just read out this property and
> compare with the 'max bpc' one. In my mind it should be immutable. Is
> that what you're implying here?

Yes. Also plese point out the IGT tests for the prop.

> > 
> > > +
> > >  	if (max_bpc > 8)
> > >  		drm_connector_attach_hdr_output_metadata_property(connector);
> > >  
> > > diff --git a/include/drm/drm_connector.h b/include/drm/drm_connector.h
> > > index 8f34f4b8183d..4a50198aa7c0 100644
> > > --- a/include/drm/drm_connector.h
> > > +++ b/include/drm/drm_connector.h
> > > @@ -2079,6 +2079,14 @@ struct drm_connector {
> > >  	 */
> > >  	struct drm_property *max_bpc_property;
> > >  
> > > +	/**
> > > +	 * @link_bpc_property: Current connector link bpc set by the driver
> > > +	 *
> > > +	 * This property can be used to retrieve the current link bpc from
> > > +	 * connector_state::hdmi:output_bpc
> > > +	 */
> > > +	struct drm_property *link_bpc_property;
> > > +
> > >  	/** @privacy_screen: drm_privacy_screen for this connector, or NULL. */
> > >  	struct drm_privacy_screen *privacy_screen;
> > >  
> > > -- 
> > > 2.47.2
> > > 
> > 
> > -- 
> > With best wishes
> > Dmitry



-- 
With best wishes
Dmitry
