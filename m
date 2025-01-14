Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F083A10A44
	for <lists+dri-devel@lfdr.de>; Tue, 14 Jan 2025 16:04:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 73EDB10E37F;
	Tue, 14 Jan 2025 15:04:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="f2ikp1wo";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x102c.google.com (mail-pj1-x102c.google.com
 [IPv6:2607:f8b0:4864:20::102c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DD46D10E37F
 for <dri-devel@lists.freedesktop.org>; Tue, 14 Jan 2025 15:04:54 +0000 (UTC)
Received: by mail-pj1-x102c.google.com with SMTP id
 98e67ed59e1d1-2ef718cb473so1147048a91.1
 for <dri-devel@lists.freedesktop.org>; Tue, 14 Jan 2025 07:04:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1736867094; x=1737471894; darn=lists.freedesktop.org;
 h=content-transfer-encoding:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Z96OTFkvAdTfb3beAUUpfoJj9MhcZGM3k/cg4yLd0hc=;
 b=f2ikp1woeM34y+4YJ+Tl85As2rZJDEgWqQrd0oQHaCDz0s+gNEcX1/Oi6XcqkKeyrU
 TRHv5qEecGpBNs6OCTmbEInE9E98x/Gfos/9m016Rt4X643ei+HtOTdlcwuMJWj5uIwU
 tYruII1Nh/frGDEppnWEL6uQhIVO6k6agkowKn/TBnDfhltUI51zyDmA6y0PR+RWPEfz
 8ddnYBRALjmv2iCRCefiQ42pBFOjxckLpQrYUpZWG57Cq4KcMonGkcGQWnrSp7kTez24
 0M7NxP+MU/bVdVKll3CL5gKb1NuJhjWtDwREMp5E85RNTcU1OZ3Vm7Lzhe+QGg5frhDm
 aOqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1736867094; x=1737471894;
 h=content-transfer-encoding:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Z96OTFkvAdTfb3beAUUpfoJj9MhcZGM3k/cg4yLd0hc=;
 b=g/1mb29XTQM6ABKoT5EMLc+sibWFvFEmQdd3NYnlwldfEPuYoB/GUtP6iW570JpdLm
 PfGysmbfADOkVlK6P3pZu128ZA0MzBCnWM7EDy5QLwuGtyvP/ynWHYE+PfyP4y1vBwQV
 RlHRNmLieeiTDctp5e0vMc+v2TvSqOtRIhtmBlIzxUDQeORf+cuwu0x5b3s5ej3mW+Cb
 /Iobfxuj81fOLO6v7n5d7DKDqVqiDeVSZne/uDIcVJK0omRxc3o7JjXxLzxNlsiQ4Drk
 3SWMrwtrrdTJtS6U/ZIlx0wLqE+3bc54meKh9gHxsJweirmrC4/cGIoSUqT4V1XpGI1l
 g/ww==
X-Forwarded-Encrypted: i=1;
 AJvYcCUG3ay52+Lsmc/agQBR2oHHvijHwL5hy2g4D6rIDyBWraBxmw3lq4d0bkc/yAnAnAiIW04jopd4U5I=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yxue/mk3q2qZpfbDSNdbao3r+VuvBFVGhPl+g9r3KcdN56kZC7Y
 M479NlUJxiyWg5SFm6RsLHYIdmw4hQoACQNKc9JY2mm+L5p0JgBsALLRecZykeghWhj98jBhgcg
 DliP9/zfrDQsavpvGFSiLCgvtTkI=
X-Gm-Gg: ASbGncv6xW1CUtUTUHYxTVp09nK3dOzP7YS/0uNGs3t86zA6G7zcX/Vamdxa8rU+B82
 RHC8/fGOgod2/BKisfInI5z5+3KZKgPQ52ZlV2w==
X-Google-Smtp-Source: AGHT+IH1L2K6ZTogUUYGpW6OauKJzk0IiQ/m7JIZn9eq3dPe9Ojpa3C3FmGNTCx6h610/EUWD/tJQx1WB0005ivDRKs=
X-Received: by 2002:a17:90b:568b:b0:2ee:6d73:7ae6 with SMTP id
 98e67ed59e1d1-2f54911d990mr13556945a91.7.1736867094223; Tue, 14 Jan 2025
 07:04:54 -0800 (PST)
MIME-Version: 1.0
References: <20240930233257.1189730-1-lyude@redhat.com>
 <20240930233257.1189730-34-lyude@redhat.com>
 <FD0FB134-5FFD-419A-9B66-85ED2EB6554A@collabora.com>
 <d35e7f02b1d123fad8d4aefa494d0e83424c6e96.camel@redhat.com>
 <Z4ZzkBDCryk-NKPg@phenom.ffwll.local>
In-Reply-To: <Z4ZzkBDCryk-NKPg@phenom.ffwll.local>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Tue, 14 Jan 2025 16:04:41 +0100
X-Gm-Features: AbW1kvYAob4x0ZdjNClG9HmEC8lbd7Hjs0RuAGGsaVOZ-nWHpDFw8-W1fWpd5A4
Message-ID: <CANiq72=M3=0rcTfQS9Gch8NeNyrpXb91t-z-gDBSDO8V-Bh5gQ@mail.gmail.com>
Subject: Re: [WIP RFC v2 33/35] WIP: rust: drm/kms: Add VblankSupport
To: Lyude Paul <lyude@redhat.com>,
 Daniel Almeida <daniel.almeida@collabora.com>, 
 dri-devel@lists.freedesktop.org, rust-for-linux@vger.kernel.org, 
 Asahi Lina <lina@asahilina.net>, Danilo Krummrich <dakr@kernel.org>,
 mcanal@igalia.com, 
 airlied@redhat.com, zhiw@nvidia.com, cjia@nvidia.com, jhubbard@nvidia.com, 
 Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
 Wedson Almeida Filho <wedsonaf@gmail.com>, Boqun Feng <boqun.feng@gmail.com>,
 Gary Guo <gary@garyguo.net>, 
 =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Benno Lossin <benno.lossin@proton.me>,
 Andreas Hindborg <a.hindborg@samsung.com>, 
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
 Danilo Krummrich <dakr@redhat.com>,
 Mika Westerberg <mika.westerberg@linux.intel.com>, 
 open list <linux-kernel@vger.kernel.org>
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

On Tue, Jan 14, 2025 at 3:24=E2=80=AFPM Simona Vetter <simona.vetter@ffwll.=
ch> wrote:
>
> Feels like trying to replicate docs in rust might be dangerous, because i=
f
> we have to keep really detailed and nuanced docs around in two places we
> will fail.
>
> Imo would be better to just explain how this maps to the C side and link
> to that for full docs? Or somehow include that, but then all the
> hyperlinks need to work from the C side kerneldoc or it's again
> incomplete.

Yeah, if things would be duplicated (in a way that does not add much
value, e.g. things that do not require linking to many Rust-side
things or does not use the examples KUnit support etc.), then I would
say it is best to do it in a single place.

To do that, we already support the `srctree/` links that can point to
files (and in rust.docs.kernel.org get rendered to git.kernel.org). To
point to rendered docs instead of files, for the time being the best
so far is to link to docs.kernel.org directly.

Then, what I proposed to upstream Rust is to have a feature that would
give us a way to have a bibliography/map of links that could be used
similarly to the existing intradoc-links in Rust docs. That way,
projects could write something like [`struct my_struct`] and you would
automatically get a link to the suitable URL to the C item, or
something like [`ref:interleaved_replies`] to get a link to the
Documentation/ rST reference and so on. It would also help to have
common links without having to repeat them everywhere. With that in
place, we could replace the docs.kernel.org links (though that
requires rendering the docs, and we heard from at least someone that
didn't want that at all...).

Then we can also work on the other direction somehow, e.g. sharing a
way to render docs properly for both C and Rust. I would like to work
on some of that after the build system stuff.

Cheers,
Miguel
