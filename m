Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 545DA9EAE16
	for <lists+dri-devel@lfdr.de>; Tue, 10 Dec 2024 11:36:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1D07410E00F;
	Tue, 10 Dec 2024 10:36:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; secure) header.d=ffwll.ch header.i=@ffwll.ch header.b="HMYUdptK";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com
 [209.85.128.50])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B942510E00F
 for <dri-devel@lists.freedesktop.org>; Tue, 10 Dec 2024 10:36:32 +0000 (UTC)
Received: by mail-wm1-f50.google.com with SMTP id
 5b1f17b1804b1-434a736518eso59136405e9.1
 for <dri-devel@lists.freedesktop.org>; Tue, 10 Dec 2024 02:36:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google; t=1733826991; x=1734431791; darn=lists.freedesktop.org; 
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:mail-followup-to:message-id:subject:cc:to
 :from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=Sen+IiZX0S+/F0Se18eMG9OtCzCvDpM+sc9hXCEuRWM=;
 b=HMYUdptK6pGGm4sM9/rn3sMP7W8o0Be2HusieBUn3MGvHh4LeLTOjxvScFLQCmC2Gi
 Go0/Ed2KAPLKeokCqz4kriBjxlpC+3iNI1xLfQ0El/JZZQS9u7TUM7s2boZsO6FRlowf
 OsPzUGA60SB/tU66/yMD8GRICXsjepf6o1hG4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1733826991; x=1734431791;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:mail-followup-to:message-id:subject:cc:to
 :from:date:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Sen+IiZX0S+/F0Se18eMG9OtCzCvDpM+sc9hXCEuRWM=;
 b=gD+liVPsk5wCxKkZaMdH410qFWHCfDUYmZ6cAeXtx6xEFZit8eTh8FgOiuZcbXErD4
 q8/WiWjtzzH45yd5kMJ145h33mzUZAx6q4RuhHwkrNZ9Osz3I6+scoSNT9JGtKKmJe9u
 ++wVU6gILKqVy+zWaFUENCsgVFkXadYTOqmMb3WPW7zYZ+Y/JB/ys5KL46kcUs2A2hA5
 nW7Pu+tY5U/liO5Y9HZmKnk6cUg+/FU2DRAPTAi+raKEbjjyzyXGItQ1aCtKhD8BrqgB
 /JMY7YRxcKI4PoaoB7R5T4jFomTrUliQgeoU6yzRevKvuXEeMtg7JqOJqFAnoWfLlRiS
 B9TQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWYJBpMN83emw9H2nxbAvgzk/fXsouQZ4zkMEGQFiJezKp/96Lg8DiV2nrSQ+oCBXWcNFpTcn8BWDY=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwWNcPcqsVAGA1FxYQt7602wxwhL2zKEMuJ4H/P1nJx7P9ytnKr
 hUupDMZpHMcmwqA54JOEL+g8fb5tUcCy6exeLkcrRNC2xZbJEvxjJZ4oNb9ux88=
X-Gm-Gg: ASbGncvzNacwwl+WpGzEJMz8+wbjNi12BQVLXej/u5eRNNEYSc1jpxumepmBldHxzN1
 at5MCFpucGNDhhyJ2JVb8sGRYFEeg9WlDkUrfFqmtCGfy6TIrbyPYFomGWmRDA0VoWoyVgNkUZ0
 AiiGBtcTyXNo4eWoHDSeewbdi2iZq7NxB0IBgcMEbfTQCz0eZyl2sSoa+DZH8BeUPDJFCzh0jPp
 o8Ff+gAounDiU0gx0cdsVVDapkiZEay2B7rCC9VYyfvbxt0VKSw0tkvzXH0x6fE/w==
X-Google-Smtp-Source: AGHT+IEV+bbBMZpk2sUNI7COIVamkfzNEBliCeF2KWN5595ZWc//07H+LLjAmbUId5CayTY1JHx5Ag==
X-Received: by 2002:a05:600c:3b99:b0:434:a781:f5d9 with SMTP id
 5b1f17b1804b1-434fff41467mr37221575e9.11.1733826990767; 
 Tue, 10 Dec 2024 02:36:30 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:5485:d4b2:c087:b497])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-38621fbbc08sm15782423f8f.86.2024.12.10.02.36.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 10 Dec 2024 02:36:30 -0800 (PST)
Date: Tue, 10 Dec 2024 11:36:28 +0100
From: Simona Vetter <simona.vetter@ffwll.ch>
To: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Cc: Jocelyn Falempe <jfalempe@redhat.com>, Miguel Ojeda <ojeda@kernel.org>,
 Alex Gaynor <alex.gaynor@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
 =?iso-8859-1?Q?Bj=F6rn?= Roy Baron <bjorn3_gh@protonmail.com>,
 Benno Lossin <benno.lossin@proton.me>,
 Andreas Hindborg <a.hindborg@kernel.org>,
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
 rust-for-linux@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, patches@lists.linux.dev,
 stable@vger.kernel.org
Subject: Re: [PATCH] drm/panic: remove spurious empty line to clean warning
Message-ID: <Z1gZrEbqzbf01WhE@phenom.ffwll.local>
Mail-Followup-To: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>,
 Jocelyn Falempe <jfalempe@redhat.com>,
 Miguel Ojeda <ojeda@kernel.org>,
 Alex Gaynor <alex.gaynor@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
 =?iso-8859-1?Q?Bj=F6rn?= Roy Baron <bjorn3_gh@protonmail.com>,
 Benno Lossin <benno.lossin@proton.me>,
 Andreas Hindborg <a.hindborg@kernel.org>,
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
 rust-for-linux@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, patches@lists.linux.dev,
 stable@vger.kernel.org
References: <20241125233332.697497-1-ojeda@kernel.org>
 <fe2a253c-4b2f-4cb3-b58d-66192044555f@redhat.com>
 <CANiq72=PB=r5UV_ekNGV+yewa7tHic8Gs9RTQo=YcB-Lu_nzNQ@mail.gmail.com>
 <e544c1c7-8b00-46d4-8d13-1303fd88dca3@redhat.com>
 <CANiq72m_b4y6bJJ6sB5gUe+rpa51FXtwpwENQy3zGGMtuFJ3Xg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CANiq72m_b4y6bJJ6sB5gUe+rpa51FXtwpwENQy3zGGMtuFJ3Xg@mail.gmail.com>
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

On Tue, Dec 10, 2024 at 12:10:31AM +0100, Miguel Ojeda wrote:
> On Tue, Dec 10, 2024 at 12:05 AM Jocelyn Falempe <jfalempe@redhat.com> wrote:
> >
> > You can merge it through rust-fixes. I have another patch [1] under
> > review that touches this file, but it shouldn't conflict, as the changes
> > are far from this line.
> 
> Sounds good, thanks! (But of course please feel free to merge fixes through DRM)

Yeah I think once rust lands in drm the patches should land through drm
trees, or we'll have a bit of a mess. Of course with rust expert
reviews/acks where needed.
-Sima

> > How do you test clippy, so I can check I won't introduce another warning
> > with this series?
> 
> With `CLIPPY=1`, please see:
> 
>     https://docs.kernel.org/rust/general-information.html#extra-lints
> 
> Cheers,
> Miguel

-- 
Simona Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
