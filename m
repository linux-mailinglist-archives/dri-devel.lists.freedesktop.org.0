Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1BFB0AB8C19
	for <lists+dri-devel@lfdr.de>; Thu, 15 May 2025 18:16:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5088D10E903;
	Thu, 15 May 2025 16:16:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="DPHtskyH";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com
 [209.85.214.178])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6F1F510E910;
 Thu, 15 May 2025 16:16:37 +0000 (UTC)
Received: by mail-pl1-f178.google.com with SMTP id
 d9443c01a7336-231ba912ba1so714325ad.2; 
 Thu, 15 May 2025 09:16:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1747325797; x=1747930597; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=opHzyc+p9AwWDvYyqyHVcOPzuMyjwR2ddO/u4T8j3Ok=;
 b=DPHtskyH6g5BdH6B8c7XfekZRZ0XynaXHcAlF75qxdbe2BSObdYV75wjSatgAQFxSl
 DBRfj25Kr9EC8P9MoPGOFtuaVhdKRo8qygMakRC30onkA2k0upevbWhPok3GiTwMGhcw
 ww6JOTpl0f2N/MA5GYWt0i0wmyC3qjXouBV9URYDfYV5/AxwL/wJDnX2FkVR17kj3hXP
 VFrPriMtYtYuvITr1nb/AEWFVXOsAe5JLjh+HzfHQdbxaB4s0OdJCxno44OFayokaA/L
 PRLp4bGCAzpOgQgagosA5ejqbTgiOxyisunkG5V36JMqBufF0TMYlYIknxzrycsJuGNH
 PQBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1747325797; x=1747930597;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=opHzyc+p9AwWDvYyqyHVcOPzuMyjwR2ddO/u4T8j3Ok=;
 b=nr58as8AAxyEKirb6Dgc5tfG/5jGuHcGhAIixm6iO8C0VVkvciSB1j074JjE4UoOu2
 jWu+2u5OsjSg9gFRQ16q0u2DyqPqwjCN1H81C4Jl5CfpUW1uP+D7TZ9cjKi/iBomJ2IG
 0IhEORLUdV0zp2a6hQHfUiuG680zFgquCi+T97KGsSGfTh2M9f34CC5DOrs3j0SQj3VE
 VCa34fCFb4BtOMs5LD3tGZ6NZI7fBYYRhd5P4JZjrWxZGz+HNJ1WtmainF9IZ17fkbi+
 9WzV/mTq5EJsSfVbiFBBKVjOa5560l7OwLVxdNjG692Nd/WdaKUEHnZ6jqzQegTUA0v8
 +ctg==
X-Forwarded-Encrypted: i=1;
 AJvYcCWz9D9r/6c1/QgpQ/OLMHgHsxAFP7FRkfMYN/rSNsmRwwuCZJJ2/uBtWI1CVr3Rr/lbuYYolUc4Rzs=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YznzME400fWNMcd47u6GQhgRA5GA9ApbnFo33HyXI86K9Idlh4K
 vTO6sKo5twoL9UGB/v1EtYlntpLSU11VmZmpq+U9cR6o5Axez7DaTnHxEICNWyXg8EtWSVcluuJ
 ey5lyjMzP2kT3j7rHP9mEq9xr8XITXcB4YA==
X-Gm-Gg: ASbGncuGod+OvQItD56lQeRCj38sNL6EB/GUXS0gzKw8noJlpJ6tBaW2a3uRiLF00HG
 srkaIwg/qZRfFV+6URP5pLOH9uE7eezbnV0ieW9ig33th/LrN307ZkdtcDkmbvcLYZQ9larHeTG
 TUOp6xo9YGRpPY9G/gBQlwr3gp2N7Uh0iNMQ==
X-Google-Smtp-Source: AGHT+IGJhEB8jFs1ZxEtEl8o4O0Q2FwLLedJlvYmB2+ScNZBeNOAB8sWUlAd/5O/YRsl+nL1ApZaif7skIokahiZuro=
X-Received: by 2002:a17:903:230b:b0:21b:b115:1dd9 with SMTP id
 d9443c01a7336-231d43ad454mr609795ad.5.1747325796913; Thu, 15 May 2025
 09:16:36 -0700 (PDT)
MIME-Version: 1.0
References: <6DWYVS.BXJ4YUZ0KN5B3.ref@att.net> <6DWYVS.BXJ4YUZ0KN5B3@att.net>
 <CADnq5_Pk41iOvibFSjt7+Wjj=FXWR--XMt+OCqmkWWveLfU_ig@mail.gmail.com>
 <GXXZVS.Q1GIIU1M9VBL1@att.net>
 <CADnq5_NvoPfgTxOxjBCc-iGR7k8w7oR7VKkXQtWga8VP7vBViQ@mail.gmail.com>
 <1Q10WS.BHBZBX486I3M2@att.net> <EWZ5WS.K2DTZM5DEZCL2@att.net>
 <CADnq5_PbeZCPD7WWO0i5HSVMepka7Ao6byfkx3zHkiBfg4amwg@mail.gmail.com>
 <OY8BWS.OAO65CCC74TY1@att.net>
In-Reply-To: <OY8BWS.OAO65CCC74TY1@att.net>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Thu, 15 May 2025 12:16:24 -0400
X-Gm-Features: AX0GCFuJmjASJSuGCAy5bNVx5Y8yCDEnTwKVcRC9WE4sDRbuvdyPpDmnzF_yIiI
Message-ID: <CADnq5_NqAQPO1NRbzQJzR+tZnOSqrhTmZj4z-B54X-hRxo3b4w@mail.gmail.com>
Subject: Re: Kernels >= 6.3 disable video output
To: Steven J Abner <pheonix.sja@att.net>, "Wentland,
 Harry" <Harry.Wentland@amd.com>
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

+ Harry

On Thu, May 15, 2025 at 12:11=E2=80=AFPM Steven J Abner <pheonix.sja@att.ne=
t> wrote:
>
> On Mon, May 12 2025 at 08:10:40 PM +0000, Alex Deucher
> <alexdeucher@gmail.com> wrote:
> > See:
> > https://docs.kernel.org/admin-guide/bug-bisect.html
> > ... identify the exact commit which broke caused your issue.
>
>  One heck of a journey! But tested the solution on the first broken
> kernel 6.3. Too chicken to force revert attempts of 6.12 and 6.6 since
> I really didn't understand why revert spewed out 'nah-ah' for a one
> liner. 6.3 passed simple test of no blackouts for 8 in a row boots.
>  Firstly let me qualify the revert, cause it's how i got it to work:
> git show c76e483cd9163138e8fc44d829c986819f072d4f | patch --fuzz=3D999
> -p1 -R
>  It seems simple enough of code which appears to set 8 bits of color
> for rgb as maximum, but with struct changes and me having a
> 'historical' processor :) didn't want to have a non-expert speak that
> this is the full solution.
>  Also note that I didn't 100% follow the bug-bisect guide as mine was
> apparently a unique situation where it had to first learn to connect to
> the internet and I don't use intrd images among other oddities. Also
> did this from last working kernel (6.2.16) to verify it was the last.
> PS had to patch amdgpu Makefile to allow the 6.2 series to compile with
> new gcc (-Wno-error).
>  If need other info or need me to test actual patched 'upstream'
> kernel, I'm here.
> Thank you!
> Steve
>
>
