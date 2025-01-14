Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A974EA10B08
	for <lists+dri-devel@lfdr.de>; Tue, 14 Jan 2025 16:38:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4AE2D10E087;
	Tue, 14 Jan 2025 15:38:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; secure) header.d=ffwll.ch header.i=@ffwll.ch header.b="eRvVhma+";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x629.google.com (mail-ej1-x629.google.com
 [IPv6:2a00:1450:4864:20::629])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CD8AF10E087
 for <dri-devel@lists.freedesktop.org>; Tue, 14 Jan 2025 15:38:50 +0000 (UTC)
Received: by mail-ej1-x629.google.com with SMTP id
 a640c23a62f3a-a9e44654ae3so906730466b.1
 for <dri-devel@lists.freedesktop.org>; Tue, 14 Jan 2025 07:38:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google; t=1736869129; x=1737473929; darn=lists.freedesktop.org; 
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:mail-followup-to:message-id:subject:cc:to
 :from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=ODMaixCykybFpyXfXOh5SU/u+pXNOEmZVe97XLIWj0s=;
 b=eRvVhma+MK7MUzrXd+5gFVOf6/Xz2AnsNUHo6L2YkCl5TIfgsLd7XzDKrhnCuuUwRV
 DhNe9+zcVX6uUnCXONqQUzZLQ1yk25a5q5S0gEltc78T1G9dNMcyY9YqS6KEKB6KyIux
 2Fm5mQwSa2/hxLiWaT6m37CjXHEGV4uk7Hqds=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1736869129; x=1737473929;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:mail-followup-to:message-id:subject:cc:to
 :from:date:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=ODMaixCykybFpyXfXOh5SU/u+pXNOEmZVe97XLIWj0s=;
 b=wS9zecPLogN2VUtLj1IRAbap2Csvxp/qCK4WxFhVRfEq/VysHJPJnqgsIJiN4Eg8Mj
 GAbpsxtpIAdtfpbtY9lWOuEAfMg/apA83UZ1H93liHLp3IxrFm2eDUcnzzBZwJ0udm8Y
 txT0/YnwdTFbr4rFZQiisOIir+Qpk6xImxNcFdqB/9jQ/bNrEdWJSjnMBhLRs3zo03UX
 GxZNZ6na7bdmmD6irLcRhMe5OZ/I0+2JSQ2R0Aa2nmTBHtNLGh3Xs4LdYbwU+oLkAbqb
 2xyWN4hYy/BQFlf+H45RrEvXZOAJkU/vHWgq9THsb3/Fd2PMEQx9l626J1ZOCdTyLf+3
 gcGA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVZX7ldBOrTRKErBNZVW+Xoahc9TuwD6akbt4cL8+g2zg5WGvPUSu66rjvp5tpQgyyurjid8MrETYI=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yz1BdNprhwWodXwTsprVZRJGzWYCsvRxaTUQVH9OjQQGOPf/EAk
 Vbo6L6FZZ3WEqrda8CFc4V4gXYhY5Eufr09CtqF+SGj+A0LXhklZhTr65tmB+yU=
X-Gm-Gg: ASbGnctIrc83f9x/cVF2aUPWQeKr304VV+bzbFdUU34l8bbVd32TiV+nSr5yH3kLPpQ
 gRM4pumULTFordnr77r6aZLzBOZfvFqGf0l+Cp7AAUIPQcIQIQzPsy+EAD89peIC/N+8FodmuMA
 EdHFMuYv9DvT1hMsoaswSPWKiEIKPNZILXzwHFHpRgXeMSF0yzgeJtUkkG4pznGclMsJ7ZrQ1k/
 Gm5lCPzBtHV3h4Am6e8SaiCryvEdj/N5GC3v+6jpVX9lE5w00ofbvMuQlMt3ZI3CtI5
X-Google-Smtp-Source: AGHT+IFKC0qtMfswjkUHdUbLXJ8Fzz/7FK60lz5r/sV1+p/qljFpLildKmIql5dlVsd79+eSBlA+SA==
X-Received: by 2002:a17:907:3e9f:b0:aae:bd4c:22c0 with SMTP id
 a640c23a62f3a-ab2ab70aeccmr2271121566b.19.1736869129214; 
 Tue, 14 Jan 2025 07:38:49 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:5485:d4b2:c087:b497])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-ab2c905cd8asm641773166b.7.2025.01.14.07.38.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 14 Jan 2025 07:38:48 -0800 (PST)
Date: Tue, 14 Jan 2025 16:38:46 +0100
From: Simona Vetter <simona.vetter@ffwll.ch>
To: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Cc: Lyude Paul <lyude@redhat.com>,
 Daniel Almeida <daniel.almeida@collabora.com>,
 dri-devel@lists.freedesktop.org, rust-for-linux@vger.kernel.org,
 Asahi Lina <lina@asahilina.net>, Danilo Krummrich <dakr@kernel.org>,
 mcanal@igalia.com, airlied@redhat.com, zhiw@nvidia.com,
 cjia@nvidia.com, jhubbard@nvidia.com, Miguel Ojeda <ojeda@kernel.org>,
 Alex Gaynor <alex.gaynor@gmail.com>,
 Wedson Almeida Filho <wedsonaf@gmail.com>,
 Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
 =?iso-8859-1?Q?Bj=F6rn?= Roy Baron <bjorn3_gh@protonmail.com>,
 Benno Lossin <benno.lossin@proton.me>,
 Andreas Hindborg <a.hindborg@samsung.com>,
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
 Danilo Krummrich <dakr@redhat.com>,
 Mika Westerberg <mika.westerberg@linux.intel.com>,
 open list <linux-kernel@vger.kernel.org>
