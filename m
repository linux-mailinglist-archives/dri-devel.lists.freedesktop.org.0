Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 411FAAD4451
	for <lists+dri-devel@lfdr.de>; Tue, 10 Jun 2025 23:01:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 31BE410E2EC;
	Tue, 10 Jun 2025 21:01:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.b="O3Vg5fEQ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com
 [209.85.210.176])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9BF3E10E2EE
 for <dri-devel@lists.freedesktop.org>; Tue, 10 Jun 2025 21:01:53 +0000 (UTC)
Received: by mail-pf1-f176.google.com with SMTP id
 d2e1a72fcca58-747e41d5469so6373247b3a.3
 for <dri-devel@lists.freedesktop.org>; Tue, 10 Jun 2025 14:01:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1749589313; x=1750194113;
 darn=lists.freedesktop.org; 
 h=mime-version:user-agent:content-transfer-encoding:references
 :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
 :date:message-id:reply-to;
 bh=SLsD9FpGSfW1PBdSs7vQhWKQkn2hq58OiVhHjSXvtcM=;
 b=O3Vg5fEQ5vFcbfYtlE0xiEIqXKmJN078kNhE0Nn8UZI4Yl8J3kwNq/tjrXZrJ83HyC
 BlkZNMG6INA4lrB4nAVBTHIAWnpZdHIc9tWHpb6KNbnRo3ts1cJBq79dEcOYekj/u0hK
 N7Khb0/lzDFPxjsAsb5+d7ffxXdODisXpEIfA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1749589313; x=1750194113;
 h=mime-version:user-agent:content-transfer-encoding:references
 :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=SLsD9FpGSfW1PBdSs7vQhWKQkn2hq58OiVhHjSXvtcM=;
 b=cDUWIUitoPUjWqcqSbVFxynz2jfNhqKTpTnKXWHqfoOzVNmYfRnxB2PO5czv8lXlE1
 yWmxSJownF2y256e/23ztdtrRyr67RO1dNIhC7CXbrRLZOhmikWenZe87mkEIKKbGOLB
 t/zbEpCQYQgaYOT9lAT4GPOfqndzw6Op/PU2vZNd8R7pDcO/Rkl8H98uW6qkYVZSdVks
 8C5d2n1yWlyn4oJ/ybWlkkFz86gVbfGO+7ieBZr3bAqoL6tUNSgyl1E3mjF+mxqBrzTy
 bZVWO1iNUfp6Z2W/QMFv9n0d0qiQnmrf9jkjCZAl02cN+oxNYSxU91VIs1Dr4JspsKVP
 8Itg==
X-Forwarded-Encrypted: i=1;
 AJvYcCU/t3n03dQwsVvUdEBC9Gk/cdEFmGHnCkP0ouVoRROjz74rxwhO95RzyqdKneBqPLUJVZ5lHXm8E+0=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwdLbS2WyH1wro9j6qTFZmGPMrTPjfDYFtH2+juFZKz61M7ViLN
 x+0tr+6sg7vMddeR1QgwDV4FLhdkkmmWuYe6TeecZi61P8X6vdYfcO/XD8axoyH8Cg==
X-Gm-Gg: ASbGncuDgAypNV5vKkofGPL/o4RZCIv9eq3V6jsY8zVGW56+CSL3vgiZI6mCijkqd9v
 HPVKOHmIWmsDSC8Bd9bEaIxhjAA/ySmC4MDS7g41osNYQbL0V4Us76DjtQesb0JPKY29BjNi2cV
 hoTxvGjSeO0lCZ6dwkuQsSwC5AudUvABNin5qF6IhFmOfLhUNnA4F53gYgKO/tToP+/v1ZxhDqf
 sqXOIcT1IAZMeGT+bO6AF69hK2e5OlO2IURjIFM/vn9kdSpYI3VpcCoYFJCJh5T/XJTY3NO6/Be
 AYz0UHB/UYveur+ZNbsDQ2swWqnOXmBVJuLSTgjIQuFCDcN9w5nsdqEyf/f3TPD0vlWx96n0sS8
 JimRhFky2dryRKscg6wFoIHbayuzZrfxylGBFjecsbZiahg==
