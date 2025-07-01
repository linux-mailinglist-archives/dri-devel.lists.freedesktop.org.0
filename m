Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A880AEF099
	for <lists+dri-devel@lfdr.de>; Tue,  1 Jul 2025 10:12:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9609B10E280;
	Tue,  1 Jul 2025 08:12:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="CaUIaWuK";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1F8A810E280
 for <dri-devel@lists.freedesktop.org>; Tue,  1 Jul 2025 08:12:01 +0000 (UTC)
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5614T5nq024928
 for <dri-devel@lists.freedesktop.org>; Tue, 1 Jul 2025 08:12:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 mYs/1xbs+QveyXL6r8F/yKS/UmQpDu1qrYXWQK8jZlE=; b=CaUIaWuK9ULF1tsB
 Modzhn9oNSLBqHAuOkIFKie0PlxOmirnNVJ7PzUvFBrGOD38DRWPL++lziBVH4wc
 6aix0uw4vC1cb1EOs8HBL90FNfrrJlIAwzbsEl6ZesizTSM5pQ4VAAgU/iHbtSeQ
 Rgr/yXu258X6332SVLxeY/gs1W/xJwA7wvpbaHhchhoZAQgjtev2dGCvSAxeh+qC
 Y93ys4BK9MWjOMhSDViloyL12JimvevvRr9OJ9UnmcBV9wNYy5LLPjyIliz9+IRR
 vKFtjAp4elZy7dpmCtCQyiczPOuHVGSG2uwZwrmADBb+xOaD/gpuHlgVIwYzvb8q
 R1a/dA==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com
 [209.85.219.72])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47j801yp4u-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Tue, 01 Jul 2025 08:12:00 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id
 6a1803df08f44-6ff810877aaso86237556d6.3
 for <dri-devel@lists.freedesktop.org>; Tue, 01 Jul 2025 01:12:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1751357519; x=1751962319;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=mYs/1xbs+QveyXL6r8F/yKS/UmQpDu1qrYXWQK8jZlE=;
 b=Qw0oZo7oIQKN5W6LM7/nAt18FezTsd9kMydK0ZJdkjtnK0jjSHDvhOSq0GukXgrEZg
 8YttVvJsid3L45JWY2UDMVDabAJDbEAU0GMKoNU5+V1SX/sFmiap9YdPgGgfmOeqIkGS
 NmjQ5u74uQARGG9tAv0ekB/DrBkUK2xh+ZB641+BjMxhcbHBFZU2t/2cbBEs/71JjsX4
 EGer28Qa0jGCgikyNpgFUK1WxBlVZXmloJKxzJjskZFYMxueppMZfpI4FsdAL/DjxuQT
 F29shzN6sW0u+t+/ZoUCTsH4zRSFoN9NLoHjoHD9cxhFQ7/hFzf0hw73xorLezT8j0yX
 YqPA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWrJIBSuBqHsY6/fjht4ibGhKOLEDvD9/SoZwwbJ+vqFnl0VoSOkUAmV/OzqA1YHgO4iqanePFCfQM=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxqQdm1VJM3X1263IxpBsYDAf8a3mlWAFrokz/uU9zqHXhgSncy
 ZisAVEOcEND5vMdNCiolRKvIjNsllRGJh/9pWh8LTahEhriYToMpz/EuBnQwWcE10kbs6PtYACl
 Vv0z1PK2rhXq7/+0IOb5HP26fRUfAh+Z8Dj7dXlvFzMR8doiAyE0UQko0ytBxbYCdH8lCy69YM3
 FAvu0W2nq0bvD+QNIdN59sg9Oyy5pFmQICQEXPzXYZj5lLJA==
X-Gm-Gg: ASbGnculplnxeeax0rEJstgGRQcYVMF3zJ0faz4/HOP0o4vueL9e35Vqi3U2Uu2t7l5
 Q8qQgaeDAID+6LFmehmccoXk74LAhoUZCkI7xzpsuTo7yFDEBFRvZTlDyID98IHxseAUHaViQid
 kNmbJ8
X-Received: by 2002:a05:6214:4116:b0:6fb:4e1b:5cce with SMTP id
 6a1803df08f44-7000214fab8mr256954996d6.21.1751357519211; 
 Tue, 01 Jul 2025 01:11:59 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFPwSCT6HtaF/AeVvJyRueivt1vcXvEKWD6xgi7k80N0APfW8ncctbCx4gtgRvDUxghNlJNisA43ol01567kz0=
X-Received: by 2002:a05:6214:4116:b0:6fb:4e1b:5cce with SMTP id
 6a1803df08f44-7000214fab8mr256954666d6.21.1751357518748; Tue, 01 Jul 2025
 01:11:58 -0700 (PDT)
MIME-Version: 1.0
References: <20250629023836.744441-1-loic.poulain@oss.qualcomm.com>
 <20250630-venomous-sheep-of-control-dece32@houat>
 <CAFEp6-3UVNfHo3s1MOXw88bAMVh=3QzF7H2N2UoVXyV6R3BBpw@mail.gmail.com>
 <20250630-angelic-macaque-of-spirit-fadc59@houat>
