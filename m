Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 79871B13012
	for <lists+dri-devel@lfdr.de>; Sun, 27 Jul 2025 17:34:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C390710E1B5;
	Sun, 27 Jul 2025 15:34:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="of+5uJMz";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D387D10E2EB
 for <dri-devel@lists.freedesktop.org>; Sun, 27 Jul 2025 15:34:00 +0000 (UTC)
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56RDfUip023200
 for <dri-devel@lists.freedesktop.org>; Sun, 27 Jul 2025 15:34:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=FFuTotSMomuMEPi5vf4Cz7UX
 B1aZe/76Ts1Jb5cz+sc=; b=of+5uJMzktn1H60Ln3SjQpTTKidJMRMyMOC5b6Lm
 61vB4d9yoLx1AGCBmPU+Ums9J1cu996CA8jKSvafcJ2ARaHP43ayA4WpCjmf7NI5
 MKZJUzmA1O0ddILOcNfjemPrzpWvL2oXP2GitgyZ8X1w+GfAuoHyUg0NLi13jf/O
 9zOjGydhpG5vW8qjFaTpDkNaJkNBpYrHaovzoXJyoOjmEg9DcJ5LBWx0GWBCVbhW
 Y0/AOMH7V0pzCzYDl5h6oziSnB5e+iVzQjefONno+F5OTLlGLWCYCxgFmOT3F+GS
 IbZFdmLcw5jEyil96uvawCV3cOs9IXFdJ6vkICtvSs7QgA==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com
 [209.85.219.72])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 484r6qj6pv-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Sun, 27 Jul 2025 15:34:00 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id
 6a1803df08f44-7073b4fb53eso11708566d6.0
 for <dri-devel@lists.freedesktop.org>; Sun, 27 Jul 2025 08:34:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1753630439; x=1754235239;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=FFuTotSMomuMEPi5vf4Cz7UXB1aZe/76Ts1Jb5cz+sc=;
 b=E7nTd6fhVy4LOmzRTIImlMpsUR/32KXrH3o8hJjKZjEcexvw6cAKhd1kLwmhbfv36P
 eIHIeQWHbDjsqpodO1kNfAj61yvycJp/tkQ5SwnRUsKwnGqCGFk7jVW0N2xv2SSVBC5o
 UtQFp3TnlI3aNjGemW6YsXYZACb8ILIYda+vg11xCPxHPRKaqtbs9arX7uTSZUXdoJfe
 6rthQFXJ3DgM1j5Y6mv9LO27jVcvBWV1VYiPH3lPW8Z5YD4mJbdfyGMz1Op/gzofXYIo
 AisZo0Z5JnZ6RyHEEIK/W2AKKV4ieUfzXKq1Ib0Vfiu1IyezVl5MmVVRog+bmZs2b+bl
 Oyzg==
X-Gm-Message-State: AOJu0YxtcrcI9V9Oxaa42eRX2aDs8tRSfdyv+3QoatU4+9JLe3KiX6y3
 x+ikXqtwUVqzTx3T039HYMepr1R5qW8rgp668Dv/PW5/p0iRO/wDzBWYBOeFXHeD0osVVUjfHUf
 V4D9EY6xUbTLeTy+do0ajitq3y7wFfcYYsgrScaXsTstBl/QPyFnUWXHuntpno8mNkQBy7fA=
X-Gm-Gg: ASbGncv//DWpuj8aBPiaR5tL73efP3/uce6yaobhwmdAmltChbhP2prrIXE+7TQcAhA
 a0CLoce0n/ZCaKuxzvxVEzAt7jk0vO3UiskCE13dECUd6rddrpomAjyzo/aZ9sGnOrAjcjBKVYy
 Go0m0yPN1Nrw4G1KA/NXfNGYWKDcFhmmuKaWNWI9rQMTYsdZfVPYUUF6A6QUoUJ34LdNVMjCEmr
 yMjW6t5QAYXikKfnYhHjyDKpAhGGO8d7qowMa1HZ33kuh7LPBKQXv8TEkRwc8Axu6Hh/vKXM/WK
 1Nk3lA1dHqZ3/gLsV3/vTuFBhUi4eOcsl5//VQnWApQXm3GaxOZqYXM5ocBEyM8IeN2qzk6hKDD
 LSatBG1C/H9LDrUKdSw2fXybF4M8ErhGJZprJxzANLvqEKj7tTK6X
