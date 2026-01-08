Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F35CD03209
	for <lists+dri-devel@lfdr.de>; Thu, 08 Jan 2026 14:45:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E5EB010E736;
	Thu,  8 Jan 2026 13:45:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="laVDJOxN";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-dl1-f43.google.com (mail-dl1-f43.google.com [74.125.82.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 74BD710E735
 for <dri-devel@lists.freedesktop.org>; Thu,  8 Jan 2026 13:45:24 +0000 (UTC)
Received: by mail-dl1-f43.google.com with SMTP id
 a92af1059eb24-11f42eaff60so287059c88.3
 for <dri-devel@lists.freedesktop.org>; Thu, 08 Jan 2026 05:45:24 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1767879924; cv=none;
 d=google.com; s=arc-20240605;
 b=GCff4QYU4VUFqkiNs4DnKNsAAljV2r2kC65IB0N4SlXQQZ9vpBMio7HoPsB4yv0jdk
 vstZqyGMcy2s88zU0Ry1aAnwjGc89ggmxdD1BNu3MkazgwaVivlOcnMxKMu7Kw5kBtwT
 3YfqbaEvLxuhHmz6DsJwkxh9NrUeNW3V6wVIHqIlMUzIxNOgoUkcjAhFEpk5d+sEUXlF
 EOfMELur9AA1iwwOKOkOD/MNYtwEv0jwf+T2YA6qOo3HwBb5rcjPFlObIUG0LlZTtVnE
 Kld+n4rQN4Rb5FpqJxt8hjCcM1eHyJSn6UD6XeIkDAAp10otltzuIMXAWFqn/jgIawQn
 NQ5A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:dkim-signature;
 bh=5kQ2xUBja8BPoXZgKKixyqanUA0WqT9oPPSrbJ2WMqY=;
 fh=E8RfhqaxDK51FSEa/zD53lcfi+BRw2n5pHiiO5HX/pM=;
 b=T3CYOHXPnOynJjOBxm8MmEcOv/7CBosMOTqjn/nBON6zyI3cYxI+lrqUyCX0AqAOgC
 QJJjyVHEdVJVu8IlehnpbbRMAPFiXFEyZ/pieaz6+r0ObuZpE0mTkgn2XJUsFTeRMpK2
 jh4mPePPPrMqRhSmr8RBX4AL8xVYFAO15qlh1uh/UpNXJ8ya8aDfL9bdQ7816Xac0A3O
 hlXh1yS0ijJsmlMPhju6c0+HT0v92mAACsWtBF0QzLRaEtZHd+O2xIRMoNC8agOhTOMv
 Y10S0MQlax9lh+i9YXaZ+2nkdlql5mFpRJrx+mrXE8ezJ2dTPgUcrvypnD5lPVLkp9GJ
 Z9rg==; darn=lists.freedesktop.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1767879924; x=1768484724; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=5kQ2xUBja8BPoXZgKKixyqanUA0WqT9oPPSrbJ2WMqY=;
 b=laVDJOxNi2I+YZMsIO2Ti4NB/zMl1fO+sCl2fqK/th/gB2wU1u4rnU6jE4vrx7l0Au
 FlLpRB7wTgYB1iXa368EK+6VmxkUf2x3gJwOV6BJK+D2KDVKxej6y8l1232cahGjPUso
 ixWs24x/UOwM6BvcsFZaJYsvMp0SbvWRh3gtBd0mk5leaYoFbNz59lysfOBXItl2LDg+
 YQUtZeEKsB1WvC/HFMRro5EYOvws0h1bjkCh3qQM7ldFz1JiRtqETr8zhFqbATHp1fEZ
 SCSSy8J0rvjx0GhUoFoby/E1TFjaG+/oeam+mGcvnjieOTj3cJJm6vxN67Wx4A8l/CRj
 QsXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1767879924; x=1768484724;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=5kQ2xUBja8BPoXZgKKixyqanUA0WqT9oPPSrbJ2WMqY=;
 b=o9Exv9TBD9gYS68SuiM7e44V18YNI3XKycBrz7D1GBVm5IAWHdcWZCLqvF9ZUUfyUi
 BBgZb3n6O/oEnADueufugq4wmruJb4tn4m7Fj7QlZK1rm7dk/0E1/iQbF/0a7i7Edksl
 kmeNxV0wzqRpDjSM1hgNBj8tyXpPROsldFudkXoaRHe0sTPUld42Lw1masiBvZF33qMn
 5WHHjK+C6Z/pUWwU9weQDzdOezgnhShrBJvGPM8FBnAWI/0bZ8vFtbzgHGbljQMgnVfl
 48rQ/+gUSFyuHEddhXnh9dAxKe0utdWsXe/slvIa3V6aO9qRVGYfQHBPVJlbMJPthSx6
 iC0g==
X-Gm-Message-State: AOJu0YwAmMo7xtSqTEcTp9idEGSAHlocabrtA6NJ84vqCad27FOFIeQq
 Hpk2RvjFtRpyx7fk/Dd0ZT3XeK1YYz1vuvAthQhQxo7g6EmPcw0ChkZNAFICLECwjGlZ8YlrPIX
 5ARnqkIgy5SxT1N1xxvj360zAKNT8o10=
X-Gm-Gg: AY/fxX7k6wwOoY8nanv2KXqfFOWg55sS9zVQuOzZGuFYiowWhthkQYKPoRT4TA+MM31
 kIHOKMLF+TvVuy1p8FnADrwMdLdr603Aji73UHLs1TpiOO4CvQAajj75ccSPivEt2sTGXqtq0ws
 j4y4/Pzy8csPyelEOBNu7W7EIa01w8isJsKtBDAEilcYJQUWMuHc4NKSDYMMx3xZzKbeDjru97I
 4uY3NrNpz9HprO1KGQKnWg4v6bzEJZnJpxddbXXMPRMtFb/wz10syXMOoYWY7CIAWjHFMt8xJ58
 9GzGggw=
X-Google-Smtp-Source: AGHT+IEBdT/4NQPN1Q/dZKLpUk5ZjD5kfC8Qu4NKTxN7CASsd1b5HxOvqIf2jcUrrdSL7grjTpF/8/huDcpRGx09DGk=
X-Received: by 2002:a05:7022:30b:b0:11e:3e9:3e98 with SMTP id
 a92af1059eb24-121f8b770a1mr2665225c88.7.1767879923526; Thu, 08 Jan 2026
 05:45:23 -0800 (PST)
MIME-Version: 1.0
References: <x22LVmFvTwDrklnrfzto0X8folnEtLitNgQKjJxtTH99P9Bplb8S28jJT74Eqd_9w3jfQepZ5Q62_bIw6DhpzG5iDiTboHr-8B8Ilx3Qjzg=@proton.me>
In-Reply-To: <x22LVmFvTwDrklnrfzto0X8folnEtLitNgQKjJxtTH99P9Bplb8S28jJT74Eqd_9w3jfQepZ5Q62_bIw6DhpzG5iDiTboHr-8B8Ilx3Qjzg=@proton.me>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Thu, 8 Jan 2026 08:45:12 -0500
X-Gm-Features: AQt7F2r9b6T3KTqlzpOXr8acssEsjb91F3IbJYBGIxUXINPOAbbEyhP0aqPoATc
Message-ID: <CADnq5_OoZeFi-VeeMV4AMDxgt+__TmAiN6WE+m0hmYXtmSjx1Q@mail.gmail.com>
Subject: Re: External HDMI monitor fails to wake up from DPMS/consoleblank
 since kernel 6.18
To: alliancetrooper <alliancetrooper@proton.me>
Cc: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, 
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, 
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>
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

On Wed, Jan 7, 2026 at 5:42=E2=80=AFPM alliancetrooper
<alliancetrooper@proton.me> wrote:
>
> Hello.
>
> I am reporting a regression in the kernel. an external HDMI monitor fails=
 to wake up from a low-power state.
> The issue occurs both in the VT console (using consoleblank parameter) an=
d in the X.Org graphical session (using xset dpms force off).
> The internal laptop display resumes correctly. This problem was not prese=
nt in Linux kernel 6.17. It started occurring after updating to kernel 6.18=
.0.

Please file a ticket at:
https://gitlab.freedesktop.org/drm/amd/-/issues

Can you bisect?

Thanks,

Alex

> My Kernel: 6.18.3, built from vanilla sources in Gentoo. Display controll=
er: Advanced Micro Devices, Inc. [AMD/ATI] Strix [Radeon 880M / 890M] (rev =
c4).
>
> No messages in dmesg regarding this.
>
> Steps to Reproduce:
> 1.  Connect an external monitor via HDMI.
> 2.  Boot with the kernel parameter consoleblank=3D30.
> 3.  Wait 30 seconds for the screen to blank and some time (no more than 5=
 mins) additionally.
> 4.  Try to wake the display by pressing a key. The external monitor remai=
ns off, while the internal laptop display turns on.
> 5.  Also reproducible in X11/Xorg session using xset dpms force off. It i=
s also needed to spent some time in off state.
>
> Thank you.
