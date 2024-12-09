Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E27EE9EA0D1
	for <lists+dri-devel@lfdr.de>; Mon,  9 Dec 2024 22:06:05 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 34B3C10E56C;
	Mon,  9 Dec 2024 21:06:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="A1p9fwZ5";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com
 [209.85.216.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4633C10E56C
 for <dri-devel@lists.freedesktop.org>; Mon,  9 Dec 2024 21:06:03 +0000 (UTC)
Received: by mail-pj1-f53.google.com with SMTP id
 98e67ed59e1d1-2ee7c059b97so828430a91.0
 for <dri-devel@lists.freedesktop.org>; Mon, 09 Dec 2024 13:06:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1733778363; x=1734383163; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=IQz7I9YsENov3q06x8KJv/iXVsOJdNRaOPPv+jZyDqA=;
 b=A1p9fwZ5KETjeSDfGB2ylS59RLWUc0cMzgtmH3f7DqqGYH5sXvdjtrx05VClKlfq8H
 UGoLVrRe6Ey7RZG450YPblWCfM0iWFr8Gna3C1FE1tGP1gs5j864v20dsqySneig0XsK
 XyhptaV4jRaDNUNPR0EEH/EgVCirGeVcdZJbFLS+FSoG8+8ToRIdfbDVu+rh3XvLs5VR
 ES+uVlJ2pVIBF+D7zTE7UTaMqj5scWUO6myaMzosk2WrFJXIMnLXqM3LcEb72stVw9Q4
 gWjvjnmsriCKY6JuHN5ejLNDSnY/3F4kUU5B0ZSgsnHGUvDUiLA5laYIYpbiGKzYjWXq
 LwRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1733778363; x=1734383163;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=IQz7I9YsENov3q06x8KJv/iXVsOJdNRaOPPv+jZyDqA=;
 b=EFdrabS2ZD1ShVLWGT3kOasMo5BZuaGeOBMSi1IJyedCmNNHGZrSSlxp/uP0g87GKK
 gtHcIEgZ6NmOnyn5L4z0T+WPbDqquMT/7jnhmW0aTJZx4vGE492q6PkRZp520diIK5bG
 xpe6q0+Z1RBE//RfcAA/0x7NHR/+/nKt3RD0LnMZyLTIXs6s5NaAaS5VsXIGU7l2xArm
 3Pmxzz1wyDmJS2+SyyK4TeO04yFOaZ8oxFIQo7lJxKl2+hm44WQ5xESrekNm2o0LwCIZ
 Y/EJgSobMQ6NZ1BwwNPOx/Xch+xHOcJ3+adQw+d3NmVkt16pKqtJvwYca73qcz+cJFQf
 iMSw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXKLErfH+rN78SW1lqS9hLmQklC7XsamZ4IfCl6riXZzPQNVh6OpDaLu0rFsOO0i0p1i/bGqYH+/Kw=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwsUJuHY99r34evOymOGAq0Yy8O6wX5WRXGnOb0DUSNRdmnAHsy
 FZ8n9DFIydabljw5tLesA680JZEYsXua6E6p3qjFz5BnHW5nnnMy55a42N4C2oQGUgrQHSh+nsK
 9imKTUI1ZcrxqVHfIdBAi97YCpc8=
X-Gm-Gg: ASbGnctKmdKc8qghq7QWFXW2BONZuD83X65ZkvL1gIfc+crwdjLt7+UN4WlfCU/Kv5P
 +6/o6IZ1nzpVVo/aSJwig7BAnCr1JIiM=
X-Google-Smtp-Source: AGHT+IEJuFSakMcUFac7J+27s9Uiqv0/HxdJEeZ6mEWsh67Ic0D1Vr0Ysw5dq2xEnh2AhHs3kAjxKYrNJLgxZGF1gY8=
X-Received: by 2002:a17:90b:38cd:b0:2ee:6a70:c5d1 with SMTP id
 98e67ed59e1d1-2efd484c303mr569161a91.3.1733778362678; Mon, 09 Dec 2024
 13:06:02 -0800 (PST)
MIME-Version: 1.0
References: <20241125233332.697497-1-ojeda@kernel.org>
 <fe2a253c-4b2f-4cb3-b58d-66192044555f@redhat.com>
In-Reply-To: <fe2a253c-4b2f-4cb3-b58d-66192044555f@redhat.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Mon, 9 Dec 2024 22:05:50 +0100
Message-ID: <CANiq72=PB=r5UV_ekNGV+yewa7tHic8Gs9RTQo=YcB-Lu_nzNQ@mail.gmail.com>
Subject: Re: [PATCH] drm/panic: remove spurious empty line to clean warning
To: Jocelyn Falempe <jfalempe@redhat.com>
Cc: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, 
 Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
 =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Benno Lossin <benno.lossin@proton.me>, Andreas Hindborg <a.hindborg@kernel.org>,
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
 rust-for-linux@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 patches@lists.linux.dev, stable@vger.kernel.org
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

On Tue, Nov 26, 2024 at 10:04=E2=80=AFAM Jocelyn Falempe <jfalempe@redhat.c=
om> wrote:
>
> Thanks for this patch, it looks good to me.
>
> Reviewed-by: Jocelyn Falempe <jfalempe@redhat.com>

Thanks Jocelyn. I thought DRM would pick this one -- should I pick it
through rust-fixes?

Cheers,
Miguel
