Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8CCF96B2ECF
	for <lists+dri-devel@lfdr.de>; Thu,  9 Mar 2023 21:40:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4D53710E2B1;
	Thu,  9 Mar 2023 20:40:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CA5AE10E2B1
 for <dri-devel@lists.freedesktop.org>; Thu,  9 Mar 2023 20:39:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1678394398;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=zeMyLQ59ICXaR3k0fXJSK8w4EuWIRJHEotPWxBc3jeE=;
 b=f5sKTEgT79tXTnbDv8cU6vAaQC8NLMnPsxT50EpBTu85qtzezMrSXvZECMRpCcZ69LQOdG
 eqiHbBEQw+0xAQNzyl8oUTxC4Ewe3J6lg0HBsfWGkjplIZ5ayhTkYrTU6wr/xiWpYwG5v+
 t0bMvWYGzcpqGyAdV8mLEs9VF5idwpo=
Received: from mail-lf1-f72.google.com (mail-lf1-f72.google.com
 [209.85.167.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-487-GeS0Pih9NimL2Xn7xJzCLA-1; Thu, 09 Mar 2023 15:39:57 -0500
X-MC-Unique: GeS0Pih9NimL2Xn7xJzCLA-1
Received: by mail-lf1-f72.google.com with SMTP id
 e9-20020a196909000000b004cca10c5ae6so956011lfc.9
 for <dri-devel@lists.freedesktop.org>; Thu, 09 Mar 2023 12:39:57 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678394396;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=zeMyLQ59ICXaR3k0fXJSK8w4EuWIRJHEotPWxBc3jeE=;
 b=UPg0AqiHsGXvmCTYYmQBgrK4D2cNxHBY/8klwWs2IduKMoqUtCL00RPoO5aFpkAvMy
 GWYjJCOrYfcfF5e/4spB3xQWnj+4zJYvfOacge3uh2WbEj23H+yKK+WIZ3kWxG7iSniq
 jKZqUskwP4gALy7mvP0p2Rte/s6S5BS3YYrKWSCQDVZSZ6F6vW/7vNnAdaFEzwciJK5d
 Vl4j9VHmGrNkET2UBHN9hrjcmuCOJsR5T3a5PRjqpw3VObl4/u6cUS1uz33l4CuvDdZ9
 t8N2iniTur+RAh8/GePBAXTsXBcIOzYswfFpGDAKhCjyukSvO0QuPme+FedE3PM2TCUT
 Xtzw==
X-Gm-Message-State: AO0yUKUqXBf6HikV+yfnOTy6LBCVaUwu1ls0CYiEohdhHBgIXXmxfWqB
 5p2LJKwXbHVRp+lVUvB6uUDjhu08W4AHcDl5aM5tgBzCmLKinD7JKxruuLR3VNWtlDLIGDhl0PP
 Asa1Ztjv9yd8l5fVeXvYPhrBdKOo+NSfsAakKsXSVW9zk
X-Received: by 2002:a05:6512:24f:b0:4dd:fd4e:5a21 with SMTP id
 b15-20020a056512024f00b004ddfd4e5a21mr7221209lfo.11.1678394396020; 
 Thu, 09 Mar 2023 12:39:56 -0800 (PST)
X-Google-Smtp-Source: AK7set8Ggw77nlrwunPRgDCpaIaB7tQGweTebDCE7OESc24dT5ASfvD1foGPomTGYfbg4tMplkm2UwvTs8/qSogzdS0=
X-Received: by 2002:a05:6512:24f:b0:4dd:fd4e:5a21 with SMTP id
 b15-20020a056512024f00b004ddfd4e5a21mr7221181lfo.11.1678394395659; Thu, 09
 Mar 2023 12:39:55 -0800 (PST)
MIME-Version: 1.0
References: <20230307-rust-drm-v1-0-917ff5bc80a8@asahilina.net>
 <20230307-rust-drm-v1-1-917ff5bc80a8@asahilina.net>
 <D9Cyx-9kbjaeb8QVBFqapDyctoDdVyu5uXEJDR41sdXUDXM1VgdRicV5huJDwfC3-T2J-R_DYHH8JZ1_aRdgbeYZFT78J9QveeeYbiTq4yU=@protonmail.com>
 <11ce9291-c17f-e73d-fb5d-13d5386fe6be@asahilina.net>
 <c9e0c6fdcd642192a59a2fea95941a773ea7b3e3.camel@collabora.com>
In-Reply-To: <c9e0c6fdcd642192a59a2fea95941a773ea7b3e3.camel@collabora.com>
From: Karol Herbst <kherbst@redhat.com>
Date: Thu, 9 Mar 2023 21:39:43 +0100
Message-ID: <CACO55tukF-+HWUHve0YUPbq4jPFgU3szuedKLjAw55h_3uX5gg@mail.gmail.com>
Subject: Re: [PATCH RFC 01/18] rust: drm: ioctl: Add DRM ioctl abstraction
To: Faith Ekstrand <faith.ekstrand@collabora.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
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
Cc: Asahi Lina <lina@asahilina.net>, Dave Hansen <dave.hansen@linux.intel.com>,
 dri-devel@lists.freedesktop.org, Mary <mary@mary.zone>,
 Gary Guo <gary@garyguo.net>, Ella Stanforth <ella@iglunix.org>,
 Sumit Semwal <sumit.semwal@linaro.org>,
 Alyssa Rosenzweig <alyssa@rosenzweig.io>, Luben Tuikov <luben.tuikov@amd.com>,
 Alex Gaynor <alex.gaynor@gmail.com>, Miguel Ojeda <ojeda@kernel.org>,
 linux-media@vger.kernel.org, Wedson Almeida Filho <wedsonaf@gmail.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, rust-for-linux@vger.kernel.org,
 Boqun Feng <boqun.feng@gmail.com>,
 =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>,
 linux-sgx@vger.kernel.org, linaro-mm-sig@lists.linaro.org,
 linux-kernel@vger.kernel.org, Jarkko Sakkinen <jarkko@kernel.org>,
 asahi@lists.linux.dev,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Mar 9, 2023 at 9:24=E2=80=AFPM Faith Ekstrand
<faith.ekstrand@collabora.com> wrote:
>
> On Thu, 2023-03-09 at 15:04 +0900, Asahi Lina wrote:
> > On 08/03/2023 02.34, Bj=C3=B6rn Roy Baron wrote:
> > > > +                            // SAFETY: This is just the ioctl
> > > > argument, which hopefully has the right type
> > > > +                            // (we've done our best checking the
> > > > size).
> > >
> > > In the rust tree there is the ReadableFromBytes [1] trait which
> > > indicates that it is safe to read arbitrary bytes into the type.
> > > Maybe you could add it as bound on the argument type when it lands
> > > in rust-next? This way you can't end up with for example a struct
> > > containing a bool with the byte value 2, which is UB.
> >
> > There's actually a much bigger story here, because that trait isn't
> > really very useful without a way to auto-derive it. I need the same
> > kind
> > of guarantee for all the GPU firmware structs...
> >
> > There's one using only declarative macros [1] and one using proc
> > macros
> > [2]. And then, since ioctl arguments are declared in C UAPI header
> > files, we need a way to be able to derive those traits for them...
> > which
> > I guess means bindgen changes?
>
> It'd be cool to be able to auto-verify that uAPI structs are all
> tightly packed and use the right subset of types.  Maybe not possible
> this iteration but it'd be cool to see in future.  I'd like to see it
> for C as well, ideally.
>
> ~Faith
>

I'm sure that with a macro you could verify that a struct definition
doesn't contain any gaps, just not sure on how one would enforce that.
Could add a trait which can only be implemented through a proc_macro?
Maybe we can have a proc_macro ensuring no gaps? Would be cool tech to
have indeed.