In-Reply-To: <20250630-angelic-macaque-of-spirit-fadc59@houat>
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Tue, 1 Jul 2025 10:11:47 +0200
X-Gm-Features: Ac12FXwfrmiMXwnwVf7DSRME2kustpNmkkrkqkC3n2PdmUpNlYrkq5Mm4E1bJM8
Message-ID: <CAFEp6-2N4G0J+Fmke369t7zsnHDpi4zPuRx_Xn-hXAWN7URoJA@mail.gmail.com>
Subject: Re: [PATCH] drm/bridge: anx7625: Fix invalid EDID size
To: Maxime Ripard <mripard@kernel.org>
Cc: andrzej.hajda@intel.com, neil.armstrong@linaro.org, rfoss@kernel.org,
 dri-devel@lists.freedesktop.org, lumag@kernel.org,
 Laurent.pinchart@ideasonboard.com, jernej.skrabec@gmail.com,
 maarten.lankhorst@linux.intel.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-GUID: _YyHaQ1SgWnS4OdRg5hR-RquDZT_cBzI
X-Authority-Analysis: v=2.4 cv=YPWfyQGx c=1 sm=1 tr=0 ts=68639850 cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=EmEyKLfA-J_5XmTq7x8A:9 a=QEXdDO2ut3YA:10
 a=pJ04lnu7RYOZP9TFuWaZ:22
X-Proofpoint-ORIG-GUID: _YyHaQ1SgWnS4OdRg5hR-RquDZT_cBzI
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzAxMDA0NiBTYWx0ZWRfXws7k/+4AHCE7
 M9/CQwjeNE/MPgRYCkMhm+xGEq8DSmIWCUUaPaSb0NCOl2krdKNxY+2DPuK9e4CUApXJYpyX8e1
 3jgkAqTB2ieVSa8dN+MZlzUN6HOC6RLmwmzYSerXu6F+KBbr73CnmYLzXNZ5JfX191ypV4nxt10
 4AsDugGA5CaOHJbBa58XRoRojGTCP5E1PMxMJrOFKLVpMztx6P5HnOeWhA2i3GlgchBW1TrMaqV
 HWP3fFYNt0Xa2ntpYrjuVkmz0TJp7k0WGcuvkaYVD4HOYKb7njmT8UZIzuHyeAbwMrnj8QMcPC9
 agNMrLe+rTIyMGsCKZmAHraAPpPCMBpQLcnZZG2J+pvq4ka1Jmb8Nvn5c54brG/VVlIHFim2mVf
 YMe7leEyGeoAhpG0dV4ZfTjgTpcL4pDmyYWz3Jqg/ZXcxqOlnNcvkfQf8jpOprmZiJ2qOFiU
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-01_01,2025-06-27_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 mlxlogscore=940 mlxscore=0 malwarescore=0 suspectscore=0
 lowpriorityscore=0 clxscore=1015 impostorscore=0 adultscore=0
 priorityscore=1501 bulkscore=0 phishscore=0 classifier=spam authscore=0
 authtc=n/a authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2507010046
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

On Mon, Jun 30, 2025 at 10:40=E2=80=AFAM Maxime Ripard <mripard@kernel.org>=
 wrote:
>
> On Mon, Jun 30, 2025 at 09:46:40AM +0200, Loic Poulain wrote:
> > Hi Maxime,
> >
> > On Mon, Jun 30, 2025 at 9:07=E2=80=AFAM Maxime Ripard <mripard@kernel.o=
rg> wrote:
> > > On Sun, Jun 29, 2025 at 04:38:36AM +0200, Loic Poulain wrote:
> > > > DRM checks EDID block count against allocated size in drm_edid_vali=
d
> > > > function. We have to allocate the right EDID size instead of the ma=
x
> > > > size to prevent the EDID to be reported as invalid.
> > > >
> > > > Fixes: 7c585f9a71aa ("drm/bridge: anx7625: use struct drm_edid more=
")
> > > > Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
> > > > ---
> > > >  drivers/gpu/drm/bridge/analogix/anx7625.c | 2 +-
> > > >  1 file changed, 1 insertion(+), 1 deletion(-)
> > > >
> > > > diff --git a/drivers/gpu/drm/bridge/analogix/anx7625.c b/drivers/gp=
u/drm/bridge/analogix/anx7625.c
> > > > index 8a9079c2ed5c..5a81d1bfc815 100644
> > > > --- a/drivers/gpu/drm/bridge/analogix/anx7625.c
> > > > +++ b/drivers/gpu/drm/bridge/analogix/anx7625.c
> > > > @@ -1801,7 +1801,7 @@ static const struct drm_edid *anx7625_edid_re=
ad(struct anx7625_data *ctx)
> > > >               return NULL;
> > > >       }
> > > >
> > > > -     ctx->cached_drm_edid =3D drm_edid_alloc(edid_buf, FOUR_BLOCK_=
SIZE);
> > > > +     ctx->cached_drm_edid =3D drm_edid_alloc(edid_buf, edid_num * =
ONE_BLOCK_SIZE);
> > > >       kfree(edid_buf);
> > >
> > > Do we need to cache the whole EDIDs? AFAIU, it's only ever used to ge=
t
> > > the manufacturer name, which fits into a u32 / 4 u8. We should probab=
ly
> > > just cache that.
> >
> > While the cached EDID is indeed used internally to retrieve the
> > product ID, its content is also returned via the DRM read_edid
> > callback. This value is then used by the DRM core to enumerate
> > available display modes, and likely also when reading EDID from sysfs.
>
> You still don't need to allocate and store a copy of the EDIDs in your
> driver to implement what you listed so far.

Right, we could change how the driver behaves on callback and just
cache what we need for internal usage. That change was initially a
pure fix, do you recommend changing all of this in this change, or in
a follow-up one.
