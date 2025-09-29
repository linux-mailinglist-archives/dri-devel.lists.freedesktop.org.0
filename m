Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E2203BA9CBB
	for <lists+dri-devel@lfdr.de>; Mon, 29 Sep 2025 17:27:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2F4CE10E240;
	Mon, 29 Sep 2025 15:27:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="BUVEpjwx";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-f171.google.com (mail-pg1-f171.google.com
 [209.85.215.171])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DB92A10E453
 for <dri-devel@lists.freedesktop.org>; Mon, 29 Sep 2025 15:26:58 +0000 (UTC)
Received: by mail-pg1-f171.google.com with SMTP id
 41be03b00d2f7-b555b0fb839so3499468a12.3
 for <dri-devel@lists.freedesktop.org>; Mon, 29 Sep 2025 08:26:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1759159618; x=1759764418; darn=lists.freedesktop.org;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date:from:to
 :cc:subject:date:message-id:reply-to;
 bh=QUFfHCZ9kPQnI/DGEJ/PgzLIjVfpKbTJMrrLjEY+ghE=;
 b=BUVEpjwxJcwkzyVRIy+wrHu7MU1SRyMrxaBRwnzrmB2NBdxMBeSBwCUh0afthjMvrN
 AUM4RtiKNCNde+w5+gByLzsyNA1NwfVukbbpMasMTqkYndjfJ3sS03mn3p3WKFT5FF86
 qRBbZ2TZNSMW2SxFEubnJTUoDzXL+rqn0GQYavtRWHzatizpWLfaP71HaJJUbNyxgCGW
 Lv4/4BGkFrJrAeNc1bcz2m8YOg4uY4AJRR/EufV0anPNaHDsunLC8+t5ctgEKjc0LTAd
 EX3SK++AiX6elxQWQ+FPzhVA1UqBFuAdXzbx539ySJK/UtnxWJTXjEQhjnS33eGxjy5p
 WYsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1759159618; x=1759764418;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=QUFfHCZ9kPQnI/DGEJ/PgzLIjVfpKbTJMrrLjEY+ghE=;
 b=auF8rab+Uoi6a7eQI+ibFTeBCIfKgMKfZFFEuoL2dpg0WPW40MtiYOed2A0tpAaA9J
 FhkRyPi97hg4KuFm9xzvixFJByuqXhFkJWSE+T4FcHA4E3Cz56w3F1ATNJKxDLRNuxbo
 QMCXyk741WqPTOUklkB5PPIBMYCdsDUdRv3OEAEomnBEoOa/C0h6ZNEJ4LqQ3J9h6m9n
 4CpQ5qsLz3r/N4XIbLwrQY1C4mYAPndwL1mEQiDpA6Yx8xQx08zCadrJir6+xUuBm8JY
 uDzmgUvQT0QpIiqC97+EsisJPwv/QpaTGvD3sNxRtlW5c2U+QzepNQHADI2vyDo4pJ6D
 aZYA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXpaOyCkJ0meHUysE0/o7v3Mj/KuKMUllnsaMdSpUo2Z89mDMCA/nOGHUqSwKAyAjAV5N6i3pw5VtA=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwdhRdUDz+TDInd0hoqrcF77gWBSpw+a9uv+ttoyFdCDTpNRUCk
 BigUo3XrvOfYTizTkvU26XsvVCxWRByW0rcUCtOTDlQcPeMWm07a+fw5
X-Gm-Gg: ASbGnctM/8msTE4QXlomLlshgiAbShJnSgIMfabnOo/t3sjboXrEvIF4ds+kzCVjGJl
 ZX+Xdo4SSSlIgV+F7MOLgEOHoYROgL0d9gRVImsOfkpjtkfNz7fqActKnLgOI4ZgZ2/BGVSEf/y
 pcvAKn6f6i5+6xaTSrk8lhw8bjC1mm1VMW6nat9h8TBuoMve0/nxhhAOPlaZ2ij0ruTs0AdZMSe
 pgQTfb+tt9Eog3DnfjoO0y8457pUJg5WYJ1VNws53yBuiNrHaIlnu0qmstW5LYL7VFs60qbGWgi
 b9HvhMLDsdEfMMUwacrYfc+Yt6kTIB1H1Cj/Vqx/aoy/SIdJfeffU2/qCDiQKaun2jLdN+obXBf
 MXWaou8M/dU0PGjMnrz0WuBCVD2Rta/beS+nT+DmDVNA=
