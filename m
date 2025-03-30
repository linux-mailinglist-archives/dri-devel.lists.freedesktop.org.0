Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E61EA75B13
	for <lists+dri-devel@lfdr.de>; Sun, 30 Mar 2025 18:56:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B765010E10C;
	Sun, 30 Mar 2025 16:56:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="j4sCcTDx";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 499B810E08F
 for <dri-devel@lists.freedesktop.org>; Sun, 30 Mar 2025 16:56:34 +0000 (UTC)
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52UCoFk5010565
 for <dri-devel@lists.freedesktop.org>; Sun, 30 Mar 2025 16:56:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 m7uokHfqZ4KRFTDcfVljxqYCazuqvkk8tCDZ9P6+Ur8=; b=j4sCcTDxDD11AWz8
 jxlqoWdTDZac9TtrI4Qvw1w+XhmJhlbPvaHkIrwdQ6ABhGFAbL34iuj/EjtWR3Cy
 nGX69tG8XZmdF1SLaLBvjmbtxjLXpXxHuQn0PLoEKESr4lNv5LFGvDA75d5Ebi4I
 TRhseTX5kz42aRzaiKX6cQQLO6Xp0wsbWHV55hWRe4+akFv17moNzlhrp5vdOHcO
 MoWN/5YJFznDjaZQSuJokjc6Wb0uZDGmfcvISbxuIuPWJidWSEkU4tkMPvDlzSrn
 C0hwmigcmYPeFYsNvPkUdgGb4mbtNSroKPJj6aS8CXIKHxdOb5L90liftzJ0CdvS
 bq9UeA==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45p935tgcf-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Sun, 30 Mar 2025 16:56:33 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id
 af79cd13be357-7c0a3ff7e81so691169585a.3
 for <dri-devel@lists.freedesktop.org>; Sun, 30 Mar 2025 09:56:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1743353792; x=1743958592;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=m7uokHfqZ4KRFTDcfVljxqYCazuqvkk8tCDZ9P6+Ur8=;
 b=QEsJMc5XKsgN9ZyzFa8rbkKvcG+7VToEX/v0zK2mtT237wi/hckGV7ROCTADvlIb6r
 EPP25kbAraIyZ0RJBTo2CoiWRJtrWNVW/9+6a9Yy1yOckiKpy5h0TGQADl2OEjwXdPvA
 9YjmPcrQancZ25sQkgGljbIPmCufm7Egzv7IpJ7Nmx7EMUX+w7QEn+A5iNnwykP696B+
 lBObVknf1/GgHdstR2EfYMOXphZCJiiR2ZzH5McBSSYRSyPZAS6zo9v9YMrQcfwxrhoI
 FcUnhij/R5k5c698BNZy4pHXlzmBr7pzWkQwsigLWYThWBKTjfi3WMr3rtK8y2Ks60dB
 FD9g==
X-Forwarded-Encrypted: i=1;
 AJvYcCW8uPZFlylW8n0iKobXbn9hwbAOVwBNMr0lIsYpk6KVvJubNTpExKVeKbpjHmZ/Ja+PBoCgHPfs42I=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzFFEybafeoD9MqOfhOeq049oT/uZNo3ks5sPTnl/coEnadVISd
 67iLCIoRTpzyBdDkxfYp/5dPSeSxvgahiaA8GjrQnheojBMiNq84iEpUvu96BMK88Mzi8fSKtyV
 ulxjiBheXcRqby9wOCHJugCdRsp8Y3vW1AP6QY6+D0bRXJMGx6FxkCOZSioPYqXc4070=
