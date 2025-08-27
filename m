Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 81D31B38119
	for <lists+dri-devel@lfdr.de>; Wed, 27 Aug 2025 13:33:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E506310E7BC;
	Wed, 27 Aug 2025 11:33:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=fooishbar.org header.i=@fooishbar.org header.b="ZlIubBFf";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-f176.google.com (mail-qk1-f176.google.com
 [209.85.222.176])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 15C1210E7BE
 for <dri-devel@lists.freedesktop.org>; Wed, 27 Aug 2025 11:33:01 +0000 (UTC)
Received: by mail-qk1-f176.google.com with SMTP id
 af79cd13be357-7e872c3a0d5so652268785a.2
 for <dri-devel@lists.freedesktop.org>; Wed, 27 Aug 2025 04:33:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=fooishbar.org; s=google; t=1756294380; x=1756899180;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Z3y4v46ZF7X8g5ThZrHBlGjNn21i+MtQxtbp82F3kG8=;
 b=ZlIubBFfbTp6f1cu8jtnfyBvmQErCnwljq1E7DhTPANWmNQe8+15J02wvDtsOIh6Fq
 EH0/vWI/q6z2HaYOZgzN0vjQqUAVWApJlTFUWARqMcIw7I0YAdkAI84O4ECVp/v0Y4Fe
 h/CGXLhi3GgpoYV2j+K+Ot9/vq7u1jZenDgWTA5ycAVlUjgI7glBHfr6l2qbev6jSMqQ
 QYvljDi7yhgNw8qH/WqIIzcx8X4wtqO2lnJErjIM17dhiuUAAybhNRUtcOafE7ZeyXIb
 4MIYnLliM+dCw/nrYyeJD0ClwzHu1mXJ2ZoYQR69Qc/PyiNepJTZtfw5YwnHp8K1IZNm
 W0Bw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1756294380; x=1756899180;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Z3y4v46ZF7X8g5ThZrHBlGjNn21i+MtQxtbp82F3kG8=;
 b=t8Abe+DgQxzyaej7R9Ca4VKxUi+JVNEDnTahExuTIgd9nrAcH7oMAxrm4uSV73+MSu
 oaPTjCfArpUu2Z3cYnlZJ0q0s3XWHLf+0JUPiZ/JNi6NGFgFfDad61G75vjNh83ahsvC
 MmxeSY/hhodJJVzZwswdfLqPROoc8+RxUD2ay8vTW9EKOLh+N16G/JoYq1NAZyKKuKX0
 qUCfyLResPp2ABYDY1hFjjhD+e1NhFx+Gztk72y5NDxqD6YcVcu+LxwEcEEcT0hd1oIZ
 v+b56finbs0pk4I5Aj35pbAoTcK2vOKT9Qr0DLRSYAbvXKBIhZ160LEi8S8xENKnN1zF
 8olQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUP2U+C2T4SENI1+MG4d5nDbaEB8TheYYhhkgu6BtbmvJU2Guwc4pVS6umFHkKMdKT5Di6lRM9gYLw=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxCJnyuexL0pKXhEfKZyiCr6030zvwTL/Ul08/YMSU1znLlDqas
 m2Q8r8TdtLroqgVYXYouuAxHFExWjxzmBZq4zdlxVmj9toUO+lNoKl7wpqZU8DXz4ax3PwadFra
 yvsHRAEpX1DlLFQ3gO8fYO9uOrvLSLHkWkmJZPdsEzA==
X-Gm-Gg: ASbGncsXp0ZcJXk8xyj/ky36yOfo9+UB4u7hKK+SN2UwqLe80ZoX1t/QoWAT/NKy5EA
 j9DIoYcJZYAwyx4Cm+9U+Rsc1CuUL7B4B6G/rlDSrWYD7iEDup5da/3Ui/KvNXdErbJfGEVAIeP
 ChbHB615XP5s606OxJ1hlTN/udzu0V/o64wd7d9K28DfKeYcmf28a5DvV8bPleojyo3xEJ6aR2f
 y+K2GxTRYpgKO7l
X-Google-Smtp-Source: AGHT+IGmmuxWMn1RQng0MqU7LfWDmGXD9wRFwAweLJvIB7bsSHwPntqlQ+JKaDysNEyaOvC876Q504deR3IuVc5pgao=
X-Received: by 2002:a05:620a:2804:b0:7e8:1718:daf4 with SMTP id
 af79cd13be357-7ea10fc7a07mr2104471485a.16.1756294379779; Wed, 27 Aug 2025
 04:32:59 -0700 (PDT)
