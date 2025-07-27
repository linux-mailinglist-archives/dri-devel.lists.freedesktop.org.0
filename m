Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 13E69B13033
	for <lists+dri-devel@lfdr.de>; Sun, 27 Jul 2025 17:55:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 746CB10E2FD;
	Sun, 27 Jul 2025 15:55:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="pngGWWT4";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0434610E2F8
 for <dri-devel@lists.freedesktop.org>; Sun, 27 Jul 2025 15:55:13 +0000 (UTC)
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56RFWJHS027968
 for <dri-devel@lists.freedesktop.org>; Sun, 27 Jul 2025 15:55:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=EsrEgl39mei4/TuBE/dtIwTk
 oO2ifiwHmRgcyBvsWBg=; b=pngGWWT4Wj5yQvXPLzKXuW0oMs6hxuUt0FRGlR/X
 WF29Kr44N8DU5Zc3aVBNdr7LDRYL8Hu9q2URn+/olhoPTgCM8W9ZoAeRz6MmuUHN
 f44d3OVhUv8sY3TTQvw1ZDPd6eRA6vAXt+O3HSn04Lr50HW105t4LfrAiAkfpjui
 +jjMc08lxVsJbdQSZYg8SS2binzut2mmvi3YWKI0x0fYsiJV0H6yPk1dwb0kkGss
 WCKS6MCDmd/xuD5d7QV7eR2VR4uT8uWozVaZw6vtDl9srYqH0lcQgf4Las0x7V0T
 lt+siPETeFHt4txfV7Cqo75i+qf0MSBPE/gk3nzA5WaHrw==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com
 [209.85.219.72])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 484mqk2j0c-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Sun, 27 Jul 2025 15:55:13 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id
 6a1803df08f44-70732006280so21707366d6.3
 for <dri-devel@lists.freedesktop.org>; Sun, 27 Jul 2025 08:55:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1753631711; x=1754236511;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=EsrEgl39mei4/TuBE/dtIwTkoO2ifiwHmRgcyBvsWBg=;
 b=CncWTaRXMGzSxKls4Q1qZ/tGLbwT9NGbtMkG95GIOqs6ISdjJi9nd82GhJWNcLZMcu
 zRX4Ag5KpNAJTh3uxkhduKo307LNMqUUd4VYaSupMHFjWeSVXub8yi+cYS37pugQPxbf
 HD0W74Xu5wq11y9oUbXGQr9zTrz0mQ8N6KWqAQGMa2U6SPJWqYe8OgGWpHOJNqwJVUeB
 PJ4XjCU5/As/nfJUUB2eq7G28vZp4i3tKxyJJb7oQByp7dYkk/Yymy28toMnCAscRaYU
 v4ttPf2q+O9L08ZwB0IRHFoTd3JitcVYeaegZv2MVKELc22YL8HcaE+njGqNaQC8JpFq
 //FA==
X-Gm-Message-State: AOJu0Ywuasm4En7ry4xDo/Lm7K558uDu9X14RvaUSgXXFC4djWIS+F/H
 QgSKqyDtP/brFPUB2XREYEhEXwVKfz3lQckTzHrVdKWs68lqRhrjkFwDr5JOMuUVi4OUnOggfk/
 /yMC9arm87B/ALWF0j1Iu3cnMz2mxfvbEWZ1bEyNuA8u99z2ruSShbd4lOsyHesjcABjycSZnPC
 36l7o=
X-Gm-Gg: ASbGnctKubLc/PJAY0eNCzy0ODkL8getKjYpbRuRnxQSnC/AteDxawvJFHwtujAYz3Z
 /yYudL0vr45ghyNbuDEPMsNzf4jb0jSFQR7aNP/dhvpSm8b+T1XNy/52ThqBT+E/1SPH7kgbmGH
 jDU3sbG1o29yxxOxixeTacO7KgMjdnPxWnNbfD5fkK6V8N5iG488+oAhyQoaQwSy9hExIqg0R/f
 5/KRE7NgnK2Owg+Az9AAWCJf8mTQoduwosulCd2iJHLa0io+dGZx2cLh6DJp4/SAYaEhrJPF7VJ
 OU+pDo53oIUFSGGoLIwS4eML0TNTlW/DWQNZzzV7wMEPKCo9LXaXgCP/xWtIOmBjo9AUT0z1x0m
 UwI8e4Q48QwiYgW/oARZhXN0EmFax1o6/pXfudgeh9qTUcpBOMABC
