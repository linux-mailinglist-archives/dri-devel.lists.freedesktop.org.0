Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C3E2AB455F
	for <lists+dri-devel@lfdr.de>; Mon, 12 May 2025 22:10:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4FF3010E4A1;
	Mon, 12 May 2025 20:10:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="UAOoJLdq";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-f182.google.com (mail-pg1-f182.google.com
 [209.85.215.182])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A769210E49F;
 Mon, 12 May 2025 20:10:52 +0000 (UTC)
Received: by mail-pg1-f182.google.com with SMTP id
 41be03b00d2f7-b1ff8a0a13cso814194a12.0; 
 Mon, 12 May 2025 13:10:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1747080652; x=1747685452; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=TNzlrfZxfOGKMDbj14ymw9GdOkMEXSGepdIAXWjXZl0=;
 b=UAOoJLdqwBMOkNOlM1XXN7f5gaNc+ugoCxn1DkgjApVkNSwFs7NmnM83zFQH5ib1sN
 qeFlGts0XyK8rxyjL0fFPcKPMSn6rtnYr1GpXMaXJWWY0SDxPZfbnpRo7S2HRYyxgB67
 bPqIKo3BF+d/4jemu9TOo78RRwVumDhxCqqZiPfnvPK64pkNTNeu1erDJa5zhcuTnqR0
 V2eRBDF6s4Od9pnopnDltQcTvROaLY6x16E8sLbhXKMSrVPepUaVunhDRlkHzUTCeYEW
 lkoOpq8nkOOG6nNanIHVvMFkq1xiL5eMLkpxk+/nkreiXXaBKq1j2Eg/Mmx9LBop8fal
 JS8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1747080652; x=1747685452;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=TNzlrfZxfOGKMDbj14ymw9GdOkMEXSGepdIAXWjXZl0=;
 b=nKC6H1Jimz4YL9nwtY18K93fKz30oIR3smXXQbzMQhP0WkF+u6a0IBZhboEGbY27UX
 Bfln8MRIHe0GJDoDfb7839frVetyDSjHIEjX/E5G7xDSRavh+z8xApSbnW6MKfUppkbC
 kmzcpSkRlXa/a/BjLmDm2wlewdX3mcHJPOELP54Q4nFqEK6QHWHybQ480crTwOInwvhG
 4o1UnFAHO5VJiBqWiNjHlgkR2PkYwlFtGc/UrwUjj6kYIArcfgURxD/dSGrNkklCq9gw
 GOXLlWM/++psB5aS/vUXSTBvvGdgPKMw/Kc45VNM4BL7yCwd2+FYdeBDqYcmSNx6vJyj
 CSuw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXydnb2F3o9qF2c0v6AegkHcB9N3RAaMjIbz16V/5jv/RaOgPOIcVFtHUSLDoMhllUFd9zkxbc0sXY=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxjE1/d066lMwuLMcHhEoA7iPS5bMkD8T8Ghmo2Rv4bhPJzmIIu
 JiLya/28Hel1KO20fHRn3AXBayaSDBZ02XoveVbBEuL6w3JSuyO3gxk+AdWDmtgQwxkaVZzGRmv
 Vg1eGbvbQWkc9EFjKVmkTjPysJ7mrh4MM
X-Gm-Gg: ASbGncuB5hPZSJiholkvOMcS5v6D7HcumIwWWY+LfdU1aPOMKA8q4TvpaTZvlj+X7kA
 Kp4vGICTVAZydMYhU6ndtZCP/EUMsIIbiBG7fHZ16G4qCqdXZ/c3GsbPv564hw7MfwhyXPAtFxr
 TVysysDexqKZ1pkhoa6yRxhryhNIdT+n7NytBxOovExws=
X-Google-Smtp-Source: AGHT+IFY9WwxznwjIs56GtzB24snIWQRo9lN27jIRJJqRwz7p9swzydfVUUHJJf7h067rUUhBH0+CyXauWgdM2Ua75M=
X-Received: by 2002:a17:902:e94d:b0:22e:6ea8:8a07 with SMTP id
 d9443c01a7336-22fc9087803mr73172895ad.9.1747080652056; Mon, 12 May 2025
 13:10:52 -0700 (PDT)
MIME-Version: 1.0
References: <6DWYVS.BXJ4YUZ0KN5B3.ref@att.net> <6DWYVS.BXJ4YUZ0KN5B3@att.net>
 <CADnq5_Pk41iOvibFSjt7+Wjj=FXWR--XMt+OCqmkWWveLfU_ig@mail.gmail.com>
 <GXXZVS.Q1GIIU1M9VBL1@att.net>
 <CADnq5_NvoPfgTxOxjBCc-iGR7k8w7oR7VKkXQtWga8VP7vBViQ@mail.gmail.com>
 <1Q10WS.BHBZBX486I3M2@att.net> <EWZ5WS.K2DTZM5DEZCL2@att.net>
In-Reply-To: <EWZ5WS.K2DTZM5DEZCL2@att.net>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Mon, 12 May 2025 16:10:40 -0400
X-Gm-Features: AX0GCFsEFo7fJJ6Kq4sfr7_XIE3CIvTcO2qwnDkAN3SdcTpfdVs26FffhVmYghE
Message-ID: <CADnq5_PbeZCPD7WWO0i5HSVMepka7Ao6byfkx3zHkiBfg4amwg@mail.gmail.com>
Subject: Re: Kernels >= 6.3 disable video output
To: Steven J Abner <pheonix.sja@att.net>
Cc: amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
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

On Mon, May 12, 2025 at 4:07=E2=80=AFPM Steven J Abner <pheonix.sja@att.net=
> wrote:
>
> On Fri, May 9 2025 at 03:01:13 PM +0000, Steven J Abner
> <pheonix.sja@att.net> wrote:
> > On Fri, May 9 2025 at 02:05:16 PM +0000, Alex Deucher
> > <alexdeucher@gmail.com> wrote:
> >> bisect between 6.2.16 and 6.2.17 to identify the commit which broke
> >
> > Are you asking for a 'diff' output of drm and amdgpu directories
> > between 6.2.16 (last of the 6.2 series) and 6.3 (start of the 6.3
> > series)?
>
>  I'm willing to revert/test code on my machine, problem is I don't know
> sequence nor what I can safely revert. I haven't messed with video
> drivers/code since DOS days of having to write ones own graphics
> routines. I could force? kernel to build with '-g' on drm/amdgpu? and
> walk it I guess. But don't know what I'm looking for. :(

See:
https://docs.kernel.org/admin-guide/bug-bisect.html
If you know a good and bad point on a particular kernel branch, you
can use git to bisect the tree and identify the exact commit which
broke caused your issue.

Alex

> Steve
>
>
