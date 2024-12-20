Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C02B9F8EFC
	for <lists+dri-devel@lfdr.de>; Fri, 20 Dec 2024 10:29:26 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7CEAD10EF42;
	Fri, 20 Dec 2024 09:29:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="OHHutufu";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1D83710EF42
 for <dri-devel@lists.freedesktop.org>; Fri, 20 Dec 2024 09:29:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1734686952;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=7NVspW2N9/nnEycXBEp5P9ilFA7sn7OJXpabrG1aUSk=;
 b=OHHutufuRmJY2yZb4hPXG/TKtP2NASbMgL/9Cx3dxVuWAyZ6yMMVGSXXRuDNDJPGGJ8Sdm
 81FkxjW7RWaqJHkOZ5r7iR549dx7AB9ORv0vt9ycF26lnczP3ypIYj0ZC7vdsn+vNODKe9
 jof8Re9J9q5lOEwfReM5h8LXPFTtrKk=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-570-NkeyIw5-OaKA-_Hmb0B1Rg-1; Fri, 20 Dec 2024 04:29:10 -0500
X-MC-Unique: NkeyIw5-OaKA-_Hmb0B1Rg-1
X-Mimecast-MFC-AGG-ID: NkeyIw5-OaKA-_Hmb0B1Rg
Received: by mail-wm1-f69.google.com with SMTP id
 5b1f17b1804b1-43631d8d9c7so9576545e9.1
 for <dri-devel@lists.freedesktop.org>; Fri, 20 Dec 2024 01:29:10 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1734686949; x=1735291749;
 h=mime-version:user-agent:content-transfer-encoding:references
 :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=7NVspW2N9/nnEycXBEp5P9ilFA7sn7OJXpabrG1aUSk=;
 b=hs5lCzBD9bFVIJ6ZiBZ6WtQDkpWdeldTmuRymnqgb6sEBPt/09WXna4cwkTeeekZXg
 GMlHh00Agk0duMtcJPaULPF6+UMhs1S8Wo2d+4t/COYiCuRcQ3zf7oF2KMVRU/PEH+tj
 v34DOjdDsJHdOpzM9epHiP9039OMasd5H8ywn0OZeRCZbRpcGO5rXVzHdGJj76T9DYh2
 EnQET6wDpbLresZwTS/ENtcwyeIBeECQ3X8t+kh9uQUjqpQE9lMMv1rghQ67L4LKxRrg
 mZ/B3e6ZahYUo9G+pS5mc+SXWbG3to03HovWqz0KivQ9cQxnyBIstitwdLzNUld01+Rr
 3X+g==
X-Forwarded-Encrypted: i=1;
 AJvYcCW9p8K2PQb5CAZU+7o1RekfanBz3ixIN13/zARo4qbzOIsXD2uYp00XUpw/cC/UB/Q4PVkPNjnPBQA=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YweJmtdIDwi7iWsXpj4Ihnc8jDEGqw4Dic1cZzUyUa4pL6hXRjZ
 cpR+jS/OyYiOxE3ffQkAAdk0US7NPdXcUwt42/MRjyK8N0aTVQV8c3qJvVOTQy+97+hFcm/b6lx
 8jlSKBS0ETN7y4/r/MZZZ783+yRTqdr7MsWX5ObvpV/M25jJsyIFcOgc/d7QMzkJ9iw==
X-Gm-Gg: ASbGnct07N9XRiTLZjuQjheDKRsdeSzjB+5zcNCtmTssa/aHts18L+Gjhusz5Hr0Zss
 CuCrzlv6GQ4zV8Pe2LhK/5C0b+cQVxnJY16FzscrJrgmno5ptpCUnIrxjhugxVR4nvJ3N3l4Zw/
 XpH9ageE6AaIyWuJaqJZEdlow0puNZ3OFO9JJF6rmEaEob0EMAQ24DnM6tUDbDtNJFOLvEH64Wy
 FwHXmha+EUjTKk4kSvpA7H/PlyuUW/0wF3DVreDroUeY13FabuwVhQguTCKUu8QRLrdh1CnZjwy
 WI43leaP2hynUKAvyfur1ejHsKyV8z0=
X-Received: by 2002:a05:600c:3596:b0:434:f1bd:1e40 with SMTP id
 5b1f17b1804b1-436697f917fmr16506275e9.6.1734686949623; 
 Fri, 20 Dec 2024 01:29:09 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGAgRWuaAvDXWDRZqcewAmpb5XTckPo7Go/SgGSQnqpV8nhLUAtPoayxjas2Nj3NQZO3WPEOA==
