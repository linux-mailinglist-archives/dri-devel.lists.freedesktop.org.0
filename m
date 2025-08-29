Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4BDDBB3DAA8
	for <lists+dri-devel@lfdr.de>; Mon,  1 Sep 2025 09:03:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 14CA110E38B;
	Mon,  1 Sep 2025 07:03:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="JlKI4gdC";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-f50.google.com (mail-ot1-f50.google.com
 [209.85.210.50])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 208B210EBF7
 for <dri-devel@lists.freedesktop.org>; Fri, 29 Aug 2025 15:04:37 +0000 (UTC)
Received: by mail-ot1-f50.google.com with SMTP id
 46e09a7af769-74381ee9bc9so1929581a34.1
 for <dri-devel@lists.freedesktop.org>; Fri, 29 Aug 2025 08:04:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1756479876; x=1757084676; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=xtU8o3RRKlATt1ZkDZoqGZInz4LA3xlvTSiKt6WYT3E=;
 b=JlKI4gdCaFSehp6FmLNW705N7EsUJe7u2/Odh5EDzbnbHk+OeXcCFb9wgnznVceNk1
 oCdqpcPihoFr9kC0KrUN5reH6ZJFuClxIyUnqj3eKze/opma+b1azUuegx1oEET353ic
 8IxtrZpxbrZ5vW+sVTWzNSoKJoJFy0J5EfoFElXmSkfonfHKHUKov6gg5qs057vomlW3
 5GZMCpXK54Cv+WGt39ZUUooligNR/5hIupxGBugfV5mdHToG085v6UPj4fw4Aye6bRj8
 w7Nqqu4I6zwpu0wbsfWOMIxkuS2kMFfmw/vykmvLudmTBDSC+F4LNXRdPMK85u0sPpz1
 kc1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1756479876; x=1757084676;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=xtU8o3RRKlATt1ZkDZoqGZInz4LA3xlvTSiKt6WYT3E=;
 b=M0BWhlfFsWcNoF5xIJEWToEhcyHFotHRQ8Ti61HmZTqlSu7glpSK7rnL+XON3d1EIy
 yMru1Vi3FTWHxVODL/zbrG3vN56/Ot3hRXclFP6NALN8d3fHEi4tViLIfBIXIV/O9obq
 Bcoij5LGpOT4L26tQ0Ce6V67CatokYi7XnmBWNd0Bg+naoYsDiz2R3wT9GLQV8OtHz4n
 rCVehgzMg4sRuRYxuXzO+YXJ6r/H+JNQNxWOQR/Pxbp7rVZpI6TKT1R3tu1xdMDFKK5K
 rogV35orekswIQVuc1VLAnFjCzLX8tu/gk3SQ2dNu7fxC+/G1ZkqhbC+LpDnVpe4bSHp
 r7fQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXpidetqMJwm5NUmzRdLuFREhnVHatSGSMaIyIVRBDnZ8cAb4zn6+tE837fWB15w7yQa+d3l21vgAo=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxcXXNOWjUWT3hcC2IYEgUlE31BSfNsuE0dIoab49eqjWN/D10y
 VhA08hJiPxBoGKImLvNfm6TH1irBsHgQuOdku4a6Yfk8CLnaVbPllW20
X-Gm-Gg: ASbGncvjXnvZulQOXXGyBSzlJ1NgNcJ2G6S5hxC6ziP6vbDUJVCZ833Cl6fhr23p+AS
 SRFAT8mFO1WnZYYJo8/Qt3VqcdQNjqZQ1NVMx/uHUsptyY1eREuVpNyZoRC7YhkKdScyKCvJa4x
 4/atLzdbLdb3lrLng+iO9NlXCnvu7LHZ6MUVI3m7W87xY3lIyG0aH9I8xugzRjps2rmFFxXqhiB
 hBhVdbd5AP8KT67wrb5psQtxU3yr/5DvgoRDe2IA74X7GgAMnhn2MnvAH3ItIZEvq5pEeBeiKQ0
 4heJrTqlkNL4GGg3taSNGFWsjs/bjC4Wh8xVe5oiyUVUqhGeNXcd/zdnErgMydqvKM4mJVUw32l
 vq52p7W69jnyMdxmibHizdy1X6g==
