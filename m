Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D13FB4784C
	for <lists+dri-devel@lfdr.de>; Sun,  7 Sep 2025 01:24:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 63E1A10E437;
	Sat,  6 Sep 2025 23:24:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="eoGc36bW";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-il1-f180.google.com (mail-il1-f180.google.com
 [209.85.166.180])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 68CE210E435;
 Sat,  6 Sep 2025 23:24:42 +0000 (UTC)
Received: by mail-il1-f180.google.com with SMTP id
 e9e14a558f8ab-3f4d7feef27so21463325ab.3; 
 Sat, 06 Sep 2025 16:24:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1757201081; x=1757805881; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=PGvk2Ayrgpgkvdk1KxrTdWoSL6fwyp7oUyGO2G+FLos=;
 b=eoGc36bWya2k4FPC3e8p+HK7/uMSMLWY5NJcj2n2SbimiNYk4cPtb0q+Xg22J2XYNW
 +aBfW7EVJwh4vlPXuiTDmlL0SZKxZMwkAPjlMQ+ELScbqjudxZlnxmsKGhe0lCfZU3w3
 UuSPVinFIwXc5Rh6jMYZ+MjfFypi4UP234XsKl3fDJe8tLGudjO7M9+JVHVXRhfd3VOQ
 ai+J0kY0rtbtX4gFuyijq+biMDZxzIxdlrCGfZJ9oWJ3tWIL7O1OOIphVaXPZf6+JKHm
 e/Ia9wxIQpqIQLYrdadpz6UA3J338le69k82qt9rLg/apgF1cIJEc9uwsCTrojy4ElKd
 i0hg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1757201081; x=1757805881;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=PGvk2Ayrgpgkvdk1KxrTdWoSL6fwyp7oUyGO2G+FLos=;
 b=Q9EUak7ZA5Fsn8E82IoOpd2p6NHFjHM1E+ZIeZ44ORpXJDQIjdbi2urXS8g5uGaA87
 sDFh1oAODfqYR365W/zuGB0qyF7Kde/1j53wHo3lKoM05gYJ/lGlBagFhuVTDvjGyN+y
 gs8KvTveKq+rLj7GxHZoQMPPmPHk9Nyd9e9K+R6/w3OqM4EgJe6/X3ubJTS62ajmxUga
 aULFIvSS6Y8/sU5L/61LR84ssLMXfKSrQ0I/zzdZo832LKREq89BVZ91XEoYlQQHtGPg
 ly8a+hOqpIPd9JuCzmX1k7guHwdTXBqKZp/xfmNCZY5l2c3sFJbmntBX/M8uPC2kBxHl
 j7Hw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUAqpnm/3FGHuKDBXa2FGr+TOzS68Beygb9ZLpahmtDH8hUjAebgxepaw3R4twSa1oDEt6/AgrLsqgX@lists.freedesktop.org,
 AJvYcCX99rqhGUPNjrVLxqvsyazvXzbsSL3IhtWTN72d8gliGCaBPO8g55zfW78/78fzAlAsNliyreVGd+A=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxeUcn+8Abei5qe5YSaAj1Wt5FHuylGOR7eQv/vU0DQLxJdqXFw
 /cO8BGd/3OicSPp8LDoVJB+Yjs69YVldbaf0/6LP0AuIrwMHXDccmBbugyzfgKFSJlVN2WzcF/p
 IagnPusJF/B+/DheakpNJSgDvuxJEJKw=
X-Gm-Gg: ASbGncuPrdAS/apbDHoRJ3fzy8ctcHo6im9E7F7RkxBHUQuAHmmVqAaU7xj4VmjOa24
 hVGjjbGFbz0qtMQOippd0AMkzg4nd3IQe6sSqQtcIUmYR2mdnzX+JipwxaRC4tu+O+5OE9Y3qhk
 hFQ0DaMie1TxPWtlhHe9eid8peMzkxT6ufq5CUPJpC1k/O4GlsAk3sPZCrJoFQwQM83fC1UJxRT
 Ek+q2ecIRpfpJLX24wHvBOLzqLHcXY8OsUTmjE=
