Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A2871906469
	for <lists+dri-devel@lfdr.de>; Thu, 13 Jun 2024 08:51:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A415610E299;
	Thu, 13 Jun 2024 06:51:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="JoAzxBX4";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AEA3D10E299
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Jun 2024 06:51:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1718261469;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=dCYSl6m4zIwH4JbW6vfy7hbe96U8QsTjiiAI04n+hHg=;
 b=JoAzxBX4Odb5UwJnY/3oa9O1NqoGR0Cvz9GfsftU9UyZFUE6KvVXbf9wqAWK1vhGsIKOGW
 /ogb1ONJDGOxIM84H5pkWdUAHkxDVIRdi9CWjEzX1VwpE317DMYhWgPw41/somJZu+/8gH
 0nwD+rT1p8wbzZS3w8lM8HF+OMdDkJg=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-362-e2_zTiYaMvCpcI7d3twq-A-1; Thu, 13 Jun 2024 02:51:05 -0400
X-MC-Unique: e2_zTiYaMvCpcI7d3twq-A-1
Received: by mail-wr1-f70.google.com with SMTP id
 ffacd0b85a97d-35f2ae13e4eso111098f8f.2
 for <dri-devel@lists.freedesktop.org>; Wed, 12 Jun 2024 23:51:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1718261464; x=1718866264;
 h=mime-version:user-agent:content-transfer-encoding:references
 :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=dCYSl6m4zIwH4JbW6vfy7hbe96U8QsTjiiAI04n+hHg=;
 b=QGPZoHQT10EjSv9I8grId7m/u2A75M0sRV1I/sCM8RndSYU15avHcnpbry3VGqp18V
 agazvYa78F2PjRho9+3BoXDHNqw74IBVDjhHANR94ZKoEXJcitXNdVFxn5InSApVpwum
 KHHfQwlDr3BtV96n+RISOvK0PaL6p/J303CBWVAqITETgZh9tukEfFvCuitDvIwA00Nd
 wwgg9Ezwdyqz2QNcXG2YlSSO8SL22PSSjj5h++1mlW2LGpXyuHkTvt0bqryQG3Qs/pQH
 8+lAuTfwaNWEGyA5yx9xKAAEhTzK0nEdAgJS5dewsDszSIOcNx6J6lurO6pJF9ZI1naA
 chfg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUIUdHfsL8ftAd8ZX1jSvggsplvzmI3mLKx9Oz9BRF6eN6qfnA5mjKRSZMc3gY1xmd61TH9Ad1V1gU=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyudrnRKdx+3eO1WCKg4BcoywFLAYDqFoPhMAfMVzVDmx1BiIHK
 ozCum8um/en8EKa8VtKDqCvlsSTK9k200PEewS0ussHBetulnbZlUDOTL9NqZt4GRfgzOzDdbJI
 dZiPH6EjYjpqYwPMYOGcW8NZD88P3do/DL0jALPD1bew07kTYyoQ7AcnlnU1njvhJvQ==
X-Received: by 2002:a05:600c:511c:b0:421:7f30:7ccb with SMTP id
 5b1f17b1804b1-422863a85d2mr28530845e9.1.1718261464151; 
 Wed, 12 Jun 2024 23:51:04 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEne33eg3SL5vDGQDj3JXJ9FvT7/47jv8TG8IqrLLqDZjm0NwnmBgsExGCfn22f4gGdxb3/Tg==
X-Received: by 2002:a05:600c:511c:b0:421:7f30:7ccb with SMTP id
 5b1f17b1804b1-422863a85d2mr28530655e9.1.1718261463751; 
 Wed, 12 Jun 2024 23:51:03 -0700 (PDT)
Received: from pstanner-thinkpadt14sgen1.remote.csb
 (nat-pool-muc-t.redhat.com. [149.14.88.26])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-422874de607sm49767315e9.34.2024.06.12.23.51.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 12 Jun 2024 23:51:03 -0700 (PDT)
Message-ID: <ef32b9184700a07048fbb387f7d42410f7db308d.camel@redhat.com>
Subject: Re: [PATCH v8 03/13] PCI: Reimplement plural devres functions
From: Philipp Stanner <pstanner@redhat.com>
To: Bjorn Helgaas <helgaas@kernel.org>
Cc: Hans de Goede <hdegoede@redhat.com>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Bjorn Helgaas <bhelgaas@google.com>, Sam
 Ravnborg <sam@ravnborg.org>, dakr@redhat.com, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 linux-pci@vger.kernel.org
