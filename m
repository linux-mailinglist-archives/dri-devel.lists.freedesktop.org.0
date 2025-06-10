Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CFC11AD370E
	for <lists+dri-devel@lfdr.de>; Tue, 10 Jun 2025 14:46:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 328CB10E53E;
	Tue, 10 Jun 2025 12:46:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="E8JD63HS";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com
 [209.85.216.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9BDB010E53E;
 Tue, 10 Jun 2025 12:46:54 +0000 (UTC)
Received: by mail-pj1-f42.google.com with SMTP id
 98e67ed59e1d1-312a806f002so581667a91.3; 
 Tue, 10 Jun 2025 05:46:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1749559614; x=1750164414; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Ya7o+Lr6b2111pfm+fOXNxAnjNXhwd42toZrtju/Tv4=;
 b=E8JD63HSBchcrU5vw0hKIf9x0HKHY6ie7iOEXerZFbsJVlPzl2ww3TfaIRVPuO+Zwc
 hWSI8aJklbOYXRV9WfLBouNtgm6WaJ8SPZJKFSjFwE+/H8usC7O5ilThieYTmy3nYebN
 ZS7xE3BhNjcG0SQltumigfTp5kCqXkoS0N4MgE+KMjPq8UFUu/0qpOfM67fANLP0oGcm
 y4Qnia9PVkaolFga6pkLTjYZ3w0cYFVSwY6ulrhgLjR2jY6ZvHxkqKMbH2nh8hvCI6+c
 trJjeQ11RgBjkgkJ+f4Tisi0uLfwq3BtXNtiGNp5rK/f1KCkQqifiwwxPsryzrjRxtKB
 fbNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1749559614; x=1750164414;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Ya7o+Lr6b2111pfm+fOXNxAnjNXhwd42toZrtju/Tv4=;
 b=dvjDo2VtLFWeN4mWynb9ESc3RjTltUYBNKffPlH7iog1PrRyXlqxDmUvaSpWJRbSiE
 D1K0vNu9x9TMgE7DhrdwtneRQo1TGvKktXhOuW8cKeWshlW+2xjYbvFbPr/9mGMiF2wF
 zUSvRvbs/olDja9KttITqh47I7vZCKNkrfPR90/vLBdrDb02SXnGfEQcmhqg0NpDpjKu
 rMoIxZVJTWJUloInN//a+dkNErNI+kVlcVFV7cILOIBa+/m/QBnlmUF0iXSE2vDCTB9G
 xtwBy48SHZkA7eklyx5PQfUFubrp8/yc8kxTCpjgDVTQ6FLa7ROilcg9r5Z3mbL1N8Lu
 R+Tw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUCXRklSsm+9DABNNfPSBacbubXSmu0PD6pVtfhlNOPheGzBUZfLD3WwG10cfM/eNj3OX/3pchQog8=@lists.freedesktop.org,
 AJvYcCUfo400s0kpBFKjwXugNnjNQ2NIWUXO4XNOt6e7oveL4fF3JuTBTVDl+zOE36FgnJ/L5NFJsipuOA==@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxaFkMJhVRuj1GyMujf7vH5dK/wGNpBCKiIVKTztwGVGQIUu0Xl
 AMLhusnMCBhbCNIa8TsT/CciFhiRdYh0BZcQZyqlbXipQl8vSwaD7FfQu8i1Lhy7QboDTk8ejXx
 7nlKh7ZKqyaz03S8jaIiQwU/lyRO4I4Y=
X-Gm-Gg: ASbGncut4RHn7x7Zj8De4OyFV5MBBtNvmkErFHGCRTtQN255/8KG7edFyxEGa94r4mr
 9reTuVGJ82ujjdP4Qx9RX+CooivnXw0dJbRxOAtOonIzKBSzfS6vPuZfI7pOwLSZhcDIRNsdvb2
 uTBQjrxFnCqltr3txki63wcqTlrbsvl1wjv1U2oYE5yTk=
X-Google-Smtp-Source: AGHT+IEak5d16e/5FrsMogvb1aEvjHnaJk7Qj3Vrs9GwfeQHFh/sg4iyrbpHnOUv6MegVuwuZCa6n+gnNmqXuYGQFIA=
X-Received: by 2002:a17:90a:d006:b0:311:e9a6:332e with SMTP id
 98e67ed59e1d1-3134ded1839mr9415395a91.0.1749559614021; Tue, 10 Jun 2025
 05:46:54 -0700 (PDT)
MIME-Version: 1.0
References: <CANiq72kORZjTe3tPEBueDi57TGF7KfxgTSw4Tn0DQeK_X5hi5A@mail.gmail.com>
 <20250610123731.194853-1-trintaeoitogc@gmail.com>
In-Reply-To: <20250610123731.194853-1-trintaeoitogc@gmail.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Tue, 10 Jun 2025 14:46:41 +0200
X-Gm-Features: AX0GCFtd5VuHi7D87lqv4TVaYUAR41PmcpqldSut2APhu3FYkvxSfE5YRo6MsDs
Message-ID: <CANiq72mtY6rQekToxOSWDMVs+0Sdg0NqvNBJn1zRLTKexSmsbA@mail.gmail.com>
Subject: Re: [PATCH] rust: module: remove deprecated author key
To: Guilherme Giacomo Simoes <trintaeoitogc@gmail.com>
Cc: a.hindborg@kernel.org, airlied@gmail.com, alex.gaynor@gmail.com, 
 aliceryhl@google.com, anisse@astier.eu, bjorn3_gh@protonmail.com, 
 boqun.feng@gmail.com, dakr@kernel.org, david.m.ertman@intel.com, 
 dri-devel@lists.freedesktop.org, fujita.tomonori@gmail.com, gary@garyguo.net, 
 gregkh@linuxfoundation.org, igor.korotin.linux@gmail.com, ira.weiny@intel.com, 
 leitao@debian.org, leon@kernel.org, linux-kernel@vger.kernel.org, 
 linux-pm@vger.kernel.org, lossin@kernel.org, 
 maarten.lankhorst@linux.intel.com, mcgrof@kernel.org, mripard@kernel.org, 
 nouveau@lists.freedesktop.org, ojeda@kernel.org, rafael@kernel.org, 
 russ.weight@linux.dev, rust-for-linux@vger.kernel.org, simona@ffwll.ch, 
 tamird@gmail.com, tmgross@umich.edu, tzimmermann@suse.de, 
 viresh.kumar@linaro.org, walmeida@microsoft.com
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

On Tue, Jun 10, 2025 at 2:37=E2=80=AFPM Guilherme Giacomo Simoes
<trintaeoitogc@gmail.com> wrote:
>
> Maybe, after this patch we can make a checkpatch change for check the `au=
thors`
> key (and MODULE_AUTHOR for C side), and throw a WARN if the author is a n=
ame
> (not a url, or "rust for linux") and don't have a email address.
>
> Unless you guys tell me otherwise, I guess this is not so priority.

It is not a priority, and even if it were, it would be an independent
change, i.e. not for this patch series, so no worries :)

Cheers,
Miguel
