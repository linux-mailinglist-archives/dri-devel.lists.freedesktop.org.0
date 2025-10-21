Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E462BF55C8
	for <lists+dri-devel@lfdr.de>; Tue, 21 Oct 2025 10:50:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6A64110E59A;
	Tue, 21 Oct 2025 08:50:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="UN4hmXem";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com
 [209.85.208.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 12A9310E59A
 for <dri-devel@lists.freedesktop.org>; Tue, 21 Oct 2025 08:50:49 +0000 (UTC)
Received: by mail-ed1-f43.google.com with SMTP id
 4fb4d7f45d1cf-63994113841so9123717a12.3
 for <dri-devel@lists.freedesktop.org>; Tue, 21 Oct 2025 01:50:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1761036647; x=1761641447; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=M3LdkJEpXUwO+NWSEZVny0C0q696Pa6fK5D8TjFSc4w=;
 b=UN4hmXemrsSk9rktMPbG+q3nbG/sIL5KI5RMDAVBpl3w6jHNSeaxPkJC/DaHrjzURp
 gYr1gHyZnDk2EHUs+NsiHeOFhv4GMudt+l5etrDFVloZWyt3EFWlG6KAwhOwBZAAMxMi
 EKVkAHOnwFdVaYyV2mry12T941r5w+lR+9MA8Qqfsm8PJnLD/VzB5fCWKu4/GuGoyLPW
 ysLamr7Kj/7g4200qI41a4dBC0xzRwTl71k1S+gY4zv6N/VmY71hVtZ5VxPijJHiza+Q
 EAVXRBl1R+yU5Y/+ak7b4apgybVIKoHjgIymbFn9vb8JiJ6LvRDxWRCdvccOoDtyCGcy
 cScA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1761036647; x=1761641447;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=M3LdkJEpXUwO+NWSEZVny0C0q696Pa6fK5D8TjFSc4w=;
 b=h4S3l/d9NiyHZXCQw+oZzt5YjfTTEFmu4VrnAXNYH0aF6ul6dwmCiXbmSzJLy4Ash7
 1YeS7NRp9AG3V08UZTt/H8XWMTPSi0TSTd2m3tv4znGQHdEfXp1mxT3sBqKUYQwaAybO
 D8eRSJcW23TlL+X3RPst4laN3Q1ulXou1H9snMzKgcnkWZnR00jcSIwoCLMhEktjaPdS
 X1+rVHlOAXV5A66TrMh6/MA+boyd+TOBavUi2r+jXb5F+npgCX2Cl1Ip842TCAFDElmi
 W74o8tKwXG9SN/goPDg1eY01gSasxqWHXK0sxVdQzd4AG3U/gkO5BZ6vzHyUC9EQTc0s
 ncWw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWOCxz39vWfvNXyJgZLMbxkT2J0Siv+0G7ciZSBc74ky6YI854E0oTITPEyevNu2VfqNvrHVh2Th3M=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxDTctySOtSRjVjgVNDGMCNuEJHsXOSZOrfl+OjJmdY75np4FSD
 bFyP6MxOc1o4KCE/KsQio2oiAVakLUFFJOTXMtzj47JZFYnZM5WmDPap92dlzMEYpzpa91VWymm
 75KDW2FT7wA4jDYrOrnBJUzTqOcDemuFzB4zexQk=
X-Gm-Gg: ASbGncusDrLiK0NQMURG4qI+IUkStuJ7OeG8BLZyyDwYkkKSRRUrBuAlHd+9R0Ti6Aq
 /3Zhk99cfV1ecG7clbn/s+ngq5VakIPtlzWP+XnLf5zgl+Ge1yKwTSU4YwSsZ1r9OnkmvEHPLxo
 rG94DQMQNHknnli72t9HUXF1XmQwVyKK19lvk8671RGMyiZ6DZopMqwbwSmgDNHR7cmOCO1FraO
 iYoPzTPSXBjjeaZIbi0dS8aBX5Y9Ir9HVQ5z9StmQMN/UfD6G+3ILB+ZlGRfw==
X-Google-Smtp-Source: AGHT+IHBY2IUN83Pw2ENBSOgJpr4Jc1uqt5wNDK5R+8Ap8x+c1BNaeQ/FRba66e2cv8DRUxHfZF+WnI79kMwhHazwpc=
X-Received: by 2002:a17:907:c11:b0:b46:897b:d759 with SMTP id
 a640c23a62f3a-b647443b9c2mr1867846866b.40.1761036647265; Tue, 21 Oct 2025
 01:50:47 -0700 (PDT)
MIME-Version: 1.0
References: <20251020-staging-fbtft-ra8875-usleep-v1-1-9592dd390c13@lukowski.dev>
In-Reply-To: <20251020-staging-fbtft-ra8875-usleep-v1-1-9592dd390c13@lukowski.dev>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Tue, 21 Oct 2025 11:50:11 +0300
X-Gm-Features: AS18NWBqAmjo3KOZJeoj3rpQJcbhQ65NoVyhN4fDfDmM2riHc6TQ9QZuK7Sh_wM
Message-ID: <CAHp75VeWGAyzAFBYSQS7FGpU1eSRo1Egrh44hUpXJgYZhFEkwg@mail.gmail.com>
Subject: Re: [PATCH] staging: fbtft: fb_ra8875: replace udelay with
 usleep_range
To: Olle Lukowski <olle@lukowski.dev>
Cc: Andy Shevchenko <andy@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org, 
 linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
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

On Mon, Oct 20, 2025 at 10:16=E2=80=AFPM Olle Lukowski <olle@lukowski.dev> =
wrote:
>
> Replace udelay(100) calls with usleep_range(100, 200) to allow the
> scheduler to yield instead of busy-waiting. This is the preferred API for
> sleep durations above 10 microseconds.

...

> -       udelay(100);
> +       usleep_range(100, 200);

Besides what Greg said, the function in similar changes should be
fsleep(), it will automatically choose the best low-level API for the
given delay.

--=20
With Best Regards,
Andy Shevchenko
