Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3FDF243BD2E
	for <lists+dri-devel@lfdr.de>; Wed, 27 Oct 2021 00:25:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A8C0D6E86F;
	Tue, 26 Oct 2021 22:25:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 432 seconds by postgrey-1.36 at gabe;
 Tue, 26 Oct 2021 22:25:26 UTC
Received: from mailout1.samsung.com (mailout1.samsung.com [203.254.224.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C0ED16E4C5;
 Tue, 26 Oct 2021 22:25:26 +0000 (UTC)
Received: from epcas1p4.samsung.com (unknown [182.195.41.48])
 by mailout1.samsung.com (KnoxPortal) with ESMTP id
 20211026221812epoutp0114cf88ba4448b457f12ee53bdb5ca6d0~xtJUSxmwq0846108461epoutp01c;
 Tue, 26 Oct 2021 22:18:12 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.samsung.com
 20211026221812epoutp0114cf88ba4448b457f12ee53bdb5ca6d0~xtJUSxmwq0846108461epoutp01c
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1635286692;
 bh=YpSE6qnCQzEz7yZwtDVd9ekJ3kJ9xV2pwDRmKtQvlR4=;
 h=Subject:To:From:Date:In-Reply-To:References:From;
 b=DhIdexF5Qxadf1IqNPjtsOWb7/Y7QHnx89wa6eXwXBxVo03KJYHIrz9TdfHU1tPgt
 cIJD05A2SydOmY1DfZHkZHz1esctGkA93syd/Jas2NozFPWIEC37TzwwBOHzi+lhF1
 CyRPLKtjymnGDIigHPXwnNcusSFmmt483XcYM4Ls=
Received: from epsnrtp4.localdomain (unknown [182.195.42.165]) by
 epcas1p1.samsung.com (KnoxPortal) with ESMTP id
 20211026221811epcas1p1a5cfec876e41534f9d27ea252974a422~xtJUBusaL0988809888epcas1p1L;
 Tue, 26 Oct 2021 22:18:11 +0000 (GMT)
Received: from epsmges1p3.samsung.com (unknown [182.195.38.235]) by
 epsnrtp4.localdomain (Postfix) with ESMTP id 4Hf5ms65Wpz4x9Pv; Tue, 26 Oct
 2021 22:18:05 +0000 (GMT)
Received: from epcas1p4.samsung.com ( [182.195.41.48]) by
 epsmges1p3.samsung.com (Symantec Messaging Gateway) with SMTP id
 E2.DB.09592.D9E78716; Wed, 27 Oct 2021 07:18:05 +0900 (KST)
Received: from epsmtrp2.samsung.com (unknown [182.195.40.14]) by
 epcas1p3.samsung.com (KnoxPortal) with ESMTPA id
 20211026221804epcas1p398bd502c4f4a0479d79e700e1368d645~xtJNr7oq32900529005epcas1p3Y;
 Tue, 26 Oct 2021 22:18:04 +0000 (GMT)
Received: from epsmgms1p1new.samsung.com (unknown [182.195.42.41]) by
 epsmtrp2.samsung.com (KnoxPortal) with ESMTP id
 20211026221804epsmtrp20a474ddc52a5261c65af9e99586b041b~xtJNqjiSR0527705277epsmtrp2L;
 Tue, 26 Oct 2021 22:18:04 +0000 (GMT)
X-AuditID: b6c32a37-2a5ff70000002578-dd-61787e9d1960
Received: from epsmtip1.samsung.com ( [182.195.34.30]) by
 epsmgms1p1new.samsung.com (Symantec Messaging Gateway) with SMTP id
 89.D3.29871.C9E78716; Wed, 27 Oct 2021 07:18:04 +0900 (KST)
Received: from [10.113.221.211] (unknown [10.113.221.211]) by
 epsmtip1.samsung.com (KnoxPortal) with ESMTPA id
 20211026221804epsmtip1a2d7b68c6a675cea8adda7e9be2ead61~xtJNSXFDn2682326823epsmtip1i;
 Tue, 26 Oct 2021 22:18:04 +0000 (GMT)
Subject: Re: [PATCH v2 06/13] drm/exynos: replace drm_detect_hdmi_monitor()
 with drm_display_info.is_hdmi
To: Claudio Suarez <cssk@net-c.es>, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org, linux-tegra@vger.kernel.org,
 intel-gfx@lists.freedesktop.org, David Airlie <airlied@linux.ie>, Daniel
 Vetter <daniel@ffwll.ch>, Laurent Pinchart
 <Laurent.pinchart@ideasonboard.com>, Jani Nikula
 <jani.nikula@linux.intel.com>, Joonas Lahtinen
 <joonas.lahtinen@linux.intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Alex Deucher <alexander.deucher@amd.com>, =?UTF-8?Q?Christian_K=c3=b6nig?=
 <christian.koenig@amd.com>, Pan Xinhui <Xinhui.Pan@amd.com>, Emma Anholt
 <emma@anholt.net>, Maxime Ripard <mripard@kernel.org>, Thierry Reding
 <thierry.reding@gmail.com>, Patrik Jakobsson <patrik.r.jakobsson@gmail.com>,
 Jingoo Han <jingoohan1@gmail.com>, Rob Clark <robdclark@gmail.com>, Sean
 Paul <sean@poorly.run>, linux-arm-msm@vger.kernel.org,
 freedreno@lists.freedesktop.org, Chen-Yu Tsai <wens@csie.org>, Sandy Huang
 <hjc@rock-chips.com>, heiko@sntech.de, Neil Armstrong
 <narmstrong@baylibre.com>, Robert Foss <robert.foss@linaro.org>, Ben Skeggs
 <bskeggs@redhat.com>, nouveau@lists.freedesktop.org,
 ville.syrjala@linux.intel.com
From: Inki Dae <inki.dae@samsung.com>
Message-ID: <ee6b3bac-4762-fd8f-c12a-c0a7ea7b56e9@samsung.com>
Date: Wed, 27 Oct 2021 07:28:45 +0900
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20211016184226.3862-7-cssk@net-c.es>
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Brightmail-Tracker: H4sIAAAAAAAAA01TaVBTVxTufUneS7DRlKXcoRUhlDpgwYT1asGtFF9bW6l2uoAdfIU3wJDN
 JLQKYwehIogFIkgg7LJZoGyCStjBilhorVRwWAZlGQc6QEXZxoINPGz5933nfOee75w7h8sy
 7iAsuCEyNa2UURIhbsS+1m4ncsj6/iQlmiyzQz/+1omh1MF6DiqsOEOgieJYgKaGDVS79AKg
 F9c0LPTn3AyOspoeYijzcbchNvIXB2VdPI0ykq5iqLinAqArz9IJ1JiHoThNAYE0zd0Einum
 w1FMXBEHtSX4oYWEBA766fIcjh7nLbLQrO4RCzXregk0lHwToCV9NhstrBjql9p+x1DJVQ2+
 bxt59t4yTkbN3MLJmQdnCbJypJRDNs7nssk63RBBZsSmc8j8hgmMrC6Jw8nB3gacvD7/kENm
 d35KDsd3YGTVaBFGduj7CXKm6T7uY+Ib6hFMU4G00oqWBcgDQ2RBnsKPjvq/5+/qJhI7iHch
 d6GVjJLSnkKvQz4O3iESw8qEVt9SkjBDyIdSqYQ793go5WFq2ipYrlJ7CmlFoEThqnBUUVJV
 mCzIUUard4tFIidXg/B4aHB9fzehSOGfzCgbJCKBdtN5wONCgQucaS4Aq9hYcAPA1mrReWBk
 wLMAPslYZDFkHsDExU7iZUWkZpBgEo0A3m6pZDNkBsD2Ze3aWyaCUHimZ3ZNZSo4x4NRFTGs
 1QQusIWaK8P4KuYL9sDIwg72KmYb4l35NdgqNhN8BZc79RxG8xrsTB9b0/AETnAx8cKahiUw
 h/1jOet4G4yuzVjzCgXzPHi9ZggwXr1gTV8mi8EmcLKjZn0GC/h0uhFnCqIB1KT9ijEkFsCh
 0T42o3KGzYXJhgTX0MIOVuh3MmFrWPc8CzCdN8PpuQucVQkU8GFsjDEjEcJbfzxY9wDh3QIN
 zmASjpfVr6/rZwDjb+fhScBKt2FQ3YbhdBuG0/3vIhewS8DrtEIlDaJVYoXzfx8eIJdWg7WL
 sne/AVKn/nZsAxgXtAHIZQlN+T3Z31HG/EDqVDitlPsrwyS0qg24GlavYVmYBcgNJylT+4td
 dolc3JycXZDYTSw05z+1PEEZC4IoNR1K0wpa+bIO4/IsIjHJgLdvqvKtkPzE4eZj8dbvf5kz
 UCN/O6/+6MIRo+2dmJ7zZEv5m35tuZuSa9Vq89Nkq80n3+iPKHmXVFUlfuG24vDn7M0BlViC
 tst0JSL5IJV3+PLox7vr3tUOWO7H0ix2eET8Y/tZmeXkeHTW/Szfz6W+DaWzd17pc48sKfCI
 vHuOP+4wvlfYf3xyaV9TDPdQK9u5vEVRb190aW/3vuWKEwfSL2Zq26NDqkPe6bLZX1m81f9e
 lSjph9qRafZAsGzLL+U7Ppj48PByjnW6zRdbtamPjn3dPDVPd2wv8n4jn3WTa5bSbbei6z3o
 NZaWZ3IHBA23LJa6SF9NkSorayI4VVVRS6eEbFUwJbZnKVXUvwc1qyXaBAAA
X-Brightmail-Tracker: H4sIAAAAAAAAA02SbUxTZxiG957T89G6zkNBeQUysyLZdBtapvFN5nCE6E6y/UCjcXOLtdGT
 QqSl60Gl4kfBQdq6gdVNpHwJFZAyxlexIkpNa4ZlVBdwhBUUrDhnwKAEsV2mrhSX8O9+7vu6
 /j00LikhYugMdTanVSsypaRIcNEtffvD8qM5ijVVeR+hH256MHRmpItAtc15FHpUbwDo8Wjo
 LAm+AujVRTOObj+bIlFF9xiGyh96Q51/gkAVp46gspPtGKofaAbowkwpha5WY8hoPk8hs9NL
 IeOMhUSFxjoCuYq+Rs+LigjUUPOMRA+rAziattzDkdMySKE7p68DFLxcKUDPX4b8oOsWhmzt
 ZvLT5WxB/wuSzZ/6lWSnhgootsXfSLBXZ88J2E7LHYotM5QSrPXKI4xtsxlJdmTwCsk6ZscI
 ttKzhR090YOxrffrMLbnso9ip7r/INMid4o27OUyMw5w2tXJu0XpXT4vpflRnFP28wilByWL
 TEBIQ2Yt1JtHKBMQ0RKmC8C/88eACdChAUJ7Bz0fI6Hbzc8jjwEMNDvxOTeS2QfzBqbDbhRz
 QgjPuq34PNUEYI/VJ5ijSCYBmi+MknNZzCRDfW1PuBeE+j6rHZvLS5ivYP6NjtdMBPSUjocZ
 IZMEA8XfhxmceRf+W9mPz+do6Buvet0vh8c7yvCTIMKyQLcsUCwLFMsC5RwQ2MAyTsOrlCpe
 ppGpuYOJvELF71crE/dkqdpA+HdWrbwEHLYniS6A0cAFII1Lo8QDlQcVEvFehe4Qp82Sa/dn
 crwLxNICabT4d5NHLmGUimxuH8dpOO3/K0YLY/RY9yzeH9GbJLvd6Z8R7ey/5dZZ7/rL5dO+
 jGDuxzdPp9bXv7P+/vZJZ8K2ztq4Pseu6jhV07eUXSIvSmhnPosyBNbQQ3GdvU9Seye2LI1V
 jha7vtCtO7P4l8D5+IH1Zx+88YHtmxx+46AsOSvlk2HM42gojW8pVC5Ne5qyYVOFSf3+KSBb
 9934IeZa9LFJed1PrmvKt3QRb9JdwtxgjVPoTd0omRQP/+NpuFdeoMtpGi7O1fR5Dif6uCXS
 xibKo3HyLfZUo8GJTBNJjPFzdYZ9R4rWG9t2Pe944+YVhUb/Vv1uwvFezZcH0lodf2qH0/9a
 1DFjiLmxGmG/tQ5lZ96VCvh0hWwVruUV/wEmvDQhqgMAAA==
X-CMS-MailID: 20211026221804epcas1p398bd502c4f4a0479d79e700e1368d645
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-Sendblock-Type: SVC_REQ_APPROVE
CMS-TYPE: 101P
DLP-Filter: Pass
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20211016193513epcas1p4e354183520df0aa4c381b19eb2863262
References: <20211016184226.3862-1-cssk@net-c.es>
 <CGME20211016193513epcas1p4e354183520df0aa4c381b19eb2863262@epcas1p4.samsung.com>
 <20211016184226.3862-7-cssk@net-c.es>
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

Hi,

21. 10. 17. 오전 3:42에 Claudio Suarez 이(가) 쓴 글:
> Once EDID is parsed, the monitor HDMI support information is available
> through drm_display_info.is_hdmi. Retriving the same information with
> drm_detect_hdmi_monitor() is less efficient. Change to
> drm_display_info.is_hdmi
> 
> Signed-off-by: Claudio Suarez <cssk@net-c.es>
> ---
>  drivers/gpu/drm/exynos/exynos_hdmi.c | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(
> 
> diff --git a/drivers/gpu/drm/exynos/exynos_hdmi.c b/drivers/gpu/drm/exynos/exynos_hdmi.c
> index 7655142a4651..a563d6386abe 100644
> --- a/drivers/gpu/drm/exynos/exynos_hdmi.c
> +++ b/drivers/gpu/drm/exynos/exynos_hdmi.c
> @@ -893,12 +893,14 @@ static int hdmi_get_modes(struct drm_connector *connector)
>  	if (!edid)
>  		return -ENODEV;
>  
> -	hdata->dvi_mode = !drm_detect_hdmi_monitor(edid);
> +	/* This updates connector->display_info */
> +	drm_connector_update_edid_property(connector, edid);
> +
> +	hdata->dvi_mode = !connector->display_info.is_hdmi;

Thanks for correcting this. Yeah, we should use drm_display_info.is_hdmi parsed from EDID.
https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux.git/tree/drivers/gpu/drm/drm_edid.c?h=v5.14.14#n4725

Signed-off-by: Inki Dae <inki.dae@samsung.com>

Thanks,
Inki Dae

>  	DRM_DEV_DEBUG_KMS(hdata->dev, "%s : width[%d] x height[%d]\n",
>  			  (hdata->dvi_mode ? "dvi monitor" : "hdmi monitor"),
>  			  edid->width_cm, edid->height_cm);
>  
> -	drm_connector_update_edid_property(connector, edid);
>  	cec_notifier_set_phys_addr_from_edid(hdata->notifier, edid);
>  
>  	ret = drm_add_edid_modes(connector, edid);
> 
