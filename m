Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 118DD96CA29
	for <lists+dri-devel@lfdr.de>; Thu,  5 Sep 2024 00:21:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C20BA10E308;
	Wed,  4 Sep 2024 22:21:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="fpFZ8lKr";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qv1-f50.google.com (mail-qv1-f50.google.com
 [209.85.219.50])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2FA0B10E105;
 Wed,  4 Sep 2024 22:21:17 +0000 (UTC)
Received: by mail-qv1-f50.google.com with SMTP id
 6a1803df08f44-6c35427935eso643576d6.3; 
 Wed, 04 Sep 2024 15:21:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1725488476; x=1726093276; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=t4BjDZksMUGjCuuM0wynyggvya2SNR5AumLLo86Iig0=;
 b=fpFZ8lKrusCQUWYVytMt1vaWrwIFFWzgecY+LjWv5fjr4I9gOokJE54Qp7fA90IptG
 iYTFxp7ZZJzBFfKiog/yGWw3PzfCpS+cTDCc+bi1LWNcZUq9aji1vJykDYco46g79dMj
 BpfzXZrSZntu3uRRES1qo4U0ViyPLs4qDRCS0LSWpVQaaEiyXPynDAL3rG7gF8AXB4TM
 3qJCFV/n4RNbu3KqhS4++vrzw9oK6YcmeXT1fYASxm3qQY/Xt/cYk/w71axVB+fUkAyX
 L1Mv6go7/Mhn+7JMuwCem2FKirBsecVbn6+4gsyhYlCdCYne2qvMW9fN9wH6Hdu8GICj
 Iqcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1725488476; x=1726093276;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=t4BjDZksMUGjCuuM0wynyggvya2SNR5AumLLo86Iig0=;
 b=klr90ss0sOyYwxfd0K/cddt/bF1txfjSPlqJiGwDRkNvXn+iZfNWBrM8kVAYfLQuJI
 XMB2qfknh0ySknsHQ9taF1lJeear3Q/GMZN6h2O3dxfqT3fLrdbLxCbH5xuf4frd+sus
 SEBaReThX9BOvJn7Jiun6wcePdq8o/TiZKlE19YSSFvsn972HTX4SdVbnDJ3E+jUuhHe
 KkYZI1k+R2d999unFKP+eS8oMMxn6Wmi5HpScOLMlIsXMPCPChoQsEWs3TvqWP/n7tnW
 UullwTVgSg4A//hRW3iMCTy7jQCpxtM0Nebjs7dMDBQKhkp2in617tVJBhYOUNS9aAzc
 3wYQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXkzZvDMMfe7XsPIzANvTRVuLjkeKwbzka6CsiaT1TC6HOdoXYw9hatHPJNTm82Iw8zvyua5+xb@lists.freedesktop.org,
 AJvYcCXyuMTrla4FNV2CQ2FRjbr3cNLfZ7z+VCiJMOJJIyTVzXvrw3oXLCuawwo2sV2Vek7q2i5Qq+BLwikm@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyWyUXfQMvFWcwwZKWEQm1ueQzVe9ncY1E1+hfohwQ0E/V5GphS
 YDcF+Ykyzg3LJuhSlly6lmQy7XelMjmCVcpLb+7KrlD+gr8WQqIEEZs093gDVHFX4e7jxPJ5RV9
 HKqfb1zwGPjtKVmpcPCsEBVUB1t4=
X-Google-Smtp-Source: AGHT+IFUOq7qSUlT45ozs1TrcJSJs8d8rLTchRCNkpOywHMb8zMgW3uQ2l0Hzk1KL3FjPWZ5G4dl6rpuBhPseFk8n3A=
X-Received: by 2002:a05:6214:338a:b0:6b5:eba0:d0ab with SMTP id
 6a1803df08f44-6c355684df7mr145628906d6.15.1725488475868; Wed, 04 Sep 2024
 15:21:15 -0700 (PDT)
MIME-Version: 1.0
References: <CABXGCsNgx6gQCqBq-L2P15ydaN_66sM9CgGa9GQYNzQsaa6Dkg@mail.gmail.com>
 <CABXGCsNztS8MLteq5=fcddwuQ1TCzeOM8TdVtpJ3crK=sV5PTQ@mail.gmail.com>
 <CABXGCsMdxHJ-MLkS0pm51Sk8g0PTghsuZxmowvj5t44bVN4ndA@mail.gmail.com>
 <ffd2c40c-1c2e-4465-b26f-88d5e08a80d9@amd.com>
