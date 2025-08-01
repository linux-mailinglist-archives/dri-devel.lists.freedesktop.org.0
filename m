Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EB9AFB1800D
	for <lists+dri-devel@lfdr.de>; Fri,  1 Aug 2025 12:17:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D566110E2F2;
	Fri,  1 Aug 2025 10:17:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="DQ43fMwv";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CC8ED10E2F2
 for <dri-devel@lists.freedesktop.org>; Fri,  1 Aug 2025 10:17:51 +0000 (UTC)
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5719Rvbh018796
 for <dri-devel@lists.freedesktop.org>; Fri, 1 Aug 2025 10:17:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=kGg6rqM1u5SDrbr76JM+wROW
 k0Dbpz++/IEnvo6Rduo=; b=DQ43fMwvNCnGyCDI47/ih7QrlHdtadKeJwdECzOg
 dnnqb0QOEbYLuc3//yB4hFm/pIdrKsti58b1DITQSQXLaY/HNrd93GOJjb2KH+T4
 clNzqSD3K3vf9MYpIfByVu2uTdTXjiUgrInVmLwUAvL3UeF8PpEIUB12/oIisN19
 50GE0hgN6MbOtNfibHxhAS0Nqntazc5Er+2O+FQXQ2tobROI0SvRwF7VxTDaV8UH
 7OoRdgIxJpPdL7KI54RQe3dgoadsoXRdvOPFFMWSngQ07zhptoCRGjFWKVEybWCl
 dIXuqGQbej4BwnX8gn86GuzGMNSdErspSOfI7Ss6d6UOIw==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com
 [209.85.219.72])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 487jwgg02f-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Fri, 01 Aug 2025 10:17:49 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id
 6a1803df08f44-7073d7fbfe6so31777936d6.3
 for <dri-devel@lists.freedesktop.org>; Fri, 01 Aug 2025 03:17:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1754043468; x=1754648268;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=kGg6rqM1u5SDrbr76JM+wROWk0Dbpz++/IEnvo6Rduo=;
 b=CSWi8hfk0hCowTNWzO0BiuPyamehxCrb0HxHl/TRqTpD/Q3gXsaN0yw7H2c1Xv2/rs
 PsyF1EQicOIYV1h36mfT2/MTh9o6xlgQ/uXWG2M6Zjct1xLSdCc9Mip/+gMJyniRTrSQ
 FnOdXE8JN62ftWCwKQ/8Ys9G3/mZl7AqRImj+bZ6e7al75n0jT2H2ttItL547opBUN/c
 sWHfAHB3qM4p2E0o29cCb2qCAfnEdT3OU5fPQgJTcqj9EcTEbsYrkg3mM+WDzYBA3hLA
 XaQNPLL1DA6kj9ep75hXkLYkK1j6xDbbX0nm81krDI8iMW0aX6JdfSefnhwfncki55Rd
 mOkg==
X-Gm-Message-State: AOJu0YzHJk549G1ECaROarwLjwITAewHVNe7jwOsCH6MkjdF02LMqUgp
 Qfe1O4NOrFWnOyh2JoP7XFwJNdOzMqXRwL6H0IxOEw3hUsuqNnOC0ha3jVGX5Ve/vRwxXftT/VX
 9JMclkw2yZx5WkwsbYplj3BwP6JR9HQGK8JTW9C2qO2pRlxPLEhhE07lMBJZ+g5ucr0dBDsc=
