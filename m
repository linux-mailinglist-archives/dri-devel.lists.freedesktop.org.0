Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id EMvqDJJIhWkN/QMAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Fri, 06 Feb 2026 02:49:06 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D4AE2F9107
	for <lists+dri-devel@lfdr.de>; Fri, 06 Feb 2026 02:49:05 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 484A310E235;
	Fri,  6 Feb 2026 01:49:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="FOGyYXNo";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-f171.google.com (mail-qk1-f171.google.com
 [209.85.222.171])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 347A410E232
 for <dri-devel@lists.freedesktop.org>; Fri,  6 Feb 2026 01:48:59 +0000 (UTC)
Received: by mail-qk1-f171.google.com with SMTP id
 af79cd13be357-8ca3807494eso107870985a.2
 for <dri-devel@lists.freedesktop.org>; Thu, 05 Feb 2026 17:48:59 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1770342538; cv=none;
 d=google.com; s=arc-20240605;
 b=bIhE8yGMo8EsNmI7UgcmNvc6iL4KuiEi0ZbuAVkDVB9EUGpmzFEPzdC3a/5I7MKwPT
 Rs5A+/dS/fpYjWG1jl9gw5ENmczusc39t3PTsXLy0k+kFuw1U6lj9/hKiHmg+5CycwaW
 X7ZyFoGZC1QaLKHGvlbmu32aNdLHCzJrfjjCGABblbzUxv6tBBF4TDMAPA1UkChHC5xP
 uypknwG9S12emSGVA3JINvxk9aGLpLsGFT56IiFpzsiFNWcIpDaXzxpuZ6Lpr4jn/tV4
 5fFRywoNJPgIoJI0aBeDiCfRnR3UTWtqI/xBVJgoVVGNq4eYrh2Mol/upkBw/9oXX8WO
 TEdQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:dkim-signature;
 bh=qp2Y2OYYUKPukWWko+9fCBsOvav98ZHz2x3RlIJSAHU=;
 fh=RmkAcDweKDb4NRDqz2vYIPY+Mbxe7U41KTdqpI/JW/Y=;
 b=S6lStDNnQ24IgIxlC789QPmMqOBBLiGG3rhKkPJ+h0dssFwK0UpkKsnmo129QcTd8z
 M9eaTfvCVqYTXiSnxtQrdmCWaR8zbTZt5+gdm12T6qBlEy5ult4nwfnFsT4QAGbnZQtc
 X4UxnOUsKT7veTVITJubQTqOv2005YnHf3OxSKUJJ/ROkPXS24qF+MuU0SvzHeNVjP1h
 b2zyEsV/rHfCGD/mrsP9z1wBBR+5zhWiDNubFepQeBiWKc6cbMVtXjOzHV7go50OtRyj
 +YpgsUrufprml1jANgpLYbWNfZe0CnO8TrZw9SWmSaePtc5egoUEW++EDm+lu7ZmoNeP
 TYOw==; darn=lists.freedesktop.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1770342538; x=1770947338; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=qp2Y2OYYUKPukWWko+9fCBsOvav98ZHz2x3RlIJSAHU=;
 b=FOGyYXNo3zdhE8TI2jZvS3WKO9tc0UOjwoHxA44fr3olnCUVAYjEt1s2Ijbcy9CmL2
 GFElgEB2Fr1AculDojwKTWUEFc2SOluzkosXBVs5mkwjPnE6h1z+NjkS0BYdU6n0AP9K
 +kzW+eVfatMIQNNNLNKd0sR5zpRzn+kY4CiUWEMgJIIz7bRi66pWAUmwKWErbxV0tNXl
 LKRSkp5cc2RO3Y1iy2cE+I7Ap40WKPBpD7xjqn9KMdGd1qhpZFMuSg51MrkyBDdjxZNj
 IEqfGOG6bZvOQWFId6fvab6/HojTvcCF2jsgSsYt0j9WgxiK90GEuC9HtvLCR8NO/sbf
 vOVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1770342538; x=1770947338;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=qp2Y2OYYUKPukWWko+9fCBsOvav98ZHz2x3RlIJSAHU=;
 b=OOfrdwXXKg7j6X9RheSroNDbGQJmo98iIxIjxsws8pcUJoac6CXCuoy+jQ2hPOChhD
 4cEDkleOI9IdCixQy2zZK9BVpmbSVVhsl31yWJYq3C10ezDfaclkJsT4n+CTvvm8Urvw
 ZmHcSSI7kKPJ6NWNxirwxC1gn2HnHYzYi2MaUJ1aFQfCw6T31Kcdbmo0DD1uGXIYbonx
 nAZolE0QLgzCDnZEsKsE9pJsiDh8C8NMR7mbHLO2D6rKJ5hz7xExgNwvOnFRhgKwxG1j
 Omi+I73TLYDu4TNGRpYgeIwe66af8tJlvgJzI839UAVptx3rJfR14THjCJ7oHz4SCsgp
 waoA==
