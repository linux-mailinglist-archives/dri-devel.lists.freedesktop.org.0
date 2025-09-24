Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E7EAB9C488
	for <lists+dri-devel@lfdr.de>; Wed, 24 Sep 2025 23:37:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A7E3510E7F6;
	Wed, 24 Sep 2025 21:37:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="o7Cyc/G7";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CD1D510E7FA
 for <dri-devel@lists.freedesktop.org>; Wed, 24 Sep 2025 21:37:45 +0000 (UTC)
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58OD1OYq025119
 for <dri-devel@lists.freedesktop.org>; Wed, 24 Sep 2025 21:37:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=+LWMcHOEBBSjIu6HjaNRoCnF
 ezg9WxmzMxfF9Ioo3lg=; b=o7Cyc/G7RBSpgg9BOs9QMX6PPXKdt628WBxpdfoy
 +D5exQ9zoKhoEKG5k8AGEXEN6ISVyvgb+lWeVpNAkrxW9dM2QZYbdyimEI5jLJD8
 k+Kwka3Lo1k4lqh8iJ1vV+nAa4xqRcBcgw3jSsFGOcnOu5vNne4cJzNc1Z2llJ+z
 ZVDBgDYt0ZcgH+iMIdc2x73fcswl1rZpyR3TlS9b4L+1mCRm5GwwA+J/dQ8SgUMG
 3qG1pe7FjdBEyokycMviTqrOupZlRlCyg/H/iYQExDlI+f3HbbsannJ02pIHtHHM
 wyK5oJyU/blI7RtIFwSdI3u4IxBGcDIkfY3pomhxfedvSA==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com
 [209.85.160.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 499kv15ugn-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Wed, 24 Sep 2025 21:37:44 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id
 d75a77b69052e-4b5f31ef7dfso30602721cf.1
 for <dri-devel@lists.freedesktop.org>; Wed, 24 Sep 2025 14:37:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1758749864; x=1759354664;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=+LWMcHOEBBSjIu6HjaNRoCnFezg9WxmzMxfF9Ioo3lg=;
 b=kYUqrj4eocMsZyEY4FOuP0yNGD+8kR3wx3XCKgTNiJJDlcABZFqAWJSEK5fpJ5mh11
 tWKqnhHXB9fUQXjCH8cb+3h1hkGPQaoxOyj1eNKdVVFDLQHjttfSJdxl6HpTEfkcboFC
 ok71Cj8YKxicO5sigB43KRDCUKQcTIK/XBWHIyB4KSicLk23FIZOTMJSmUBazhMDVO4i
 5OndQS7BBdUkH9pBmeuqzrpNCD6AvQXPF8IETaIORT+qXoCKs3wt+lLaicMbfErSIrr4
 TuWkA7u/FcDkJL8N6yKk8veV8tW9ndwgfyvGUe+ifHqe/EgzHx5IvCv2GDWrH2bdLXGH
 P9xg==
X-Forwarded-Encrypted: i=1;
 AJvYcCXFeLVYRG35RERHFdcEvikg6bji4B8ekpHiBLXGT2cl8gz0E1vspi44a+/sufd6ZAdECAyoFUfV+WY=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxyIb1y9HbpT+Od5HzsGydf1vKEFndX3XaEhZkMmWlqpQ8avWLa
 bYtFr+dOhkJQS/xK5G4vmvTycix9Xo7LT8r5yBjTWt5f9XID6T1zW/L8uOP6UmVHZTF0q4ItF85
 cY0F9PeEy1pCAamGhhatr+moNBvu403sqnem2oaXFIMmUy9YyYhxBxZv8eW8i/Zjri7Us96k=
X-Gm-Gg: ASbGncumVb2MTHf/EQA4rj3YO3a8FtG8xFhxFcau96s0pyCyp9hjnPdIiYnfqIeJo5N
 PTk50kmG4l/4awZVCiMtOaLQhBP65RZYr62mCzqzK/8HIhyx7epyIYNnED9tM8zdlbxa0V/l+X9
 SAZeaiHyVb+/CigVP2tNx/MB2onEWIipA30R2wZoYasRcm+irQKpCOv4LOu3+hR1l52A3Avf/vg
 lTeQgzcKz9k/XVtBsjnayjaeRDl9dZXzPKT6sbw5ClJuDEbVuOA2SwSEsMvj3z+ty1SaX7BnfZ4
 Bvphmdqt2vjxVw/FskidYYeWjoc5xtePpgtgrWuF4u1Hu12JS+DiZTL4E3vCEhq5u0RGomw+pxO
 2qc2rx1WvaW+UIDdMfPu9il1Xfv1uJ+8EOpwy+QaIWur06bfD8hPT
X-Received: by 2002:a05:622a:1a17:b0:4b5:d6db:eea1 with SMTP id
 d75a77b69052e-4dace86a5cbmr4251711cf.39.1758749863853; 
 Wed, 24 Sep 2025 14:37:43 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGPfyIi2ayPb/sO/lv0mAYAzgDsHeJzF67rIJ9gVVx+aqAsQhGtcbFiIHBvkxUQvaj+Ma8akQ==
X-Received: by 2002:a05:622a:1a17:b0:4b5:d6db:eea1 with SMTP id
 d75a77b69052e-4dace86a5cbmr4251521cf.39.1758749863458; 
 Wed, 24 Sep 2025 14:37:43 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-36fb4772ca2sm680451fa.12.2025.09.24.14.37.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 24 Sep 2025 14:37:41 -0700 (PDT)
Date: Thu, 25 Sep 2025 00:37:38 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Johan Hovold <johan@kernel.org>
Cc: Philipp Zabel <p.zabel@pengutronix.de>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, dri-devel@lists.freedesktop.org,
 imx@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/4] drm/imx: drop unused module aliases
