Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 481FD8FBEEC
	for <lists+dri-devel@lfdr.de>; Wed,  5 Jun 2024 00:29:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 939FE10E0CA;
	Tue,  4 Jun 2024 22:29:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="aHb2KoWr";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com
 [209.85.218.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2AF3510E0CA;
 Tue,  4 Jun 2024 22:29:17 +0000 (UTC)
Received: by mail-ej1-f45.google.com with SMTP id
 a640c23a62f3a-a6269885572so46278966b.1; 
 Tue, 04 Jun 2024 15:29:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1717540155; x=1718144955; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=GqM2hxS4FR6EOD/ApBIrT8QZc14gXJNY9tub2xlKA5E=;
 b=aHb2KoWrE8ZpGsGa2H/Z1z2qmZVhsUig+FOqXGQ3ujKU1I33lSoOq2K3QrYdmBb9zc
 T9xkT2rej8s8COyPdU3PqLfRjC9ueX/1ll66wxBMihYUIphXAjmGT5SKOpqf6LhQiItc
 R+q9m4zrQ9zc22QsemwUZStHkvUEnvNZ7p0ABgoykrPX8wtOQXynnahqYOachuU8Bgjs
 3pBGXqGeGBu9cPtBiftZVtO1yRfTkLr0ztv1xHaB6+/AZmY5gHW/qsroBOoXqLrtWdx3
 72/Q6ZUJFBYd99l9Y7znFcsbTaf9qg3HKTpzlJoMc5SG3Xbr33cqhLWgg4E8IDJiA1C9
 59oA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1717540155; x=1718144955;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=GqM2hxS4FR6EOD/ApBIrT8QZc14gXJNY9tub2xlKA5E=;
 b=BDjZaI++9xCOqIw/oD2RFApD37t+HO3HKjgy1PXZz9VfXgJm5cRVtcsuM9P3w5nz5B
 Z7HaV2wN0Zw6hFuSqJQ4e6uZuqkKCRPcFSLp67GiIxeFJC+ppO8MpgGyaAEN6drtyBY6
 5NPsO8swng/jQ7joWsqz3AJxcHuEOJSHDMpHYgx5BkVn5gQXDZOKEBKuFLJGXsSnsHaT
 ulwz2CZZiZ7fHUui4VnIw+554I8iJbqQCF0S2D4QvwASSS6ITHhUKd7rIdVvQZ0Ufoeq
 siB0LzLUkY1W2eq4UWpodVty24W0iwkh4mUvp9uvJho8s4hCPqK4ajUONxEpzYCzWdkU
 JRpg==
X-Forwarded-Encrypted: i=1;
 AJvYcCXlFO1jJy942QrtEjEN8pbz78plZAp6KEHQYR5GT+rqRUTIbS0Ckrg4cX5ttTy+ML4e9/YeEmzdXu/qpNtSvrqhYpj3Yhnl/dIirseIsEcx
X-Gm-Message-State: AOJu0YyMEtywoC3xOAzAb2phb5jxSymyHBqEJCzyG46V3BxHoZ6yylaM
 2smphZl9XjMmRMDfY86iGKdepMs+mGBIU55q6/1kqNgNHFXQG750K6Fez1z59jxumIhVHCvgiGW
 OSbOZBZIL8g8Ay6e2a5FsFZAq8lM=
X-Google-Smtp-Source: AGHT+IHIe8oojZHH3BSc04qDCY6rnCKtmhfue3eiADcCFUkd8n3J7o617bnUH1b9t9siCp6QOzcAxh569eqIcgKG92w=
X-Received: by 2002:a17:907:8f0a:b0:a68:f43c:57dd with SMTP id
 a640c23a62f3a-a699d63f681mr58766666b.23.1717540154999; Tue, 04 Jun 2024
 15:29:14 -0700 (PDT)
MIME-Version: 1.0
References: <20240602190959.2981-1-thomas.hellstrom@linux.intel.com>
In-Reply-To: <20240602190959.2981-1-thomas.hellstrom@linux.intel.com>
From: Dave Airlie <airlied@gmail.com>
Date: Wed, 5 Jun 2024 08:29:03 +1000
Message-ID: <CAPM=9ty=EMpFTumUCeAcHzn7j2Trs6r3_46jEvo_-CzPmAXcyg@mail.gmail.com>
Subject: Re: [PATCH v2] MAINTAINERS: Update Xe driver maintainers
To: =?UTF-8?Q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
Cc: intel-xe@lists.freedesktop.org, Daniel Vetter <daniel@ffwll.ch>, 
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
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

Acked-by: Dave Airlie <airlied@redhat.com>

Please merge through xe-fixes

Dave.

On Mon, 3 Jun 2024 at 05:13, Thomas Hellstr=C3=B6m
<thomas.hellstrom@linux.intel.com> wrote:
>
> Add Rodrigo Vivi as an Xe driver maintainer.
>
> v2:
> - Cc also Lucas De Marchi (Rodrigo vivi)
> - Remove a blank line in commit the commit message (Lucas De Marchi)
>
> Cc: David Airlie <airlied@gmail.com>
> Cc: Daniel Vetter <daniel@ffwll.ch>
> Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
> Cc: Lucas De Marchi <lucas.demarchi@intel.com>
> Cc: dri-devel@lists.freedesktop.org
> Cc: linux-kernel@vger.kernel.org
> Signed-off-by: Thomas Hellstr=C3=B6m <thomas.hellstrom@linux.intel.com>
> Acked-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
> Acked-by: Lucas De Marchi <lucas.demarchi@intel.com>
> ---
>  MAINTAINERS | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 572be0546e21..8f9982c99257 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -11037,6 +11037,7 @@ F:      include/uapi/drm/i915_drm.h
>  INTEL DRM XE DRIVER (Lunar Lake and newer)
>  M:     Lucas De Marchi <lucas.demarchi@intel.com>
>  M:     Thomas Hellstr=C3=B6m <thomas.hellstrom@linux.intel.com>
> +M:     Rodrigo Vivi <rodrigo.vivi@intel.com>
>  L:     intel-xe@lists.freedesktop.org
>  S:     Supported
>  W:     https://drm.pages.freedesktop.org/intel-docs/
> --
> 2.44.0
>
