Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 80DD391B1AD
	for <lists+dri-devel@lfdr.de>; Thu, 27 Jun 2024 23:49:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E14E810EB7A;
	Thu, 27 Jun 2024 21:48:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="ba2HDsfo";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com
 [209.85.218.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BFD8110EB73;
 Thu, 27 Jun 2024 21:48:51 +0000 (UTC)
Received: by mail-ej1-f42.google.com with SMTP id
 a640c23a62f3a-a6fe617966fso587611266b.1; 
 Thu, 27 Jun 2024 14:48:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1719524930; x=1720129730; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=qvcWPWbBwqzYeDqIw5utJrffIKs2IFkYEVA8lHtusD8=;
 b=ba2HDsfor0aUXydXU4/AJUpI7MculT/Bfii/+HLJGsnHjqOTRgk1XdnCyZ0KxvsbVI
 +WHmYR+JePj5yxqBL1t9G1OGKSnXFDnJFZBbbLyhfyKPG667JyKXrrTTBHzhmPpDR3+L
 kx9mb8k97GSARSZLeeeettP13TZpCWS4SppOP3kXfI9YqF9gDjGpDCeHBHZzervm/sK5
 XNYza/TOm1LbVj8Jjy9cWvvSgbsFGX4HZoyZfCtVM7i21lMjdnQOYs15RLhK9cWHugqP
 XLJw3fumUFVT3SNL2wG++jTEi+DhXSd7GoDUTk9EfgYAxINkla8RCShFiOCuHF9FjV/l
 tW5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1719524930; x=1720129730;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=qvcWPWbBwqzYeDqIw5utJrffIKs2IFkYEVA8lHtusD8=;
 b=c6pJouDoQ7ZEQiioL+7/YhgbN4xLpUa2wPsX4KnaK8yoQLFVKiI36OIQ8tkvMdgp2w
 ZWMT7V9K2H2ltRLiFATTiMAAf/Ig7BLXfpnhFsLq4zLopMan6aIltF2kRQ7cf1RuqSrp
 cKB1C/xiiiYRETdTLJC2+Zc1M1+Y55PdvMLEe3aW6dL3NAGCv7GJ3n5Ysq+D7p7YQXgG
 kEJ6VQ2nutNUhAHChPFA7q173U2Gc5XlcIJDoFfqh6nTuT19bCC9TYQKUA7ja4Y1c3Xd
 UswK9fa+on3YRf3l1iggWb7g1aCiMW8EtWnQIs3R8BEZqzKttK2JGXJLT1m257V5ADGO
 b8bQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXvLu59eWreecYAvvWz+laR8GOI3qAf2i4NTQN2d33uGP8z3Jq2KeW05+0POxiGqsI8BBfMohoGKEA304Hnlnjog51+BMHM81GbfEShu8WtjsYyzw5wS9QxMNSSl5yhu75h76s8QT1eQyEZ1+41GNb3
X-Gm-Message-State: AOJu0YyeEyYayd6ojy1xD0edcw91vaD/h7hy1oFrwKn+NJ19PHsZyrCi
 qaqvpR0uuUPRtaNduSRmxObc/gl2UTnovm63sxSaHLNsORv/o00TMwZwxa5/2liAdgxhqnJ3mQh
 U/oANuaMW80U3krhe+LdNVWsbBUQ=
X-Google-Smtp-Source: AGHT+IFpJU8uB/MBlWdlk571JSevPy7jsouP3iTjIUSJXgLnC6XZaJDjXM/sxBFN3lwwss1qcQJg/DUzwF44Pd3Iuks=
X-Received: by 2002:a17:907:1605:b0:a72:8b89:f879 with SMTP id
 a640c23a62f3a-a728b8a0175mr476175866b.68.1719524929687; Thu, 27 Jun 2024
 14:48:49 -0700 (PDT)
MIME-Version: 1.0
References: <20240612141239.141ce8cc@canb.auug.org.au>
 <ZnCMUEd9dQ6bLNet@intel.com>
In-Reply-To: <ZnCMUEd9dQ6bLNet@intel.com>
From: Dave Airlie <airlied@gmail.com>
Date: Fri, 28 Jun 2024 07:48:38 +1000
Message-ID: <CAPM=9tyNGA2wEgnsKdSyjHRGVikywZLdueZj=syTMFYEUNzxhw@mail.gmail.com>
Subject: Re: linux-next: build failure after merge of the drm-intel tree
To: Rodrigo Vivi <rodrigo.vivi@intel.com>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>,
 Daniel Vetter <daniel.vetter@ffwll.ch>, 
 Jani Nikula <jani.nikula@linux.intel.com>, 
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>, 
 Mitul Golani <mitulkumar.ajitkumar.golani@intel.com>, 
 Suraj Kandpal <suraj.kandpal@intel.com>,
 Intel Graphics <intel-gfx@lists.freedesktop.org>, 
 DRI <dri-devel@lists.freedesktop.org>, 
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
 Linux Next Mailing List <linux-next@vger.kernel.org>
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

On Tue, 18 Jun 2024 at 05:26, Rodrigo Vivi <rodrigo.vivi@intel.com> wrote:
>
> On Wed, Jun 12, 2024 at 02:12:39PM +1000, Stephen Rothwell wrote:
> > Hi all,
> >
> > After merging the drm-intel tree, today's linux-next build (i386
> > defconfig) failed like this:
> >
> > x86_64-linux-gnu-ld: drivers/gpu/drm/i915/display/intel_vrr.o: in funct=
ion `intel_vrr_compute_config':
> > intel_vrr.c:(.text+0x4e4): undefined reference to `__udivdi3'
> >
> > Caused by commit
> >
> >   1676ecd303ac ("drm/i915: Compute CMRR and calculate vtotal")
> >
> > I have reverted that commit for today.
>
> the fixes for that is available in drm-intel-next now. you should probabl=
y
> remove the revert.
>
> Thanks for the heads up on that.