X-Google-Smtp-Source: AGHT+IHbzFuGMDmnv0frhPIhTq5oYnNBUOAk33jBZ607JH+WQ67OjaXktEPH/I3o/DLT4BySNFcTAXpPczzukF4YKsU=
X-Received: by 2002:a05:6e02:4711:b0:402:d4b1:d751 with SMTP id
 e9e14a558f8ab-402d4b1d86fmr17352145ab.1.1757201081308; Sat, 06 Sep 2025
 16:24:41 -0700 (PDT)
MIME-Version: 1.0
References: <20250524-binrep-v2-1-09040177218e@oss.qualcomm.com>
 <6mgmrqmixjdftpjz2hvwjnsyh3wwylxuaih7yez2mdgjpcp3l2@zjr4ai6kkjxn>
In-Reply-To: <6mgmrqmixjdftpjz2hvwjnsyh3wwylxuaih7yez2mdgjpcp3l2@zjr4ai6kkjxn>
From: Rob Clark <robdclark@gmail.com>
Date: Sat, 6 Sep 2025 16:24:29 -0700
X-Gm-Features: Ac12FXzsPBQeiW2jcuLgi_Mcl3QQ3Ze1Zo1qrNITBC_QCVQJV05ZtZCsjicpQXg
Message-ID: <CAF6AEGvJnSiyUJvBPusBZ+mriiP_vRiAgZnTyLSseu8Sdf9PXA@mail.gmail.com>
Subject: Re: [PATCH v2] drivers: gpu: drm: msm: registers: improve
 reproducibility
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Viswanath Kraleti <viswanath.kraleti@oss.qualcomm.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, Ryan Eatmon <reatmon@ti.com>,
 linux-arm-msm@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org, Bruce Ashfield <bruce.ashfield@gmail.com>
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

On Sat, May 24, 2025 at 10:15=E2=80=AFAM Dmitry Baryshkov
<dmitry.baryshkov@oss.qualcomm.com> wrote:
>
> On Sat, May 24, 2025 at 09:25:37PM +0530, Viswanath Kraleti wrote:
> > From: Ryan Eatmon <reatmon@ti.com>
> >
> > The files generated by gen_header.py capture the source path to the
> > input files and the date.  While that can be informative, it varies
> > based on where and when the kernel was built as the full path is
> > captured.
> >
> > Since all of the files that this tool is run on is under the drivers
> > directory, this modifies the application to strip all of the path befor=
e
> > drivers.  Additionally it prints <stripped> instead of the date.
> >
> > Signed-off-by: Ryan Eatmon <reatmon@ti.com>
> > Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
> > Signed-off-by: Viswanath Kraleti <viswanath.kraleti@oss.qualcomm.com>
> > ---
> > The files generated by gen_header.py include the source path to the
> > input files and the build date. While this information can be useful,
> > it inadvertently exposes build system configuration details in the
> > binaries. This hinders binary reproducibility, as the output will
> > vary if the build environment changes.
> >
> > This change was originally submitted to the linux-yocto-dev kernel [1]
> > to address binary reproducibility QA errors. However, the fix is generi=
c
> > enough to be applicable to the mainline kernel and would benefit other
> > distributions as well. So proposing it here for broader inclusion.
> >
> > [1] https://git.yoctoproject.org/linux-yocto-dev/commit/?id=3Df36faf0f9=
f8d8f5b4c43a68e5c6bd83a62253140
> > ---
> > Changes in v2:
> > - Corrected author id
> > - Link to v1: https://lore.kernel.org/r/20250523-binrep-v1-1-c3a4465188=
47@oss.qualcomm.com
> > ---
> >  drivers/gpu/drm/msm/registers/gen_header.py | 8 +++++---
> >  1 file changed, 5 insertions(+), 3 deletions(-)
> >
>
> Acked-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
>
> Rob, WDYT?

I'm revisiting this one, in the context of trying to re-sync
gen_header.py with mesa.. but it is only changing the contents of
comments, so it's not quite clear to me how this ends up mattering for
binary reproducibility.

That said, since the generated files are no longer checked in to mesa
or the kernel, we could probably just drop all of this if it mattered.

BR,
-R
