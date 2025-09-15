Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DAA25B584F9
	for <lists+dri-devel@lfdr.de>; Mon, 15 Sep 2025 20:54:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D81DE10E53C;
	Mon, 15 Sep 2025 18:53:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="EuNE+aar";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4F1D310E53C
 for <dri-devel@lists.freedesktop.org>; Mon, 15 Sep 2025 18:53:42 +0000 (UTC)
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58FDTU6A020484
 for <dri-devel@lists.freedesktop.org>; Mon, 15 Sep 2025 18:53:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=nMMKPwbFMSjvy9PWk7yGxyrz
 P5qxhwSObKoN7zz9Cmg=; b=EuNE+aarumICU53Pb8nbWw1vWJELMwtngsr/NFhj
 b67tH0/faAVXM8BakGNmxzZL/eduCfCUAQ5+knxk3lp63THxklrq5jhZZOsjC9c6
 rYhIyXq9WCA/I1qxRoAmbRRUj6sYT6CS738RLMZUXPU20MWvtdKAq2ZtI9mWI/jD
 5ja3P28kw8CeSkfuwXvWnghnPmgBJeKGJ0FD6Ppqlbxce14ELRdSkIDDstuJAjK9
 tXF/CWtbY9GrrQpleEC9M/mOAeomKPXO84c84sfITddHT01T2T11KX/Xirf9HDkC
 1LVewdCj0d01yUnv0q4qsbqR/EOIOnXmbrJxBfCBFbTWlQ==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com
 [209.85.160.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4950pv673r-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Mon, 15 Sep 2025 18:53:38 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id
 d75a77b69052e-4b60dd9634dso110746381cf.2
 for <dri-devel@lists.freedesktop.org>; Mon, 15 Sep 2025 11:53:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1757962417; x=1758567217;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=nMMKPwbFMSjvy9PWk7yGxyrzP5qxhwSObKoN7zz9Cmg=;
 b=hpTdGvcBSnMvVP3f8T0iZD1unh364fRrnERlbgnQMelnxFLq3iN4zdno1fqKQPrvI2
 rdxH5EHJsDu3/B4r99CToF/KDLkGmTGqCXM2lDe0rpHkaRHcl3BwZ5NVK6r2Z8R+8xVC
 njN7MoGCiwijGkJA1dz7vxN4D4znW3htYLtdeuQSYAWhbqsIVdgDOEPfoO0V1UJqxIzb
 vfra+nCCXk2qSHybgx/3buPfWd9FA5XELD7vlXMRyDDArRDfZf2HYRwpubahd1wghJbt
 w8dTySt8rF62srEsrMN1tXLMD6zkONleGoZ+FAiHelss7abJ0VjSyrWQR+jD/w/F2LJ5
 7zjA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWcTC5Y8mROH44OqETfluSZv5tKQNH9pQx36rpNk4gnornATOWkOAC+7aUnIzev+N/FWnxxR4iuNh0=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YydKbbP29LAKaa5uC7cH+pSaCe5AiUv8299gOm2aK5rfOO5jgZi
 scEKX2v8AsvcQv3+XfTy5tqsUCprirllEQcHlk5RauDC6vyoN7g8nXzx/XnlMP5BP8z9MKwL17x
 yg6FCMQq/EvI5kXuI9javvResiIkK6nOfSzpgFtNDcXCJYG4uuXmfIcoItT9xZT0026B6498=
X-Gm-Gg: ASbGnctUMg5kHxVpnjo2Dzb0rAxxoZ5BkZ74pY80CFp8IExf35MR1k3TXNysF/eMlAH
 zeyQHKN+DesCn6bQUkZx1RWGezAjRcLCRgH36CH6FJh8nSUgEJYs0AqjAlFBA5WM+43zgD5SyEk
 aMFylePuhlzUn9512D5mzbNC6xviR8qV2eccRvqCxlMoRnwZkJn723Om3gzuCXQTb2r136lIY0S
 xq3FGBIHqTI6IuPGyVna1o/INWhj4QSerLHXHIj/8MosLbfRjWYAFZ8mzLfOBKZ+Lpt3S6EvETa
 GVaNUjVvUUhow3BgWycgjbqd0cc8a+2j1DUuq3MCdwVG7C+0fTDexheZnixAIiWEFWrof07HCdY
 eAHQefeg+1Z8CRgRiYjFTqs/f3s9Sk+liOLE+DpAgTa5nms/jEG+R
X-Received: by 2002:ac8:7d89:0:b0:4b7:95da:b3c7 with SMTP id
 d75a77b69052e-4b795dac12amr105743981cf.48.1757962417343; 
 Mon, 15 Sep 2025 11:53:37 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHl1bgwAg6xsiD3botpPruuj1Z5eTwC4YuXll3Zv1jmcPqXrGVhLUi0yvP8XfARs9TjfTPNrg==
X-Received: by 2002:ac8:7d89:0:b0:4b7:95da:b3c7 with SMTP id
 d75a77b69052e-4b795dac12amr105743251cf.48.1757962416589; 
 Mon, 15 Sep 2025 11:53:36 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-34f1a8211afsm28253981fa.45.2025.09.15.11.53.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 15 Sep 2025 11:53:35 -0700 (PDT)
Date: Mon, 15 Sep 2025 21:53:32 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Harikrishna Shenoy <h-shenoy@ti.com>
Cc: andrzej.hajda@intel.com, neil.armstrong@linaro.org, rfoss@kernel.org,
 Laurent.pinchart@ideasonboard.com, jonas@kwiboo.se,
 jernej.skrabec@gmail.com, airlied@gmail.com, simona@ffwll.ch,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 tzimmermann@suse.de, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, sjakhade@cadence.com, yamonkar@cadence.com,
 lumag@kernel.org, dianders@chromium.org, jani.nikula@intel.com,
 luca.ceresoli@bootlin.com, andy.yan@rock-chips.com,
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, devarsht@ti.com, u-kumar1@ti.com,
 s-jain1@ti.com, tomi.valkeinen@ideasonboard.com
Subject: Re: [PATCH v5 2/2] drm: bridge: cdns-mhdp8546: Add support for DSC
 and FEC
Message-ID: <d6l5vwx5s5oopyhniqbc3wputceblazpry2omeja2qvak37y2m@dbge4vedh7ko>
References: <20250915103041.3891448-1-h-shenoy@ti.com>
 <20250915103041.3891448-3-h-shenoy@ti.com>
 <pwd4hocrxrnfymby6szzp7irlveoa36er7yn5ivlht5mwxrpdz@r237bd3epols>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <pwd4hocrxrnfymby6szzp7irlveoa36er7yn5ivlht5mwxrpdz@r237bd3epols>
X-Proofpoint-ORIG-GUID: cqISjvW7efSgJNEKNUeFn7twEk9ZX1Iw
X-Authority-Analysis: v=2.4 cv=PsWTbxM3 c=1 sm=1 tr=0 ts=68c860b2 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=yJojWOMRYYMA:10 a=e5mUnYsNAAAA:8 a=Br2UW1UjAAAA:8 a=sozttTNsAAAA:8
 a=aquk1Lx4SgTA5jucOdcA:9 a=CjuIK1q_8ugA:10 a=uxP6HrT_eTzRwkO_Te1X:22
 a=Vxmtnl_E_bksehYqCbjh:22 a=WmXOPjafLNExVIMTj843:22
X-Proofpoint-GUID: cqISjvW7efSgJNEKNUeFn7twEk9ZX1Iw
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTEzMDAyOSBTYWx0ZWRfXz3NG19OPJHEp
 W7nPo/7oQ/N6m455pNNF9F0KgA+EC9x+CZI+C+TsJbYJMpVx0D/Fh3DOre7sWbp9v9GHe6iuETY
 yApdzWY23A/cVi0IUqMy/z0GfO9ddWwYYJ/Ut3AVRl8tNoCGPLoeaoupyS9FkCCdvANUbbe+rq5
 qFP/hJhaej13LFywN/PTIxD93jLbWd00iBxUKNjuuLeEM9cUwUuNyi3AUo19T7IoLi6LLnhrkd6
 QLjWr6p6V1rkm4V/7fIRvv+OGMRU1VQObhA5e+aQL+AUzF3ULsQ8re/G2hIbTeLfcrzOw+7rnhx
 1UPgHgX4Iop96lMOya96BeVVdECKQ/OsId6vnfsFCzbgAbQpNqAFqcUaam5AHh+DS0IDLIk6zAB
 hxL/UmiX
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-15_07,2025-09-12_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 clxscore=1015 malwarescore=0 suspectscore=0
 spamscore=0 bulkscore=0 adultscore=0 impostorscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2509130029
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

On Mon, Sep 15, 2025 at 02:06:58PM +0300, Dmitry Baryshkov wrote:
> On Mon, Sep 15, 2025 at 04:00:41PM +0530, Harikrishna Shenoy wrote:
> > From: Swapnil Jakhade <sjakhade@cadence.com>
> > 
> > Enable support for Display Stream Compression (DSC) in independent
> > mode with a single stream, along with Forward Error Correction (FEC)
> > in the Cadence MHDP8546 DisplayPort controller driver.
> > 
> > FEC is required when DSC is enabled to ensure reliable transmission
> > of the compressed stream.
> > 
> > Signed-off-by: Swapnil Jakhade <sjakhade@cadence.com>
> > Signed-off-by: Harikrishna Shenoy <h-shenoy@ti.com>
> > ---
> >  drivers/gpu/drm/bridge/cadence/Makefile       |   2 +-
> >  .../drm/bridge/cadence/cdns-mhdp8546-core.c   | 367 ++++++++-
> >  .../drm/bridge/cadence/cdns-mhdp8546-core.h   |  68 ++
> >  .../drm/bridge/cadence/cdns-mhdp8546-dsc.c    | 695 ++++++++++++++++++
> >  .../drm/bridge/cadence/cdns-mhdp8546-dsc.h    | 285 +++++++
> >  5 files changed, 1392 insertions(+), 25 deletions(-)
> >  create mode 100644 drivers/gpu/drm/bridge/cadence/cdns-mhdp8546-dsc.c
> >  create mode 100644 drivers/gpu/drm/bridge/cadence/cdns-mhdp8546-dsc.h
> > 
> > +		goto err;
> > +	}
> > +
> > +	if (ret > 0)
> > +		return 0;
> > +err:
> > +	return ret;
> > +}
> 
> Consider extracting a common helper and using it here and in the Intel
> DP driver. Also please use new DPCD helpers which return 0 instead of
> size.

For the reference, some time ago one of my colleagues implemented DP DSC
support for the drm/msm driver. It didn't go in for multiple reasons,
but feel free to use it as an inspiration for possible generic helpers.
See https://patchwork.freedesktop.org/series/113240/


-- 
With best wishes
Dmitry
