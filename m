Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B2D4190C4A6
	for <lists+dri-devel@lfdr.de>; Tue, 18 Jun 2024 09:56:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A1EDC10E5C2;
	Tue, 18 Jun 2024 07:56:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="MrlQNZru";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2565310E5C4
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Jun 2024 07:56:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1718697400;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=X7oXfGqsaROPIv0d321bPJMWdfKZBHlFilMIFo4qMew=;
 b=MrlQNZruF7xHb8vmBvrmi8hEoZ+Y4c+olT+NKe7sCRKOXVz78xqlYe12W6Rv6osHEzRG2K
 La7Pq0LZRWw1axqa5n580rB1i7x3PMtOxc99ZdWfCL7hfTvlNbp11a0ZX4zx42D1ws/qgh
 P75AnIpI9JEPOK31uOTiyGtUtcD3MlE=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-187-AinCcfW4MVentg5da4_M9A-1; Tue, 18 Jun 2024 03:56:39 -0400
X-MC-Unique: AinCcfW4MVentg5da4_M9A-1
Received: by mail-wm1-f71.google.com with SMTP id
 5b1f17b1804b1-4217f4b7355so5139655e9.3
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Jun 2024 00:56:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1718697398; x=1719302198;
 h=mime-version:user-agent:content-transfer-encoding:references
 :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=X7oXfGqsaROPIv0d321bPJMWdfKZBHlFilMIFo4qMew=;
 b=YsZ3nTMEX9J3TYZpaR27uDgIXGyFkbLxbWgW/WXSbyrvJjLgbVPKofJ6eEy1xUeIhA
 xMvSIc/VGzb82A8Lg4LteTjxk2i0ICzKqQPCz10zfa/oba7ArEz3WqQcDynipOdZ03mG
 ZU1a0EdI05d8EskOEzr5912uajEM5yqmA+XL34Ih3mdg0LPxsftPmHqjHo2bx7rmeYbz
 GfjuptuzqrIQcbDdNGNXYL1Ue9apzfgRYsN/JPhe3bmFqIzaS/EPDLZWFvHbB/RSAaAq
 NjBrGXz1ToL/ZZ4mLvC4IhCrRL4H5PFnPksTIsL5bRo9BhWO/M6rLBmnQIpEDn+mq/z8
 XCvA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXxl0URY34cqXAOH3UXF9Hcwo+xyCryRQIOd8ngrholtPfoOwXOG5yel6M+/AZdg8tLDBYgxVqTqqEY3zrX8msQDQ50UbD0AasfwDPlyw2S
X-Gm-Message-State: AOJu0YxT5tUZ91Qj/tX6AXrw52L8QWB4OsAomz01u8B5rH1Nb/ztintp
 yTjnbJ4M2oYeBYVm+WqZzqOJv/I1qeBGz1DgN3umhIBkqB6ak/enH5NeFmXVkQ8cxxa5QlztdPg
 hd69NXu5X1WOjQquS5pa/gublBsvIVt7pYD18LWy7NQ4ofYAZziU3TVQmmuioKRXOiQ==
X-Received: by 2002:a05:600c:4fc9:b0:422:2f06:92d1 with SMTP id
 5b1f17b1804b1-4230484ea73mr83190915e9.2.1718697398453; 
 Tue, 18 Jun 2024 00:56:38 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IElQg2MnML4c3e9aZwFA6IJ+FN0+5pNCUzrjPBudpNMYeXrjO8WNPBPXb35SYsoR8Fe93j85g==
X-Received: by 2002:a05:600c:4fc9:b0:422:2f06:92d1 with SMTP id
 5b1f17b1804b1-4230484ea73mr83190795e9.2.1718697398070; 
 Tue, 18 Jun 2024 00:56:38 -0700 (PDT)
Received: from pstanner-thinkpadt14sgen1.remote.csb
 (nat-pool-muc-t.redhat.com. [149.14.88.26])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-422f602e802sm181674215e9.11.2024.06.18.00.56.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 18 Jun 2024 00:56:37 -0700 (PDT)
Message-ID: <0d9fe3d3c52fa618b6c4e1d3414373b2e5417f32.camel@redhat.com>
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
Date: Tue, 18 Jun 2024 09:56:36 +0200
In-Reply-To: <20240617164604.GA1217529@bhelgaas>
References: <20240617164604.GA1217529@bhelgaas>
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

On Mon, 2024-06-17 at 11:46 -0500, Bjorn Helgaas wrote:
> On Mon, Jun 17, 2024 at 10:21:10AM +0200, Philipp Stanner wrote:
> > On Fri, 2024-06-14 at 11:14 -0500, Bjorn Helgaas wrote:
> > > On Fri, Jun 14, 2024 at 10:09:46AM +0200, Philipp Stanner wrote:
> > ...
>=20
> > > > Apparently INTx is "old IRQ management" and should be done
> > > > through
> > > > pci_alloc_irq_vectors() nowadays.
> > >=20
> > > Do we have pcim_ support for pci_alloc_irq_vectors()?
> >=20
> > Nope.
>=20
> Should we?=C2=A0 Or is IRQ support not amenable to devm?

I don't see why it wouldn't work, AFAIU you just register a callback
that deregisters the interrupts again.

This series here, though, stems from me trying to clean up drivers in
DRM. That's when I discovered that regions / IO-mappings (which I need)
are broken.

Adding further stuff to pci/devres.c is no problem at all and
independent from this series; one just has to add the code and call the
appropriate devm_ functions.

>=20
> Happened to see this new driver:
> https://lore.kernel.org/all/20240617100359.2550541-3-Basavaraj.Natikar@am=
d.com/
> that uses devm and the only PCI-related part of .remove() is cleaning
> up the IRQs.
>=20

OK. They also use pcim_iomap_table() and stuff. I think we should
inform about the deprecation.

I don't have a user for IRQ at hand for my DRM work right now. I'd try
to upstream new infrastructure we need there as I did for vboxvideo.


Gr=C3=BC=C3=9Fe,
P.

