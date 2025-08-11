Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B30FB2105D
	for <lists+dri-devel@lfdr.de>; Mon, 11 Aug 2025 17:56:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 014F710E049;
	Mon, 11 Aug 2025 15:56:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=fooishbar.org header.i=@fooishbar.org header.b="hVABHw6u";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-f181.google.com (mail-qk1-f181.google.com
 [209.85.222.181])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A0F2210E049
 for <dri-devel@lists.freedesktop.org>; Mon, 11 Aug 2025 15:56:30 +0000 (UTC)
Received: by mail-qk1-f181.google.com with SMTP id
 af79cd13be357-7e6974a290eso424760585a.3
 for <dri-devel@lists.freedesktop.org>; Mon, 11 Aug 2025 08:56:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=fooishbar.org; s=google; t=1754927789; x=1755532589;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=a41FKwvsBmWc/J+JJXLWQ4dhCt6n29839D0Y6dEV2rs=;
 b=hVABHw6uEGrt8I4XG/m7k0v45PF+cvf3BZqEqaBxF2QqerkXjDPl2vt/jawpmtv4XT
 KKIrZEHzYW8Kr090f16M35k8bMc1Q8vrVKcFU2IeLgT2m+fdwal1+JR01ofPwgO4k5i5
 6YXUt6kPyFJyBwYoKZMIEJnBB01UYtq/JdzRU1ldUYG4vqvMIZohISy3XV+p2DAyhMVX
 HqDnNf4w9u8fZRD0qyE2nL1Wda/eJY6kU/f0q86P0akoFOFWoDe+xP13LNY2pcjGKxbQ
 ynN+DWrrt60AKqQYPteOlFM5K4/panyWtlrJtbq6ViIBxjDnJVa9g6s7WjMLo5lGj6mn
 Mxeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1754927789; x=1755532589;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=a41FKwvsBmWc/J+JJXLWQ4dhCt6n29839D0Y6dEV2rs=;
 b=FRlpkZYEiF6S9/NDJ251JUcdSem33lM0rMz2al8YEv2R2Vbh5XDuPckC6663TwXAye
 YY3f4UemNwLTi+BTukJP9xXCVUfceqxeTsqcgSlTjuLHqPjEZTOAIjBnWg27YweSU6H5
 IsE4XXUe90TGgTYN02LM1chYgcusZI30/ists7gBhp/23LFaBhCsVUOrOJUU5/r12zO6
 wUeObFI3cQVML1mudPDUa3JCZDcuo8heawNaUQibspENpvF75I4gg8axFG4TLP2VKffD
 84S0WJWPmSmcsYGUXrtUF9Z6jfyTOa40quEGinAe92PKBloOnFBOIwcNxL46h/GF8fYF
 ykKw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXyYq8NYndIpxq5ZfnmbC8vPr3kfEAHWGeMdj6XlSqLBQmS5k0lOnkYVe7hgLurlHhZ9bziMp/807w=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yx7vJ5lszVIT46Wf346EDdY32DJdeCDdeuMo51W8p6ivSWwmp15
 zCM6J1C9l54tHGR8DfSA1YgsL6GiTXPShwOSYNFcYC0Ca/ygvKtRtri/q4c6mngfxq/11z4xOAa
 bjV3wvyl6NanlbU71a8BqsI7YRIZQnrJsIsXnbA/PEw==
X-Gm-Gg: ASbGncv+R7et2ED8kkP6/eAgetst5VC9dndAVQct+PtViAm2d9WDjpkJyprcVslbavl
 AmldW/XXrl1tCSxbulWPO17XKsfOX3yQTvnlkv8nYsv+SH84Ef+osidW+VBvPL80jB0/hQvQXUP
 73fxpRpoX6Wr3f84tuTq296r4hjjJONTvRBW9tsn2WQbx4x8SeuboMxjU+6XTDIAhD9hS+zews5
 oJVLpg=
X-Google-Smtp-Source: AGHT+IHJ6DLqi3WNGqEnPO7HeedB9JAg2/I96pTu/EofZ9KhmVtvwE6tX0gRtaO8UtmUdEGcL4at8u0aKTObH9/A5WU=
X-Received: by 2002:a05:620a:ab13:b0:7e6:4fc9:6457 with SMTP id
 af79cd13be357-7e8588e5e29mr39306585a.54.1754927789270; Mon, 11 Aug 2025
 08:56:29 -0700 (PDT)
MIME-Version: 1.0
References: <20250808010235.2831853-1-adrian.larumbe@collabora.com>
 <CAPj87rNnjvsJ1P89dv+OtawBXTLwfcaS41mzOL9Z1SwtjRcVJg@mail.gmail.com>
 <c76d9e67-4b2b-443d-b173-76476a7a4317@suse.de>
In-Reply-To: <c76d9e67-4b2b-443d-b173-76476a7a4317@suse.de>
From: Daniel Stone <daniel@fooishbar.org>
Date: Mon, 11 Aug 2025 16:56:17 +0100
X-Gm-Features: Ac12FXzdo3umrCbRk0dXIe8CG-C632a8q7Qp4RAlcg4rABC40XzgtLqLjA3ECcs
Message-ID: <CAPj87rPdJS_pZppfc4BnLWLT+BfikzKhpZJkU2uL8V_OHKYk7g@mail.gmail.com>
Subject: Re: [PATCH v2] drm/panfrost: Print RSS for tiler heap BO's in debugfs
 GEMS file
To: Thomas Zimmermann <tzimmermann@suse.de>
Cc: =?UTF-8?Q?Adri=C3=A1n_Larumbe?= <adrian.larumbe@collabora.com>, 
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 Boris Brezillon <boris.brezillon@collabora.com>, kernel@collabora.com, 
 Christopher Healy <healych@amazon.com>, Daniel Stone <daniels@collabora.com>, 
 Rob Herring <robh@kernel.org>, Steven Price <steven.price@arm.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
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

Hi Thomas,

On Mon, 11 Aug 2025 at 13:11, Thomas Zimmermann <tzimmermann@suse.de> wrote=
:
> Am 08.08.25 um 13:06 schrieb Daniel Stone:
> > On Fri, 8 Aug 2025 at 02:03, Adri=C3=A1n Larumbe
> > <adrian.larumbe@collabora.com> wrote:
> >> Otherwise it would display the virtual allocation size, which is often
> >> much bigger than the RSS.
> > I've pushed this to drm-misc-next-fixes to land in 6.17 with the
> > original commit as well.
>
> I'm going to revert this commit, because of
>
> dim: 216d6d913861 ("drm/panfrost: Print RSS for tiler heap BO's in
> debugfs GEMS file"): committer Signed-off-by missing.
> dim: 216d6d913861 ("drm/panfrost: Print RSS for tiler heap BO's in
> debugfs GEMS file"): Link tag missing.
> dim: WARNING: issues in commits detected, but continuing dry-run
>
> Shall I reapply or do you want to?

Damn, I'm sorry about that; I got too used to b4 shazam, so forgot to
dim b4-shazam instead. I'm happy to reapply.

Cheers,
Daniel
