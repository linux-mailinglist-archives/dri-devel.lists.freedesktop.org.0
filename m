Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4718DCCA27E
	for <lists+dri-devel@lfdr.de>; Thu, 18 Dec 2025 04:15:00 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EA86C10E047;
	Thu, 18 Dec 2025 03:14:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="YFJG+Izt";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-f68.google.com (mail-pj1-f68.google.com
 [209.85.216.68])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A22C610E047
 for <dri-devel@lists.freedesktop.org>; Thu, 18 Dec 2025 03:14:56 +0000 (UTC)
Received: by mail-pj1-f68.google.com with SMTP id
 98e67ed59e1d1-34e730f5fefso196136a91.0
 for <dri-devel@lists.freedesktop.org>; Wed, 17 Dec 2025 19:14:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1766027696; x=1766632496; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=aMmDsg6PeqY3yDJKla0eomYe6OESw8tJFHAPUF0WDJQ=;
 b=YFJG+Izt9uC9/yrSy4DW5nqOBzX4C6QVJroqg6GNMXU0V7j4d+ENvApxZILTkyBI6p
 VhJIlSZZfd7P0sZtlVZoh0l509j+iC2eW9wdXu2gi/Q+oGjFcHsTaJ3xXwC72dTUKeQ3
 8xkuiIXeRgX4fw6M5mMb47RtyFoike0bvE6V/R5FMYuCM96doMSm5jzrls0YlX2TtaG/
 SeWaDu7M/VZUoWM8NnyedUw8sdQY5hd2zvA2VlcTUEu7TRe3HhMiSX3fOkzbSTP7YTOJ
 YLTCYVKGgF6dDr3Awk3t48YgJ+rNF8CWw9dgaOjYDdH8CLAIcogFoydSj3RXZnq0o+jL
 UfGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1766027696; x=1766632496;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=aMmDsg6PeqY3yDJKla0eomYe6OESw8tJFHAPUF0WDJQ=;
 b=FNQ7s4Zz5HNAWArqmTYBZ1WrzE36uwe0pLcVSYGuN0n3jmbV16U5mlrK3haJPEG8Lp
 gK/jxshlwVNIGZ9Zvv938EFf5NwdopBVGq3YzJEgYmy5acB3EL4jXNKskE8HmSoE9Nds
 mJ9CgRqf179RXnizvbD7F3keg4ghnOqsLElkwG2VnIQ6whhqnXowS7Xpl8UwvWi6M4X9
 xAN55uxUidE+hQgBiKW1Ji6tW+y+8OWs9VNjZFgJJ07PQwwKGMiB8D6kXkGunRfpcv89
 wZp3SWKmSF4A/S6wsSByaAJWhj1TyIXz1IAzrCU20TGF45ljVPeadSazySpl1zVs6BWZ
 N+tA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUWKsm8H6aQZJ8UAGu5yyvh3OX3WLUmZJ0DzDCrS3EBAseBCcBRWmWhYYbCLzLkiKhmTy+1Ug+o5NI=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwQiSD2N55vHDTkNf7KL3KvGA1/NJru+4ydBS4YBUIU/2zGpEEo
 e/Fqa6BRQi9XMChT9MajGiqfq+tNPq9Mt/MzVqtXMWynL/NCTt0vniM5
X-Gm-Gg: AY/fxX5WKZI39U3Z4DHY5+bC2rGditNRWaGm7yR9gp9Z6JNY8fkanIXll8mfCnBYAlm
 X/MotvEoWsJrEuxUmJd7YCZeRNWakYouqOcDj+r3tkhqs+5BzjlWwxgEtdzIO10Bat/PI1CE3WC
 mqDN83jrj+XdpZbUIwhuHegAkP0tCqxVPuAXK/vvqziaLRniFJ2Y8JcXsQiGnxXspELzsudvloo
 VEB7KWKAc3dBvr2o568cnsmTw8bVOeZxYrmC3Yhi/xbF2jex4AG9mY1rW6fBYKNmKel0PX78bp/
 0vKioc2ov0ozd2S9TpwTqSWcu2e6HMS5Jdw+vQPgFLKwbN/Ew4Ezk799UKGS4T8x0jvvy92tGzX
 97BpckK3aMsrV6d8WKwcQBbukEQLu+aQ8J6O3f3teUidymb6uBFX/gU62Lv1k8Em01MH7Pr9lMF
 lEhB1Su955EpM96sDqeQ6d2w==