X-Received: by 2002:a05:6214:c8f:b0:707:3eec:9d90 with SMTP id
 6a1803df08f44-7073eecb410mr26188756d6.29.1753631711251; 
 Sun, 27 Jul 2025 08:55:11 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFtcfR5HCU7ZshJHg+xEGg2Ot5rBNCoukKiPTXMvDqwtwnKOTAJaeKv0a1uhe16ww038CEo5Q==
X-Received: by 2002:a05:6214:c8f:b0:707:3eec:9d90 with SMTP id
 6a1803df08f44-7073eecb410mr26188506d6.29.1753631710724; 
 Sun, 27 Jul 2025 08:55:10 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-331f4271e59sm7897081fa.72.2025.07.27.08.55.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 27 Jul 2025 08:55:09 -0700 (PDT)
Date: Sun, 27 Jul 2025 18:55:07 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: "Kandpal, Suraj" <suraj.kandpal@intel.com>
Cc: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 "Nautiyal, Ankit K" <ankit.k.nautiyal@intel.com>,
 "Murthy, Arun R" <arun.r.murthy@intel.com>,
 "Shankar, Uma" <uma.shankar@intel.com>
Subject: Re: [PATCH 17/28] drm/i915/writeback: Define function to destroy
 writeback connector
Message-ID: <j2w4elkctkh22cycelc3eclknwzz47axmqjqwpqwl2binzns6d@w2icvpyy2dst>
References: <20250725050409.2687242-1-suraj.kandpal@intel.com>
 <20250725050409.2687242-18-suraj.kandpal@intel.com>
 <3paeal7ew2pjo6h23rr4t7fqz33avbyxuync5cxnxlh7w4xxr6@ja77buhqtlva>
 <DM3PPF208195D8D5AB9EBE34ED037888D2BE358A@DM3PPF208195D8D.namprd11.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <DM3PPF208195D8D5AB9EBE34ED037888D2BE358A@DM3PPF208195D8D.namprd11.prod.outlook.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzI3MDEzNiBTYWx0ZWRfXxoBVE+9PcpKF
 Ub431tB0/eFYyJ6gcgyKhXR+JFlHuQht9B06RFMZK6slKbeIUXVsv0qIKGcNLf1JumstcVHGYFB
 2oERQ8TLLlRrbpe8o8VRbUbsMB0dqS2vVaSXkenG4wxNGPIRL0EWjGz29I9vhoHLpVpgBRUPiZ6
 3PITWOFkwIzsBIGqF9yeMHceGC7pfAQ2dqU/GVk8zhOines7KWtx0J3bzV4nXjOuOpbJspryaOe
 a7e94WluKo8yPG2batotV2NaaZAj0VX62JaV1QHorvdvyBsUDDiqiOxeSJsfvAAZiQx05eIs//Y
 ponaNM+Ur8NijRsVt/ovv+r194SUufeN/AHgcKyqPy1fyWsuJeAUIJGRsRRuu4pMfNn1K1CFayz
 377gr3MWfbX536lJ18KR3hqJommVddXsxf+4IYYwPgMJGK/McPa0iB7ZDRJ/08n5cl44hGBA
X-Authority-Analysis: v=2.4 cv=fqPcZE4f c=1 sm=1 tr=0 ts=68864be1 cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Wb1JkmetP80A:10 a=EUspDBNiAAAA:8 a=QyXUC8HyAAAA:8 a=e5mUnYsNAAAA:8
 a=P4PJ7VdoEiew2rMEjHIA:9 a=CjuIK1q_8ugA:10 a=pJ04lnu7RYOZP9TFuWaZ:22
 a=Vxmtnl_E_bksehYqCbjh:22
