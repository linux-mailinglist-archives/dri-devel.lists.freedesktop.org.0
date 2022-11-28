Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id F3AAB63B2F8
	for <lists+dri-devel@lfdr.de>; Mon, 28 Nov 2022 21:23:34 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2A09810E330;
	Mon, 28 Nov 2022 20:23:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x22c.google.com (mail-oi1-x22c.google.com
 [IPv6:2607:f8b0:4864:20::22c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 75FCD10E34D;
 Mon, 28 Nov 2022 20:23:26 +0000 (UTC)
Received: by mail-oi1-x22c.google.com with SMTP id t62so12862162oib.12;
 Mon, 28 Nov 2022 12:23:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=dCa69YdEtMn4spqO3MAiWVwYikmJqS2nm+0NXq6y6Ck=;
 b=Yc4MyIuW2yggdapxAdcen0pJDpU/eLlafTPt80WvP733RUnpDMNqpoY5ETncKVt0EB
 N9qM7f119WFnJRV4ANVDHKZyi/F8TcWSz+jbOHn49QmLz0NgT7BIOsIri3BAfBMyAKw1
 5QC6Ov3Hh7HAowwolK8nIN+ZDe59lDcE5VTGd45Q0KYmHZbNlPPl832j2vlOAJOD8Rb9
 DvoeqKwWM8Ni+2xMFFAAhnNI8KWDPMnCdiUAv+mfkD/76psDAXrM4ecg+SNRk4Nbcb1v
 7YOtUSJggoEeiegNwhjbxFB0Uq/63+mmNZ8DH7cSn02DoMH4GHbXFjeCN2N+94Oi0DIZ
 ZCOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=dCa69YdEtMn4spqO3MAiWVwYikmJqS2nm+0NXq6y6Ck=;
 b=kTvpqR9R26AmAPHLBzZHa9kPtR62XVlSgBAKVKkpcXJOAeiTP8flAzyRjQ/jHgqMW5
 bq8TT1zFJARfnOanyIDD8rI9TNrgCD3726/zFEypCmA7W013VbtHG+84vYkRGkzLn58b
 YuN91iw7xYGMJJziWulbAONJboxod7YQOeJ/glRRTAN98IFLbQNM/SvbiFgjQwSijclI
 Yo68lEAFIs+5MICcr/frS2lv3jjcoJB9/ACSt96IhvbBDueGe7fjUR3eDLqU9pEZ329v
 esDXAWVKrPOtgKclX/jLsBFZgegfKk2DwCCPBeWJVKHyiw90DkSBRtwhX/PQqIwg9XlX
 3ang==
X-Gm-Message-State: ANoB5pkm2LBLWFC/qsPxNDTZ+tTNUHODTzFpf1y+j/q7jJppwOYNOA2v
 wv70FEgs3GyAkEmsBO6W6vR64Zrpg2+Uu/7UC+djLTA1
X-Google-Smtp-Source: AA0mqf6KOpkpp4yLsP+YGWSjXQZkjzqtYGUWdHBw22rjkoo5Mx5ec1jUOGue9xiXqjF0rVRwCM/EibS6SFlNovCm9r0=
X-Received: by 2002:a05:6808:9b8:b0:34f:97ea:14d with SMTP id
 e24-20020a05680809b800b0034f97ea014dmr15773971oig.96.1669667005543; Mon, 28
 Nov 2022 12:23:25 -0800 (PST)
MIME-Version: 1.0
References: <20221125210055.16333-1-rdunlap@infradead.org>
In-Reply-To: <20221125210055.16333-1-rdunlap@infradead.org>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Mon, 28 Nov 2022 15:23:14 -0500
Message-ID: <CADnq5_NaHGrEM++_vRH0n3XKB-ON8ked4YMaFuPBYGv=PQ0xhA@mail.gmail.com>
Subject: Re: [PATCH -next] drm/amdgpu: update docum. filename following rename
To: Randy Dunlap <rdunlap@infradead.org>
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
Cc: Jonathan Corbet <corbet@lwn.net>, Felix Kuehling <Felix.Kuehling@amd.com>,
 linux-doc@vger.kernel.org, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org, Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Applied.  Thanks!

Alex

On Fri, Nov 25, 2022 at 4:01 PM Randy Dunlap <rdunlap@infradead.org> wrote:
>
> Fix documentation build errors for amdgpu: correct the filename.
>
> Error: Cannot open file ../drivers/gpu/drm/amd/amdgpu/amdgpu_mn.c
> Error: Cannot open file ../drivers/gpu/drm/amd/amdgpu/amdgpu_mn.c
> Error: Cannot open file ../drivers/gpu/drm/amd/amdgpu/amdgpu_mn.c
>
> WARNING: kernel-doc '../scripts/kernel-doc -rst -enable-lineno -sphinx-ve=
rsion 5.3.0 -function MMU Notifier ../drivers/gpu/drm/amd/amdgpu/amdgpu_mn.=
c' failed with return code 1
> WARNING: kernel-doc '../scripts/kernel-doc -rst -enable-lineno -sphinx-ve=
rsion 5.3.0 -internal ../drivers/gpu/drm/amd/amdgpu/amdgpu_mn.c' failed wit=
h return code 2
>
> Fixes: d9483ecd327b ("drm/amdgpu: rename the files for HMM handling")
> Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
> Cc: Christian K=C3=B6nig <christian.koenig@amd.com>
> Cc: Alex Deucher <alexander.deucher@amd.com>
> Cc: Felix Kuehling <Felix.Kuehling@amd.com>
> Cc: David Airlie <airlied@gmail.com>
> Cc: Daniel Vetter <daniel@ffwll.ch>
> Cc: Jonathan Corbet <corbet@lwn.net>
> Cc: amd-gfx@lists.freedesktop.org
> Cc: dri-devel@lists.freedesktop.org
> ---
>  Documentation/gpu/amdgpu/driver-core.rst |    4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff -- a/Documentation/gpu/amdgpu/driver-core.rst b/Documentation/gpu/am=
dgpu/driver-core.rst
> --- a/Documentation/gpu/amdgpu/driver-core.rst
> +++ b/Documentation/gpu/amdgpu/driver-core.rst
> @@ -148,10 +148,10 @@ PRIME Buffer Sharing
>  MMU Notifier
>  =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>
> -.. kernel-doc:: drivers/gpu/drm/amd/amdgpu/amdgpu_mn.c
> +.. kernel-doc:: drivers/gpu/drm/amd/amdgpu/amdgpu_hmm.c
>     :doc: MMU Notifier
>
> -.. kernel-doc:: drivers/gpu/drm/amd/amdgpu/amdgpu_mn.c
> +.. kernel-doc:: drivers/gpu/drm/amd/amdgpu/amdgpu_hmm.c
>     :internal:
>
>  AMDGPU Virtual Memory
