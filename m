Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D51FB0453E
	for <lists+dri-devel@lfdr.de>; Mon, 14 Jul 2025 18:17:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7AD0210E4F5;
	Mon, 14 Jul 2025 16:17:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="Xbd4nKjn";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com
 [209.85.216.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A3CE910E4F5
 for <dri-devel@lists.freedesktop.org>; Mon, 14 Jul 2025 16:17:45 +0000 (UTC)
Received: by mail-pj1-f53.google.com with SMTP id
 98e67ed59e1d1-313dc7be67aso828864a91.0
 for <dri-devel@lists.freedesktop.org>; Mon, 14 Jul 2025 09:17:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1752509865; x=1753114665; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=VgOAVJdh0mPlo3j6MglPtse4vJgYOB+5e63dn1DdYVk=;
 b=Xbd4nKjnYcObIAe/+RJ02I35CGfMRI5ThmyrbarHJ4cM9NHITNFFysInnXoP8Pm7g2
 tC+UkU/0OlBgYkjrssLyyOJs9CcgKYajKkhFGvQ28k/CNE2EpRMXPX4hW6wUrEDX/+vQ
 e/gkLojDoBP2Qtf3Clh2IpBZEpd7z+Mcp5bb/CxOMiYCk1+lxgCITNm4kuTO+2FgYCFG
 1zApEOfWEa9p/AnNA6OPE1CszMuCkVrGmKwHLXnMkg4Sme7Fx19H8qj0OIgE4vTECDYr
 RKtM9klA2FwUO+FNog3CAj+gX8P887qETbzFfTZfCh9KXYoEofMWbztWTuOn/JnKGAec
 tE8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1752509865; x=1753114665;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=VgOAVJdh0mPlo3j6MglPtse4vJgYOB+5e63dn1DdYVk=;
 b=cXy0M/KEIR2OcT04ahVGz9BmvuYlrmV1QMhS4JCnxvDfqQl/PSZtQ0nO0RA+5mtoif
 S6iwauqXJ079T3bUwCIo//NCNncK19mIzaTTafy2NA3yWX6ENpLXTcecXw8b9bd0OADY
 o58Xh4OGqL8ekv0N+asr9FrG7eRTOHiOJ9xjqGHDSaJ+AD/YDD+BdcH3WYeIDnSU6DIo
 3UCNEnDctGMoAuYjEMA0vf4MPr2DUfVNa49kC7Lq196RyTWXTLr2OFF96AFTEMmmP9+5
 SRDIVvFeZ2SNTVwQC6EPCh+Jd+9/2j/OWsZF9Tjoh9fMCzaehrfDSclvL0DhTWnu5jDm
 f6tA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVUHoFHI5iOD0wZIhsL2YUtAYZBRmWbUb/3h5ZvrKyrLNOkxGtoHE8UuE15wbh7CVy/OHdNQOsFNRc=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzK1nseZ0Lh7QBpOf8/qTcKpn99p0Y41lQ/eE099+w4I+RZoACN
 duQAh/bDxodv4guyeANZd3btPp2PnKkkiRK9YdaIDiOAv7NxpOS3ExrlfwgaB6SBYX4D83V8j67
 dVD8N4AZ3/abktK9glMpToDnmJ3JMW8s=
X-Gm-Gg: ASbGnctkkb+XxSrTkjYbshkp7prw4Qkpqxudlix5m256efaeEdL0XigZH+BF+pAnRKe
 drSDHloi/g3iooNHWLChvNH8eLHmfC9J/0fSEfZMc+cOkpGp3mGuBMPMiZbpbomU4oZ6x2112Ts
 lKVzrlm6ewroZ8zeZ1lvfQmmSR2uCCiCDGug8o0l6ang3y3dM9L38ZpTbNDowzo/E+s8Zf5kcK1
 QfMnb+y
X-Google-Smtp-Source: AGHT+IGRQOu48QZ3mSOJsBHbjURxIkyxYFERFZsWKzgGSlimLJJQz2LvTrTHmfQM/LmM3Tkm9Qh/bL9/Pra9XmQbDxI=
X-Received: by 2002:a17:90b:2541:b0:313:14b5:2521 with SMTP id
 98e67ed59e1d1-31c4cd0e25dmr8267765a91.5.1752509865051; Mon, 14 Jul 2025
 09:17:45 -0700 (PDT)
MIME-Version: 1.0
References: <20250709-core-cstr-fanout-1-v1-0-fd793b3e58a2@gmail.com>
 <20250709-core-cstr-fanout-1-v1-1-fd793b3e58a2@gmail.com>
 <DBBQE3GJ0CHT.5PEF7RLS6C33@kernel.org>
 <CAJ-ks9=ZHtzeyyFSZaVuA1t-3C8-hc40n6r8qFWxn628qT-OeA@mail.gmail.com>
 <CANiq72kyQQMutGDkHH=McRQens+V+wkHLpiSfivmnAwwgXE62w@mail.gmail.com>
 <CAJ-ks9kzrihJ7Jb8kAp0LpbPCfdouDQdFK06AHN3xi9pXNWZ9w@mail.gmail.com>
In-Reply-To: <CAJ-ks9kzrihJ7Jb8kAp0LpbPCfdouDQdFK06AHN3xi9pXNWZ9w@mail.gmail.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Mon, 14 Jul 2025 18:17:31 +0200
X-Gm-Features: Ac12FXx-lgQiOZYDq083Q8BlSadihlGOqb-DL3tgO7LiWlt3h_pXYA1OcdWdN3A
Message-ID: <CANiq72mgKqm+Dq98R6Tf99GWPE-n7vKOzKSTiYQR6UdddEboEA@mail.gmail.com>
Subject: Re: [PATCH 01/10] gpu: nova-core: use `core::ffi::CStr` method names
To: Tamir Duberstein <tamird@gmail.com>
Cc: Danilo Krummrich <dakr@kernel.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Miguel Ojeda <ojeda@kernel.org>, 
 Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, 
 Gary Guo <gary@garyguo.net>,
 =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Dave Ertman <david.m.ertman@intel.com>, 
 Ira Weiny <ira.weiny@intel.com>, Leon Romanovsky <leon@kernel.org>,
 Breno Leitao <leitao@debian.org>, 
 "Rafael J. Wysocki" <rafael@kernel.org>, Viresh Kumar <viresh.kumar@linaro.org>,
 Luis Chamberlain <mcgrof@kernel.org>, Russ Weight <russ.weight@linux.dev>, 
 Brendan Higgins <brendan.higgins@linux.dev>, David Gow <davidgow@google.com>, 
 Rae Moar <rmoar@google.com>, FUJITA Tomonori <fujita.tomonori@gmail.com>, 
 Rob Herring <robh@kernel.org>, Saravana Kannan <saravanak@google.com>,
 dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org, 
 linux-pm@vger.kernel.org, linux-kselftest@vger.kernel.org, 
 kunit-dev@googlegroups.com, netdev@vger.kernel.org, 
 devicetree@vger.kernel.org, Javier Martinez Canillas <javierm@redhat.com>
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

On Mon, Jul 14, 2025 at 5:28=E2=80=AFPM Tamir Duberstein <tamird@gmail.com>=
 wrote:
>
> Yep, that's what I was going to do - but do I resend the whole series,
> or somehow just this patch?

Whole series is simpler, I think.

Cheers,
Miguel