X-Received: by 2002:ad4:5f0f:0:b0:702:b28b:d4c2 with SMTP id
 6a1803df08f44-70720514b41mr123587706d6.17.1753630438777; 
 Sun, 27 Jul 2025 08:33:58 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFJAdriGo2/MK2xtL3x9zLE7P+RfqpWUllf/GCVRx2ZnAPpdOBW2I2b4UCRihTMssFHdqKZBA==
X-Received: by 2002:ad4:5f0f:0:b0:702:b28b:d4c2 with SMTP id
 6a1803df08f44-70720514b41mr123587276d6.17.1753630438238; 
 Sun, 27 Jul 2025 08:33:58 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-55b633aed4csm869533e87.204.2025.07.27.08.33.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 27 Jul 2025 08:33:56 -0700 (PDT)
Date: Sun, 27 Jul 2025 18:33:54 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: "Kandpal, Suraj" <suraj.kandpal@intel.com>
Cc: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 "Nautiyal, Ankit K" <ankit.k.nautiyal@intel.com>,
 "Murthy, Arun R" <arun.r.murthy@intel.com>,
 "Shankar, Uma" <uma.shankar@intel.com>
Subject: Re: [PATCH 02/28] drm/writeback: Add a helper function to get
 writeback connector
Message-ID: <xfg7pvilhcbtyh5rtdbve4yjxab5wfsd3zmxffwp5j2pbjtcgw@x2ebzfw3tx2w>
References: <20250725050409.2687242-1-suraj.kandpal@intel.com>
 <20250725050409.2687242-3-suraj.kandpal@intel.com>
 <wntb2pbszt3aavfuztv4wvr3dxwvpuk673d45xefmp6arb5qu3@s22k7yw5ykjm>
 <DM3PPF208195D8D93CFB788A26D027CF5CEE358A@DM3PPF208195D8D.namprd11.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <DM3PPF208195D8D93CFB788A26D027CF5CEE358A@DM3PPF208195D8D.namprd11.prod.outlook.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzI3MDEzNCBTYWx0ZWRfX0KEMgkgiXv7s
 Zfj84AfF9e1hKT+TPXt+1hUqt0zijhloyWxxxpETXXu2LuUVAo1aoqQpKm7wioTdy+9br3d5eqr
 2vxfMbgHcJXEnoV8I0SfQNFmzStaWc8YrAbPQUOjJdSRDsfRUpE6TyzBq4u3Jd/sziOwXYgEnON
 TowdRnyBBaG3DYTI/PuR+Km9pQFxKLWL/AvXwS2ecB4aIapr8vsm18FVL79KdNzRRAkA+o36I4p
 pPGbem8CsuJKX74axthVa/mKcxut8eY0CiYmtIDun8BBEX42xo20OK/JOPMu2CvXcVEvQsLPbUT
 irLFXjZWrUsYqWH9F5WrVQb7xV2vUL5HU9KY/s/O8DPT62dAkhftmj82SG+imFmAOQ06sK9aXfW
 nWL/VwNkgNycpuM35AKHBNW+RPuQnSiX+oYuLLAZw1jBqXMkNlhTh8V7YD495AWOGSxXaA4I
X-Proofpoint-ORIG-GUID: BRbHY9g5f8DxqdYXSlg_l1XAFtyAVCTx
X-Authority-Analysis: v=2.4 cv=ea89f6EH c=1 sm=1 tr=0 ts=688646e8 cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Wb1JkmetP80A:10 a=EUspDBNiAAAA:8 a=QyXUC8HyAAAA:8 a=e5mUnYsNAAAA:8
 a=XZvbBylhphicoWnzn50A:9 a=CjuIK1q_8ugA:10 a=pJ04lnu7RYOZP9TFuWaZ:22
 a=Vxmtnl_E_bksehYqCbjh:22
