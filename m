Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F63AB0D0B8
	for <lists+dri-devel@lfdr.de>; Tue, 22 Jul 2025 05:59:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 60BD910E3E4;
	Tue, 22 Jul 2025 03:59:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="YGjbFzmD";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-f178.google.com (mail-pg1-f178.google.com
 [209.85.215.178])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1831810E3E4
 for <dri-devel@lists.freedesktop.org>; Tue, 22 Jul 2025 03:59:42 +0000 (UTC)
Received: by mail-pg1-f178.google.com with SMTP id
 41be03b00d2f7-b321bd36a41so4069100a12.2
 for <dri-devel@lists.freedesktop.org>; Mon, 21 Jul 2025 20:59:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1753156781; x=1753761581; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=wXXOavQ4WOy2gE8aAWn+LnkavWdDlut0iVqvj5kQmL0=;
 b=YGjbFzmDgQYqtNVPIYCMR4ydqGG7aBO/jhL9IVUmRECO+0uVngfiv5tzj7SJPRJGgJ
 KqPuEBcT7KUtzJqEIkM1E1mSNilIVz+CqpCygdaP/0esKmEQkSU1vcwSlp10kUUaykuU
 oy7ub6WWkgeLuOSzaBVpggKfYVHgT63JrdaMsFl8vol+2/pTs30rqLQYk06v4VFoRNcw
 4zJXL3LS5FSjZsFjhogeGaDgpd2643XkPe0glrY2dFnPXZaSG8/eEuUqHroyFqt1lxgL
 BRJTXnLYxusgv1SvCEBRUvHw1hJaAXNWSVnoqeNGURo6hQjLD7rcX+abkbRAJEWK3CX1
 Z36g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1753156781; x=1753761581;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=wXXOavQ4WOy2gE8aAWn+LnkavWdDlut0iVqvj5kQmL0=;
 b=PDkUvdevA4drJmYeOeegjueSgt+T5mgFUP7TuKNMuJg99pSYCZP0XM06JCDI+l1TA5
 oDxkF96LuCjlB2O1V9k6MZDE4HLlAJeuksZGfOCSYNg0epEGZ4H6Pj4g95osQs2gWav3
 ya2SMzfneAFHx6bLiIPp2nq2p/uw23sMDVnZ2OFLbtA1sguKLNgyuknzsIL0IZCNVGlz
 9qfoFYA+6iZoS2Zrigylj1c9vTIqQoniCegc0hm3jLUNwgz/LCq5HYmdQt9EgdKyYG1B
 UxoHGY7/mVGNX1akxwG9Vyw9wvXP2HmqzN07SP/MMFrPrPyLyp4/ikVkPTysyEjxrAqq
 ZcLg==
X-Forwarded-Encrypted: i=1;
 AJvYcCX3jJo5lsxfRJfHNRurIrhSnfcAs6P0OzmOBNguUUoRPLSDnnXVAx9vgFyCbex40BxU8OoOP+c8LxU=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyOErRCHqW/Zm+B5aKzh3BFpCy75qYRvngXTMVLPl3tYv64wrXm
 Kopl4GWfHQiidNDrUsr4lobHN00kT17PIHBTGcz2LSjLwnbLvtKlx+sE188YgzOz9eMrBi8Dgrs
 6y24SNghBHlnLylyhOQL2vUOe0coyrXo=
X-Gm-Gg: ASbGncsLXewjp15Scs76vnawLjUVWTd+/Qlj05PRQW6TNF4o/KZA8WugFvnG7l/9/Ny
 I7AyeksG2Kj3CD7pdI8K3lkV+hakYDy7N2xfojPaSPnlfLANwbpq8EaRtzqOdyddbiOEe9/9a02
 SsmFS4uW3lw/a1neMFBPcqiGiK12a3A5Gli5g/n64vPrQulVp2CU0UWKIdmRqMWUHSeHq5dljIJ
 hZog0gL7g==
