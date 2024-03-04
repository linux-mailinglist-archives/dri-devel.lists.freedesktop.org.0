Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0FA4C870832
	for <lists+dri-devel@lfdr.de>; Mon,  4 Mar 2024 18:23:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 30D711123AF;
	Mon,  4 Mar 2024 17:23:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.b="HtrcOHc8";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com
 [209.85.214.175])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1C5FD1123AF
 for <dri-devel@lists.freedesktop.org>; Mon,  4 Mar 2024 17:23:13 +0000 (UTC)
Received: by mail-pl1-f175.google.com with SMTP id
 d9443c01a7336-1dc9f4d1106so468215ad.0
 for <dri-devel@lists.freedesktop.org>; Mon, 04 Mar 2024 09:23:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1709572993; x=1710177793;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=2AXGixQ7Gc8HjdKyBY3Whs9KBXsRK1tfn6h6cRM619Y=;
 b=HtrcOHc8GsJ9XCl81oQRSKduzVWqjwXh1oV8L0+AkkHqMNSyCfFK8DMsBunlyctmo+
 IrzMDbp4Xa0cjo400mB5GLVVFJjr8HPwNU1VN7RtEm6Gn9T8Dv6prhuaKmbGtw9blSb7
 AlLHXNuegxxne9Fw6BxkEHHVBTJgTqWgBqwrm4lBw/ZHHYTvJlqNBt8Zrw0DHCCQeJ8+
 14tdnL3kXRTyGMB/8EOQPk243JYaF8+kPMdF7NYaCsT/jTF8UO0D4ZUjpgrhBjOJ8MFD
 gj/Aof7xW8AfXHkhO/cONER+4C2TLT6mi9y0e7owZF2DekgKyF1Kp8r7rK21Rr5SuiDl
 q4ew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1709572993; x=1710177793;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=2AXGixQ7Gc8HjdKyBY3Whs9KBXsRK1tfn6h6cRM619Y=;
 b=U03dbj0UpiZP5ttutuTb7txZejZkE1U912BICg/ECBKGr4V8VDzgg0rQIByUpqtKHH
 YjkPjkeKd/iaJvTpkD5rGS4tfZ5fRagZI2hfuhBodiI2MQ2CAuwlwrVDap7WYSEyZ8mj
 2WOT0KTvPqtDwkz11WhfCMc+FYkbUQxdxHkPAXIelMoQ83AAvNjrrNcYsfC3ZBIhrFM4
 e+/Ht4OZHnKi873WksXYz1OLpp4pkjnO7P0y98zC2uWJ251DorG4yC/cBp1OS8P1WhXW
 EOXoiQl+sgnHKYJbXWU2ccZn4ls0FaeTNQWmQxgxZ9evcTWwljzd0rgNsZGFRa4h0LNu
 4MNA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUJnn4OY+UqD4BQqbvAapbbaH/yvKc4EYcd3fx2sc0wCfYcC8txh0wWr4DzqEz/WFfLm+nwuluyhM+OQqI2rFC2UScLV0sWbPqGSXpSUdcs
X-Gm-Message-State: AOJu0YyGoOb2oJpzzBYqLtopmKtcslskIxBIBq9AK8AFsQHbgAqc/ex8
 0fYwJZGxRGV4AnP9mj8wdiH4l6s7JvKQuoMM6QjBv/8JB5yLKpirGyHh0raI20oWafRNKR2bgH5
 n50g96vfEo+k/M17humJpDzIU6vDSTj3TVPHT
X-Google-Smtp-Source: AGHT+IFKjskUOj6278amt+2i/iRaGbWnqwH8V8ARQXyWAa4I5jxF0hWUUBHSTDwJLrfzllQF5r4CeHTssO8S/qZNiYE=
X-Received: by 2002:a17:902:ecc5:b0:1dd:7db:69d0 with SMTP id
 a5-20020a170902ecc500b001dd07db69d0mr266118plh.11.1709572993014; Mon, 04 Mar
 2024 09:23:13 -0800 (PST)
MIME-Version: 1.0
References: <20240228225527.1052240-1-helen.koike@collabora.com>
 <20240228225527.1052240-2-helen.koike@collabora.com>
 <20240229-dancing-laughing-groundhog-d85161@houat>
 <5d7ed81b-37f9-48e9-ab7e-484b74ca886c@gmail.com>
 <CAHk-=wixVy3WYvjbt43ZSrCqPDsS76QJQSkXFbbPsAOs1MCSAQ@mail.gmail.com>
 <CABXOdTeT2ip1uS2EG2w8pW7254Tnd=ZDNz-KC61-G-yqDTVgJA@mail.gmail.com>
 <20240304-rigorous-silkworm-of-awe-4eee8f@houat>
 <CABXOdTc4MXcjwgGuJb4_69-4OFELD37x0B6oMr=4z=nxZ2HPXQ@mail.gmail.com>
 <20240304-ludicrous-grinning-goldfish-090aac@houat>
 <CABXOdTeDydWO9mf2yxWjjebHZ1bE=R2HPs1P4XYwNhzznNKxmw@mail.gmail.com>
 <20240304-benevolent-brawny-urchin-0af0ad@houat>
In-Reply-To: <20240304-benevolent-brawny-urchin-0af0ad@houat>
From: Guenter Roeck <groeck@google.com>
Date: Mon, 4 Mar 2024 09:22:59 -0800
Message-ID: <CABXOdTeza3ZJRO7eexp8evm8o1B81fw9cDQbE_nHwqhufMCfGA@mail.gmail.com>
Subject: Re: [PATCH 1/3] kci-gitlab: Introducing GitLab-CI Pipeline for Kernel
 Testing
To: Maxime Ripard <mripard@kernel.org>
Cc: Linus Torvalds <torvalds@linuxfoundation.org>,
 Nikolai Kondrashov <spbnick@gmail.com>, 
 Helen Koike <helen.koike@collabora.com>, linuxtv-ci@linuxtv.org, 
 dave.pigott@collabora.com, linux-kernel@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, linux-kselftest@vger.kernel.org, 
 gustavo.padovan@collabora.com, pawiecz@collabora.com, 
 tales.aparecida@gmail.com, workflows@vger.kernel.org, 
 kernelci@lists.linux.dev, skhan@linuxfoundation.org, 
 kunit-dev@googlegroups.com, nfraprado@collabora.com, davidgow@google.com, 
 cocci@inria.fr, Julia.Lawall@inria.fr, laura.nao@collabora.com, 
 ricardo.canuelo@collabora.com, kernel@collabora.com, 
 gregkh@linuxfoundation.org
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

On Mon, Mar 4, 2024 at 9:09=E2=80=AFAM Maxime Ripard <mripard@kernel.org> w=
rote:

> And singling out DRM because it regularly allegedly breaks things on
> xtensa or m68k and claiming we're not taking CI seriously because of it
> is completely ridiculous. If the all the subsystems were taking CI as
> seriously as DRM, we would be in a much better place.
>

The failure I reported as an example was on arm, not on xtensa or m68k
I'll disable CONFIG_DRM in my build tests for xtensa and m68k going
forward.

Thanks,
Guenter
