Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 84B3B91E63F
	for <lists+dri-devel@lfdr.de>; Mon,  1 Jul 2024 19:09:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 78A1F10E0FB;
	Mon,  1 Jul 2024 17:09:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="R6oo1BsC";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com
 [209.85.216.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 26EA810E0FB
 for <dri-devel@lists.freedesktop.org>; Mon,  1 Jul 2024 17:09:54 +0000 (UTC)
Received: by mail-pj1-f53.google.com with SMTP id
 98e67ed59e1d1-2c8dc2bcb78so2358164a91.1
 for <dri-devel@lists.freedesktop.org>; Mon, 01 Jul 2024 10:09:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1719853793; x=1720458593; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=xmxERVNDTeYDLj/2lxQmz+FNR9fPdrJt1tpozBOZ1TE=;
 b=R6oo1BsCAHXq0clF6Du260itZb8jHC+a4EWMZhE0U0dIRNv8rBLtKMlo36LBkQ8uvM
 FZ9YBaYyOaZ/E2JfbHvCxthKsxIB8XLSbJ/Z8CW0n/NbicRTK3nvQN9NBf9Boyu1KLlG
 1R8CIAdOSOh7DpV8mM7lOq3kZhLvn0or5dd+F0wqrCg7G75oCGQGX+1QGpkJk48JeHK1
 ATATvI0TREkY8vFvp06m3fHZ4mcgnZgWRpzoCIe8fNVWy3nU03N+ZYuDaR9oQVzBvgYg
 mJVnu+fx1El+5cE4OOW4mSCwO617t/gdsf6zyxl5lnD7FqQYXEEma8jfXuEHHnN1kvkv
 YIPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1719853794; x=1720458594;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=xmxERVNDTeYDLj/2lxQmz+FNR9fPdrJt1tpozBOZ1TE=;
 b=BjbHnAaNugkn2NT3L/RDzfdFTjSotCN/OYEBFQhgWKwBCRZ4c52+dubrNa2nDUEUvF
 xo9wIaL1ucMAyvKR9W5iftcgRg+KiTISdm8N9nAkJhzpr0FPteM1kqEE94fpqWjup1sX
 oUcMcig62wYDnQfly/X680LttkrEZs8uG8M7HyyFD28IuVOp+XSVYw5foQliJFr/0pu2
 TunK/g5d1tR6ECDj6IlscaWaUnPs6j7Tt6aBjLn0voS8T05tYPV1zvexYtmytF91zoMS
 4snK9WxD7ccb5foVXnHQB5mEH51pt6Tcu04loCGWOoqKcCGpviU3YduD1UgIzHE0HhmV
 QHbg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUyBrWgav5gnw4KGzW1+q2c+EKL3G7vOr+ub/gp3rPkBJc9/WoV6jToZwo/YaMcfYMvHfPAacVYEt90MBeQZZKDAoUXpzyDfH1WR/ZQseN/
X-Gm-Message-State: AOJu0YxQd6DJO9HIyGuqhhQfDTDmeJ9S2tnYnANXr7VYPtrj0truTHDD
 9uowxrwG13ZEOKw1MSrhQhai7FekZprFi4ygI8ISK3dHCWdFudgSc8FfqNZG1lBui520qZljXMZ
 ytF3oUm06dQBmjum5woelhn+UiS4=
X-Google-Smtp-Source: AGHT+IFdv/CxEX3F4Ls8LF6qC0ROUQXCJSCbEYwfXdHqQBbEAIQ+2XGyB9PXVwTsdl/QAJlaO772YrkBCIovcazHbec=
X-Received: by 2002:a17:90b:3105:b0:2c2:ce7a:7cb6 with SMTP id
 98e67ed59e1d1-2c93d72fa21mr5644720a91.26.1719853793619; Mon, 01 Jul 2024
 10:09:53 -0700 (PDT)
MIME-Version: 1.0
References: <vahBbQHXGpyFcIwzIVTPHRnphiAma3_wNbTftk7O3I6gN4gToIj3zIJrIkO263Ly61q2HArlyB1lvyKM1FFyqkqAdLH195Y41xK8GWL4ZBg=@emersion.fr>
In-Reply-To: <vahBbQHXGpyFcIwzIVTPHRnphiAma3_wNbTftk7O3I6gN4gToIj3zIJrIkO263Ly61q2HArlyB1lvyKM1FFyqkqAdLH195Y41xK8GWL4ZBg=@emersion.fr>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Mon, 1 Jul 2024 13:09:42 -0400
Message-ID: <CADnq5_NgzVn4AOekFQ1xYqkdhuZhTE1QVqxO1WJtp-Bchx6dcw@mail.gmail.com>
Subject: Re: AMD GFX12 modifiers
To: Simon Ser <contact@emersion.fr>,
 =?UTF-8?B?TWFyZWsgT2zFocOhaw==?= <marek.olsak@amd.com>
Cc: Aurabindo Pillai <aurabindo.pillai@amd.com>, 
 DRI Development <dri-devel@lists.freedesktop.org>, 
 Rodrigo Siqueira <rodrigo.siqueira@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>, 
 Bas Nieuwenhuizen <bas@basnieuwenhuizen.nl>
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

+ Marek

On Sat, Jun 29, 2024 at 1:15=E2=80=AFPM Simon Ser <contact@emersion.fr> wro=
te:
>
> Hi all!
>
> In 7ceb94e87bff ("drm/amd: Add gfx12 swizzle mode defs"), some
> definitions were added for GFX12 modifiers. However I'm not quite sure
> I understand how these work.
>
> Tile values seem to not be in the same namespace as GFX9 through GFX11,
> is that correct? In other words, can GFX9 ~ GFX11 modifiers be used with
> GFX12, or are these mutually exclusive?
>
> AMD_FMT_MOD_GFX12_DCC_MAX_COMPRESSED_BLOCK_MASK has a comment explaining
> the 3 possible values, is there a reason why #defines are missing for
> these values?
>
> The comment lists a lot more swizzle modes than just 64K_2D and 256K_2D,
> any reason why the rest are missing (at least for the 2D ones)?
>
> Could you explain how the new GFX12 modifiers work?
>
> Would it be possible to update the comment on top of #define AMD_FMT_MOD
> to reflect the GFX12 updates?
>
> Thanks,
>
> Simon
