Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A2480B55847
	for <lists+dri-devel@lfdr.de>; Fri, 12 Sep 2025 23:17:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 59BA110ECDB;
	Fri, 12 Sep 2025 21:17:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="WSO9eHzF";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8414310ECDB
 for <dri-devel@lists.freedesktop.org>; Fri, 12 Sep 2025 21:17:33 +0000 (UTC)
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58CHLKwR023486
 for <dri-devel@lists.freedesktop.org>; Fri, 12 Sep 2025 21:17:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=XIuWCw5HOC1S3kZ7x6UEriyw
 3+QB1l3MBdNQVH5e2lA=; b=WSO9eHzFl9ZzrV/w8EKaTJWq8x1g7hgyezVBN54x
 AMrM8XfZrCFbO5dOw9vQs+nWdcWfGsiGRSbnhGdgBWbU8xW5MOAA1OcdV8luq7N6
 u1IA4/N+yVG+DCE3s/U1j2oXsbi5sw7SD9E9qNhT5H7Q5uAAp1J+XBpP+4SXtjNH
 zqTjASVAMvGFoU6UDxD9/t69ZbORVvoiHl18cC7B/4to5u8XHbCc3cvTeT/MnUfg
 ZRbDVmJoUZjeHa30cAUdIHAkgOfAd934qLxnXcy3c2dyv9XJFbYejUWR1kft5bpl
 DnBQDUcpPip+q5oWh9ImK4awqKivrjOsz0w0MjImpIDUTw==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com
 [209.85.219.69])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 491vc2h089-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Fri, 12 Sep 2025 21:17:32 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id
 6a1803df08f44-76487cdf979so42747416d6.2
 for <dri-devel@lists.freedesktop.org>; Fri, 12 Sep 2025 14:17:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1757711851; x=1758316651;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=XIuWCw5HOC1S3kZ7x6UEriyw3+QB1l3MBdNQVH5e2lA=;
 b=ecf+2llJyA+R1IIbgjEd3N/LehmoMr9SiK9HZAPgxSQSZ6Sy96zBvWwu0TVAwS+Q9p
 rUFqaz34e6iePAEfTa41GyI1YJ0mRJNrrTxkgk4/fUCU5si28G+te1FgDo5tuvy9Q6P0
 oGGfRDJ7zuP4id5IJlu2s/j2gw2wGGcV6MYR5ESqvOdZ6+oUpVZrEvvYk/WsIeGnWnOI
 ojkJYFYqBCvmi1E4vdyIMVHuyLKr+uip2HjBX59Ws+3kBbtxprNYBut5tNgev4OqIC9B
 gkmhAYBa9TY13Cyol5UQKAw4FxBJG2VdriFiLTlMFYwSyg+FtgVN2S42SdWdIUNBXyf7
 9p6Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCU0CLaCmfsDric8HBJo8p8/EEKB5dqjC63HoOCdmhng3UZrHfXlY5g9ut49ZRk4nD8/RvzvjlAYmHQ=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxbWqLpvkm+T1w5Raaf+FIXydoVA/0YJLVWjzejBDVQ57grOsMA
 KAL2NDoWkng+qmDdFINn1Xg98Wj6sL9UYoFItOnZmvPIn6XSLfBV0CyDvG6PZRjmZsnrTH7C8Kp
 cQ+qgYmbK07o9vvkVIShkL2kXoun9WEFJC32z5AjaXqEAT5HMAEcZ4l5DdgvCryfmWYGdpS0=
X-Gm-Gg: ASbGncvqNAkhSxZ3QbvfQAJ9r+yug2eFs1SH7wIxrnPSWcKjsBQhYwKmB4Rwpbr0n26
 6PZ5TCFXYRvUGfcANsLke8WERWlPgSuTOB7Yohv5BxeXFynCSlIpsaT9jHzbsKKK/lP13dZe4Kl
 4gHJVa2mfK3ba97eSb9MJT9vAhILa3QoFYUfHZB74j56LbybytEOceJhc3l8MshmSu9LBPPAIeM
 V7ZJUvWQp2JZjKTXBe0z0oVGWNLFzZPh7+6oyFu4PAfKksooBbV2/QQNssSHAKKc12HNVkSL50Y
 fvpFVVqzkClR4FwAubCb3MO1H7OiaNaeESuRDYey/hHaaOHTcjaAem6Ouanp0QCAOWHFmiDPtOm
 QLP/tOCGCcclSTHfPsYhcY7N9AhHQP3VpmuxcECCF2d0c+WuAytuH
X-Received: by 2002:a05:6214:509e:b0:70d:dade:c359 with SMTP id
 6a1803df08f44-767c2be9927mr60186236d6.35.1757711851467; 
 Fri, 12 Sep 2025 14:17:31 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHdB8QC81WYIBZYOo21OxXA8G4R3wtgnB0yEzB7z7tYIr0sgZ2/uptzKfWjoQmtUMgA/7nnMw==
X-Received: by 2002:a05:6214:509e:b0:70d:dade:c359 with SMTP id
 6a1803df08f44-767c2be9927mr60185616d6.35.1757711850792; 
 Fri, 12 Sep 2025 14:17:30 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-56e5cf300b7sm1423119e87.45.2025.09.12.14.17.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 12 Sep 2025 14:17:29 -0700 (PDT)
Date: Sat, 13 Sep 2025 00:17:28 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Marius Vlad <marius.vlad@collabora.com>
Cc: Maxime Ripard <mripard@kernel.org>, dri-devel@lists.freedesktop.org,
 wse@tuxedocomputers.com, andri@yngvason.is, sebastian.wick@redhat.com,
 daniel.stone@collabora.com, jani.nikula@linux.intel.com,
 tzimmermann@suse.de, simona.vetter@ffwll.ch, harry.wentland@amd.com,
 christian.koenig@amd.com, derek.foreman@collabora.com
