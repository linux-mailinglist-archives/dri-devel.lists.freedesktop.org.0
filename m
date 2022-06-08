Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 81A7E54394F
	for <lists+dri-devel@lfdr.de>; Wed,  8 Jun 2022 18:44:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A0239112723;
	Wed,  8 Jun 2022 16:44:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-x736.google.com (mail-qk1-x736.google.com
 [IPv6:2607:f8b0:4864:20::736])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 609021126D9
 for <dri-devel@lists.freedesktop.org>; Wed,  8 Jun 2022 16:44:15 +0000 (UTC)
Received: by mail-qk1-x736.google.com with SMTP id 15so10715499qki.6
 for <dri-devel@lists.freedesktop.org>; Wed, 08 Jun 2022 09:44:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=OKe+1ryBcU5wu+GneAOFpMolJT5gcjQvw+XTgGCe/hU=;
 b=huoYm4nYtKhyzF5CNXfpbIhEWsLEpDpRIhEtY14/dYnVkEtH8rYfpLy4P3y9w+2xXA
 Q8aHhATX2gU2E3iKPxh6cZaJas7bmS7NcC1LU8hckdFLPvgld0Z0G4VD2CbG4kLcbRi3
 4RwnQ++KHfyBH98d2R6cvxz7S69z/glJtL58JCITDIzoaXBGjVn8DyJX3vJss3aiEZzO
 E0bJrX1UvWC0Pml6c49XYjkKME/u8Ytp0RIkMXLgHK45W5IO48PuiNU2zNmYLIItWoKY
 COl3RiPg57lOmW9lYyyPYJPvaB0ts/fGttIv/IVKVo8h96F1lnV/DM3IPs2uFBTnh6VC
 wWyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=OKe+1ryBcU5wu+GneAOFpMolJT5gcjQvw+XTgGCe/hU=;
 b=QUrJK7H/E6HHafiF0YYIvnFNBa7DG74oK6WpO3PqmJZRC97xyzQpsJc3UfDC939pkM
 RRJoNl/zNJJA21tIXwZfL/6rmDRYeNl38RjgvzmMMLpa14Duqr+Bd/wEw9xwiL/9AbXO
 UTv+UCtCdBEbvfXnm0P+sHXbML1Z1VvodfultXPqizGfGoPzHQ4dwgz8C1HAYRitpHfv
 5PdW3Np2BrPZeGK0DTUrzfQiqzh6GzPfY7pZQ6G5b7T2SLiN5wlSVAaGtS9Q4URVOF86
 CbQoT7Zz4hmUxYz+9H21gs+uUU4uaUA3aS2MrUTKcB3QZJra/CwPbxx/2QKeyVnf7YeU
 jw3Q==
X-Gm-Message-State: AOAM531M34De6QhXey3+5dmhqug3rrMEp7k0voIz14AII1c7mHV/fUTl
 Mp84jctq8Ntpn7oNa+Wl6iMrFuLfoquf+AuCMVA=
X-Google-Smtp-Source: ABdhPJzNwxYrdy1kh0h3N3xUMS/invcRFbV/o+ic3nTzr2Q5cw3mBdJzapX7q93D6AtDdpHIIBjdtCh7DZrV8G6W5gY=
X-Received: by 2002:a37:a1c4:0:b0:6a6:ac4f:1d3f with SMTP id
 k187-20020a37a1c4000000b006a6ac4f1d3fmr15597451qke.666.1654706654377; Wed, 08
 Jun 2022 09:44:14 -0700 (PDT)
MIME-Version: 1.0
References: <20220605094018.9782-1-r.stratiienko@gmail.com>
 <5826286.lOV4Wx5bFT@jernej-laptop>
 <CAGphcdm=sOyppe8sAYMK6aeRXpxiHvj-h-Es6nigCNKBxdBNZQ@mail.gmail.com>
 <20220608081715.cblotjle6benihal@houat>
In-Reply-To: <20220608081715.cblotjle6benihal@houat>
From: Roman Stratiienko <r.stratiienko@gmail.com>
Date: Wed, 8 Jun 2022 19:44:03 +0300
Message-ID: <CAGphcdnz-fJUrtGoYXzmaCHd5rGR98_0e33a26Uh55c63Lh_rQ@mail.gmail.com>
Subject: Re: [PATCH v2] drm/sun4i: Enable output signal premultiplication for
 DE2/DE3
To: Maxime Ripard <maxime@cerno.tech>
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
Cc: Samuel Holland <samuel@sholland.org>, airlied@linux.ie,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, wens@csie.org,
 megi@xff.cz, =?UTF-8?Q?Jernej_=C5=A0krabec?= <jernej.skrabec@gmail.com>,
 linux-sunxi@lists.linux.dev, linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

=D1=81=D1=80, 8 =D0=B8=D1=8E=D0=BD. 2022 =D0=B3. =D0=B2 11:17, Maxime Ripar=
d <maxime@cerno.tech>:
>
> On Mon, Jun 06, 2022 at 01:16:06PM +0300, Roman Stratiienko wrote:
> > =D0=B2=D1=81, 5 =D0=B8=D1=8E=D0=BD. 2022 =D0=B3. =D0=B2 23:23, Jernej =
=C5=A0krabec <jernej.skrabec@gmail.com>:
> > >
> > > Dne nedelja, 05. junij 2022 ob 11:40:18 CEST je Roman Stratiienko nap=
isal(a):
> > > > Otherwise alpha value is discarded, resulting incorrect pixel
> > > > apperance on the display.
> > > >
> > > > This also fixes missing transparency for the most bottom layer.
> > >
> > > Can you explain that a bit more?
> >
> > Well... I would recommend reading Bartosz Ciechanowski's blog
> > https://ciechanow.ski/alpha-compositing/ or the Porter-Duff's 1984
> > whitepaper itself.
> >
> > HINT: That magic numbers from sun8i_mixer.h ( 0x03010301 ) corresponds
> > to SOURCE OVER mode.
> >
> > As you can see from the blending equation it outputs both pixel value
> > and alpha value (non-premultiplied data mode).
> >
> > Also single-layer non-premultiplied buffers may have for example
> > (R255,G255,B255,A2) pixel value, which should be sent as {R2, G2, B2}
> > through the physical display interface.
> >
> > When OUTCTL.PREMULTI disabled pixel, the RGB values passes as is, and
> > even 100% transparent data {R255, G255, B255, A0} will appear as 100%
> > opaque white.
>
> Without going into the full explanation about what alpha is, your commit
> log must describe what the bug is exactly, and most importantly how do
> you trigger it.

I do not understand what you want me to add. I checked alpha
appearance manually by
preparing framebuffers with data and presenting it on the display in
various combinations.

I attached the videos and tests as a proof. If you don't believe me
you can always check.

If you find something missing in the commit message or don't like to
see external links feel
free to amend it. From my point of view the patch is complete.

>
> Maxime

Roman
