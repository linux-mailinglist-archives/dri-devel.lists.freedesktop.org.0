Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F2D294ED0A
	for <lists+dri-devel@lfdr.de>; Mon, 12 Aug 2024 14:31:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7B72210E1E0;
	Mon, 12 Aug 2024 12:31:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.b="Vi2V2t/t";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com
 [209.85.208.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3ADF910E1DF
 for <dri-devel@lists.freedesktop.org>; Mon, 12 Aug 2024 12:31:16 +0000 (UTC)
Received: by mail-ed1-f49.google.com with SMTP id
 4fb4d7f45d1cf-5a28b61b880so13345a12.1
 for <dri-devel@lists.freedesktop.org>; Mon, 12 Aug 2024 05:31:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1723465874; x=1724070674;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=pMcseotHzw9w1/qyloEY2A3jvRku1lVZIU5xRt3H8hw=;
 b=Vi2V2t/tlwF05zvbietLUIyftFSwqKAvYXAlDXoc72e38nkYsIiS9aZ6DUdTgbPmiW
 fgbtKAgequojIOTfnLZEUwIpmCVDkvR4Gl87Klu2tgRYCo7RrI0UaJ4JAk3CvVaUbVxi
 hNc719j66WjsLBEY8oBNlOvrHoEuWEUVNwjMaFh+RtNzK7CRrP3qUP+WkMTYdYIcaycH
 UJ3c0MRS/NQgQ8/IaZ6aivQrk0bdOiVHhgsqU+i57h1dOW5QTOKL+8ami/DmBiDWCAMy
 ZiQ/GKQ4Vjo2KrHsAg08V8OpdfpMDYeGsp1BNdx3Xxt6ffyHs/u627ZOSbfB+zGXyvr+
 MITw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1723465874; x=1724070674;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=pMcseotHzw9w1/qyloEY2A3jvRku1lVZIU5xRt3H8hw=;
 b=ED7l+0gRCYyY1DpyY5WG8UzPU/gATUjbqek9EvYk69AajVZXRGyZPzqWl59oxd4TDF
 CPdNRGPLOEM01VfoFsyQFCaVAF/6Zj4B5v3PArUKhyqBohFFKRnGD8s15tHKKFAoOP08
 81NI0lwJmAHZnEdQgEm3/YueZUaFM/u/lp+cgv+yVrXWdNlL1qd5sxz5M2EpfPNSePEo
 3vweueezvHnEhvbyjxeQNmEpf0lrZjt7c/JRHgkvXlez3F1DQcywDMVkVreyUgO0i/iV
 T41tUiP17JaVXGmu9Y09W3hL7u8UVdey+Pw0PMg4aFHgBH/Bhp4NW5UCS6Ekq2Bq3fih
 HRAQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWjzS6M+cWJktI8i0YXgnzAsl7qxCDft+HE7wWc5/jv3xxRh4SICen+Ka6or0NfcyiKlqzTrzWTp1Qb0KH5uReAAmwLU0BL47+fvUVYtyYW
X-Gm-Message-State: AOJu0Yyjj0xFhycGNFbErbeXAL39oTj0nI2/Dl2Hmetry49wOSX+lq8c
 epVfVZoHjxvtZj3PKkDyH3CkcJm4H4EH3XAxRz2zh9s6ptlTWlxfUfxTG4UtX9pcnpCcp3yDze/
 zw/zL8TvapOLKov9Eylg0VQsDOZ+/+wa3M8WV
X-Google-Smtp-Source: AGHT+IFBkS0vaHhMDQbq1/kPkyc6ayYFZd2RvKz1caxrhyo6RSPUVPLYzq5t18fSiRJtwmNeDhl/Ww0R6fXnIZQ/4uI=
X-Received: by 2002:a05:6402:38c:b0:5bd:3fff:7196 with SMTP id
 4fb4d7f45d1cf-5bd3fff7289mr49160a12.6.1723465873929; Mon, 12 Aug 2024
 05:31:13 -0700 (PDT)
MIME-Version: 1.0
References: <20240805102554.154464-1-andi.shyti@linux.intel.com>
 <ZrFMopcHlT6G7p3V@ashyti-mobl2.lan> <2024080640-landfall-doozy-e0d2@gregkh>
 <ZrHw3y8QKPT87LxP@ashyti-mobl2.lan>
 <172294612086.38654.15621922821489001205@jlahtine-mobl.ger.corp.intel.com>
 <CAG48ez0P6juWnVL-m6A33X2GTsrm6CO4okN0s7Y_YT01yTqkrA@mail.gmail.com>
 <CAG48ez1PDJKd5gd932K9iknNg+V=mTmK5OMZys3OEXmKUTXxAw@mail.gmail.com>
 <172345433630.14739.7181647476623310397@jlahtine-mobl.ger.corp.intel.com>
In-Reply-To: <172345433630.14739.7181647476623310397@jlahtine-mobl.ger.corp.intel.com>
From: Jann Horn <jannh@google.com>
Date: Mon, 12 Aug 2024 14:30:37 +0200
Message-ID: <CAG48ez1=0PTvJUvaxzrzsA5f1ER4p93bvP1BWEmoR0KSCcz+kA@mail.gmail.com>
Subject: Re: [PATCH v2 0/2] Fix mmap memory boundary calculation
To: Joonas Lahtinen <joonas.lahtinen@linux.intel.com>
Cc: Andi Shyti <andi.shyti@linux.intel.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 intel-gfx <intel-gfx@lists.freedesktop.org>, 
 dri-devel <dri-devel@lists.freedesktop.org>,
 Jani Nikula <jani.nikula@linux.intel.com>, 
 Rodrigo Vivi <rodrigo.vivi@intel.com>, Tvrtko Ursulin <tursulin@ursulin.net>, 
 Chris Wilson <chris.p.wilson@linux.intel.com>, 
 Krzysztof Niemiec <krzysztof.niemiec@intel.com>,
 Andi Shyti <andi.shyti@kernel.org>
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

On Mon, Aug 12, 2024 at 11:19=E2=80=AFAM Joonas Lahtinen
<joonas.lahtinen@linux.intel.com> wrote:
> Quoting Jann Horn (2024-08-09 18:40:45)
> > On Fri, Aug 9, 2024 at 4:48=E2=80=AFPM Jann Horn <jannh@google.com> wro=
te:
> > > On Tue, Aug 6, 2024 at 2:08=E2=80=AFPM Joonas Lahtinen
> > > <joonas.lahtinen@linux.intel.com> wrote:
> > > > Quoting Andi Shyti (2024-08-06 12:46:07)
> > > > > Hi Greg,
> > > > >
> > > > > same question without the stable mailing list not to trigger the
> > > > > automatic reply.
> > > > >
> > > > > > Andi Shyti (2):
> > > > > >   drm/i915/gem: Adjust vma offset for framebuffer mmap offset
> > > > > >   drm/i915/gem: Fix Virtual Memory mapping boundaries calculati=
on
> > > > >
> > > > > I have forgotten to actually Cc the stable mailing list here.
> > > > > These two patches need to be merged together even if only the
> > > > > second patch has the "Fixes:" tag.
> > > > >
> > > > > I could have used the "Requires:" tag, but the commit id would
> > > > > change in between merges and rebases.
> > > >
> > > > The patches were the top two in drm-intel-gt-next and committed
> > > > only few hours ago so I fixed up the patches adding Cc: stable
> > > > and Requires:
> > >
> > > I'm not very familiar with how the DRM trees work - shouldn't fixes i=
n
> > > i915 go on the separate drm-intel-fixes branch so that they don't hav=
e
> > > to wait for a merge window?
> >
> > Ah, nevermind, I see it is already in drm-intel-fixes. Sorry for the no=
ise.
>
> Yeah, the DRM subsystem has a rather specific process.
>
> Jann, do you consider the fix released already now that it is in -rc3 or =
will
> you start the 30 day count from when 6.11 gets released? I hope the latte=
r,
> but just want to make sure there are no surprises.

I will count the issue as fixed and start the 30 day count starting
from when a fix lands in any upstream release - either a mainline
release or a stable release. Since the fix has now been queued up for
6.6 and 6.10, I expect that to happen in a few days.