Message-ID: <rtzqwhocoa5hd3qxepuyitimlvrvecvcc57v6kynrnwbnwrfec@pnslpeadk3mr>
References: <20250924092643.26113-1-johan@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250924092643.26113-1-johan@kernel.org>
X-Proofpoint-GUID: xXuuNJ-TKHaHPPXqnGVtQGkqUqIvdaPc
X-Authority-Analysis: v=2.4 cv=RO2zH5i+ c=1 sm=1 tr=0 ts=68d464a8 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=biaaIsZr-oeAOlJ4UdQA:9 a=CjuIK1q_8ugA:10
 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTIwMDAyNSBTYWx0ZWRfX1NZStGvdxgG1
 BZpmMu2WkSth4vdgsl+/LZuRvQwcWGMhn7dJ0zYHQlq1ZPYRM0UmZGxybdLiU6TwmxSUIcJ0tfF
 jJuo0af//hDcoCXmuFf6WtcX/zExWQ5tUasQ2GcgRc3bNcVV5AjJWu4oJv6gujQRe02Xsmdu3Ic
 hHZXvcdC/3DfsV0vDakxXFQSKvTwiTuxU4kJmYa0egI2N3oz5qZii414cApxXmA7738hMExBOHr
 3QWFlhZudDYjJtKoM1q7CrZRzdAMcXVB5adO8PSnw+c3+FmBQdn95UdcqvAe2b66WG7lGdcQf38
 fNNOBmGqnk/J7IbpYN+JeJ3ar3Xca/aW/t0IV2QoCsFCep1lyoxsz30uIvO7TWtvR7kAKnAEjNA
 aQK1vmC1
X-Proofpoint-ORIG-GUID: xXuuNJ-TKHaHPPXqnGVtQGkqUqIvdaPc
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-24_06,2025-09-24_01,2025-03-28_01
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

On Wed, Sep 24, 2025 at 11:26:39AM +0200, Johan Hovold wrote:
> When fixing up a device reference leak in the tve drivers I noticed it
> had an unused platform alias. This series drops unused aliases from the
> imx drm drivers.
> 
> Johan
> 

For the series:


Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>



-- 
With best wishes
Dmitry