X-Gm-Gg: ASbGncu5MSclV9qtJw9QOyCy0jNlHT8R+IIC/S9IodQiGN0SrgPKhV2eQyuD+t7dsMq
 vX8ahx4dGlSKblptK5DqISw4pifLMLNMtIdflGxpph8JpjHzG6PMrDwOg7dG0JEe6REFwwPKobW
 aF8My8CUi+yDF/hVEGDYfLM+EZS/iiDiF84Rte2l3G/SSXgkMk7U3upSfooG9c6GpanCZNq3mQK
 nygyorYUnvVgCOyma5X+ZdBoWgNwP2MPf+4W4C3ga7WV8QS6j+uDTGUliknoQ3iSSx7MnRugDnu
 OuUam5ZCixg5jtvGcrqo69/mk8zSvc2GZU4RtUsEIHxCcquauB/nIBgh3KuX9yiDC/mHlHIvFek
 Eq6xBdGDzQraDFgYxl5yCSUNow7DnNwoPCOFrP7ksO6glznwVJxuY
X-Received: by 2002:a0c:f40e:0:b0:707:6d96:6dd with SMTP id
 6a1803df08f44-7076d96112emr130424466d6.35.1754043467723; 
 Fri, 01 Aug 2025 03:17:47 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFYkzZknJw3VF/Vc50PaqHUQkABW2fMh1pyf1ULI+PgSKzGEczMndHvWDfKg6gTO/WkUSnGjQ==
X-Received: by 2002:a0c:f40e:0:b0:707:6d96:6dd with SMTP id
 6a1803df08f44-7076d96112emr130424036d6.35.1754043467179; 
 Fri, 01 Aug 2025 03:17:47 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-55b88cabce5sm538607e87.151.2025.08.01.03.17.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 01 Aug 2025 03:17:46 -0700 (PDT)
Date: Fri, 1 Aug 2025 13:17:44 +0300
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
Message-ID: <pax7q7t6gqf4v2ots4ycdfpyecyb62eycht5vlzxodxfl5tlzv@axijwakktt2u>
References: <20250725050409.2687242-1-suraj.kandpal@intel.com>
 <20250725050409.2687242-4-suraj.kandpal@intel.com>
 <ng2ps7k5h74w6zo62oqazzetunjc2psooobmh3zcrrmxesi2ua@va6z7eqjst2u>
 <DM3PPF208195D8D2676D013483985D2C3FFE358A@DM3PPF208195D8D.namprd11.prod.outlook.com>
 <t5fmzuwiy2otubqftwdghakwmbeltavhbsvrfhgi4tc52uigys@sg2jgz6yjjk7>
 <DM3PPF208195D8D9147AC80569982DE55EBE326A@DM3PPF208195D8D.namprd11.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <DM3PPF208195D8D9147AC80569982DE55EBE326A@DM3PPF208195D8D.namprd11.prod.outlook.com>
X-Authority-Analysis: v=2.4 cv=WvgrMcfv c=1 sm=1 tr=0 ts=688c944d cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=2OwXVqhp2XgA:10 a=QyXUC8HyAAAA:8 a=s_w-jfvKb66AtO-dxM8A:9 a=CjuIK1q_8ugA:10
 a=pJ04lnu7RYOZP9TFuWaZ:22
X-Proofpoint-ORIG-GUID: C7flvjcDZgtcqiMfMPN-nmA1FSH_TZNS
X-Proofpoint-GUID: C7flvjcDZgtcqiMfMPN-nmA1FSH_TZNS
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODAxMDA3MSBTYWx0ZWRfX+IxkVD0k5wAi
 UJqlAdwP6BPkJH+nHw+gkOh8NRzbWotxJVkD5FoVnP5me3IVD9v7r76lcBRpeJ8sELsFx68uIqH
 jYGxhoACW4uxAL3dcuehCdJsikUAGkWPKaK4OWlp1clqxZGHX2IXlBhfqKjXdBN2+mV4Uzl497W
 3tjjfXgY0nWeFD1xr8UuEWNSew2SOmeM8ih6sMPIf9BaW8mBX8HyFX/BLNY0IKa+wwfrMdlf6ts
 kzF7JhEomBsC68nvB1T+qcD8vRKqvkybYO1f4t3B5er8TdRUoAxpaUYBo7zlgOJYk6nztC2qLPS
 0AvYx9bWzIH14xheQKXgdiPD+LmJiN1zMZ2Xj7+G48q/s18KpwTxKHhnvi8/lR6jUqOPm/F7dSf
 lLUuiBBahqdNr0X+xiR8DFHwT3XB4NVAE3zdjP0BuBuPtbPLZfqbf5TmsoYLGyjtak347hck
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-01_03,2025-07-31_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 bulkscore=0 clxscore=1015 suspectscore=0 lowpriorityscore=0
 spamscore=0 mlxscore=0 impostorscore=0 adultscore=0 malwarescore=0
 priorityscore=1501 mlxlogscore=999 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2508010071
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

