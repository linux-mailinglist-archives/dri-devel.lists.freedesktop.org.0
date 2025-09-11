Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 933E1B5333C
	for <lists+dri-devel@lfdr.de>; Thu, 11 Sep 2025 15:09:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D011610EB37;
	Thu, 11 Sep 2025 13:09:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="gFfuzORe";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5486710EB44
 for <dri-devel@lists.freedesktop.org>; Thu, 11 Sep 2025 13:09:30 +0000 (UTC)
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58BB3OdV002499
 for <dri-devel@lists.freedesktop.org>; Thu, 11 Sep 2025 13:09:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 I8RyZQ7s9En3k+A9mP9sTd12gbOqQ8qWm+XADZfrx+w=; b=gFfuzOReeKZp9Tcv
 7BjR5bFEDvUerbezOcuNRQmikLLZAsok1Fg10+MrsDrvPocd6fG/3YuzQ3AlU0oH
 4qtkJIdvtpsUj5jkvwNtKPI9X+Xtt4rIDeRpiiEnUxvayZXFjxGGFXfJNta1d5jI
 OEcb1VicJF+NpHXLIFJgl6QFNRxl+vW4a5agw+fQfdqxylhFe7bTozn/QwjwzUCr
 dPuhbxNG7d96Dlkz6Vl53sWPIsEe06bcGoDrR1+0lY+wcQGsHZmQ+ebqn+oXyK5S
 jf+3m/pIL5s2BM8oXEQCXyvm4qOWMuWbB6eygKv9m3K5LgcHR/KagLkREhxFEWoB
 fv8qPQ==
