Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 971A990A845
	for <lists+dri-devel@lfdr.de>; Mon, 17 Jun 2024 10:21:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 36C4A10E199;
	Mon, 17 Jun 2024 08:21:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="heGlY2D8";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B4F3810E199
 for <dri-devel@lists.freedesktop.org>; Mon, 17 Jun 2024 08:21:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1718612474;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=cTK/nSEc0sr9Zt54gC1HBI5EuJKjOx81XMNMXuBOuZM=;
 b=heGlY2D8y+UOBnTrDKk2AX8//JOpy9r/qO4RupDJtI+8RWmiY6LfRWnWj4THfSGbnKXzgx
 QAjcEmlyXXGTyfk4Xl3rmsjKjtTsYcyfzyBzIbLe7hVmdWEnmFy0yfvaoaYHh3XDEPPBm8
 8eeMs71b8xb1sgUYLUuCuahIxB/Q7zQ=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-180-Z9HG4j_7P4GSN7E2jyvL4A-1; Mon, 17 Jun 2024 04:21:13 -0400
X-MC-Unique: Z9HG4j_7P4GSN7E2jyvL4A-1
Received: by mail-wm1-f72.google.com with SMTP id
 5b1f17b1804b1-4210e98f8d7so6426965e9.3
 for <dri-devel@lists.freedesktop.org>; Mon, 17 Jun 2024 01:21:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1718612472; x=1719217272;
 h=mime-version:user-agent:content-transfer-encoding:references
 :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=cTK/nSEc0sr9Zt54gC1HBI5EuJKjOx81XMNMXuBOuZM=;
 b=w/P03pkfWxUbJguqJqsqyOpDqu5RNsBuKHDg06AhsKmA/buHmansT13fW0BoBwDI5O
 e6leik84Iukf4GbWvnAAox5gQqMTmz9vUxI13Lw1T3PVQ62JCuNdXpjEFDW8CxwBnhVJ
 gkjUjMjgVWdYz4dzswfxBu5qmsGJJGMQlsbbOepEzbki49bnsp/MfIIpzYn51PHVwx5A
 wNCHxFxm4r/zl1jIE4eXLSNgmzGCO5xuvZqvy+EnVkjWAa0/S9YSdSZ3aCLjJY7Bc5AP
 mjaCnpoVsWxo51r3SWPmbjUK5N273z0fM18b9FFg7wOjrxfVTGpwKIey28vFyarVqJr1
 g6xw==
X-Forwarded-Encrypted: i=1;
 AJvYcCW4CnqGkkN1jC89xbGhVRMwTDIhAl87X5EhvvOOFL+z73SY9pPyPy+KJQ2zFZqd0Gbl2DA4UVnJs6uWL6h3Dz7Aa59cQm9j2jqkmjTvZDty
X-Gm-Message-State: AOJu0YyMxPQJR7XnUI4I3sbflRjqfq2iKmnQzczm5OoPpfJ4ECGOPzw1
 uZky24Mr9d+ZzTEwKrqgw+QppBP6hRnka4ykP9rjeDgWzlXxhA3hWH/C26fVuNLYnxxe0Cu+tWg
 SfPGzQJvCskZJC3ZZinaumLJGBHvCVNc0q+n2I7g7+zeJJslTLEvBOorXiDZYMUYyZw==
X-Received: by 2002:a05:600c:3510:b0:421:7dc3:9a1d with SMTP id
 5b1f17b1804b1-42304855035mr66204755e9.4.1718612471939; 
 Mon, 17 Jun 2024 01:21:11 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG5EsN4snPVwwdJpY6BujEFyiznYI79kUxwQuEaA6q+Ugp50bjVUn6XOpisZtSD3pKxm3q1hw==
X-Received: by 2002:a05:600c:3510:b0:421:7dc3:9a1d with SMTP id
 5b1f17b1804b1-42304855035mr66204555e9.4.1718612471570; 
 Mon, 17 Jun 2024 01:21:11 -0700 (PDT)
Received: from pstanner-thinkpadt14sgen1.remote.csb
 (nat-pool-muc-t.redhat.com. [149.14.88.26])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-422870e95eesm189677815e9.25.2024.06.17.01.21.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 17 Jun 2024 01:21:11 -0700 (PDT)
Message-ID: <bdfd5c582e7b858d3f32428000d2268228beef5f.camel@redhat.com>
Subject: Re: [PATCH v9 10/13] PCI: Give pci_intx() its own devres callback
From: Philipp Stanner <pstanner@redhat.com>
To: Bjorn Helgaas <helgaas@kernel.org>
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Hans de Goede
 <hdegoede@redhat.com>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>,  Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
 Daniel Vetter <daniel@ffwll.ch>, Bjorn Helgaas <bhelgaas@google.com>, Sam
 Ravnborg <sam@ravnborg.org>,  dakr@redhat.com,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 linux-pci@vger.kernel.org
Date: Mon, 17 Jun 2024 10:21:10 +0200
In-Reply-To: <20240614161443.GA1115997@bhelgaas>
References: <20240614161443.GA1115997@bhelgaas>
User-Agent: Evolution 3.48.4 (3.48.4-1.fc38)
MIME-Version: 1.0
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, 2024-06-14 at 11:14 -0500, Bjorn Helgaas wrote:
> On Fri, Jun 14, 2024 at 10:09:46AM +0200, Philipp Stanner wrote:
> > On Thu, 2024-06-13 at 16:06 -0500, Bjorn Helgaas wrote:
> > > On Thu, Jun 13, 2024 at 01:50:23PM +0200, Philipp Stanner wrote:
> > > > pci_intx() is one of the functions that have "hybrid mode"
> > > > (i.e.,
> > > > sometimes managed, sometimes not). Providing a separate
> > > > pcim_intx()
> > > > function with its own device resource and cleanup callback
> > > > allows
> > > > for
> > > > removing further large parts of the legacy PCI devres
> > > > implementation.
> > > >=20
> > > > As in the region-request-functions, pci_intx() has to call into
> > > > its
> > > > managed counterpart for backwards compatibility.
> > > >=20
> > > > As pci_intx() is an outdated function, pcim_intx() shall not be
> > > > made
> > > > visible to drivers via a public API.
> > >=20
> > > What makes pci_intx() outdated?=C2=A0 If it's outdated, we should
> > > mention
> > > why and what the 30+ callers (including a couple in drivers/pci/)
> > > should use instead.
> >=20
> > That is 100% based on Andy Shevchenko's (+CC) statement back from
> > January 2024 a.D. [1]
> >=20
> > Apparently INTx is "old IRQ management" and should be done through
> > pci_alloc_irq_vectors() nowadays.
>=20
> Do we have pcim_ support for pci_alloc_irq_vectors()?

Nope.

All PCI devres functions that exist are now in pci/devres.c, except for
the hybrid functions (pci_intx() and everything calling
__pci_request_region()) in pci.c


P.

>=20
> > [1]
> > https://lore.kernel.org/all/ZabyY3csP0y-p7lb@surfacebook.localdomain/
>=20

