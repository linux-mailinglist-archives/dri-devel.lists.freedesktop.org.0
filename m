Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C0746F3183
	for <lists+dri-devel@lfdr.de>; Mon,  1 May 2023 15:27:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 556F910E0B7;
	Mon,  1 May 2023 13:27:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x329.google.com (mail-ot1-x329.google.com
 [IPv6:2607:f8b0:4864:20::329])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 198B910E0B7;
 Mon,  1 May 2023 13:27:16 +0000 (UTC)
Received: by mail-ot1-x329.google.com with SMTP id
 46e09a7af769-6a604259983so1860844a34.2; 
 Mon, 01 May 2023 06:27:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1682947635; x=1685539635;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=+SRkX38MRdzPiGInLxtyxcayxdTazEZbBoK0zR3RRn8=;
 b=d/2ynuGkGU0+C8CoYYk+HLNdwCZM1mCTw2354Pp2LJVewmfHA1JIkSMcZhO6iAPhiX
 M79WLERTM6QYJITZnEb1wLLhN+f8hWQ3fNy6vEgFYoGYtVbRJ7oRiQtjhUnm3jWXUa0A
 ZvZ7rjqoBaozBj9xnIb3Kw5q+aIP+XBnx6oxp9NNb0igDCA3Z8aI/JXy/0vSKoL/dRfF
 Km0VYNONe4tsVW156iS62AxCTfwKiCfnG+01hFdztRz21to8Bp02lWJr4Sr0xPb6rZs0
 VyzE4ORsWo1XW/mcdNoE0PaCABl06uopst7zFwuZtebr+ourOyC7kULgMRTIKt7zUv0A
 dpfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682947635; x=1685539635;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=+SRkX38MRdzPiGInLxtyxcayxdTazEZbBoK0zR3RRn8=;
 b=gTcLS3XTdTDgtUFjgczZCj9b8yd9dhOEodu3DVv4XP9z/bsvQpsMRN1rDYqh3UmAB0
 eMLeyA1E+sJ/1fdh1p/v/vZX3qgqD7b4TEebFHJZRbf/YzHPwP4pbDQ7e6hAfdqdQDCb
 OnkWKn+ZB97F6DKMmFvkGNSQRGpajDrThH7OY7ZFNadc0Dvzi8oDFlp9MhiMVAy/yyzE
 IvZXj3m+wqkki2lmdrzFGuz00VtzcZBeDJA3ULvI891MFxRb3rGJgeStg7r+FI7s+fhM
 lULa6YxBQbngnT9p32EK7Ak7rxwnG8wDpawuJ3Yz+gdiQDBPmjtF3P58k3av+WxmQabg
 +LaQ==
X-Gm-Message-State: AC+VfDxnTuTCT7VsyBI1Bh7x/jUwYJpi6fq/pXfYS8FVfC59n//Tlj5U
 5t8IXatoqc2/tMVH+Tq0gl3C21U/ABgG/jQVnyV0qUovVJA=
X-Google-Smtp-Source: ACHHUZ7IYC33M8jWWK0vSNPN30ZMiS9tuI3x0R8GFOmhLxkNfEvKAs1v+MipIrUvkxeBh2eP9tcmmFtSgHEPzsBV9KE=
X-Received: by 2002:a54:4482:0:b0:38e:eaf:cf1f with SMTP id
 v2-20020a544482000000b0038e0eafcf1fmr6077521oiv.44.1682947635160; Mon, 01 May
 2023 06:27:15 -0700 (PDT)
MIME-Version: 1.0
References: <46a7eb80-5f09-4f6a-4fd3-9550dafd497c@felixrichter.tech>
In-Reply-To: <46a7eb80-5f09-4f6a-4fd3-9550dafd497c@felixrichter.tech>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Mon, 1 May 2023 09:27:03 -0400
Message-ID: <CADnq5_Nuu7hAFR6A8SqaENA_CUV_F3J1qgCwE=Yn_1rY-n5GLg@mail.gmail.com>
Subject: Re: PROBLEM: AMD Ryzen 9 7950X iGPU - Blinking Issue
To: Felix Richter <judge@felixrichter.tech>
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
Cc: dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, May 1, 2023 at 3:20=E2=80=AFAM Felix Richter <judge@felixrichter.te=
ch> wrote:
>
> Hi,
>
> I am running into an issue with the integrated GPU of the Ryzen 9 7950X. =
It seems to be a regression from kernel version 6.1 to 6.2.
> The bug materializes in from of my monitor blinking, meaning it turns ful=
l white shortly. This happens very often so that the system becomes unpleas=
ant to use.
>
> I am running the Archlinux Kernel:
> The Issue happens on the bleeding edge kernel: 6.2.13
> Switching back to the LTS kernel resolves the issue: 6.1.26
>
> I have two monitors attached to the system. One 42 inch 4k Display and a =
24 inch 1080p Display and am running sway as my desktop.
>
> Let me know if there is more information I could provide to help narrow d=
own the issue.

It's related to scatter/gather display.  As a workaround, you can
disable scatter/gather display by setting amd.sg_display=3D0 on the
kernel command line in grub.  It's fixed properly in:
https://gitlab.freedesktop.org/agd5f/linux/-/commit/08da182175db4c7f8085035=
4849d95f2670e8cd9
Which should land in Linus' tree this week.

Alex
