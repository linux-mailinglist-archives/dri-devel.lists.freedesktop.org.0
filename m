Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B493A6365D
	for <lists+dri-devel@lfdr.de>; Sun, 16 Mar 2025 17:16:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 154D910E057;
	Sun, 16 Mar 2025 16:16:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="ZBn56hP7";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1471A10E057
 for <dri-devel@lists.freedesktop.org>; Sun, 16 Mar 2025 16:16:09 +0000 (UTC)
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52GFjZ7x009809
 for <dri-devel@lists.freedesktop.org>; Sun, 16 Mar 2025 16:16:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=gZ8Bn6DY+92bU3zQgD3fwtJO
 nB6LTLol4X+ChLCFZuU=; b=ZBn56hP7WG2aOF7Z/LEOBswMKcl2Ph/VUf3m7Zo7
 lXZOqFep/3GiUIqqwMEq/7gFKyimoKm5IqSb6vrZRwxkn/g6O4O1Ax7+5Zx8Lh7b
 jJE94u1eydOzyc0jlZh9tc3jRgKitBOwTZmt3B8mPY7tio970p2GPRTvTOcnajI9
 cEaHGnZXkIRSDouUWTtjqSjtau9REHrgIax08GV+BSc5d0TKRlHhBcgHHpXgzrF/
 8DAeyxk2NRGV0NMLstD/nkfBftCTwnCaA8JD7waPad1xAa5rwTxQ24K6EYR35kYc
 2a/Fvko04SAjJJ11Sc2J0GFB/UF1W27w01T1ChA2wAjzqQ==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com
 [209.85.219.69])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45d2u9tbmb-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Sun, 16 Mar 2025 16:16:04 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id
 6a1803df08f44-6e900f6dcadso85158306d6.3
 for <dri-devel@lists.freedesktop.org>; Sun, 16 Mar 2025 09:16:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1742141763; x=1742746563;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=gZ8Bn6DY+92bU3zQgD3fwtJOnB6LTLol4X+ChLCFZuU=;
 b=nBQ8eGKPunTzbeh/wfi1uzgOvk4PfcWcgigsARqtZavBzcL3jCl+VPThhaO+sAVtuj
 6q/lQsjYLogs/Cqz9+9j1k2+3ViTsd9b8uCX2A9IVKzPFzP1k5Bwg8oszESeMQ68J7Zi
 zdOzfDRpIHgPD7cW+QQP7IHKofPof7Y6SM+EhZl4uujiY3iNdA2DQDut5wZ+WH/uZb5x
 IolzGbQYTNV5k/scrFRMWsB+suU7aiVXOZSPgSK3xjLK7MDr/5ipk8/GlTR6kJJhPvqA
 uFFc6YKOyJH8LiAziOxjGZlsypPiYWYMZ2rnCHP5Go1DL6y5PCu24Ves20NvWF2GudDR
 24kg==
X-Forwarded-Encrypted: i=1;
 AJvYcCWRjuBg/0I0reHbwCSoRfHYP1u2ZrbRi2lKD5EbKeen/+aK0FSucUo66b/l7xbjiYqko5e2t2wtWTo=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxR20lunvgWerEQjSUHs84mWOaUiEoU1lz7F/orxUj1Ixy7QcEh
 mB8fCNfludEIgT4/6sx1xc3k6D6q8EN0RfuWccA2n3B5MDh3smwUe7LEyxl535qNlle+/wk0nWv
 iq9TX32fu3fFHjeBmAq1gKt5mNyLUqZYc9116FQL2+ryPU+zdmXYDukERMt/Je8OKFC4=
X-Gm-Gg: ASbGncuGLkRh9XG/+jKeWIHfWhsPgJcFqtb/+S51ddpS7gFXaLSnCbZO2/PY2p8ZIs3
 15XZBkX9yaa91Cu9+Z5Iu5RzOebyHFwBAac8z/t72RcYHA1MHRalpNGNOZug6R7/foVb1VFSVHc
 Zc1wTj2tsfe/PsFbx1Z8qL43VXYkfomDoMt8ZjYWuO+hRpgafmji9BqhbRikFbhzmFvd48Is0n0
 DuMhd1AHCdtg1yfhUH5HeX/E2GaMsuaf2Kwm6eBW8VQsH3Z4jTyEhFtE2OfSiWvf+OfN9H5Dc0m
 scCelNa/zvd30ockwNMHtykVG8ma0MZDTJcdWrgKiQ4n9dlb4AQZoF4S+xuwLcGQO9JX03I2sd1
 7epo=
