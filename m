Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E4A1757FAE
	for <lists+dri-devel@lfdr.de>; Tue, 18 Jul 2023 16:35:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7B2E910E367;
	Tue, 18 Jul 2023 14:34:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x235.google.com (mail-oi1-x235.google.com
 [IPv6:2607:f8b0:4864:20::235])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 83B1D10E363;
 Tue, 18 Jul 2023 14:34:50 +0000 (UTC)
Received: by mail-oi1-x235.google.com with SMTP id
 5614622812f47-3a38953c928so4083494b6e.1; 
 Tue, 18 Jul 2023 07:34:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1689690889; x=1692282889;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=gqZASbUSLs/4+sh3KkkB2pzPrQYa5qP3ESXWTg+1yuU=;
 b=OgXmvj9K/Jc8X81/HC/BY5Sk28n1yC+yn6Jiaxy2Uk2YFx0rTutGSuypOEcq5lhCXM
 b+JenxBCS7F9ZBFSZhSc1DczKBKwV/2sSe0/4x/mvD3DimwzYIR1pZDX5VLzJeeFaTgm
 x/r7Yf1qSWVBmDdCX7PWber1kNmXLbCdtvLoDcOQZXA1oBERYybHBqhWW4XUIR6to5Bf
 HEkk3ZBJToKcuto2/A+NgyCSAfo9fyVXCNUBf6CYG/jcU3yfTEO0wwiXbtPm21y1mG7M
 AGY1ZkhFvOZJl6zsHmLCzSxsAaVCap37irkGmONu2I2c8f48gfRSIrnUq1J8o2Y24PeO
 RhAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1689690889; x=1692282889;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=gqZASbUSLs/4+sh3KkkB2pzPrQYa5qP3ESXWTg+1yuU=;
 b=jrbqCGMs8J6p04+uQDdBcHo75RPqSo/1c+9Hqo0cQbu3XsQHySEwuNFCaOQSzJCpII
 tpzEZxywc97ktG7x1Xv54S7CC9QCljewo8cj5yRav/0I+TU0llwf7hVj2EluFtStS0qE
 Tm+lRj4G2ZnG/PkMFATrWfeY7rv5Wr93cRxL4YA98KgcGVOUGgJ9zVyEDTbEYgsjiCa0
 pj2rdrJvwdqydJA+5srcq+JT3eaOPKJ1l4yoypc4SUuzqTVhTYMKX1I2c8GDWYj/Dm1k
 Lj7FwhqLeNw+N/5UI1RcwzUw/H7IKVN5oH5ECtSCdtiUPW/9TYNvABZgDAwdDnflN1nt
 C8Lg==
X-Gm-Message-State: ABy/qLYFKKoMLuC3f3kXhM584BKCpEdaoJxDzLTbrXZYj45TFHxVl/4L
 KgQU1RHzjKKiXt+l7sTIBkhNckNHvvW4CNRjvo4=
X-Google-Smtp-Source: APBJJlGfXJg5VFyKsFvni80V3YE397IUwqaDBgN8fkFYrFZWn7PrYlFRnGMd9JRnky5bYSfYJozT9lnPW1g5OT4EmZA=
X-Received: by 2002:a05:6808:159e:b0:3a4:3c87:675f with SMTP id
 t30-20020a056808159e00b003a43c87675fmr14984240oiw.52.1689690889052; Tue, 18
 Jul 2023 07:34:49 -0700 (PDT)
MIME-Version: 1.0
References: <20230714060105.13377-1-xujianghui@cdjrlc.com>
 <e565a40b4ae73352204fbf49e55de452@208suo.com>
In-Reply-To: <e565a40b4ae73352204fbf49e55de452@208suo.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Tue, 18 Jul 2023 10:34:37 -0400
Message-ID: <CADnq5_NFZWUJO-MiLq6krqKJAzD8qkGTkA3qkE9bV7Pj9kLP6Q@mail.gmail.com>
Subject: Re: [PATCH] drm/amd: open brace '{' following struct go on the same
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
Cc: amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

I'm happy to apply these patches, but please check your mailer.  The
formatting is messed up and they don't apply cleanly.  Please use
git-format-patch and git-send-email to generate and send the patches.

Thanks!

Alex

On Fri, Jul 14, 2023 at 2:04=E2=80=AFAM <sunran001@208suo.com> wrote:
>
> Fix the checkpatch error as open brace '{' following struct should
> go on the same line.
>
> Signed-off-by: Ran Sun <sunran001@208suo.com>
> ---
>   drivers/gpu/drm/amd/include/yellow_carp_offset.h | 6 ++----
>   1 file changed, 2 insertions(+), 4 deletions(-)
>
> diff --git a/drivers/gpu/drm/amd/include/yellow_carp_offset.h
> b/drivers/gpu/drm/amd/include/yellow_carp_offset.h
> index 0fea6a746611..a2c8dca2425e 100644
> --- a/drivers/gpu/drm/amd/include/yellow_carp_offset.h
> +++ b/drivers/gpu/drm/amd/include/yellow_carp_offset.h
> @@ -7,13 +7,11 @@
>   #define MAX_SEGMENT                                         6
>
> -struct IP_BASE_INSTANCE
> -{
> +struct IP_BASE_INSTANCE {
>       unsigned int segment[MAX_SEGMENT];
>   } __maybe_unused;
>
> -struct IP_BASE
> -{
> +struct IP_BASE {
>       struct IP_BASE_INSTANCE instance[MAX_INSTANCE];
>   } __maybe_unused;
