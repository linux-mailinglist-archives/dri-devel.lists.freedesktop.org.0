Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 262049D5FF2
	for <lists+dri-devel@lfdr.de>; Fri, 22 Nov 2024 14:49:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4A44210EB9A;
	Fri, 22 Nov 2024 13:49:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="hocufvub";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-il1-f169.google.com (mail-il1-f169.google.com
 [209.85.166.169])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9EF5210EB8B;
 Fri, 22 Nov 2024 13:49:24 +0000 (UTC)
Received: by mail-il1-f169.google.com with SMTP id
 e9e14a558f8ab-3a7a2c7a9dfso1880015ab.3; 
 Fri, 22 Nov 2024 05:49:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1732283364; x=1732888164; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=5zHwlEpS92eh3Y2BEZgdXLuE5s5zxW5BToEL+BkU1JM=;
 b=hocufvub6rTS41zxX0LStyTtZpV//7XBuo8mm1kDQH7uTbJ50obs2XRBVGY1ncXOAC
 UFMU8uR7r7ijtOHBya/Q+/v0CU9YFUz4W0I40+K7OZkTx1L6xeDaHgxlcxxQddQDkDBF
 7A/lH571iA9muirK3QI3WtuZDbARsPIyWdUhsnJjYFG01gmx0/pZdZREcfSPDBSTxFez
 PkWQMhk0J93NjHXef2+1gnBxZWWTpIZB2GJDPcaC2uiWkWTIVsNHrS9gh6D5YC8ErwE1
 bk7n+46Tpj0QqNyCboRgUgWOtsJY24GJ549hK5gCcAs630a+qQzUe2/rvwvtFyIQoI7B
 gzLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1732283364; x=1732888164;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=5zHwlEpS92eh3Y2BEZgdXLuE5s5zxW5BToEL+BkU1JM=;
 b=dlukbsm8GZthZZ29UNQWu6R8pgHzXIWKIxEIHkRNsn0cXN0DNg3HCn7cTJTUAwRYtb
 yQUKto/MI80H0ADrvyEoVs0WB5cOYT7ySucX1W/FTZGimktmx1wUfDc9HLt2TJarZruR
 Cy6UfK8ORPJ3arzdKYK24tbtZyxUGdciPTSod3Q6yAZLHnPb6wgSeLIa9Kfq72wEWioV
 HkQbMO6Lvou5lgBqbUw0gx7muhjDLfBu8W7RVc4vMPb7Y0siVgbMMMtRZrIvl/jvsVBI
 fvOcbgr+UZWP/Pi5cu5r7fFDHhEIaRrOtBrvLavoVQiTSQS2Kh8JuIBa+guJ5eT8lWll
 Jj/g==
X-Forwarded-Encrypted: i=1;
 AJvYcCUqfYCYhYi13WcxJ+gb+Fz7Dpadgwv4YyvF59Rp4ENeWjd0FLwfKwOPVv901EBCNmTyjuDsQfQ2h7Q=@lists.freedesktop.org,
 AJvYcCXxq+wZ4aV06ZdhkOJguDjtqm6H5M10NfsuZ51C359UFTR5mOTyIg7GLIFTSjPPzQOTs/WMY557Izxq@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxwHX1pRFGhuH1s2wagGpWp2KqX7c6A+03B22Trd+aVtA38mHvI
 P88ywJ53x44x6BQeTImoSq2lcZ3/4X+crCy8ZJ29GBmc8/oZmKAMXKDWRzyzU+v8fAH4TxY9goI
 KEBaej4MHNcS6qOK3X+hojHFRr5w=
X-Gm-Gg: ASbGncvpIOaml6YPIpgnk7vzAbBUahlJD6Y24x2o2P8dMgWPqIjQttzSJCcWxxLpBbr
 mf3QW0vctn5RIzkJhjggrFPZRPWxhBPo=
X-Google-Smtp-Source: AGHT+IFGU3sLkbKnqDksmnBuhW3CvoKTG6Z0qIoktztD+JIBkrwwln9lgTfJ0r69wuk6otmhq4HVrqu3lYGmKrJaRbM=
X-Received: by 2002:a05:6602:14d3:b0:835:4402:e2eb with SMTP id
 ca18e2360f4ac-83ecdc60ebemr304797439f.7.1732283363765; Fri, 22 Nov 2024
 05:49:23 -0800 (PST)
MIME-Version: 1.0
References: <20241120204125.52644-1-pvorel@suse.cz>
 <CAK7LNASYr+pjUs-W40d_Gc+vP67nX7NHXyE0AnOpXxXgxrCtqQ@mail.gmail.com>
 <20241121011720.GA69389@pevik>
 <CAK7LNARc4Cp1a8G9p0KiCGyu0WL3BNEd0BY0COMPL4U8bLr8gA@mail.gmail.com>
 <87h67zzjdc.fsf@intel.com>
In-Reply-To: <87h67zzjdc.fsf@intel.com>
From: Rob Clark <robdclark@gmail.com>
Date: Fri, 22 Nov 2024 05:49:12 -0800
Message-ID: <CAF6AEGtXEcNijTqH+NZ5-8ZX2TnzsxACJQ9XXWC9zGTJGxNv=w@mail.gmail.com>
Subject: Re: [PATCH v4 1/2] init/Kconfig: add python3 availability config
To: Jani Nikula <jani.nikula@linux.intel.com>
Cc: Masahiro Yamada <masahiroy@kernel.org>, Petr Vorel <pvorel@suse.cz>,
 linux-arm-msm@vger.kernel.org, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Andrew Morton <akpm@linux-foundation.org>, 
 linux-kbuild@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 Dave Airlie <airlied@redhat.com>
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

On Fri, Nov 22, 2024 at 1:51=E2=80=AFAM Jani Nikula <jani.nikula@linux.inte=
l.com> wrote:
>
> On Fri, 22 Nov 2024, Masahiro Yamada <masahiroy@kernel.org> wrote:
> > Documentation/process/changes.rst
> > documents basic tools necessary for building the kernel.
> >
> > Python3 is listed as "optional" because it is required
> > only for some CONFIG options.
> >
> > If the exact dependency is unclear, it is better to install
> > all tools listed in that table.
>
> I think we're slightly in a limbo with the python build dependency. I
> think it got initially merged a bit under the radar. And I don't mean to
> imply any ill will here, it just didn't get the attention it maybe
> should have. The dependency table got updated afterwards.
>
> Now, what's the status for more modules depending on python? I for one
> would like to use it for i915.ko, but I'm a bit uneasy about it as long
> as it's "optional". Conversely, how many more users would we need to
> switch the status from "optional" to "required"?
>

The way I've been looking at it is, for drm gpu drivers, the
dependency is only a subset of the py that mesa depends on at build
time, and if you are wanting to build the KMD you almost certainly
want mesa as well.  Maybe the situation is different for kms-only
drivers or other subsystems.

I may be biased here, but being able to generate code/tables/etc at
build time is something that python is very useful for, and has been
used to great effect in mesa.  And because of mesa's dependency, it
seems like a reasonable dependency on the kernel side as well.  My
only question is how to make the dependency visible in the least
confusing way for both users and packagers.

BR,
-R

>
> BR,
> Jani.
>
>
> --
> Jani Nikula, Intel
