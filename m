Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B81C277EAF8
	for <lists+dri-devel@lfdr.de>; Wed, 16 Aug 2023 22:46:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B9A8610E3B9;
	Wed, 16 Aug 2023 20:46:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oa1-x31.google.com (mail-oa1-x31.google.com
 [IPv6:2001:4860:4864:20::31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DD1C910E3B4;
 Wed, 16 Aug 2023 20:46:23 +0000 (UTC)
Received: by mail-oa1-x31.google.com with SMTP id
 586e51a60fabf-1bfc2b68090so5131374fac.3; 
 Wed, 16 Aug 2023 13:46:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1692218783; x=1692823583;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=SETSG1C+Cu9UyG+a+AwjbHIVQl99cMTjMKSLpy0hw8c=;
 b=KNLYWsGhOBPF/4dSZgPXQFQLBMQKr1pA0I1SYdp/eikxyFXUYlUR+2iQkZsYtcDajf
 maX/6+vcDBR1ctlqCNC9qXV25aXvQ9Bwx4b3LH4k9czb53SWsg5DJpMMHh2ktCSyJErC
 vg8PynpqzNU1y38K7pTebKL1USSGJtjvAvmQpRox0mHxjE1+i70jGUW3BczVW3ao3pGW
 tXuLPDEmDUGoUak1w7lplPiwM+oxUoK62i7dm46+NpASpYFjo3JANeGfz22VsnjksmlR
 THKroUMHAdWkoE4kmwZG52ISv7Xj6Sv+pYgOThqRIqu0iv2kiibZlV3k36nitn+onauT
 v/zw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1692218783; x=1692823583;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=SETSG1C+Cu9UyG+a+AwjbHIVQl99cMTjMKSLpy0hw8c=;
 b=av24JMGfYMM+NO+KZuQAJjL+plbEd/weZqwMKh9lhcHDqZwVjCzcT1W82arerpcCki
 /s/cbSxMqLM/7XZLH06qMZ3zw/SBHkzpSzvGe511VtHBY1dh21dngeikPBHS2IbZ6LZf
 V0W+90WjM8NbHkWJ+1+PZPzwIeLXj/BKyhVEWjjvo6QrUoo7T67eqXZp5m55Grfy1NgG
 VIq24r6X2UHBgjj6i1xXrJErgz6HZ/hPTzq9C6FidMGZFu/pY5X7DyE35V75CNsjO+ex
 hHa1rLYtrkmDai+b5iUNEM+gnOCEsrlJ2pEzWtde5Y7cZr19bcTF6sMfnikUiLLF/xJF
 WvbA==
X-Gm-Message-State: AOJu0YwO93aGgN6yTWJpUAgMr2X5/pTt7MvUkzojohdPmNopLug+vDpO
 E4SDJdLmoqDPGa5RthXX4vzV9mV6da4Av2EDkTz7GGe+4v8=
X-Google-Smtp-Source: AGHT+IGNMzjuoTgpi0Qb1c6zsvcpH9Gh4ezJYdj0Wfk5fzSl1OkL4HqXNAC0eKc+5fXeEm4HySVX8diyJT7aZ6rfiwQ=
X-Received: by 2002:a05:6871:288:b0:1b3:eec8:fa90 with SMTP id
 i8-20020a056871028800b001b3eec8fa90mr3621542oae.6.1692218783171; Wed, 16 Aug
 2023 13:46:23 -0700 (PDT)
MIME-Version: 1.0
References: <20230816035603.690383-1-lijo.lazar@amd.com>
In-Reply-To: <20230816035603.690383-1-lijo.lazar@amd.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Wed, 16 Aug 2023 16:46:12 -0400
Message-ID: <CADnq5_NwgrvS4tdwX9Tg=1nLU8iJck2tjKfRLVU_vR3Xi=NrLg@mail.gmail.com>
Subject: Re: [PATCH] Documentation/gpu: Update amdgpu documentation
To: Lijo Lazar <lijo.lazar@amd.com>
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
Cc: sfr@canb.auug.org.au, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org, Alexander.Deucher@amd.com, airlied@redhat.com,
 Hawking.Zhang@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Aug 16, 2023 at 12:15=E2=80=AFAM Lijo Lazar <lijo.lazar@amd.com> wr=
ote:
>
> 7957ec80ef97 ("drm/amdgpu: Add FRU sysfs nodes only if needed") moved
> the documentation for some of the sysfs nodes to amdgpu_fru_eeprom.c.
> Update the documentation accordingly.
>
> Signed-off-by: Lijo Lazar <lijo.lazar@amd.com>
> ---
>  Documentation/gpu/amdgpu/driver-misc.rst | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
>
> diff --git a/Documentation/gpu/amdgpu/driver-misc.rst b/Documentation/gpu=
/amdgpu/driver-misc.rst
> index be131e963d87..26334e54447b 100644
> --- a/Documentation/gpu/amdgpu/driver-misc.rst
> +++ b/Documentation/gpu/amdgpu/driver-misc.rst
> @@ -11,19 +11,19 @@ via sysfs
>  product_name
>  ------------
>
> -.. kernel-doc:: drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
> +.. kernel-doc:: drivers/gpu/drm/amd/amdgpu/amdgpu_fru_eeprom.c
>     :doc: product_name
>
>  product_number
>  --------------
>
> -.. kernel-doc:: drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
> +.. kernel-doc:: drivers/gpu/drm/amd/amdgpu/amdgpu_fru_eeprom.c
>     :doc: product_name

I think this should be product_number

Alex

>
>  serial_number
>  -------------
>
> -.. kernel-doc:: drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
> +.. kernel-doc:: drivers/gpu/drm/amd/amdgpu/amdgpu_fru_eeprom.c
>     :doc: serial_number
>
>  unique_id
> --
> 2.25.1
>
