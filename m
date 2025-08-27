Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C9D7B38ABC
	for <lists+dri-devel@lfdr.de>; Wed, 27 Aug 2025 22:14:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CE83E10E8AF;
	Wed, 27 Aug 2025 20:14:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="Ghb1ln1x";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-f170.google.com (mail-pg1-f170.google.com
 [209.85.215.170])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E1F5510E8AF;
 Wed, 27 Aug 2025 20:14:11 +0000 (UTC)
Received: by mail-pg1-f170.google.com with SMTP id
 41be03b00d2f7-b49c729577dso39188a12.0; 
 Wed, 27 Aug 2025 13:14:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1756325651; x=1756930451; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=QlufRgie91QgTam9xSC34zQrGY0Nj6hkzf3Xl64IrEI=;
 b=Ghb1ln1xUm0olBDCZcQsUvEhD0vkzXByaEHc4RLXA2488cnr7kYfJSaYthYsHvqAP1
 CkvOd4cYD7fjqXCQFtwNHBjiSJYWg2SNWQAUWrLjYB3XYAxo4xqzAhhty4eaMUua/mkJ
 3m2TgdYtpZFy9sdvM/bA/fZBOarQsCvLN8NH/UXi/0Wpg+r17LNcvS3ITG8/k151CBO7
 VVjT1cSXBsDvfmJX7Rm65tSX9zw2aNT0dHY1jyiICtZuS0DSjttzxVvw75NCn3resylH
 2y63mqUYd57i7XENRONK/oZmiYAN5f+0fNrdo0Lotr6aKrVif2xe+1CZKIPvnZI28VUR
 ktEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1756325651; x=1756930451;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=QlufRgie91QgTam9xSC34zQrGY0Nj6hkzf3Xl64IrEI=;
 b=J2OcbWtfWMRh5yBk2DQ5JYNCXi8GFZptmYErLN2nlSR7XcNZYvab0s+wJoGe0M3L1J
 fVQoyiY5XKasuL08b/+ItkTeVlqic2GtZ8wKcssRSSuVUGrH7j6YDPw55eufUYWOVghZ
 nbgDkjLkeHrqvBWrRXVQB8vXSZ5PuKkmUW2V3NJ/Ky7biyYayf6suF6WWKnv1XnsdP01
 7QnzWKBBttQ6NHhiSOpLRT48l/iaWInCW5wSX5RbSTZJwsLX+kjan0Fn/6L+Z3kZgE14
 o9BmIirLzYa+PFpT+s4zr0qW2i6fgdXD6VVJ55VFw7O9fA/zOGtBygvam/WcIrnYcN5N
 djyA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVIFPAI3Vxc4DN+HHkivKw+07eYqfZNBq6PSjyLYGwQXPFpqumFToRjaCkaT0P1PN1yaxxbn2480UtI@lists.freedesktop.org,
 AJvYcCWy+5agqCP2Ips7v91Rtu62VXZym+YRR+clUZ92pLKAnmZKhx6+QhmFYI7VoQf+9TnH8Hw3Plr6@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yy0ecnFimXxeN3ZJ6Ft2vjLkmLbUEcyZEn5jn4Qclrdyj1QqxOS
 xn4kp+l9Pc9ekiuH0mu3YBpA1cY2o6d5hsukGDXUkVCJAxWSuv+iilMq6dSY4rHjx5yx1ylFtFi
 sqxPCSKC+AE9gOPNGvAwhgzuncrm32H0ndQ==
X-Gm-Gg: ASbGncsuyal9ANy3zRIxEmiSks0bZg14QWLLAKxnBpiqzGRmhj0m83PNacQsWshy7+q
 OuGDzdHJx9hR0bQGvD82oN4aORZzgJ53yV5nNSCcIvNboIDM6inAGZzCIm9Mg0v0j335lK6Q2oF
 yHwslnHWTZYqBgDGZjzUB2lABO+1/YCzztC07/5pBiGa/zqjKcYROn2qSEdPYLIi7bMVc6ZnQ8D
 3jG+4kfVK+uuM7A6A==
