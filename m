Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C5E9B41EFD
	for <lists+dri-devel@lfdr.de>; Wed,  3 Sep 2025 14:30:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8399110E7D9;
	Wed,  3 Sep 2025 12:30:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="h6Irafxz";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5217410E7D9
 for <dri-devel@lists.freedesktop.org>; Wed,  3 Sep 2025 12:30:54 +0000 (UTC)
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 583BF1FW002994
 for <dri-devel@lists.freedesktop.org>; Wed, 3 Sep 2025 12:30:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 QLthK9+25KX0PZkgxfUXb/nyfRZ4etTvDcrXLtnH1gY=; b=h6IrafxzmpW06kYa
 /dGoXvBizu/hIHW8yizzqVcUZVDilW17OR3qvIHNLtRVFQ95nM5fInGNniDBum5d
 tNvEV+q4p0fD14AQsj9rW3hF0DwyixVgCID5X3cn+B5ONRdx0S35iv9+NFpBmiRO
 UbdN0LQL16VIwIDWXpxobrJsQBEbLbkCXbTuSBmECNJ+kWdtPIZcTMt8x6QtxiT7
 K6/dmsuoUAS+piT4UJvTK/rcil9ZNjkK4+/koC1dClbGlRxaVCwyNyvzCGtOhKk0
 Ad71m3Ot58exLzhGKojjYQQgwIvNqK8m5CPTJDWTJ+EHipL0yu2Jj/ptEmt/Uv9V
 MRFMoA==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48urw03p32-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Wed, 03 Sep 2025 12:30:53 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id
 af79cd13be357-8031e10621aso565533885a.0
 for <dri-devel@lists.freedesktop.org>; Wed, 03 Sep 2025 05:30:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1756902653; x=1757507453;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=QLthK9+25KX0PZkgxfUXb/nyfRZ4etTvDcrXLtnH1gY=;
 b=UMrZ9e6pWVINdonXJVEef5g/PGDDeToN61cT6xqr1cWAcdFE9XWJpTwQHogj4ajrp1
 qQ5I3xKs558VRbgdgGY7VhtGPDKdafaEFPaMsrYNvWp6l8ivRnADnT8M9XwE6qq1i30o
 jtsbKNr3kQYbta1lEzwZ4PXSRZO03TWyOLV/kyy7sCHxH7/KkXZYKArwhNxm8iAceNW4
 njFwtGAnAmrYrDKb1j7guERTjz7lKpKV+VbGbBJ7zqTsuFqSbKA1Q7XSumGaa/1NyXWv
 8geJQ3j1br7CyTjXIWJ2U5DEt9TAnu87Xolx+1D6rT/lxV++UHj82Sr26vY3k/sr2cSc
 WQEg==
X-Forwarded-Encrypted: i=1;
 AJvYcCVKBUjAMcvcPEBcD81IbI51vCuivCvjyC7u6Zqv7rsd/gpbilz/x6ujDaCw9OXOI1OqSjxCb0v5VBw=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzhcnWjJaIou7XkB6Z4iuCiRiYAa9KTpE1UEJYlFHPtD85/o32d
 lk3Sk7Q7is95ACGRNVJqqjC58mqlX9WB/aN4VAhV8AWWXMeTl7E4XE4KmrsP6XHBPfHK6hyy0O/
 6C+pcTu21WjQvlKUmGvNOjYaTiUzcF6sVa2Njr1L0KD1wtPRHiVKfX+bVlVTHJNgYr5g0xEA=
X-Gm-Gg: ASbGncsdrpJ0fMj83VAeAGI9iKbcv6LudGp3JIsGOk2+xNgjOfq1ankLoKSmHHWHrqA
 /8QEEPNdmP17CI0SU3AtelEC4/D56VP4VYiyBc+xtOQDpzsztoUfxv8SdozHGttdwakW2atfPwG
 YMmL1hgj6e/ia6n17O0Df4tWskFA+qFo5v4x6b2eg2PkAd2rdZUGm3uDC5FMJ7GAckAzfpCVDls
 1pKqBSJhGpo+/ZDWTUfCVebV+88ZUjCRzLA9N5BpJqch4rNm9ASg8Bq94E6iZBGKGVU0wNaCJTS
 835HlJF9gZ+/0wXDK+uSOgi/7JSPojG8xLGU2takUCCf927cIt5CJ5HxlDKILOD684izmJ/6kXB
 L32wbudzyxSMaZleQGqXg7wy9Fqw9CZ86xRCR/Hk+RqY15k80V0X8
X-Received: by 2002:ad4:5dcf:0:b0:719:50da:4a21 with SMTP id
 6a1803df08f44-71950da4ba2mr111873556d6.26.1756902652568; 
 Wed, 03 Sep 2025 05:30:52 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEnPeg40muTt0G1FfsjpDxo4ZRqx4blR1Wc4qnDjnE2n9owGkHkgKD0nBs0gJYO2KbOTOtoGA==
