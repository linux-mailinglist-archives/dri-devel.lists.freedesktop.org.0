Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id ACDDDB0A8CE
	for <lists+dri-devel@lfdr.de>; Fri, 18 Jul 2025 18:47:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CB72610E115;
	Fri, 18 Jul 2025 16:47:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="jDyjdGFx";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com
 [209.85.214.177])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DA55110EA1A;
 Fri, 18 Jul 2025 16:47:01 +0000 (UTC)
Received: by mail-pl1-f177.google.com with SMTP id
 d9443c01a7336-234b9b01a76so1377305ad.3; 
 Fri, 18 Jul 2025 09:47:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1752857221; x=1753462021; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=KJsP/eoaDosNoXGwzPMM0imt30ENxWHLuIS9lVwxHA4=;
 b=jDyjdGFxmcUdY4rqJFnhc9xofWT0jrFVek+ADN+Bb6kwzb+965XlwJoMFdiVxKcoEY
 OwcgnIP18lBx/UhkvizUMGea5OQI2cBrQVSZgH0LDp5sdq6nJC2kWtIh9WhL9l4qAQ/u
 ztaFvKDITpwfXAHLRVZyIUqAGGsOsyMW6jgrq4Wjh0QS6qoxto4kqmri0QLWuLEwJxHF
 8u5AHeZRditfy82ogqC2iXlzaYFOCkxk3LFD1/MCEhepRYHWXPRHXyIhRIgx51LVb6BF
 8iJNKbtGUPxL2pyfYuARj3cVn3G1t1bI9NUbXJXCTw/TRBZZUw+1PJ0WQpqdSn5TZkAq
 hD1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1752857221; x=1753462021;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=KJsP/eoaDosNoXGwzPMM0imt30ENxWHLuIS9lVwxHA4=;
 b=DRd1BWzfzZ69/DKBxHJjY3uqgQgr9/BhWPFOVk0ZuIWAjnhn/OTkQlht2mgGLu7gHg
 se3qWPXJx0h9UdUKhMBz2IvbMFF7VJodASMiYVUK5Qv6+3O4Fki2Tv1I673lcqWvR4/o
 66JBF9BKIPDLAC5k4b5Edrs4yvZVBn2wGlO79mBrYS2bXGJAu2P6dKzRuZ0SH7xaRb4E
 1ZMxB4dDqKo7ghfdoy54KAin0y3WDvbZD0LSRsSjCVqz9FsT5taCTgbnqgPG96B+wbnp
 KcTR+p2asneB4CKVmTOt7pvP17EuQyEkNBSNPac1Wc3fjxmrviic8eJoDjkhuUDXmH0U
 X5mw==
X-Forwarded-Encrypted: i=1;
 AJvYcCU9ynOQ2R8uEQ9AeQnTQ3m/KUgrONEVxgIHAafYInXs0hRER1aHfQxFLt1v4+DR/krYsEDpmp/z@lists.freedesktop.org,
 AJvYcCXTVry/p12YH4C8fu36hte0QrEXWxNHvdwQf7u+KfMOCY+ECuLAyZpV7SWCOxYQ1lfOHsZRpkD99VQ5@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzuLg+f8g9sBrzoLlfxL6r0KtxsNosObGynNG2RnPsav57W04cW
 +j6PfWwlM5n8Sl9pX/6qY27RrGFgIssjDur+QXgYLk7hhC2QoaEQJ3plbseJ07SZjzdcF+Yl61U
 VmGhTGZmjkN2+ThHCDWkGzoTcmFuVtm8=
X-Gm-Gg: ASbGncvUydPfqcev1iE8zLi3Pdjoao93ptzSTzpNWds1txVzK6KG3YZB1X0BgXeRNI/
 KvsGlGsJxneeVMvTuJl+efqoc+A85e/3EiF516V4lDGyh3zl9iZ6c1iezlnx7RIPDTGUmlmx4nR
 Lf1I0n7KF7OwL2XEiryKTsxfOJbnIsQUS/vyFIclAICh5EpdeMa1+Ze6/B9V+f1srU5AL7YJA4H
 h+vG4lS
X-Google-Smtp-Source: AGHT+IFOuDMPJrT1YCbFfuqwvYmjK058Y/LsXdNCczy9B2FmndCQNYcZwQpniaR39y9/uG9+M4sTO5ZsP5LXB18KwA8=
X-Received: by 2002:a17:902:d4cb:b0:236:7165:6ed3 with SMTP id
 d9443c01a7336-23e24f4c2edmr64356245ad.10.1752857221373; Fri, 18 Jul 2025
 09:47:01 -0700 (PDT)
MIME-Version: 1.0
References: <20250717204819.731936-1-mustela@erminea.space>
In-Reply-To: <20250717204819.731936-1-mustela@erminea.space>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Fri, 18 Jul 2025 12:46:49 -0400
X-Gm-Features: Ac12FXyn8h7SRjZg184zAY-fazXhgQky6QNND2dxKcl59Lhu--Q37Qp2D17REr4
Message-ID: <CADnq5_N++cfNqzaft003nJhqkyUbMQFYcM+ioM5yh_JNrnV5oA@mail.gmail.com>
Subject: Re: [PATCH] drm/amdgpu: check if hubbub is NULL in
 debugfs/amdgpu_dm_capabilities
To: Peter Shkenev <mustela@erminea.space>
Cc: alexander.deucher@amd.com, amd-gfx@lists.freedesktop.org, 
 christian.koenig@amd.com, airlied@gmail.com, simona@ffwll.ch, 
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

Applied.  Thanks!

Alex

On Thu, Jul 17, 2025 at 4:58=E2=80=AFPM Peter Shkenev <mustela@erminea.spac=
e> wrote:
>
> HUBBUB structure is not initialized on DCE hardware, so check if it is NU=
LL
> to avoid null dereference while accessing amdgpu_dm_capabilities file in
> debugfs.
>
> Signed-off-by: Peter Shkenev <mustela@erminea.space>
> ---
>  drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_debugfs.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_debugfs.c b/=
drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_debugfs.c
> index c7d13e743e6c..b726bcd18e29 100644
> --- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_debugfs.c
> +++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_debugfs.c
> @@ -3988,7 +3988,7 @@ static int capabilities_show(struct seq_file *m, vo=
id *unused)
>
>         struct hubbub *hubbub =3D dc->res_pool->hubbub;
>
> -       if (hubbub->funcs->get_mall_en)
> +       if (hubbub && hubbub->funcs->get_mall_en)
>                 hubbub->funcs->get_mall_en(hubbub, &mall_in_use);
>
>         if (dc->cap_funcs.get_subvp_en)
> --
> 2.50.1
>