X-Forwarded-Encrypted: i=1;
 AJvYcCX6bgeeBaP3I/9gYTQ81F7su5W71wi6b3u40d49cIv5pZ9sp7QYZR1pyNfGa8fp/6T7ucc+5VpCEmo=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyBegbW5uXOSIczyVRbvCVObpvWJC2DV1ICwzsMqYdbMdERnXtS
 AyUv0+DlPvpUk0G7Ar7BE9kaFQt3GXzJSqktySaqbPE0gGqhl8nj2gQcakTP38MVRU23q83thDR
 JeOCeHw0BLCP6LT9g0ZaXxA8MhihTEt0=
X-Gm-Gg: AZuq6aIj825NBhydMMSeW5tCAYg3ez7MxdaP0MqDCLFf9NGDTI6+pGE6bPq1krMERKu
 hkp3+ROB9I6u1w8V448OLOiUDXcDGVm6o+nHb8m6x39oKVhH+s9Pa3S5PSKaezNQN+qBrltPoeb
 cWdwkP8qi7JbOIXknJfaxeJr+PFw9udl4XUNOSayheRHqkMRVuGuezkDZ/iFV+eeoVBfRl58ASZ
 v5nbwiY8WnAirxIKe8Y7UG+7kBcbOQ2jP26zXUjPNKe5PNp+frKC1nafmklmyPJRQs0VqXvhdu7
 9eJF3rkYeCkGorXLgkynI/jKLkMTkeTMmsmoe0Z80FyBrF61Co6ldFI=
X-Received: by 2002:a05:620a:470d:b0:8ca:123e:8194 with SMTP id
 af79cd13be357-8caef409c65mr147454885a.33.1770342537850; Thu, 05 Feb 2026
 17:48:57 -0800 (PST)
MIME-Version: 1.0
References: <20260206003451.1914130-1-joelagnelf@nvidia.com>
 <06ff773a-06bf-4d60-bd0a-75a0359ce41c@nvidia.com>