X-Received: by 2002:ad4:5dcf:0:b0:719:50da:4a21 with SMTP id
 6a1803df08f44-71950da4ba2mr111872576d6.26.1756902651807; 
 Wed, 03 Sep 2025 05:30:51 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-5608abc17e9sm499952e87.56.2025.09.03.05.30.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 03 Sep 2025 05:30:49 -0700 (PDT)
Date: Wed, 3 Sep 2025 15:30:47 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Heiko Stuebner <heiko@sntech.de>, Yury Norov <yury.norov@gmail.com>
Cc: Andy Yan <andyshrk@163.com>, mripard@kernel.org, neil.armstrong@linaro.org,
 andrzej.hajda@intel.com, jernej.skrabec@gmail.com, jonas@kwiboo.se,
 Laurent.pinchart@ideasonboard.com, maarten.lankhorst@linux.intel.com,
 rfoss@kernel.org, simona@ffwll.ch, tzimmermann@suse.de,
 knaerzche@gmail.com, devicetree@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-rockchip@lists.infradead.org,
 Andy Yan <andy.yan@rock-chips.com>
Subject: Re: [PATCH v7 1/2] drm/rockchip: inno-hdmi: Convert to drm bridge
Message-ID: <4ox7yh3i47odinoaalzjz7d3gvx36bxbaspo6qfvvvl3jqhdiv@24ownjco3ud2>
References: <20250903110825.776807-1-andyshrk@163.com>
 <20250903110825.776807-2-andyshrk@163.com>
 <5255838.1BCLMh4Saa@phil>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <5255838.1BCLMh4Saa@phil>
X-Proofpoint-GUID: SHZRBZHcx39hkMVu0Mw-ZlxHIBgrseBl
X-Proofpoint-ORIG-GUID: SHZRBZHcx39hkMVu0Mw-ZlxHIBgrseBl
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODMwMDAyNyBTYWx0ZWRfX5Swt23jWekza
 UVm9lZOYNVfCFUH9l04OKlKdeUQIy5C8w6hqslKta9+/N0Sz18EdaeDbACsPV7HHiXg7QhAFudi
 TnWb6Q98vk/apno7fKE/mohd0J+qBibIIjCbB0wk75wj29iStYaRHDP4uIr0NdAwk/SaTD+a1Ul
 QSwMIXXgTvMm3zA4msZhEBQ3f5mDX/w6E1eUbqlNm6zaFFoayL/Yb5414q62uRPIOsIDWbzGpQT
 D2/M/u6DtZM6qdBTGnV91G9P5Yc392JeF1DpA/EILrAu5s5JxuId9y3FaPd3RUIxUC3elCCSUzP
 4HDibQgn6isDs0X6PrMIrKiWtSXG3UTdyevFA9dY25HB32ICYgG2rWYuWeOHhlAiVQ6i/4WQ5d2
 A5jev2wZ
X-Authority-Analysis: v=2.4 cv=NrDRc9dJ c=1 sm=1 tr=0 ts=68b834fd cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=8nJEP1OIZ-IA:10
 a=yJojWOMRYYMA:10 a=s8YR1HE3AAAA:8 a=0SXiZArQvuHb7nzfZOsA:9 a=3ZKOabzyN94A:10
 a=wPNLvfGTeEIA:10 a=IoWCM6iH3mJn3m4BftBB:22 a=jGH_LyMDp9YhSvY-UuyI:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-03_06,2025-08-28_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 malwarescore=0 priorityscore=1501 phishscore=0
 impostorscore=0 spamscore=0 bulkscore=0 adultscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2508300027
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

On Wed, Sep 03, 2025 at 01:59:51PM +0200, Heiko Stuebner wrote:
> Hi Andy,
> 
> Am Mittwoch, 3. September 2025, 13:07:38 Mitteleuropäische Sommerzeit schrieb Andy Yan:
> > From: Andy Yan <andy.yan@rock-chips.com>
> > 
> > Convert it to drm bridge driver, it will be convenient for us to
> > migrate the connector part to the display driver later.
> > 
> > Signed-off-by: Andy Yan <andy.yan@rock-chips.com>
> 
> more like a general remark, this essentially conflicts with the
> big hiword-cleanup [0] that was merged today, as the inno-hdmi driver
> "lost" its separate HIWORD_UPDATE macro in favor a nicer generic one.
> 
> I'm not sure what the best way to proceed is, apart from waiting for
> 6.18-rc1.

I'd say, the correct way to handle would have been to:
- merge only FIELD_PREP_WM16 addition into bitmap-for-next using
  immutable tag
- merge the tag + all other patches into subsystem trees. Otherwise
  that series can cause a lot of conflicts with all affected subsystems.

Yury, would it be possible to implement this plan instead of pulling
everything through your tree?

-- 
With best wishes
Dmitry
