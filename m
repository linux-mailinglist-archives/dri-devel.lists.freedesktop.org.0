Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B3396700917
	for <lists+dri-devel@lfdr.de>; Fri, 12 May 2023 15:21:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C42BC10E6A2;
	Fri, 12 May 2023 13:21:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B400110E6A2
 for <dri-devel@lists.freedesktop.org>; Fri, 12 May 2023 13:21:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1683897680;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=4AlaRyQOy36sXdqy+JwhbCuIDwi8LlxpgbISw/CDPFM=;
 b=WVuFVWO6/FlQSCVBFPSJC0w1/VEBS0do9vDz6gEOk7BY/kXbJ95LDYOtcqNM3WjHSaCZvw
 q/dgJfGUO6xLvfizoSIiTsitotncXfuAFLv1jnZRfGTt6H0zQ0NrHOXe6e+urH9J6WHINu
 +MPeFTCgNTF61UxaqRCOdNs9ZQWVvng=
Received: from mail-ua1-f72.google.com (mail-ua1-f72.google.com
 [209.85.222.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-267-md1XdyVmMWaqtik4SfcqIA-1; Fri, 12 May 2023 09:21:19 -0400
X-MC-Unique: md1XdyVmMWaqtik4SfcqIA-1
Received: by mail-ua1-f72.google.com with SMTP id
 a1e0cc1a2514c-7756673b6bcso2530066241.0
 for <dri-devel@lists.freedesktop.org>; Fri, 12 May 2023 06:21:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683897679; x=1686489679;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=4AlaRyQOy36sXdqy+JwhbCuIDwi8LlxpgbISw/CDPFM=;
 b=N1eQpAEbggRVyZN59En7gskuNBcCeOC0XCmuFFECqYCfJZNKdvEl7lXpllc4GlmUP/
 tIUguFWcFstU3O/bgzIFLDJR/ofPJY7yaRZrBMNzA3pl6PBWrRUjjoIa9fyzow5SA0Gu
 53u4/R5whlDHjPB+M82IaVFX3p3f+sD1XwMMjC3fVnOzMUZ6yp2MbTn9V91U3LAw6akN
 wU90IVBLiGTnNcDL3m4ZKWGlHx1gYWEsF/FKHRQ32onlay3EAxEUWW9GcSqYwL6glruk
 h+pIodnmpSiPZ4a5AwdD5ZwgZ1ncCVS4QvHIptDoQftX8KXTQ83b/v0FbKxPaKunmq2N
 FXEg==
X-Gm-Message-State: AC+VfDzYbIDKfzN65p8XW/FvgIbZGHdM3XY1WwzI7jpAN9DXOrICp+HC
 mg/uN5YHjEHF4DmqheR75+9M3NipJEbXRI9JSlRT+5QxU6YnUAm4CawqUt7jfR8a3lbBpIsOdXB
 d6/gWGVYyvmfX5v6lbl19OKCivy3SRkg/21hIytK/fyfk
X-Received: by 2002:a67:ffd5:0:b0:434:69be:8495 with SMTP id
 w21-20020a67ffd5000000b0043469be8495mr9541637vsq.9.1683897678650; 
 Fri, 12 May 2023 06:21:18 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ56EVhPNDeIWeojbtIxhXDW0jsNAxPEwZjDUE5jSg6VIr1fyKKsgmU+sCABqffj01zeSX7annq0Y5IBzbAanRE=
X-Received: by 2002:a67:ffd5:0:b0:434:69be:8495 with SMTP id
 w21-20020a67ffd5000000b0043469be8495mr9541577vsq.9.1683897678350; Fri, 12 May
 2023 06:21:18 -0700 (PDT)
MIME-Version: 1.0
References: <20230512100620.36807-1-bagasdotme@gmail.com>
 <20230512100620.36807-10-bagasdotme@gmail.com>
In-Reply-To: <20230512100620.36807-10-bagasdotme@gmail.com>
From: Richard Fontana <rfontana@redhat.com>
Date: Fri, 12 May 2023 09:21:07 -0400
Message-ID: <CAC1cPGzSpMZC3oJOpzjqiEDvgWUszzSztMri6uxW6vZ7oZtD5w@mail.gmail.com>
Subject: Re: [PATCH v2 09/10] udf: Replace license notice with SPDX identifier
To: Bagas Sanjaya <bagasdotme@gmail.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
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
Cc: Kate Stewart <kstewart@linuxfoundation.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Simon Horman <simon.horman@corigine.com>,
 Dominik Brodowski <linux@dominikbrodowski.net>,
 Eric Dumazet <edumazet@google.com>, Robert Jarzmik <robert.jarzmik@free.fr>,
 Andy Gospodarek <andy@greyhouse.net>,
 Linux Staging Drivers <linux-staging@lists.linux.dev>,
 Linux SPDX Licenses <linux-spdx@vger.kernel.org>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Guenter Roeck <linux@roeck-us.net>, Sam Creasey <sammy@sammy.net>,
 Linux Watchdog Devices <linux-watchdog@vger.kernel.org>,
 Manivannan Sadhasivam <mani@kernel.org>, Jay Vosburgh <j.vosburgh@gmail.com>,
 Jan Kara <jack@suse.com>,
 Linux Kernel Actions <linux-actions@lists.infradead.org>,
 Haojian Zhuang <haojian.zhuang@gmail.com>,
 Linux DRI Development <dri-devel@lists.freedesktop.org>,
 David Airlie <airlied@redhat.com>, Thomas Gleixner <tglx@linutronix.de>,
 Wim Van Sebroeck <wim@linux-watchdog.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 Karsten Keil <isdn@linux-pingi.de>, Linux Networking <netdev@vger.kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 =?UTF-8?Q?Andreas_F=C3=A4rber?= <afaerber@suse.de>,
 Diederik de Haas <didi.debian@cknow.org>,
 Philippe Ombredanne <pombredanne@nexb.com>,
 =?UTF-8?Q?Pali_Roh=C3=A1r?= <pali@kernel.org>,
 "David S. Miller" <davem@davemloft.net>, Daniel Mack <daniel@zonque.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, May 12, 2023 at 6:07=E2=80=AFAM Bagas Sanjaya <bagasdotme@gmail.com=
> wrote:

> diff --git a/fs/udf/ecma_167.h b/fs/udf/ecma_167.h
> index de17a97e866742..b2b5bca45758df 100644
> --- a/fs/udf/ecma_167.h
> +++ b/fs/udf/ecma_167.h
> @@ -1,3 +1,4 @@
> +/* SPDX-License-Identifier: BSD-2-Clause OR GPL-1.0+ */
>  /*
>   * ecma_167.h
>   *
> @@ -8,29 +9,6 @@
>   * Copyright (c) 2017-2019  Pali Roh=C3=A1r <pali@kernel.org>
>   * All rights reserved.
>   *
> - * Redistribution and use in source and binary forms, with or without
> - * modification, are permitted provided that the following conditions
> - * are met:
> - * 1. Redistributions of source code must retain the above copyright
> - *    notice, this list of conditions, and the following disclaimer,
> - *    without modification.
> - * 2. The name of the author may not be used to endorse or promote produ=
cts
> - *    derived from this software without specific prior written permissi=
on.
> - *
> - * Alternatively, this software may be distributed under the terms of th=
e
> - * GNU Public License ("GPL").
> - *
> - * THIS SOFTWARE IS PROVIDED BY THE AUTHOR AND CONTRIBUTORS ``AS IS'' AN=
D
> - * ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE
> - * IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PU=
RPOSE
> - * ARE DISCLAIMED. IN NO EVENT SHALL THE AUTHOR OR CONTRIBUTORS BE LIABL=
E FOR
> - * ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIA=
L
> - * DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOO=
DS
> - * OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION)
> - * HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, S=
TRICT
> - * LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY=
 WAY
> - * OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY O=
F
> - * SUCH DAMAGE.
>   */

This is not BSD-2-Clause. Ignoring the interior statement about the
GPL, I think the closest SPDX identifier might be
https://spdx.org/licenses/BSD-Source-Code.html
but it doesn't quite match.


> diff --git a/fs/udf/osta_udf.h b/fs/udf/osta_udf.h
> index 157de0ec0cd530..6c09a4cb46f4a7 100644
> --- a/fs/udf/osta_udf.h
> +++ b/fs/udf/osta_udf.h
> @@ -1,3 +1,4 @@
> +/* SPDX-License-Identifier: BSD-2-Clause OR GPL-1.0+ */
>  /*
>   * osta_udf.h
>   *
> @@ -8,29 +9,6 @@
>   * Copyright (c) 2017-2019  Pali Roh=C3=A1r <pali@kernel.org>
>   * All rights reserved.
>   *
> - * Redistribution and use in source and binary forms, with or without
> - * modification, are permitted provided that the following conditions
> - * are met:
> - * 1. Redistributions of source code must retain the above copyright
> - *    notice, this list of conditions, and the following disclaimer,
> - *    without modification.
> - * 2. The name of the author may not be used to endorse or promote produ=
cts
> - *    derived from this software without specific prior written permissi=
on.
> - *
> - * Alternatively, this software may be distributed under the terms of th=
e
> - * GNU Public License ("GPL").
> - *
> - * THIS SOFTWARE IS PROVIDED BY THE AUTHOR AND CONTRIBUTORS ``AS IS'' AN=
D
> - * ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE
> - * IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PU=
RPOSE
> - * ARE DISCLAIMED. IN NO EVENT SHALL THE AUTHOR OR CONTRIBUTORS BE LIABL=
E FOR
> - * ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIA=
L
> - * DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOO=
DS
> - * OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION)
> - * HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, S=
TRICT
> - * LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY=
 WAY
> - * OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY O=
F
> - * SUCH DAMAGE.
>   */

Same comment - this is not BSD-2-Clause.

> diff --git a/fs/udf/udftime.c b/fs/udf/udftime.c
> index fce4ad976c8c29..d0fce5348fd3f3 100644
> --- a/fs/udf/udftime.c
> +++ b/fs/udf/udftime.c
> @@ -1,21 +1,4 @@
> -/* Copyright (C) 1993, 1994, 1995, 1996, 1997 Free Software Foundation, =
Inc.
> -   This file is part of the GNU C Library.
> -   Contributed by Paul Eggert (eggert@twinsun.com).
> -
> -   The GNU C Library is free software; you can redistribute it and/or
> -   modify it under the terms of the GNU Library General Public License a=
s
> -   published by the Free Software Foundation; either version 2 of the
> -   License, or (at your option) any later version.
> -
> -   The GNU C Library is distributed in the hope that it will be useful,
> -   but WITHOUT ANY WARRANTY; without even the implied warranty of
> -   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
> -   Library General Public License for more details.
> -
> -   You should have received a copy of the GNU Library General Public
> -   License along with the GNU C Library; see the file COPYING.LIB.  If n=
ot,
> -   write to the Free Software Foundation, Inc., 59 Temple Place - Suite =
330,
> -   Boston, MA 02111-1307, USA.  */
> +// SPDX-License-Identifier: GPL-2.0-only

Shouldn't this be
// SPDX-License-Identifier: LGPL-2.0-or-later ?
(or are you implicitly using the obscure LGPLv2.x section ... 3 mechanism?)

Richard