In-Reply-To: <06ff773a-06bf-4d60-bd0a-75a0359ce41c@nvidia.com>
From: Dave Airlie <airlied@gmail.com>
Date: Fri, 6 Feb 2026 11:48:46 +1000
X-Gm-Features: AZwV_QiCn6zHej5_Mme9jV7jp01t4GcOY8De2NKm9jmAO6FZQzlBgU_JLG2YX-I
Message-ID: <CAPM=9tw=jzQxGvVrsUSv14RxQtnaw2rH6K2b3Gxh_UUHnOGTkA@mail.gmail.com>
Subject: Re: [PATCH -next] gpu: Move DRM buddy allocator one level up
To: Joel Fernandes <joelagnelf@nvidia.com>
Cc: linux-kernel@vger.kernel.org, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, Simona Vetter <simona@ffwll.ch>,
 Jonathan Corbet <corbet@lwn.net>, 
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
 Jani Nikula <jani.nikula@linux.intel.com>, 
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, 
 Tvrtko Ursulin <tursulin@ursulin.net>, Huang Rui <ray.huang@amd.com>, 
 Matthew Auld <matthew.auld@intel.com>, Matthew Brost <matthew.brost@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>, 
 =?UTF-8?Q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>, 
 Helge Deller <deller@gmx.de>, Danilo Krummrich <dakr@kernel.org>,
 Alice Ryhl <aliceryhl@google.com>, 
 Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
 Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
 =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
 Trevor Gross <tmgross@umich.edu>, John Hubbard <jhubbard@nvidia.com>, 
 Alistair Popple <apopple@nvidia.com>, Timur Tabi <ttabi@nvidia.com>,
 Edwin Peer <epeer@nvidia.com>, 
 Alexandre Courbot <acourbot@nvidia.com>, Andrea Righi <arighi@nvidia.com>, 
 Andy Ritger <aritger@nvidia.com>, Zhi Wang <zhiw@nvidia.com>,
 Alexey Ivanov <alexeyi@nvidia.com>, 
 Balbir Singh <balbirs@nvidia.com>, Philipp Stanner <phasta@kernel.org>, 
 Elle Rhumsaa <elle@weathered-steel.dev>,
 Daniel Almeida <daniel.almeida@collabora.com>, 
 joel@joelfernandes.org, nouveau@lists.freedesktop.org, 
 dri-devel@lists.freedesktop.org, rust-for-linux@vger.kernel.org, 
 linux-doc@vger.kernel.org, amd-gfx@lists.freedesktop.org, 
 intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org, 
 linux-fbdev@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
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
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.81 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[google.com:s=arc-20240605:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[airlied@gmail.com,dri-devel-bounces@lists.freedesktop.org];
	RCVD_COUNT_THREE(0.00)[3];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FREEMAIL_CC(0.00)[vger.kernel.org,linux.intel.com,kernel.org,suse.de,ffwll.ch,lwn.net,amd.com,intel.com,ursulin.net,gmx.de,google.com,gmail.com,garyguo.net,protonmail.com,umich.edu,nvidia.com,weathered-steel.dev,collabora.com,joelfernandes.org,lists.freedesktop.org];
	FORGED_RECIPIENTS(0.00)[m:joelagnelf@nvidia.com,m:linux-kernel@vger.kernel.org,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:tzimmermann@suse.de,m:simona@ffwll.ch,m:corbet@lwn.net,m:alexander.deucher@amd.com,m:christian.koenig@amd.com,m:jani.nikula@linux.intel.com,m:joonas.lahtinen@linux.intel.com,m:rodrigo.vivi@intel.com,m:tursulin@ursulin.net,m:ray.huang@amd.com,m:matthew.auld@intel.com,m:matthew.brost@intel.com,m:lucas.demarchi@intel.com,m:thomas.hellstrom@linux.intel.com,m:deller@gmx.de,m:dakr@kernel.org,m:aliceryhl@google.com,m:ojeda@kernel.org,m:alex.gaynor@gmail.com,m:boqun.feng@gmail.com,m:gary@garyguo.net,m:bjorn3_gh@protonmail.com,m:lossin@kernel.org,m:a.hindborg@kernel.org,m:tmgross@umich.edu,m:jhubbard@nvidia.com,m:apopple@nvidia.com,m:ttabi@nvidia.com,m:epeer@nvidia.com,m:acourbot@nvidia.com,m:arighi@nvidia.com,m:aritger@nvidia.com,m:zhiw@nvidia.com,m:alexeyi@nvidia.com,m:balbirs@nvidia.com,m:phasta@kernel.org,m:elle@weathered-steel.dev,m:daniel.almeida@col
 labora.com,m:joel@joelfernandes.org,m:nouveau@lists.freedesktop.org,m:rust-for-linux@vger.kernel.org,m:linux-doc@vger.kernel.org,m:amd-gfx@lists.freedesktop.org,m:intel-gfx@lists.freedesktop.org,m:intel-xe@lists.freedesktop.org,m:linux-fbdev@vger.kernel.org,m:alexgaynor@gmail.com,m:boqunfeng@gmail.com,s:lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	RCPT_COUNT_GT_50(0.00)[51];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[airlied@gmail.com,dri-devel-bounces@lists.freedesktop.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	TAGGED_RCPT(0.00)[dri-devel];
	DBL_BLOCKED_OPENRESOLVER(0.00)[nvidia.com:email,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,mail.gmail.com:mid]
X-Rspamd-Queue-Id: D4AE2F9107
X-Rspamd-Action: no action

On Fri, 6 Feb 2026 at 11:06, Joel Fernandes <joelagnelf@nvidia.com> wrote:
>
>
>
> On 2/5/2026 7:34 PM, Joel Fernandes wrote:
> > Move the DRM buddy allocator one level up so that it can be used by GPU
> > drivers (example, nova-core) that have usecases other than DRM (such as
> > VFIO vGPU support). Modify the API, structures and Kconfigs to use
> > "gpu_buddy" terminology. Adapt the drivers and tests to use the new API.
> >
> > The commit cannot be split due to bisectability, however no functional
> > change is intended. Verified by running K-UNIT tests and build tested
> > various configurations.
> >
> > Signed-off-by: Joel Fernandes <joelagnelf@nvidia.com>
>
> I forgot to add Dave Airlie's review tag here from his other email. When you
> apply, could you add it?
>
> Or, let me know if I should resend it. Thanks.
>

This one was a bit messy, so I've taken this into drm-misc-next now,
it doesn't quite end up in the same places as yours, but it looks the
same, and I updated MAINTAINERS at the end.

Now you can just care about the rust side of it.

Regards,
Dave.
