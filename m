Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A199BACCD0
	for <lists+dri-devel@lfdr.de>; Tue, 30 Sep 2025 14:20:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 36B0B10E27D;
	Tue, 30 Sep 2025 12:20:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=fooishbar.org header.i=@fooishbar.org header.b="MLc9uSPW";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qv1-f48.google.com (mail-qv1-f48.google.com
 [209.85.219.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9A4CE10E27D
 for <dri-devel@lists.freedesktop.org>; Tue, 30 Sep 2025 12:20:21 +0000 (UTC)
Received: by mail-qv1-f48.google.com with SMTP id
 6a1803df08f44-79599d65f75so47820336d6.2
 for <dri-devel@lists.freedesktop.org>; Tue, 30 Sep 2025 05:20:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=fooishbar.org; s=google; t=1759234820; x=1759839620;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=JfRlA2NUhU1kG602IPax22A5h+dNSAH5OIBQUrcaHKQ=;
 b=MLc9uSPWf/jpUG6f0oEGrPVT73zKUYZ7Yy7lWSJJC/82t3Ff4ROeDLbN2l3YpIC1XP
 X5F49wJssY+tIjjHo6HhOsMAXDpPPv+Wy3g0Vx8uieM3fvRgM1rrXqea7YU+Iy72L4rw
 c3XHxONH8WDg0t1UUHv53Slae0YrQCGgH0wQFOYue7GeLN75wjAAEq9Ith6f6xaWZ3ov
 8M6U8wsaFxKEw7n3bfioWm4FrdQN1r9KuKeHkcZV47FSe6/jAlnhFzg7Vz+ruwpYpwGp
 ajpAz9F9qfIEf8OKDFN+eTrt9nT6iHXiVDCUURO3saFXKbICBJmyHR9chqEgLKBcDlE5
 6MJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1759234820; x=1759839620;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=JfRlA2NUhU1kG602IPax22A5h+dNSAH5OIBQUrcaHKQ=;
 b=svGlYKR2k9AtsiYt26mQVgvd+yVxYpXWNiOZMYMHql36XPOU/biWRPIaf5HWkioeD2
 dO+gp9+w1dA7V6OddcPne5fsvcRcIVIJXJrH5n25/mv6BCO5t5BmtPxej8YloQEuCZiJ
 9Hbn7O22n2ej8VHO8x7MBwjS7vG0MnBqDt2miUB9aWalhnYcbTpqFIome+Egrgk4HgQ3
 ODgq6VArCJN+48GFVx9RxtgAbt+cvSfcqTcaWS7nSs3EaC3LhBvEyVMm69hgO/MeNriS
 SaUSzQIsCcO3779kCILoKHNshsuirwSprM++Q/AFBEOyiCVyxZzNek5fYkyFajT38uFk
 E6lw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUliq/3xyBCYfGeQ3u5cavRLcqwE3WS78JTUI6OD+dpCxq/Nz7kdZtonfe+DEdzViXfFkpeHVUNLo8=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yw1XUFeTJSsg2sD2jsy2b55Nme0coWAUe6Dr5IzwXSlzflEkES4
 fleQdxejr9NlZAy1FEZ4Z0Jfw0Eszm6iEpd7KLIjkwS46bQa8YpBhLPiZmrtcNKnbl8WFOvjI5I
 Q+W3elPWBtI3e8JqvOZ4SxH5cVtduLiSUOujecK1Lkw==
X-Gm-Gg: ASbGncvao0cmY3znl4DkQJ4Skoh6SpL+uTkj5L5q4mgOH9huoITaSi7E3MrtQvlh00b
 jVYBROJ5M6SPD9KY5honug6rvG9KMGwviUmXOc0r2vqUObrp8StJPCzhCC9j5iPcYiLIO1/ln+1
 eUZALuq5UD55bivagOyYQjLGalTM+t9QySuGgvfNyF28ds657XXnLkhLOLiGznXs1ot5RzDZUNu
 tJJr/rJo/IsBrxGmSHEsHB9B1CH5vpy56VUd49y
X-Google-Smtp-Source: AGHT+IGNbjw6RNqsJAvb7qKyVX9JU+8Q52yRLDkjXoWDZvMcGT/3qrwgZCNcyKpRwrI6Z9Mglf9tBhqM86fyt3kXMf8=
X-Received: by 2002:ad4:594c:0:b0:794:5578:6a with SMTP id
 6a1803df08f44-7fc29999880mr292314156d6.10.1759234820411; 
 Tue, 30 Sep 2025 05:20:20 -0700 (PDT)
MIME-Version: 1.0
References: <20250822-mtk-post-blend-color-pipeline-v1-0-a9446d4aca82@collabora.com>
 <20250822-mtk-post-blend-color-pipeline-v1-1-a9446d4aca82@collabora.com>
 <CAPj87rPAoD2D99zTdsvJ=9K8+G17mTS2jDYHMPYmXNtUyp2L_Q@mail.gmail.com>
 <CAFZQkGwotQ6cxVCSgp-BhUi5DaZ7MyVvbnrDJW11Z7ztzqy58g@mail.gmail.com>
 <CAPj87rMTOD3_tC70QX4xz3G4zdG=tmwt5VgPhq6jNyf8bbW49Q@mail.gmail.com>
 <269ca85a59f613568543f45867fba7e604cc9f11.camel@collabora.com>
 <CAPj87rMhsFy+uzKmNecrQG4e+BEoeX1FyEobO7bnHdQqhy1_2Q@mail.gmail.com>
 <2a985767-0fe1-40fc-b45e-921bbf201e07@app.fastmail.com>
In-Reply-To: <2a985767-0fe1-40fc-b45e-921bbf201e07@app.fastmail.com>
From: Daniel Stone <daniel@fooishbar.org>
Date: Tue, 30 Sep 2025 14:20:09 +0200
X-Gm-Features: AS18NWC_qgpU_0cN4JQ19aLDGw_PL71UmwKNqFB1ss4l60CpIYnHrco3rK8zc9M
Message-ID: <CAPj87rMHP_np_9vtnyJ_NU4S3W09DoMRrLPps-33hTngdLyKCw@mail.gmail.com>
Subject: Re: [PATCH RFC 1/5] drm: Support post-blend color pipeline API
To: Sebastian Wick <sebastian@sebastianwick.net>
Cc: =?UTF-8?B?TsOtY29sYXMgRi4gUi4gQS4gUHJhZG8=?= <nfraprado@collabora.com>, 
 Xaver Hugl <xaver.hugl@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, 
 Chun-Kuang Hu <chunkuang.hu@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>,
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Alex Hung <alex.hung@amd.com>, 
 wayland-devel@lists.freedesktop.org, harry.wentland@amd.com, leo.liu@amd.com, 
 ville.syrjala@linux.intel.com, pekka.paalanen@collabora.com, mwen@igalia.com, 
 jadahl@redhat.com, sebastian.wick@redhat.com, shashank.sharma@amd.com, 
 agoins@nvidia.com, joshua@froggi.es, mdaenzer@redhat.com, aleixpol@kde.org, 
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

Hi,

On Fri, 26 Sept 2025 at 15:45, Sebastian Wick
<sebastian@sebastianwick.net> wrote:
> So I'm going to argue that making the properties read-only or read-write =
is useless.
>
> The only case where knowing the color pipeline of the previous user would=
 be useful is if you want to re-use the framebuffer of said user. Otherwise=
, the color pipeline and the generated framebuffer have to somehow just mat=
ch to produce the desired output and that does not require any previous sta=
te, making the legacy properties useless.

I don't think it's useless; if nothing else, drm_info is a thing and
having it work is nice.

> If we genuinely believe that this is something to be supported, then my q=
uestion is why the new color pipeline should not be able to accurate reflec=
t the state of the previous user, even if they used the legacy props?

That's reasonable. My hunch was that it would be too much code in the
kernel to essentially just do format reinterpretation on userspace's
behalf.

> The hardware was able to get into some state based on the legacy props, s=
o it will be able to get into the same state with the color pipeline props;=
 it's "just" a matter of exposing the right pipeline.
>
> If we are not able to accurate reflect the previous state with the pipeli=
ne props, then use space will see inconsistent state between the legacy and=
 color pipeline props. Which state is the right one? We cannot know. The pr=
evious user could have used either one. So having the legacy props does not=
 help because we don't know if we should use them or the pipeline state.
>
> So, I would argue that we should *remove* the legacy props if DRM_CLIENT_=
CAP_POST_BLEND_COLOR_PIPELINE is set. If the handover is relevant for a dri=
ver, they should ensure the legacy props state translates to the correct co=
lor pipeline state.

FWIW, the usecase I can see in mind would be doing a fade-style
transition between the old and new clients. But I don't really care
too strongly about it to be honest; I mostly care about having
drm_info work because it's a super-useful tool.

Cheers,
Daniel