X-Google-Smtp-Source: AGHT+IE89eLL47Hf4D1CEwGtR86mrukxEHw9vX/u6lpqJWi3y3SDJHMW63vPpjaWuKbwDGISOChwVGhNpGUIMHBPG8c=
X-Received: by 2002:a17:903:3bc5:b0:235:6e7:8df2 with SMTP id
 d9443c01a7336-23e2575a8d6mr314731345ad.41.1753156781485; Mon, 21 Jul 2025
 20:59:41 -0700 (PDT)
MIME-Version: 1.0
References: <20250720152401.70720-1-luis.hernandez093@gmail.com>
 <20250720152401.70720-2-luis.hernandez093@gmail.com>
 <c0cac011-cc07-42f8-bdac-620f3faeebf2@wanadoo.fr>
In-Reply-To: <c0cac011-cc07-42f8-bdac-620f3faeebf2@wanadoo.fr>
From: Felipe Hernandez <luis.hernandez093@gmail.com>
Date: Mon, 21 Jul 2025 23:59:05 -0400
X-Gm-Features: Ac12FXwAZjYe99Ed8fi0EHgmRE6NYfIksS7kFVNneQku7XTz2fKoUAQSeFSHNfQ
Message-ID: <CAGRSKZiZpHm1-EtMsdG5LMUKo6PRgamHpSsEcqDXvcc_PpR5Gw@mail.gmail.com>
Subject: Re: [PATCH v2 1/1] docs: Fix kernel-doc indentation errors
To: Vincent Mailhol <mailhol.vincent@wanadoo.fr>
Cc: Randy Dunlap <rdunlap@infradead.org>, Pavel Pisa <pisa@cmp.felk.cvut.cz>, 
 Ondrej Ille <ondrej.ille@gmail.com>, Frank Li <Frank.Li@nxp.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 dri-devel@lists.freedesktop.org, 
 linux-i3c@lists.infradead.org, linux-can@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Marc Kleine-Budde <mkl@pengutronix.de>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
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

On Mon, Jul 21, 2025 at 3:48=E2=80=AFAM Vincent Mailhol
<mailhol.vincent@wanadoo.fr> wrote:
>
> On 21/07/2025 at 00:24, Luis Felipe Hernandez wrote:
> > Fix kernel-doc issues that reported Unexpected indentation errors
> > durring documentation build (make htmldocs) in CAN, I3C and GPU drivers=
.
>   ^^^^^^^
> during
>
> > Convert formatting to proper ReST list syntax to resolve warning.
> >
> > Changes since v1:
> > - Convert return value descriptions to proper ReST format
> > - Fix code block introduction with :: syntax
> > - Add GPU driver fixes
> > - Remove SCSI driver (already fixed)At
>
> The change log does not need to appear in the patch main body.
>
> Add a --- cutter after your signature and put the change log after that c=
utter.
> This way, the change log will automatically be discarded when the patch i=
s picked.
>
> > Link: https://lore.kernel.org/all/20250703023511.82768-1-luis.hernandez=
093@gmail.com/
> >
> > Signed-off-by: Luis Felipe Hernandez <luis.hernandez093@gmail.com>
> > ---
> >  drivers/gpu/drm/drm_gpuvm.c              | 16 ++++++++--------
> >  drivers/i3c/device.c                     | 13 ++++++++-----
> >  drivers/net/can/ctucanfd/ctucanfd_base.c | 12 +++++++-----
>
> Can you do one patch per sub-domains and send them separately? The mainta=
iners
> of drivers/i3c/ are not the same as the maintainers of drivers/net/can/. =
And
> there is no dependencies preventing you to split.
>
>
> Yours sincerely,
> Vincent Mailhol
>

Hi Vincent,

Thank you for taking time to review my v2 patch and for the feedback.
I have since applied the changes you suggested. I apologize about
mixing the sub-domains, at first I thought they would all be related
as being part of the documentation subsystem since they were reporting
a similar error but I now understand these weren't documentation
related per-se and should've gone to each of the sub-domains
separately as the changes were made in the sources.

Again, I appreciate the guidance!

Best,

Felipe