X-Gm-Gg: ASbGncsSQ9TAQ4mrb6NiW9o8gMM8/o6ec5fxwDWgqmPADB+dbYLpDlRyK1+oAf6Rm5u
 zWn2SA7h7aYItlxQ+q1xBut5ssj7ULlmJcr02rcn3zDPqBhVNes0iw25QS8PxTJviD5kWSIEPtO
 SD3g6AyBVpsVWGkayHaHSFAzjEkboBLMFE7GLQ1fvyphJ+6LmdFx6VBZMRZZ9RrwxdBd1qUsH/J
 5vRYkhN5vuxZCnoHYwXf4sgbPG4+9MS8CCyDWY1340CBZWBzh+6Js2GaiR591+m4JnS1fGKJUl0
 mR4Z4WFLlQEfBg/aKiah96yf96zSbNmEikub3PJ4V+durtt39lR16+oun8DjbjQ5OMd66dNANy7
 WtBY=
X-Received: by 2002:a05:620a:294b:b0:7c5:55f9:4bcc with SMTP id
 af79cd13be357-7c690875438mr914930885a.44.1743353792257; 
 Sun, 30 Mar 2025 09:56:32 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGAGROZQHrobik1sT64wznHTJFjoetxVmMUgkrcVfDA3ekun6awwmeTzczpF8OfYcFB05B4HA==
X-Received: by 2002:a05:620a:294b:b0:7c5:55f9:4bcc with SMTP id
 af79cd13be357-7c690875438mr914927785a.44.1743353791853; 
 Sun, 30 Mar 2025 09:56:31 -0700 (PDT)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-54b095a365asm932303e87.250.2025.03.30.09.56.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 30 Mar 2025 09:56:29 -0700 (PDT)
Date: Sun, 30 Mar 2025 19:56:26 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Yongbang Shi <shiyongbang@huawei.com>
Cc: Maxime Ripard <mripard@kernel.org>,
 Jani Nikula <jani.nikula@linux.intel.com>, xinliang.liu@linaro.org,
 tiantao6@hisilicon.com, maarten.lankhorst@linux.intel.com,
 tzimmermann@suse.de, airlied@gmail.com, daniel@ffwll.ch,
 kong.kongxinwei@hisilicon.com, liangjian010@huawei.com,
 chenjianmin@huawei.com, lidongming5@huawei.com, libaihan@huawei.com,
 shenjian15@huawei.com, shaojijie@huawei.com,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v7 drm-dp 5/9] drm/hisilicon/hibmc: Getting connector
 info and EDID by using AUX channel
Message-ID: <4kzdu5otwfqh6segxrkcxc3abuswa56k3aopj24m4cz2ay2by7@4m3o7y6kjsnd>
References: <ff11c8ac-7eb4-42cb-86d3-ad9924c9374b@huawei.com>
 <87jz8ea6zq.fsf@intel.com>
 <8ee961ca-0d3c-487d-a672-82714ee56743@huawei.com>
 <875xjw87dm.fsf@intel.com>
 <a8599ca0-9a50-453e-8986-f8fae5aa9160@huawei.com>
 <87v7ru6bfk.fsf@intel.com>
 <51bae617-cfc7-43f9-968e-5f2a3ad9af40@huawei.com>
 <87pli14fgh.fsf@intel.com>
 <20250328-hopping-ibis-of-gaiety-f7cac3@houat>
 <808ab7db-b42d-4510-8b07-99ed96aef1f0@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <808ab7db-b42d-4510-8b07-99ed96aef1f0@huawei.com>
X-Proofpoint-GUID: ycMBJhNgzPyVz6f19g_SxTWyXmGw7FXN
X-Authority-Analysis: v=2.4 cv=KOFaDEFo c=1 sm=1 tr=0 ts=67e977c1 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Vs1iUdzkB0EA:10 a=VwQbUJbxAAAA:8 a=i0EeH86SAAAA:8 a=KKAkSRfTAAAA:8
 a=yBIrBa1NPDpUKAAkRtsA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=NFOGd7dJGGMPyQGDc5-O:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: ycMBJhNgzPyVz6f19g_SxTWyXmGw7FXN
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-30_08,2025-03-27_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0
 impostorscore=0 clxscore=1015 lowpriorityscore=0 mlxscore=0
 priorityscore=1501 malwarescore=0 bulkscore=0 adultscore=0 spamscore=0
 phishscore=0 mlxlogscore=999 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2502280000 definitions=main-2503300118
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

