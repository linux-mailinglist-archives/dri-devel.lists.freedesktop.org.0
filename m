Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 86B60A6E0FE
	for <lists+dri-devel@lfdr.de>; Mon, 24 Mar 2025 18:37:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CECFF10E4A8;
	Mon, 24 Mar 2025 17:37:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="is2qQqpu";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com
 [209.85.216.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DA73410E4A8
 for <dri-devel@lists.freedesktop.org>; Mon, 24 Mar 2025 17:37:02 +0000 (UTC)
Received: by mail-pj1-f53.google.com with SMTP id
 98e67ed59e1d1-301a6347494so1199530a91.3
 for <dri-devel@lists.freedesktop.org>; Mon, 24 Mar 2025 10:37:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1742837822; x=1743442622; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=69JJjcOX5eDVKLskijk4B2SQOSJ22teSjVBu6vFOVp8=;
 b=is2qQqpuMFCjlu/5HcxPpyGq5YQoSQv3cxcG+/pTyjMQTDSTYtjpTMWJ2/1V4AJPF6
 PBQRBZ23QJddMlLSPc9UPxstJ45Uk6JAZ+WP61cCkrIcGVW7h0oVpgtdmBEBcxO/55JI
 kPQuPZEC2Ui4DbFaCy/ItymUozqMMasjeVN/aDYyFjp05x2UJuRarcAmezWboXlJcD7S
 Z8+EZHOeYADAI0Db3jFBTyeeZyIi4G1bdGUc9sDRVHWWfaMORO52B037ovFqLK/8LQJL
 E8otvQx+YA0HwsJf9kcFgXcyWn37mCd01asVZslJpmcl2pHW4Vepw+sapfCO9Jxdjwdv
 kd1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1742837822; x=1743442622;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=69JJjcOX5eDVKLskijk4B2SQOSJ22teSjVBu6vFOVp8=;
 b=fMyYuXZegEyGLvU04BYPv/Ztv2nofep9qtNjiAgevWfS48F3RDw2fd40OuchqhIIKj
 stajFT0nOBJvPs1cS0dsJSChx7OYcgch3MsxEdpBiRvKBQz+qTq6LGDYYcSrKpBpL4kE
 4NmxLoJsvA1m1o+xSfgEgwcWboIL58zRzAMlHrd9htbhs3PeupUvcnN3VjoBXzLbSP+F
 QU/zzzgTmnQQ/OePcxYHaE9FhkdGMyMxyAUzne/eAVn5t0Y8+QSGAO307ZXjOvfT3taw
 37e0KDr0Qvkxxuc1MedMOODlHvC72Vs0M3G9N+RNQournt/J18PTvb5MK2ZhoCSdTz/L
 2IaQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWgDkWZ7u4NPw2GOkEXj47CYJzryyQJg85lJNyfyiomSTzMZvQzviMPnJBcZA1fCaeH9q2ZmaHYcSk=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzNW0fxxHPgqx0tM6+HM/30MrUYQ6cwmBby2KB8zU/wu4D32Pbj
 APgyjTuV7CWNd11k1YWu1/U5AtRZxSohWQdNEPW7DQL+uycvFQ2cnFUIYA17micLVtl6qabmbLQ
 U4vwmmRUUjVt6W0HWNTGgZBgnR4k=
X-Gm-Gg: ASbGncu96xgU3O+v2mwQ3oaiOqkXZ/BV/d0s70vAF9tLwzUT3g5o5m6QuqjYX9iHy2x
 g80V2KzzraYIA+r5ml6sFXzaZmPpVRhxnHz8iMzqkMMkbWPpFTiaroA8qwatuBDxK9r0srhlTse
 38S/fqgmhYq59EoejQ8CPT9MYSDg==
X-Google-Smtp-Source: AGHT+IFUfJRzqAlcwqRGIR42C+MQ4CQtkFiLwS/ECZRB5538auZlyErsfsZGQdT1VlP88qOFuiR1vK3EzFkLShjtobw=
X-Received: by 2002:a17:90b:1d91:b0:2ff:78dd:2875 with SMTP id
 98e67ed59e1d1-3030fefb123mr8424394a91.5.1742837822154; Mon, 24 Mar 2025
 10:37:02 -0700 (PDT)
MIME-Version: 1.0
References: <20250324-gpuvm-v1-0-7f8213eebb56@collabora.com>
 <20250324-gpuvm-v1-2-7f8213eebb56@collabora.com>
In-Reply-To: <20250324-gpuvm-v1-2-7f8213eebb56@collabora.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Mon, 24 Mar 2025 18:36:49 +0100
X-Gm-Features: AQ5f1JqKEQjEOH0hQER9UoxLXyyw9kL-VoZN7He3uxMUqnP5eeVyZ20eChjJehw
Message-ID: <CANiq72mQ3zuYmsq1PD-49kKLNji8OJwuvxK5QWkNaBMuC-PHQg@mail.gmail.com>
Subject: Re: [PATCH 2/2] rust: drm: Add GPUVM abstraction
To: Daniel Almeida <daniel.almeida@collabora.com>
Cc: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
 Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
 =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Benno Lossin <benno.lossin@proton.me>, Andreas Hindborg <a.hindborg@kernel.org>,
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
 Sumit Semwal <sumit.semwal@linaro.org>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
 Boris Brezillon <boris.brezillon@collabora.com>, linux-kernel@vger.kernel.org, 
 rust-for-linux@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 Asahi Lina <lina@asahilina.net>
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

Hi Daniel,

A few quick notes for future versions on style/docs to try to keep
things consistent upstream -- not an actual review.

On Mon, Mar 24, 2025 at 4:14=E2=80=AFPM Daniel Almeida
<daniel.almeida@collabora.com> wrote:
>
> +#[allow(type_alias_bounds)]

The documentation says this is highly discouraged -- it may be good to
mention why it is OK in this instance in a comment or similar.

Also, could this be `expect`? (e.g. if it triggers in all compiler
versions we support)

> +// A convenience type for the driver's GEM object.

Should this be a `///` comment, i.e. docs?

> +/// Trait that must be implemented by DRM drivers to represent a DRM Gpu=
Vm (a GPU address space).

(Throughout the file) Markdown in documentation, e.g. `GpuVm`.

(Throughout the file) Intra-doc links where they work, e.g. [`GpuVm`]
(assuming it works this one).

> +        // - Ok(()) is always returned.

(Throughout the file) Markdown in normal comments too.

> +/// A transparent wrapper over `drm_gpuva_op_map`.

(Throughout the file) A link to C definitions is always nice if there
is a good one, e.g.

    [`drm_gpuva_op_map`]:
https://docs.kernel.org/gpu/drm-mm.html#c.drm_gpuva_op_map

Ideally we will eventually have a better way to link these
automatically, but for the time being, this helps (and later we can do
a replace easier).

> +/// `None`.
> +
> +/// Note: the reason for a dedicated remap operation, rather than arbitr=
ary

Missing `///` (?).

> +#[repr(C)]
> +#[pin_data]
> +/// A GPU VA range.
> +///
> +/// Drivers can use `inner` to store additional data.

(Throughout the file) We typically place attributes go below the
documentation -- or is there a reason to do it like this?

We had cases with e.g. Clippy bugs regarding safety comments that
could be workarounded with "attribute movement", but it does not seem
to be the case here.

> +        if p.is_null() {
> +            Err(ENOMEM)

For error cases, we typically try to do early returns instead.

> +    /// Iterates the given range of the GPU VA space. It utilizes
> +    /// [`DriverGpuVm`] to call back into the driver providing the split=
 and
> +    /// merge steps.

This title (and the next one) may be a bit too long (or not -- please
check in the rendered docs), i.e. the first paragraph is the "title",
which is used differently in the rendered docs. If there is a way to
have a shorter title that still differentiates between the two
methods, that would be nice.

> +    /// # Arguments
> +    ///
> +    /// - `ctx`: A driver-specific context.
> +    /// - `req_obj`: The GEM object to map.
> +    /// - `req_addr`: The start address of the new mapping.
> +    /// - `req_range`: The range of the mapping.
> +    /// - `req_offset`: The offset into the GEM object.

Normally we try to avoid this kind of sections and instead reference
the arguments from the text (e.g. "...the range of the mapping
(`req_range`)...") -- but if there is no good way to do it, then it is
OK.

> +// SAFETY: All our trait methods take locks

(Throughout the file) Period at the end.

Thanks!

Cheers,
Miguel
