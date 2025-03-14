Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 57EA0A613D8
	for <lists+dri-devel@lfdr.de>; Fri, 14 Mar 2025 15:41:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6DFEE10E35C;
	Fri, 14 Mar 2025 14:41:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="Ake2xGOz";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com
 [209.85.216.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 17DA810E35C
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Mar 2025 14:41:16 +0000 (UTC)
Received: by mail-pj1-f41.google.com with SMTP id
 98e67ed59e1d1-2ff5544af03so470327a91.1
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Mar 2025 07:41:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1741963275; x=1742568075; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=OaPhMnnfACM75+eLsSzYFjdr6cOogzSh4Qh4Y0CvTCk=;
 b=Ake2xGOzuceL987SxHw6iMwyR8DyHVhPBRH5AiXqyVZ17/hq+1oHwQQyrRHoGwvj3s
 H1z7y+rwIL2Wa6PZInmvU+ziPZeIlxBMOSFg2vcqrrMIUqA6Kb2d2146x6NdLPLoK95G
 JE4y1QVH/f9VCeduIsN5ZsO7onHWi/DUg5NXrHvf02fAxY3wmAoB64Fiz5vQ/yTjiTAQ
 /8AeGm/LXnGBPBpKTADCmio+bZUZFe3qm6HAhEgUen61Amw3hiSuPrpiStwBONheb7/r
 A65atilhe+ctym0a2RF3XjtbUkHFYE7YIS6JCRvKolKSEaW377Iejs5Yh4Wycjnf3wpO
 sN+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1741963275; x=1742568075;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=OaPhMnnfACM75+eLsSzYFjdr6cOogzSh4Qh4Y0CvTCk=;
 b=o3tsIsm0FAR193kTSxkNZtrnIHiNIcHlg9aH14kvAW6u5IWDRurezCF+x4Oddv8rFc
 buSw5h+gYh7sInjDXu7PXulDQbB8H20zxDA80T/Zao8BNZmyvjn4qcILJUIcvEM3mYSF
 G19HEAfGjN5C7x0g0uHYnFltds+RuB451NVeShT0woJlihcIzENdpxOXZdPTyfl8MPj1
 3oc/92XwODX/V61jA5T/TL1W5DBCtCkZemKe7yLByuzR2tBcNwawBzrWqXiUCirpywk6
 m4RcsBb9c37HRw10Dv2heIpZFHQNaVo1YtQo6/V4i8GNKBCyzXPlhUdb/UqtPuXz49tn
 wZaQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUtsMsTyhldKuPs8rXtF3a+Dp7x2RyzV3g+u6Y0VMa5vzdAdekapS5jgZVokHXqDWXTFHQQfeByk8k=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyKPTvBSbNCcp6QmRg6Ka5Y+Etmh6SLp/kCQiWnGALILXPiqZpD
 YTiCSQ8PsWIXe0LUk6zWqWqFNLsZhc97/630xPUFiQO/gME5vn0xC2S4hcObkh/XhwtSu7yeges
 XPUrqQa7pXPXjyl9v3v7oG11ZSGs=
X-Gm-Gg: ASbGncvwgsL49x/yL2BuTzkshMCGW+5lsexYUWJtXAtzx+m9s9oeZVqbREKpjk9QKBq
 F5hBoQD2oEiQYl5mXYjE6gtEFGemdlv9lhuf/xkmF6nJlZaBJZLo/FO9gIrTQQazKkh/OlVWL4G
 zPDTqRMlKXkz/5xgQlZp7ex+LC6o33Vx6As/kj
X-Google-Smtp-Source: AGHT+IEjFDMwRMyv/uLJXjTayuOgzA+DKylGhNzsz8bhe0w39EO/liFW6CLnkGmTy9zaRFOk71HcxmEXAJIRYYfFX38=
X-Received: by 2002:a17:90b:1c0e:b0:2ee:6563:20b5 with SMTP id
 98e67ed59e1d1-30151acb45amr1502585a91.0.1741963275539; Fri, 14 Mar 2025
 07:41:15 -0700 (PDT)
MIME-Version: 1.0
References: <20250313160220.6410-2-sergeantsagara@protonmail.com>
 <20250313160220.6410-5-sergeantsagara@protonmail.com>
 <7ajr2aukrd7bdnns34ur7d37xk4aibaqsjyuoc334uiclay3yt@qiym6ju2kn3c>
In-Reply-To: <7ajr2aukrd7bdnns34ur7d37xk4aibaqsjyuoc334uiclay3yt@qiym6ju2kn3c>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Fri, 14 Mar 2025 15:41:02 +0100
X-Gm-Features: AQ5f1Jo4E3at7_v_DatqGIgW2sz-ymfWGTuGgFNOqAUl5-ewt2Oo0ufesnQVSJc
Message-ID: <CANiq72njsmokSeQG=nzRDUUmYHnpRCGNwWJ1ZXj_khxXwrZxEQ@mail.gmail.com>
Subject: Re: [PATCH RFC 2/3] rust: hid: USB Monitor Control Class driver
To: Benjamin Tissoires <bentiss@kernel.org>
Cc: Rahul Rameshbabu <sergeantsagara@protonmail.com>,
 linux-kernel@vger.kernel.org, 
 rust-for-linux@vger.kernel.org, linux-input@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, Jiri Kosina <jikos@kernel.org>, 
 Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
 Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
 =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Benno Lossin <benno.lossin@proton.me>, Andreas Hindborg <a.hindborg@kernel.org>,
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
 Danilo Krummrich <dakr@kernel.org>, Julius Zint <julius@zint.sh>
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

On Thu, Mar 13, 2025 at 5:58=E2=80=AFPM Benjamin Tissoires <bentiss@kernel.=
org> wrote:
>
> skeletons are good for documentation, but not really for code review as
> they can not compile.
>
> You should make this patch part of a documentation in
> Documentation/hid/, and squash it with the next one (having a minimal
> full driver instead of skeleton+fill in the voids).

It could be part of the documentation of the `module_hid_driver!` for
instance, like we have done for other of those macros.

(In general, we try to use `Documentation/` for things that do not fit
as documentation for any of the code "items".)

Cheers,
Miguel
