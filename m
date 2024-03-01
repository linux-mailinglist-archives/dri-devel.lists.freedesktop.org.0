Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C7BE886DE49
	for <lists+dri-devel@lfdr.de>; Fri,  1 Mar 2024 10:29:51 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 281EA10EC41;
	Fri,  1 Mar 2024 09:29:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="AOrKCdQU";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4CC1B10EC41
 for <dri-devel@lists.freedesktop.org>; Fri,  1 Mar 2024 09:29:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1709285388;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=xUzguapjnO/ASwX7eqgiIKisU9asefIceRf+xZr60sc=;
 b=AOrKCdQUUAfIH00xqpFkWmKc0kcT+16tRVEBZQcVunfVz9ZK5pdRpAApctfwFIXwGCvBQZ
 YpePhJ6m1i29TQlI6YgWqVE4ZA9l8EJZ66G2wrCL4KZ8QjGc7yiVRI4lTa0t2h8UsEMtM+
 jBD/voDUMvTkgavehmv7vMZjjI77WbY=
Received: from mail-yb1-f200.google.com (mail-yb1-f200.google.com
 [209.85.219.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-530-DKVXjPAaMuumj8EyQ82jhg-1; Fri, 01 Mar 2024 04:29:46 -0500
X-MC-Unique: DKVXjPAaMuumj8EyQ82jhg-1
Received: by mail-yb1-f200.google.com with SMTP id
 3f1490d57ef6-dcdb00ff6e0so612828276.0
 for <dri-devel@lists.freedesktop.org>; Fri, 01 Mar 2024 01:29:46 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1709285386; x=1709890186;
 h=mime-version:user-agent:content-transfer-encoding:references
 :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=xUzguapjnO/ASwX7eqgiIKisU9asefIceRf+xZr60sc=;
 b=Y6YyFyBEYuIfYtXJdMDSSUVTTiBVD7HoKEbRMpMUBfMnDOjgc6CISzN6c1RBEaYedr
 Pg21TuLeYVDmkduR4MW7NffqrO5eY4ryZsnf/gn8yzfJosAMER20FHnnUTEWc2fLjhb0
 umJrpjwJEfU3pyXTMO6mvooXm0bWrO5xYe2OBu7X4IB7NybHIZLcVcOKhBr5m/MMl/yx
 nCvjdduCQUyBL8/FzAohWc50F8jYHkbn0gms2HKWKN+yMuCEZLm7PkWk+Z5f6nf2iLeG
 vSCQFf8Ccp1jlHaGAqGGMO66hhV+TNyhYVRIbtCwfJNqwC5FzPgrcMgdEPmV+O4hdC9n
 lLkA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWGnWNmlniT8lefFC7UKj/bDqEl1adJr+ycwJRyYqvTEc58YK2cXX/anl+3l/6FAD2gp2if4F54oiCUCDnHgAKFmkH1ObWmYZl7KdsP4fIq
X-Gm-Message-State: AOJu0Ywh+9AL3b41V+mCvux4pCtaiAyF4QrpxW8N5wNvhbbl461CagtR
 D5EPGhEcFml0Mr6E3BUeplxodWBOxuc3kpbiS3IjzGBcfJnEE9wyLPt+uQQ2Q/laG5pjq2VPF+T
 KnLplQ7qkH7dkVDjXNG1IApNEpJd/dpOfzLik065hoG/36ZmdxtVCw98NvvivrhJQrg==
X-Received: by 2002:a25:820a:0:b0:dcc:8617:d6da with SMTP id
 q10-20020a25820a000000b00dcc8617d6damr764221ybk.4.1709285386076; 
 Fri, 01 Mar 2024 01:29:46 -0800 (PST)
X-Google-Smtp-Source: AGHT+IF2RdbWeJU69WfSLJ6KahAECor/gofhdJ9ItLhUg99VOwuO3lZOaOjqitHJwv+Y3BImlFdLbQ==
X-Received: by 2002:a25:820a:0:b0:dcc:8617:d6da with SMTP id
 q10-20020a25820a000000b00dcc8617d6damr764203ybk.4.1709285385721; 
 Fri, 01 Mar 2024 01:29:45 -0800 (PST)
Received: from pstanner-thinkpadt14sgen1.remote.csb
 (nat-pool-muc-t.redhat.com. [149.14.88.26])
 by smtp.gmail.com with ESMTPSA id
 c3-20020ac87dc3000000b0042dac47e9b4sm1549107qte.5.2024.03.01.01.29.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 01 Mar 2024 01:29:45 -0800 (PST)
Message-ID: <7158e09386f0345d2e87ea5433dabf38db027971.camel@redhat.com>
Subject: Re: [PATCH v3 00/10] Make PCI's devres API more consistent
From: Philipp Stanner <pstanner@redhat.com>
To: Bjorn Helgaas <helgaas@kernel.org>
Cc: Hans de Goede <hdegoede@redhat.com>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Bjorn Helgaas <bhelgaas@google.com>, Sam
 Ravnborg <sam@ravnborg.org>, dakr@redhat.com, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 linux-pci@vger.kernel.org
Date: Fri, 01 Mar 2024 10:29:42 +0100
In-Reply-To: <20240229205715.GA362688@bhelgaas>
References: <20240229205715.GA362688@bhelgaas>
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

On Thu, 2024-02-29 at 14:57 -0600, Bjorn Helgaas wrote:
> On Thu, Feb 29, 2024 at 09:31:20AM +0100, Philipp Stanner wrote:
> > @Bjorn:
> > Hey Bjorn, are we good with this series? Any more wishes or
> > suggestions?
>=20
> Sorry, haven't had a chance to go through it yet.=C2=A0=20
>=20
> FWIW, I just tried to apply these on top of pci/devres, but it failed
> here:
>=20
> =C2=A0 Applying: PCI: Add new set of devres functions
> =C2=A0 Applying: PCI: Deprecate iomap-table functions
> =C2=A0 Applying: PCI: Warn users about complicated devres nature
> =C2=A0 Applying: PCI: Make devres region requests consistent
> =C2=A0 Applying: PCI: Move dev-enabled status bit to struct pci_dev
> =C2=A0 error: patch failed: drivers/pci/pci.h:811
> =C2=A0 error: drivers/pci/pci.h: patch does not apply
> =C2=A0 Patch failed at 0005 PCI: Move dev-enabled status bit to struct
> pci_dev
>=20
> Haven't investigated, so maybe it's some trivial easily fixed thing.

For me, based on Linus's master, this applies with the previous series.

It seems to me that this issue only exists on linux-next, the reason
being that git searches for struct pci_devres in line 811, but on
linux-next, because of previous additions, the struct moved to line
827, and poor git can't find it anymore.

I could fix that and provide a v4.


P.


>=20
> Bjorn
>=20

