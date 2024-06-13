Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1BCC69063AE
	for <lists+dri-devel@lfdr.de>; Thu, 13 Jun 2024 08:00:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DEC4410E169;
	Thu, 13 Jun 2024 06:00:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="joHcNikW";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com
 [209.85.218.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BDAD510E0F1;
 Thu, 13 Jun 2024 06:00:46 +0000 (UTC)
Received: by mail-ej1-f43.google.com with SMTP id
 a640c23a62f3a-a6f1dc06298so71727366b.1; 
 Wed, 12 Jun 2024 23:00:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1718258445; x=1718863245; darn=lists.freedesktop.org;
 h=content-transfer-encoding:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=XkETNg3TjLcuapc1XDVyMeEIgeH7D2BgDPYHR4M0i+0=;
 b=joHcNikWO43nwdf1ENFF+1Ffs6nG/looefl/I5PFhVqvTnWA2BZDuKQBu6rT1rnxRS
 Fnmjr6VmkeW+lH1XShMAHvpCMvcNBJMAjJ7mOvy7c8/TFkQhONfB2lEdOq4nTMTGw+YY
 xVagF1v3wxo8S3GdZ23s831OG/cdZUQKvvVWqmdPaSz4hvDw9a+mPc3zcUgDDe2REDRm
 uNgx26ApLqMqFFuIX2cb3CrZlDhkPreUXz7hMnjmr7KQsGgItx9bQwJ165ZJSY64mbzI
 NyXBsIEtXVU0BQK2BZNR1+TUK3rrE6+xi45up6z8rh8UW6SQhoiPinYl7kM2+bNdgbb7
 s6HA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1718258445; x=1718863245;
 h=content-transfer-encoding:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=XkETNg3TjLcuapc1XDVyMeEIgeH7D2BgDPYHR4M0i+0=;
 b=Inw+YfQhFktBL7gW/p59cDG2mfJZMnDpvwon2Zo/DzTDXHmVSFvysDEUGNAod8i8a7
 P6v+pDKu9B643qP6CcTMkcfwN1GMKNIJk5zK78LNnt3MJa244Ks+rFNyBFLGeDPp08Xt
 n5A2rzcvtl7gATHu9SLMkLED1Zfoj9Uy1KVMdMlvHubEzLCyMxr5XswcQEPM5uBhjB8Z
 wDQ8FpUJGweBVihKQGZQv+VgrgxBeQPkHSlBJDmToZL/4Oypl7moQTsrM0Oittw0fsA/
 fSIVZbcmzrKpf0rOK4XAioxXWMIyKhji4pi5/tjSpypKERj+MZ3o+HD+ptqwJt6t8Epq
 LFcA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWrlDP0GrcII0GaE0Cj0n5B2OnVWIPCEPSCqb7lfyb3GDR7qona+KP6PSNzBPiNXacoEmZdKYITQ/WM9SQBWBX9HZ76+jkmQurh0eqDDp06qb5nNY/8gnB7uww5f/4DqOxjMf3DqWCGWw9AzxYAcA==
X-Gm-Message-State: AOJu0YxhwQl+Ax+ZbvITu84sa+PG4VydokCtvZP4KM9KDZBJXZOWFeQR
 Oyjc9EaRc9KTeysrcNrKThKRiT1sPreTt41XVxjWoW7ZxkK0xNDs4HxjKjae/JZZqPXQl0aLmJL
 yIFJ0wybyJNjGpihcHNEXozUanHI=
X-Google-Smtp-Source: AGHT+IGIz+nb7tUNhdmga5GH1WElCJmXV8gUV8SSU4YVGdNxpcJjnzYBS4s5RvopRuwx1geXDPCUSm7imojIvYBukaQ=
X-Received: by 2002:a17:907:7e96:b0:a69:d82c:167f with SMTP id
 a640c23a62f3a-a6f47c7d729mr285424366b.15.1718258444884; Wed, 12 Jun 2024
 23:00:44 -0700 (PDT)
MIME-Version: 1.0
References: <CAAxE2A7qK1-b5g1RR-GJ+QTLEr_OxEr9vcZGEOkZY9yLOFLb5w@mail.gmail.com>
In-Reply-To: <CAAxE2A7qK1-b5g1RR-GJ+QTLEr_OxEr9vcZGEOkZY9yLOFLb5w@mail.gmail.com>
From: =?UTF-8?B?TWFyZWsgT2zFocOhaw==?= <maraeo@gmail.com>
Date: Thu, 13 Jun 2024 02:00:08 -0400
Message-ID: <CAAxE2A6971oJ3r-8UWhL0BUZBiYxq4K0-Q39MJnb7ZozX3da-A@mail.gmail.com>
Subject: Re: "firmware/sysfb: Set firmware-framebuffer parent device" breaks
 lightdm on Ubuntu 22.04 using amdgpu
To: Thomas Zimmermann <tzimmermann@suse.de>, javierm@redhat.com,
 pjones@redhat.com, 
 deller@gmx.de, ardb@kernel.org, dri-devel <dri-devel@lists.freedesktop.org>, 
 linux-fbdev@vger.kernel.org, "Deucher, Alexander" <Alexander.Deucher@amd.com>, 
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
 amd-gfx mailing list <amd-gfx@lists.freedesktop.org>
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

+amd-gfx

On Thu, Jun 13, 2024 at 1:59=E2=80=AFAM Marek Ol=C5=A1=C3=A1k <maraeo@gmail=
.com> wrote:
>
> Hi Thomas,
>
> Commit 9eac534db0013aff9b9124985dab114600df9081 as per the title
> breaks (crashes?) lightdm (login screen) such that all I get is the
> terminal. It's also reproducible with tag v6.9 where the commit is
> present.
>
> Reverting the commit fixes lightdm. A workaround is to bypass lightdm
> by triggering auto-login. This is a bug report.
>
> (For AMD folks: It's also reproducible with amd-staging-drm-next.)
>
> Marek
