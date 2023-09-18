Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B51B7A4B02
	for <lists+dri-devel@lfdr.de>; Mon, 18 Sep 2023 16:17:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E019910E18E;
	Mon, 18 Sep 2023 14:17:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oo1-xc2c.google.com (mail-oo1-xc2c.google.com
 [IPv6:2607:f8b0:4864:20::c2c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 26FF110E04D
 for <dri-devel@lists.freedesktop.org>; Mon, 18 Sep 2023 14:17:42 +0000 (UTC)
Received: by mail-oo1-xc2c.google.com with SMTP id
 006d021491bc7-570e63f5224so3017200eaf.0
 for <dri-devel@lists.freedesktop.org>; Mon, 18 Sep 2023 07:17:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1695046661; x=1695651461; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=IDANxb9fCSjFavN7Vsm+4RE0GshHc49i7oi8hDRzPvc=;
 b=mgqbN5vaQuVwAnkLyEoPG7/9yxApai462LLQuvJH0zISN5geSz1AfeG19dgeGYFlGf
 rnu/Sqg142SKW483ydx/gVqZn8RxUTRJTnB85cAgOwFDFsL3KkZXKpH6Ygvo+QELuMcz
 omoFQpcPTuQlMCsAdAFlsKlv9mvKTLe+FPBRMCwo7ea2LBpBSkBVihqZgsu7YrBLlpD8
 1MaTUlkSm25FtI2++EClnLzjpl0M6+U0eJCdBbu1HkLXZc7mp3SHEjvq9sv+xLaP69AU
 gqMRFlEEzahTrtUDGlkUgKYLDyPI5JKFqyQV3AAmHB90MAAUcOBvLwqEzGTgIDeyxANR
 SJAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1695046661; x=1695651461;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=IDANxb9fCSjFavN7Vsm+4RE0GshHc49i7oi8hDRzPvc=;
 b=UTZmhWZYLYjX7KUW5wkhEyjbT6KN/NFSI92UjIDGBtqkf22884R0H6PBux44gN+dYx
 vZ6L7ASyrLEMiDf2MLOC+e0VEJXo27RZPBx4m1ND6fM7vkm5b790k/DV8SC+uiDSZFyv
 cVzVRn16+U8IlB5+TScrkbeQPz2QXMqHWTeMCEbSUussvgS+jE76AqikMf9ZdyayFiqF
 6Y9/+mb5XeZ6bzkE2NR5z0kUDE9fuF38gvYUWJxaeBYd9yDLdZtLfRTnH0LrQfB9pvxM
 //99fzJysEGv7OxMqTKSQNix0oW41kJm8dug4CJd94Hr+4XIWNVgMEL8cOba5o/H1jwJ
 obhQ==
X-Gm-Message-State: AOJu0Yx1CoVag9KADq+relm31CZKxK8qc1mtLlAVusBuqlRF1+7N/ZUQ
 P8sts1BLI9HS0xDMk4ISbVMTGYenlP8rYbszf34mPWEKmng=
X-Google-Smtp-Source: AGHT+IHAPZ0UXJnm8pd1pbzOaSjwAY/9iYqOwHIJBScO4YQ2xTuL4GcsJWxgWhyVDqI5UbwGDXeu1mCIn5ChIIQsLA4=
X-Received: by 2002:a05:6871:6a1:b0:1d5:a377:f389 with SMTP id
 l33-20020a05687106a100b001d5a377f389mr5268578oao.22.1695046661358; Mon, 18
 Sep 2023 07:17:41 -0700 (PDT)
MIME-Version: 1.0
References: <f7583005-73c8-c720-8595-93f616556915@zwiebeltoralf.de>
In-Reply-To: <f7583005-73c8-c720-8595-93f616556915@zwiebeltoralf.de>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Mon, 18 Sep 2023 10:17:30 -0400
Message-ID: <CADnq5_NATDiCWDJE1RtyMdOedD4SZbsbPmj3wcrS3La9o0ABVw@mail.gmail.com>
Subject: Re: WARNING: CPU: 14 PID: 125 at drivers/gpu/drm/drm_mode_object.c:45
 drm_mode_object_add+0x80/0x90 [drm]
To: =?UTF-8?Q?Toralf_F=C3=B6rster?= <tinderbox@zwiebeltoralf.de>
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
Cc: Linux Kernel <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Sep 18, 2023 at 3:17=E2=80=AFAM Toralf F=C3=B6rster
<tinderbox@zwiebeltoralf.de> wrote:
>
> I do suffer since 1 or 2 weeks from amd gpu problems (6.1.53 and before)
> like
>
> Sep 15 16:51:22 p14s kernel: [drm:amdgpu_job_timedout [amdgpu]] *ERROR*
> ring sdma0 timeout, signaled seq=3D122011, emitted seq=3D122013
> Sep 15 16:51:22 p14s kernel: [drm:amdgpu_job_timedout [amdgpu]] *ERROR*
> Process information: process  pid 0 thread  pid 0
> Sep 15 16:51:22 p14s kernel: amdgpu 0000:04:00.0: amdgpu: GPU reset begin=
!
> Sep 15 16:51:23 p14s kernel: amdgpu 0000:04:00.0: amdgpu: free PSP TMR
> buffer
> Sep 15 16:51:23 p14s kernel: amdgpu 0000:04:00.0: amdgpu: MODE2 reset
> Sep 15 16:51:23 p14s kernel: amdgpu 0000:04:00.0: amdgpu: GPU reset
> succeeded, trying to resume
> Sep 15 16:51:23 p14s kernel: [drm] PCIE GART of 1024M enabled (table at
> 0x000000F43FC00000).
> Sep 15 16:51:23 p14s kernel: [drm] PSP is resuming...
> Sep 15 16:51:23 p14s kernel: [drm] reserve 0xa00000 from 0xf43e000000
> for PSP TMR
>
> and tried therefore 6.5.3. But dmesg gives:
>
> WARNING: CPU: 14 PID: 125 at drivers/gpu/drm/drm_mode_object.c:45
> drm_mode_object_add+0x80/0x90 [drm]
> WARNING: CPU: 14 PID: 125 at drivers/gpu/drm/drm_mode_object.c:45
> drm_mode_object_add+0x80/0x90 [drm]
> WARNING: CPU: 14 PID: 125 at drivers/gpu/drm/drm_mode_object.c:45
> drm_mode_object_add+0x80/0x90 [drm]
>
> Are those warning harmless ? Full dmesg and .config are attached.

Yes.  Fixed in this commit:
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?=
id=3D69a959610229

Alex

> TIA
>
> --
> toralf
