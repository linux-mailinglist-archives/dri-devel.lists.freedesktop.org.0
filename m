Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A694B0CBA9
	for <lists+dri-devel@lfdr.de>; Mon, 21 Jul 2025 22:20:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E957710E3BC;
	Mon, 21 Jul 2025 20:20:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="NnjYTqur";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com
 [209.85.216.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 735FF10E3C1
 for <dri-devel@lists.freedesktop.org>; Mon, 21 Jul 2025 20:20:14 +0000 (UTC)
Received: by mail-pj1-f54.google.com with SMTP id
 98e67ed59e1d1-31384c8ba66so48735a91.1
 for <dri-devel@lists.freedesktop.org>; Mon, 21 Jul 2025 13:20:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1753129214; x=1753734014; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=QhoaQFtxNxausfHipJnOzeN1CL5MUK8zNLHiVu3g8n8=;
 b=NnjYTqure8rtemTPH5nw/1ek7StshYr3u3u3X1ckvC6Fr8LZcTa2878XI5D5YzxqmQ
 NOzh68S6EDJM24lDMizYdt4KWGm98bn2k50o9KEBJuCFT8efPMHr88HWkJhEQNUexdQu
 LZSDm5OExuCFHNKxcpbzEwgql+ySYwteE9c0YXXdNGUv8zjYNJtcB6llFlgsWIWydNNt
 pfuNhZqxXLTmVaZIwu6991AjWPC4w377FBiJJkiAubWMbonPGwmShLQwjcyBk09AKwgc
 4od5JTGECiqLcfRt+LkII1GNHTZrjMcp+DDGmedbsVAYmZcZ2ixmUWpVmIZByivyef9D
 KCGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1753129214; x=1753734014;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=QhoaQFtxNxausfHipJnOzeN1CL5MUK8zNLHiVu3g8n8=;
 b=ph11/4nsNzCqgarR3ND/FoHsN/7FyNhfi2m2gGSHqKy4V+wDKeQhscEit3hp39EeDL
 gGjnodXT1DgVhE2lPhNt4UCxUJ9s2lAR+6IDy02o66ZhN3047pq07SygnS5OyNwwD5cx
 00vKbioiUEULYqdSHebeXam3px3jSOfPXfKrbfBc68jROOFejFS0BNgt9BuE85XO8yln
 sHm5lIYztai8eFtIrt77Bma3vvql2wxFh4lyN5fu7w1IoyJeeAOYiFor+ix/hGWnKhiN
 x2508ZWiGJ18CB87uFuIjJd5gmIDzPF/9CAPLWPAI2KcdQuDO/MKqSkRjLpQOzYy/0EF
 k+7A==
X-Forwarded-Encrypted: i=1;
 AJvYcCVM+OFWrhexXxA/w06qF0FH68RSYzXmP1G3dhxSH/cqbqHNv1DIoJzF3bB/BmviHWIaBZAlUcVjJ84=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzeClTR1NOom5A1jJQ5I9bMuPk70Wi90lJ+lWjnhqn9MTbL6jjr
 ODFuw9otztjYh8R//KK3Gk/Y4N0Q+z4rvyxhJurNNQA34DPBRSRBMZkPJDzIDBw2KyRhx9oLi/w
 7aEi9JsXT3l84rCz+zhyCiq6TRQjseCyWJ7Hp
X-Gm-Gg: ASbGnctbmZ+bhfrSfGUmj84K/9fXO/o9c2nRrQ/x88XauUzLA5NvZGeX2UyXW7RHjV2
 AycOeGqz9rYUaMSkFWy4QGcMv/MWFVW3cF+GRKrYoEyQpyNPo6RrB8auJLgOf/Gm1+QwiUAjdo5
 ABT7Kb3OE3NA6Ve9M0uyTUN8z3/2TAFAr1uIOQINI3yh88MtIohVzgDwzfLqI1eWNVcsfh5MGBV
 8nsT/Bh
X-Google-Smtp-Source: AGHT+IGYWFzzB+EaA1sUPW0yxlHljqythmWNIpx8bVOSX58qriu4XgVDPxfn17/Rmpvzl5eSATKzzBGxAaQbrkHzpc8=
X-Received: by 2002:a17:90b:57cf:b0:311:a314:c2c9 with SMTP id
 98e67ed59e1d1-31c9e6e5debmr12843850a91.1.1753129213894; Mon, 21 Jul 2025
 13:20:13 -0700 (PDT)
MIME-Version: 1.0
References: <20250719-core-cstr-fanout-1-v2-0-e1cb53f6d233@gmail.com>
In-Reply-To: <20250719-core-cstr-fanout-1-v2-0-e1cb53f6d233@gmail.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Mon, 21 Jul 2025 22:20:01 +0200
X-Gm-Features: Ac12FXwTjwqkUOe19S3QjijBkelsLmO-zTtTU8nCjXVYR5x32YJPDBd3Xx-BAUU
Message-ID: <CANiq72mRWuQRFaouOSazi3GTXoHFaeVpyNMZcP0Lkymb+aXrqA@mail.gmail.com>
Subject: Re: [PATCH v2 00/10] rust: use `core::ffi::CStr` method names
To: Tamir Duberstein <tamird@gmail.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, 
 Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
 Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
 =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
 Danilo Krummrich <dakr@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Dave Ertman <david.m.ertman@intel.com>, Ira Weiny <ira.weiny@intel.com>, 
 Leon Romanovsky <leon@kernel.org>, Breno Leitao <leitao@debian.org>, 
 "Rafael J. Wysocki" <rafael@kernel.org>, Viresh Kumar <viresh.kumar@linaro.org>,
 Luis Chamberlain <mcgrof@kernel.org>, Russ Weight <russ.weight@linux.dev>, 
 Brendan Higgins <brendan.higgins@linux.dev>, David Gow <davidgow@google.com>, 
 Rae Moar <rmoar@google.com>, FUJITA Tomonori <fujita.tomonori@gmail.com>, 
 Rob Herring <robh@kernel.org>, Saravana Kannan <saravanak@google.com>,
 dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org, 
 linux-pm@vger.kernel.org, linux-kselftest@vger.kernel.org, 
 kunit-dev@googlegroups.com, netdev@vger.kernel.org, 
 devicetree@vger.kernel.org
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

On Sun, Jul 20, 2025 at 12:42=E2=80=AFAM Tamir Duberstein <tamird@gmail.com=
> wrote:
>
> Subsystem maintainers: I would appreciate your `Acked-by`s so that this
> can be taken through Miguel's tree (where the other series must go).

Did you apply this with `b4`? I think you picked Danilo's Acked-by,
which was for a subset, for other patches too. I can remove it when I
apply it.

(Greg's Acked-by may also have been just for his bits back in the
previous series, but in his case he didn't say anything explicitly)

Cheers,
Miguel