Subject: Re: [PATCH 5/8] drm: Pass supported color formats straight onto
 drm_bridge
Message-ID: <75s4y54rfpkpf3xj7pz4msvg56lred5n5lu6b3zxb4wgblhsnb@e7v7yhzzsihf>
References: <20250911130739.4936-1-marius.vlad@collabora.com>
 <20250911130739.4936-6-marius.vlad@collabora.com>
 <fekbw2ngxyg4mvkhlvkvegylcm4vm74y5rhhxeygiqxve7oqaj@sxvkyqjssdru>
 <aMMIOBfuQ7oJFH6i@xpredator>
 <20250912-amiable-dandelion-bullfrog-abc930@penduick>
 <aMRtK6yLsQHzk26y@xpredator>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aMRtK6yLsQHzk26y@xpredator>
X-Authority-Analysis: v=2.4 cv=FN4bx/os c=1 sm=1 tr=0 ts=68c48dec cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=yJojWOMRYYMA:10 a=8zWBzZPzi33HNKxJj48A:9 a=CjuIK1q_8ugA:10
 a=OIgjcC2v60KrkQgK7BGD:22
X-Proofpoint-ORIG-GUID: jyo3wZs88_Du7vj-BFv7PP8ZphD0uE59
X-Proofpoint-GUID: jyo3wZs88_Du7vj-BFv7PP8ZphD0uE59
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTA4MDA5NCBTYWx0ZWRfX11jMja2hVVb0
 Bn4VyhrRPO5I/0MWtrS84Vx009KT/T6UJw9JtHZJ0xe/ngericRMjOcBPSwfpxb3oN39gFBQRoi
 k1zbs6a3Z1ZZccjVKgI62Jfoo5C6Ny8C+6Fsg+ck0b8MVaOyh9I8M8FTgkO8hgwOUXLMqSr7H0S
 frvQnZf9hsxK5sZ27gnNM+cuMJ40lggFIL4govOufgYsMn79GYiWMf2QTfwUJUm0eALemCpWI2b
 JPRg5vKyWE2yE2cE1SWjiPTQy5uX2byAgUo7owclaAwbUq//3QeHN/GR4ZwvzmlPCGKsiUjcNj8
 T23FwDUw6gygpVDZWMsvKJmhcESKPNnW8KT/GxY1trGVc5RsJKyOBhqsR5gCjj2E8Awas0OyEck
 lYkwh2lm
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-12_08,2025-09-12_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 priorityscore=1501 clxscore=1015 phishscore=0 adultscore=0
 bulkscore=0 impostorscore=0 malwarescore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509080094
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

On Fri, Sep 12, 2025 at 09:57:47PM +0300, Marius Vlad wrote:
> On Fri, Sep 12, 2025 at 05:31:17PM +0200, Maxime Ripard wrote:
> > Hi,
> > 
> > On Thu, Sep 11, 2025 at 08:34:48PM +0300, Marius Vlad wrote:
> > > > > diff --git a/drivers/gpu/drm/msm/dsi/dsi_manager.c b/drivers/gpu/drm/msm/dsi/dsi_manager.c
> > > > > index ca400924d4ee..4b87f4f78d38 100644
> > > > > --- a/drivers/gpu/drm/msm/dsi/dsi_manager.c
> > > > > +++ b/drivers/gpu/drm/msm/dsi/dsi_manager.c
> > > > > @@ -479,7 +479,7 @@ int msm_dsi_manager_connector_init(struct msm_dsi *msm_dsi,
> > > > >  	if (ret)
> > > > >  		return ret;
> > > > >  
> > > > > -	connector = drm_bridge_connector_init(dev, encoder);
> > > > > +	connector = drm_bridge_connector_init(dev, encoder, BIT(HDMI_COLORSPACE_RGB));
> > > > 
> > > > And this totally depends on the bridge chain. If we have a DSI-to-HDMI
> > > > bridge somewhere in the middle, we are able to output YUV data to the
> > > > HDMI connector.
> > > That's actually the usecase for this patch: to allow passing other color
> > > formats, but this patch is a transitory patch to further expose the fact
> > > drm_bridge_connector_init was embedding BIT(HDMI_COLORSPACE_RGB) for the
> > > format. See rockchip implementation for this bit, the last patch in this
> > > series.
> > 
> > I think Dmitry's point is that it needs to be integrated with the
> > atomic_get_input_bus_fmt / atomic_get_output_bus_fmt, because not only
> > we need to make sure the monitor supports it, and the userspace demands
> > it, we also need to make sure every bridge in the chain (and possibly
> > the encoder) can implement it.
> Oookay. Will be looking at those bits then. Thanks for pointing where
> I need to look at.
> 
> tbh it isn't super clear to me why is it now that an issue. If you don't
> mind replying back, it this patch actually exposing that, or that was a
> thing that had to addressed at one point? 

As I wrote, the encoder doesn't know which colorformats are supported at
the end of the bridge chain. I think that at some point we will have to
redo ycbcr420_supported too. Basically, consider the following chain:
encoder -> DSI host -> DSI-to-HDMI bridge -> HDMI connector bridge

The DSI host can send RGB only, but then the DSI-to-HDMI bridge might be
able to do all the conversion and send YUV 444 or 420 over the wire. The
HDMI connector (yes, it's a bridge too) doesn't really care, it just
passes the data through.

By adding supported_formats to drm_bridge_connector_init() you are
insisting on the encoder / root driver knowing what formats are
supported. It's not the case. The negotiation should start from the end
of the chain and follow back until the bridge which says 'I can do
this, no matter what comes in'.


-- 
With best wishes
Dmitry