X-Proofpoint-GUID: BRbHY9g5f8DxqdYXSlg_l1XAFtyAVCTx
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-27_05,2025-07-24_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 priorityscore=1501 impostorscore=0 lowpriorityscore=0 phishscore=0
 malwarescore=0 suspectscore=0 bulkscore=0 adultscore=0 clxscore=1015
 spamscore=0 mlxlogscore=999 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507270134
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

On Sat, Jul 26, 2025 at 04:43:11PM +0000, Kandpal, Suraj wrote:
> 
> 
> > -----Original Message-----
> > From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> > Sent: Saturday, July 26, 2025 5:50 PM
> > To: Kandpal, Suraj <suraj.kandpal@intel.com>
> > Cc: dri-devel@lists.freedesktop.org; intel-xe@lists.freedesktop.org; intel-
> > gfx@lists.freedesktop.org; Nautiyal, Ankit K <ankit.k.nautiyal@intel.com>;
> > Murthy, Arun R <arun.r.murthy@intel.com>; Shankar, Uma
> > <uma.shankar@intel.com>
> > Subject: Re: [PATCH 02/28] drm/writeback: Add a helper function to get
> > writeback connector
> > 
> > On Fri, Jul 25, 2025 at 10:33:43AM +0530, Suraj Kandpal wrote:
> > > Now that we can initialize a drm_writeback_connector without having to
> > > initialize the drm_connector within it and leaving the responsibility
> > > of initialising the drm_connector and maintaining the association with
> > > drm_writeback_connector to it. This helper hooks lets drivers return
> > > the drm_writeback_connector associated with the give drm_connector.
> > >
> > > Signed-off-by: Suraj Kandpal <suraj.kandpal@intel.com>
> > > ---
> > >  drivers/gpu/drm/drm_writeback.c          | 14 ++++++
> > >  include/drm/drm_modeset_helper_vtables.h | 59
> > ++++++++++++++++++++++++
> > >  include/drm/drm_writeback.h              | 14 ++++--
> > >  3 files changed, 82 insertions(+), 5 deletions(-)
> > >
> > > diff --git a/drivers/gpu/drm/drm_writeback.c
> > > b/drivers/gpu/drm/drm_writeback.c index fa58eb0dc7bf..e9f7123270d6
> > > 100644
> > > --- a/drivers/gpu/drm/drm_writeback.c
> > > +++ b/drivers/gpu/drm/drm_writeback.c
> > > @@ -107,6 +107,19 @@ static const struct dma_fence_ops
> > drm_writeback_fence_ops = {
> > >  	.get_timeline_name = drm_writeback_fence_get_timeline_name,
> > >  };
> > >
> > > +struct drm_writeback_connector *
> > > +drm_connector_to_writeback(struct drm_connector *connector) {
> > > +	const struct drm_connector_helper_funcs *funcs =
> > > +		connector->helper_private;
> > > +
> > > +	if (funcs->get_writeback_connector)
> > > +		return funcs->get_writeback_connector(connector);
> > > +
> > > +	return container_of(connector, struct drm_writeback_connector,
> > > +base); } EXPORT_SYMBOL(drm_connector_to_writeback);
> > > +
> > >  static int create_writeback_properties(struct drm_device *dev)  {
> > >  	struct drm_property *prop;
> > > @@ -443,6 +456,7 @@ drm_writeback_connector_init_with_conn(struct
> > drm_device *dev, struct drm_connec
> > >  				       struct drm_writeback_connector
> > *wb_connector,
> > >  				       struct drm_encoder *enc,
> > >  				       const struct drm_connector_funcs
> > *con_funcs,
> > > +				       const struct
> > drm_writeback_connector_helper_funcs
> > > +*wb_funcs,
> > >  				       const u32 *formats, int n_formats)  {
> > >  	struct drm_property_blob *blob;
> > > diff --git a/include/drm/drm_modeset_helper_vtables.h
> > > b/include/drm/drm_modeset_helper_vtables.h
> > > index ce7c7aeac887..6b89b33d2304 100644
> > > --- a/include/drm/drm_modeset_helper_vtables.h
> > > +++ b/include/drm/drm_modeset_helper_vtables.h
> > > @@ -31,6 +31,7 @@
> > >
> > >  #include <drm/drm_crtc.h>
> > >  #include <drm/drm_encoder.h>
> > > +#include <drm/drm_writeback.h>
> > >
> > >  /**
> > >   * DOC: overview
> > > @@ -1179,6 +1180,25 @@ struct drm_connector_helper_funcs {
> > >  	 *
> > >  	 */
> > >  	void (*disable_hpd)(struct drm_connector *connector);
> > > +
> > > +	/**
> > > +	 * @get_writeback_connector:
> > > +	 *
> > > +	 * This callback is used by drivers to get the writeback connector in
> > > +	 * case the init is done via drm_writeback_init_with_conn. Which
> > means
> > > +	 * the drivers don't have drm_connector embedded in
> > drm_writeback_connector
> > > +	 * so they need to send the associated writeback connector with this
> > > +	 * function.
> > > +	 *
> > > +	 * This operation is optional.
> > > +	 *
> > > +	 * This is mainly called from drm_writeback_set_gb.
> > > +	 *
> > > +	 * RETURNS:
> > > +	 *
> > > +	 * drm_writeback_connector assoiciated with the drm connector.
> > > +	 */
> > > +	struct drm_writeback_connector *(*get_writeback_connector)(struct
> > > +drm_connector *connector);
> > >  };
> > >
> > >  /**
> > > @@ -1192,6 +1212,45 @@ static inline void
> > drm_connector_helper_add(struct drm_connector *connector,
> > >  	connector->helper_private = funcs;
> > >  }
> > >
> > > +/**
> > > + * struct drm_writeback_connector_helper_funcs - helper operations
> > > +for writeback
> > > + * connectors.
> > > + *
> > > + * These functions are used by the atomic and legacy modeset helpers
> > > +and by the
> > > + * probe helpers.
> > > + */
> > > +struct drm_writeback_connector_helper_funcs {
> > > +	/**
> > > +	 * @get_connector_from_writeback:
> > > +	 *
> > > +	 * This callback is used by drivers to get the drm_connector in
> > > +	 * case the init is done via drm_writeback_init_with_conn. Which
> > means
> > > +	 * the drivers don't have drm_connector embedded in
> > drm_writeback_connector
> > > +	 * so they need to send the associated drm_connector with this
> > > +	 * function.
> > > +	 *
> > > +	 * This operation is optional.
> > > +	 *
> > > +	 * RETURNS:
> > > +	 *
> > > +	 * drm_connector assoiciated with the drm_writeback_connector.
> > > +	 */
> > > +	struct drm_connector
> > > +	*(*get_connector_from_writeback)(struct drm_writeback_connector
> > > +*wbconnector); };
> > > +
> > > +/**
> > > + * drm_writeback_connector_helper_add - sets the helper vtable for a
> > > +connector
> > > + * @wb_connector: DRM writeback connector
> > > + * @funcs: helper vtable to set for @wb_connector  */ static inline
> > > +void drm_writeback_connector_helper_add(struct
> > > +drm_writeback_connector *wb_connector,
> > > +				   const struct
> > drm_writeback_connector_helper_funcs *funcs) {
> > > +	wb_connector->helper_private = funcs; }
> > > +
> > >  /**
> > >   * struct drm_plane_helper_funcs - helper operations for planes
> > >   *
> > > diff --git a/include/drm/drm_writeback.h b/include/drm/drm_writeback.h
> > > index 149744dbeef0..77c3c64c132d 100644
> > > --- a/include/drm/drm_writeback.h
> > > +++ b/include/drm/drm_writeback.h
> > > @@ -84,6 +84,13 @@ struct drm_writeback_connector {
> > >  	 * The name of the connector's fence timeline.
> > >  	 */
> > >  	char timeline_name[32];
> > > +
> > > +	/**
> > > +	 * @helper_private:
> > > +	 *
> > > +	 * helper private funcs for writeback_connector
> > > +	 */
> > > +	const struct drm_writeback_connector_helper_funcs
> > *helper_private;
> > >  };
> > 
> > Unrelate to the commit? Also, where is this defined?
> 
> This is very much related to this commit and defined on top right here in this commit.

Then please split this patch into two.


-- 
With best wishes
Dmitry
