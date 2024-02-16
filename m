Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D7A40858331
	for <lists+dri-devel@lfdr.de>; Fri, 16 Feb 2024 17:59:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8D8A410E98A;
	Fri, 16 Feb 2024 16:59:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="ANOesA0t";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-f178.google.com (mail-pg1-f178.google.com
 [209.85.215.178])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EDCAA10E98A;
 Fri, 16 Feb 2024 16:59:54 +0000 (UTC)
Received: by mail-pg1-f178.google.com with SMTP id
 41be03b00d2f7-53fbf2c42bfso795401a12.3; 
 Fri, 16 Feb 2024 08:59:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1708102794; x=1708707594; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=/x+pl6pSSD4011o2sxhi3tmE0ghNOP6YOH/ewDjwkTI=;
 b=ANOesA0tn5covcHEeomMCr5XbitC1sdzvH54eH2Zb6I/D1PXVqgq4GU/n+XfhMqoIN
 dExLK0nvE0n0UqMpoJpm3GXjmo+1H/xv5TemyxpJbT2R2vLbLhbdnxhOwCiFCktR3NsD
 BAVKjWaJcQexsqrCZu8XLTnlo+7q1wQREwyCdfr4YN0SYNb6AzkQ8Lg6+mufNft7+C1G
 aiwPdZxa8OUPI0JDn7ZWSPxBoPhZyK3V/oIklTvlD4seDmkWO3SoULEr1WRT2eQjrEwb
 bXXiPGCzAw0pZ8JDduwVXqCEe6eY9kPdPfrEysLYLh5+vcYgtultAYg1Re0vJNtR4Gg5
 AftA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1708102794; x=1708707594;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=/x+pl6pSSD4011o2sxhi3tmE0ghNOP6YOH/ewDjwkTI=;
 b=Ao83KCx21Ru/DN2HTk/NHf8XOiRvOTtHoDHpOeGmerGv2BS1b80AHU0hepmRimB2nZ
 ZHRGo+WLA78aDlOB9ymLBLS5c+qsPmaWaLnJnDYdscA7iVY/ZSB/ra+rakprLWEo1yMF
 lfXtpNunqsfbdRwFRTBwdOhgAWhl3vX6oIqK+xLXvoHmZkdQ3DklujHjtDIwdRxB+1ty
 djwd3fp74/xHpN74iwNmeqU3IqGfKw/nOVVawiUgehaO8YOQNPbqi4bOHKWs9Dq8wU/l
 xNPXs8B4zo7FyC0GJP32BXFjOjbOSBKCrZ1PLlJwM7PMhmXRMAzLlMIIJJ+P9l/LD6NM
 WXLw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXyTbUEM0D0VJAKCMgnqZiBgFrKZdVkUGuvX9p5ZqN34owq8xeit8VQyQB1h4H5moIcNQaemAs0gBRddsfXnDOfkZZeUpjHy/qesTAAUx/m5Zlb9EINKtprLy5HtZho4FFnB2c3K9J9PX3Ka8lZ5A==
X-Gm-Message-State: AOJu0YzNcabvWWQpTvrZM17cQIl34wX51NT44t5xpz4i3sbI8xF/sGY4
 FpcoCRU6zWeZPRzIKeDUmTRcX+SaVHwFy++461dPlT1K/rBT+fC8svX9Pr2yY1LwPSE/gU+MEsX
 xEibGq+zIMAvvOVmJahZK95bgkY0=
X-Google-Smtp-Source: AGHT+IFCDrkANKvivOACqcEya2zGfx4wIMBdPgjxD/0svYgSjKn3pI/eIrsX+aXebJhmfR73YSorrnNo7W7edSVRpl8=
X-Received: by 2002:a17:90b:1009:b0:297:1196:3716 with SMTP id
 gm9-20020a17090b100900b0029711963716mr5572994pjb.18.1708102794502; Fri, 16
 Feb 2024 08:59:54 -0800 (PST)
MIME-Version: 1.0
References: <20240215133155.9198-1-ilpo.jarvinen@linux.intel.com>
 <20240215133155.9198-2-ilpo.jarvinen@linux.intel.com>
 <BL1PR12MB51440761895B3DF935840BF0F74D2@BL1PR12MB5144.namprd12.prod.outlook.com>
 <dd2da980-d114-e30e-fa91-79ff9ec353e7@linux.intel.com>
