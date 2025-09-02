Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5CC3FB4066B
	for <lists+dri-devel@lfdr.de>; Tue,  2 Sep 2025 16:17:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8D0E210E744;
	Tue,  2 Sep 2025 14:17:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="SHg5lGii";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F29A510E13A
 for <dri-devel@lists.freedesktop.org>; Tue,  2 Sep 2025 14:17:28 +0000 (UTC)
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 582Aotms022023
 for <dri-devel@lists.freedesktop.org>; Tue, 2 Sep 2025 14:17:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 Tszr098IUaFoz0l7VmFgf0+V3+F/VS0tcHehk3lFAMU=; b=SHg5lGiiphjkKXjb
 DBz3vJULHee19LbNEffA4mC+kxQby1kUBy/8mq54Fc2yd4/x88L8zhsZgXEEwn1d
 qxg4p6PEy4Ornq+3u8N6VCL8BjfyiTLHW73tEZziwy0ONnRZxPqjBXkrLRCnzs6e
 Mi8kSDkWkwbHT8UZud2eVafREczw1hCmXDSfgQNtmeXPT/1oqpft4sOua02daFRt
 SuSiCie0W/Nocss3ggEESzhYV2R7lmLcsTYIswBevjDFkeE3QY61icWs2ZTiIP56
 o3CqqImuIIoyi+frzuAuIGv/q8Ojsvb+LtMDzWanfT4xFk08l16Sq61EJMLsG8kU
 KGNSeg==
Received: from mail-ot1-f72.google.com (mail-ot1-f72.google.com
 [209.85.210.72])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48upnp87jw-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Tue, 02 Sep 2025 14:17:27 +0000 (GMT)
Received: by mail-ot1-f72.google.com with SMTP id
 46e09a7af769-74381e1e0caso6079762a34.0
 for <dri-devel@lists.freedesktop.org>; Tue, 02 Sep 2025 07:17:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1756822647; x=1757427447;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Tszr098IUaFoz0l7VmFgf0+V3+F/VS0tcHehk3lFAMU=;
 b=lCaOK+GlUkWyz2J10toxBT9py59ZeHYru3jYpyxcxFObYR1x3eirMDdhNFXpAh3B7J
 6KwpHgqmfM05NCLWRNGUtYaxjZCfpawssuXJgFbmbCSnA3LfyWv3qPT3658OoQ3n+uei
 y0hI8VkJTnXtZUfwcslYXetXGZc8n8cntJsezhPCi68IdOabvlJy5ltmzVCC52sHSs/p
 UR2uJucoSiEoNeNT8i9T0VfwCoNuZr84QOiRZ1gojIKWUYdt8U+cs7AM3ifFY7MrulwW
 pY2IQYuOqHw6Mt+xx/j+m1ljONzryYXMXamL0+gDtGByLefBti/L5oOCZVo+W6fYly/l
 5DNg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUzAljYkvu1dlKHjloR/QSyUjWP1xsa/SLdc/cI61GJo6ozphXtVRUchRp5AWo9Cl7peSqvd3iq8PQ=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzqdD4EbnX3bmdi9kSTqtn5L3EnEwLWEVK/eTdd+iHM9MqBBOER
 J8aKsJKK7LBoWv4YHCYCebIziPicbVnXPFPfrRZ/9C8KTD4P8NnShZAMN8pgIz5EB0mCT4Ff4M3
 T1Wl03OShSnz2ZbAYrDM80cHBHDLq8DrF4f03mDzfCH/9C40i4B/pi3ksz6bH9SuDt41gfyQ=
X-Gm-Gg: ASbGncu6gsieCHYVu1PHdWZjZMDpeSlpZptOb9E1m+ExM2zOJpdDzarQ7AYlhVScLMf
 nZxKBEGWd4jWrJQ0HKN24oWsW7G+dWcnB4segnMX3Kncs63mx/3qSoNIaZZ+JHXpj4CMp7fVKxt
 tnZQxVAQQcgMPLHZHvKsZtMF6zvzrlbmtQNREkegFQfyxqfm0qQ1niG3F30MSrClhxGqJ5NGipX
 Ij/Lf2ny0DlzVTnuO827NU71cDEaOt/ulfTVXwCd8kBU+pieMXuPhzuDrd19RNm+8u97K9BEpLt
 M+zM92vWEqeQugLGmkv6MaALO7Qv9PcbZp0Er+8nAvnyKjXBXt19e5GcB7RQQ9Utrxll6AQAxrL
 VBTGsOmRnLouqKnIqJzD1mDa24GERF+Ox+KvVQdlULix1ABO19KL2
X-Received: by 2002:a05:6830:6ac2:b0:742:29a0:1c20 with SMTP id
 46e09a7af769-74569e852famr6792738a34.28.1756822646815; 
 Tue, 02 Sep 2025 07:17:26 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGN08SIsQBXkMax1hJ55vqYZJIVKGK0hIz1ONC5Y/JBRV/eBZsw8Hnax0VWm0jyIJNf2HO4zg==
