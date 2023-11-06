Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 78E637E196E
	for <lists+dri-devel@lfdr.de>; Mon,  6 Nov 2023 05:46:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2F2D510E139;
	Mon,  6 Nov 2023 04:46:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x433.google.com (mail-pf1-x433.google.com
 [IPv6:2607:f8b0:4864:20::433])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BF6BB10E139
 for <dri-devel@lists.freedesktop.org>; Mon,  6 Nov 2023 04:46:14 +0000 (UTC)
Received: by mail-pf1-x433.google.com with SMTP id
 d2e1a72fcca58-6bd32d1a040so4390866b3a.3
 for <dri-devel@lists.freedesktop.org>; Sun, 05 Nov 2023 20:46:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1699245974; x=1699850774; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=32YDJ9UCxSqwPmBexBFw6Ms3U4O90iERTciee1S7uFw=;
 b=VNsXVQ7ehdCowdS9JIr2FsSjjBug4p4LMJjo59K0jHY4nLq1D1EyniCLJ9QM2/J1rR
 sLqgMl2yl7HbGmDssC7viyBOvWJYO8htWG4MmaB5bvogs9GvHZ516K1Cqbz/xQjN1Wy3
 5vLUR1/TzAb8nE1Z09hqXps2FNaKHmjtPy2qgPOEn8C9zDdE3tkIgA2A6Rc67FQ7J7Kk
 zoep9+uNhmQXaOB64TmoqxDwTTm23Peow3kP2Yp5D5UusY6N13UH1dzvsGrxdWZg4PWB
 2QvQGSHkZ+fP3Pw9E9tXYrL4GN9nKhqFiLlKTwYderpJIye1VYxhNe2NwOW33YUEfGK2
 Zy+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1699245974; x=1699850774;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=32YDJ9UCxSqwPmBexBFw6Ms3U4O90iERTciee1S7uFw=;
 b=XK70rmspDK6iURV4mw+TzCWTu3ETS472I/oBuoyMwpET94Jz+JKycJWBZLlhEOxG8O
 +T5eAmP3K0cpIy8lbB34BpQ8B2RQGQuosGMpQS3rs46eDZMWppph01/dqyQC61haAT4A
 6iDtln279+dYFnk5gWg+WfdgDdnHUwvZ03Ik4Uo+m+s5KGZhi9V4LncoVgU99tQnzo5c
 xYM9vqaXg0z+PwiKM2g+aNI00dXf6CLIVlicSbOl2zE7nSuqeRPpWE6ekRwPe3sysyNu
 RPOayJ0P1JKG4gEx889GSQ9QEYK6ngigVU+Qo4rZZHiaJVokA4YYPyvnxU7yDzF3G30N
 yPwQ==
X-Gm-Message-State: AOJu0YxMPwHYzkx8Z4ZLJth6cJSmxUNtMLXwq7TRGPjrK3chRn0xok7p
 gbiRRdATGEq6FW9+C1+/D0c=
X-Google-Smtp-Source: AGHT+IFfATC9E2EJdl6t/GNI8B9ZZ98HIGEZfXC9l8qyYKjBLF3c0dva0LIDFn/gFjZSeVYYioBINw==
X-Received: by 2002:a05:6a20:144f:b0:13c:ca8b:7e29 with SMTP id
 a15-20020a056a20144f00b0013cca8b7e29mr35142833pzi.12.1699245974114; 
 Sun, 05 Nov 2023 20:46:14 -0800 (PST)
Received: from debian.me ([103.131.18.64]) by smtp.gmail.com with ESMTPSA id
 s18-20020a17090330d200b001c627413e87sm4887823plc.290.2023.11.05.20.46.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 05 Nov 2023 20:46:13 -0800 (PST)
Received: by debian.me (Postfix, from userid 1000)
 id 3EB5A822370C; Mon,  6 Nov 2023 11:46:07 +0700 (WIB)
Date: Mon, 6 Nov 2023 11:46:07 +0700
From: Bagas Sanjaya <bagasdotme@gmail.com>
To: Hunter Chasens <hunter.chasens18@ncf.edu>, corbet@lwn.net,
 Jani Nikula <jani.nikula@intel.com>, Luca Coelho <luciano.coelho@intel.com>
Subject: Re: [PATCH v1] docs: gpu: rfc: i915_scheduler.rst remove unused
 directives for namespacing
Message-ID: <ZUhvj2uj_PvaDxIM@debian.me>
References: <20231104134708.69432-1-hunter.chasens18@ncf.edu>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="6Wwjq5qJEKQkV4NO"
Content-Disposition: inline
In-Reply-To: <20231104134708.69432-1-hunter.chasens18@ncf.edu>
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
Cc: tzimmermann@suse.de, Linux Documentation <linux-doc@vger.kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 dri-devel@lists.freedesktop.org, mripard@kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--6Wwjq5qJEKQkV4NO
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, Nov 04, 2023 at 09:47:08AM -0400, Hunter Chasens wrote:
> diff --git a/Documentation/gpu/rfc/i915_scheduler.rst b/Documentation/gpu=
/rfc/i915_scheduler.rst
> index c237ebc024cd..23ba7006929b 100644
> --- a/Documentation/gpu/rfc/i915_scheduler.rst
> +++ b/Documentation/gpu/rfc/i915_scheduler.rst
> @@ -135,13 +135,9 @@ Add I915_CONTEXT_ENGINES_EXT_PARALLEL_SUBMIT and
>  drm_i915_context_engines_parallel_submit to the uAPI to implement this
>  extension.
> =20
> -.. c:namespace-push:: rfc
> -
>  .. kernel-doc:: include/uapi/drm/i915_drm.h
>          :functions: i915_context_engines_parallel_submit
> =20
> -.. c:namespace-pop::
> -
>  Extend execbuf2 IOCTL to support submitting N BBs in a single IOCTL
>  -------------------------------------------------------------------
>  Contexts that have been configured with the 'set_parallel' extension can=
 only

The warnings go away, thanks!

Fixes: f6757dfcfde7 ("drm/doc: fix duplicate declaration warning")
Reviewed-by: Bagas Sanjaya <bagasdotme@gmail.com>

--=20
An old man doll... just what I always wanted! - Clara

--6Wwjq5qJEKQkV4NO
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQSSYQ6Cy7oyFNCHrUH2uYlJVVFOowUCZUhviAAKCRD2uYlJVVFO
ozwWAP4tUvIkF1gh+MbNCqESi7gLMuWjBdyWuZTEHcgyN3SBywEAkiw5LRZhtw7s
X12IB03vD5Sr1fxvaXjdv9YYpRrjywQ=
=MAkp
-----END PGP SIGNATURE-----

--6Wwjq5qJEKQkV4NO--
