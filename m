Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D6C74B43CA7
	for <lists+dri-devel@lfdr.de>; Thu,  4 Sep 2025 15:10:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1309D10EA2E;
	Thu,  4 Sep 2025 13:10:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.b="gZ/UuaPU";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com
 [209.85.221.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2722610EA43
 for <dri-devel@lists.freedesktop.org>; Thu,  4 Sep 2025 13:10:06 +0000 (UTC)
Received: by mail-wr1-f49.google.com with SMTP id
 ffacd0b85a97d-3d17f24d42fso840745f8f.1
 for <dri-devel@lists.freedesktop.org>; Thu, 04 Sep 2025 06:10:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1756991404; x=1757596204;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=oUmGcnb9DOoFKF6N0qbvgApw3pjqcT4j1CgQZsy8ec8=;
 b=gZ/UuaPUEYdSD6MnlkIIMJ72n3fC7AmUXLxwEe6vdBfvHPRuLDBnEt/fg2s1q/cZxV
 MNkWVClFl24kabnlpaihxndPTBMpKNh9ueTu9gl2PDJYD8x2PQ6OnyxKzb1IQQAapSyd
 HCvMPQ0En8+QCjFmnmhJfCbe7RjV/jDzeHx1TzdVeF3WruVuwpWHNC4MsRVPBXzsnhrP
 7xgXaGk9oiUwuU8hCrX6LypGIL3B0Wr53ETlhczapYwRDsqxeM/ni9gP9deF71yet+Di
 8ZTdoa01LGBfSCKcsbCBuRO7JhuX7NrXEqFaXgTAiDL9XETS6EWf1osQMWi7Ep5cfJPf
 hm2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1756991404; x=1757596204;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=oUmGcnb9DOoFKF6N0qbvgApw3pjqcT4j1CgQZsy8ec8=;
 b=wmaQc37zo0YW1Xjkm5YqiC090lDyno16sBWL6fyuP/dPXF2g4mmhdxDXErO3J3EIC4
 rzUpZsr/3JjX06gosU1rgSgLepOqJibLBg5tRDpSdvbyFrFerK+1HOtfiFTpXx5KcTHN
 hkDcjjhOhkTOx0kLueoWjbbDqFJrIfoWim4FnfkGB09O4i9cWFkZx1eetRY43FTr4edk
 YkpbeIg824cPdkdUA2Fx0Or9oGIHE97VV9LcSvyp2yIlXs21bikjzntPqgLe6oU/Jm8T
 FsLhSEMMBUiSZmY9Gr8oVo7n8acVbY2XVGlQTS4ClqjxnHpem9j4m0u17h0pG24wcK0y
 g71Q==
X-Gm-Message-State: AOJu0Yyr32TAKnIMxQKCp0av0jmZVZ780r0L3u9ntFpaHslARCq4txSL
 yOemIJwejqaFN2iDSSphX+sZBEGOY0pmnPu2lRa4ZKNAW59DfzFr7RgDbQ3XPEol+7YDi6c1Gcq
 tvsED/GJQbZp+BL/04zxSFVKbpXXOvhafJy+WxBaL
X-Gm-Gg: ASbGncvslX14gYfcievbAZHr21nOstbwLvvaGPwnthTifgVIjTyPSqeVK+v0COxqqKt
 fIclUxgcm+0dU5x3iN70eFY1O6vwI6tj6kyEsPbjPFbn01c21OSfJ4L4AYJ98jz6SWn12/eZVV/
 aWs+0vgL+WvjZI7LiKHow/yf0oWZSb09v5iBj7ENnc5ke72EZndQRrBGfZyJRJ2mCi2C/0feC9d
 +TOdWgMfsd+D1Z51HIe4/+QIdMtk3a+03l8XXPr5f/hRPhLaqHBqsBbhUShZr5VA+cU/q2Tjshv
 NOsLbXAN69Y=
X-Google-Smtp-Source: AGHT+IFHJ2ZrBugJMZBEfCi74IIrGqgkQHBE6XqdlI+XjphUPOfhoV+znXePJUYjgikhYscUmFzUrXSIaK4FVkPPW1w=
X-Received: by 2002:a05:6000:1ac8:b0:3e1:2d70:6785 with SMTP id
 ffacd0b85a97d-3e12d706fa9mr1875838f8f.31.1756991404184; Thu, 04 Sep 2025
 06:10:04 -0700 (PDT)
MIME-Version: 1.0
References: <20250829224116.477990-1-lyude@redhat.com>
 <20250829224116.477990-7-lyude@redhat.com>
In-Reply-To: <20250829224116.477990-7-lyude@redhat.com>
From: Alice Ryhl <aliceryhl@google.com>
Date: Thu, 4 Sep 2025 15:09:51 +0200
X-Gm-Features: Ac12FXy8H7G6oV4EU2UIFIgA0FDxXvR6Hytw96Q6mBmUHCGBN96sbfN9dB0h2Kk
Message-ID: <CAH5fLgjFePwYmyivpU-Vk2KbKtu7t5DJ1cZUJmEQ_Y+Dgynk9w@mail.gmail.com>
Subject: Re: [PATCH v3 06/14] rust: drm: gem: Add raw_dma_resv() function
To: Lyude Paul <lyude@redhat.com>
Cc: dri-devel@lists.freedesktop.org, rust-for-linux@vger.kernel.org, 
 linux-kernel@vger.kernel.org, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
 Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
 =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
 Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, 
 Sumit Semwal <sumit.semwal@linaro.org>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
 Daniel Almeida <daniel.almeida@collabora.com>,
 Asahi Lina <lina+kernel@asahilina.net>, 
 "open list:DMA BUFFER SHARING FRAMEWORK:Keyword:bdma_(?:buf|fence|resv)b"
 <linux-media@vger.kernel.org>, 
 "moderated list:DMA BUFFER SHARING FRAMEWORK:Keyword:bdma_(?:buf|fence|resv)b"
 <linaro-mm-sig@lists.linaro.org>
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

On Sat, Aug 30, 2025 at 12:42=E2=80=AFAM Lyude Paul <lyude@redhat.com> wrot=
e:
>
> For retrieving a pointer to the struct dma_resv for a given GEM object. W=
e
> also introduce it in a new trait, BaseObjectPrivate, which we automatical=
ly
> implement for all gem objects and don't expose to users outside of the
> crate.
>
> Signed-off-by: Lyude Paul <lyude@redhat.com>
> ---
>  rust/kernel/drm/gem/mod.rs | 12 ++++++++++++
>  1 file changed, 12 insertions(+)
>
> diff --git a/rust/kernel/drm/gem/mod.rs b/rust/kernel/drm/gem/mod.rs
> index ec36cd9ea69ed..f901d4263ee87 100644
> --- a/rust/kernel/drm/gem/mod.rs
> +++ b/rust/kernel/drm/gem/mod.rs
> @@ -186,6 +186,18 @@ fn create_mmap_offset(&self) -> Result<u64> {
>
>  impl<T: IntoGEMObject> BaseObject for T {}
>
> +/// Crate-private base operations shared by all GEM object classes.
> +#[expect(unused)]
> +pub(crate) trait BaseObjectPrivate: IntoGEMObject {
> +    /// Return a pointer to this object's dma_resv.
> +    fn raw_dma_resv(&self) -> *mut bindings::dma_resv {
> +        // SAFETY: `as_gem_obj()` always returns a valid pointer to the =
base DRM gem object
> +        unsafe { (*self.as_raw()).resv }
> +    }
> +}
> +
> +impl<T: IntoGEMObject> BaseObjectPrivate for T {}

I think this use of a trait is somewhat of an antipattern. I would
probably have suggested a standalone method instead.

Alice