X-Google-Smtp-Source: AGHT+IHSjhEce/oXMOW5vM6ZF5lLLUz2/oBcTOMxDFFo21mOBhpjs2cfzbOckN+Zo7VcHVKH3Yx+8g==
X-Received: by 2002:a17:90b:2ccf:b0:340:cb18:922 with SMTP id
 98e67ed59e1d1-34abd71f7e6mr19045388a91.14.1766027695922; 
 Wed, 17 Dec 2025 19:14:55 -0800 (PST)
Received: from archie.me ([210.87.74.117]) by smtp.gmail.com with ESMTPSA id
 41be03b00d2f7-c1d2d9ae134sm730773a12.1.2025.12.17.19.14.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 17 Dec 2025 19:14:55 -0800 (PST)
Received: by archie.me (Postfix, from userid 1000)
 id 75FB1420A930; Thu, 18 Dec 2025 10:14:51 +0700 (WIB)
Date: Thu, 18 Dec 2025 10:14:51 +0700
From: Bagas Sanjaya <bagasdotme@gmail.com>
To: Jakub Kicinski <kuba@kernel.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Linux AMDGPU <amd-gfx@lists.freedesktop.org>,
 Linux DRI Development <dri-devel@lists.freedesktop.org>,
 Linux Filesystems Development <linux-fsdevel@vger.kernel.org>,
 Linux Media <linux-media@vger.kernel.org>,
 linaro-mm-sig@lists.linaro.org, kasan-dev@googlegroups.com,
 Linux Virtualization <virtualization@lists.linux.dev>,
 Linux Memory Management List <linux-mm@kvack.org>,
 Linux Network Bridge <bridge@lists.linux.dev>,
 Linux Networking <netdev@vger.kernel.org>,
 Harry Wentland <harry.wentland@amd.com>,
 Leo Li <sunpeng.li@amd.com>, Rodrigo Siqueira <siqueira@igalia.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 Christian =?utf-8?B?S8O2bmln?= <christian.koenig@amd.com>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Matthew Brost <matthew.brost@intel.com>,
 Danilo Krummrich <dakr@kernel.org>, Philipp Stanner <phasta@kernel.org>,
 Alexander Viro <viro@zeniv.linux.org.uk>,
 Christian Brauner <brauner@kernel.org>, Jan Kara <jack@suse.cz>,
 Sumit Semwal <sumit.semwal@linaro.org>,
 Alexander Potapenko <glider@google.com>,
 Marco Elver <elver@google.com>, Dmitry Vyukov <dvyukov@google.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Jason Wang <jasowang@redhat.com>,
 Xuan Zhuo <xuanzhuo@linux.alibaba.com>,
 Eugenio =?utf-8?B?UMOpcmV6?= <eperezma@redhat.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 Uladzislau Rezki <urezki@gmail.com>,
 Nikolay Aleksandrov <razor@blackwall.org>,
 Ido Schimmel <idosch@nvidia.com>, "David S. Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@google.com>, Paolo Abeni <pabeni@redhat.com>,
 Simon Horman <horms@kernel.org>,
 Taimur Hassan <Syed.Hassan@amd.com>, Wayne Lin <Wayne.Lin@amd.com>,
 Alex Hung <alex.hung@amd.com>, Aurabindo Pillai <aurabindo.pillai@amd.com>,
 Dillon Varone <Dillon.Varone@amd.com>,
 George Shen <george.shen@amd.com>, Aric Cyr <aric.cyr@amd.com>,
 Cruise Hung <Cruise.Hung@amd.com>,
 Mario Limonciello <mario.limonciello@amd.com>,
 Sunil Khatri <sunil.khatri@amd.com>,
 Dominik Kaszewski <dominik.kaszewski@amd.com>,
 David Hildenbrand <david@kernel.org>,
 Peter Zijlstra <peterz@infradead.org>,
 Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
 Max Kellermann <max.kellermann@ionos.com>,
 "Nysal Jan K.A." <nysal@linux.ibm.com>,
 Ryan Roberts <ryan.roberts@arm.com>,
 Alexey Skidanov <alexey.skidanov@intel.com>,
 Vlastimil Babka <vbabka@suse.cz>,
 Kent Overstreet <kent.overstreet@linux.dev>,
 Vitaly Wool <vitaly.wool@konsulko.se>,
 Harry Yoo <harry.yoo@oracle.com>, Mateusz Guzik <mjguzik@gmail.com>,
 NeilBrown <neil@brown.name>, Amir Goldstein <amir73il@gmail.com>,
 Jeff Layton <jlayton@kernel.org>, Ivan Lipski <ivan.lipski@amd.com>,
 Tao Zhou <tao.zhou1@amd.com>, YiPeng Chai <YiPeng.Chai@amd.com>,
 Hawking Zhang <Hawking.Zhang@amd.com>, Lyude Paul <lyude@redhat.com>,
 Daniel Almeida <daniel.almeida@collabora.com>,
 Luben Tuikov <luben.tuikov@amd.com>, Matthew Auld <matthew.auld@intel.com>,
 Roopa Prabhu <roopa@cumulusnetworks.com>, Mao Zhu <zhumao001@208suo.com>,
 Shaomin Deng <dengshaomin@cdjrlc.com>,
 Charles Han <hanchunchao@inspur.com>, Jilin Yuan <yuanjilin@cdjrlc.com>,
 Swaraj Gaikwad <swarajgaikwad1925@gmail.com>,
 George Anthony Vernon <contact@gvernon.com>