X-Received: by 2002:a05:6830:6ac2:b0:742:29a0:1c20 with SMTP id
 46e09a7af769-74569e852famr6792705a34.28.1756822646314; 
 Tue, 02 Sep 2025 07:17:26 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-5608279d226sm708762e87.111.2025.09.02.07.17.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 02 Sep 2025 07:17:25 -0700 (PDT)
Date: Tue, 2 Sep 2025 17:17:24 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Ville =?utf-8?B?U3lyasOkbMOk?= <ville.syrjala@linux.intel.com>
Cc: Maxime Ripard <mripard@kernel.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 dri-devel@lists.freedesktop.org
Subject: Re: [PATCH v2 36/37] drm/atomic: Convert
 drm_atomic_get_private_obj_state() to use new plane state
Message-ID: <pc2ux3nerxltc5h5g6cdyh5tgfrnh75j7i2edzc572og2zx2ws@623doofedid4>
References: <20250902-drm-no-more-existing-state-v2-0-de98fc5f6d66@kernel.org>
 <20250902-drm-no-more-existing-state-v2-36-de98fc5f6d66@kernel.org>
 <tmph723nw4bdmekhgvgrcyk6hngu7dw5stajeiskmaugfdhfa2@bcmbqpzeavy4>
 <aLb723DdsIC2jTva@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <aLb723DdsIC2jTva@intel.com>
X-Proofpoint-GUID: ULf6JASkEEiKm3xjLtSW2vDKFO9klUqe
X-Authority-Analysis: v=2.4 cv=Jt/xrN4C c=1 sm=1 tr=0 ts=68b6fc77 cx=c_pps
 a=+3WqYijBVYhDct2f5Fivkw==:117 a=xqWC_Br6kY4A:10 a=8nJEP1OIZ-IA:10
 a=yJojWOMRYYMA:10 a=VwQbUJbxAAAA:8 a=DvE8PSfVxy8Z79CUkE8A:9 a=3ZKOabzyN94A:10
 a=wPNLvfGTeEIA:10 a=eYe2g0i6gJ5uXG_o6N4q:22
X-Proofpoint-ORIG-GUID: ULf6JASkEEiKm3xjLtSW2vDKFO9klUqe
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODMwMDAwMSBTYWx0ZWRfXz457TN4TjmGt
 u+K3D3l5hk6lx/kwRGPl2WyIFDSEmFCbsL3TpzH7msYas2tnDR0+wXkrwSWSSHtVgvPE49PFl5G
 4VC+4TeVX8U6V2DuHCopnUtlZb5WsFBAteQM3yuWfH14Nc7RNVDuyhXAz0RhJflGFyQgpyVmJfY
 zTSy77mQzUHxac6MJolCGVtsCjohk+nEdpaP6HAb/VnqZEK3B+7GOd27xTgWWg5nOBuHBTiKTk4
 HQLkXASHeYtEByBdFPoHrURDueMUnPWJHW3XqNr5hds7zn9O5BLfZ63UFpeJAEhyBPh7yX3P6Jc
 QwVoyZtEhUFReK0zTz8ibzqlTdasPPNBlLaLc2b1gOVPYotuLKnGsTEfl24KDwauW4DxyaaFu5P
 iUAscm8z
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-02_04,2025-08-28_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 priorityscore=1501 clxscore=1015 bulkscore=0 impostorscore=0
 spamscore=0 phishscore=0 suspectscore=0 malwarescore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2508300001
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

On Tue, Sep 02, 2025 at 05:14:51PM +0300, Ville Syrjälä wrote:
> On Tue, Sep 02, 2025 at 04:25:12PM +0300, Dmitry Baryshkov wrote:
> > On Tue, Sep 02, 2025 at 11:35:35AM +0200, Maxime Ripard wrote:
> > > The drm_atomic_get_private_obj_state() function tries to find if a
> > > private_obj had already been allocated and was part of the given
> > > drm_atomic_state. If one is found, it returns the existing state
> > > pointer.
> > > 
> > > At the point in time where drm_atomic_get_private_obj_state() can be
> > > called (ie, during atomic_check), the existing state is the new state
> > > and we can thus replace the hand-crafted logic by a call to
> > > drm_atomic_get_new_private_obj_state().
> > 
> > 
> > This function is being used in e.g. this call stack:
> > ingenic_drm_crtc_atomic_enable -> ingenic_drm_get_priv_state ->
> > drm_atomic_get_private_obj_state(). Please correct me if I'm wrong,
> > doesn't it happen already after the state switch?
> 
> Looks like it should just use the get_new_state() there.
> 
> Hmm, I wonder if we should make the get_state() functions warn
> (and maybe return NULL) if they get called after the state has
> been swapped?

Might be.

Note: I just quickly git grepped the function and stumbled upon the
first questionable use. There might be uther users which call it after
swapping the state.

> 
> > 
> > > 
> > > Signed-off-by: Maxime Ripard <mripard@kernel.org>
> > > ---
> > >  drivers/gpu/drm/drm_atomic.c | 8 ++++----
> > >  1 file changed, 4 insertions(+), 4 deletions(-)
> > > 
> > 
> > -- 
> > With best wishes
> > Dmitry
> 
> -- 
> Ville Syrjälä
> Intel

-- 
With best wishes
Dmitry
