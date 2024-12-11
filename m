Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B0039EC784
	for <lists+dri-devel@lfdr.de>; Wed, 11 Dec 2024 09:43:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BF69D10E098;
	Wed, 11 Dec 2024 08:43:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; secure) header.d=ffwll.ch header.i=@ffwll.ch header.b="cLSVoR9c";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com
 [209.85.128.50])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4EF9810E098
 for <dri-devel@lists.freedesktop.org>; Wed, 11 Dec 2024 08:43:15 +0000 (UTC)
Received: by mail-wm1-f50.google.com with SMTP id
 5b1f17b1804b1-4361ecebc4dso1611025e9.0
 for <dri-devel@lists.freedesktop.org>; Wed, 11 Dec 2024 00:43:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google; t=1733906594; x=1734511394; darn=lists.freedesktop.org; 
 h=in-reply-to:content-disposition:mime-version:references
 :mail-followup-to:message-id:subject:cc:to:from:date:from:to:cc
 :subject:date:message-id:reply-to;
 bh=eDl8Jb1frNHxOgKdgBmezzKCSNHw67jaTRZ7H3Dd+tA=;
 b=cLSVoR9cHbWUCpfPWWvbzW3r30d1MhahscfvmFH2wlpanhsOeaUBGMqXjJLawzLcSq
 sxNOzokg7YiNlqEhZIP2VB90/3UbSvD5HJF362ZLgKtU0sMWHOlU5XwlgIIAPoI8Bsew
 ypuvk6976IF7hZAYX4uCmbaPodYG3pyKsXEXg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1733906594; x=1734511394;
 h=in-reply-to:content-disposition:mime-version:references
 :mail-followup-to:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=eDl8Jb1frNHxOgKdgBmezzKCSNHw67jaTRZ7H3Dd+tA=;
 b=hPPOFkMFKajs249Pojird7NtictbMe9KSsA9x3cQTPDKKc+pndw/75JmyrXorwKo1D
 6W6wXJOhijdPeoXQexQottlKYlfFWZVLoZ2ilLfsh/5nboTWBlr5LmU8YG2wuz/x1n0D
 o1xCG2RxZXZyAv84H6YSMbxmlkaaQyFsVI01b6m4Q/9ONcZ0gmNxUNspX+XHP+T3jCya
 XBcy01zEpD+zDfYT5BGyvpJNgKscWLzytsUm9bJkj2gKyYZ+vlaaB4oJM5HAAnWejhmE
 +YkpxSLEmHfHsk294nd3Atszf5gEe8jWcXZrr70O4rWRaHp04gCopobj196WoTBeRI2g
 3+Pw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXIAne1ubGKsZvkRDYx3gaBmAOVN143ASm6U5lXMwiZ6kT9pAAWk96HCbHzhsGUyUh2ARacxkf73gA=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyPuZ8FXYbGn1Xlz5UvU458C4zsZ1ngUQ1F/oFPOc4UxeYZPe8S
 5fD33X8qWyjrfMQcnsAdtcBjGNi0yYnTAbJUGYmn8Fii1jDmeOcd6kBINDHcD+8=
X-Gm-Gg: ASbGncvdD9HeHeVZw5dL0cyTv2svdS/kjeQrYpYIEu1SZsEYM/maK7oFi3ATF2nAQd1
 HF5+9c4SV3hUROQy4P/s/IItwFpTg9nUypmDwTIBmqQ9CV/lA+cult8P0sp/EPkfyGtOagbo3kP
 lhwpGQx+UHnyXe/eMxjsKKTyZenSxhuyIRkNMruE9F26ozgdeuo5H59VtdKfZZGG/Dh5IzLTyVl
 HRo3x6Ujb/rtA5ZWeZ50Y9JCgSJbbzZp/hQaL6QliLfyZXQ4COaGhK/4ZV+YZ/H1w==
X-Google-Smtp-Source: AGHT+IEC5s1ABwh+QmwDOLYC0yNnP/Duuq98w6DzbDd3sOm9WXsmU9pvk2PMVd0L51eFeLkr3RWVKw==
X-Received: by 2002:a05:600c:8718:b0:436:aaf:7eb9 with SMTP id
 5b1f17b1804b1-4361c429eaamr11213005e9.20.1733906593293; 
 Wed, 11 Dec 2024 00:43:13 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:5485:d4b2:c087:b497])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-434da119abbsm222094855e9.43.2024.12.11.00.43.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 11 Dec 2024 00:43:12 -0800 (PST)
Date: Wed, 11 Dec 2024 09:43:10 +0100
From: Simona Vetter <simona.vetter@ffwll.ch>
To: Lyude Paul <lyude@redhat.com>
Cc: Daniel Almeida <daniel.almeida@collabora.com>,
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
 open list <linux-kernel@vger.kernel.org>
Subject: Re: [WIP RFC v2 05/35] rust: drm/kms: Add bindings for drm_connector
Message-ID: <Z1lQnhKmH39C7Erl@phenom.ffwll.local>
Mail-Followup-To: Lyude Paul <lyude@redhat.com>,
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
 open list <linux-kernel@vger.kernel.org>
References: <20240930233257.1189730-1-lyude@redhat.com>
 <20240930233257.1189730-6-lyude@redhat.com>
 <02A84CFD-BE91-40E6-995C-4E81A8DAB92C@collabora.com>
 <7b57940a3987532963ce5fbd3a999665c17611ab.camel@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <7b57940a3987532963ce5fbd3a999665c17611ab.camel@redhat.com>
X-Operating-System: Linux phenom 6.11.6-amd64 
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

On Tue, Dec 10, 2024 at 06:41:52PM -0500, Lyude Paul wrote:
> On Tue, 2024-11-26 at 18:25 -0300, Daniel Almeida wrote:
> > Hi Lyude,
> > 
> > > On 30 Sep 2024, at 20:09, Lyude Paul <lyude@redhat.com> wrote:
> > > 
> > > +
> > > +impl<T: DriverConnector> Connector<T> {
> > > +    /// Construct a new [`Connector`].
> > > +    ///
> > > +    /// A driver may use this to create new [`Connector`] objects.
> > > +    ///
> > > +    /// TODO: Add a way to handle creating connectors after device registration. Also, that's why we
> > > +    /// don't ask for a UnregisteredKms device here.
> > 
> > Can you elaborate? We can try to help if you describe this a bit better :)
> 
> oh - totally forgot to respond to this!
> 
> So: out of all of the mode objects, Connectors are a bit special. They can
> actually be created and destroyed after registration (hence why they have a
> refcount). This is not terribly difficult to handle before registration, the
> complication comes after registration - where we'll likely need to split
> Connector into two different types:
> 
> UnregisteredConnector
> 
> Connector
> 
> Where you have to sacrifice the UnregisteredConnector to get to the Connector
> object. I don't think this will actually be too difficult to implement, I just
> didn't get around to it yet because there were so many other open questions I
> had about the design here in general.

For connnnector lifetime fun please also see Imre's patches for fixing
some races around mst hotplug. At least on the C side I think we will
split connectors into dynamic and static ones, to be able to handle things
correctly. It's a bit a mess unfortuantely.
-Sima
-- 
Simona Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
