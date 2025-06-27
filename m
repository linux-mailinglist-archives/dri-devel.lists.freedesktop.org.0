Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4BBAEAEB6AE
	for <lists+dri-devel@lfdr.de>; Fri, 27 Jun 2025 13:41:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 19CAE10E9CF;
	Fri, 27 Jun 2025 11:41:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="i5ZmV/Ee";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com
 [209.85.216.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9EBE710E9CF
 for <dri-devel@lists.freedesktop.org>; Fri, 27 Jun 2025 11:41:35 +0000 (UTC)
Received: by mail-pj1-f45.google.com with SMTP id
 98e67ed59e1d1-313290ea247so365292a91.3
 for <dri-devel@lists.freedesktop.org>; Fri, 27 Jun 2025 04:41:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1751024494; x=1751629294; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=C1Owfq+XsKZjeFo4Rbc6Jmea/9OoeGFSrEDZpKoNuLo=;
 b=i5ZmV/EewkTKqFWQohsTuAVdvU9c+a7oDgUpSxdWagfvkftXUnh9PuPMesRqmn+WWH
 rbyyJRBIiFRvCipSBrnURaLmFbEZWgFxr6ZX+pG1KVGC64GAI2SjPnuDKln4klEg8Jp0
 gDk0q9dtY2+UaAINGa9dEsCkVD3tEnDkxojgREN/P1ukqV45osgyhbUoMNq8Udd1QQtR
 PpJjxnt/6aIohZ4GTJZSMBOrq+yrnye4lMvHXir4aATQ48nroA8t6CFNX2ugeQ9G0rYc
 7Sa0tPEzDNl6cV47rCPBlIfylBX34ZY2PXK9bNhnDm/aAq/qrTKACNouZdG/2MDqz2+A
 KEjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1751024494; x=1751629294;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=C1Owfq+XsKZjeFo4Rbc6Jmea/9OoeGFSrEDZpKoNuLo=;
 b=Fa+I4lRKEWJRkh8jAeGaURRj2t9GJsH7kQqWkZ6ss/PiKxmqDksnr6QZ+3f+YrlT/A
 ZPXCkbNDQ2SnTnq1OFdHaVgR/Om3tq/GqMpkl+aAlJt1a3HeZORtdr3kx+p4ZEf/wFgf
 j/3zz24EDJeT52i/t518i7Er3NHihCJRghZpy0SUrwDCJgDg9IVz5+6QL/cQRCwZoFJ1
 NLEeq2S2K2WAFyBM5bSS2bOCRanKoFNPNKMldiPluAwUKwXDcn0cyruzCg6T3LGsnI2m
 34LN/xXmA57w1bcHfHdijApv/YXicvgm9hA6x6vWbyrRIuUuG6oq69zSvW9FwwVfn5MV
 Nu0A==
X-Forwarded-Encrypted: i=1;
 AJvYcCWNGINoMdHuCgv/OHKwqAW0cNWO68HlvjZ3GCDbSirt3+N6A8zYS0UNvG5vciMT4IVa1cdvuzMJgn0=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzHpRfQmv5RoAPwH/ijcNwUsrB2lxT6do/Dko9fW1WSsoPDIlpF
 7nn79lhHb83Z6QHI+r8wMMz+PU+/U2vB8O6BV4DZJrTnR3H39nLWxpGGyXIcA4atK5eTz1rv6Xh
 ofqfdxxJkIEjjvxJiIzztuONn5MNh1ms=
X-Gm-Gg: ASbGncuoqOd0AZjXIVRZ1zAmbqdCw9X23ZaGfS3423qO5y181PY/VPgGUDOKHbifwuP
 Vl3huFuphJJSNihXfOKeXA/XYV7SPDbE+Aaa2P182HbLsfbwBmea4F7aABsEe3aIPhi2kRQs8jr
 TwAVfbHugZ2pw68y7SEUEqZm4kZNjVPyJ8Cf0jVQd2vPk=
X-Google-Smtp-Source: AGHT+IG8n1NOnknKBTekE7vnR1XZkOXx0mEMZtruOLeNGcJGxu3gdqRfXX3Z5Qct26maroyKX+owpGbM/jJPtPBbXcc=
X-Received: by 2002:a17:90a:d603:b0:314:2d38:3e4d with SMTP id
 98e67ed59e1d1-318c9287ef6mr1305213a91.3.1751024494204; Fri, 27 Jun 2025
 04:41:34 -0700 (PDT)
MIME-Version: 1.0
References: <20250627094102.770689-1-jfalempe@redhat.com>
 <CAH5fLgimktQmU6d24o3QVDBX90OD5E4wdnvLoNhk_gtpbUhXMA@mail.gmail.com>
In-Reply-To: <CAH5fLgimktQmU6d24o3QVDBX90OD5E4wdnvLoNhk_gtpbUhXMA@mail.gmail.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Fri, 27 Jun 2025 13:41:22 +0200
X-Gm-Features: Ac12FXyNnLJjU7yVipjpDFcYwETTceoP6829PBNtIQGzkhDaRmCtl_5xyFpFqGY
Message-ID: <CANiq72mmX6Bg8WhyMteuv5jnv9QwkfsypReZhTKp_i=bV+5hjA@mail.gmail.com>
Subject: Re: [PATCH] drm/panic: Add a u64 divide by 10 for arm32
To: Alice Ryhl <aliceryhl@google.com>
Cc: Jocelyn Falempe <jfalempe@redhat.com>,
 Andrei Lalaev <andrey.lalaev@gmail.com>, 
 Miguel Ojeda <ojeda@kernel.org>, Christian Schrefl <chrisi.schrefl@gmail.com>, 
 Arnd Bergmann <arnd@arndb.de>, Russell King <linux@armlinux.org.uk>, 
 Paolo Bonzini <pbonzini@redhat.com>,
 rust-for-linux <rust-for-linux@vger.kernel.org>, 
 Linux ARM <linux-arm-kernel@lists.infradead.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>,
 Javier Martinez Canillas <javierm@redhat.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 dri-devel@lists.freedesktop.org
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

On Fri, Jun 27, 2025 at 1:37=E2=80=AFPM Alice Ryhl <aliceryhl@google.com> w=
rote:
>
> I would get rid of this conditional and declare another div10 function
> that just does input/10 on other arches.

Yeah, please keep `cfg`s as local as possible, i.e. inside the
implementation of the function where possible, so that we share even
the signature etc., e.g.

    https://lore.kernel.org/rust-for-linux/20250625051518.15255-6-boqun.fen=
g@gmail.com/

Cheers,
Miguel
