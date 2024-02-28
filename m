Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C49186BBFF
	for <lists+dri-devel@lfdr.de>; Thu, 29 Feb 2024 00:12:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C280910E278;
	Wed, 28 Feb 2024 23:12:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="Od3C0iru";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 34A3310E278
 for <dri-devel@lists.freedesktop.org>; Wed, 28 Feb 2024 23:12:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1709161932;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=M2IAhhTxkG9uPUwm7NpsFl2OrlljKctFXF++HriPSyQ=;
 b=Od3C0iruFK3tTPA6fhrF0qnCKeXj3MaT8W8G3E+5lgIj8DWhSZ/n0YfbZhILaJjWFXIIrC
 9SWIYU46pPjIIUIoukWmrVFScwYyox4LxRb1tbjIzNQtNA9W5ruD7cSBBS/Izr5Ph+OEWh
 oOWsR9KXk1QlDCepH/n0Ktr2KwgqLHU=
Received: from mail-oo1-f69.google.com (mail-oo1-f69.google.com
 [209.85.161.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-394-2XjmrENcOiKjXSkm17WWTw-1; Wed, 28 Feb 2024 18:12:10 -0500
X-MC-Unique: 2XjmrENcOiKjXSkm17WWTw-1
Received: by mail-oo1-f69.google.com with SMTP id
 006d021491bc7-5a03e749ecfso285833eaf.0
 for <dri-devel@lists.freedesktop.org>; Wed, 28 Feb 2024 15:12:10 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1709161930; x=1709766730;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=M2IAhhTxkG9uPUwm7NpsFl2OrlljKctFXF++HriPSyQ=;
 b=f+N+1rgmQ2KaSzbVCqQt35z6WXzdU7HsVsSJtvFGmysQfDahyfkvLVJTL9ly5TphtR
 IcH9vB9kawZaihOIvJv2ArzM7Md//9D/BJJNS7MJrN/noOI1ufGKx9a9Sl0ejuE0OjGY
 sKkE/0jnGbuqWSXUa4QYXLJs9dNMiRWMEcMVhCvhIbTR5CCnevFa6xZr5Z5fLBjZGyiF
 uihH+7K7d0tUxBVE1z1GJIs0G8phIY3u/QJ01v7nei5E6In3p0VPfnjaBeUW8IWqaLz0
 9yrDMXc+9AEAqlap7JVOLc8zjNbbIjBZ+V9TSqY0qYGvR+vmNu4dg/6DRxVBvg5DH78G
 GvTA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUSd8UBKz7qp7m15ZLszQ+QHs5SS7s4Prl3HdS022tcaHqctLAG6aD0FOetl1Xzegr9Ye0hj4QgLVE2HA+Duj4l47tuvD/4c9+FDiMwNkxE
X-Gm-Message-State: AOJu0Yw/ld1F2YUIVj1vFL+W+p/zMKd9rdhFDKc6n5LNn9PlVQAHdpoX
 RqqtRlsO56zraI+p+OGU4FdNO9RilN52jrQ0FRd7waaniO5bdcqLmKNtxQa7iOLMd0bI4n+E2mF
 yWKJxzFD32MjKf4bl1xRgo6E82bYrPwR08i71VvazDvgxnMzxaXifkiZ+izNlPP/c0luMfa8yFs
 zgr/7qhzG/wHoPJxSRb/+vTrvrX5cBRDg0VcCjkGrG
X-Received: by 2002:a4a:3447:0:b0:59f:fc2d:8179 with SMTP id
 n7-20020a4a3447000000b0059ffc2d8179mr493596oof.9.1709161929916; 
 Wed, 28 Feb 2024 15:12:09 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFntvEPbQKWTGSDsAEHdmd9g3EM74H/QdrIiJ47zPCDBlTr2DD7PBA+alIV24Pc/h5p+S7aH/zbiYAQw5HARoE=
X-Received: by 2002:a4a:3447:0:b0:59f:fc2d:8179 with SMTP id
 n7-20020a4a3447000000b0059ffc2d8179mr493578oof.9.1709161929669; Wed, 28 Feb
 2024 15:12:09 -0800 (PST)
MIME-Version: 1.0
References: <20240228-tidss-dev-err-probe-v1-1-5482252326d3@redhat.com>
 <8734tcnt7y.fsf@minerva.mail-host-address-is-not-set>
In-Reply-To: <8734tcnt7y.fsf@minerva.mail-host-address-is-not-set>
From: Enric Balletbo i Serra <eballetb@redhat.com>
Date: Thu, 29 Feb 2024 00:11:59 +0100
Message-ID: <CALE0LRvUMQmMv57UQNncrDFZu=ucmOuSXZNCaJ-10VTFjvenvQ@mail.gmail.com>
Subject: Re: [PATCH] drm/tidss: Use dev_err_probe() over dev_dbg() when
 failing to probe the port
To: Javier Martinez Canillas <javierm@redhat.com>
Cc: Andrew Halaney <ahalaney@redhat.com>, Jyri Sarha <jyri.sarha@iki.fi>, 
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
X-Mimecast-Spam-Score: 0
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

Hello Andrew,

Many thanks for proposing this.

On Wed, Feb 28, 2024 at 11:02=E2=80=AFPM Javier Martinez Canillas
<javierm@redhat.com> wrote:
>
> Andrew Halaney <ahalaney@redhat.com> writes:
>
> Hello Andrew,
>
> > This gets logged out to /sys/kernel/debug/devices_deferred in the
> > -EPROBE_DEFER case and as an error otherwise. The message here provides
> > useful information to the user when troubleshooting why their display i=
s
> > not working in either case, so let's make it output appropriately.
> >
> > Signed-off-by: Andrew Halaney <ahalaney@redhat.com>
> > ---
> > There's definitely more spots in this driver that could be upgraded fro=
m
> > dev_dbg() to something more appropriate, but this one burned me today s=
o
> > I thought I'd send a patch for it specifically before I forget.
> > ---
>
> Makes sense to me and I agree that's useful to have that information ther=
e.
>
> Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>
>

Logging in  /sys/kernel/debug/devices_deferred was useful for me, so

Tested-by: Enric Balletbo i Serra <eballetbo@kernel.org>

Cheers,
  Enric

> --
> Best regards,
>
> Javier Martinez Canillas
> Core Platforms
> Red Hat
>