X-Received: by 2002:ad4:5ce3:0:b0:6e8:f3c3:9806 with SMTP id
 6a1803df08f44-6eaea9961d9mr180504836d6.4.1742141762732; 
 Sun, 16 Mar 2025 09:16:02 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGdg8p4T5KZ4SfaCZdgydBqNUwuvyqjOZH8PVm8pCxczjyUKDH2qmzaDr+bex4uQZJ6V+84Ow==
X-Received: by 2002:ad4:5ce3:0:b0:6e8:f3c3:9806 with SMTP id
 6a1803df08f44-6eaea9961d9mr180504566d6.4.1742141762461; 
 Sun, 16 Mar 2025 09:16:02 -0700 (PDT)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-30c3f1da6desm13199351fa.94.2025.03.16.09.15.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 16 Mar 2025 09:16:00 -0700 (PDT)
Date: Sun, 16 Mar 2025 18:15:57 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
 linux-renesas-soc@vger.kernel.org, Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 dri-devel@lists.freedesktop.org
Subject: Re: [PATCH RFT v2] drm/bridge: ite-it6505: make use of debugfs_init
 callback
Message-ID: <aijszs4vqtfo6sdd3cg5arjj2q4fcklnbwk5ma5txo35xwz2kf@hx63juithpjj>
References: <20250315201946.7428-2-wsa+renesas@sang-engineering.com>
 <xd3purmdhn34guhconvpuvw5n7nfhkt2vg4c3pdyn6f4ksgu25@ssxzqbysngww>
 <Z9Zu_5K0DK_egHl4@shikoro>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Z9Zu_5K0DK_egHl4@shikoro>
X-Authority-Analysis: v=2.4 cv=JsfxrN4C c=1 sm=1 tr=0 ts=67d6f944 cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Vs1iUdzkB0EA:10 a=EUspDBNiAAAA:8 a=zy1tgE8bQ-mCDbwybkkA:9 a=CjuIK1q_8ugA:10
 a=OIgjcC2v60KrkQgK7BGD:22
X-Proofpoint-GUID: U1hXp_u1ClgKPnaZeZZ82sfVGeiGho0z
X-Proofpoint-ORIG-GUID: U1hXp_u1ClgKPnaZeZZ82sfVGeiGho0z
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1093,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-16_06,2025-03-14_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 adultscore=0
 mlxlogscore=897 impostorscore=0 suspectscore=0 phishscore=0
 priorityscore=1501 bulkscore=0 malwarescore=0 spamscore=0
 lowpriorityscore=0 clxscore=1015 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2502280000 definitions=main-2503160117
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

On Sun, Mar 16, 2025 at 07:26:07AM +0100, Wolfram Sang wrote:
> 
> > > +	struct dentry *debugfs = debugfs_create_dir(dev_name(it6505->dev), root);
> 
> I will switch away from dev_name() here, too, of course.
> 
> > >  	int i = 0;
> > >  
> > >  	while (debugfs_entry[i].name && debugfs_entry[i].fops) {
> > >  		debugfs_create_file(debugfs_entry[i].name, 0644,
> > > -				    it6505->debugfs, it6505,
> > > -				    debugfs_entry[i].fops);
> > > +				    debugfs, it6505, debugfs_entry[i].fops);
> > >  		i++;
> > >  	}
> > >  }
> > 
> > Ni: I'd say, it's better to move this function rather than moving
> > it6505_bridge_funcs. LGTM otherwise.
> 
> I started like this but it meant to move all the sysfs file ops code as
> well. That was quite a chunk. You still prefer to do it?

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>

-- 
With best wishes
Dmitry