X-Google-Smtp-Source: AGHT+IGlrXcMqMEE95Bpk6Fvp2Z3JkSBS53/nlBPtQ4p3saTyAp/aYHA69EYxK3FJ+53fX34h/VJMw==
X-Received: by 2002:a17:902:f786:b0:240:3b9e:dd65 with SMTP id
 d9443c01a7336-27ed4aab57bmr188196505ad.38.1759159618299; 
 Mon, 29 Sep 2025 08:26:58 -0700 (PDT)
Received: from localhost ([216.228.125.130]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-27ed66d37casm134991565ad.8.2025.09.29.08.26.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 29 Sep 2025 08:26:57 -0700 (PDT)
Date: Mon, 29 Sep 2025 11:26:55 -0400
From: Yury Norov <yury.norov@gmail.com>
To: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Cc: Joel Fernandes <joelagnelf@nvidia.com>, linux-kernel@vger.kernel.org,
 rust-for-linux@vger.kernel.org, dri-devel@lists.freedesktop.org,
 dakr@kernel.org, acourbot@nvidia.com, Alistair Popple <apopple@nvidia.com>,
 Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>,
 Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
 bjorn3_gh@protonmail.com, Benno Lossin <lossin@kernel.org>,
 Andreas Hindborg <a.hindborg@kernel.org>,
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 John Hubbard <jhubbard@nvidia.com>, Timur Tabi <ttabi@nvidia.com>,
 joel@joelfernandes.org, Elle Rhumsaa <elle@weathered-steel.dev>,
 Daniel Almeida <daniel.almeida@collabora.com>,
 nouveau@lists.freedesktop.org
Subject: Re: [PATCH v4 6/6] rust: bitfield: Use 'as' operator for setter type
 conversion
Message-ID: <aNqlPzZn9jUjSKfE@yury>
References: <20250920182232.2095101-1-joelagnelf@nvidia.com>
 <20250920182232.2095101-7-joelagnelf@nvidia.com>
 <CANiq72k3kE-6KPkKwiDLgfkGHCQj4a2K7h9c4T13WMa5b4BAnQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CANiq72k3kE-6KPkKwiDLgfkGHCQj4a2K7h9c4T13WMa5b4BAnQ@mail.gmail.com>
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

On Mon, Sep 29, 2025 at 03:59:32PM +0200, Miguel Ojeda wrote:
> On Sat, Sep 20, 2025 at 8:23 PM Joel Fernandes <joelagnelf@nvidia.com> wrote:
> >
> > The bitfield macro's setter currently uses the From trait for type
> > conversion, which is overly restrictive and prevents use cases such as
> > narrowing conversions (e.g., u32 storage size to u8 field size) which
> > aren't supported by From.
> 
> Being restrictive is a good thing -- it would be nice to know more
> context about this change, like Alexandre points out.
> 
> In particular, the line:
> 
>     .set_nibble(0x12345678_u32)    // truncated to 0x8
> 
> sounds fairly alarming, and not what we usually want. Why cannot the
> caller cast on their side, if they really want that?

It was my suggestion to relax the type requirement. The reasoning is
as follows.

Consider a bitfield bf with bits 5:3 described as field1. The storage
for bf is u8, but the type is u32. This is OK, because storage and
representation are simply different matters. And no matter how you
declare the field inside the bitfield, you can't prevent overflow
followed by silent truncation by just syntax measures.

I suggested to relax the requirement that field representation must
match (not exceed in fact) storage type, and instead bring explicit
check in the setter. With the check, if user tries to overflow the
field, we either throw a warning, or panic if hardening is enabled,
or do nothing in performance-critical builds.

As far as I can say, Joel scheduled this in v5.

Thanks,
Yury