In-Reply-To: <ffd2c40c-1c2e-4465-b26f-88d5e08a80d9@amd.com>
From: Mikhail Gavrilov <mikhail.v.gavrilov@gmail.com>
Date: Thu, 5 Sep 2024 03:21:04 +0500
Message-ID: <CABXGCsOoL5vD0+FRALFQFr3ZBpb2z5mpGKzAD5RHoW9_sb5yaQ@mail.gmail.com>
Subject: Re: 6.11/regression/bisected - after commit 1b04dcca4fb1, launching
 some RenPy games causes computer hang
To: Leo Li <sunpeng.li@amd.com>
Cc: Harry Wentland <harry.wentland@amd.com>, zaeem.mohamed@amd.com, 
 pekka.paalanen@collabora.com, "Wheeler, Daniel" <daniel.wheeler@amd.com>, 
 "Deucher, Alexander" <alexander.deucher@amd.com>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>, 
 dri-devel <dri-devel@lists.freedesktop.org>, 
 Linux List Kernel Mailing <linux-kernel@vger.kernel.org>, 
 Linux regressions mailing list <regressions@lists.linux.dev>
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

On Wed, Sep 4, 2024 at 4:15=E2=80=AFAM Leo Li <sunpeng.li@amd.com> wrote:
> Hi Mike,
>
> Super sorry for the ridiculous wait. Your first two emails slipped by my =
inbox,
> which is really silly, given I'm first in the to field...
>
> Thanks for bisecting and finding a free game to reproduce it on. I did no=
t have
> luck reproducing this today, but I am on sway and not gnome. While I get =
gnome
> set up, will you be able to test which one of these reverts fixes the han=
g for
> you? Whether just 1/2 is enough, or both 1/2 and 2/2 is required?
>
> I applied them on top of Linus's v6.11-rc6 tag, so hopefully they'll git =
am
> cleanly for you:
>
> 1/2:
> https://gist.github.com/leeonadoh/69147b5fa8d815b39c5f4c3e005cca28#file-0=
001-revert-drm-amd-display-move-primary-plane-zpos-highe-patch
> 2/2:
> https://gist.github.com/leeonadoh/69147b5fa8d815b39c5f4c3e005cca28#file-0=
002-revert-drm-amd-display-introduce-overlay-cursor-mode-patch
>

The first patch is not enough.
Yes, it fixes the system hang when I launch the game "Find the Orange Narwh=
al".
But it does not fix the issue completely.
Some RenPy games still can lead the system to hang.
For example "Innocence Or Money Season 1"
https://store.steampowered.com/app/1958390/Innocence_Or_Money_Season_1__Epi=
sodes_1_to_3/
on the language selection screen.

Unfortunately the kernel is not builded with both patches.
I have got compilation error after applying second patch:

  CC [M]  drivers/gpu/drm/nouveau/nvkm/engine/fifo/chid.o
drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/amdgpu_dm.c: In
function =E2=80=98amdgpu_dm_atomic_check=E2=80=99:
drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/amdgpu_dm.c:11003:69:
error: unused variable =E2=80=98new_cursor_state=E2=80=99 [-Werror=3Dunused=
-variable]
11003 |         struct drm_plane_state *old_plane_state,
*new_plane_state, *new_cursor_state;
      |
     ^~~~~~~~~~~~~~~~
  CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dc/basics/conversion.o
***
  CC [M]  drivers/gpu/drm/nouveau/nvkm/engine/gr/tu102.o
cc1: all warnings being treated as errors
  CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dc/dml/calcs/dcn_calc_auto.=
o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/engine/gr/ga102.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/engine/gr/ad102.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/engine/gr/r535.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dc/clk_mgr/clk_mgr.o
  CC [M]  drivers/gpu/drm/nouveau/nvkm/engine/gr/ctxnv40.o
  CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dc/clk_mgr/dce60/dce60_clk_=
mgr.o
make[6]: *** [scripts/Makefile.build:244:
drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/amdgpu_dm.o] Error 1
make[6]: *** Waiting for unfinished jobs....
  CC [M]  drivers/gpu/drm/nouveau/nvkm/engine/gr/ctxnv50.o
***
make[5]: *** [scripts/Makefile.build:485: drivers/gpu/drm/amd/amdgpu] Error=
 2
make[4]: *** [scripts/Makefile.build:485: drivers/gpu/drm] Error 2
make[3]: *** [scripts/Makefile.build:485: drivers/gpu] Error 2
make[2]: *** [scripts/Makefile.build:485: drivers] Error 2
make[1]: *** [/home/mikhail/packaging-work/git/linux-3/Makefile:1925: .] Er=
ror 2
make: *** [Makefile:224: __sub-make] Error 2

--=20
Best Regards,
Mike Gavrilov.
