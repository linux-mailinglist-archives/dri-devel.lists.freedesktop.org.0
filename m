Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AEBD0AC1A55
	for <lists+dri-devel@lfdr.de>; Fri, 23 May 2025 05:10:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AD9F010E1B8;
	Fri, 23 May 2025 03:10:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="erQz/5eC";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com
 [209.85.210.169])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EBEE410E1B8
 for <dri-devel@lists.freedesktop.org>; Fri, 23 May 2025 03:10:47 +0000 (UTC)
Received: by mail-pf1-f169.google.com with SMTP id
 d2e1a72fcca58-7376e311086so10083773b3a.3
 for <dri-devel@lists.freedesktop.org>; Thu, 22 May 2025 20:10:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1747969847; x=1748574647; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=IQ+DvPxjKWEL7WwSCKI9gbi6R0NoaJVuMVX8JBqcEaw=;
 b=erQz/5eCFVvubksViovTcUhn0JZ1ufFbMpah2u9WXGtF9QOohUCdOBmX9OP2SUT1e5
 XIqi1Ti5wgKW5eaLCViDqHrm3g410khbn/G/HyircSHt0PnP859d+8Xww8+wo/mV/3Ws
 Dtc6vSXl2V7AaMYGcy3p7RyN3WtdDkA9V27SI5q6PR0/8XjTi8X9yRMEf8+pXOpKcDVW
 ZRQ/HnGEwDmsk3eYlRJX/lde7nczRQKdobSm7QMxAlWr5QB2+XoNpYAJXrmYaIYgNf4H
 aYi/kYeue252HSjiRnVLlY5cMEQ5Wt0lOL8WL71TOkEI12ejKKUvqQmwBBCvFzJyFWEO
 HLgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1747969847; x=1748574647;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=IQ+DvPxjKWEL7WwSCKI9gbi6R0NoaJVuMVX8JBqcEaw=;
 b=gzsFPgkJbcGNCf5WXTCjs7coxd1VEuJSK4MJyrseBFr22mbmY/mYRiM1+tCn+ozUBp
 grn27BmPGJodT0tZm8vW4nfJr37Nb6G3RPnPaoSOX0/hf7YOrGimEGQo9tg3TWwY7P6n
 ufOCfSMSq+Lj7VBQyMsS8nQsui8D0qypJZIidXKeBj6apqaj0/5g6Ah1aw+qLa2rKnI0
 wvke+PH7nyBVDvLa+6B39OHqWfEX8KqGo0+dIKgyGVEyul0ybw8I8DkntAEpc4GH3sHn
 /gv1b+fU64RHwKnfsZy1tJJR8OWTFLBicE7DjdWjJNPCk3KZdQIoklr0sBZVG9lIfPwi
 Je7w==
X-Gm-Message-State: AOJu0YyLZWZLomI+cP3frwy+mCIx64vtPSL2zRjhCttmTfwmMNBnitFh
 V+N9nxzTJ5C/hMfODV4VOOqlblEfAOEPwxZ9rZloZCxInStn9yqGfFFe
X-Gm-Gg: ASbGncuYt0AP33jduSUadZ2In/D+HsFDdKu+caKyFVLmGVCCavodrb8RHwAG3F7gKtg
 6akmeKFuKT5U8kSzqHLzV98v9H3Jq6uedAnZh0YBKmoaJKAqH6gSAjrPB4P+0XKUdcDQnnM0yUm
 nUvaeYiYNUNnpuc3w3p51xsL6vgj2JMTyP06s7gL3vHzNWjI4bMlsHKj+xqvZMBrBepyQD0S5uX
 IzuzMjt8ZTauSUtYaPCM/RAY9tOg2e3FjERt0eRLOr795D9CIoLNpDUIqH2XXqHwBEN+3IyjRnM
 eJgKY5Ck49A62re+1ORMjIKdzbYz1V2CD7nc4yONCjCtMXioI7JZPRTPe3HSKw==
X-Google-Smtp-Source: AGHT+IHakgt4Oo144LFlK0CdrZV/uiDMprRX9FVu7JhxaNdV3cktYYQ5oHfnfFpCIqZpXDB87tP8lw==
X-Received: by 2002:a05:6a20:7d9a:b0:215:a9d5:1a46 with SMTP id
 adf61e73a8af0-21879eda720mr1812330637.12.1747969847013; 
 Thu, 22 May 2025 20:10:47 -0700 (PDT)
Received: from archie.me ([103.124.138.155]) by smtp.gmail.com with ESMTPSA id
 41be03b00d2f7-b26eb0a89edsm11828150a12.67.2025.05.22.20.10.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 22 May 2025 20:10:46 -0700 (PDT)
Received: by archie.me (Postfix, from userid 1000)
 id 6EDF642439C3; Fri, 23 May 2025 10:10:43 +0700 (WIB)
Date: Fri, 23 May 2025 10:10:42 +0700
From: Bagas Sanjaya <bagasdotme@gmail.com>
To: Abdulrasaq Lawani <abdulrasaqolawani@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Jonathan Corbet <corbet@lwn.net>
Cc: dri-devel@lists.freedesktop.org, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH] drm: add overview diagram for drm stack
Message-ID: <aC_nMs-hAyd8cpDJ@archie.me>
References: <20250522-drm-doc-updates-v1-1-d1efd54740bd@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="fFwlWSH1Re80NIG0"
Content-Disposition: inline
In-Reply-To: <20250522-drm-doc-updates-v1-1-d1efd54740bd@gmail.com>
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


