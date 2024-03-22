Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1AF86887383
	for <lists+dri-devel@lfdr.de>; Fri, 22 Mar 2024 20:00:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B711111270E;
	Fri, 22 Mar 2024 19:00:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="EFboOMJ6";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com
 [209.85.210.179])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3272311270E
 for <dri-devel@lists.freedesktop.org>; Fri, 22 Mar 2024 19:00:16 +0000 (UTC)
Received: by mail-pf1-f179.google.com with SMTP id
 d2e1a72fcca58-6e6082eab17so1857985b3a.1
 for <dri-devel@lists.freedesktop.org>; Fri, 22 Mar 2024 12:00:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1711134015; x=1711738815; darn=lists.freedesktop.org;
 h=mime-version:user-agent:content-transfer-encoding:references
 :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
 :date:message-id:reply-to;
 bh=rbqZXtWUsXkXU7uKgL2eJ1fLAfu1qEVONTKncRNgFZU=;
 b=EFboOMJ6izwIJUp7+jrBkuu7tYEpNZQx4hzwDY8mTMWFlnUr4/Hov1g83X/QHKmTbJ
 Kspacmol6AQmMSpzY4PB5/4NWCNwp7DH/E4xGXPeN5lTe8Z+G64KMvOpJlR9yip1WDMw
 NoFxyVbP+QTcHiluGv0NdnEhuJh9wXYcJTfRUfaaVrQw07CAfvc1Vs/KPFVXAPjhfP86
 Fq2n2+xr73LUMsYx34LwRh7YNIzXe2uBbcfm1+JlwTem3cFXP0bTglV2eWQsZXYAPepc
 s3ZV0UlX3WdAHdTUAxrz/CSrlzDokEPpPi4VYZQlK0nHwNLzSlBxe0Y1ED2/yeY/Lysz
 /bYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1711134015; x=1711738815;
 h=mime-version:user-agent:content-transfer-encoding:references
 :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=rbqZXtWUsXkXU7uKgL2eJ1fLAfu1qEVONTKncRNgFZU=;
 b=Yao4v+a8baVPtllcCvT43gdFak1DpYkHryXeT/C/WFU7G+n8l9vBL8iuenTyFoGWXh
 FGjxe0hC2nU7kTTgNIVQH9LoxVYEf5fGpL/9yHNRpjGkXwt6eKpZv2gBXYzulpycJYv4
 EUEbwDV1p84zmVKBS1IG2E1oQ4VUbGxyFCwVciAcmrKNAKK2irdho3KbSLxoX7QKYP1w
 bFzOSoPYv6oNAcsYo8N0o1TKGavRzYrNkOJb76MqHsZmcdGsF9P/mBxWqsK0YR32ofe3
 wCHm0hytkEnZxgqY3Rjv9tleZEhLEldifcGn6nWK42MItes+KVJyitVz4mHka6DJ+WiI
 +Sig==
X-Gm-Message-State: AOJu0YwEOECgx83zhii0WoG9Cz/teEk2QRgBkayIB45IoAPBZGRfgpiT
 SSASKdxDakXQmfZ/2hdOhQSicbEofpTHqyf15jnzzr1F6Wb+ooCQ
X-Google-Smtp-Source: AGHT+IEBGM7i1E1TidmfQx+2yGHWF02f7RsNVHEYExqXeZ/JPZ+xWiuTct6cwktvs6pJTLdsmyz9lA==
X-Received: by 2002:a05:6a00:3d06:b0:6e6:b155:b9a3 with SMTP id
 lo6-20020a056a003d0600b006e6b155b9a3mr703841pfb.11.1711134013371; 
 Fri, 22 Mar 2024 12:00:13 -0700 (PDT)
Received: from [192.168.0.21] ([119.82.120.209])
 by smtp.gmail.com with ESMTPSA id
 y12-20020aa7804c000000b006e6bcbea9e0sm96558pfm.88.2024.03.22.12.00.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 22 Mar 2024 12:00:13 -0700 (PDT)
Message-ID: <0d10046d0868878cfc1f3de90ebd5e5bc1a74a6f.camel@gmail.com>
Subject: Re: [PATCH] Fix duplicate C declaration warnings
From: Amogh <amogh.linux.kernel.dev@gmail.com>
To: Jani Nikula <jani.nikula@linux.intel.com>, airlied@gmail.com, 
 daniel@ffwll.ch, maarten.lankhorst@linux.intel.com, mripard@kernel.org, 
 tzimmermann@suse.de, corbet@lwn.net, javier.carrasco.cruz@gmail.com, 
 skhan@linuxfoundation.org
Cc: dri-devel@lists.freedesktop.org, linux-doc@vger.kernel.org, 
 linux-kernel@vger.kernel.org
Date: Sat, 23 Mar 2024 00:30:07 +0530
In-Reply-To: <871q83mw96.fsf@intel.com>
References: <20240321115738.51188-1-amogh.linux.kernel.dev@gmail.com>
 <871q83mw96.fsf@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.50.4 (by Flathub.org) 
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

On Thu, 2024-03-21 at 17:37 +0200, Jani Nikula wrote:
> Please paste the warnings here.
>=20
> BR,
> Jani.
>=20

Here are the warnings I got:

/home/amogh/Linux_Kernel_Workspace/linux-next/Documentation/gpu/drm-
kms:360: ./drivers/gpu/drm/drm_fourcc.c:344: WARNING: Duplicate C
declaration, also defined at gpu/drm-kms:39.
Declaration is '.. c:function:: const struct drm_format_info *
drm_format_info (u32 format)'.
/home/amogh/Linux_Kernel_Workspace/linux-next/Documentation/gpu/drm-
kms:461: ./drivers/gpu/drm/drm_modeset_lock.c:392: WARNING: Duplicate C
declaration, also defined at gpu/drm-kms:49.
Declaration is '.. c:function:: int drm_modeset_lock (struct
drm_modeset_lock *lock, struct drm_modeset_acquire_ctx *ctx)'.

With Regards,
Amogh