X-Google-Smtp-Source: AGHT+IHoYRW1dTyT65+rU4V7sdHQy1ZAWCnUhYSUduVJT7h6pncITh0MMXOlALcxWQkuMLP36zurpg==
X-Received: by 2002:a05:6a21:339e:b0:243:9b4e:281b with SMTP id
 adf61e73a8af0-2439b4e296dmr15525181637.49.1756473541271; 
 Fri, 29 Aug 2025 06:19:01 -0700 (PDT)
Received: from archie.me ([103.124.138.155]) by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-7722a4bac60sm2408193b3a.63.2025.08.29.06.19.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 29 Aug 2025 06:19:00 -0700 (PDT)
Received: by archie.me (Postfix, from userid 1000)
 id 51DA0409D7C0; Fri, 29 Aug 2025 20:18:56 +0700 (WIB)
Date: Fri, 29 Aug 2025 20:18:55 +0700
From: Bagas Sanjaya <bagasdotme@gmail.com>
To: Jani Nikula <jani.nikula@intel.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Linux Documentation <linux-doc@vger.kernel.org>,
 Linux DAMON <damon@lists.linux.dev>,
 Linux Memory Management List <linux-mm@kvack.org>,
 Linux Power Management <linux-pm@vger.kernel.org>,
 Linux Block Devices <linux-block@vger.kernel.org>,
 Linux BPF <bpf@vger.kernel.org>,
 Linux Kernel Workflows <workflows@vger.kernel.org>,
 Linux KASAN <kasan-dev@googlegroups.com>,
 Linux Devicetree <devicetree@vger.kernel.org>,
 Linux fsverity <fsverity@lists.linux.dev>,
 Linux MTD <linux-mtd@lists.infradead.org>,
 Linux DRI Development <dri-devel@lists.freedesktop.org>,
 Linux Kernel Build System <linux-lbuild@vger.kernel.org>,
 Linux Networking <netdev@vger.kernel.org>,
 Linux Sound <linux-sound@vger.kernel.org>
