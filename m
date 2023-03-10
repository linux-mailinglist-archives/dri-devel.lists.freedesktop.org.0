Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7BD026B5067
	for <lists+dri-devel@lfdr.de>; Fri, 10 Mar 2023 19:57:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CCF0E10E31C;
	Fri, 10 Mar 2023 18:57:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-x82a.google.com (mail-qt1-x82a.google.com
 [IPv6:2607:f8b0:4864:20::82a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2D5D410E31C
 for <dri-devel@lists.freedesktop.org>; Fri, 10 Mar 2023 18:57:40 +0000 (UTC)
Received: by mail-qt1-x82a.google.com with SMTP id r16so6825513qtx.9
 for <dri-devel@lists.freedesktop.org>; Fri, 10 Mar 2023 10:57:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112; t=1678474659;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:feedback-id:from:to:cc:subject:date
 :message-id:reply-to;
 bh=iYsCaNsSgngNKZcdLQcf6Ufpk9ToxZLFdwVZ9rpQa4I=;
 b=X08bB+yklbWwlcTtt2aeNgmaxess2TPKnELiAEk9OTqJPHuz+3/M9Tmq+KpCSIfM0f
 jD0APM2OhnjVRgXxux5Jran0ExHQPN0mQlneMTl6sIrkmKBwNPbgnNqDlrZ0e9vmTRda
 vjNSQQJBQJ+r7zirpHMIeDU/udZbkxHbku0star9P0mSAMUORFbrWFRMAJcJzUAcYotm
 Uti2604Hf+UKs07gy9+nPPywgNaEIbCrcDdotdF7kCvsZH9Eapmykh+3okNVcDPNrDdi
 OD9nWY2u/J4phmSp18O6CqUa5+TewrEkVAjwF7LWgvHms4ak00DKbbJpNhxXOO7NCOM/
 XZmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678474659;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:feedback-id:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=iYsCaNsSgngNKZcdLQcf6Ufpk9ToxZLFdwVZ9rpQa4I=;
 b=Y0KzVDmVU0AozdO4QIKs6pNJBNYchNT47hamw5YqeSVF+UeIqRIVi1sWW19zmoUjn4
 jRgKH+7NomqNztOjM86Ytpu/0tmdpUHxlWVKoGgzD6zKXUsisDo7eaKQ1qjRZTr7AnL9
 I4VTD0TZITViYO+qhPUJCznAp1MyEqkCwX66FQojvAhFzyH0onCgVATWS8+87ricKDZ8
 YxnRQ/qJTjZyHvPB+vSP16xP0yRU36tW7d546YIb70fnjpeagTp6JXEFdUpUXfWOMpVw
 HTsrldpLjjwgYRdZHnh3ETnPl34tNl0MaSGrsx3Sf5lyM5KPXaeqovvGeaSkWP7wol8Z
 1xug==
X-Gm-Message-State: AO0yUKVhte4ax+lb8Ff86jPN3NN+tJ1Zt+PxMy6PI5h1ZuoQrc84BE6D
 AsuJ3tVaNAIYWM+nQwgz8xE=
X-Google-Smtp-Source: AK7set+4zSWuXwAS3gf17d063Xj+Ph3v0EPqWJGTs3qx7Dqyh0WAYgbNyBItJeOyToWCKILdkt9WAA==
X-Received: by 2002:ac8:5e4a:0:b0:3b8:2ea9:a09c with SMTP id
 i10-20020ac85e4a000000b003b82ea9a09cmr11028163qtx.1.1678474659251; 
 Fri, 10 Mar 2023 10:57:39 -0800 (PST)
Received: from auth1-smtp.messagingengine.com (auth1-smtp.messagingengine.com.
 [66.111.4.227]) by smtp.gmail.com with ESMTPSA id
 a8-20020aed2788000000b003b62e8b77e7sm342021qtd.68.2023.03.10.10.57.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 10 Mar 2023 10:57:38 -0800 (PST)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailauth.nyi.internal (Postfix) with ESMTP id BD05F27C0054;
 Fri, 10 Mar 2023 13:57:37 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute4.internal (MEProxy); Fri, 10 Mar 2023 13:57:37 -0500
X-ME-Sender: <xms:oH0LZKRLdsP7S-ODRUr5NQxPKLRM043tk4HBpFPML5ny56aOMc1WKA>
 <xme:oH0LZPyoebzZatMZAuu6P_73GVuEHtNN69KxZr64O2-UPfZdk1ohaIHA1YNTOmA_r
 KAkwArw5YzolSql6g>
X-ME-Received: <xmr:oH0LZH2zT9VTIey8ILSfvM1iTiewrf9ia19JsONvub11ZyqXtExdx7oEEi8>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrvddukedguddujecutefuodetggdotefrod
 ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
 necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
 enucfjughrpeffhffvvefukfhfgggtuggjsehttdertddttddvnecuhfhrohhmpeeuohhq
 uhhnucfhvghnghcuoegsohhquhhnrdhfvghnghesghhmrghilhdrtghomheqnecuggftrf
 grthhtvghrnhepfeduvddvleeigeeugfevffdvffduieeujeeivdduhfeljeeghfegffev
 fffhkeffnecuffhomhgrihhnpehpthhrrdguvghvnecuvehluhhsthgvrhfuihiivgeptd
 enucfrrghrrghmpehmrghilhhfrhhomhepsghoqhhunhdomhgvshhmthhprghuthhhphgv
 rhhsohhnrghlihhthidqieelvdeghedtieegqddujeejkeehheehvddqsghoqhhunhdrfh
 gvnhhgpeepghhmrghilhdrtghomhesfhhigihmvgdrnhgrmhgv
X-ME-Proxy: <xmx:oH0LZGAmUZAA0WaAkOpaN91r1NTQfHex41rDqaXOgp7XltObtE-y4Q>
 <xmx:oH0LZDhbyzfoZ9B-1L4Zs_Qb4Brv9uR5ds8IbGPyn9TAqabJ4deWLw>
 <xmx:oH0LZCrDEJ4ut9DJmmL9U5wz_K5XqnyQlUZYnc_Ay2xgLVJ4PQ1cMQ>
 <xmx:oX0LZPDMVZoKkaOWLRxjIng7KbgqOLDTOoYJ_0CZLCFD9tpM_5bBfg>
Feedback-ID: iad51458e:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 10 Mar 2023 13:57:36 -0500 (EST)
Date: Fri, 10 Mar 2023 10:56:31 -0800
From: Boqun Feng <boqun.feng@gmail.com>
To: Asahi Lina <lina@asahilina.net>
Subject: Re: [PATCH RFC 02/18] rust: drm: Add Device and Driver abstractions
Message-ID: <ZAt9X8qDUHQ/YnW8@boqun-archlinux>
References: <20230307-rust-drm-v1-0-917ff5bc80a8@asahilina.net>
 <20230307-rust-drm-v1-2-917ff5bc80a8@asahilina.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230307-rust-drm-v1-2-917ff5bc80a8@asahilina.net>
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
Cc: Karol Herbst <kherbst@redhat.com>,
 Dave Hansen <dave.hansen@linux.intel.com>, dri-devel@lists.freedesktop.org,
 Mary <mary@mary.zone>, Gary Guo <gary@garyguo.net>,
 Ella Stanforth <ella@iglunix.org>, Sumit Semwal <sumit.semwal@linaro.org>,
 Alyssa Rosenzweig <alyssa@rosenzweig.io>, Luben Tuikov <luben.tuikov@amd.com>,
 Alex Gaynor <alex.gaynor@gmail.com>, Miguel Ojeda <ojeda@kernel.org>,
 linux-media@vger.kernel.org, Wedson Almeida Filho <wedsonaf@gmail.com>,
 rust-for-linux@vger.kernel.org,
 =?iso-8859-1?Q?Bj=F6rn?= Roy Baron <bjorn3_gh@protonmail.com>,
 Faith Ekstrand <faith.ekstrand@collabora.com>, linux-sgx@vger.kernel.org,
 linaro-mm-sig@lists.linaro.org, linux-kernel@vger.kernel.org,
 Jarkko Sakkinen <jarkko@kernel.org>, asahi@lists.linux.dev,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Mar 07, 2023 at 11:25:27PM +0900, Asahi Lina wrote:
[...]
> +
> +// SAFETY: `Device` only holds a pointer to a C device, which is safe to be used from any thread.
> +unsafe impl<T: drm::drv::Driver> Send for Device<T> {}
> +
> +// SAFETY: `Device` only holds a pointer to a C device, references to which are safe to be used
> +// from any thread.
> +unsafe impl<T: drm::drv::Driver> Sync for Device<T> {}
> +

Here is the mind model I use to check whether a type is `Send` or
`Sync`

*	If an object of a type can be created on one thread and dropped
	on the another thread, then it's `Send`.

*	If multiple threads can call the immutable functions (i.e.
	functions with `&self`) of the same object of a type, then the
	it's `Sync`.

Maybe it's incomplete, but at least I find it useful to determine
whether a type is `Send` or `Sync`: it's not just the struct
representation, the behaviors (functions) of the struct also matter.

If that looks reasonable to you, maybe update the "SAFETY" comments in
the future version? Thanks ;-)

(I know you brought this up in the meeting, sorry I guess I wasn't fully
woken when answering you ;-))

Regards,
Boqun

> +// Make drm::Device work for dev_info!() and friends
> +unsafe impl<T: drm::drv::Driver> device::RawDevice for Device<T> {
> +    fn raw_device(&self) -> *mut bindings::device {
> +        // SAFETY: ptr must be valid per the type invariant
> +        unsafe { (*self.ptr).dev }
> +    }
> +}
[...]
