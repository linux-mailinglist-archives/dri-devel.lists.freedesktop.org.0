Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 67321AC1FE8
	for <lists+dri-devel@lfdr.de>; Fri, 23 May 2025 11:42:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D05F410E7B8;
	Fri, 23 May 2025 09:42:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="JhCs1/Am";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com
 [209.85.214.180])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 94D2310E7B8
 for <dri-devel@lists.freedesktop.org>; Fri, 23 May 2025 09:42:43 +0000 (UTC)
Received: by mail-pl1-f180.google.com with SMTP id
 d9443c01a7336-232219cc6d0so3835735ad.0
 for <dri-devel@lists.freedesktop.org>; Fri, 23 May 2025 02:42:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1747993363; x=1748598163; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=xuYOwYNKkjdOui7VOKdqHSaUlWRq94p5a/W5tYRRzKs=;
 b=JhCs1/AmP3ZL938sPgMWRds/2f63LHAg5dS/2pWuATOiUOO7mmQcLA/wL3fOcLjQZx
 ihyqzeU/bPd4f6Z9n2Ny8cPIOph0AnsplIZdFC8nt4lj3FWZUXUbza+VZYjkQOMBPbhr
 /Zie26KdZ+kVzUD1nzSmigtuBJ0wwrUOQHIBvuiHFQUWfusu093CqSswVKeLujDJU4wP
 ay8eb4heGKHHUfl2AZZ9ydv1COqX0jp+F+nSgryBU8gam5vleQwF9IxKc1RSOYPVGWc2
 adiu8BPxzEgCixtYkOQiX67DDhpp/BjQ/gdn1Woe7WlA1vs8gfyfakBYqfZqcjQkV8qu
 VoVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1747993363; x=1748598163;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=xuYOwYNKkjdOui7VOKdqHSaUlWRq94p5a/W5tYRRzKs=;
 b=UVush66cim2i4Ux2XYaufiIA5wj8vkknWv7WOlfRWlylnMsVXoymj/zaJu6P/bV2bh
 YsM+ZJnWW9t2xZWT+Mf4ZpsBd0wWBcYE96R+EJEU/iyP3rQrevvYbYbLQIIy6l2oKvFe
 D7hHoe7lxo5IGPByCMq0cUZSyTi+fZGf4i5MIwkS3Cw7K+dSvwgLGPA6UVwRs2A1lpUu
 F7+ut7bkIEiSG71ljGgwaiTPa1caOmZ4lQqSJnagebvcm9iIYGSlPhH+O4wXPLOq7k2e
 PS9W1dBR49NvIoQID2pL/DoeKwcZ/VDv46EQtEK6BC8WW5R6jOiCTrvdFvMmSQXnUPGX
 WXBw==
X-Forwarded-Encrypted: i=1;
 AJvYcCX4pzWvRMuAmPlOdpEnXHpC5HX6D+x8Ui+H6yP9lR8+BtwZFUtenCKHcu8bfH4GuI9yHmhyAVJRxhA=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yyir+H9dRyg/5PvlUgBoFxfGtRMPeWZAXGQbwh7OaQVvju1hu0n
 JW9lcmR/3HVpDJUp5KjDU6yeNOplDVTNW3q8kSFBxL19yFb7O9naHcjn3BtMF3EW2NOdeZ3elNn
 yuKWwI6Cx52kgWo4MvgMgbJi+JHaUs9U=
X-Gm-Gg: ASbGncvWnkn0h+3D6wJCNvMGBpP9e8DO/y58cIHpXIrA4457A3hP9lO4V0b+48ZPZix
 cQz3W0lTqo7RNTBz7YDsvJfQts9erT4Akk5gnK7hVRi9GBLlVAgEjwaLfsOHmxdPQ3mbyGeo6QC
 Jeq/BSrZVzHtU0DX57O+Bx/AvlFS4pSCHZ
X-Google-Smtp-Source: AGHT+IFe4aaL/Mp0H070EexcfB77wVMFn2+CLwqQYYEiTAgH1Pomvmo/SRpI1wyZnAbR19rOKvsY4ac93WCFcorj+hM=
X-Received: by 2002:a17:903:1aec:b0:216:30f9:93c5 with SMTP id
 d9443c01a7336-233f3667693mr10262275ad.6.1747993362953; Fri, 23 May 2025
 02:42:42 -0700 (PDT)
MIME-Version: 1.0
References: <20250523161352.20f0589a@canb.auug.org.au>
In-Reply-To: <20250523161352.20f0589a@canb.auug.org.au>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Fri, 23 May 2025 11:42:30 +0200
X-Gm-Features: AX0GCFuVagKgyX9ZdyEuk7oU823a5UTijwUK6Yx4xSHdAX67f5__CmWx2DVQEvk
Message-ID: <CANiq72=Oi2DXMG1U439RHYbCgRAN9L5d-0Dkaffi1d=mec5LTg@mail.gmail.com>
Subject: Re: linux-next: manual merge of the rust tree with the drm tree
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Miguel Ojeda <ojeda@kernel.org>, Dave Airlie <airlied@redhat.com>, 
 Andreas Hindborg <a.hindborg@kernel.org>,
 Asahi Lina <lina+kernel@asahilina.net>, 
 Danilo Krummrich <dakr@kernel.org>, DRI <dri-devel@lists.freedesktop.org>, 
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
 Linux Next Mailing List <linux-next@vger.kernel.org>,
 Tamir Duberstein <tamird@gmail.com>
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

On Fri, May 23, 2025 at 8:14=E2=80=AFAM Stephen Rothwell <sfr@canb.auug.org=
.au> wrote:
>
> I fixed it up (see below) and can carry the fix as necessary. This
> is now fixed as far as linux-next is concerned, but any non trivial
> conflicts should be mentioned to your upstream maintainer when your tree
> is submitted for merging.  You may also want to consider cooperating
> with the maintainer of the conflicting tree to minimise any particularly
> complex conflicts.

Looks OK to me, thanks!

Cheers,
Miguel
