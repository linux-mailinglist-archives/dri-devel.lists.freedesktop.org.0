Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CDB25AC1584
	for <lists+dri-devel@lfdr.de>; Thu, 22 May 2025 22:33:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C4D9510E053;
	Thu, 22 May 2025 20:33:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="mmHRsQDT";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com
 [209.85.218.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B218110E053;
 Thu, 22 May 2025 20:33:00 +0000 (UTC)
Received: by mail-ej1-f44.google.com with SMTP id
 a640c23a62f3a-ad52d9be53cso1075298066b.2; 
 Thu, 22 May 2025 13:33:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1747945976; x=1748550776; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=QJkOx/dDvdJDVf5zaqpKhWQ4ZhXUcCkmy6d8HyLwmRI=;
 b=mmHRsQDTAdJl9YC3wSuh5Wp8/CGrNCcdgbbpBTjfCxTPW7/hofvJLUQIQBQmulT+/Z
 n+mSKBbVhtYqpTDExCw6iu+hiHo/xXfuoQsz82nv4bFQY/iSDk14bf6IPZiZk5XmZ/bs
 ad9ggYpqOyuwlhWxd7Xm6coQVOr4OxVo83tTYG59pqF1hwa72Vv1sG2XmNqK/hgyCNcC
 d10CAOJl7myAMxfbGf/C5c51v9f4EzyPBeAxZZYK98hf/jUKFJcTsWvd8esKvt0i2oph
 UH0ErOfc3qNQ4yC9/twC0KhY2jUGX0MrvLAhczsthSj7A7Xb3uUG4kYw8AYg9JRjndT4
 Pp4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1747945976; x=1748550776;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=QJkOx/dDvdJDVf5zaqpKhWQ4ZhXUcCkmy6d8HyLwmRI=;
 b=lVLm43WVWeXGsrZnG2gx+5qMNga4qJfXClK6WK/xC7nHa80493VW/cuHuxQ5IgBuYB
 s9TWJaxrim/Nc6IVj6Eu61KKG+hDAd6VeUYdwV+MlK5tdXsNBr2ap/QFg4K1BWKlH2NE
 M5HibfaSrYS3hmGTdY4MIlLxZse/mywnMuSgr5jnzRzraeEA8ag2x4yK3x9xWhltLvNQ
 PbCVv7XT6EisZOoQPeoaFJrYcZSBL+c4iXwaR86S+KF8dIaGTvkmPBouRQk8nKfXkDbM
 xOxL8um+5rW4Lz01t3x9ba+jy53nUR2hAxE3mTvjTBRmG0Q/TUApl8I7HUPYDevO8aCy
 QzPw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVNojM4PdgGa1qX0wWCxvSEbp3w26EPlYIw/mNhf8nWrPSAxxgbnpwUThXVMRInVJYn96+RQ+M6Ew==@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwRErS2Ls7tlHsLeb4DmjD4Afmz6Bh+etD2N5MM62QnZlZdncZC
 PsDE/b29cxRjNQEzKIPF/GGoTb8I0dObNsvywiSh+P0DKtf1nQk/I2+i7PnZz1vS4vgXhdnhIIF
 ekYNVxb8zu/4kG9CrSIcPSyVRJC0m0Lk=
X-Gm-Gg: ASbGncsRicOG2nDl9sxatbUmlU8KreJggaCTQusmbpkrKRhgebhIx+uZykEXPSQYj8h
 gcrpAj+RlDuc92QfOZxkm0maDovTftLmRcFwMSokkDpuBUqDNoKQARtqalObM7c2RRYMjQpAuXI
 OAtQbRSiJuNu2SB/VZi8jh4BK+8Sh64jVew1zhxl8QRA==
X-Google-Smtp-Source: AGHT+IGTbjel2Lr4hTEugC15eElhwTHNI+ODqHHF5fxeOe6WTuw/RC9YnypCz5AbNONhtgVjMn/nv1xY5t5pN6G24a4=
X-Received: by 2002:a17:907:9728:b0:ac3:bf36:80e2 with SMTP id
 a640c23a62f3a-ad708449ef1mr30745866b.20.1747945975579; Thu, 22 May 2025
 13:32:55 -0700 (PDT)
MIME-Version: 1.0
References: <20250522065519.318013-1-airlied@gmail.com>
 <20250522065519.318013-10-airlied@gmail.com>
 <wz6cduq6kh2n2pwxm3q75vjmrsht4rvnbjnch5t66kj773t2rj@kfk2bj7pewwm>
In-Reply-To: <wz6cduq6kh2n2pwxm3q75vjmrsht4rvnbjnch5t66kj773t2rj@kfk2bj7pewwm>
From: Dave Airlie <airlied@gmail.com>
Date: Fri, 23 May 2025 06:32:43 +1000
X-Gm-Features: AX0GCFuAi4EhJekjzqJTMCDXx4U_wVvSA2Eg5I_xZbWpgJJrhj5d0ScbTWnoYF0
Message-ID: <CAPM=9twLXMbaTNhr0y52aA90sytE2-zb_zC4eZ5xLC0CE1_1dg@mail.gmail.com>
Subject: Re: [PATCH 9/9] iosys_map: embed the is_iomem bit into the pointer.
To: Lucas De Marchi <lucas.demarchi@intel.com>
Cc: dri-devel@lists.freedesktop.org, tzimmermann@suse.de, 
 intel-xe@lists.freedesktop.org, Michal.Wajdeczko@intel.com
Content-Type: text/plain; charset="UTF-8"
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

On Fri, 23 May 2025 at 01:10, Lucas De Marchi <lucas.demarchi@intel.com> wrote:
>
> On Thu, May 22, 2025 at 04:52:18PM +1000, Dave Airlie wrote:
> >From: Dave Airlie <airlied@redhat.com>
> >
> >This reduces this struct from 16 to 8 bytes, and it gets embedded
> >into a lot of things.
> >
> >Signed-off-by: Dave Airlie <airlied@redhat.com>
>
> Replied too early on cover. Chatting with Michal Wajdeczko today, this
> may break things as we then can't byte-address anymore. It seems
> particularly dangerous when using the iosys_map_wr/iosys_map_rd as
> there's nothing preventing an unaligned address and we increment the map
> with the sizeof() of a struct that could be __packed. Example: in
> xe_guc_ads.c we use it to write packed structs like guc_gt_system_info.
> In this particular case it doesn't give unaligned address, but we should
> probably then protect iosys_map from doing the wrong thing.
>
> So, if we are keeping this patch, we should probably protect
> initially-unaligned addresses and the iosys_map_incr() call?

oh interesting, my thoughts was of course nobody would want to use
this for < 32-byte aligned ptrs :-)

but I forgot about using the incr for stuff, I do wonder if the incr
could be modelled on a base + offset, as I do think for a lot of stuff
we'd want to retain the original vaddr for unmapping or other things,

I'll play around a bit more next week with at least protecting against bad uses.

Dave.
