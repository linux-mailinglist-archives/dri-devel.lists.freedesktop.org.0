Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3212B91C26E
	for <lists+dri-devel@lfdr.de>; Fri, 28 Jun 2024 17:19:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 35EB110E6CC;
	Fri, 28 Jun 2024 15:19:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="M6C41XBt";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com
 [209.85.216.46])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 746B210E129;
 Fri, 28 Jun 2024 15:19:29 +0000 (UTC)
Received: by mail-pj1-f46.google.com with SMTP id
 98e67ed59e1d1-2c927152b4bso511168a91.2; 
 Fri, 28 Jun 2024 08:19:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1719587969; x=1720192769; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Pmjri7yaLe7QXW9juAdGl9QopQ/cO6H/4cwPORHxTGQ=;
 b=M6C41XBtHh8vC6qH4lMWR3V/UCM2QEI3/oBsBv6dF3smen4EfcB9AytXEIEUJeLCPw
 vSJa7dKErLQSTfIwgDb2nwhJ3nuTlraNt/2LICybfyJS88WjXfwSibsk+HwA82uqqWQS
 O1Zn03ExeYd9LIAifn9sLYgEUh2T3zI+I2MxqJBxolsr78dWR1e5ErCnRuJf+jBkUqHO
 qwUjSnBmIJTNqzy4dOBr8PzOBar1yDN10n9W9B+vIfTJlmfCPoPzvwBS2w3EKvBa40Mq
 gsBOqBjaBh941Kn7PDlisra4cg9hXUwG0LR2QDmKAMJclf+PeLrc08NniRhZTV5bcihl
 7pXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1719587969; x=1720192769;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Pmjri7yaLe7QXW9juAdGl9QopQ/cO6H/4cwPORHxTGQ=;
 b=hxAPiXY6ROL032eqCpeICm0iGzXn9b8VxbGKq3n1b/2qx3N4RmQX3YgwgFOSSeKvT+
 2+Ou1fbd3QMsO+AUmtXT37mY/AsIeVxM+cYc8mr6G/dzPyfp6mL/fraz1C7g40fC/JK5
 9FtzoU3BpU2kwIvyPrgR09Z1wYSb72eSuKfgy4oVeqbAaQORRMv/ixoTzIfXT5Xs0RW5
 FYczzlr6y7siQda5+KTBTOUIcpxRZkNSZwAW/Vzyoy4gRe15rm+ixzmC1hqJ6qutSb3i
 Cja64Wfdx5u6kpZTe0tSOcW0rxeRcgNqplVITLcywTQL9X27eCPEcbu9/NadGwigcX2w
 hY+g==
X-Forwarded-Encrypted: i=1;
 AJvYcCW4X3ph/uruKt9K0ss/VT5e4gGoQ2DlOz9deJ+LFNC0PQyRSdWrBkpkuUEvaergu2QWnmdzjDJggnidaOBAZH2GudxfANFJsBLLGdTyenO9fX6lJLfuNKd4gBBtOjK/mfH019esZEvvExvJrNgo6g==
X-Gm-Message-State: AOJu0Yw1tjalQ0HhPXZkCCt+DNnlFQ4qNP3jXIzI+Yjv0vpqZ5gGmYRf
 e5qiRKrqX3CG/6XzoOtmoBuHAeko9GoMW2V9Hix+3SReUlW75Kx7IlybUbFOKZSTORxJB42LEBh
 uXOVEV9gnKX6XaDavuR34sRw4xVM=
X-Google-Smtp-Source: AGHT+IFl/ePdhUfWsByY453UJoZtJx+hjy/QQ0/MmsxXqE51xtMz7GT1s16IgCAaFz1nVwJbQE6MR1Er5Iz8x1FG1QA=
X-Received: by 2002:a17:90a:6885:b0:2c7:e24d:f695 with SMTP id
 98e67ed59e1d1-2c861246b47mr15446562a91.12.1719587968869; Fri, 28 Jun 2024
 08:19:28 -0700 (PDT)
MIME-Version: 1.0
References: <CABXGCsNptxsQO=5=qi-JYiFX=rX8Ok5inK80Gn0qrUFWbtBGng@mail.gmail.com>
 <CADnq5_PDxJ8O1JUQ9RBYRFB9G1WZJos05ZAM4jUKuPBwPxjNkA@mail.gmail.com>
 <CABXGCsNN9LwHc2x2AAEH=5UNwpvkWkBqRYz3OP8MZ6Woy+HDXA@mail.gmail.com>
 <b6c440ca-e63e-429b-af41-5f27d4b8b2a2@leemhuis.info>
 <CABXGCsNoFfMn7LaqqFgEPg-ECyUPN=f=SXVrFi=GZk6c69-Gqw@mail.gmail.com>
In-Reply-To: <CABXGCsNoFfMn7LaqqFgEPg-ECyUPN=f=SXVrFi=GZk6c69-Gqw@mail.gmail.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Fri, 28 Jun 2024 11:19:16 -0400
Message-ID: <CADnq5_PDSkr4hOHJmb1J30UC0a7sXsm5-TPkEmjzffMK_A+7ug@mail.gmail.com>
Subject: Re: 6.10/bisected/regression - commits bc87d666c05 and 6d4279cb99ac
 cause appearing green flashing bar on top of screen on Radeon 6900XT and 120Hz
To: Mikhail Gavrilov <mikhail.v.gavrilov@gmail.com>, "Mahfooz,
 Hamza" <Hamza.Mahfooz@amd.com>
Cc: Linux regressions mailing list <regressions@lists.linux.dev>,
 Rodrigo.Siqueira@amd.com, 
 "Deucher, Alexander" <alexander.deucher@amd.com>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>, 
 dri-devel <dri-devel@lists.freedesktop.org>, 
 Linux List Kernel Mailing <linux-kernel@vger.kernel.org>
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

On Fri, Jun 21, 2024 at 6:45=E2=80=AFAM Mikhail Gavrilov
<mikhail.v.gavrilov@gmail.com> wrote:
>
> On Fri, Jun 21, 2024 at 12:56=E2=80=AFPM Linux regression tracking (Thors=
ten
> Leemhuis) <regressions@leemhuis.info> wrote:
> > Hmmm, I might have missed something, but it looks like nothing happened
> > here since then. What's the status? Is the issue still happening?
>
> Yes. Tested on e5b3efbe1ab1.
>
> I spotted that the problem disappears after forcing the TV to sleep
> (activate screensaver <Super> + <L>) and then wake it up by pressing
> any button and entering a password.
> Hope this information can't help figure out how to fix it.

@Siqueira, Rodrigo @Mahfooz, Hamza any ideas?

Alex