On Sat, Mar 29, 2025 at 02:12:56PM +0800, Yongbang Shi wrote:
> > On Fri, Mar 28, 2025 at 12:28:14PM +0200, Jani Nikula wrote:
> > > On Fri, 28 Mar 2025, Yongbang Shi <shiyongbang@huawei.com> wrote:
> > > > > On Thu, 27 Mar 2025, Yongbang Shi <shiyongbang@huawei.com> wrote:
> > > > > > 在 2025/3/26 17:32, Jani Nikula 写道:
> > > > > > > On Tue, 25 Mar 2025, Yongbang Shi <shiyongbang@huawei.com> wrote:
> > > > > > > > > On Mon, 24 Mar 2025, Yongbang Shi <shiyongbang@huawei.com> wrote:
> > > > > > > > > > > On Wed, 19 Mar 2025, Yongbang Shi <shiyongbang@huawei.com> wrote:
> > > > > > > > > > > > From: Baihan Li <libaihan@huawei.com>
> > > > > > > > > > > > 
> > > > > > > > > > > > Add registering drm_aux and use it to get connector edid with drm
> > > > > > > > > > > > functions. Add ddc channel in connector initialization to put drm_aux
> > > > > > > > > > > > in drm_connector.
> > > > > > > > > > > > 
> > > > > > > > > > > > Signed-off-by: Baihan Li <libaihan@huawei.com>
> > > > > > > > > > > > Signed-off-by: Yongbang Shi <shiyongbang@huawei.com>
> > > > > > > > > > > > Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> > > > > > > > > > > > ---
> > > > > > > > > > > > ChangeLog:
> > > > > > > > > > > > v6 -> v7:
> > > > > > > > > > > >        - add if statement about drm aux in hibmc_dp_connector_get_modes(), suggested by Jani Nikula
> > > > > > > > > > > I don't understand this, and I did not suggest such a thing.
> > > > > > > > > > > 
> > > > > > > > > > > BR,
> > > > > > > > > > > Jani.
> > > > > > > > > > > 
> > > > > > > > > > Hi Jani,
> > > > > > > > > > 
> > > > > > > > > > Is the modification of v8 correct?
> > > > > > > > > I never received that for whatever reason.
> > > > > > > > Here's the link: https://lore.kernel.org/all/20250320101455.2538835-1-shiyongbang@huawei.com/
> > > > > > > Thanks.
> > > > > > > 
> > > > > > > The EDID handling looks fine.
> > > > > > > 
> > > > > > > AFAICT you leak dp->aux.name though.
> > > > > > > 
> > > > > > > 
> > > > > > > BR,
> > > > > > > Jani.
> > > > > > Thanks for for reminding me, actually the dp->aux.name was written because I misunderstood what you meant in V7,
> > > > > > and I deleted it in V8.
> > > > > This is in the link you posted:
> > > > > 
> > > > > +	dp->aux.name = kasprintf(GFP_KERNEL, "HIBMC DRM dp aux");
> > > > > 
> > > > Hi Jani,
> > > > 
> > > > I got it. I think I can change it to devm_kasprintf() in next bug fix patch, is that ok?
> > > Maybe. I don't have the time to look into hibmc details.
> > I don't either, but it looks suspicious to me. devm_kasprintf will be
> > freed when the device will be removed, but the DP Aux bus is probably
> > staying for a bit longer?
> > 
> > Maxime
> 
> Hi Ripard,
> 
> I will bind it to my hibmc device, and aux_unregister is in early_unregister callback of dp's connector_funcs,
> which is before the hibmc_pci_remove(), so I think it work good.

No, DRM connectors are a part of the DRM framework and can potentially
outlive the underlying device.

-- 
With best wishes
Dmitry
