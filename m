Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F7208C6F0F
	for <lists+dri-devel@lfdr.de>; Thu, 16 May 2024 01:18:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 03AC910E0E9;
	Wed, 15 May 2024 23:17:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="WQCcTpRo";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com
 [209.85.218.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1FFD510E0E9
 for <dri-devel@lists.freedesktop.org>; Wed, 15 May 2024 23:17:56 +0000 (UTC)
Received: by mail-ej1-f51.google.com with SMTP id
 a640c23a62f3a-a59a5f81af4so228275466b.3
 for <dri-devel@lists.freedesktop.org>; Wed, 15 May 2024 16:17:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1715815074; x=1716419874; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=KQkiI/PZoB2oJorTHLYz0xoOjUhSuDugXleksLOQ91w=;
 b=WQCcTpRoAmwL9izhSLq1lm0c0g6U9mjEY5+ofXrF0Wlsh8fOkJw+e8PT9M56yHPT1G
 ic72Vf9X4l9QiYRbDn3z2xNwCzYZ3OlqnEmxdWxC1mXOxp8dAjyPaX3aAz8V94Elh5rQ
 dVlz/QfVXSpv6Leb0WMwdgFpdZzAqPHfNt5WiAEM6bP19GHmM+AL7xqNHFuxlxVCg0I8
 xfmqdC5bzqHozVVmSF8ABr1KZ/WQ8TM1lmL5BuCbyfkaY7o8FOnpvlDEOZtVz+I/doyp
 eZoBtkfHL1aY47ks2+qX/aLkeYQM4nVas3ksOagSsihru/ORqCqDvVr5L9CzZibRClWZ
 6L3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1715815074; x=1716419874;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=KQkiI/PZoB2oJorTHLYz0xoOjUhSuDugXleksLOQ91w=;
 b=qEhXPcnJqtbEDxal06aSOCN4IoWnywVQZRA7SgX9EUO817HiiHQnypFCO4A2ibG+qZ
 fN0t4C0/WJ2ILZQoSU+dc1z2vozcn9dgBrLEQxXI3kXobaIKZs6fDh9e4mH4fcruubAq
 mjtc2YBgotgoGdXbidHtFazex4GAYq5cmgD1MQDOWUDQsSINGyYX59lgvzviLjpDxULQ
 XBuCIKrz/zmkem4UeB2bV+BBAvv5N/zE/Z+CQDN8wxMPydzKEzoxdrniXB1tdrNaJtyc
 YIYEsPU6HyB82b0gS+Apw2cL8pMIj1RYA3zBUca4WOnFxLGef8QPEl2tX6BoKJCV0vx1
 3WUA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXzPNJnB2rdk1XcYZuG7LUSl1bFfUk9V572Lng21G5K3BLE0D8R/ESl5PFOtwO4VdSC14G65KdAiyn4c02I6EbXvoURVeAd2xOStGlO9gwN
X-Gm-Message-State: AOJu0Yxtcoi0e3VxQX8MDwNpc05m0xNooiQw5sSt3/Bql5ENhkOVAcJQ
 I4R4ZIJtB31VZAU8b7RDXXvWKETI/4CPF3vA5ABPEpt44LqdjeCeMVAAn5ZJPRNbt1YiZ2YBqK+
 NIaV81OUHhWdq9q1lcFa4rUhU0Pw=
X-Google-Smtp-Source: AGHT+IHuo2WCZvG3HdUyqPlEEQPeV4QkDD96yJ7fXtu9aQhRZOLuTLsMoRXsGUMrONerqPk1SEO9VdQuEio5vRe/IjA=
X-Received: by 2002:a17:906:2b0d:b0:a59:be21:3575 with SMTP id
 a640c23a62f3a-a5a2d672ee4mr1259988066b.51.1715815074233; Wed, 15 May 2024
 16:17:54 -0700 (PDT)
MIME-Version: 1.0
References: <CAPM=9tw-53PCvveRcdLUUQ+mjq2X2er5zp6n1KeE8Nu8x=VP2g@mail.gmail.com>
 <CAHk-=whxT8D_0j=bjtrvj-O=VEOjn6GW8GK4j2V+BiDUntZKAQ@mail.gmail.com>
 <CAPM=9tyOtH24Mw_2X+bgV9iChOQV3LtmRCoR5x6KXhSUD6FjUg@mail.gmail.com>
 <CAHk-=wh8DWSMrtuhZOzanfBCFcuJCihO9x7fkzx-dBhLddXF-Q@mail.gmail.com>
In-Reply-To: <CAHk-=wh8DWSMrtuhZOzanfBCFcuJCihO9x7fkzx-dBhLddXF-Q@mail.gmail.com>
From: Dave Airlie <airlied@gmail.com>
Date: Thu, 16 May 2024 09:17:42 +1000
Message-ID: <CAPM=9twCVkx9OqndCcvjjgx+P7ixBRwttiz25-R=bkycEo5vrQ@mail.gmail.com>
Subject: Re: [git pull] drm for 6.10-rc1
To: Linus Torvalds <torvalds@linux-foundation.org>, 
 Jani Nikula <jani.nikula@linux.intel.com>
Cc: Jani Nikula <jani.nikula@intel.com>, Daniel Vetter <daniel.vetter@ffwll.ch>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 LKML <linux-kernel@vger.kernel.org>
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

On Thu, 16 May 2024 at 08:56, Linus Torvalds
<torvalds@linux-foundation.org> wrote:
>
> On Wed, 15 May 2024 at 15:45, Dave Airlie <airlied@gmail.com> wrote:
> >
> >           The drm subsystem enables more warnings than the kernel default, so
> >           this config option is disabled by default.
>
> Irrelevant.
>
> If the *main* CONFIG_WERROR is on, then it does NOT MATTER if somebody
> sets CONFIG_DRM_WERROR or not. It's a no-op. It's pointless.
>
> And that means that it's also entirely pointless to ask. It's only annoying.
>
> > depends on DRM && EXPERT
> >
> > so we aren't throwing it at random users.
>
> Yes you are.
>
> Because - rightly or wrongly - distros enable EXPERT by default. At
> least Fedora does. So any user that starts from a distro config will
> have EXPERT enabled.
>
> > should we rename it CONFIG_DRM_WERROR_MORE or something?
>
> Renaming does nothing. If it's pointless, it's pointless even if it's renamed.
>
> It needs to have a
>
>    depends on !WERROR
>
> because if WERROR is already true, then it's stupid and wrong to ask AGAIN.
>
> To summarize: if the main WERROR is enabled, then the DRM tree is
> *ALREADY* built with WERROR. Asking for DRM_WERROR is wrong.
>
> I keep harping on bad config variables because our kernel config thing
> is already much too messy and is by far the most difficult part of
> building your own kernel.
>
> Everything else is literally just "make" followed by "make
> modules_install" and "make install". Very straightforward.
>
> But doing a kernel config? Nasty. And made nastier by bad and
> nonsensical questions.

It's also possible it's just that hey there's a few others in the tree

KVM_WERROR not tied to it
PPC_WERROR (why does CXL uses this?)
AMDGPU, I915 and XE all have !COMPILE_TEST on their variants

We should probably add !WERROR to all of these at this point.

Adding Jani who was the initial author of

commit f89632a9e5fa6c4787c14458cd42a9ef42025434
Author: Jani Nikula <jani.nikula@intel.com>
Date:   Tue Mar 5 11:07:36 2024 +0200

    drm: Add CONFIG_DRM_WERROR

where I see we actually removed the !COMPILE_TEST check in v2.

Dave.
