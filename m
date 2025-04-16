Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F3F00A8B8DB
	for <lists+dri-devel@lfdr.de>; Wed, 16 Apr 2025 14:25:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 45A2D10E8E3;
	Wed, 16 Apr 2025 12:25:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="csSTMT5w";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com
 [209.85.216.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 50A2810E8E3
 for <dri-devel@lists.freedesktop.org>; Wed, 16 Apr 2025 12:25:02 +0000 (UTC)
Received: by mail-pj1-f49.google.com with SMTP id
 98e67ed59e1d1-308218fed40so951469a91.0
 for <dri-devel@lists.freedesktop.org>; Wed, 16 Apr 2025 05:25:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1744806302; x=1745411102; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=siPTUVsIzTBsd/qDjepG4taN8q1/zJrghO9TL+s207s=;
 b=csSTMT5wTKkX0Exx3fbARzMW8Qe0T5FM/PspcVkogxyzHCux30U/5lIJpAlGRjyurA
 GpjGH6qKyPy+BIqQMSsud/qfV5xGBcILjkLwlgHRrxtNOB9JZo70dhdfDZSPfGPFP+PC
 qqMhykWZlQ4UKoUh7sb7qEel/IEUsBTonWxIJEIwjia7gR4h3HHipqvWaF17OkK76HdM
 YfEj7ZG96KXShaVoaNcVmE0Iby7gDDTo2RakEiQCrIrnJPgNNkjQpJ5XbXL8QDpXpJWE
 fomD0PY6SyUVBuPgRV3phSOXe6tPs38UXNpHQnhQ/yZlgS0OeeMwBenQxX7LkcufMN4B
 wolA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1744806302; x=1745411102;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=siPTUVsIzTBsd/qDjepG4taN8q1/zJrghO9TL+s207s=;
 b=LV4S9YKr4mAureaNlHXj9+XOu1SQ1RjdnA3zQA7DmxRDgTgVlYtRjjx75fXYdgJKFi
 ay6seYiLYiGvzNfmGSMOkfdo2thappjpKW6rOyjhezSOLrb8ANT9M79r4iDCo8vHjCmb
 VSQOESRI3UrxhyduIk5acmbBU+60f04iNFuTryPQK4EVh/PRuW0eu+xA+GsbVy5TCzxG
 33GA4RbxMMgGv5j+w9+RRSaAGQSuegwOswTgOGoR8enApMfUN5IxI/KJOJQzWdxIg/tL
 TAsmEaQ7btE0we8AW0yaR2LEgIssl6qD0d+hMfO0aVyZ2X9n1zoWcDYxFb8JYSNX5LxX
 tXdA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUs8uDZCrl5thEgteMtoLjGcchAPNSDR1jFOQSGWAPz8C7g0hEA8rHAGxen/pAqPloLAWV4bTHVVhA=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzK9EFQIi1OTrPGh6UlB/wzASBqfpo5q60MYGPgGtkmQ12B+p5K
 YepU1ue538vB5YOHbwImeKwADWXAxE1Om6mr6josBxDvMgLVVmVuHcQKGQtQYV5um1asgVOpZFm
 iLThW/pZAG4wj8f+zis9zZSn0LnM=
X-Gm-Gg: ASbGncvBRw85yP3wq/yuc7VdI/2PFWm3REK97JAVt/WMsIWuBbb7XevfpjYjqKFCwt0
 qKbDvpta9FYswEgNoH4Xvy1fCTixPKboEQiZQzf9k0pJknDMzjKS0eLRZBi9VE+8xjPiWgWJzW2
 4/Vu44NmXxZpSz4ouKF+dZww==
X-Google-Smtp-Source: AGHT+IEtX7+Mzcd7PaVlTQ/xw6YegGp6oJpy5FiA5NPzkNyVsvhcGyv02RO1C1uD2MXjywGXi+E2R+MmA4vLZlpoRfc=
X-Received: by 2002:a17:90b:3b84:b0:2fe:b972:a2c3 with SMTP id
 98e67ed59e1d1-30863c503bcmr961540a91.0.1744806301728; Wed, 16 Apr 2025
 05:25:01 -0700 (PDT)
MIME-Version: 1.0
References: <20250416122106.2554208-1-ojeda@kernel.org>
In-Reply-To: <20250416122106.2554208-1-ojeda@kernel.org>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Wed, 16 Apr 2025 14:24:47 +0200
X-Gm-Features: ATxdqUFhmQ4ZxWk7yUIUSPcJ20pL36JoUN822yjRXlrDsVMepY9Ii9ArJvY4sQU
Message-ID: <CANiq72msZ7FUo0=KXQjMkXjfm3jVaNhhVDCu_BFXRTL_xC0vog@mail.gmail.com>
Subject: Re: [PATCH] drm/panic: use `///` for private items too
To: Miguel Ojeda <ojeda@kernel.org>, Jocelyn Falempe <jfalempe@redhat.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, 
 Alex Gaynor <alex.gaynor@gmail.com>, dri-devel@lists.freedesktop.org, 
 Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
 =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Benno Lossin <benno.lossin@proton.me>, Andreas Hindborg <a.hindborg@kernel.org>,
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
 Danilo Krummrich <dakr@kernel.org>, rust-for-linux@vger.kernel.org, 
 linux-kernel@vger.kernel.org, patches@lists.linux.dev
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

On Wed, Apr 16, 2025 at 2:21=E2=80=AFPM Miguel Ojeda <ojeda@kernel.org> wro=
te:
>
> `///` should still be used for private items [1]. Some of the items in
> this file do so already, so do it for a few other clear candidates in
> the file.
>
> Link: https://lore.kernel.org/rust-for-linux/20250416112454.2503872-1-oje=
da@kernel.org/ [1]
> Signed-off-by: Miguel Ojeda <ojeda@kernel.org>

Sorry, I forgot the Cc: Jocelyn (it could be nice to have a
`MAINTAINERS` entry for this one).

Cheers,
Miguel