In file included from
/home/airlied/devel/kernel/dim/src/arch/arm/include/asm/div64.h:107,
                 from /home/airlied/devel/kernel/dim/src/include/linux/math=
.h:6,
                 from
/home/airlied/devel/kernel/dim/src/include/linux/kernel.h:27,
                 from
/home/airlied/devel/kernel/dim/src/include/linux/cpumask.h:11,
                 from /home/airlied/devel/kernel/dim/src/include/linux/smp.=
h:13,
                 from
/home/airlied/devel/kernel/dim/src/include/linux/lockdep.h:14,
                 from
/home/airlied/devel/kernel/dim/src/include/linux/spinlock.h:63,
                 from
/home/airlied/devel/kernel/dim/src/include/linux/kref.h:16,
                 from
/home/airlied/devel/kernel/dim/src/include/drm/drm_device.h:5,
                 from
/home/airlied/devel/kernel/dim/src/include/drm/drm_drv.h:35,
                 from
/home/airlied/devel/kernel/dim/src/drivers/gpu/drm/xe/compat-i915-headers/i=
915_drv.h:13,
                 from
/home/airlied/devel/kernel/dim/src/drivers/gpu/drm/i915/display/intel_vrr.c=
:7:
/home/airlied/devel/kernel/dim/src/drivers/gpu/drm/i915/display/intel_vrr.c=
:
In function =E2=80=98cmrr_get_vtotal=E2=80=99:
/home/airlied/devel/kernel/dim/src/include/asm-generic/div64.h:222:35:
warning: comparison of distinct pointer types lacks a cast
  222 |         (void)(((typeof((n)) *)0) =3D=3D ((uint64_t *)0));  \
      |                                   ^~
/home/airlied/devel/kernel/dim/src/drivers/gpu/drm/i915/display/intel_vrr.c=
:155:35:
note: in expansion of macro =E2=80=98do_div=E2=80=99
  155 |         crtc_state->cmrr.cmrr_m =3D do_div(adjusted_pixel_rate,
crtc_state->cmrr.cmrr_n);
      |                                   ^~~~~~

The fixes might need some more fixing, 32-bit arm build.

Dave.

>
> >
> > --
> > Cheers,
> > Stephen Rothwell
>
>