X-Google-Smtp-Source: AGHT+IFrr5jFKjpnE8DrRgdjnkjAjrqoK6JTUZFNF2hiIHZxWtLqdu/5EvB4/E0d9H3HhNfbu22mum1R1mgd/ZnN1U0=
X-Received: by 2002:a17:902:f689:b0:246:b3cc:f854 with SMTP id
 d9443c01a7336-246b3cd0030mr95147505ad.2.1756325651320; Wed, 27 Aug 2025
 13:14:11 -0700 (PDT)
MIME-Version: 1.0
References: <20250823202540.487616-1-kavitheshnitt@gmail.com>
 <CADnq5_Onr6rR12NVagwMHURPfuQxBoVq8Qhui6heH_m-5eHsXA@mail.gmail.com>
 <5e065f3a-9237-4798-9380-11c43b477882@igalia.com>
In-Reply-To: <5e065f3a-9237-4798-9380-11c43b477882@igalia.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Wed, 27 Aug 2025 16:13:59 -0400
X-Gm-Features: Ac12FXyaAs-5dxZif0zb7XyNWucHk08jDJxEwJTUXNmK5agirepWHrhYt6lUYII
Message-ID: <CADnq5_MwNuSLWePB-GvkAbTv-kf=uxy8y7nd8ZSpPbB7NUVjhA@mail.gmail.com>
Subject: Re: [PATCH] drm/amd/display: Document num_rmcm_3dluts in
 mpc_color_caps
To: Melissa Wen <mwen@igalia.com>
Cc: "Kavithesh A.S" <kavitheshnitt@gmail.com>, amd-gfx@lists.freedesktop.org, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 skhan@linuxfoundation.org, harry.wentland@amd.com, sunpeng.li@amd.com, 
 siqueira@igalia.com, alexander.deucher@amd.com, christian.koenig@amd.com, 
 airlied@gmail.com, simona@ffwll.ch
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

On Wed, Aug 27, 2025 at 4:10=E2=80=AFPM Melissa Wen <mwen@igalia.com> wrote=
:
>
>
>
> On 27/08/2025 17:02, Alex Deucher wrote:
> > Applied.  Thanks!
> >
> > Alex
> >
> > On Sat, Aug 23, 2025 at 4:25=E2=80=AFPM Kavithesh A.S <kavitheshnitt@gm=
ail.com> wrote:
> >> Fix a kernel-doc warning by documenting the num_rmcm_3dluts member of =
struct mpc_color_caps.
> >>
> >> This is my first patch submission to the kernel, feedback is welcome
> >>
> >> Signed-off-by: Kavithesh A.S <kavitheshnitt@gmail.com>
> >> ---
> >>   drivers/gpu/drm/amd/display/dc/dc.h | 1 +
> >>   1 file changed, 1 insertion(+)
> >>
> >> diff --git a/drivers/gpu/drm/amd/display/dc/dc.h b/drivers/gpu/drm/amd=
/display/dc/dc.h
> >> index 59c077561..06f05979b 100644
> >> --- a/drivers/gpu/drm/amd/display/dc/dc.h
> >> +++ b/drivers/gpu/drm/amd/display/dc/dc.h
> >> @@ -234,6 +234,7 @@ struct lut3d_caps {
> >>    * @ogam_ram: programmable out gamma LUT
> >>    * @ocsc: output color space conversion matrix
> >>    * @num_3dluts: MPC 3D LUT; always assumes a preceding shaper LUT
> >> + * @num_rmcm_3dluts: number of RMCM 3D LUTS supported
> A bit late to comment, but I think you should keep the "always assumes a
> preceding shaper LUT" part.
> This info is still very useful and links shaper LUT caps to this attribut=
e.

I'll add that before I push it.

Alex

>
> Melissa
>
> >>    * @shared_3d_lut: shared 3D LUT flag. Can be either DPP or MPC, but=
 single
> >>    * instance
> >>    * @ogam_rom_caps: pre-definied curve caps for regamma 1D LUT
> >> --
> >> 2.43.0
>
