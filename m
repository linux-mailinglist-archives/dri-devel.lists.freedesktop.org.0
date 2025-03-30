Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 19947A75AB7
	for <lists+dri-devel@lfdr.de>; Sun, 30 Mar 2025 17:54:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5E0F610E05C;
	Sun, 30 Mar 2025 15:54:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="JbYwr+k6";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-f175.google.com (mail-yw1-f175.google.com
 [209.85.128.175])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 14F7710E05C;
 Sun, 30 Mar 2025 15:54:50 +0000 (UTC)
Received: by mail-yw1-f175.google.com with SMTP id
 00721157ae682-7023843e467so24583267b3.2; 
 Sun, 30 Mar 2025 08:54:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1743350089; x=1743954889; darn=lists.freedesktop.org;
 h=content-transfer-encoding:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=LWlBEbR0rue8Ii1q14Xo+2oYD69eGDnHnKTJ64e1hK4=;
 b=JbYwr+k6eJox2v4Xmq6HVGOuOcAckEK1f+VmW9gPUmNZmg4dxkRio8yPcQyqA+Psbu
 DTVCVjhFej2D1PQvJGc89oypPZC9hLBGW57Ct4EvuwrHQj0TU6oYsp27WbBf/h542QmP
 RiwqDC1QR4xw8oiXIX9q3d8XTEQxYTThTVwbKOYbl0J+dlVJSCxq6sEFe/Wpqf3ZqiDN
 hQxfTsBmNa4CDO9r1j0I/8jJbIX0sqC4IE5cp0agXeS/Cl+xlWpPqQ3hDFYlaOtxzIF2
 W3ug9vBCt+1Vki+Eg33wkbEZ51RsZ+Q5nUmD5euTG7/6cEiWtw3+Cjy7m9h/vwF+lRTk
 xJ+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1743350089; x=1743954889;
 h=content-transfer-encoding:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=LWlBEbR0rue8Ii1q14Xo+2oYD69eGDnHnKTJ64e1hK4=;
 b=RCYcnF1jcz69o4zzgBCLwBJ8nMFvYLL+YQbky2JUpbt6/E4g+DkgzdHBiVE7dxX3Fn
 9mV9qEY6Cb2PHMIr/aTeh7lxy4+wCRmhWsrkscIXHvrO3Sj/SUUl1uy9h/HAuJZbUYus
 hsHvYciM49VcO7NMfACs6JyKLhTBmaK8qO5hZzcXr2dzcI9ZjzHLm6Z8Xnfw1Fv0RkZP
 J18XRrvPYCuM6IlrxoEOSJEDgyHJpidiPXJ/4eazX8dXILnI0QFCwXQxPrIKBe6LeQIm
 BUQ9osAVKkbQWUowYzLKb3R5PXQaGtSpfDCZuqEETulATaHifm+DcEB4YLRLWaD7AWGS
 1G5A==
X-Forwarded-Encrypted: i=1;
 AJvYcCUi5dfxORieGIhzWdI3Iel0ukiVPkxkGgEb5i41Y66CfWwE1py46mED+LgSlfoBSfKpMJgcyXWFr3M=@lists.freedesktop.org,
 AJvYcCVJ1PlukArXEIzP6KxldyxCZzSLc3RuwVpFANG0IKNAI84O9BOslNFVwozArU99Wi1B+PBnUKNf+w==@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwgtfCm70G6EySWKNeSgzhXbXHCGLImM3C7bfEFhadcMOSvlJU5
 fqmq0ug2xaXO8uwucNe5nsvETpn1ydGfr/+oJvyJYoppT+B47F+GbVz+R79hWYEGFcrjoMGGg82
 GbrmbEF15/28R1YZIbaMxYFnxH3A=
X-Gm-Gg: ASbGncsrevbNS3ANCZu9DHYpOv7ZrnscYmSXc9u2iTnfZL4Wp41oGsSClaBR7EikMvT
 k5xXkL4lVdDlAj++8Px9Y9VPh/YT6DipvxATQQGns9xCy3wcOwbsI2aLXkcl3mzfxnnWq14YCVM
 eszztJZxhS/vdtqwCnQBW3K/nW+5tzMw9xJDbkb3MTerq0PirIoUIS0a/+cQ==
X-Google-Smtp-Source: AGHT+IE7FllcBCOS13DEOvR7SgnhqNJPiir8vxUb7WDN/BNFMIIEH5Eh4WJF3wKdt8Avs7cCJgfUjWrljkfTV0xik3w=
X-Received: by 2002:a05:690c:6f85:b0:702:4eb0:6af with SMTP id
 00721157ae682-7025734bd0emr85210947b3.31.1743350088704; Sun, 30 Mar 2025
 08:54:48 -0700 (PDT)
MIME-Version: 1.0
References: <Z-ljeKZd7vNoQZJZ@pampelmuse>
In-Reply-To: <Z-ljeKZd7vNoQZJZ@pampelmuse>
From: Gonsolo <gonsolo@gmail.com>
Date: Sun, 30 Mar 2025 17:54:38 +0200
X-Gm-Features: AQ5f1Jo9abWDsUg5PZzhzQ2IvCkt7cOGQFYBHyRHIq03BLxyIx-gBqLg2_YQKgw
Message-ID: <CANL0fFSUCiedt_V91bmEdDYnqo_DgkptgmYMUAWZPePM2sWzvg@mail.gmail.com>
Subject: Re: Screen corruption with second monitor
To: lyude@redhat.com, dakr@kernel.org, airlied@gmail.com, simona@ffwll.ch, 
 dri-devel@lists.freedesktop.org, nouveau@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org
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

Hi!

Second try without attachment.
Youtube link of screen: https://youtu.be/zVbuzxECinI

Am So., 30. M=C3=A4rz 2025 um 17:30 Uhr schrieb Gon Solo <gonsolo@gmail.com=
>:
>
> Hi!
>
> I bought a Displayport-to-HDMI cable to connect a second monitor to my
> NVIDIA 3060 12GB with three Displayport and one HDMI outputs.
> The first monitor is connected via the only HDMI output.
> The (second) monitor via on DP-HDMI flickers and has vertical stripes (se=
e the
> attached video). I'm running the latest Arch with Nouveau and NVK.
> The first monitor is attached via
> Kernel 6.13.8-arch1-1
> Mesa 25.0.2
>
> I think it's the driver's fault because
> a) console works, flickering starts with the graphical console,
> b) on Windows it works,
> c) with NVIDIA (nvidia-open, nvidia-utils) drivers it works,
> d) booting with just the second monitor (Displayport-HDMI) works, and
> e) funny enough, booting with just the second monitor, and plugging in th=
e first one
> later also works.
>
> So my guess would be, there's something not working with Nouveau's handli=
ng of
> the second screen.
>
> I'm happy to provide more details on request.
>
> Cheers,
> Andreas

--=20
Andreas