Received: from mail-vk1-f200.google.com (mail-vk1-f200.google.com
 [209.85.221.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 490db8qsb9-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Thu, 11 Sep 2025 13:09:28 +0000 (GMT)
Received: by mail-vk1-f200.google.com with SMTP id
 71dfb90a1353d-545f436ad2dso964659e0c.2
 for <dri-devel@lists.freedesktop.org>; Thu, 11 Sep 2025 06:09:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1757596168; x=1758200968;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=I8RyZQ7s9En3k+A9mP9sTd12gbOqQ8qWm+XADZfrx+w=;
 b=I7GkhRmkcNVJLSQRpiqfnhnSWIpbkqW+Z4RY1bga97sSrfvcr358NxEKhm6tojDpqH
 d9XLgfl+3xm3vkPW9hMTfc0O6K/hkby3kZ5GC0yfoclXfwP9pzAOuNZjKvRM0lR4VRg5
 ALcLjwkBXr8fS/DUjlbKSVmblctK8QmbQp7w3+jWTr4Ui2djYx2Gse7Wo1H3jyaHwBDY
 a0SGeVUCczZeWPe6fnOdUBgRhIa3Gpuzg7p4XPPC3CzE6jUh5ubAV385zffOU85hRaaN
 rAd3iKnlVmJbw+ueWKAHZPuL5PN1BMluKzOfWrqdGwxtC/WrZPOjVLRoTwVTYTWkh1c9
 GRoA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWalJd+RPh+BwvF+Bpk/bHVTv7C0n22CwU3qpZKLW7kSneCLq/a69MHVGKXAOa374Orq0G2cDpb14A=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yx+AQa+SxT+r5fkDt15GlhYjYBCrtOVOrhi3VjpukV5O2JSWHEE
 eYLEzBnm82jbvnopw91y1X3UyBT0QqGsmJPJMlP4OmgaUg3UR9IEI+8F7pMqmTNVserw/+zi7qm
 Wq8ODXJxnjpBdnI7HybNhc1pOtr/GZuvL/6yM6H1N55yqMwf2PM2rCN924NAp4wlhWEGwuoU=
X-Gm-Gg: ASbGnctP7OaCLMCNoxpCrtlpHY1dJkux48MqcHZESGs53yArYqbNrxmbcIb9pzmyFC6
 nYHgwBzJPP3HkXXKDXfiktXROltNyFK8rnT+HboRD3f1J+d+bVFbyfDEr/KqgDA/QvrP0HporCI
 vAUZNXNEscFEbcZek64M/99hI4raFblFifS1GhDPx7u3EdUkTK/4EQbPRNSpvs5xi+PDj+HWn4L
 9hBVfro6BVQnofFVIn/hDRjnWUbleabawUj8FJo0x0IHtU+LiIdf657cwzvqYw4YDNBiqhRidBj
 bXkyCj56gWyZsxyHYWmZjl6OAqwIH+m/7NAwjIRWS5peDpI49aa3ndINgA9rt5S/rb6Viek7+Gu
 iy7s7NL0u9LXnAxlz3aIRSHgTx+AcfnTN3SpuCr9KZytjp7aG0/ao
X-Received: by 2002:a05:6122:a13:b0:539:5cff:8070 with SMTP id
 71dfb90a1353d-5472c0d490fmr6491520e0c.9.1757596167807; 
 Thu, 11 Sep 2025 06:09:27 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFd/VAt6jkDmxnGnMNUH/ZV3Br3jOJxAgjfGzfoucxUs9TbwAHF++l7wDbp7nNv5hn99Y6zAA==
X-Received: by 2002:a05:6122:a13:b0:539:5cff:8070 with SMTP id
 71dfb90a1353d-5472c0d490fmr6491493e0c.9.1757596167378; 
 Thu, 11 Sep 2025 06:09:27 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-34f163f51desm2799101fa.25.2025.09.11.06.09.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 11 Sep 2025 06:09:25 -0700 (PDT)
Date: Thu, 11 Sep 2025 16:09:23 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Miguel Gazquez <miguel.gazquez@bootlin.com>
Cc: Maxime Ripard <mripard@kernel.org>, Phong LE <ple@baylibre.com>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Andrzej Hajda <andrzej.hajda@intel.com>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 thomas.petazzoni@bootlin.com, miquel.raynal@bootlin.com,
 kory.maincent@bootlin.com, romain.gantois@bootlin.com, praneeth@ti.com,
 Aradhya Bhatia <a-bhatia1@ti.com>
Subject: Re: [PATCH] drm/bridge: ite-it66121: Add drm_connector support
Message-ID: <2l5kp4ojrcsg2apcpv7mzeeypwynecyfesenks6zzvnst3qkbt@4yhbosy2zhah>
References: <20250909-it66121-fix-v1-1-bc79ca83df17@bootlin.com>
 <do5zciwcanpiciy52zj3nn6igmwlgmbcfdwbibv2ijxm2fif5s@ib6jhzi5h2jo>
 <6164422a-6265-4726-8da5-68bb8eafb9e6@bootlin.com>
 <20250911-innocent-daffodil-macaque-797f13@houat>
 <012046ab-d866-4b3a-8c8a-e130bc2b9628@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <012046ab-d866-4b3a-8c8a-e130bc2b9628@bootlin.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTA2MDAzMSBTYWx0ZWRfXx2RD4AooassV
 eoXClgrO9xDiRf9VQfQRBkc05TSWIc19BmoVUrKTSSmCj7SZD89IJ2zv/5FfHYYEnUH8tCfM3iK
 ioQU8nAQXmUxDDKxsNRN+w6abxnK2f87dFXzwOhsF7/okYmmWj3OXXuZS67S0Zi6G6bxLyoZWaP
 u7iparEJR51evpwjs2I58vXi5CbewcpkFiEJI6FiKu47Utb/5/ghTGPrR0PoKumx/TIDMWY5LdN
 6LPC36Udkpf1diSfxmI50CItt9k3gGKPssnbVoG3UC3GlxpAbDr6nBWz0otkD/RJowsZ5eDFA2x
 Sh/b57sRttdDMK5FDHKgwzagSd5Q65ZUGhcCwQz5QDW/vnWKM5RyKo3lqeqiS+pdKMIBZHU57YS
 Px9ZhF4N
X-Proofpoint-ORIG-GUID: mucmNSd14CviwEltcBBVsUyhkoVjnuH-
X-Proofpoint-GUID: mucmNSd14CviwEltcBBVsUyhkoVjnuH-
X-Authority-Analysis: v=2.4 cv=VIDdn8PX c=1 sm=1 tr=0 ts=68c2ca08 cx=c_pps
 a=wuOIiItHwq1biOnFUQQHKA==:117 a=xqWC_Br6kY4A:10 a=8nJEP1OIZ-IA:10
 a=yJojWOMRYYMA:10 a=sozttTNsAAAA:8 a=J4TtIqrawgGb-EQjl3IA:9 a=3ZKOabzyN94A:10
 a=wPNLvfGTeEIA:10 a=XD7yVLdPMpWraOa8Un9W:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-10_04,2025-09-11_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 spamscore=0 suspectscore=0 bulkscore=0
 phishscore=0 adultscore=0 clxscore=1015 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509060031
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

On Thu, Sep 11, 2025 at 02:49:59PM +0200, Miguel Gazquez wrote:
> 
> 
> Le 11/09/2025 à 11:50, Maxime Ripard a écrit :
> > On Thu, Sep 11, 2025 at 10:51:06AM +0200, Miguel Gazquez wrote:
> > > 
> > > 
> > > Le 10/09/2025 à 04:28, Dmitry Baryshkov a écrit :
> > > > On Tue, Sep 09, 2025 at 06:16:43PM +0200, Miguel Gazquez wrote:
> > > > > From: Aradhya Bhatia <a-bhatia1@ti.com>
> > > > > 
> > > > > Add support for DRM connector and make the driver support the older
> > > > > format of attaching connectors onto the encoder->bridge->connector
> > > > > chain.
> > > > > This makes the driver compatible with display controller that only
> > > > > supports the old format.
> > > > > 
> > > > > [Miguel Gazquez: Rebased + made driver work with or without
> > > > > DRM_BRIDGE_ATTACH_NO_CONNECTOR]
> > > > 
> > > > What is the use case for not using DRM_BRIDGE_ATTACH_NO_CONNECTOR?
> > > 
> > > Some display controller drivers (like the tilcdc) call drm_bridge_attach
> > > without DRM_BRIDGE_ATTACH_NO_CONNECTOR, so the bridge must support both with
> > > and without DRM_BRIDGE_ATTACH_NO_CONNECTOR to be compatible with all display
> > > controllers.
> > 
> > I'd rather convert tilcdc to use DRM_BRIDGE_ATTACH_NO_CONNECTOR then.
> 
> The problem is that doing that break devicetrees using the tilcdc and a
> bridge who doesn't support DRM_BRIDGE_ATTACH_NO_CONNECTOR (there are
> multiple bridges that don't support DRM_BRIDGE_ATTACH_NO_CONNECTOR), and if
> my understanding is correct breaking devicetrees is not allowed.

How does it break devicetree? The drm_bridge_connector isn't a part of
DT.

-- 
With best wishes
Dmitry