In-Reply-To: <dd2da980-d114-e30e-fa91-79ff9ec353e7@linux.intel.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Fri, 16 Feb 2024 11:59:42 -0500
Message-ID: <CADnq5_MCQX+vP9aGsYdKejQtPF=rgKqNauDwqCLa39Ug8Nd-zg@mail.gmail.com>
Subject: Re: [PATCH 1/3] drm/radeon: Use RMW accessors for changing LNKCTL2
To: =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: "Deucher, Alexander" <Alexander.Deucher@amd.com>, 
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>,
 Daniel Vetter <daniel@ffwll.ch>, David Airlie <airlied@gmail.com>, 
 Dennis Dalessandro <dennis.dalessandro@cornelisnetworks.com>, 
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 Jason Gunthorpe <jgg@ziepe.ca>, Leon Romanovsky <leon@kernel.org>, 
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, 
 "linux-rdma@vger.kernel.org" <linux-rdma@vger.kernel.org>, "Pan,
 Xinhui" <Xinhui.Pan@amd.com>, 
 "Koenig, Christian" <Christian.Koenig@amd.com>, Lukas Wunner <lukas@wunner.de>
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

Applied.  Thanks.

Alex

On Fri, Feb 16, 2024 at 5:38=E2=80=AFAM Ilpo J=C3=A4rvinen
<ilpo.jarvinen@linux.intel.com> wrote:
>
> On Thu, 15 Feb 2024, Deucher, Alexander wrote:
>
> > [Public]
> >
> > > -----Original Message-----
> > > From: Ilpo J=C3=A4rvinen <ilpo.jarvinen@linux.intel.com>
> > > Sent: Thursday, February 15, 2024 8:32 AM
> > > To: Deucher, Alexander <Alexander.Deucher@amd.com>; amd-
> > > gfx@lists.freedesktop.org; Daniel Vetter <daniel@ffwll.ch>; David Air=
lie
> > > <airlied@gmail.com>; Dennis Dalessandro
> > > <dennis.dalessandro@cornelisnetworks.com>; dri-
> > > devel@lists.freedesktop.org; Jason Gunthorpe <jgg@ziepe.ca>; Leon
> > > Romanovsky <leon@kernel.org>; linux-kernel@vger.kernel.org; linux-
> > > rdma@vger.kernel.org; Pan, Xinhui <Xinhui.Pan@amd.com>; Koenig, Chris=
tian
> > > <Christian.Koenig@amd.com>
> > > Cc: Ilpo J=C3=A4rvinen <ilpo.jarvinen@linux.intel.com>; Lukas Wunner
> > > <lukas@wunner.de>
> > > Subject: [PATCH 1/3] drm/radeon: Use RMW accessors for changing LNKCT=
L2
> > >
> > > Convert open coded RMW accesses for LNKCTL2 to use
> > > pcie_capability_clear_and_set_word() which makes its easier to unders=
tand
> > > what the code tries to do.
> > >
> > > LNKCTL2 is not really owned by any driver because it is a collection =
of control
> > > bits that PCI core might need to touch. RMW accessors already have su=
pport
> > > for proper locking for a selected set of registers
> > > (LNKCTL2 is not yet among them but likely will be in the future) to a=
void losing
> > > concurrent updates.
> > >
> > > Suggested-by: Lukas Wunner <lukas@wunner.de>
> > > Signed-off-by: Ilpo J=C3=A4rvinen <ilpo.jarvinen@linux.intel.com>
> >
> > The radeon and amdgpu patches are:
> > Acked-by: Alex Deucher <alexander.deucher@amd.com>
> >
> > Are you looking for me to pick them up or do you want to land them as
> > part of some larger change?  Either way is fine with me.
>
> Hi,
>
> You please take them, I intentionally took them apart from the BW
> controller series so they can go through the usual trees, not along with
> the BW controller. (I don't expect the BW controller to be accepted durin=
g
> this cycle).
>
> --
>  i.
