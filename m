Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C8207700892
	for <lists+dri-devel@lfdr.de>; Fri, 12 May 2023 15:03:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B1B7B10E69C;
	Fri, 12 May 2023 13:03:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 204CD10E69A
 for <dri-devel@lists.freedesktop.org>; Fri, 12 May 2023 13:03:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1683896625;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=7vyYqKowntrH5TESdu+nnql3fraQEOqrTs1VN1eLvlA=;
 b=KIUMt6k+mEpfTCRhEWgzyyNLBcPrSNCd0NWAvnosd5HNPECnQ4muQ+BLw0NaUStk4PxSbH
 foq773bEVYQOvUxMW1ZHXdpEJsRvbtiqE/TrjtfxuqlEr5zz+pS2x1SybUL4uCu5dFCQDe
 qPF/+x+aU3UVaCTklldeEpyyvmzzkzM=
Received: from mail-yb1-f199.google.com (mail-yb1-f199.google.com
 [209.85.219.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-671-do8jA_axNdCZggMOKX-3dw-1; Fri, 12 May 2023 09:03:43 -0400
X-MC-Unique: do8jA_axNdCZggMOKX-3dw-1
Received: by mail-yb1-f199.google.com with SMTP id
 3f1490d57ef6-b8f6bef3d4aso19456693276.0
 for <dri-devel@lists.freedesktop.org>; Fri, 12 May 2023 06:03:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683896623; x=1686488623;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=7vyYqKowntrH5TESdu+nnql3fraQEOqrTs1VN1eLvlA=;
 b=mH4w7SJSIFwcGmL7exSLSCaTOdN2sofl4a+EW7fWDDZsI1QxcejzK/n18LUomtRvBK
 cLpg86UPs3o8GecBYXkGHmFIxu31Uo+mowmY5/1QFd1jx3sF9ImvLmTgLO/eF3pGvRgn
 tTOyTjS2V8h9Gt+ZZwq6Hapr3CwdoVwldL0ICYnsUITROuXiI3lAFzISAWCPJeEGJNiq
 JEsN2xrx+mXatXfbVA2T6Es4Z+sG34nosmUpSCUp2rUQ7wqyKzsZ6lPEWGY/CWXRkVd+
 8SG1qOxzsewWYtci2jyK6BUYwO04nMPi4hZZQjR6sZD8azlXKobCBE3uFolRbwGdUZ9j
 jfdQ==
X-Gm-Message-State: AC+VfDxk+7sf4CAgK5gdxjY+Bh0jOTB0rXi3WwymR6oVUcWVsZwP6BbR
 735UujhuJow6xorVg7aCXM2EEyZvWRKMNgMJ/lKoCEUv32iD6JdbssTm5crd1ioD8dA6hQ51XiE
 uKM9bjeER6dGx4H2xDNbl1Paiwrw8KGt6KECs7UHOtffr
X-Received: by 2002:a05:7500:e56a:b0:105:7a07:8604 with SMTP id
 rh42-20020a057500e56a00b001057a078604mr943448gab.61.1683896622974; 
 Fri, 12 May 2023 06:03:42 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ5dVexvddLUcjN/zVlZgJrAoivqibOPzux2/Wn/gjHcLQ5Nb6s+25KWtNakTprxdBljBky3vIfmIcNIUXqFI88=
X-Received: by 2002:a05:7500:e56a:b0:105:7a07:8604 with SMTP id
 rh42-20020a057500e56a00b001057a078604mr943377gab.61.1683896622432; Fri, 12
 May 2023 06:03:42 -0700 (PDT)
MIME-Version: 1.0
References: <20230512100620.36807-1-bagasdotme@gmail.com>
 <20230512100620.36807-5-bagasdotme@gmail.com>
In-Reply-To: <20230512100620.36807-5-bagasdotme@gmail.com>
From: Richard Fontana <rfontana@redhat.com>
Date: Fri, 12 May 2023 09:03:31 -0400
Message-ID: <CAC1cPGxxOhmQS6J9tDCSaaaMEAgpCVRv2XpndyNnyEfvUKcQoA@mail.gmail.com>
Subject: Re: [PATCH v2 04/10] net: ethernet: 8390: Replace GPL boilerplate
 with SPDX identifier
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
 Eric Dumazet <edumazet@google.com>,
 "David A . Hinds" <dahinds@users.sourceforge.net>,
 Robert Jarzmik <robert.jarzmik@free.fr>, Greg Ungerer <gerg@linux-m68k.org>,
 Andy Gospodarek <andy@greyhouse.net>, Bruce Abbott <bhabbott@inhb.co.nz>,
 Topi Kanerva <topi@susanna.oulu.fi>,
 Linux Staging Drivers <linux-staging@lists.linux.dev>,
 Linux SPDX Licenses <linux-spdx@vger.kernel.org>,
 Peter De Schrijver <p2@mind.be>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, Guenter Roeck <linux@roeck-us.net>,
 Sam Creasey <sammy@sammy.net>, Donald Becker <becker@scyld.com>,
 Alain Malek <Alain.Malek@cryogen.com>,
 Linux Watchdog Devices <linux-watchdog@vger.kernel.org>,
 Manivannan Sadhasivam <mani@kernel.org>, Jay Vosburgh <j.vosburgh@gmail.com>,
 Jan Kara <jack@suse.com>,
 Linux Kernel Actions <linux-actions@lists.infradead.org>,
 Haojian Zhuang <haojian.zhuang@gmail.com>,
 Linux DRI Development <dri-devel@lists.freedesktop.org>,
 David Airlie <airlied@redhat.com>, Thomas Gleixner <tglx@linutronix.de>,
 Wim Van Sebroeck <wim@linux-watchdog.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 Alan Cox <alan@linux.intel.com>, Karsten Keil <isdn@linux-pingi.de>,
 Linux Networking <netdev@vger.kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 =?UTF-8?Q?Andreas_F=C3=A4rber?= <afaerber@suse.de>,
 Diederik de Haas <didi.debian@cknow.org>,
 Philippe Ombredanne <pombredanne@nexb.com>,
 "David S. Miller" <davem@davemloft.net>, Daniel Mack <daniel@zonque.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, May 12, 2023 at 6:07=E2=80=AFAM Bagas Sanjaya <bagasdotme@gmail.com=
> wrote:
>
> Replace GPL boilerplate notice on remaining files with appropriate SPDX
> tag. For files mentioning COPYING, use GPL 2.0; otherwise GPL 1.0+.

> diff --git a/drivers/net/ethernet/8390/ne2k-pci.c b/drivers/net/ethernet/=
8390/ne2k-pci.c
> index 6a0a2039600a0a..ea3488e81c5f3c 100644
> --- a/drivers/net/ethernet/8390/ne2k-pci.c
> +++ b/drivers/net/ethernet/8390/ne2k-pci.c
> @@ -1,3 +1,4 @@
> +// SPDX-License-Identifier: GPL-1.0+
>  /* A Linux device driver for PCI NE2000 clones.
>   *
>   * Authors and other copyright holders:
> @@ -6,13 +7,6 @@
>   * Copyright 1993 assigned to the United States Government as represente=
d
>   * by the Director, National Security Agency.
>   *
> - * This software may be used and distributed according to the terms of
> - * the GNU General Public License (GPL), incorporated herein by referenc=
e.
> - * Drivers based on or derived from this code fall under the GPL and mus=
t
> - * retain the authorship, copyright and license notice.  This file is no=
t
> - * a complete program and may only be used when the entire operating
> - * system is licensed under the GPL.

I don't think you should delete those last two sentences.

"Drivers based on or derived from this code fall under the GPL and must
retain the authorship, copyright and license notice."

The notice has:

 * Authors and other copyright holders:
 * 1992-2000 by Donald Becker, NE2000 core and various modifications.
 * 1995-1998 by Paul Gortmaker, core modifications and PCI support.
 * Copyright 1993 assigned to the United States Government as represented
 * by the Director, National Security Agency.

Nothing in the GPL requires retention of "authorship", as some other
licenses do (you can argue that GPLv2 conflates authorship with
copyright ownership, but this sentence seems to distinguish
"authorship" from "copyright" as does the listing of authors). There
is (arguably) a tradition of treating extra author attribution
requirements as legitimate, but if you view them as extra requirements
you can't, or shouldn't, just remove them arbitrarily.

Then there's this:

"This file is not a complete program and may only be used when the
entire operating system is licensed under the GPL."

Whether or not that's a correct statement of GPL interpretation
(perhaps it depends on the meaning of "entire operating system"), it's
significant enough as a nonstandard interpretive comment that I think
you should probably not remove it.

Richard