MIME-Version: 1.0
References: <20250822-mtk-post-blend-color-pipeline-v1-0-a9446d4aca82@collabora.com>
 <20250822-mtk-post-blend-color-pipeline-v1-1-a9446d4aca82@collabora.com>
 <DCD62EFHFCEB.XEOPUPKZQ5XW@redhat.com>
In-Reply-To: <DCD62EFHFCEB.XEOPUPKZQ5XW@redhat.com>
From: Daniel Stone <daniel@fooishbar.org>
Date: Wed, 27 Aug 2025 12:32:48 +0100
X-Gm-Features: Ac12FXz3D5zUTg3Df1XjwtCpaINdk3SCVFUs0YESiGpt04Vrw7Xa6CeoI-p4LK4
Message-ID: <CAPj87rMDvaj28+h9fHkH+bZYH43N-dS_XHu9eomDphjXmPqArA@mail.gmail.com>
Subject: Re: [PATCH RFC 1/5] drm: Support post-blend color pipeline API
To: Sebastian Wick <sebastian.wick@redhat.com>
Cc: =?UTF-8?B?TsOtY29sYXMgRi4gUi4gQS4gUHJhZG8=?= <nfraprado@collabora.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, 
 Chun-Kuang Hu <chunkuang.hu@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>,
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Alex Hung <alex.hung@amd.com>, 
 wayland-devel@lists.freedesktop.org, harry.wentland@amd.com, leo.liu@amd.com, 
 ville.syrjala@linux.intel.com, pekka.paalanen@collabora.com, 
 contact@emersion.fr, mwen@igalia.com, jadahl@redhat.com, 
 shashank.sharma@amd.com, agoins@nvidia.com, joshua@froggi.es, 
 mdaenzer@redhat.com, aleixpol@kde.org, xaver.hugl@gmail.com, 
 victoria@system76.com, uma.shankar@intel.com, quic_naseer@quicinc.com, 
 quic_cbraga@quicinc.com, quic_abhinavk@quicinc.com, marcan@marcan.st, 
 Liviu.Dudau@arm.com, sashamcintosh@google.com, 
 chaitanya.kumar.borah@intel.com, louis.chauvet@bootlin.com, mcanal@igalia.com, 
 kernel@collabora.com, daniels@collabora.com, dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, Simona Vetter <simona.vetter@ffwll.ch>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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

Hey,

On Wed, 27 Aug 2025 at 12:17, Sebastian Wick <sebastian.wick@redhat.com> wr=
ote:
> On Fri Aug 22, 2025 at 8:36 PM CEST, N=C3=ADcolas F. R. A. Prado wrote:
> > Introduce support for a post-blend color pipeline API analogous to the
> > pre-blend color pipeline API. While the pre-blend color pipeline was
> > configured through a COLOR_PIPELINE property attached to a drm_plane,
> > the post-blend color pipeline is configured through a COLOR_PIPELINE
> > property on the drm_crtc.
> >
> > Since colorops can now be attached to either a drm_plane or a drm_crtc,
> > rework the helpers to account for both cases.
> >
> > Also introduce a new cap, DRM_CLIENT_CAP_POST_BLEND_COLOR_PIPELINE, to
> > enable support for post-blend color pipelines, and prevent the now
> > legacy GAMMA_LUT, DEGAMMA_LUT, GAMMA_LUT_SIZE and CTM properties from
> > being exposed.
>
> Please note that you'll also have to deprecate the semi-standard
> Broadcast RGB property. It serves two purposes at once: it changes the
> values between the color range (similar to COLOR_RANGE but at the other
> end) and informats the sink of the range as well.
>
> So the post blending color pipeline will need something like an inverse
> COLOR_RANGE op.
>
> We will also need a new connector property where user space can select
> the color range, which does not change the pixel values, and only
> exposes options that can be achieved (default sink behavior, full range
> infoframe, limited range infoframe).

As a note to others, the follow-up is on the 'pixel_encoding' property
thread here:
https://lore.kernel.org/all/DCD5VIFRKFB9.1KHIZI3ASID2I@redhat.com/

I think we should keep discussion of those properties there. :)

Also strongly related is the proposal to add range/encoding properties
to writeback connectors; analagous to the inbound properties:
https://lore.kernel.org/all/20250813170542.331206-1-robert.mader@collabora.=
com/

I've talked myself around into thinking that the writeback-connector
property is better than trying to use colorops to do the transform. On
the hardware I've seen, whilst the CRTC output pipeline does have
colour-transform properties, the final yard of the encoding (YUV/RGB,
full/limited range, primaries, etc) is in fact a per-connector
property, so I think it makes more sense there, as that allows
usecases like RGB display output whilst streaming to YUV writeback so
you can push it directly into an encoder without an intermediate
RGB->YUV conversion step. But again, I think conversation about that
would be better on that thread rather than here.

Thanks!

Cheers,
Daniel