On Fri, Aug 01, 2025 at 05:18:47AM +0000, Kandpal, Suraj wrote:
> > Please tune your mail client to insert smaller quotation headers. This is just
> > useless.
> > 
> > > >
> > > > > Now that drm_connector may not always be embedded within
> > > > > drm_writeback_connector, let's define a function which either uses
> > > > > the writeback helper hook that returns the drm_connector
> > > > > associated with the drm_writeback_connector or just return the
> > > > > drm_connector embedded inside drm_writeback_connector if the
> > > > > helper hook is not present. Lets use this function and call it
> > > > > whenever drm_connector is required mostly when connector helper
> > private funcs need to be fetched.
> > > > >
> > > > > Signed-off-by: Suraj Kandpal <suraj.kandpal@intel.com>
> > > > > ---
> > > > >  drivers/gpu/drm/drm_writeback.c | 33
> > > > > ++++++++++++++++++++++++++-------
> > > > >  1 file changed, 26 insertions(+), 7 deletions(-)
> > > > >
> > > > > diff --git a/drivers/gpu/drm/drm_writeback.c
> > > > > b/drivers/gpu/drm/drm_writeback.c index e9f7123270d6..d610cb827975
> > > > > 100644
> > > > > --- a/drivers/gpu/drm/drm_writeback.c
> > > > > +++ b/drivers/gpu/drm/drm_writeback.c
> > > > > @@ -120,6 +120,18 @@ drm_connector_to_writeback(struct
> > > > drm_connector
> > > > > *connector)  }  EXPORT_SYMBOL(drm_connector_to_writeback);
> > > > >
> > > > > +static struct drm_connector *
> > > > > +drm_connector_from_writeback(struct drm_writeback_connector
> > > > > +*wb_connector) {
> > > > > +	const struct drm_writeback_connector_helper_funcs *funcs =
> > > > > +		wb_connector->helper_private;
> > > > > +
> > > > > +	if (funcs && funcs->get_connector_from_writeback)
> > > > > +		return funcs-
> > > > >get_connector_from_writeback(wb_connector);
> > > >
> > > > The get_connector_from_writeback() and
> > > > drm_writeback_connector_helper_funcs should be moved to this patch.
> > >
> > > Want to keep them separate since they themselves introduce a lot of
> > > changes on of them has use introducing a new writeback_helper_function
> > structure.
> > 
> > Let's see how the series will take shape.
> > 
> > >
> > >
> > > >
> > > > However it feels really awkward to make drm_writeback_connector,
> > > > which is a wrapper around the drm_connector, to use some external DRM
> > connector.
> > > > A quick grepping reveals API (which you missed) that expects
> > > > drm_writeback_connector.base to be a valid connector. And it would
> > > > be very hard to catch sunch an API later on.
> > >
> > > Also seems like I did miss the fence_get_driver_name one which is an
> > > easy fix or did you see anything else.
> > > Really don't see any other problematic areas
> > 
> > Yes, it was that function. However it is a nice example of how easy it is to miss a
> > call. Likewise anybody else changing the code might easily not notice that Intel
> > driver uses drm_writeback_connector in a strange way.
> > >
> > > >
> > > > If you want to use DRM framwework, while retaining intel_connector
> > > > for writeback connectors, I'd suggest following slightly different
> > > > path: extract common parts of drm_writeback_connector into a common
> > > > structure, and use it within the DRM core. Then provide functions to
> > > > fetch drm_connector from that struct or fetch it from drm_connector.
> > >
> > > Causes a lot of changes in the drm_writeback_connector structure
> > > causing every other driver Using this to change how they essentially
> > > call upon drm_writeback_connector. This API was to provide more non
> > invasive way to give everyone another alternative.
> > 
> > Currently drm_writeback_connector is documented and implemented as being
> > a wrapper around drm_connector. You are changing that contract in a non-
> > intuitive way. I think there are several options on how to proceed:
> > 
> > - Clearly and loudly document that drm_writeback_connector is no longer
> >   a wrapper around drm_connector. Clearly document how to distinguish
> >   those two cases. In my opinion this is the worst option as it is
> >   significantly error-prone
> > 
> 
> I think this is already done when drm_writeback_connector_init_with_conn is
> Defined

No. You also need to update drm_writeback_connector documentation, etc.

> 
> > - Make sure that the DRM framework can use writeback without
> >   drm_writeback_connector and them implement all necessary plumbing in
> >   the Intel driver. This can result in singnificant amount of code
> >   duplication, so I'd skip this option.
> 
> Hmm Agreed.
> 
> > 
> > - Separate writeback parts of drm_writeback_connector into a struct,
> >   make drm_writeback_connector include drm_connector, new struct and
> >   most likely drm_encoder. Implement conversion callbacks (like you did
> >   in your patchset).
> 
> Again a lot of changes to other drivers which everyone will resist.
> Something like this was tried previously with both encoder and connector
> which was not accepted leading the patch series towards creation 
> of the drm_writeback_connector_init_with_encoder.
> 
> > 
> > - Rework drm_writeback_connector and drm_connector in a similar way, but
> >   use writeback structure as a field inside drm_connector (similar to
> >   how we got the HDMI data). This saves you from having all conversion
> >   callbacks and makes it extensible for other drivers too. In fact you
> >   can use an anonymous union, making sure that HDMI and writeback
> >   structures take the same space in memory.
> 
> The idea of not having it inside drm_connector was that it's not a "real connector"
> and we should not be treating it like one which makes me a little doubtful on if the
> community will go for this.

Well... It is a "real" connector, otherwise e.g. Intel wouldn't have to
wrap it into an intel_connector structure. I think this is more of the
historical behaviour - to wrap the structure instead of adding data to
it. HDMI connector showed that it's much easier to add data, so I assume
it would be a preferred approach.

> 
> > 
> > My preference is shifted towards the last option, it follows current HDMI
> > subclassing design and it doesn't add unnecessary complexity.
> > 
> > Yes, this requires reworking of all writeback drivers. Yes, it's a price of having
> > your own subclass of drm_connector. No, in my optionion, leaving a semi-
> > broken abstraction is not an option. Whatever path gets implemented, it should
> > be internally coherent.
> 
> Well to be honest this has already been done with drm_encoder which is placed
> Inside drm_writeback_connector with drm_writeback_connector_init_encoder
> so this is not something very unintuitive. Also I feel messing with all other drivers by changing
> writeback structure is the more error prone way to go about it.

This is what we frequently have to do: change other drivers and depend
on developers testing them.

For the reference, currently only the following drivers implement
writeback. I think it's a pretty manageable change:

- AMDGPU
- ARM/Komeda
- ARM/Mali
- MSM/dpu1
- R-Car
- VC4
- VKMS

Yes, it requires some effort. But I think that it's better than just
making drm_connector part optional. 

> Also it will be understood that
> drm_writeback_connector does not contain drm_connector to those using this API as it
> will be documented. So its not really the semi-broken abstraction.

Thinking in OOP terms, the encoder is just a field in the struct.
drm_connector is a base class for drm_writeback_connector. By making it
optional, you are definitely semi-breaking the abstraction.



-- 
With best wishes
Dmitry
