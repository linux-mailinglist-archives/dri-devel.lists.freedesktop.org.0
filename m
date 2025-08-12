Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 82807B239CE
	for <lists+dri-devel@lfdr.de>; Tue, 12 Aug 2025 22:12:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7B64010E488;
	Tue, 12 Aug 2025 20:12:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="ZGx+xezg";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com
 [209.85.214.176])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CB0AB10E488
 for <dri-devel@lists.freedesktop.org>; Tue, 12 Aug 2025 20:12:26 +0000 (UTC)
Received: by mail-pl1-f176.google.com with SMTP id
 d9443c01a7336-2400a0c3cf7so8617815ad.0
 for <dri-devel@lists.freedesktop.org>; Tue, 12 Aug 2025 13:12:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1755029546; x=1755634346; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=LdMwsRNMhr3RdlfS1sg03g0GGfVON6z2LjlOFlQzz/w=;
 b=ZGx+xezgIfBMxBj169alrxKLkrLZsIK5xZuwOJc1RQhK/Sjk/YF0b6dvEv3bLVAYM2
 oHE1oygb2TxalI2fDYBIS6hW4nm6gPRTrhUDMZWHHqLQ9v139CkxC8GD1jv37fCGMsCp
 wKCcLyaI8OODV9Dt7D8VQFGlbraO0wtkEOdK63jwuAj9aPSvSaiT6GDytSJohMtUYiZV
 gGvuM9e9djfxDz58ymJwRGM+YLWoWl3JG+/baAY7aS1Ifm6j2qnjL5R2SUB1iAgr4Qf9
 WfUzJUsaf7BUHZjBg8C5enPjMNlxGczXl0KRTQXmyZU/FEHvIiUNcoIC7dFbyqDhE6hH
 ChGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1755029546; x=1755634346;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=LdMwsRNMhr3RdlfS1sg03g0GGfVON6z2LjlOFlQzz/w=;
 b=CvaHCelmCirCOwOwUzeGvtNrqVLhO5sI9Oc+SwOYjpkcJdCSz/Mub8GJGffuFGX7nr
 iHzVW+UdellBCC0itEzpeOmEZw1e8vpYszczqVGYhFsxqfLBaK75WZFFohIZK4EQiYI+
 lYL7IGlCjLMAcr7HuRfwEUY4DJ3ouOxS9zOec8KjYpORFmXWw7+CCWNvQgEU6rgZbtCA
 WeA+5Owgm/gRxp6b4L/F8roye3SYtave0rX0E5ORmGUcoCfm94nBob6++cahurdhpOc/
 TNNEOnX0Z9sagTiunmDwHr/ExgR+0mCUqrW8stYptQY0aJ4wkJMAaRhF9sfF9KwDEvn1
 YEbw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVtQcMUtbpLIECJpCGy/eD3Ah1wDnUnjdqkh3DjwaSyRXHokdCx8xlBQzbbruC4oL5alqfRZvKk/VA=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxxFnWfriEWoSqTI/o2mkuPYDj3oylyIeRv6Ejdp/sQE3UUFrey
 KSHm69IVW7RVwsU6MLz/u8RE37jbnZqQBV1omsERLy7yIqwFl9GDRkTQSi4iOZh0a3naWCfcUx8
 VWcdguwuIeoryH0ysOl2HoiKComCROdE=
X-Gm-Gg: ASbGnctirp0H8cdK1osVDdO3EA9lofV7hxDEdspv/HdkGQCJ3fm1CLsgPn7ciWVy4Fl
 iD4ocMtqlRp7txatfn4RgI8byX8xf51AzWARYBY6SQqYt2ZHrEVgCW2b+TiU0iUogmbVoxmaTfO
 xUPPK6iwt++ZyPy98gmwYt/wkCW+OrWn9MVWljtDcuvMvUjbJTruBrS7ruojI/UQ9drafxmZ4HV
 8QlI6x2wAFYDGpbc94=
X-Google-Smtp-Source: AGHT+IEvmTEfhYgDEcmoTdFN/im+6O1T6OckAAjt4c2JWcP23ebcCH33w4iQbi5CmkutIrqX+H/I09EqUXavPgjNsec=
X-Received: by 2002:a17:902:d2d0:b0:240:25f3:5be9 with SMTP id
 d9443c01a7336-2430d263d94mr3422375ad.10.1755029546192; Tue, 12 Aug 2025
 13:12:26 -0700 (PDT)
MIME-Version: 1.0
References: <20250731154919.4132-1-dakr@kernel.org>
 <20250731154919.4132-2-dakr@kernel.org>
 <CANiq72mWVmso1yMYGYih-NDwjB9E1iVE=_oSpPiSvqTu5mkE0g@mail.gmail.com>
 <DC0PSDBCPGVO.38EGYXRFQVM8N@kernel.org>
In-Reply-To: <DC0PSDBCPGVO.38EGYXRFQVM8N@kernel.org>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Tue, 12 Aug 2025 22:12:13 +0200
X-Gm-Features: Ac12FXx3JqohsxItEiz0vXv8AeDOYSWVWda9zJanptt2JqBNAGTufcd5lRCQvPQ
Message-ID: <CANiq72nfpecn3qQqNJiXGDX_Veg1Q9yQF0BZzCk68Ue_i3qtVg@mail.gmail.com>
Subject: Re: [PATCH 1/4] rust: alloc: replace aligned_size() with
 Kmalloc::aligned_layout()
To: Danilo Krummrich <dakr@kernel.org>
Cc: lorenzo.stoakes@oracle.com, vbabka@suse.cz, Liam.Howlett@oracle.com, 
 urezki@gmail.com, ojeda@kernel.org, alex.gaynor@gmail.com, 
 boqun.feng@gmail.com, gary@garyguo.net, bjorn3_gh@protonmail.com, 
 lossin@kernel.org, a.hindborg@kernel.org, aliceryhl@google.com, 
 tmgross@umich.edu, maarten.lankhorst@linux.intel.com, mripard@kernel.org, 
 tzimmermann@suse.de, airlied@gmail.com, simona@ffwll.ch, 
 rust-for-linux@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org
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

On Tue, Aug 12, 2025 at 10:00=E2=80=AFPM Danilo Krummrich <dakr@kernel.org>=
 wrote:
>
> I don't think so, it just lead to pad to the alignment for Vmalloc too.
>
> Technically, this makes no difference, since Vmalloc is always PAGE_SIZE =
aligned
> and the size always a multiple of PAGE_SIZE.

Got it, thanks for the quick reply! Then I guess we could have skipped
the Fixes in this one, but it is not a big deal and as usual it
depends on how one defines "fix".

Cheers,
Miguel