--fFwlWSH1Re80NIG0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, May 22, 2025 at 06:20:27PM -0400, Abdulrasaq Lawani wrote:
> -[Insert diagram of typical DRM stack here]
> +Overview of the Linux DRM Architecture
> +-----------------------------------------------
> ++-----------------------------+
> +|     User-space Apps         |
> +| (Games, Browsers, ML, etc.) |
> ++-----------------------------+
> +              |
> +              v
> ++---------------------------------------+
> +|    Graphics APIs   |   Compute APIs   |
> +|  (OpenGL, Vulkan)  |  (OpenCL, CUDA)  |
> ++---------------------------------------+
> +          |                   |
> +          v                   v
> ++---------------------+  +-----------------------+
> +|  User-space Driver  |  |    Compute Runtime    |
> +|  (Mesa, AMD/NVIDIA) |  |  (OpenCL, CUDA, ROCm) |
> ++---------------------+  +-----------------------+
> +          |                   |
> +          +--------+----------+
> +                   |
> +                   v
> +        +-----------------------+
> +        |   libdrm (DRM API)    |
> +        +-----------------------+
> +                   |
> +                   v
> ++-------------------------------------------+
> +|     Kernel DRM/KMS Driver (i915, amdgpu,  |
> +|     nouveau, etc.)                        |
> ++-------------------------------------------+
> +        |                       |
> +        v                       v
> ++----------------+     +-------------------+
> +| GPU Display HW |     | GPU Compute Units |
> ++----------------+     +-------------------+
> +

I get multiple Sphinx indentation warnings and errors:

Documentation/gpu/introduction.rst:23: ERROR: Unexpected indentation. [docu=
tils]
Documentation/gpu/introduction.rst:22: WARNING: Block quote ends without a =
blank line; unexpected unindent. [docutils]
Documentation/gpu/introduction.rst:23: WARNING: Blank line required after t=
able. [docutils]
Documentation/gpu/introduction.rst:24: WARNING: Line block ends without a b=
lank line. [docutils]
Documentation/gpu/introduction.rst:25: WARNING: Block quote ends without a =
blank line; unexpected unindent. [docutils]
Documentation/gpu/introduction.rst:29: ERROR: Unexpected indentation. [docu=
tils]
Documentation/gpu/introduction.rst:28: WARNING: Block quote ends without a =
blank line; unexpected unindent. [docutils]
Documentation/gpu/introduction.rst:29: WARNING: Blank line required after t=
able. [docutils]
Documentation/gpu/introduction.rst:29: WARNING: Inline substitution_referen=
ce start-string without end-string. [docutils]
Documentation/gpu/introduction.rst:30: WARNING: Line block ends without a b=
lank line. [docutils]
Documentation/gpu/introduction.rst:31: WARNING: Block quote ends without a =
blank line; unexpected unindent. [docutils]
Documentation/gpu/introduction.rst:35: ERROR: Unexpected indentation. [docu=
tils]
Documentation/gpu/introduction.rst:35: WARNING: Inline substitution_referen=
ce start-string without end-string. [docutils]
Documentation/gpu/introduction.rst:36: WARNING: Line block ends without a b=
lank line. [docutils]
Documentation/gpu/introduction.rst:37: ERROR: Unexpected indentation. [docu=
tils]
Documentation/gpu/introduction.rst:37: WARNING: Blank line required after t=
able. [docutils]
Documentation/gpu/introduction.rst:38: WARNING: Line block ends without a b=
lank line. [docutils]
Documentation/gpu/introduction.rst:39: WARNING: Block quote ends without a =
blank line; unexpected unindent. [docutils]
Documentation/gpu/introduction.rst:42: ERROR: Unexpected indentation. [docu=
tils]
Documentation/gpu/introduction.rst:42: WARNING: Blank line required after t=
able. [docutils]
Documentation/gpu/introduction.rst:43: WARNING: Line block ends without a b=
lank line. [docutils]
Documentation/gpu/introduction.rst:44: WARNING: Block quote ends without a =
blank line; unexpected unindent. [docutils]
Documentation/gpu/introduction.rst:48: ERROR: Unexpected indentation. [docu=
tils]
Documentation/gpu/introduction.rst:48: WARNING: Blank line required after t=
able. [docutils]
Documentation/gpu/introduction.rst:48: WARNING: Inline substitution_referen=
ce start-string without end-string. [docutils]
Documentation/gpu/introduction.rst:49: WARNING: Line block ends without a b=
lank line. [docutils]
Documentation/gpu/introduction.rst:50: WARNING: Block quote ends without a =
blank line; unexpected unindent. [docutils]

Please wrap the diagram above in literal code block.

Thanks.

--=20
An old man doll... just what I always wanted! - Clara

--fFwlWSH1Re80NIG0
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQSSYQ6Cy7oyFNCHrUH2uYlJVVFOowUCaC/nLwAKCRD2uYlJVVFO
o0YoAPwP/GehTZZ/E4/JcMOdTC7wObkIe1OLa0lGTzgAjWND6AEApJP3MFdq+y9+
RaJncUrLjmh4hjOHSxP5jQUoYmWL6wY=
=++Ke
-----END PGP SIGNATURE-----

--fFwlWSH1Re80NIG0--
