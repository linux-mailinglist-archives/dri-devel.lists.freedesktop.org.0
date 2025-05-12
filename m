Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F0A6AAB3605
	for <lists+dri-devel@lfdr.de>; Mon, 12 May 2025 13:41:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5BF8E10E17B;
	Mon, 12 May 2025 11:41:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="cJKOV8pu";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-f181.google.com (mail-pg1-f181.google.com
 [209.85.215.181])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AE6D610E17B
 for <dri-devel@lists.freedesktop.org>; Mon, 12 May 2025 11:41:25 +0000 (UTC)
Received: by mail-pg1-f181.google.com with SMTP id
 41be03b00d2f7-af907e48e00so260444a12.1
 for <dri-devel@lists.freedesktop.org>; Mon, 12 May 2025 04:41:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1747050085; x=1747654885; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=FWdZ0FvRG7jRFpnyMwSNn8FH9aRym0nmItdxHtAcDko=;
 b=cJKOV8puNdp0Cd+BSnf7oeqwe8Hos1ZnX0D988MiQJuRsu6wNn4Cmy5dajbZm4Ce1S
 9HHufPUjk3scp0WYfF8hcv5G+IKcnQTvMBmH1nMLkUxaogXbd9MWxXmiI4yYLOSVFMs8
 1oDrEYldBgOWfme+ZL7VGBhAq1A1rr9PMHDETx4f+SRdefGcorqYpv9+AZw5D80ipyLT
 X0rvk6ap3CYOvM7sitLqXcfgyJq/IQd2cNi0B45Abp7u55z26L0+WmeJ1yUFALho5NnT
 7rTQpS26TKrkVYspIP7nq31N6m5E8Hd2sUgAzirjX/hlyE1N6fM+rAMxrFiqG9YergdY
 Kn4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1747050085; x=1747654885;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=FWdZ0FvRG7jRFpnyMwSNn8FH9aRym0nmItdxHtAcDko=;
 b=O6oTbOKfNeypjH1cAf9LX3KLpsdYeRXiR/D0N22yDjcLUWj4oKLg3Q2G74uufk1OMQ
 jwZrdTtZR53T4vwyN2Yv/yKOhUQMs5VLUrfjZ3f/MpbJGTliCDTXs+m023mbs7VD/CEd
 yWyXe9olPPDfk+WqodX8vtruwt0ap/Aej8hseiK/l9zZsubPIMC6jV76FGJ2OCFy0jqZ
 lZNB9mNSxjJ9zGvNyGACLh9wCl+RZ7KmilBNA5R4gSd2LwgqVVykRVZoYWXK1nhdwNP3
 QsmIthZY3FO9VUWvI+zOXYyl+Hlo0DU42UPYNIH3atOajN6MTXHrIiF8gNHoOvpNKqwQ
 wgmw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWcqUmCB9LJkqilLQk7mX3BemKiU6VluZo/9rvcQBXmANUXaJ0GlhrqfjAyeLcqrj1ZxiZ9u0WSDTc=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yzo8ujne0AUSp9acyJkb69c1BvVMR8hzp3fLu5GKMu+THAd/wMH
 xuQFguiYFNlygnOCrVQgLc+wmYPfTHGoagk3gHj992g2DSp/xDlt3Otbl+Lrsy/Sf57TpB/JMSx
 MV4I+TAa94N1LPtoq2yu5ddrUnR8=
X-Gm-Gg: ASbGnctqdDa0McsTA61JLPxonwuwqu2c6Fh6wr852UKvw/vBCka6t+ol5iU3NimQASn
 N+UNY/Oe5WnUDT79gMSEJHi9Cyz5+EyImIZ42Cpz+q6yKLade/eO+ozjZbti37CtkWomwrBEJsv
 QHAdIQpE3f6gCQD3rvXjAcfN5HgyjvV6mmBvdrVF58lhY=
X-Google-Smtp-Source: AGHT+IEtQf2BdCN7e2sHSUk0VJX0Olv5qlcwauAFJbrOV1/mqRMGEU3MBVPNlGdiu+mmHNXEQgSqiV+PRfZLQzZHfJg=
X-Received: by 2002:a17:903:3bc5:b0:22e:62da:2e58 with SMTP id
 d9443c01a7336-22fc8d9852dmr63171295ad.10.1747050085392; Mon, 12 May 2025
 04:41:25 -0700 (PDT)
MIME-Version: 1.0
References: <20250410235546.43736-1-dakr@kernel.org>
 <20250410235546.43736-8-dakr@kernel.org>
In-Reply-To: <20250410235546.43736-8-dakr@kernel.org>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Mon, 12 May 2025 13:41:13 +0200
X-Gm-Features: AX0GCFsXrceSa7Z-E7razDmeQKNGOcQChVn-chfnpWnHFst4WuM6qw4PjEJHdJA
Message-ID: <CANiq72ks_1rEQYvYY464WOqAGKJTQpgvjM_RoBkHTJhMx1euyA@mail.gmail.com>
Subject: Re: [PATCH v2 7/8] rust: drm: gem: Add GEM object abstraction
To: Danilo Krummrich <dakr@kernel.org>
Cc: airlied@gmail.com, simona@ffwll.ch, maarten.lankhorst@linux.intel.com, 
 mripard@kernel.org, tzimmermann@suse.de, lyude@redhat.com, lina@asahilina.net, 
 daniel.almeida@collabora.com, j@jannau.net, alyssa@rosenzweig.io, 
 ojeda@kernel.org, alex.gaynor@gmail.com, boqun.feng@gmail.com, 
 gary@garyguo.net, bjorn3_gh@protonmail.com, benno.lossin@proton.me, 
 a.hindborg@kernel.org, aliceryhl@google.com, tmgross@umich.edu, 
 dri-devel@lists.freedesktop.org, rust-for-linux@vger.kernel.org
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

On Fri, Apr 11, 2025 at 1:56=E2=80=AFAM Danilo Krummrich <dakr@kernel.org> =
wrote:
>
> +    fn from_gem_obj(obj: *mut bindings::drm_gem_object) -> *mut Self {
> +        // SAFETY: All of our objects are Object<T>.
> +        unsafe { crate::container_of!(obj, Object<T>, obj).cast_mut() }
> +    }

Doing something unrelated, I got a Clippy warning about this public
function not being unsafe, and while the lint talks about potentially
dereferecing a pointer, it is still the case the `container_of` uses
`byte_sub` which is why the macro requires both the in and out pointer
to be in bounds of the same allocation.

So since someone may pass any pointer here, this should be unsafe, right?

Even if that is not correct, the `// SAFETY` comment should
nevertheless explain why that holds, no?

I hope that helps.

Cheers,
Miguel