X-Google-Smtp-Source: AGHT+IESC0q36ODhiNUkgJTI1jkAx8awaTnKzSt3R1ze2tzRuhK+ez9tPqEEjz5tFZnXWt4jMzFvyA==
X-Received: by 2002:a05:6a20:244a:b0:204:4573:d854 with SMTP id
 adf61e73a8af0-21f865ff8e9mr1361046637.9.1749589313137; 
 Tue, 10 Jun 2025 14:01:53 -0700 (PDT)
Received: from justonli3.c.googlers.com
 (11.103.168.34.bc.googleusercontent.com. [34.168.103.11])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-7482b0ea2b2sm7842756b3a.161.2025.06.10.14.01.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 10 Jun 2025 14:01:52 -0700 (PDT)
Message-ID: <cc0c79742348a5dd7be0fb21b81627b16e3e55cf.camel@chromium.org>
Subject: Re: [PATCH v3 1/2] gpu/trace: make TRACE_GPU_MEM configurable
From: Juston Li <justonli@chromium.org>
To: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>, 
 intel-xe@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Cc: Tvrtko Ursulin <tursulin@ursulin.net>, Yiwei Zhang <zzyiwei@google.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, Lucas De Marchi
 <lucas.demarchi@intel.com>
Date: Tue, 10 Jun 2025 14:01:52 -0700
In-Reply-To: <7e8a86d4-447f-4e50-a745-0f6f5771d1fa@igalia.com>
References: <20250603225123.2535767-1-justonli@chromium.org>
 <7e8a86d4-447f-4e50-a745-0f6f5771d1fa@igalia.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.55.3-1 
MIME-Version: 1.0
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

On Mon, 2025-06-09 at 13:36 +0100, Tvrtko Ursulin wrote:
>=20
> On 03/06/2025 23:50, Juston Li wrote:
> > v3:
> > =C2=A0 - Patch introduced to replace per-driver config (Lucas)
> >=20
> > Signed-off-by: Juston Li <justonli@chromium.org>
> > ---
> > =C2=A0 drivers/gpu/trace/Kconfig | 11 ++++++++++-
> > =C2=A0 1 file changed, 10 insertions(+), 1 deletion(-)
> >=20
> > diff --git a/drivers/gpu/trace/Kconfig b/drivers/gpu/trace/Kconfig
> > index c24e9edd022e6..cd3d19c4a201c 100644
> > --- a/drivers/gpu/trace/Kconfig
> > +++ b/drivers/gpu/trace/Kconfig
> > @@ -1,4 +1,13 @@
> > =C2=A0 # SPDX-License-Identifier: GPL-2.0-only
> > =C2=A0=20
> > =C2=A0 config TRACE_GPU_MEM
> > -	bool
> > +	bool "Enable GPU memory usage tracepoints"
> > +	default n
> > +	help
> > +	=C2=A0 Choose this option to enable tracepoints for tracking
> > +	=C2=A0 global and per-process GPU memory usage. Intended for
> > +	=C2=A0 performance profiling and required for Android.
> > +
> > +	=C2=A0 Tracepoint availability varies by GPU driver.
> > +
> > +	=C2=A0 If in doubt, say "N".
>=20
> Maybe it is a bit sub-optimal that the item shows up under the top
> level=20
> drivers group. Which is already pretty busy. Maybe on top something
> like:
>=20
> diff --git a/drivers/Kconfig b/drivers/Kconfig
> index 7c556c5ac4fd..c5edbd2288a1 100644
> --- a/drivers/Kconfig
> +++ b/drivers/Kconfig
> @@ -209,8 +209,6 @@ source "drivers/thunderbolt/Kconfig"
>=20
> =C2=A0 source "drivers/android/Kconfig"
>=20
> -source "drivers/gpu/trace/Kconfig"
> -
> =C2=A0 source "drivers/nvdimm/Kconfig"
>=20
> =C2=A0 source "drivers/dax/Kconfig"
> diff --git a/drivers/video/Kconfig b/drivers/video/Kconfig
> index 5df981920a94..96adceab2df0 100644
> --- a/drivers/video/Kconfig
> +++ b/drivers/video/Kconfig
> @@ -70,5 +70,6 @@ if FB_CORE || SGI_NEWPORT_CONSOLE
>=20
> =C2=A0 endif
>=20
> +source "drivers/gpu/trace/Kconfig"
>=20
> =C2=A0 endmenu
>=20
>=20
> To move it under Device Drivers -> Graphics support? Give or take the
> exact positioning.

SGTM, thanks!

Juston

> Regards,
>=20
> Tvrtko
