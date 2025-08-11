Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F9C0B20528
	for <lists+dri-devel@lfdr.de>; Mon, 11 Aug 2025 12:22:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BDC5010E416;
	Mon, 11 Aug 2025 10:22:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="cUMKBBWj";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AFC3410E3D5
 for <dri-devel@lists.freedesktop.org>; Mon, 11 Aug 2025 10:22:35 +0000 (UTC)
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57BAFll8023154
 for <dri-devel@lists.freedesktop.org>; Mon, 11 Aug 2025 10:22:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=PPcIqJTmGqbCZt8ehrODmErw
 r7fSzpLsxZ7IoVmL2lM=; b=cUMKBBWj3EH5NRlROXLfL/zm1GMoUGSautoC7RSi
 1wFAYWVWYFr/14MQamSCXshR1yf0ddt7QdUlouf92lq6IqdPgv4cA9Us92bgpe/Q
 XAMtRfmEcewLgnxHI4mSVG8+gPnGySDiAUJOynQbjNbH9DGSd1JshvuIPrzNPJE1
 Tt3E/xNpMRfKdEnS3PHRhdYJb0Q0S+/jL9an1IMQJkAHT+fzc4i6aAy3O5pL8+Je
 Ul0IgWc8WON1I+6X9Pj7aCra3mBe6gCHvMslmeVu44jmA3qyjLdIINq8Aaz7E2DO
 udYJwqmIwSKNKk4/64boVtbG1TXvi972gfJNlnd8FlvEnA==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com
 [209.85.160.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48fem480cj-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Mon, 11 Aug 2025 10:22:34 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id
 d75a77b69052e-4b0a3557d05so87734051cf.2
 for <dri-devel@lists.freedesktop.org>; Mon, 11 Aug 2025 03:22:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1754907754; x=1755512554;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=PPcIqJTmGqbCZt8ehrODmErwr7fSzpLsxZ7IoVmL2lM=;
 b=DBfCahrva+6CnCL4wGxSvfqmo3UzmSOYSaoxuXLwd5VIQ2wIY0VT0RLsO8Hwx9XCGA
 34gf0p1j545JQPJMKM53x9fsmikg3wwMIa/DQfkAtMvedgXABWpau7FxB8D7hYYPel8M
 cG8/WstbtYzqk1gEG+tyPr4S2cw358xjtTVO+15wm2PrsWSVvBirgJrn6MGRYQG6NnTC
 I8TVzssBZqiCFOm9bhELcqjxgcGr7sm5tjLK04cFDGCN6PUWQKE7wX1XoqHI4zaesBsw
 KM0tRn3K3NwQLAU6CKv+H8GND9m5Xo5m/K8hsoYmkoijLoCkFDUJ/k+SWyZj4+5DXcvt
 eCXg==
X-Forwarded-Encrypted: i=1;
 AJvYcCU2m6fqbaxhxGBMvAc8QW3diTYUUYRNGtMh3TDD1i1a/ypW7q+f4vkOthdG6OKcRGfDx5eEHP64590=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwRaOqX0dgpJzwFim/WOXWU1AFfVVXleN9026YEEXJeGJkA6MJt
 ABI4s+qWoRZDVqvFIaR8Dz2muH7pVCnuVA0FzPdQYxsdVvFZ8jWATMpYpI2rTE4/Wf/VoiqnHyh
 Izgbty1bwEsKlsrhqwfXzvrxj0v6Xatgo17odrzZIq/oKM9uG2KFc8/hwx0IGVFCXqDUjDM8=
X-Gm-Gg: ASbGncuD5/SACjtJta5G8DjcDt9YjdEme1Z2U2xzNLAHhEK4V213zMStSRLM3FCGsUg
 lMGiiB+GwCGt4xDdHFbyyHgAxUjwOiOksY2RK2l2/LhGOeU9kzMCI+UgmEBZZTMoo+0nJ2fmSxj
 TixGkPiPxAVI9w4SHiu6t6o0lkiOvaKJ9Ix7FfCtNzXNDo9LYm/67V/kpXYEjAFwvpg/61imUDf
 J/s34pAQ7+l+RfzV+atZl0NY5SnJDFtyJT11kBMgRQ6G0hgNWB4qxQ9SKH9KK2e4TduXPoxV70R
 I50JNA/mT9/lurT41W3rnRfxQVJLjHtngaA7J7KC1t+Joi7/7SH8FBkVFXGvZvBwZdWbxNdwAmp
 EUY+whAIznNEa9lOPXjD655bm88hyigQFQiLSe/i9d067TK36/Yzd
X-Received: by 2002:a05:622a:1887:b0:4ae:f67f:58ef with SMTP id
 d75a77b69052e-4b0aec9df29mr168326121cf.25.1754907753794; 
 Mon, 11 Aug 2025 03:22:33 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE/1O6odL8qEXPebSXBi5VVqvakd8Iz/cxzY+rK1t+2/oJ2Ljc14sGyM/aY/rldP9dMAv6Tpw==
X-Received: by 2002:a05:622a:1887:b0:4ae:f67f:58ef with SMTP id
 d75a77b69052e-4b0aec9df29mr168325461cf.25.1754907753078; 
 Mon, 11 Aug 2025 03:22:33 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-332389409f8sm43713731fa.76.2025.08.11.03.22.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 11 Aug 2025 03:22:32 -0700 (PDT)
Date: Mon, 11 Aug 2025 13:22:30 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Suraj Kandpal <suraj.kandpal@intel.com>, kernel-list@raspberrypi.com,
 amd-gfx@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-renesas-soc@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 freedreno@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 ankit.k.nautiyal@intel.com, arun.r.murthy@intel.com,
 uma.shankar@intel.com, jani.nikula@intel.com, harry.wentland@amd.com,
 siqueira@igalia.com, alexander.deucher@amd.com,
 christian.koenig@amd.com, airlied@gmail.com, simona@ffwll.ch,
 liviu.dudau@arm.com, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, robin.clark@oss.qualcomm.com,
 abhinav.kumar@linux.dev, tzimmermann@suse.de,
 jessica.zhang@oss.qualcomm.com, sean@poorly.run,
 marijn.suijten@somainline.org, mcanal@igalia.com,
 dave.stevenson@raspberrypi.com, tomi.valkeinen+renesas@ideasonboard.com,
 kieran.bingham+renesas@ideasonboard.com, louis.chauvet@bootlin.com
Subject: Re: [RFC PATCH 1/8] drm: writeback: Refactor drm_writeback_connector
 structure
Message-ID: <awtqznhquyn7etojonmjn7karznefsb7fdudawcjsj5g2bok3u@2iqcdviuiz2s>
References: <20250811092707.3986802-1-suraj.kandpal@intel.com>
 <20250811092707.3986802-2-suraj.kandpal@intel.com>
 <20250811094429.GE21313@pendragon.ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250811094429.GE21313@pendragon.ideasonboard.com>
X-Proofpoint-GUID: vwNM9kDTMgDZzxnLCTlNYzj7GjHzoPaw
X-Proofpoint-ORIG-GUID: vwNM9kDTMgDZzxnLCTlNYzj7GjHzoPaw
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODExMDA2OCBTYWx0ZWRfXxkcNC7zJS0mm
 MK3CaK4N5HSWUc8cJFipp3TTsosYe1rc0p76v5FPJP4XALUU102aojTn5jcC24t9odR5sTSkhuC
 O4/1crTHMpi7B7HVH7OYeJ6e3T5VWHiJwuyrD2LFP4DDtVt15H9Xr5GDsBGuoeYz0RClklGflZV
 dWltfgr3JkRjfyxBxyQnpWRAe6pBlsWW2L5LOJ2ujZ88iv3mZljLvnENo6R03v4gZaZNAKvmk30
 L2yKj4G4YyMnAtKEGf+3YAVryaatHrDGw6IqOXsAtaO0HxxDo4OVRc6fxwWu6IazRE+mQqwOvZw
 U4MYSALePLf0HrUhcALmY8lM59iaDTa45SPNMLwsbalVDfHnbFMx1jYfyHE0P1N3sb+7PCAhnKa
 7YM0V6Qk
X-Authority-Analysis: v=2.4 cv=YMafyQGx c=1 sm=1 tr=0 ts=6899c46a cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=2OwXVqhp2XgA:10 a=QyXUC8HyAAAA:8 a=-rapNmeMCNZ-4dkNsN8A:9 a=CjuIK1q_8ugA:10
 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-11_01,2025-08-06_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 clxscore=1015 priorityscore=1501 spamscore=0 suspectscore=0
 adultscore=0 impostorscore=0 malwarescore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2508110068
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

On Mon, Aug 11, 2025 at 12:44:29PM +0300, Laurent Pinchart wrote:
> On Mon, Aug 11, 2025 at 02:57:00PM +0530, Suraj Kandpal wrote:
> > Some drivers cannot work with the current design where the connector
> > is embedded within the drm_writeback_connector such as intel and
> > some drivers that can get it working end up adding a lot of checks
> > all around the code to check if it's a writeback conenctor or not.
> > To solve this we move the drm_writeback_connector within the
> > drm_connector and remove the drm_connector base which was in
> > drm_writeback_connector. We do all other required
> > modifications that come with these changes along with addition
> > of new function which returns the drm_connector when
> > drm_writeback_connector is present.
> > All drivers will be expected to allocate the drm_connector.
> > 
> > Signed-off-by: Suraj Kandpal <suraj.kandpal@intel.com>
> > ---
> >  drivers/gpu/drm/drm_writeback.c | 33 ++++++++++------
> >  include/drm/drm_connector.h     | 60 +++++++++++++++++++++++++++++
> >  include/drm/drm_writeback.h     | 68 ++++-----------------------------
> >  3 files changed, 89 insertions(+), 72 deletions(-)
> > 
> > @@ -2305,6 +2360,11 @@ struct drm_connector {
> >  	 * @cec: CEC-related data.
> >  	 */
> >  	struct drm_connector_cec cec;
> > +
> > +	/**
> > +	 * @writeback: Writeback related valriables.
> > +	 */
> > +	struct drm_writeback_connector writeback;
> 
> No, sorry, that's a bad idea. Most connectors have nothing to do with
> writeback, you shouldn't introduce writeback-specific fields here.
> drm_writeback_connector happens to be a drm_connector because of
> historical reasons (it was decided to reuse the connector API exposed to
> userspace instead of exposing a completely separate API in order to
> simplify the implementation), but that does not mean that every
> connector is related to writeback.
> 
> I don't know what issues the Intel driver(s) have with
> drm_writeback_connector, but you shouldn't make things worse for
> everybody due to a driver problem.

Suraj is trying to solve a problem that in Intel code every drm_connector
must be an intel_connector too. His previous attempt resulted in a loose
abstraction where drm_writeback_connector.base wasn't initialized in
some cases (which is a bad idea IMO).

I know the historical reasons for drm_writeback_connector, but I think
we can do better now.

So, I think, a proper approach would be:

struct drm_connector {
    // other fields

    union {
        struct drm_connector_hdmi hdmi; // we already have it
        struct drm_connector_wb wb;  // this is new
    };

    // rest of the fields.
};

I plan to add drm_connector_dp in a similar way, covering DP needs
(currently WIP).

-- 
With best wishes
Dmitry
