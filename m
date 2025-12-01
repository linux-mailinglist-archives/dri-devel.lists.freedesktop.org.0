Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A50A1C98AAA
	for <lists+dri-devel@lfdr.de>; Mon, 01 Dec 2025 19:13:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CAE6510E44A;
	Mon,  1 Dec 2025 18:13:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="lOkZtHAy";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com
 [209.85.210.170])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 031A210E449
 for <dri-devel@lists.freedesktop.org>; Mon,  1 Dec 2025 18:13:18 +0000 (UTC)
Received: by mail-pf1-f170.google.com with SMTP id
 d2e1a72fcca58-7bac5b906bcso511971b3a.3
 for <dri-devel@lists.freedesktop.org>; Mon, 01 Dec 2025 10:13:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1764612797; x=1765217597; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=rZKFL/JEwbljEDVnMiN+HCxuZU9kf3npT0jz2xRcA7Q=;
 b=lOkZtHAyjPxl5v7Q7po+95F7+Crdz+v5UaaeZ0LkDFL0QYwl21GI/xj6tj6Svnit2D
 aoROb8O/mkpvc1gkxEwrqw5gwiVyfTdhUY7aJ+SJLIJvAUJKPb6hPt0MGwodGeCdX2/S
 u2JPIUIlf589NDK58ShyN+pN2YRnOhz2rwXcbNlPRMZBJGxt2lsNzlPc92LDzqcwI6VY
 KuysVJQ8VGaCYIVG+7WWCocbaxsaS85ktDjRv1+P0vv7YB2nQoKbxJs+GYialFULcWHI
 6/5rMFsc5ma6Cz9iQO1Q7f27WhFKiCtPdxhq7hPGo+Qrl1EUcxa3YQo6xWDS0EMpERQP
 KAFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1764612797; x=1765217597;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=rZKFL/JEwbljEDVnMiN+HCxuZU9kf3npT0jz2xRcA7Q=;
 b=csVeU1jw6t/17iPQIiuef62VsOGL2xS0Sd413VllGuPVda+y8973fJcRuH2W3udFGy
 QCRY4hmH8sbjSwPxOec2CR/kNgJHetsWj2PgO6vFyVW0xGv9iGVJMW83jtNYiP34vOoD
 DDSml3gsb47FrqapLR46gWGvfD2ojGMyBxBnRe0tYTTOHZynF/dtbzsyFmlEg2uktJqh
 U/CNKkA7VRn48x44+pidzLvrEhl/OQyCRKpFzjQCsLolxCkfoQUxXslOafDRgL4W3DVh
 ToliHUhM/BTHuWf61a7aei26dIyeyvVCbde1MMAlREfTYZTs0a3RdSv3lMuIGE0tDmJH
 llmw==
X-Gm-Message-State: AOJu0Yy4d+kpOgm8ZioknRsjrdUgC8qNmXOyJ22HFdiEfHsWDw6Kl+ef
 gnA2nn/+0CQCzazzU1BtLkuJtrGCLVYMjY4JFi77UsVQXRICt9R0zdo6W0CBleikvDdZ+/2P4R9
 4w/QOZS8vkYpO/ViZvH0ayYBIRUraJVOexg==
X-Gm-Gg: ASbGncuRC5kng2xFw5bQZloWhr2/EJuOJY03ucAbxKiIYSTTaI4jIM/iTyIYMfRB6ux
 lkm6GprbwfhWTuMGtzLQG8dlh9qB8fMfD8/CNVxnOqPpRAnOBKCpakwPXRBPhnpub124c2XQE85
 1A7KSO86ly2U6fVLY/cMWZJUUCcUhOQL+hlaFyvlJ7SV+pD8N3C2WEim3wilvjwZn1j/c41maQN
 8x9aKKqzq7bonv7Dsqb42Bfc9Sv8UH8pHve4+mYvgs5dKip7jkQziKLaQOMuJsFS91yH7U=
X-Google-Smtp-Source: AGHT+IEko7+6ZQfi2SHPHswwqWhnkJEszsunfElDB7n2BH9Cvzj1GBhb6ZX5FoUjJkiIep9k8GRdbYR+fNG/2OVGzQI=
X-Received: by 2002:a05:7023:c007:b0:11b:ad6a:6e39 with SMTP id
 a92af1059eb24-11c9f3a16demr15258433c88.5.1764612797406; Mon, 01 Dec 2025
 10:13:17 -0800 (PST)
MIME-Version: 1.0
References: <20250325210517.2097188-1-bradynorander@gmail.com>
 <CADnq5_MNBUY=jWbnq-gZQ_4_M_sBJGAgMD0bj2cMdnkoU9G=HA@mail.gmail.com>
 <9ab05b38-6f77-4b0b-8a1b-8314e2873047@gmail.com>
 <CADnq5_No+w+tco9j35GBM3+CYBTo018eLwWec278d3VBJHPQxw@mail.gmail.com>
 <7462992a-fdc1-44ff-9604-ca5a9feaef07@gmail.com>
In-Reply-To: <7462992a-fdc1-44ff-9604-ca5a9feaef07@gmail.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Mon, 1 Dec 2025 13:13:06 -0500
X-Gm-Features: AWmQ_bk2sFxl2w_v6h4bWnH-9snjeEy59H2TxSLFYb1U9EE4s8zd-Xrk4mUxofc
Message-ID: <CADnq5_Mat5hBpBFit+ETwOSv8m3vdZVo02Zk6F4GrmJzNGvksA@mail.gmail.com>
Subject: Re: [PATCH] drm/amdgpu: use static ids for ACP platform devs
To: Brady Norander <bradynorander@gmail.com>
Cc: dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org, alexander.deucher@amd.com, 
 christian.koenig@amd.com, airlied@gmail.com, simona@ffwll.ch, 
 sunil.khatri@amd.com, boyuan.zhang@amd.com
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

Applied.  Thanks.

Alex

On Sun, Nov 30, 2025 at 8:48=E2=80=AFAM Brady Norander <bradynorander@gmail=
.com> wrote:
>
> On 11/10/25 14:14, Alex Deucher wrote:
> > On Tue, Mar 25, 2025 at 7:11=E2=80=AFPM Brady Norander <bradynorander@g=
mail.com> wrote:
> >>
> >> On 3/25/25 6:12 PM, Alex Deucher wrote:
> >>>
> >>> While you are at it, can you take a look at
> >>> drivers/gpu/drm/amd/amdgpu/isp_v4_1_0.c and
> >>> drivers/gpu/drm/amd/amdgpu/isp_v4_1_1.c as well?
> >>>
> >>> Alex
> >>
> >> I think it makes more sense to handle that in a separate patch as it i=
s
> >> an unrelated ip block.
> >
> > Sure. Can you send a patch to fix those up as well if needed?
> >
> > Alex
>
> Sorry to nag again, but can we look into getting this patch merged? The
> ASoC patch has already been merged and it would be nice to have audio
> working on this platform.
