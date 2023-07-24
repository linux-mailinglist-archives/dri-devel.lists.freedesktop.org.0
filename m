Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 14928760190
	for <lists+dri-devel@lfdr.de>; Mon, 24 Jul 2023 23:53:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2488B10E382;
	Mon, 24 Jul 2023 21:53:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x332.google.com (mail-ot1-x332.google.com
 [IPv6:2607:f8b0:4864:20::332])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3486810E382;
 Mon, 24 Jul 2023 21:53:45 +0000 (UTC)
Received: by mail-ot1-x332.google.com with SMTP id
 46e09a7af769-6bb14c05d77so3276389a34.2; 
 Mon, 24 Jul 2023 14:53:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1690235624; x=1690840424;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=r4SHNWvonq3pTdPu5w/9lA9SaPd7vXM0OcBb+UX7Zcc=;
 b=Totw2DOP+aVvqwlywvLYSHlv7/hFnTw5PoZMFmPdshevUEe+e96+tR5JCJrBTv/7AR
 5H5ZZNZagYQ3qPvvNO2xhWG0QzO0Y90y/UUIvYFpOuVn3YAkv5LE7HTfyd59/lGlqf8x
 trnruv82xA7s3X1xOVLk7oLBCU0dI0p6bukMxZrIbeA2FxMFPYiZJdDwsTJis4Coze1J
 x2624MmavfBFkqursl/yboRQGV2e9bNu+pkNR7/ZdNjxNxQTS4Op9t0qPNAsHqc2Szm9
 HWeHrHDA32xz0vFCCAi4MH0qIr3vac7JLQ9ZDwYq6uRa5Y0gDWTZU8isLOk/Bwi1dH37
 9LvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1690235624; x=1690840424;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=r4SHNWvonq3pTdPu5w/9lA9SaPd7vXM0OcBb+UX7Zcc=;
 b=eGm4jJk2Zw5ByaszthDW4A88ENtNDAg8c4kv4KWtFMiWvCXxIl8ZCQfpfZf2jXgnh6
 bNlJI0DeqDf6JLEiPw6/Dte1uURMBfndcLhckiiTTlAGePdefcSMNOmLtvNhfqjI2Q3A
 AIz6hkj19w7EL0ChW+EjxOM4mV920uIsRXKJKCwRxlMe9JEwU0WsNWze6zX3hdPgO3eh
 6i3xmxac3uihOfTnZFTNZUJHZnC4a0WywHgNoYTJrLIMgfEY7aeVgm0/doHlipg/LYfO
 yFYsm6wzuKXk14xRmUm2kW1UESZCBa5fX3z8Lde3CV0fe62DBE4fj0K6fk/pXLrwlfhM
 fA8A==
X-Gm-Message-State: ABy/qLZFDHJ5MaOshAfJJc2vdTMVVjv1ZXQHWIJ31I3WSUjkM8ulKXd0
 WUcITxl9boXKUmqtrWBkG9ZbNRxyDMlVBlP6uSGWSF80
X-Google-Smtp-Source: APBJJlFIfsDwrK83y95RbhA0I4iIT2y/sEJO0jQBfv+G0amgLdB9nh2cRiNGnstNhk1bHnNuKe9VEbs5ZY6xrwU4tWw=
X-Received: by 2002:a05:6870:b50b:b0:1b3:eec8:fa87 with SMTP id
 v11-20020a056870b50b00b001b3eec8fa87mr12990007oap.42.1690235624460; Mon, 24
 Jul 2023 14:53:44 -0700 (PDT)
MIME-Version: 1.0
References: <20230724084109.9496-1-xujianghui@cdjrlc.com>
 <7fde0c4213bf401813918ac05f313fbb@208suo.com>
