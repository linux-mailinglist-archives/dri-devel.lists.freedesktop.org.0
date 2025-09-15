Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B4A8B57C13
	for <lists+dri-devel@lfdr.de>; Mon, 15 Sep 2025 14:56:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9D61710E47E;
	Mon, 15 Sep 2025 12:56:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="nzpHhmN7";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EBDD110E4A0
 for <dri-devel@lists.freedesktop.org>; Mon, 15 Sep 2025 12:56:43 +0000 (UTC)
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58F8FiI2006151
 for <dri-devel@lists.freedesktop.org>; Mon, 15 Sep 2025 12:56:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=m2tfMPHRoZs9jwXa+IEmf+UL
 q8xGItfcLy2e5D4Z1OY=; b=nzpHhmN7I6f5nFmSf1S6m/UkblPTxPAUlkkgyQeU
 Q+oETxYMCNv8UsoiLs5mUruZgLgFFq5JN1jjwe4OhPdqsUTSLko6TIm7leSXB8a9
 aZdbvTMebGd1HS5X/2XqVwo5GRUxPh4VjMKG97TVUQKt8bj2gVss4WqlIu0UMsHN
 KF6dyLC7HTWemXMP9He8l/kHnczWSORSBAaJYqF0M6vtHIXW8J4thUxZceXTD7hD
 l6yXLIz8tQVefiQT9au2QMM4wd0PssL58BajfjJCG28rNdVdJD72Oz4+0jKsrLJO
 lnz0CltBzLrbgoyGWU2Wqm774vjnAD23uN27cp9lzKERfQ==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com
 [209.85.160.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4951chcve0-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Mon, 15 Sep 2025 12:56:43 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id
 d75a77b69052e-4b5e9b60ce6so121381081cf.2
 for <dri-devel@lists.freedesktop.org>; Mon, 15 Sep 2025 05:56:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1757941002; x=1758545802;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=m2tfMPHRoZs9jwXa+IEmf+ULq8xGItfcLy2e5D4Z1OY=;
 b=h9lqYO2Qzjt4NjJNnb4W95mVsEvxPEHCZTV/0Du0QMpT286IsEh4ssxR2mkOk28fNc
 ycIK3sWUBakUIOKxbKhgbC30rxOaocDQVXkS7EpCBZ1rS/MPH0JkqjPE9zvCxdhKHgLP
 qAnacWSab7Hvmlr/6Hh7Z0GP4fTuKt8Utx6s3fvPKZhhObpAenoMcPkjK3CIlBt0HlpS
 MaDB7bTNV3W1J5aYKdc8tq1AkzyqdQvBTHZz0mW3jfSk+b++KqDpvryIQPjBvftHJq4n
 pJktskDqxYbdf46qTS8LN2vU9xf8DLXSt6GJXqFUWjB1ESbNPVqpDJEifJgGMpKMqjrE
 R4zQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVUKE5B0kB5FrUz84ULEfCycFdAMyIzlQr3QESsEYeMMT+TXDdVj+YBK8MoPkXYfsBn9itSMDpnpk8=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwOFi1xBzniARMiUc+zTK5D8mpH8+J/ueGSImQobznoD1Og2BUq
 Y0+SLyx23JM1qiZdHQWr9PlJe7Xuy1gJ0gRXrfoS+REI3LQSpqhJg92v57k/52bVuDb+n/U61H8
 mmTvJ0uOSo168TZ2CyEyXdzTn8P1Q1s57WCZEvy8leBPqkeGbcHb0utzYQg7WzL7gSTJp47s=
X-Gm-Gg: ASbGncsnYb+PbyYRXrWhT6y2lvU5WIv3dE7Oo11IgDK8gUeQDq+23k9GiTiHeFGM++S
 D6V1NRCzak1QJRRr8ekNZVJxpQyd6EqXtZ48AJOZlOF4vBNqFstyXSu9PBrcS+0lo5aPe0hG3j3
 BN7trJ4wmcPgXmtz3apPAK//6E+7MA94CHWydvTjsNLf6at5qivjtP4O+fVsKHWIywPXAmaDGnD
 CM+xLoYBLUV4WT2aU9zpy38wjIbSpn/fjZJkr6zM5hMyj4rVXRpliIaDFhOSZEWq4vgmw1GoOCQ
 7ygWm+6Jkf1N3Ouso43pssaljK9+MGRbZYi6HQXMFKVV2y9fUJcmDpFXPjv+UOqdsM2daZs8LfE
 VDWicB6YinYFsx5iM/YM+f5zOr8AmwUXsUUzHNlUrBHwInavzhi2h
X-Received: by 2002:a05:622a:598d:b0:4b2:9584:adc2 with SMTP id
 d75a77b69052e-4b77d077573mr164748301cf.61.1757941001738; 
 Mon, 15 Sep 2025 05:56:41 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFLK0oYa+0o/6GNpGLpG+J51+rCcujNS2C4a6rgPnLc7T4L1xtO4j4u4qgjjcc/oSaO1vTyQw==
X-Received: by 2002:a05:622a:598d:b0:4b2:9584:adc2 with SMTP id
 d75a77b69052e-4b77d077573mr164747721cf.61.1757941000979; 
 Mon, 15 Sep 2025 05:56:40 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-571459c1482sm2816436e87.0.2025.09.15.05.56.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 15 Sep 2025 05:56:40 -0700 (PDT)
Date: Mon, 15 Sep 2025 15:56:38 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Maxime Ripard <mripard@kernel.org>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Robert Foss <rfoss@kernel.org>, Jonas Karlman <jonas@kwiboo.se>,
 Jernej Skrabec <jernej.skrabec@gmail.com>, Jyri Sarha <jyri.sarha@iki.fi>,
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
 Devarsh Thakkar <devarsht@ti.com>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH 06/29] drm/bridge: Implement atomic_print_state