Cc: Thomas Gleixner <tglx@linutronix.de>, Borislav Petkov <bp@alien8.de>,
 Peter Zijlstra <peterz@infradead.org>,
 Josh Poimboeuf <jpoimboe@kernel.org>,
 Pawan Gupta <pawan.kumar.gupta@linux.intel.com>,
 Jonathan Corbet <corbet@lwn.net>, SeongJae Park <sj@kernel.org>,
 Andrew Morton <akpm@linux-foundation.org>,
 David Hildenbrand <david@redhat.com>,
 Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
 "Liam R. Howlett" <Liam.Howlett@oracle.com>,
 Vlastimil Babka <vbabka@suse.cz>, Mike Rapoport <rppt@kernel.org>,
 Suren Baghdasaryan <surenb@google.com>,
 Michal Hocko <mhocko@suse.com>, Huang Rui <ray.huang@amd.com>,
 "Gautham R. Shenoy" <gautham.shenoy@amd.com>,
 Mario Limonciello <mario.limonciello@amd.com>,
 Perry Yuan <perry.yuan@amd.com>, Jens Axboe <axboe@kernel.dk>,
 Alexei Starovoitov <ast@kernel.org>,
 Daniel Borkmann <daniel@iogearbox.net>,
 Andrii Nakryiko <andrii@kernel.org>,
 Martin KaFai Lau <martin.lau@linux.dev>,
 Eduard Zingerman <eddyz87@gmail.com>, Song Liu <song@kernel.org>,
 Yonghong Song <yonghong.song@linux.dev>,
 John Fastabend <john.fastabend@gmail.com>,
 KP Singh <kpsingh@kernel.org>, Stanislav Fomichev <sdf@fomichev.me>,
 Hao Luo <haoluo@google.com>, Jiri Olsa <jolsa@kernel.org>,
 Dwaipayan Ray <dwaipayanray1@gmail.com>,
 Lukas Bulwahn <lukas.bulwahn@gmail.com>, Joe Perches <joe@perches.com>,
 Andrey Ryabinin <ryabinin.a.a@gmail.com>,
 Alexander Potapenko <glider@google.com>,
 Andrey Konovalov <andreyknvl@gmail.com>,
 Dmitry Vyukov <dvyukov@google.com>,
 Vincenzo Frascino <vincenzo.frascino@arm.com>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Eric Biggers <ebiggers@kernel.org>, tytso@mit.edu,
 Richard Weinberger <richard@nod.at>,
 Zhihao Cheng <chengzhihao1@huawei.com>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Nathan Chancellor <nathan@kernel.org>,
 Nicolas Schier <nicolas.schier@linux.dev>,
 Ingo Molnar <mingo@redhat.com>, Will Deacon <will@kernel.org>,
 Boqun Feng <boqun.feng@gmail.com>, Waiman Long <longman@redhat.com>,
 "David S. Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Simon Horman <horms@kernel.org>, Shay Agroskin <shayagr@amazon.com>,
 Arthur Kiyanovski <akiyano@amazon.com>,
 David Arinzon <darinzon@amazon.com>,
 Saeed Bishara <saeedb@amazon.com>, Andrew Lunn <andrew@lunn.ch>,
 Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>, Alexandru Ciobotaru <alcioa@amazon.com>,
 The AWS Nitro Enclaves Team <aws-nitro-enclaves-devel@amazon.com>,
 Jesper Dangaard Brouer <hawk@kernel.org>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Steve French <stfrench@microsoft.com>,
 Meetakshi Setiya <msetiya@microsoft.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 "Martin K. Petersen" <martin.petersen@oracle.com>,
 Bart Van Assche <bvanassche@acm.org>,
 Thomas =?utf-8?Q?Wei=C3=9Fschuh?= <linux@weissschuh.net>,
 Masahiro Yamada <masahiroy@kernel.org>
Subject: Re: [PATCH 00/14] Internalize www.kernel.org/doc cross-reference
Message-ID: <aLGovx7OpL_85YTf@archie.me>
References: <20250829075524.45635-1-bagasdotme@gmail.com>
 <437912a24e94673c2355a2b7b50c3c4b6f68fcc6@intel.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="v+QeNeXg1wIV/8Z8"
Content-Disposition: inline
In-Reply-To: <437912a24e94673c2355a2b7b50c3c4b6f68fcc6@intel.com>
X-Mailman-Approved-At: Mon, 01 Sep 2025 07:02:45 +0000
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


--v+QeNeXg1wIV/8Z8
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Aug 29, 2025 at 03:18:20PM +0300, Jani Nikula wrote:
> FWIW, I'd much prefer using :ref: on rst anchors (that automatically
> pick the link text from the target heading) instead of manually adding
> link texts and file references.
>=20
> i.e.
>=20
> .. _some_target:
>=20
> Heading After Some Target
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D
>=20
> See :ref:`some_target`.
>=20
> Will generate "See Heading After Some Target".

I did that in patch [14/14], but I had to write out explicit anchor text
considering people reading rst source. When they encounter checkpatch warni=
ng
and they'd like to learn about solution by following See: links, they shoul=
d be
able to locate the actual docs and section mentioned without leaving the
terminal. Before this series, however, they need to click the https link
provided, which leads to relevant docs in docs.kernel.org that its source is
already in Documentation/.

Thanks.

--=20
An old man doll... just what I always wanted! - Clara

--v+QeNeXg1wIV/8Z8
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQSSYQ6Cy7oyFNCHrUH2uYlJVVFOowUCaLGougAKCRD2uYlJVVFO
oyLxAP95mJgSRTOQ+hTC3+7/hjakAGgQRjyWnfFgZF9dKlXeHgD/bJRCDtPLAnbQ
JLSf5TwAGdo1LgUd0wgEgetqhpMKwQI=
=82dj
-----END PGP SIGNATURE-----

--v+QeNeXg1wIV/8Z8--
