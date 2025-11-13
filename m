Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 60279C57DBC
	for <lists+dri-devel@lfdr.de>; Thu, 13 Nov 2025 15:12:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B0CF010E827;
	Thu, 13 Nov 2025 14:12:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=kde.org header.i=@kde.org header.b="gLoIap/e";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from letterbox.kde.org (letterbox.kde.org [46.43.1.242])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8711510E826
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Nov 2025 14:12:16 +0000 (UTC)
Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com
 [209.85.208.47]) (Authenticated sender: zamundaaa)
 by letterbox.kde.org (Postfix) with ESMTPSA id 417AA33F79B
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Nov 2025 14:12:15 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kde.org; s=users;
 t=1763043135; bh=JoVORXO0RTAANywHlkFvF0Ah6ITaFw2yxmHRYOFrUE8=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=gLoIap/eItavrbpqVnmqCrUzOnQkMdKn6pIMkwlsrfqrjvWoJqMwXDd6qf/GZQZRd
 cdvfQkYRZWuqy05vKu1WDCwlBlpNjt8Dh9LX5R9v51RglG/J2FXnDYIn6DcZd74+IA
 ogES7mGU8MXczeJyOy3IflaHllZvBeJipzROKdZllvDSGV0xDBzBD3Vnq0upX/9KsV
 gm6ivNrjMB486a/LEVfa0904wvTa8EJ6XAgtvjF0QG+iO1aS1fitZN7GUILB+pouEs
 giFCO61jUxPw2XsyWUqI6XkaN2LpUmO8bDaspREed1Cpd6hGPD1/o9mUy4dHrgixao
 8vVqTOP8qgfEQ==
Received: by mail-ed1-f47.google.com with SMTP id
 4fb4d7f45d1cf-640e9f5951aso3272007a12.1
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Nov 2025 06:12:15 -0800 (PST)
X-Gm-Message-State: AOJu0YweynsVp3EdH8JrEmJ3aAdwxcuZiSKm8HH11ih9M3BQcudbkVGv
 2w/bml8fOPo2rSLuWyq9kSv/kOgEVqhPoNdH2leogBLrJuKBWVBdRWBNVZ6eHSf15rz7NpiAwTe
 uQ7h+lxKPEObdxweRi/waaJaJjQ/x+EQ=
X-Google-Smtp-Source: AGHT+IG/nkGMEapYYQV7UPKfzC7Swl+cbhe2Budd13PGHafjH+7VgH9CKZ+cBJWvD4urgKmwtG/jave/jm1NH1cZKyA=
X-Received: by 2002:a17:907:3d0e:b0:b72:dcda:fe5a with SMTP id
 a640c23a62f3a-b73480bdcbemr352716866b.5.1763043134690; Thu, 13 Nov 2025
 06:12:14 -0800 (PST)
MIME-Version: 1.0
References: <20251112151832.77867-1-xaver.hugl@kde.org>
 <20251112151832.77867-3-xaver.hugl@kde.org>
 <20251113112249.4273a324@eldfell>
In-Reply-To: <20251113112249.4273a324@eldfell>
From: Xaver Hugl <xaver.hugl@kde.org>
Date: Thu, 13 Nov 2025 15:12:03 +0100
X-Gmail-Original-Message-ID: <CAFZQkGz=N8JNiQkV2mMiG7qV5e+1xbgZZ3OVE1Gw+rcsAgJdhg@mail.gmail.com>
X-Gm-Features: AWmQ_bmjkuupQvB14tPaCpLRXfXOqKlzpT_BCRJPN1Wz3C0fJj9g8wMMtPwC-1o
Message-ID: <CAFZQkGz=N8JNiQkV2mMiG7qV5e+1xbgZZ3OVE1Gw+rcsAgJdhg@mail.gmail.com>
Subject: Re: [PATCH 3/3] drm,
 amdgpu: add the "FreeSync HDR Mode" connector property
To: Pekka Paalanen <pekka.paalanen@collabora.com>
Cc: dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org, 
 wayland-devel@lists.freedesktop.org, harry.wentland@amd.com
Content-Type: text/plain; charset="UTF-8"
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

> > FreeSync HDR provides the big benefit that display behavior is more
> > predictable, and the "native" signal doesn't waste any color resolution on
> > out of bounds colors or luminance values.
> >
> > The property has two values right now, "Disabled" and "FreeSync 2 Native".
> > If any other FreeSync HDR modes exist or will be added at some point, they
> > can be added as new enum values as well.
>
> How should this interact with the connector properties "Colorspace" and
> "HDR_OUTPUT_METADATA"?
From experimentation, my display seems to ignore the colorspace and
"traditional gamma SDR" in HDR_OUTPUT_METADATA while FreeSync HDR is
active.
Setting the eotf to PQ however turns FreeSync HDR off and switches the
display into conventional HDR mode.

Making any definite statements about this will require someone from
AMD to provide documentation, which is why I didn't put anything
explicit about it into the patch.

> Does one override the other when they disagree? Is userspace
> expected to program all of them into agreement? Should the atomic
> commit fail if they disagree?
Just like with HDR_OUTPUT_METADATA, it should just be up to userspace
to set things up in a way that works with the display.

> What about instead of a new property, make a new value called "Native"
> for "Colorspace", and require userspace to set HDR_OUTPUT_METADATA eotf
> field to "traditional gamma HDR"? This might be a silly idea, but I'd
> like to hear why. Alternatively, HDR_OUTPUT_METADATA could use a new
> 'metadata_type' value for the eotf.
I thought (and hoped) it would end up being just like that, but at
least my display doesn't support the "traditional gamma HDR" at all.
If you set it anyways, it seems to just fall back to "traditional
gamma SDR".

As HDR output metadata and colorspace have been more or less just
passed through to the display without modifications so far, I'd rather
not have the kernel step in between and try to translate things -
especially not if there's actually displays out there that do support
the "traditional gamma HDR", in which case that value may become
ambiguous.

- Xaver
