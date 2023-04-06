Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BFE806D9E62
	for <lists+dri-devel@lfdr.de>; Thu,  6 Apr 2023 19:19:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5FEE810E129;
	Thu,  6 Apr 2023 17:19:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-x1130.google.com (mail-yw1-x1130.google.com
 [IPv6:2607:f8b0:4864:20::1130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 55A9810E129
 for <dri-devel@lists.freedesktop.org>; Thu,  6 Apr 2023 17:19:34 +0000 (UTC)
Received: by mail-yw1-x1130.google.com with SMTP id
 00721157ae682-536af432ee5so752864327b3.0
 for <dri-devel@lists.freedesktop.org>; Thu, 06 Apr 2023 10:19:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112; t=1680801573; x=1683393573;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=zs6V4xSX9ZlfsxZNTadcJVx+Wo1UCjoit8XXqPB91Bs=;
 b=hynWLQyHnbgidmV91dL/pTn/bQ6Fvwdl16G4bV7a0cfNjLvqbo7ZJezWtT71601dZj
 vyA53QTaqOyxJna1YPWAZZEarfelzHGrcBwBimALxU7yhWeWk2u2q2xxUwbzmAYpGGK6
 Y7i6BYF3GFekGu174zZNzsSmnCBetspFUWvpNWr/Ek6eEcl2orfm5riHIUZvohNa2NoT
 THQ115gs41K86a86xhzjbrzfSumTJSSyT9oie6SH1KzNCEs2IgJqB2q9tj4cAvVE7IIp
 jujKfsP6+1HzIQ6+/CMRmw7bh3ZuHnygqXkvlaIM0YxkRlYY1rMhipDTo33w14rQtZ70
 /DYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680801573; x=1683393573;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=zs6V4xSX9ZlfsxZNTadcJVx+Wo1UCjoit8XXqPB91Bs=;
 b=eO2fUH40Mdt/EeAS0+Se1WF5C+1RmPfUZYRjDPNWaRLGAzPIDI2iYqDXhBxLd0H0KB
 MB8c5b7+Qihy/I6U284g/AN8L5S3NKn7T5xg7uENi5z2T+ze6P5wPkySjsQeZRdNQEaE
 1T0l+st4AF8PlyucJSXd7Q6UerddIk1U7I2nGt4gwYGDhxzX97a4rJITN6owE43hLKQB
 FIJr84M3Fbvh0uNciKoy4TybOGQ/o/ie5/6HDmhqMdJPis+GAgqm4mK72mIzl26kdOj8
 L1ErzLEmqYrVkm3b2ziGK9f6KvbSEtzjceN+Ow3V8LoVeRJmrYjvYbCEkRXpxpqJ8PCN
 d1/g==
X-Gm-Message-State: AAQBX9dlBOHzYeWMXCS4HW0zrzhb06K3GOHFLg//aBLFvdoJ5xo2f4QH
 qv6Li5cJRhMOUWdy+Ie+pTzG/+QcsKCu9uxNC5I=
X-Google-Smtp-Source: AKy350a/mqrWTiqYdMMX1Vw+SbgVv8dxMUMkHCqZprPzSXoQ/vKHSQZbDVIf1wpejJDyAA0MT4Wjf5VqY2/qxGwAVQw=
X-Received: by 2002:a81:c642:0:b0:546:63a:6e23 with SMTP id
 q2-20020a81c642000000b00546063a6e23mr6185709ywj.0.1680801572930; Thu, 06 Apr
 2023 10:19:32 -0700 (PDT)
MIME-Version: 1.0
References: <20230307-rust-drm-v1-0-917ff5bc80a8@asahilina.net>
 <20230307-rust-drm-v1-7-917ff5bc80a8@asahilina.net>
 <ZC7T92F7K9XTZPZ1@phenom.ffwll.local>
 <CANiq72=E2k7+_cwYw_EjVezk0mWCRqbH4MUjsEmxWgJMh=3AEQ@mail.gmail.com>
 <ZC7pHlLFutMWJF1s@phenom.ffwll.local>
In-Reply-To: <ZC7pHlLFutMWJF1s@phenom.ffwll.local>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Thu, 6 Apr 2023 19:19:21 +0200
Message-ID: <CANiq72=JOtZ7cc+FDxUY+HUEccRjXp=3gjbM04kwBiFR=Ew2-g@mail.gmail.com>
Subject: Re: [PATCH RFC 07/18] rust: drm: mm: Add DRM MM Range Allocator
 abstraction
To: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>,
 Asahi Lina <lina@asahilina.net>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Miguel Ojeda <ojeda@kernel.org>, 
 Alex Gaynor <alex.gaynor@gmail.com>, Wedson Almeida Filho <wedsonaf@gmail.com>,
 Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
 =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Sumit Semwal <sumit.semwal@linaro.org>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
 Luben Tuikov <luben.tuikov@amd.com>, Jarkko Sakkinen <jarkko@kernel.org>, 
 Dave Hansen <dave.hansen@linux.intel.com>,
 Alyssa Rosenzweig <alyssa@rosenzweig.io>, 
 Karol Herbst <kherbst@redhat.com>, Ella Stanforth <ella@iglunix.org>, 
 Faith Ekstrand <faith.ekstrand@collabora.com>, Mary <mary@mary.zone>, 
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 rust-for-linux@vger.kernel.org, linux-media@vger.kernel.org, 
 linaro-mm-sig@lists.linaro.org, linux-sgx@vger.kernel.org, 
 asahi@lists.linux.dev
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

On Thu, Apr 6, 2023 at 5:45=E2=80=AFPM Daniel Vetter <daniel@ffwll.ch> wrot=
e:
>
> Yeah this all looks great and very hyperlinked.
>
> I think the only nit I have is that for types with two or more type
> variables (like the rbtree) what each of them should represent in the top
> intro. I can guess it's <Key, Value> and not the other way round, but
> confirmation takes quite a bit of scrolling to check with the function
> types.

Yeah, that is fair. Personally I prefer more descriptive names when
there are several or they have a special/asymmetric role.

> Otherwise I think perfect api docs.

Glad you like it!

> Just a quick comment on this, that's the same we do on the C side. Most
> overview chapters are actually DOC: sections pulled in from the code.
>
> What I meant here is that for big overview stuff (like for modesetting ho=
w
> the display pipe structures tie together as an example:
> https://dri.freedesktop.org/docs/drm/gpu/drm-kms.html#overview)
> it doesn't make sense to duplicate that in rustdoc once more.

Yeah, definitely, if it is already somewhere else for C, we shouldn't
duplicate it (that is what I meant by the "shared across C and Rust"
exception).

> Maybe drm is the exception, but if you look at our .rst files we also hav=
e
> most of our docs in the code:
>
> https://cgit.freedesktop.org/drm/drm/tree/Documentation/gpu/drm-kms-helpe=
rs.rst
>
> The rst files just provide the scaffolding because C dosn't have
> crates/modules hierarchy that would do this for you automatically.

Sorry, I was talking in general in the kernel. That
`drm-kms-helpers.rst` looks great.

From a quick grep, I think you are indeed one of the big users of
`DOC: `, which indeed map closely to what you would do in Rust without
the scaffolding need.

So I think you will like writing docs in Rust :)

Cheers,
Miguel
