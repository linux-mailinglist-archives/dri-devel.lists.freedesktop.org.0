Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 089AE8936E4
	for <lists+dri-devel@lfdr.de>; Mon,  1 Apr 2024 04:21:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 90EF410EDC7;
	Mon,  1 Apr 2024 02:21:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="fJscDCvn";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qv1-f51.google.com (mail-qv1-f51.google.com
 [209.85.219.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 28D6810EDC7
 for <dri-devel@lists.freedesktop.org>; Mon,  1 Apr 2024 02:21:00 +0000 (UTC)
Received: by mail-qv1-f51.google.com with SMTP id
 6a1803df08f44-6963cf14771so27027816d6.3
 for <dri-devel@lists.freedesktop.org>; Sun, 31 Mar 2024 19:21:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1711938059; x=1712542859; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=9JDO4Cagwi3lP7gijNA6peSXaTD5GczAGmK9Wgoo/bo=;
 b=fJscDCvngXrSZgzjVNY4Z9f/Vu3axc06qj1FCduXRdhpddgZ99YFB+0KNrAqEzoASu
 SGYRlhjaxNlyk4Wdq2SdQZz7ZylmjgN8iYTVrr4PvOL9/olet3DK/cCwZu+eIDuUe8D2
 KqKewDsuVzus0rTWK+V6qhff2OaBQ4fu+yAz9LPCQUg2YnkQIrV+0fvbhzp0AykXfyjA
 hl49dRAJRgRX/g9hK9X08Vg9Zs5WBwGLStfCH/DAIKydP69ammFKWblqULKlAg+m4YDK
 L6tSdPik+FlYqrI9UEJw/oMGqFgZx22uqSo/M77uyDqUBu1EgJxLE3IDqChTv+H6Z2Il
 hcLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1711938059; x=1712542859;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=9JDO4Cagwi3lP7gijNA6peSXaTD5GczAGmK9Wgoo/bo=;
 b=tDmqRoN+5fV3nBde7YT/CpQVYHRvt2VDf0emzAq8rOeVYkex1b9K6EihZnArCAUsmZ
 F7nDEVZULH12LVBQelE9MBooz3cRCBtcTsxSkuc/n/yRrlQe/SWROqx2wmAKevnxc0Mu
 lJ8PxlokxqWicROFE16+exbl7hww2UIceqealPz1Uhj+X5NG7geFeSsejf1mVIMf1O7p
 mHxf4o0eoV/RbXcV8raawmTtyPx1D6+mG90FoYbMT6dilsQ0CfFfEWTSAz5wYle7UAwG
 vx8K61//QiDBzS4tXtOKnvy/n2hcO/0le5qn6hKXIMjuxbuogzNkQ00MO6LqB6m1hC03
 rZMw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUvxCGdkxWBgzq7BdDQay1+XFYHo4udzq/yPI2vkHIT54eEbj0sQ1BWnblPsFl1aseYr6laVs3lw1QWDmhZIDfOoPHFxRJR03bh0nToZCbP
X-Gm-Message-State: AOJu0Yyu+fSohsV+UvBj1Cnh/Q0m112UrW1Z/7L8NhbdQghPguU/BVap
 Pi/WVlJ/Ji3yN1YVR9taHqUE7R8m4K3OKtRpt1PBxXfYKQOJkOsambgGWJXSH7w/4OpxJuFThuo
 rc20Q39JhtUhMu2HFY8/mDdYGOQs=
X-Google-Smtp-Source: AGHT+IF9CHspS/+4YIVUPThHfX60fsGTHH+icfepuaGZgKOX1lU41zLd0obIn/KQWOfp2D7L66KAVzHs3F7WzTa27BY=
X-Received: by 2002:a0c:c783:0:b0:698:feb6:3d2 with SMTP id
 k3-20020a0cc783000000b00698feb603d2mr3792497qvj.10.1711938058772; Sun, 31 Mar
 2024 19:20:58 -0700 (PDT)
MIME-Version: 1.0
References: <20240325033515.814-1-jammy_huang@aspeedtech.com>
 <c04ebd16-f0b0-45be-a831-fae8b50b7011@redhat.com>
 <5df1d391-7683-4d9c-accc-9b446d46a150@suse.de>
In-Reply-To: <5df1d391-7683-4d9c-accc-9b446d46a150@suse.de>
From: =?UTF-8?B?6buD56uL6YqY?= <orbit.huang@gmail.com>
Date: Mon, 1 Apr 2024 10:20:48 +0800
Message-ID: <CAOj9kT3=UA-5wkVXb8Rk2h3D=vtZDbhzxe4MY=Nwzod96DeppA@mail.gmail.com>
Subject: Re: [PATCH] drm/ast: Fix soft lockup
To: Thomas Zimmermann <tzimmermann@suse.de>
Cc: Jocelyn Falempe <jfalempe@redhat.com>, maarten.lankhorst@linux.intel.com, 
 mripard@kernel.org, airlied@redhat.com, airlied@gmail.com, daniel@ffwll.ch,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 Jammy Huang <jammy_huang@aspeedtech.com>, stable@vger.kernel.org
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

Hi Thomas and Jocelyn,

What we do in ast_dp_set_on_off() is a handshake between host driver
and bmc-fw to confirm
the operation, on/off, is completed.

We use some scratch registers in bmc to handshake with host. This
handshake only work if
BMC's scu-lock is opened. If scu-lock is opened too late, then it
could lead to this issue.

Best regards
Jammy

Thomas Zimmermann <tzimmermann@suse.de> =E6=96=BC 2024=E5=B9=B43=E6=9C=8828=
=E6=97=A5 =E9=80=B1=E5=9B=9B =E4=B8=8A=E5=8D=884:28=E5=AF=AB=E9=81=93=EF=BC=
=9A
>
> Hi
>
> Am 27.03.24 um 09:53 schrieb Jocelyn Falempe:
> > Hi,
> >
> > Thanks for your patch.
> > I'm wondering how you can trigger this infinite loop ?
>
> Yeah, a bit more context for this bug would be welcome. It's hard to
> judge the fix without.
>
> Best regards
> Thomas
>
> >
> > Also this looks like a simple fix, that can be easily backported, so
> > I'm adding stable in Cc.
> >
> > If Thomas has no objections, I can push it to drm-misc-fixes.
> >
> > Reviewed-by: Jocelyn Falempe <jfalempe@redhat.com>
> >
>
>
>
> --
> --
> Thomas Zimmermann
> Graphics Driver Developer
> SUSE Software Solutions Germany GmbH
> Frankenstrasse 146, 90461 Nuernberg, Germany
> GF: Ivo Totev, Andrew Myers, Andrew McDonald, Boudien Moerman
> HRB 36809 (AG Nuernberg)
>
