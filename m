Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C2C8E96AE8B
	for <lists+dri-devel@lfdr.de>; Wed,  4 Sep 2024 04:27:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 56B0210E0B7;
	Wed,  4 Sep 2024 02:27:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=samsung.com header.i=@samsung.com header.b="lQZ8cw8N";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 324 seconds by postgrey-1.36 at gabe;
 Wed, 04 Sep 2024 02:26:58 UTC
Received: from mailout3.samsung.com (mailout3.samsung.com [203.254.224.33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3D4E510E0B7
 for <dri-devel@lists.freedesktop.org>; Wed,  4 Sep 2024 02:26:58 +0000 (UTC)
Received: from epcas1p3.samsung.com (unknown [182.195.41.47])
 by mailout3.samsung.com (KnoxPortal) with ESMTP id
 20240904022131epoutp03b36fe11ce57f6032db2611b2a019449b~x6ShNLTgH2643226432epoutp03S
 for <dri-devel@lists.freedesktop.org>; Wed,  4 Sep 2024 02:21:31 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout3.samsung.com
 20240904022131epoutp03b36fe11ce57f6032db2611b2a019449b~x6ShNLTgH2643226432epoutp03S
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1725416491;
 bh=VS08+gK8kMCYk4srw5DlJ/zAcoaBgIp1hePguxn+obs=;
 h=From:To:Cc:In-Reply-To:Subject:Date:References:From;
 b=lQZ8cw8NmGf1n3inrWjXGcW+h/I2blpwmiVUfzBKaeM3GcUyRBhD8Nd8QSTuovVQu
 a5mFiDjOyTglBe/H0X9hp5RdPs+N81a/7AXTQk/NXnrFdWxMzWwCI6gPDrIZdXSwzb
 8KUF6aC+UZfxws8e+TWwOtcp+2k13oWq5n7KXht0=
Received: from epsnrtp2.localdomain (unknown [182.195.42.163]) by
 epcas1p2.samsung.com (KnoxPortal) with ESMTP id
 20240904022131epcas1p270eb9fd816f6ad7ac94f15ba0204a0f3~x6ShAK9u02143921439epcas1p2O;
 Wed,  4 Sep 2024 02:21:31 +0000 (GMT)
Received: from epsmgec1p1.samsung.com (unknown [182.195.38.234]) by
 epsnrtp2.localdomain (Postfix) with ESMTP id 4Wz5pL1gC1z4x9Q0; Wed,  4 Sep
 2024 02:21:30 +0000 (GMT)
Received: from epcas1p1.samsung.com ( [182.195.41.45]) by
 epsmgec1p1.samsung.com (Symantec Messaging Gateway) with SMTP id
 F0.EE.09623.924C7D66; Wed,  4 Sep 2024 11:21:29 +0900 (KST)
Received: from epsmtrp1.samsung.com (unknown [182.195.40.13]) by
 epcas1p2.samsung.com (KnoxPortal) with ESMTPA id
 20240904022129epcas1p2b0349d8e0880e342eeecc39c0e7de4a3~x6SfA5GRI2143921439epcas1p28;
 Wed,  4 Sep 2024 02:21:29 +0000 (GMT)
Received: from epsmgms1p2new.samsung.com (unknown [182.195.42.42]) by
 epsmtrp1.samsung.com (KnoxPortal) with ESMTP id
 20240904022129epsmtrp15e81c016bbd5890470f78dc354202fcb~x6SfAXxtU1594115941epsmtrp1x;
 Wed,  4 Sep 2024 02:21:29 +0000 (GMT)
X-AuditID: b6c32a36-ef9ff70000002597-c3-66d7c42980df
Received: from epsmtip2.samsung.com ( [182.195.34.31]) by
 epsmgms1p2new.samsung.com (Symantec Messaging Gateway) with SMTP id
 B9.82.08456.924C7D66; Wed,  4 Sep 2024 11:21:29 +0900 (KST)
Received: from inkidae001 (unknown [10.113.221.213]) by epsmtip2.samsung.com
 (KnoxPortal) with ESMTPA id
 20240904022128epsmtip27f995118bf5747c40222e767cb206ccd~x6SezcZ_-1053110531epsmtip22;
 Wed,  4 Sep 2024 02:21:28 +0000 (GMT)
From: =?ks_c_5601-1987?B?tOvAzrHiL1RpemVuIFBsYXRmb3JtIExhYihTUikvu++8usD8wNo=?=
 <inki.dae@samsung.com>
To: "'Jani Nikula'" <jani.nikula@intel.com>, <dri-devel@lists.freedesktop.org>
Cc: "'Daniel Vetter'" <daniel.vetter@intel.com>
In-Reply-To: <87ttf3wo2e.fsf@intel.com>
Subject: RE: [PATCH 0/6] drm: conversions to struct drm_edid
Date: Wed, 4 Sep 2024 11:21:28 +0900
Message-ID: <0f9201dafe71$26575c70$73061550$@samsung.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="ks_c_5601-1987"
Content-Transfer-Encoding: 7bit
X-Mailer: Microsoft Outlook 16.0
Thread-Index: AQGXOUsv0pLQNbtkA3LZ0dsdve1XowH2WW6XAiDOrbSyrbXjUA==
Content-Language: ko
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFvrMKsWRmVeSWpSXmKPExsWy7bCmrq7mketpBvf3y1ksP7OO2eLK1/ds
 FnvuvGZ0YPZYvOclk8f97uNMAUxR2TYZqYkpqUUKqXnJ+SmZeem2St7B8c7xpmYGhrqGlhbm
 Sgp5ibmptkouPgG6bpk5QEuUFMoSc0qBQgGJxcVK+nY2RfmlJakKGfnFJbZKqQUpOQWmBXrF
 ibnFpXnpenmpJVaGBgZGpkCFCdkZE59cZSyYyFtxuOMcWwPjJK4uRg4OCQETiRdNwV2MnBxC
 AjsYJV6cN+ti5AKyPzFKTFy8hA3C+cYoMaP5GwtIFUjDzx/PmSA69jJK9C20hbBfMkp0LfUH
 sdkEMiTuti9mBbFFBAIkphzuYQNZxiygL7GpvxzE5BRQl9j2kROkQljARuL1jndgE1kEVCQe
 3FkEZvMKWEoc/HuFGcIWlDg58wnYBcwCRhJLVs9ngrDlJba/ncMMcZmCxM+ny6C2Okl8XLCA
 EaJGRGJ2ZxtUzSN2iZVP/SFsF4lfd2ZCfSUs8er4FnYIW0riZX8bO8jrEgKTGSXuXF/BAuHM
 YJQ4/PM6I0SVscT+pZOhruCTePe1hxUSoLwSHW1CECVKEscu3oAql5C4sGQiG4TtIXF9+2K2
 CYyKs5D8NgvJb7OQ/DYLyQ8LGFlWMYqlFhTnpqcWGxYYwaM6OT93EyM49WmZ7WCc9PaD3iFG
 Jg7GQ4wSHMxKIryxG6+mCfGmJFZWpRblxxeV5qQWH2I0BQb3RGYp0eR8YPLNK4k3NLE0MDEz
 MjaxMDQzVBLnPXOlLFVIID2xJDU7NbUgtQimj4mDU6qBKZZXTPnY/dsTH2xlTp5wYpdVxNuQ
 VT3bzMw0tk1/v3j/gzuTgnndnTW4n0iIp0bnd0hsZWWz6373+seLnq+LQucvSvtW6m/RcNvj
 mchhzRLzDR32e54r/1z6N/fxq5nB0ssisxdvWM1qespO8LmZ16Qne6Lvn/345dfnLn+F/NCT
 v1Z9XXzdRPoDR/dRU/ePu+6YLfx3Z9umK1xMh8xW7e/+tfPExR7/vGcKDL8uG5RUvZk257sO
 w7SC3fuM+3IDffNFQjcbJDNU7LvgtuX8c9bn7e8eyBpn9fAqKnJKZGjWBv474vVOTST+lytz
 96fvt/9N7M1xuxZ5PcjA9fQpmxVKOYaL5OJmchirhSu7L1RiKc5INNRiLipOBAAj1YuiBgQA
 AA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFrrLLMWRmVeSWpSXmKPExsWy7bCSvK7mketpBtN/s1gsP7OO2eLK1/ds
 FnvuvGZ0YPZYvOclk8f97uNMAUxRXDYpqTmZZalF+nYJXBkTn1xlLJjIW3G44xxbA+Mkri5G
 Tg4JAROJnz+eM3UxcnEICexmlOi5sxvI4QBKSEhs2coBYQpLHD5cDFIuJPCcUWJlVwWIzSaQ
 JjFp7n5WEFtEIEBiyuEeNpByZgF9iU395RATlzJK7Fx/mhUkzimgLrHtIydIubCAjcTrHe+Y
 QGwWARWJB3cWgdm8ApYSB/9eYYawBSVOznzCAmIzA13ZeLgbypaX2P52DjPE9QoSP58ugzrB
 SeLjggWMEDUiErM725gnMArPQjJqFpJRs5CMmoWkZQEjyypGydSC4tz03GLDAqO81HK94sTc
 4tK8dL3k/NxNjOAY0NLawbhn1Qe9Q4xMHIyHGCU4mJVEeGM3Xk0T4k1JrKxKLcqPLyrNSS0+
 xCjNwaIkzvvtdW+KkEB6YklqdmpqQWoRTJaJg1OqgYm5miUkvObIl1+Pyl8Znc7Lj7Pwi3y4
 UuzDv6ITCcn/JzFtmLzp4PadRopa/+tdlQ/PXPjgb/Dc0o3fHRYxHcsT3mIln5squdnfZ8rD
 UKGnn566NPpOu1crINmwT5c14Enj/VfTVncHlfl4bFq7WK1gq8zRaz8SSn/nfOlp5AxdUrji
 cLtXY+3pOsON27PDOQ5EyFe6X9q3/5IL86Ynsq+T1mZrpk9v/6jJ9WTXz22h2z4lJEUGt8Z+
 f9G5Vl1u8YNHFvePsOXrXxZjSW43NfNx0a0MY03YuMpYacGyJctD/xv6tRu2vvnVx19lvH/z
 0pPufswJX08tvxnSX1Pi8kz329wX+r1hS/atV9rbbq3EUpyRaKjFXFScCABqYfWK8AIAAA==
X-CMS-MailID: 20240904022129epcas1p2b0349d8e0880e342eeecc39c0e7de4a3
X-Msg-Generator: CA
CMS-TYPE: 101P
DLP-Filter: Pass
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20240829114451epcas1p210a2b23c559da109b9186cf71e3b998b
References: <cover.1724348429.git.jani.nikula@intel.com>
 <CGME20240829114451epcas1p210a2b23c559da109b9186cf71e3b998b@epcas1p2.samsung.com>
 <87ttf3wo2e.fsf@intel.com>
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

Hi Jani,

Sorry for being late.


> -----Original Message-----
> From: Jani Nikula <jani.nikula@intel.com>
> Sent: Thursday, August 29, 2024 8:45 PM
> To: dri-devel@lists.freedesktop.org
> Cc: Daniel Vetter <daniel.vetter@intel.com>; inki.dae@samsung.com
> Subject: Re: [PATCH 0/6] drm: conversions to struct drm_edid
> 
> On Thu, 22 Aug 2024, Jani Nikula <jani.nikula@intel.com> wrote:
> > The umerged patches from [1] and then some.
> >
> > BR,
> > Jani.
> >
> > [1] https://lore.kernel.org/r/cover.1715691257.git.jani.nikula@intel.com
> >
> > Jani Nikula (6):
> >   drm/sti/sti_hdmi: convert to struct drm_edid
> >   drm/tegra: convert to struct drm_edid
> >   drm/ipuv3/parallel: convert to struct drm_edid
> >   drm/tiny/gm12u320: convert to struct drm_edid
> 
> Pushed the above to drm-misc-next, thanks for the reviews and acks.
> 
> >   drm/exynos: hdmi: use display_info for printing display dimensions
> >   drm/exynos: hdmi: convert to struct drm_edid
> 
> I'll wait for Inki to check these.

You could push them to drm-misc-next.

Acked-by : Inki Dae <inki.dae@samsung.com>

Thanks,
Inki Dae

> 
> BR,
> Jani.
> 
> >
> >  drivers/gpu/drm/exynos/exynos_hdmi.c         | 25 ++++++++++-------
> >  drivers/gpu/drm/imx/ipuv3/parallel-display.c | 14 ++++++----
> >  drivers/gpu/drm/sti/sti_hdmi.c               | 24 +++++++++-------
> >  drivers/gpu/drm/tegra/drm.h                  |  2 +-
> >  drivers/gpu/drm/tegra/output.c               | 29 ++++++++++++--------
> >  drivers/gpu/drm/tiny/gm12u320.c              | 13 +++++++--
> >  6 files changed, 66 insertions(+), 41 deletions(-)
> 
> --
> Jani Nikula, Intel

