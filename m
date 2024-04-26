Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F7408B31A4
	for <lists+dri-devel@lfdr.de>; Fri, 26 Apr 2024 09:45:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AF545112271;
	Fri, 26 Apr 2024 07:45:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="QHp2kBlZ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8C75A112271
 for <dri-devel@lists.freedesktop.org>; Fri, 26 Apr 2024 07:45:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1714117513;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=rUd+NDHbSv3c2fwov86iAf1+ncoc84+vbeTpHpltIo0=;
 b=QHp2kBlZKNpOelLZl9lOi8lsVKfxxKcVJYpJkCLYIZtz6vYbl1ZkxsHErL/6J85Ckb5MN5
 MFrxPvhCiCMXFmSDGOvxV0Sjoc7Yei2EVZyPbxwNobiXNDDz4dHoAKpwvO5reewjobeAyh
 YHOveA4Q9+IIxZAjEmiZNosAnQvasIo=
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com
 [209.85.222.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-202-qZ4JSDheNaicOAcsS3ZolQ-1; Fri, 26 Apr 2024 03:45:08 -0400
X-MC-Unique: qZ4JSDheNaicOAcsS3ZolQ-1
Received: by mail-qk1-f199.google.com with SMTP id
 af79cd13be357-78f01938556so808385a.2
 for <dri-devel@lists.freedesktop.org>; Fri, 26 Apr 2024 00:45:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1714117508; x=1714722308;
 h=mime-version:user-agent:content-transfer-encoding:references
 :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=rUd+NDHbSv3c2fwov86iAf1+ncoc84+vbeTpHpltIo0=;
 b=rb4p2ckE5NGKOyVgqrch9Se0w29EOtVYN7rBKiQLBKDNV9vz5vrWA50ivWDGIchCIm
 fzbVXicyjMdQ+IEwAn+T228s1wMue2fecnJ3HCTaT8GbS+3wCCBLt5q9gQNnh3SW9FsN
 Xn91Nq6u9cca6NsNzn6IW+7dw2WkUNnk7FRzbVKprNSI+CEUwqtOuKYrmLzi+U6xikZ1
 xK0xoaSGfz9eFCyNQav95ZLdfas6T7/2ZLpqDCL2TCkWStAYXHTOeD1MQEahUMF9fFje
 qDyGu2nxKVMB3rX4vDHpxz2tWD0w4khry7jwx9I2PzXHz0shIaSIpOoF+9W4W9thgUgf
 Qzsw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUqxWJ/IJHU0rRTZho2m/bVAlxtjiGsHaorPXfD4zeFB5ic+Lb0pCYsVGmAUkKfNGzA5rYhLFZ8UaBS6in6jxVlDb5IdotIy+rXJIn132Ai
X-Gm-Message-State: AOJu0Yx+APrOJB1T7Zjc19VOtz6KLENKUsfNQ0FhZklaL+zVjVPZLLTW
 ado8f4ncE3SSUjFT8IC6mVytFa3KArfprZLumHORKRrU05GCFB5ssVZZkfQR+tj2KmkDf7pA4qB
 a7FclxY2Ah9JzLzJpYMrvWyie73IpbgKobD56upfcKJ5L1qb9/ohHLqANhbk2/kaJ5A==
X-Received: by 2002:a05:620a:1998:b0:790:b14a:f3b2 with SMTP id
 bm24-20020a05620a199800b00790b14af3b2mr268120qkb.0.1714117508089; 
 Fri, 26 Apr 2024 00:45:08 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGBpIQQ4Cw0i6lKebwdcfxqWo1Ele2lBbNOsET58txmVyPf0uijghKM0MhFbnu1UARMdDHjxg==
X-Received: by 2002:a05:620a:1998:b0:790:b14a:f3b2 with SMTP id
 bm24-20020a05620a199800b00790b14af3b2mr268091qkb.0.1714117507816; 
 Fri, 26 Apr 2024 00:45:07 -0700 (PDT)
Received: from pstanner-thinkpadt14sgen1.remote.csb
 (nat-pool-muc-t.redhat.com. [149.14.88.26])
 by smtp.gmail.com with ESMTPSA id
 f10-20020a05620a15aa00b0079061110054sm5937871qkk.13.2024.04.26.00.45.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 26 Apr 2024 00:45:07 -0700 (PDT)
Message-ID: <e36256905e924df9690202671e1797d6214592df.camel@redhat.com>
Subject: Re: [PATCH v6 04/10] PCI: Make devres region requests consistent
From: Philipp Stanner <pstanner@redhat.com>
To: Bjorn Helgaas <helgaas@kernel.org>
Cc: Hans de Goede <hdegoede@redhat.com>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Bjorn Helgaas <bhelgaas@google.com>, Sam
 Ravnborg <sam@ravnborg.org>, dakr@redhat.com, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 linux-pci@vger.kernel.org
Date: Fri, 26 Apr 2024 09:45:04 +0200
In-Reply-To: <20240424201236.GA504035@bhelgaas>
References: <20240424201236.GA504035@bhelgaas>
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

On Wed, 2024-04-24 at 15:12 -0500, Bjorn Helgaas wrote:
> On Mon, Apr 08, 2024 at 10:44:16AM +0200, Philipp Stanner wrote:
> > Now that pure managed region request functions are available, the
> > implementation of the hybrid-functions which are only sometimes
> > managed
> > can be made more consistent and readable by wrapping those
> > always-managed functions.
> >=20
> > Implement a new pcim_ function for exclusively requested regions.
> > Have the pci_request / release functions call their pcim_
> > counterparts.
> > Remove the now surplus region_mask from struct pci_devres.
>=20
> This looks like two patches; could they be separated?
>=20
> =C2=A0 - Convert __pci_request_region() etc to the new pcim model
>=20
> =C2=A0 - Add pcim_request_region_exclusive()
>=20
> IORESOURCE_EXCLUSIVE was added by e8de1481fd71 ("resource: allow MMIO
> exclusivity for device drivers") in 2008 to help debug an e1000e
> problem.=C2=A0 In the 16 years since, there's only been one new PCI-
> related
> use (ne_pci_probe()), and we don't add a user of
> pcim_request_region_exclusive() in this series, so I would defer it
> until somebody wants it.

Alright, sounds reasonable to me.
Since pcim_request_region_exclusive() can be dropped we can also omit
separating this patch to begin with I'd say.

P.


>=20
> Bjorn
>=20

