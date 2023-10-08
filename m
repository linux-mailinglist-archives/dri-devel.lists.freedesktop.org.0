Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 146D07BCEE0
	for <lists+dri-devel@lfdr.de>; Sun,  8 Oct 2023 16:11:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9CE7910E192;
	Sun,  8 Oct 2023 14:11:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oo1-xc29.google.com (mail-oo1-xc29.google.com
 [IPv6:2607:f8b0:4864:20::c29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 75CEF10E192;
 Sun,  8 Oct 2023 14:11:15 +0000 (UTC)
Received: by mail-oo1-xc29.google.com with SMTP id
 006d021491bc7-57eaaba78d0so1766001eaf.0; 
 Sun, 08 Oct 2023 07:11:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1696774274; x=1697379074; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=XyEKxcvwY7znmPwndnO8wEBvpz3VAnMCyGn/RSrU7oc=;
 b=Kp09/160u21wzAHTQINzhqw9LmWoHj576S0fihpYnfDt5P8s/aQEq69q3wA4gkuBIk
 0HElGi9413E0B4gkNShnrwH5l/cubckSg7jdctXNRtQj2GFvO/UYwlozDBT1tJNAkghf
 l+x19ViKRWK9ynG4xgazgrAki41L48knaUeaHUnbUP6TjUB4SQ8jIl+bA6qbYaOBb9Cz
 y6UyNptpYn2OW6BeoyW+6Y9bfJIqXuSHKXeEa/USMBY3xBEMlz++7seOUkoXNLI2/loo
 OMpq/62oMzPKlNdNfiOwSHju8OQ3opCvrGi0AGdirjb4uuc3/e5Td3Zs/nPvftJVLKIG
 vvlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1696774274; x=1697379074;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=XyEKxcvwY7znmPwndnO8wEBvpz3VAnMCyGn/RSrU7oc=;
 b=TRTCWcft1kIr9uvd3ESw8b5++tSr3/ycApPq3oj2Ay7cyxA+xmwHD6cjShWjkB8o9X
 AbzIR0nrfN0NgPM4+amRTdKrznAROh7XouTAhjW8FGORDiiBAMBCOCzf2nmIQJQ8x6R6
 gLrjRjQBgCNGPOxLZ+b4kNkv4dr5tSBIH0jpW5oc9G8WVFY/+RSbS28/iPxSdHep9him
 uzWOD1Hjcy0vbW3LZEpWvIDl+KUW3QJEJq/KmlPlrRynSfd+q8d/9KbKy8BKAIz2BTYT
 yjYsB7c4g/8ky4NcZivdoGl7p9WLMbV9+uXUSuQYZo5KK72hwomDVxLOBznvwkyANKBw
 XrJw==
X-Gm-Message-State: AOJu0Yy7QvDL9rPQXAB7+lse1UaZThHlmLMN2+4JGTr6Nfu/D27bBXWG
 +pKwBmG3SKCkC76om3UqndQ=
X-Google-Smtp-Source: AGHT+IG+CkVWDZM4qbJZPGKsfqeGKlF2EUxOaaCzInK5BXwAXjPI7BtZrZDAcVJa8xl9T/W6Kr6cOQ==
X-Received: by 2002:a05:6358:918b:b0:14f:3874:2746 with SMTP id
 j11-20020a056358918b00b0014f38742746mr10423698rwa.23.1696774274421; 
 Sun, 08 Oct 2023 07:11:14 -0700 (PDT)
Received: from debian.me ([103.131.18.64]) by smtp.gmail.com with ESMTPSA id
 l19-20020a639853000000b0056b6d1ac949sm6374825pgo.13.2023.10.08.07.11.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 08 Oct 2023 07:11:13 -0700 (PDT)
Received: by debian.me (Postfix, from userid 1000)
 id 3F79F81B12C1; Sun,  8 Oct 2023 21:11:04 +0700 (WIB)
Date: Sun, 8 Oct 2023 21:11:04 +0700
From: Bagas Sanjaya <bagasdotme@gmail.com>
To: Bragatheswaran Manickavel <bragathemanick0908@gmail.com>,
 kherbst@redhat.com, lyude@redhat.com, dakr@redhat.com,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 tzimmermann@suse.de, airlied@gmail.com, daniel@ffwll.ch
Subject: Re: [PATCH] drm/nouveau: fix kernel-doc warning
Message-ID: <ZSK4eNUPYIqPF3fM@debian.me>
References: <20231008070618.20640-1-bragathemanick0908@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="NyY6YWaxLzVX3FT9"
Content-Disposition: inline
In-Reply-To: <20231008070618.20640-1-bragathemanick0908@gmail.com>
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
Cc: nouveau@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--NyY6YWaxLzVX3FT9
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, Oct 08, 2023 at 12:36:18PM +0530, Bragatheswaran Manickavel wrote:
> @@ -458,15 +458,15 @@ struct drm_nouveau_svm_bind {
> =20
>  #define DRM_IOCTL_NOUVEAU_GETPARAM           DRM_IOWR(DRM_COMMAND_BASE +=
 DRM_NOUVEAU_GETPARAM, struct drm_nouveau_getparam)
>  #define DRM_IOCTL_NOUVEAU_CHANNEL_ALLOC      DRM_IOWR(DRM_COMMAND_BASE +=
 DRM_NOUVEAU_CHANNEL_ALLOC, struct drm_nouveau_channel_alloc)
> -#define DRM_IOCTL_NOUVEAU_CHANNEL_FREE       DRM_IOW (DRM_COMMAND_BASE +=
 DRM_NOUVEAU_CHANNEL_FREE, struct drm_nouveau_channel_free)
