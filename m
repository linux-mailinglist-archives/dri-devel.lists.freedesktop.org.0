Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 10F55A75622
	for <lists+dri-devel@lfdr.de>; Sat, 29 Mar 2025 13:04:56 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5C87410E237;
	Sat, 29 Mar 2025 12:04:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="HUkWr8Ur";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com
 [209.85.216.47])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E03B710E237
 for <dri-devel@lists.freedesktop.org>; Sat, 29 Mar 2025 12:04:49 +0000 (UTC)
Received: by mail-pj1-f47.google.com with SMTP id
 98e67ed59e1d1-2ff5544af03so663945a91.1
 for <dri-devel@lists.freedesktop.org>; Sat, 29 Mar 2025 05:04:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1743249889; x=1743854689; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=wdGfX1nkkaOW4O4ujEOaMydVXl5u/twkpDKmuOuz89c=;
 b=HUkWr8UrdU6iNJ9gOE0S/9F9FIn0+4wEvNpof74bHGEvwmMVBOZeNsX1oYYGzmpuHS
 xUPt1jOvX8pBIu5jjIb8uNHShTU+xq/w1hB0trF9koh2nuHOMtMIK8O9RwErlbOh6AjG
 rbHGxKHpxOpJq75p7f4JfKEQCAAvUAJNJC+0dZYO1lKZ03/WFoFzZ0aLUO9HXjHmzoa5
 04QfaU7rDY8XX6Sj9my0enjg+/uRH7OHVHCMTTSqi+yyqmVGgwBtaIuUuCzWpyRmyNye
 sy6pryyMInO/j2KUZzelRIILPsknhH1jErf03BUmrwMIzaccq3aZ6WyVyS0uUE0Isyve
 ksEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1743249889; x=1743854689;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=wdGfX1nkkaOW4O4ujEOaMydVXl5u/twkpDKmuOuz89c=;
 b=AsdoJ2M3WjlO3rWMX99pD9C2xagkdGq0va38hNM15w+KPR+QCpfsQMvSsgNfhHsFZk
 hyWZm2JMUultUunV47k6SwVADTeNs3XB+bSl2tPcnDdLTcoOAIm0d6ZyNTP6u9DVdlAy
 67UMIfiISM3VlNMfJMjkvCpeZJxzJX5O7q4CtIJcMo1BQbu5SU+weTH1Jsf9Fu2AISXw
 M1AnBoJvKRp28Dbfx8pXyZpV7IxyDpW79m17tuwotjuVGFHHolMkMd/8d8We0uHfThlY
 /SK+zsHzDbVumD+PAewzrBSEVzrnVVYhdAVEvbW6ydaOSdoSA2E4FAOVew7QWl7sK5aL
 ZHCg==
X-Forwarded-Encrypted: i=1;
 AJvYcCXTQvjh7AKxZok8PDcoSU38p06ZNfgtDIr3IczKVXQCJKGCDIWWdluInqOWzpPbKU62+mgSVSFF0kY=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzkZlaEC4lI8MnZ6hU4Q6Mr7dP2ifVO0Whq61+DsJ/PG0Spd112
 g6hwC7Dn0HSKOmTGthg567h0T1Nm4iwPOxxALck3kfDuoHWobWnaeJxljzGNB510FUWESclG2Bs
 9jRQKuihNwnz2A3PemQ07Ek1oPhM=
X-Gm-Gg: ASbGnctcc+VbMW7ngWDWjVD0aScDK/niEpqlCwjolmaqqddGFW3W2DsJKz+M4unL6jf
 XOqY96UuUWjEZVWbdihyoD+TcGbEiGP4zMtBrjc0sQlHxN78kyekfp0sGEqTbJ1COS0wqpVMToX
 DVQiJG3cOKWZZiHxvHojsVtEZ1/Q==
X-Google-Smtp-Source: AGHT+IFo2UW5T+sFxhmwqIg+9PDnfH9AlwSZ2JIdsgHYNVzUvdlOAsTTCFjCh8UvJiZBM9onqJ46wvoqPc/VqkxO740=
X-Received: by 2002:a17:90b:390f:b0:2ff:4be6:c5e2 with SMTP id
 98e67ed59e1d1-3053216fadamr1374643a91.7.1743249889149; Sat, 29 Mar 2025
 05:04:49 -0700 (PDT)
MIME-Version: 1.0
References: <20250325212823.669459-1-lyude@redhat.com>
 <20250325212823.669459-2-lyude@redhat.com>
 <87wmcc6ppo.fsf@intel.com>
 <4a7f76493305b0afc6ae8d14cfd7bc031316b3d0.camel@redhat.com>
In-Reply-To: <4a7f76493305b0afc6ae8d14cfd7bc031316b3d0.camel@redhat.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Sat, 29 Mar 2025 13:04:36 +0100
X-Gm-Features: AQ5f1Jqbd9HZU2nzqFw8nwbypmV9t7OkAeLVo0-UYJymAEYKQwYKoPABHjKi-rQ
Message-ID: <CANiq72n_PJWF=2Duxt_bTzzH2opAcNMRt+31WcDLuu1Qx2Nz2A@mail.gmail.com>
Subject: Re: [PATCH 1/2] drm/edid: Use unsigned int in drm_add_modes_noedid()
To: Lyude Paul <lyude@redhat.com>
Cc: Jani Nikula <jani.nikula@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Miguel Ojeda <ojeda@kernel.org>, 
 Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, 
 Gary Guo <gary@garyguo.net>,
 =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Benno Lossin <benno.lossin@proton.me>, Andreas Hindborg <a.hindborg@kernel.org>,
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
 "open list:RUST:Keyword:b(?i:rust)b" <rust-for-linux@vger.kernel.org>
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

On Fri, Mar 28, 2025 at 11:27=E2=80=AFPM Lyude Paul <lyude@redhat.com> wrot=
e:
>
> So - it actually does protect us to a limited extent on the rust side of
> things. With CONFIG_RUST_OVERFLOW_CHECKS=3Dy, arithematic checks are buil=
tin to
> the language. This isn't the default config of course, but it's better th=
en
> nothing.

It is the default! :)

Cheers,
Miguel
