Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 97C9C96CEDF
	for <lists+dri-devel@lfdr.de>; Thu,  5 Sep 2024 08:07:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BE30910E6D1;
	Thu,  5 Sep 2024 06:07:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="ATDEZp0Q";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qv1-f48.google.com (mail-qv1-f48.google.com
 [209.85.219.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3B4EB10E6CD;
 Thu,  5 Sep 2024 06:07:04 +0000 (UTC)
Received: by mail-qv1-f48.google.com with SMTP id
 6a1803df08f44-6bf7ad1ec3aso2287996d6.0; 
 Wed, 04 Sep 2024 23:07:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1725516423; x=1726121223; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=5LG1d3avN5co6G6gzC32VQF9Lut496WAZe399A99cSk=;
 b=ATDEZp0QujPIC8xf8NQrNbv+S4W7mEzi44LwYP3qJAmGL4qYr36gDvKQ8308UCQNiz
 qgo+unWzajV8OG0wQTJ5H2iSCygSfxlOIIaOTbpWylw/s1IIbY/eAZSAs8cuAZfTq9ka
 sexfY5nJgqidnwbnkYVvCnXtbPs0JlyihJDo21d8is4KlGDayT4aj4Rq93vx2oP4am0+
 og3X3xQ4DiJbuLVOZMtw4BxDNYCU9G1McLAAkfGidLwAvUFDoyjO0OgbY3Nma3AFE3AA
 MhdRXdFIY6w6Ek4B2h6jjJGWXSzDgVxUbm+r0267ET0zYwA9kqGPeqeM9DXcatVBlQWU
 HXaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1725516423; x=1726121223;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=5LG1d3avN5co6G6gzC32VQF9Lut496WAZe399A99cSk=;
 b=owvIVCTGeXI52j08Vs6sJzDO3GtYNyyk1yHbZbPfwKP0IiRJOOSfmZhd1qhMNFzFBQ
 ROUXHHPe2EbBsHSo/68qNULoIDv8Kqc9w/VsGoZ6Bjqpfj+BXV1LFjxMLsm64qMuaIFn
 m4vHApUlru4wYOVMByIec+goM6tEyJsThOMydKliDRv7Ds/5Rv9MJ/5+XnsayFL+BUv/
 XsSl5PrHAKk8kQS9p8wDNzedopLgddtvPWi5J3Usq1w5syv3SX4+1KSQ7hN39wFfb8L3
 W+bO4AgQ9cdsRVbLG72dTjc0Lm5BfAjhgshKrrmPmRFqrG73WNp8npPok6R7panidzls
 vdSA==
X-Forwarded-Encrypted: i=1;
 AJvYcCV77Yed6IIyKI1iKGAZIxH3j1eDkS8JHBXQotFS2R3iNYbx0f4FjppHaYsJ/Oa7tVWU/yf9S7mbUyvY@lists.freedesktop.org,
 AJvYcCVWiFfb2Q4EHDDfArgssdfH6cU184kT97FP8JxxlSJCwlBf4AKs62CPtnxfakxrABS1Mi1qkb9k@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyXlSa7/rd0YxRYN4QymRMoYDQarm7j/ZeHuxbG+jQ6DJrY9WBO
 ejHH4+tU7ZhSxEiHAGC9oSAPLwZYWfz+bZNlP1bNlyna4xcSNaWpdQwgYEfdilMl7chvcgOA5Gl
 yZymnJF0jDT006jsZ1Oku87HBdaY=
X-Google-Smtp-Source: AGHT+IGB8ymXCte18l4OE7yiIbhXNCU7V0Ne5O+JMA0juqCKhfd8whLL2b7mgE/CSWSFgutJc0fE9TPCp01kmop852o=
X-Received: by 2002:a05:6214:5982:b0:6c5:12b9:d5ce with SMTP id
 6a1803df08f44-6c512b9d761mr74759286d6.4.1725516422860; Wed, 04 Sep 2024
 23:07:02 -0700 (PDT)
MIME-Version: 1.0
References: <CABXGCsNgx6gQCqBq-L2P15ydaN_66sM9CgGa9GQYNzQsaa6Dkg@mail.gmail.com>
 <CABXGCsNztS8MLteq5=fcddwuQ1TCzeOM8TdVtpJ3crK=sV5PTQ@mail.gmail.com>
 <CABXGCsMdxHJ-MLkS0pm51Sk8g0PTghsuZxmowvj5t44bVN4ndA@mail.gmail.com>
 <ffd2c40c-1c2e-4465-b26f-88d5e08a80d9@amd.com>
 <CABXGCsOoL5vD0+FRALFQFr3ZBpb2z5mpGKzAD5RHoW9_sb5yaQ@mail.gmail.com>
 <f68020a3-c413-482d-beb2-5432d98a1d3e@amd.com>
In-Reply-To: <f68020a3-c413-482d-beb2-5432d98a1d3e@amd.com>
From: Mikhail Gavrilov <mikhail.v.gavrilov@gmail.com>
Date: Thu, 5 Sep 2024 11:06:52 +0500
Message-ID: <CABXGCsMSTsBFW=OirDszPFVOiNgyOBSh3qyzAw-Coi-McnicAQ@mail.gmail.com>
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

On Thu, Sep 5, 2024 at 4:06=E2=80=AFAM Leo Li <sunpeng.li@amd.com> wrote:
>
> Can you delete ", new_cursor_state" on that line and try again? Seems to =
be a
> unused variable warning being elevated to an error.
>

Thanks, I applied both patches and can confirm that this solved the issue.
The first patch was definitely not enough.

Tested-by: Mikhail Gavrilov <mikhail.v.gavrilov@gmail.com>

--=20
Best Regards,
Mike Gavrilov.