X-Proofpoint-GUID: 27YyUpM1dt2L6mPxWvCV5UvaWtLGZGdl
X-Proofpoint-ORIG-GUID: 27YyUpM1dt2L6mPxWvCV5UvaWtLGZGdl
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-27_05,2025-07-24_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 clxscore=1015 lowpriorityscore=0 impostorscore=0
 adultscore=0 mlxscore=0 spamscore=0 mlxlogscore=999 phishscore=0 bulkscore=0
 malwarescore=0 suspectscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507270136
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

On Sat, Jul 26, 2025 at 04:29:54PM +0000, Kandpal, Suraj wrote:
> 
> 
> > -----Original Message-----
> > From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> > Sent: Saturday, July 26, 2025 6:11 PM
> > To: Kandpal, Suraj <suraj.kandpal@intel.com>
> > Cc: dri-devel@lists.freedesktop.org; intel-xe@lists.freedesktop.org; intel-
> > gfx@lists.freedesktop.org; Nautiyal, Ankit K <ankit.k.nautiyal@intel.com>;
> > Murthy, Arun R <arun.r.murthy@intel.com>; Shankar, Uma
> > <uma.shankar@intel.com>
> > Subject: Re: [PATCH 17/28] drm/i915/writeback: Define function to destroy
> > writeback connector
> > 
> > On Fri, Jul 25, 2025 at 10:33:58AM +0530, Suraj Kandpal wrote:
> > > Define function to destroy the drm_writbeack_connector and
> > > drm_connector associated with it.
> > >
> > > Signed-off-by: Suraj Kandpal <suraj.kandpal@intel.com>
> > > ---
> > >  drivers/gpu/drm/i915/display/intel_writeback.c | 7 +++++++
> > >  1 file changed, 7 insertions(+)
> > >
> > > diff --git a/drivers/gpu/drm/i915/display/intel_writeback.c
> > > b/drivers/gpu/drm/i915/display/intel_writeback.c
> > > index def33191a89e..9b2432d86d35 100644
> > > --- a/drivers/gpu/drm/i915/display/intel_writeback.c
> > > +++ b/drivers/gpu/drm/i915/display/intel_writeback.c
> > > @@ -180,6 +180,12 @@ intel_writeback_detect(struct drm_connector
> > *connector,
> > >  	return connector_status_connected;
> > >  }
> > >
> > > +static void intel_writeback_connector_destroy(struct drm_connector
> > > +*connector) {
> > > +	drm_connector_cleanup(connector);
> > > +	kfree(connector);
> > > +}
> > 
> > Nice example of what I've written in my response to the cover letter:
> > without this commit we have a memory leak here, don't we?
> 
> No we really don't none of this actually takes affect until the connector init is called which is way later 
> So to answer your question this won't really cause a crash and is very bisectable

Ack, thanks. Then it's a fine way to implement the callbacks.

> 
> Regards,
> Suraj Kandpal
> 
> > 
> > > +
> > >  static struct drm_writeback_connector *
> > > intel_get_writeback_connector(struct drm_connector *connector)  { @@
> > > -208,6 +214,7 @@ const struct drm_connector_funcs conn_funcs = {
> > >  	.fill_modes = drm_helper_probe_single_connector_modes,
> > >  	.atomic_duplicate_state = intel_digital_connector_duplicate_state,
> > >  	.atomic_destroy_state =
> > drm_atomic_helper_connector_destroy_state,
> > > +	.destroy = intel_writeback_connector_destroy,
> > >  };
> > >
> > >  static const struct drm_connector_helper_funcs conn_helper_funcs = {
> > > --
> > > 2.34.1
> > >
> > 
> > --
> > With best wishes
> > Dmitry

-- 
With best wishes
Dmitry
