Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 34364B13031
	for <lists+dri-devel@lfdr.de>; Sun, 27 Jul 2025 17:54:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C3F5C10E3D7;
	Sun, 27 Jul 2025 15:54:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="ik4zje6i";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 711D310E2FC
 for <dri-devel@lists.freedesktop.org>; Sun, 27 Jul 2025 15:54:29 +0000 (UTC)
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56REP6g2021244
 for <dri-devel@lists.freedesktop.org>; Sun, 27 Jul 2025 15:54:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=Ao8IKFarj2aGNM23ibXqNI4j
 6HWiik0jzypmk4vo4jQ=; b=ik4zje6ih9prjzDbBx+IqQPgDEsOnCvLLcOBkr78
 d4sua6FgkeZYoolAT836IpaJOJBa9rNmSvIVU0nK4nuJocI+KYrHu98KJziKdnJ6
 zFjNUjuW0Eys0bQ+75ea90YOwFdv2aykDGvm2/baRLZLrudgsGhK2iuBZTBTK1R5
 /s1xRcMtcTK8NAe0AvFQvndVsbo6OwSN073TOtwmXzSGBSa1tfCH5w1R8FnOu2sx
 PGRwfo5GTNNiXBeU9goxJlMIEfUdrmXkKzad8I+o54KQwRjdkHhGbec1dbufJWCa
 1f4HibXM6dN0aFDnSeccZuwevTCY/EpLqyIWiEMcIQQUZg==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com
 [209.85.222.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 484qd9t9g9-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Sun, 27 Jul 2025 15:54:28 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id
 af79cd13be357-7e33af599bcso610922185a.1
 for <dri-devel@lists.freedesktop.org>; Sun, 27 Jul 2025 08:54:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1753631667; x=1754236467;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Ao8IKFarj2aGNM23ibXqNI4j6HWiik0jzypmk4vo4jQ=;
 b=U3a7ABguJmn+lWFo1TzXVrIfnvw4nO013aQZaKXoRgkXg+5daDBoYFeTQKSojaqUgS
 WNesq1dZt1GKOUMSFTxLTCbTLkmKtv3fZV5RWUPmQW5r5jhiJ8qdjlJ9l6pJgdisr13W
 6lf0w7sXDARcap9WI8fEh5Vp0zPW5FdOaA6OS0FVV8zZ+d903fCY5Vh6FEY1aHNDJfRt
 rbKw53RF/IIt3rHvs6pu1jjyVSP9DnGhR+SvPHI8DWMmBcx4RBbbQz2spEtJoaZ7aJgZ
 uUmVsM+IXCLkhGzaV6+9bJZ8ci0/PS6fjfiFImhIBLRjxgdw65IWX54PEvG1oAOp1tLR
 TjhQ==
X-Gm-Message-State: AOJu0YwGbzjQQ3AA3C1vng6XWVCwofJyux2xod3mBaKrbS/yH1rBXrYO
 xnwhg9QHJwoWmVW0c4JHJfDQRfWlZ2FB3RM7ydILCQlxtrGXv5cGRX84RYw5arTMpzjcfD8gRPg
 cui59d2SwXh/dNAnbkVS0klvQvXJfeHC/3KtoMaliJG8LIUGJnptFaU9oleZ+Ozqho8J2OPHJi1
 AIPSM=
X-Gm-Gg: ASbGncuubu7PMtafKqXektNPObbff6XNh31EL1nxHwKgR1Qkaa9AzVeDPiHjh0mX/m4
 kfPkfzjfaAVng7Qn5EjBmz0CsxZwb5Re5TinIOXlFKe9PGP4gQfwV6TVObHQVGtjRGThoxA9jqv
 jVChaxAZn5V+M5iEI87JgdDQzHeZhMePO3uyc29tl6bKFSYv/JsFlLqjnsrMrE5UwaJNO0yCtdX
 HkjTTwp2lWijpwVweYrIOuZr7l7njBawHl6VXl5GQ5M6ITUc2Z+dpaLs7ZfVFJnAIFHzdqD/eUp
 WQe/AjUkaFtTB9XOCZBptykf2nEUgsRLnSXNWDEwwtDLTmifY00rIIbH4//QQiwr5HxQwMqyl4X
 OoePzGJFk8ROx8UgCJ8B8fjqWeJ3Jmt5pL9DLVeUbRVMiTwz0ELwR
X-Received: by 2002:a05:620a:1907:b0:7e6:2893:5c71 with SMTP id
 af79cd13be357-7e63bf69b36mr1029939185a.7.1753631666658; 
 Sun, 27 Jul 2025 08:54:26 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFT+8sCh1nSP0K329lxXeq+dHsVtm1hSC1otyUn4YSpBsXG4/kAOjmm01UTGDjJlvzY+8UI/A==
X-Received: by 2002:a05:620a:1907:b0:7e6:2893:5c71 with SMTP id
 af79cd13be357-7e63bf69b36mr1029936485a.7.1753631666068; 
 Sun, 27 Jul 2025 08:54:26 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-55b63395aecsm874001e87.183.2025.07.27.08.54.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 27 Jul 2025 08:54:24 -0700 (PDT)
Date: Sun, 27 Jul 2025 18:54:21 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: "Kandpal, Suraj" <suraj.kandpal@intel.com>
Cc: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 "Nautiyal, Ankit K" <ankit.k.nautiyal@intel.com>,
 "Murthy, Arun R" <arun.r.murthy@intel.com>,
 "Shankar, Uma" <uma.shankar@intel.com>
Subject: Re: [PATCH 03/28] drm/writeback: Define function to get
 drm_connector from writeback
Message-ID: <t5fmzuwiy2otubqftwdghakwmbeltavhbsvrfhgi4tc52uigys@sg2jgz6yjjk7>
References: <20250725050409.2687242-1-suraj.kandpal@intel.com>
 <20250725050409.2687242-4-suraj.kandpal@intel.com>
 <ng2ps7k5h74w6zo62oqazzetunjc2psooobmh3zcrrmxesi2ua@va6z7eqjst2u>
 <DM3PPF208195D8D2676D013483985D2C3FFE358A@DM3PPF208195D8D.namprd11.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <DM3PPF208195D8D2676D013483985D2C3FFE358A@DM3PPF208195D8D.namprd11.prod.outlook.com>
X-Proofpoint-ORIG-GUID: 3YE_fbmpC-4mlmx36Oj_Q270yM_yUf_G
X-Authority-Analysis: v=2.4 cv=Pfv/hjhd c=1 sm=1 tr=0 ts=68864bb4 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Wb1JkmetP80A:10 a=EUspDBNiAAAA:8 a=QyXUC8HyAAAA:8 a=e5mUnYsNAAAA:8
 a=0sPBWD2CCCFBD5ApftYA:9 a=CjuIK1q_8ugA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
 a=Vxmtnl_E_bksehYqCbjh:22
X-Proofpoint-GUID: 3YE_fbmpC-4mlmx36Oj_Q270yM_yUf_G
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzI3MDE0MSBTYWx0ZWRfX0QfwfuGijNlj
 7OMgbUZocpXT5HjQisUZZECSsCCyStn2fKUU65tZSW/RrSLD/EGl8iQvmlQEYZ7iZduFx42zSGq
 BigZi0HYFW+54K5WSQ1enosM2ar+4Be0fSKYRgxwxH/LsRvEkssMXiq+xv3brXW1n5QW+qcxGvp
 3HfA7ovvoQzfWmnG7ckIRER8tUazPMFQCiLWmJDOIK1xSsEh+3QT0ER7tomB7oonFGzxn7Atm+b
 f4vFvcAdJ+gvf+BRWpBp24JHqA4GkEjeKK+dqdzwadGJTYA9Y4u9p8N2C2VVonuqXWNEaP5fvhf
 GHeGlxb7o20h0/TazKTgCV4kYPx8Ot8tVM5EhcAJxekbkpPwtdCuiSVddnu2/Rn+Y2nG0CJfNzk
 UZYx5WYjmae6gn9dUCoFKZBKjyzvw8OlQq5ceK6XT3LAxEvhdec6BGqM5kxUyqa9LB3Ga1xD
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-27_05,2025-07-24_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxlogscore=999 clxscore=1015 adultscore=0 priorityscore=1501 mlxscore=0
 spamscore=0 suspectscore=0 phishscore=0 lowpriorityscore=0 malwarescore=0
 impostorscore=0 bulkscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507270141
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

On Sat, Jul 26, 2025 at 04:49:44PM +0000, Kandpal, Suraj wrote:
> 
> 
> > -----Original Message-----
> > From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> > Sent: Saturday, July 26, 2025 6:04 PM
> > To: Kandpal, Suraj <suraj.kandpal@intel.com>
> > Cc: dri-devel@lists.freedesktop.org; intel-xe@lists.freedesktop.org; intel-
> > gfx@lists.freedesktop.org; Nautiyal, Ankit K <ankit.k.nautiyal@intel.com>;
> > Murthy, Arun R <arun.r.murthy@intel.com>; Shankar, Uma
> > <uma.shankar@intel.com>
> > Subject: Re: [PATCH 03/28] drm/writeback: Define function to get
> > drm_connector from writeback

Please tune your mail client to insert smaller quotation headers. This
is just useless.

> > 
> > On Fri, Jul 25, 2025 at 10:33:44AM +0530, Suraj Kandpal wrote:
> > > Now that drm_connector may not always be embedded within
> > > drm_writeback_connector, let's define a function which either uses the
> > > writeback helper hook that returns the drm_connector associated with
> > > the drm_writeback_connector or just return the drm_connector embedded
> > > inside drm_writeback_connector if the helper hook is not present. Lets
> > > use this function and call it whenever drm_connector is required
> > > mostly when connector helper private funcs need to be fetched.
> > >
> > > Signed-off-by: Suraj Kandpal <suraj.kandpal@intel.com>
> > > ---
> > >  drivers/gpu/drm/drm_writeback.c | 33
> > > ++++++++++++++++++++++++++-------
> > >  1 file changed, 26 insertions(+), 7 deletions(-)
> > >
> > > diff --git a/drivers/gpu/drm/drm_writeback.c
> > > b/drivers/gpu/drm/drm_writeback.c index e9f7123270d6..d610cb827975
> > > 100644
> > > --- a/drivers/gpu/drm/drm_writeback.c
> > > +++ b/drivers/gpu/drm/drm_writeback.c
> > > @@ -120,6 +120,18 @@ drm_connector_to_writeback(struct
> > drm_connector
> > > *connector)  }  EXPORT_SYMBOL(drm_connector_to_writeback);
> > >
> > > +static struct drm_connector *
> > > +drm_connector_from_writeback(struct drm_writeback_connector
> > > +*wb_connector) {
> > > +	const struct drm_writeback_connector_helper_funcs *funcs =
> > > +		wb_connector->helper_private;
> > > +
> > > +	if (funcs && funcs->get_connector_from_writeback)
> > > +		return funcs-
> > >get_connector_from_writeback(wb_connector);
> > 
> > The get_connector_from_writeback() and
> > drm_writeback_connector_helper_funcs should be moved to this patch.
> 
> Want to keep them separate since they themselves introduce a lot of changes on of them
> has use introducing a new writeback_helper_function structure.

Let's see how the series will take shape.

> 
> 
> > 
> > However it feels really awkward to make drm_writeback_connector, which is
> > a wrapper around the drm_connector, to use some external DRM connector.
> > A quick grepping reveals API (which you missed) that expects
> > drm_writeback_connector.base to be a valid connector. And it would be very
> > hard to catch sunch an API later on.
> 
> Also seems like I did miss the fence_get_driver_name one which is an easy fix or
> did you see anything else.
> Really don't see any other problematic areas

Yes, it was that function. However it is a nice example of how easy it
is to miss a call. Likewise anybody else changing the code might easily
not notice that Intel driver uses drm_writeback_connector in a strange
way.
> 
> > 
> > If you want to use DRM framwework, while retaining intel_connector for
> > writeback connectors, I'd suggest following slightly different path: extract
> > common parts of drm_writeback_connector into a common structure, and
> > use it within the DRM core. Then provide functions to fetch drm_connector
> > from that struct or fetch it from drm_connector.
> 
> Causes a lot of changes in the drm_writeback_connector structure causing every other driver
> Using this to change how they essentially call upon drm_writeback_connector. This API
> was to provide more non invasive way to give everyone another alternative.

Currently drm_writeback_connector is documented and implemented as being
a wrapper around drm_connector. You are changing that contract in a
non-intuitive way. I think there are several options on how to proceed:

- Clearly and loudly document that drm_writeback_connector is no longer
  a wrapper around drm_connector. Clearly document how to distinguish
  those two cases. In my opinion this is the worst option as it is
  significantly error-prone

- Make sure that the DRM framework can use writeback without
  drm_writeback_connector and them implement all necessary plumbing in
  the Intel driver. This can result in singnificant amount of code
  duplication, so I'd skip this option.

- Separate writeback parts of drm_writeback_connector into a struct,
  make drm_writeback_connector include drm_connector, new struct and
  most likely drm_encoder. Implement conversion callbacks (like you did
  in your patchset).

- Rework drm_writeback_connector and drm_connector in a similar way, but
  use writeback structure as a field inside drm_connector (similar to
  how we got the HDMI data). This saves you from having all conversion
  callbacks and makes it extensible for other drivers too. In fact you
  can use an anonymous union, making sure that HDMI and writeback
  structures take the same space in memory.

My preference is shifted towards the last option, it follows current
HDMI subclassing design and it doesn't add unnecessary complexity.

Yes, this requires reworking of all writeback drivers. Yes, it's a price
of having your own subclass of drm_connector. No, in my optionion,
leaving a semi-broken abstraction is not an option. Whatever path gets
implemented, it should be internally coherent.

-- 
With best wishes
Dmitry
