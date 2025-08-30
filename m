Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id ADA0DB3CD1D
	for <lists+dri-devel@lfdr.de>; Sat, 30 Aug 2025 18:30:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7549010E22D;
	Sat, 30 Aug 2025 16:30:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="XkCPMLya";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com
 [209.85.214.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4D16C10E22D;
 Sat, 30 Aug 2025 16:30:21 +0000 (UTC)
Received: by mail-pl1-f172.google.com with SMTP id
 d9443c01a7336-2488be81066so7917415ad.1; 
 Sat, 30 Aug 2025 09:30:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1756571421; x=1757176221; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=i6vQxSWpXv081OJaX5WpHyCgAtx4LnI6eb9ZG6e+nyI=;
 b=XkCPMLyavz5J9Er9wm/q6EmZwVnzQ+2V4NbnlemA2KDPR966LOOe+fwMky4eYtdv1g
 Zcx6hfQ6V1yd6lu1bWw69RBVV0Vv/ux+9gTWpTTXbCVRYxfQANkDfh/qRhJOSksXWVfx
 oONuZLIdDeV7gxeFLG2HSf8L0uYQqBKyn6yZbUpauxQjvNtbjB+pUcdoC4ivZDo16CMK
 poztxoDoKSq9MzLg6EwMZLRir2AfkNsC2hwKsjJ8ASSoUlBtmt4/u9vZnCVXgTjrgA+9
 EW11QBs8xk62ZiMGfWGq11PjsiHaRjcxa545ofxHG2kyniR5ZN4iJs9sK83/sRFIJmN1
 7T3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1756571421; x=1757176221;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=i6vQxSWpXv081OJaX5WpHyCgAtx4LnI6eb9ZG6e+nyI=;
 b=vEIy3QozG6jaB2eJbIh/43HT3WzROWhsw4+Zefi1CxWE8SkpDUtrHVOK1AkJR0hyiD
 1tDmxI3Nx0FyLwNR0XayGMvu43BxXZ6lZHD8rap2l1QPdlnPT5dFMRw6zAkqrrvd0SK9
 8O+ehB60FbRGKYZU4fQVbGs7+dg2HhfqISuhmv19VpgkXs7FRgRkNXP2BA191JRiMr//
 EvdTVfRJb3Jm1LPo/4QXOFympgfbvs+XMsey4WiXSNltmp+SYofMKJ0fS8Irb+wCTtjc
 TwE+gGFIu1S8h/xWj61ie6mXlU0p6AsyZFQSpVCinuJTp9K2YU86qGpqQ02+m+5gZMtp
 HRYg==
X-Forwarded-Encrypted: i=1;
 AJvYcCVSGvOuGMWFBj6WrStxI0Q28vuVfiRkWbT7HdzDyGiwFqzXzmQXX7AoxBnF716/7Ikm6qk82ujSQzw=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwxSDRhiBI0pnF/eyHHrgDQzrI687orOlEOU6wXbSRYf+w0pj0b
 7f9HV51J4OI3lCVYrknpqAHJBoGs8BEmPzv22UiZ7fQszW+2IGXU2+Piba7x8VKGjy0P5cAceqP
 p56oFRgt090jeHvXB05iiZxWRhENKvik=
X-Gm-Gg: ASbGncuUNdDUfjKsTaNbGhHsMjJUXPWuC6Ylm9zDtmHxMVC3fgiSm96cymiD+N0SJPL
 rIJBh3r+noaVl1J6kAfYu56yqlcQZuMzGwPXafyPHuWddlzuOCnJZ1yHSjbHqcG1BsGEap6pC5A
 TH0e8gI8f6wQGEU+i6UKJDV1Dx2llQkV7lT2cYilSRdDX3EBJasXPDg6PPSfQvHDyOnshwnFMik
 Y96F/xIHeY0F23nBg==
X-Google-Smtp-Source: AGHT+IEnp0d/ox7MyiexYDelNlGYh7sEMDDp2slpUX07DsrohYDyYv1UbHQ45FvZIJGo0w2AJujwM103aJpmxC+Kyc4=
X-Received: by 2002:a17:902:f687:b0:246:b3cc:f854 with SMTP id
 d9443c01a7336-2490f6bd83dmr45834285ad.2.1756571420577; Sat, 30 Aug 2025
 09:30:20 -0700 (PDT)
MIME-Version: 1.0
References: <20250829171655.GBaLHgh3VOvuM1UfJg@fat_crate.local>
 <CADnq5_Oqonrth+5T-83dnFBZ67GvykkPt-9aUepJd+fUMwnupw@mail.gmail.com>
 <20250829194044.GCaLICPKJcGJRYdSfO@fat_crate.local>
 <20250829204840.GEaLISKGTwuScnDF8Y@fat_crate.local>
In-Reply-To: <20250829204840.GEaLISKGTwuScnDF8Y@fat_crate.local>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Sat, 30 Aug 2025 12:30:09 -0400
X-Gm-Features: Ac12FXyuwaIKIrWWofmEszUvdbPoKCSxiOPEGd_tAh18Vtmvke3NVvLJZETkRRI
Message-ID: <CADnq5_MbpYmC2PSyOr0gQk7F8mVz0-LG3dZtUZS2HhV8LTgDww@mail.gmail.com>
Subject: Re: evergreen_packet3_check:... radeon 0000:1d:00.0: vbo resource
 seems too big for the bo
To: Borislav Petkov <bp@alien8.de>
Cc: amd-gfx@lists.freedesktop.org, Alex Deucher <alexander.deucher@amd.com>, 
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
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

On Fri, Aug 29, 2025 at 4:48=E2=80=AFPM Borislav Petkov <bp@alien8.de> wrot=
e:
>
> On Fri, Aug 29, 2025 at 09:40:44PM +0200, Borislav Petkov wrote:
> > On Fri, Aug 29, 2025 at 02:26:50PM -0400, Alex Deucher wrote:
> > > Have you updated mesa?  Looks like a userspace change.
> >
> > Yeah, I did a long overdue OS upgrade today:
> >
> > $ grep -i mesa /var/log/dpkg.log
>
> Btw, this thing:
>
>                                 if (p->rdev && (size + offset) > radeon_b=
o_size(reloc->robj)) {
>                                         /* force size to size of the buff=
er */
>                                         dev_warn_ratelimited(p->dev, "vbo=
 resource seems too big for the bo\n");
>                                         ib[idx+1+(i*8)+1] =3D radeon_bo_s=
ize(reloc->robj) - offset;
>                                 }
>
> is yet another example of useless flooding of dmesg.
>
> It's not like I can do anything about it except report it. And that thing
> fires every 5s or so.
>
> You could consider turning that into a _once thing and be done with it.
>
> And someone already ratelimited them:
>
> 59d76d6bc206 ("drm/radeon: ratelimit bo warnings")
>
> but it ain't enough.
>
> $ dmesg | grep "vbo resource" | wc -l
> 22393
>
> So even if I go and find which commit added it:
>
>   cb5fcbd540b4 ("drm/radeon/kms/evergreen: add initial CS parser")
>
> I'm still none the wiser. And I'm not even a normal user - I have seen ke=
rnel
> code in the past :-)
>
> Hell, I don't even know what CS is...
>
> /me goes and searches the web a bit...
>
> Aha, it could be a command submission parser or so. Still have no clue wh=
at
> this warning is telling me.
>
> Going back to searching the web...
>
> ok, so it looks like this is validating some packet3 set resource thing a=
nd
> when the resource type? is a SQ_TEX_VTX_VALID_BUFFER - perhaps a valid ve=
rtex
> buffer? Vertex buffer I understand. But texture vertex buffer?
>
> Anyway, it checks whether the vbo (vertex buffer object?) resource is
> too big for the buffer object which has gotten as some sort of a relocati=
on
> packet 3 thing...
>
> And I still have no clue what is going on. Perhaps the new MESA is sendin=
g
> wrong command types, who knows.
>
> I absolutely cannot fix it - that's for sure.
>
> And so this rambling of mine confirms my old theory that the warning and =
error
> messages we put in the kernel are not really useful. Especially to users.
>
> Because there isn't a whole lot they can do about them except reporting t=
hem
> to those who can actually do something about.
>
> I.e., those messages might as well be hashes which we can stick into a lo=
okup
> table to fish out a longer string which tells us what is going on.
>
> So I *think* you should make this a once message or *at* *least* ratelimi=
t the
> hell of it so that it appears very seldomly. The rule of thumb should be =
what
> you want this message to do?
>
> To make a user report it to you?
>
> Or something else?
>
> In any case, I am already very picky with the error messages visible to u=
sers
> in the code I'm maintaining, this'll make me be even stricter.
>
> Oh well.

Yes, I agree these should be warn_once().  If you send a patch I'll
apply it, otherwise, I'll take a look next week.  For some background,
older GPUs did not support memory protection, so the kernel driver
validates all of the command submissions (CS) from userspace to make
sure the commands would not access any memory they shouldn't.  In your
case it's a vertex buffer object (VBO) which contains vertex data for
the 3D engine on the GPU.  So newer mesa code is sending a command
submission with an invalid vbo size.  As such the kernel driver
rejects the command submission.  This may result in subtle rendering
issues as the invalid command submission does not get sent to the
hardware.  I would suggest filing a mesa bug report:
https://gitlab.freedesktop.org/mesa/mesa/-/issues/

Alex