In-Reply-To: <7fde0c4213bf401813918ac05f313fbb@208suo.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Mon, 24 Jul 2023 17:53:33 -0400
Message-ID: <CADnq5_MUvvpznMhVB5DabVuNYgiyjbn_QEvTRr=ne7-8Ypc+xg@mail.gmail.com>
Subject: Re: [PATCH] drm/amd/pm: that open brace { should be on the previous
 line
To: sunran001@208suo.com
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
Cc: alexander.deucher@amd.com, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Applied.  Thanks!

On Mon, Jul 24, 2023 at 4:42=E2=80=AFAM <sunran001@208suo.com> wrote:
>
> ERROR: that open brace { should be on the previous line
>
> Signed-off-by: Ran Sun <sunran001@208suo.com>
> ---
>   drivers/gpu/drm/amd/pm/swsmu/inc/smu_11_0_cdr_table.h | 6 ++----
>   1 file changed, 2 insertions(+), 4 deletions(-)
>
> diff --git a/drivers/gpu/drm/amd/pm/swsmu/inc/smu_11_0_cdr_table.h
> b/drivers/gpu/drm/amd/pm/swsmu/inc/smu_11_0_cdr_table.h
> index beab6d7b28b7..630132c4a76b 100644
> --- a/drivers/gpu/drm/amd/pm/swsmu/inc/smu_11_0_cdr_table.h
> +++ b/drivers/gpu/drm/amd/pm/swsmu/inc/smu_11_0_cdr_table.h
> @@ -52,8 +52,7 @@ static unsigned int DbiPrbs7[] =3D
>
>
>   //4096 bytes, 256 byte aligned
> -static unsigned int NoDbiPrbs7[] =3D
> -{
> +static unsigned int NoDbiPrbs7[] =3D {
>       0x0f0f0f0f, 0x0f0f0f0f, 0x0f0f0f0f, 0xf0f00f0f, 0x0f0f0f0f,
> 0x0f0f0f0f, 0xf0f0f0f0, 0x0f0f0f0f, 0x0f0f0f0f, 0xf0f00f0f, 0xf0f00f0f,
> 0x0f0f0f0f, 0xf0f0f0f0, 0xf0f0f0f0, 0x0f0f0f0f, 0xf0f00f0f,
>       0x0f0f0f0f, 0xf0f00f0f, 0xf0f0f0f0, 0x0f0f0f0f, 0xf0f0f0f0,
> 0xf0f00f0f, 0xf0f00f0f, 0xf0f00f0f, 0x0f0ff0f0, 0xf0f0f0f0, 0xf0f0f0f0,
> 0x0f0ff0f0, 0x0f0f0f0f, 0x0f0f0f0f, 0xf0f0f0f0, 0xf0f00f0f,
>       0x0f0f0f0f, 0xf0f00f0f, 0x0f0ff0f0, 0x0f0f0f0f, 0xf0f0f0f0,
> 0x0f0ff0f0, 0xf0f00f0f, 0xf0f00f0f, 0xf0f0f0f0, 0x0f0ff0f0, 0xf0f0f0f0,
> 0xf0f00f0f, 0xf0f0f0f0, 0x0f0f0f0f, 0x0f0ff0f0, 0xf0f00f0f,
> @@ -121,8 +120,7 @@ static unsigned int NoDbiPrbs7[] =3D
>   };
>
>   // 4096 bytes, 256 byte aligned
> -static unsigned int DbiPrbs7[] =3D
> -{
> +static unsigned int DbiPrbs7[] =3D {
>       0xffffffff, 0xffffffff, 0xffffffff, 0x0000ffff, 0xffffffff,
> 0xffffffff, 0x00000000, 0xffffffff, 0xffffffff, 0x0000ffff, 0x0000ffff,
> 0xffffffff, 0x00000000, 0x00000000, 0xffffffff, 0x0000ffff,
>       0xffffffff, 0x0000ffff, 0x00000000, 0xffffffff, 0x00000000,
> 0x0000ffff, 0x0000ffff, 0x0000ffff, 0xffff0000, 0x00000000, 0x00000000,
> 0xffff0000, 0xffffffff, 0xffffffff, 0x00000000, 0x0000ffff,
>       0xffffffff, 0x0000ffff, 0xffff0000, 0xffffffff, 0x00000000,
> 0xffff0000, 0x0000ffff, 0x0000ffff, 0x00000000, 0xffff0000, 0x00000000,
> 0x0000ffff, 0x00000000, 0xffffffff, 0xffff0000, 0x0000ffff,
