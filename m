Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DB216A93CAF
	for <lists+dri-devel@lfdr.de>; Fri, 18 Apr 2025 20:19:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8628510E225;
	Fri, 18 Apr 2025 18:19:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="kx7fRUnC";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-f170.google.com (mail-pg1-f170.google.com
 [209.85.215.170])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C00E610E225
 for <dri-devel@lists.freedesktop.org>; Fri, 18 Apr 2025 18:19:07 +0000 (UTC)
Received: by mail-pg1-f170.google.com with SMTP id
 41be03b00d2f7-b03bc41695eso237384a12.3
 for <dri-devel@lists.freedesktop.org>; Fri, 18 Apr 2025 11:19:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1745000346; x=1745605146; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=d22YnNj2bvvH91hnPGqpeN3Ca1vvKu4PX7YmTnLd3BI=;
 b=kx7fRUnCbRrVMpxMdXw7Yf5ZtZ1bO1mMHwnryoLkPzXVQ4L7I4zXEJALv4bCoFCu2W
 emK695C3aqgiyyca5wc3UuD7fPTlpVwb6pot6pHZeNig0aSj1GwAktWxx2Xe71aI0WB5
 Gg+4AZCzqJzOV0Y5TheHbeRJSbSrn71Z73Q5oSJRpiyVlHzeztDWolGPoZeL+/uNsVXA
 7F4sEg5XSbrgs93l/GF9y0s3j+8RR3icpQD4rR21wRpn65lJiKcYvYOqBlVpIVsdShkz
 irVJZmRM8R0+z/CG6QphCuOUnoGNhVoIpwRZHuUDU13ErgRaimo1RuM8lWjf8I2S4OGx
 jIfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1745000346; x=1745605146;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=d22YnNj2bvvH91hnPGqpeN3Ca1vvKu4PX7YmTnLd3BI=;
 b=uJbX3r1fvVG3yzm5APlaBJkTmWS0LjAcIk0RbRjWxmwURLisNTFQHV8EQxhijLRCBm
 w09gR3/dc8G2q9vFd4TuOD8EecjexRY5XnkXXlMiRPCJYbOyfSDYpfcZn13BwcJHborW
 iTp6axzYG1XY+adoSG/Hjxxb7J2pFEhxa5hVYWt8tlisns73YJC/ZHEcYs3hJz0zUq3J
 Xh52soWsaBUkZsamgbTQ/jOuTOwapOwoNvoff+n43EfHISxlpiGEiP3Enk239b5jeGnC
 KoPUJECcg4KwhO2Juuj6QYMAZ0ltn/Z6uB/VnjKIaJ5tH5DxsCTMfgO53ROIL6uzpb/0
 n0WA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVc2PLJzm6LbwPMEl4UQUETkUGaE5tKocX0WML96k9BjwxHbMWWHQW2SIwDP6lALn0Kk97kUtPeDRM=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzaIlFVjXHzBcr8/x3CdNYi2Kc7n2weWvkKPstWXlUSZqP07B4L
 VxRFbTvFnqORR07ZmuiFUENIW0mkPVI0Axog0avi/L8I4bIRME7VvXDIw2dzCB7UR3g68ehQ8tB
 yuu85f18dDWv7PMrwlpHw5R05RC8fWTMww+A=
X-Gm-Gg: ASbGncub2yUWWMzx2+9Yl2y8fAvmoSbTN72Rex3NWmtwenKEUXv0k2NzVp4I0MYb3Y4
 iKK/RRCOOcJJmZTk6bzVNRLegZkop8HXHdfDtMd/47T7n5pLf1bBb4mz0HbtRb8CxFMBTlQ2LSf
 StHzwTZTGrRmix54BhbhmqHA==
X-Google-Smtp-Source: AGHT+IFV4p50Y316WvC6L326TQ06DuzofFaE8ATLtfwiWvN0aeHQqLZuaNb8xpXTzoUb4z2FpJVX3YSLno6jad/7bKA=
X-Received: by 2002:a17:90b:3b8d:b0:2ee:acea:9ec4 with SMTP id
 98e67ed59e1d1-3087bbad9edmr2033817a91.3.1745000345670; Fri, 18 Apr 2025
 11:19:05 -0700 (PDT)
MIME-Version: 1.0
References: <20250418165059.560503-1-jfalempe@redhat.com>
In-Reply-To: <20250418165059.560503-1-jfalempe@redhat.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Fri, 18 Apr 2025 20:18:52 +0200
X-Gm-Features: ATxdqUFNvn4gbPVQIz8Iq_5t6yfACtcQqcpNAlWXdLLoUUoWOhcu7yBY9nNqBOM
Message-ID: <CANiq72neXsmmYQXQOYxndFWkyp1NKa=x3skekZZJOVE-wMZeuQ@mail.gmail.com>
Subject: Re: [PATCH] drm/panic: Use a decimal fifo to avoid u64 by u64 divide
To: Jocelyn Falempe <jfalempe@redhat.com>
Cc: Miguel Ojeda <ojeda@kernel.org>,
 Christian Schrefl <chrisi.schrefl@gmail.com>, 
 Arnd Bergmann <arnd@arndb.de>, Russell King <linux@armlinux.org.uk>, 
 Paolo Bonzini <pbonzini@redhat.com>,
 rust-for-linux <rust-for-linux@vger.kernel.org>, 
 Linux ARM <linux-arm-kernel@lists.infradead.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>,
 Javier Martinez Canillas <javierm@redhat.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 dri-devel@lists.freedesktop.org
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

On Fri, Apr 18, 2025 at 6:51=E2=80=AFPM Jocelyn Falempe <jfalempe@redhat.co=
m> wrote:
>
> Link: https://lore.kernel.org/dri-devel/CANiq72ke45eOwckMhWHvmwxc03dxr4rn=
xxKvx+HvWdBLopZfrQ@mail.gmail.com/ [1]

Thanks for fixing that -- some tags for your consideration:

Reported-by: Miguel Ojeda <ojeda@kernel.org>
Closes: https://lore.kernel.org/dri-devel/CANiq72ke45eOwckMhWHvmwxc03dxr4rn=
xxKvx+HvWdBLopZfrQ@mail.gmail.com/
Fixes: ccb8ce526807 ("ARM: 9441/1: rust: Enable Rust support for ARMv7")

Cheers,
Miguel