Subject: Re: [WIP RFC v2 33/35] WIP: rust: drm/kms: Add VblankSupport
Message-ID: <Z4aFBhzyBrq48aib@phenom.ffwll.local>
Mail-Followup-To: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>,
 Lyude Paul <lyude@redhat.com>,
 Daniel Almeida <daniel.almeida@collabora.com>,
 dri-devel@lists.freedesktop.org, rust-for-linux@vger.kernel.org,
 Asahi Lina <lina@asahilina.net>, Danilo Krummrich <dakr@kernel.org>,
 mcanal@igalia.com, airlied@redhat.com, zhiw@nvidia.com,
 cjia@nvidia.com, jhubbard@nvidia.com,
 Miguel Ojeda <ojeda@kernel.org>,
 Alex Gaynor <alex.gaynor@gmail.com>,
 Wedson Almeida Filho <wedsonaf@gmail.com>,
 Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
 =?iso-8859-1?Q?Bj=F6rn?= Roy Baron <bjorn3_gh@protonmail.com>,
 Benno Lossin <benno.lossin@proton.me>,
 Andreas Hindborg <a.hindborg@samsung.com>,
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
 Danilo Krummrich <dakr@redhat.com>,
 Mika Westerberg <mika.westerberg@linux.intel.com>,
 open list <linux-kernel@vger.kernel.org>
References: <20240930233257.1189730-1-lyude@redhat.com>
 <20240930233257.1189730-34-lyude@redhat.com>
 <FD0FB134-5FFD-419A-9B66-85ED2EB6554A@collabora.com>
 <d35e7f02b1d123fad8d4aefa494d0e83424c6e96.camel@redhat.com>
 <Z4ZzkBDCryk-NKPg@phenom.ffwll.local>
 <CANiq72=M3=0rcTfQS9Gch8NeNyrpXb91t-z-gDBSDO8V-Bh5gQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CANiq72=M3=0rcTfQS9Gch8NeNyrpXb91t-z-gDBSDO8V-Bh5gQ@mail.gmail.com>
X-Operating-System: Linux phenom 6.12.3-amd64 
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

On Tue, Jan 14, 2025 at 04:04:41PM +0100, Miguel Ojeda wrote:
> On Tue, Jan 14, 2025 at 3:24 PM Simona Vetter <simona.vetter@ffwll.ch> wrote:
> >
> > Feels like trying to replicate docs in rust might be dangerous, because if
> > we have to keep really detailed and nuanced docs around in two places we
> > will fail.
> >
> > Imo would be better to just explain how this maps to the C side and link
> > to that for full docs? Or somehow include that, but then all the
> > hyperlinks need to work from the C side kerneldoc or it's again
> > incomplete.
> 
> Yeah, if things would be duplicated (in a way that does not add much
> value, e.g. things that do not require linking to many Rust-side
> things or does not use the examples KUnit support etc.), then I would
> say it is best to do it in a single place.
> 
> To do that, we already support the `srctree/` links that can point to
> files (and in rust.docs.kernel.org get rendered to git.kernel.org). To
> point to rendered docs instead of files, for the time being the best
> so far is to link to docs.kernel.org directly.
> 
> Then, what I proposed to upstream Rust is to have a feature that would
> give us a way to have a bibliography/map of links that could be used
> similarly to the existing intradoc-links in Rust docs. That way,
> projects could write something like [`struct my_struct`] and you would
> automatically get a link to the suitable URL to the C item, or
> something like [`ref:interleaved_replies`] to get a link to the
> Documentation/ rST reference and so on. It would also help to have
> common links without having to repeat them everywhere. With that in
> place, we could replace the docs.kernel.org links (though that
> requires rendering the docs, and we heard from at least someone that
> didn't want that at all...).

Yeah I think something like [`struct my_struct`] in the rust doc to link
to the C side would be best. Dropping full url is kinda nasty, because it
also makes navigating the source code itself harder. And I fairly often
read the kerneldoc in the sources itself, not the rendered form. But
that's maybe more a developer/maintainer use-case, since generally when I
read docs it's to make sure they still match the code, so best when that's
all close together.

> Then we can also work on the other direction somehow, e.g. sharing a
> way to render docs properly for both C and Rust. I would like to work
> on some of that after the build system stuff.

Hm I guess the other direction might apply for when we implement helpers
in rust that C drivers are expected to use, like the qr code generator we
now have. I think at least medium term most of our referencing needs will
go from rustdoc to kerneldoc though, and not the other direction.
-Sima
-- 
Simona Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