Subject: Re: [PATCH 00/14] Assorted kernel-doc fixes
Message-ID: <aUNxq6Xk2bGzeBVO@archie.me>
References: <20251215113903.46555-1-bagasdotme@gmail.com>
 <20251216140857.77cf0fb3@kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="V23DYTy9ofvlaB8B"
Content-Disposition: inline
In-Reply-To: <20251216140857.77cf0fb3@kernel.org>
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


--V23DYTy9ofvlaB8B
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Dec 16, 2025 at 02:08:57PM -0800, Jakub Kicinski wrote:
> On Mon, 15 Dec 2025 18:38:48 +0700 Bagas Sanjaya wrote:
> > Here are assorted kernel-doc fixes for 6.19 cycle. As the name
> > implies, for the merging strategy, the patches can be taken by
> > respective maintainers to appropriate fixes branches (targetting
> > 6.19 of course) (e.g. for mm it will be mm-hotfixes).
>=20
> Please submit just the relevant changes directly to respective
> subsystems. Maintainers don't have time to sort patches for you.
> You should know better.

OK, thanks!

--=20
An old man doll... just what I always wanted! - Clara

--V23DYTy9ofvlaB8B
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQSSYQ6Cy7oyFNCHrUH2uYlJVVFOowUCaUNxpwAKCRD2uYlJVVFO
o1nDAP9D8xQeBKhU5vgUY1uZdEmdnOr8lzFR748Q3fszwHYA2AD+Lmk5pycZlTp2
pDdOJDlTqJohju9NNAPmvm1zT37zzwE=
=Ar/g
-----END PGP SIGNATURE-----

--V23DYTy9ofvlaB8B--