X-Received: by 2002:a05:600c:3596:b0:434:f1bd:1e40 with SMTP id
 5b1f17b1804b1-436697f917fmr16504925e9.6.1734686947873; 
 Fri, 20 Dec 2024 01:29:07 -0800 (PST)
Received: from ?IPv6:2001:16b8:3db8:2e00:4b6c:c773:a3e0:8035?
 ([2001:16b8:3db8:2e00:4b6c:c773:a3e0:8035])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-38a1c84722dsm3590722f8f.53.2024.12.20.01.29.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 20 Dec 2024 01:29:07 -0800 (PST)
Message-ID: <980135e6c31a88c41671eb01002b65ce439cc38c.camel@redhat.com>
Subject: Re: [PATCH] drm/sched: Separate drm_sched_fini() driver checklist
From: Philipp Stanner <pstanner@redhat.com>
To: Bagas Sanjaya <bagasdotme@gmail.com>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux DRI Development
 <dri-devel@lists.freedesktop.org>
Cc: Luben Tuikov <ltuikov89@gmail.com>, Matthew Brost
 <matthew.brost@intel.com>,  Danilo Krummrich <dakr@kernel.org>, Maarten
 Lankhorst <maarten.lankhorst@linux.intel.com>,  Maxime Ripard
 <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, David Airlie
 <airlied@gmail.com>,  Simona Vetter <simona@ffwll.ch>, Christian
 =?ISO-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>, Stephen Rothwell
 <sfr@canb.auug.org.au>
Date: Fri, 20 Dec 2024 10:29:06 +0100
In-Reply-To: <20241217034915.62594-1-bagasdotme@gmail.com>
References: <20241217034915.62594-1-bagasdotme@gmail.com>
User-Agent: Evolution 3.52.4 (3.52.4-2.fc40)
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: qnP6XnqBsf7Ef91a29ZAQgreN0kTV1QrCMPRIWT2A9E_1734686950
X-Mimecast-Originator: redhat.com
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

On Tue, 2024-12-17 at 10:49 +0700, Bagas Sanjaya wrote:
> Commit baf4afc5831438 ("drm/sched: Improve teardown documentation")
> documents drm_sched_fini() with a post-function call checklist for
> drivers. The checklist triggers htmldocs warning (but renders
> correctly
> in htmldocs output):
>=20
> Documentation/gpu/drm-mm:571:
> ./drivers/gpu/drm/scheduler/sched_main.c:1359: ERROR: Unexpected
> indentation.
>=20
> Separate the checklist from preceding paragraph by a blank line to
> fix
> the warning. While at it, also end the aforementioned paragraph by a
> colon.
>=20
> Fixes: baf4afc58314 ("drm/sched: Improve teardown documentation")
> Reported-by: Stephen Rothwell <sfr@canb.auug.org.au>
> Closes:
> https://lore.kernel.org/r/20241108175655.6d3fcfb7@canb.auug.org.au/
> Signed-off-by: Bagas Sanjaya <bagasdotme@gmail.com>

Applied (with some adjustments to commit message), thank you

P.

> ---
> =C2=A0drivers/gpu/drm/scheduler/sched_main.c | 3 ++-
> =C2=A01 file changed, 2 insertions(+), 1 deletion(-)
>=20
> diff --git a/drivers/gpu/drm/scheduler/sched_main.c
> b/drivers/gpu/drm/scheduler/sched_main.c
> index 7ce25281c74ce5..57da84908752c6 100644
> --- a/drivers/gpu/drm/scheduler/sched_main.c
> +++ b/drivers/gpu/drm/scheduler/sched_main.c
> @@ -1355,7 +1355,8 @@ EXPORT_SYMBOL(drm_sched_init);
> =C2=A0 * drm_sched_backend_ops.run_job(). Consequently,
> drm_sched_backend_ops.free_job()
> =C2=A0 * will not be called for all jobs still in
> drm_gpu_scheduler.pending_list.
> =C2=A0 * There is no solution for this currently. Thus, it is up to the
> driver to make
> - * sure that
> + * sure that:
> + *
> =C2=A0 *=C2=A0 a) drm_sched_fini() is only called after for all submitted=
 jobs
> =C2=A0 *=C2=A0=C2=A0=C2=A0=C2=A0 drm_sched_backend_ops.free_job() has bee=
n called or that
> =C2=A0 *=C2=A0 b) the jobs for which drm_sched_backend_ops.free_job() has=
 not
> been called
>=20
> base-commit: d172ea67dbeec5c90f72752c91d202d5718e3754