Date: Thu, 13 Jun 2024 08:51:02 +0200
In-Reply-To: <20240612204235.GA1037175@bhelgaas>
References: <20240612204235.GA1037175@bhelgaas>
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

On Wed, 2024-06-12 at 15:42 -0500, Bjorn Helgaas wrote:
> On Wed, Jun 12, 2024 at 10:51:40AM +0200, Philipp Stanner wrote:
> > On Tue, 2024-06-11 at 16:44 -0500, Bjorn Helgaas wrote:
> > > I'm trying to merge these into pci/next, but I'm having a hard
> > > time
> > > writing the merge commit log.=C2=A0 I want a one-sentence description
> > > of
> > > each patch that tells me what the benefit of the patch is.=C2=A0
> > > Usually
> > > the subject line is a good start.
> > >=20
> > > "Reimplement plural devres functions" is kind of vague and
> > > doesn't
> > > quite motivate this patch, and I'm having a hard time extracting
> > > the
> > > relevant details from the commit log below.
> >=20
> > I would say that the summary would be something along the lines:
> > "Set ground layer for devres simplification and extension"
> >=20
> > because this patch simplifies the existing functions and adds
> > infrastructure that can later be used to deprecate the bloated
> > existing
> > functions, remove the hybrid mechanism and add pcim_iomap_range().
>=20
> I think something concrete like "Add partial-BAR devres support"
> would
> give people a hint about what to look for.

Okay, will do.

>=20
> This patch contains quite a bit more than that, and if it were
> possible, it might be nice to split the rest to a different patch,
> but
> I'm not sure it's even possible=C2=A0

I tried and got screamed at by the build chain because of dead code. So
I don't really think they can be split more, unfortunately.

In possibly following series's to PCI I'll pay attention to design
things as atomically as possible from the start.


> and I just want to get this series out
> the door.

That's actually something you and I have in common. I have been working
on the preparations for this since November last year ^^'

>=20
> If the commit log includes the partial-BAR idea and the specific
> functions added, I think that will hold together.=C2=A0 And then it makes
> sense for why the "plural" functions would be implemented on top of
> the "singular" ones.
>=20
> > > > Implement a set of singular functions=20
> > >=20
> > > What is this set of functions?=C2=A0 My guess is below.
> > >=20
> > > > that use devres as it's intended and
> > > > use those singular functions to reimplement the plural
> > > > functions.
> > >=20
> > > What does "as it's intended" mean?=C2=A0 Too nebulous to fit here.
> >=20
> > Well, the idea behind devres is that you allocate a device resource
> > _for each_ object you want to be freed / deinitialized
> > automatically.
> > One devres object per driver / subsystem object, one devres
> > callback
> > per cleanup job for the driver / subsystem.
> >=20
> > What PCI devres did instead was to use just ONE devres object _for
> > everything_ and then it had to implement all sorts of checks to
> > check
> > which sub-resource this master resource is actually about:
> >=20
> > (from devres.c)
> > static void pcim_release(struct device *gendev, void *res)
> > {
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0struct pci_dev *dev =3D=
 to_pci_dev(gendev);
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0struct pci_devres *this=
 =3D res;
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0int i;
> >=20
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0for (i =3D 0; i < DEVIC=
E_COUNT_RESOURCE; i++)
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0if (this->region_mask & (1 << i))
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
pci_release_region(dev, i);
> >=20
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0if (this->mwi)
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0pci_clear_mwi(dev);
> >=20
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0if (this->restore_intx)
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0pci_intx(dev, this->orig_intx);
> >=20
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0if (this->enabled && !t=
his->pinned)
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0pci_disable_device(dev);
> > }
> >=20
> >=20
> > So one could dare to say that devres was partially re-implemented
> > on
> > top of devres.
> >=20
> > The for-loop and the if-conditions constitute that "re-
> > implementation".
> > No one has any clue why it has been done that way, because it
> > provides
> > 0 upsides and would have been far easier to implement by just
> > letting
> > devres do its job.
> >=20
> > Would you like to see the above details in the commit message?
>=20
> No.=C2=A0 Just remove the "use devres as it's intended" since that's not
> needed to motivate this patch.=C2=A0 I think we need fewer and
> more-specific words.

ACK. I will rework it


Thank you Bjorn for your time and effort,

P.


>=20
> Bjorn
>=20