Message-ID: <sb26c3jupnaxq354evjiy66ylnv3c2mumlcdiqe2zn3gwpnjae@4sol23rjv4eu>
References: <20250902-drm-state-readout-v1-0-14ad5315da3f@kernel.org>
 <20250902-drm-state-readout-v1-6-14ad5315da3f@kernel.org>
 <056b0335-f104-4b67-9882-6beaecd21c76@suse.de>
 <20250902202212.GU13448@pendragon.ideasonboard.com>
 <20250915-intrepid-quaint-bullfrog-bb68b8@penduick>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250915-intrepid-quaint-bullfrog-bb68b8@penduick>
X-Authority-Analysis: v=2.4 cv=eeo9f6EH c=1 sm=1 tr=0 ts=68c80d0b cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=yJojWOMRYYMA:10 a=P1BnusSwAAAA:8 a=aqNsKDukHhMFCnqKvA4A:9 a=CjuIK1q_8ugA:10
 a=a_PwQJl-kcHnX1M80qC6:22 a=D0XLA9XvdZm18NrgonBM:22
X-Proofpoint-ORIG-GUID: Z02pde1Pd2xsZK1VKtDKvOym34V4zZ5o
X-Proofpoint-GUID: Z02pde1Pd2xsZK1VKtDKvOym34V4zZ5o
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTEzMDAzNiBTYWx0ZWRfX6G8mv4jjaB/o
 +9vzmBAnWsmJPObLo5mdNza5XaLu0GYmRUhnI1JeLEeUYde8kkGnelGR4YIqPCJGsBaC4svYi6B
 MSpTLyI7M8WlC16KbMYo7lTSBRjZV3RKhMDa/653eLrYoX4Vvke9E0DS+XXTIiwB7ZiB6qk/Fhd
 ic1sbBgI2XPw5RPDB6RMPBUY7TqZMG/IkJonjCLjnoBgNyh0zOoK7gBG2hr+xi+RTFzwztLerwc
 5IWFGFx2LWKLz1ZycdBrWZfyX6QTlazVJCqJAoUY4cwkd4D3GF+Djpm1siyCpma21KjS33C5YmT
 iwxl5gf/e43Z2MBesEiiWXMd4D4i4LNqyDKuoB6HlrxWiwib5+Izy83Zf7ys8ThXaclVZs3KUjW
 3in9nnvX
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-15_05,2025-09-12_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 malwarescore=0 impostorscore=0 bulkscore=0 adultscore=0
 priorityscore=1501 phishscore=0 spamscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509130036
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

On Mon, Sep 15, 2025 at 01:28:46PM +0200, Maxime Ripard wrote:
> On Tue, Sep 02, 2025 at 10:22:12PM +0200, Laurent Pinchart wrote:
> > > > +	struct drm_bridge *bridge = drm_priv_to_bridge(s->obj);
> > > > +
> > > > +	drm_printf(p, "bridge: %s", drm_get_connector_type_name(bridge->type));
> > 
> > It would be nice to identify the bridge more precisely, but bridges have
> > no object ID :-/ The raw pointer may not be very useful. I wonder if we
> > should give an object ID to drm_private_obj instances, even if we don't
> > expose them to userspace. That's not a topic for this series of course.
> 
> I agree, and would have liked to have something a bit more descriptive
> indeed. But bridges have neither a name or an ID, so I couldn't come up
> with anything better :/

For debugfs we ended up printing the symbol for the bridge->funcs and
the OF node path in order to identify the bridge.

> 
> > Reviewed-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
> 
> Thanks!
> Maxime



-- 
With best wishes
Dmitry