> +#define DRM_IOCTL_NOUVEAU_CHANNEL_FREE       DRM_IOW(DRM_COMMAND_BASE + =
DRM_NOUVEAU_CHANNEL_FREE, struct drm_nouveau_channel_free)
> =20
>  #define DRM_IOCTL_NOUVEAU_SVM_INIT           DRM_IOWR(DRM_COMMAND_BASE +=
 DRM_NOUVEAU_SVM_INIT, struct drm_nouveau_svm_init)
>  #define DRM_IOCTL_NOUVEAU_SVM_BIND           DRM_IOWR(DRM_COMMAND_BASE +=
 DRM_NOUVEAU_SVM_BIND, struct drm_nouveau_svm_bind)
> =20
>  #define DRM_IOCTL_NOUVEAU_GEM_NEW            DRM_IOWR(DRM_COMMAND_BASE +=
 DRM_NOUVEAU_GEM_NEW, struct drm_nouveau_gem_new)
>  #define DRM_IOCTL_NOUVEAU_GEM_PUSHBUF        DRM_IOWR(DRM_COMMAND_BASE +=
 DRM_NOUVEAU_GEM_PUSHBUF, struct drm_nouveau_gem_pushbuf)
> -#define DRM_IOCTL_NOUVEAU_GEM_CPU_PREP       DRM_IOW (DRM_COMMAND_BASE +=
 DRM_NOUVEAU_GEM_CPU_PREP, struct drm_nouveau_gem_cpu_prep)
> -#define DRM_IOCTL_NOUVEAU_GEM_CPU_FINI       DRM_IOW (DRM_COMMAND_BASE +=
 DRM_NOUVEAU_GEM_CPU_FINI, struct drm_nouveau_gem_cpu_fini)
> +#define DRM_IOCTL_NOUVEAU_GEM_CPU_PREP       DRM_IOW(DRM_COMMAND_BASE + =
DRM_NOUVEAU_GEM_CPU_PREP, struct drm_nouveau_gem_cpu_prep)
> +#define DRM_IOCTL_NOUVEAU_GEM_CPU_FINI       DRM_IOW(DRM_COMMAND_BASE + =
DRM_NOUVEAU_GEM_CPU_FINI, struct drm_nouveau_gem_cpu_fini)
>  #define DRM_IOCTL_NOUVEAU_GEM_INFO           DRM_IOWR(DRM_COMMAND_BASE +=
 DRM_NOUVEAU_GEM_INFO, struct drm_nouveau_gem_info)
> =20
>  #define DRM_IOCTL_NOUVEAU_VM_INIT            DRM_IOWR(DRM_COMMAND_BASE +=
 DRM_NOUVEAU_VM_INIT, struct drm_nouveau_vm_init)

Can you please split checkpatch fix above into separate patch?

--=20
An old man doll... just what I always wanted! - Clara

--NyY6YWaxLzVX3FT9
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQSSYQ6Cy7oyFNCHrUH2uYlJVVFOowUCZSK4dwAKCRD2uYlJVVFO
ow1cAQDVcS0V99/qpu73ULyxIv/J+8DZ7JV9q172/0v22KhgWQEA4slaxL7vNv9D
tEdpFPiHgSg5FsYifzU9Rtf8fy38fAs=
=INQ7
-----END PGP SIGNATURE-----

--NyY6YWaxLzVX3FT9--
