Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 51550B52CE7
	for <lists+dri-devel@lfdr.de>; Thu, 11 Sep 2025 11:18:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9F24E10EA60;
	Thu, 11 Sep 2025 09:18:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.b="j8yyBdci";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-f182.google.com (mail-qk1-f182.google.com
 [209.85.222.182])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4B84E10EA60
 for <dri-devel@lists.freedesktop.org>; Thu, 11 Sep 2025 09:18:20 +0000 (UTC)
Received: by mail-qk1-f182.google.com with SMTP id
 af79cd13be357-811b06efefdso61791185a.1
 for <dri-devel@lists.freedesktop.org>; Thu, 11 Sep 2025 02:18:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1757582299; x=1758187099;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=1B3D6WIyM4uKCWTK+JvwjK5rmKnBn1DsJarcuewJmQY=;
 b=j8yyBdcirpPZcwDBKd+SUuFHo4BVkf/BQsYOgCVoaYqFC9UgxBFiRsrlxSQUtdaYjr
 P4pxHrnI1aFM1TWxA1parbQpi359HFEUooQhnW4Oki2NshOdoGy3oiC3pQVF+YSO4iD/
 v57SfWWyHjrcaW7fQ1wKchIfEeltMSnYA3mI8RS5EfYk63juatFoHZQpwBGLwyFXaNMV
 qVw3OAV1KAol2oqv08nGAMwQNAlacJ7tMUxDySRWsKKXwYmq9V0v3vb0azvZAyEUbEf0
 9CEs75kIaeNvKk4apsDCWD4jvIfFWz0yt643QRvdAUCqt4jlPUCZhNSNnoRJwNqGeraY
 f0hw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1757582299; x=1758187099;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=1B3D6WIyM4uKCWTK+JvwjK5rmKnBn1DsJarcuewJmQY=;
 b=FqzqX97FipYNjYu6NGpjSdmry0CJHwYic6RliEhCegD94o4+0YU+3QznbqphEqI013
 cvNAmrZI3b0EEjW7fEszaQXCOptF4+LzTil2YkH/D6iexCNooDbdyeUb3h///8RVEylS
 4vWhCiit4cxFesKEWYSPkSOojsTdZxUYMTNt5iYjT+zmQZFEW0NkYrMWs1mX8kXt7YRk
 +d92DVMB4dH9uBLwh99LUzChxCyFgQvKwZJPpMSoU0Y9TvhJqzHJ0JNj5sijgp3QGqHk
 b1S4dNbstBNv3XjNhUxNIlOTwYNAAABvOlIX23wruz0M75PNzdJLKbz2HkL2/8VMuu/b
 zFBQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWX3KmOmZG6tWpSQycrTtSh6wsdyM2SvYUOJYCzvjEoJfOOLGR+4nxc3QtGvcTD5LKcDKOLLtHhw6s=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyaNe3PTfj0Exq0I8CGS2sIEebv8VtT6jvkerz44mGjUQfKUG+i
 FxjAu5QbanWlWXk6pTSL4jQyKFjWDrKP/cBSBZUkn3dZx6v1nN6eouioiliKbx2DGHXTkZvyjrI
 KJcFrxwO9LAwX+Rg304teXc+C1NHjomg1CiwBr+0L
X-Gm-Gg: ASbGnctVZwQacMdzLp9lSpjRhbaj9Pyg84RZ4hCEaaxdoWa3pQpTDcbK67tY+Xeei4n
 xSTPHLPnRv9B0ElpZ9W6bOB0L/0wgGvvQetfXgIOTUkRjc6yJKYm1JtudyCBMDEtTsvdR7auesn
 159GBrA+WU4pTt2rMAtHT+F9mZsP0HAjq5TOF48IpoP5TGjszQ2bJlgFWY2Bm5JfGd8p/VRa+yb
 LH53V09cZsthanIs8ziCR+kOuWqM/lLIrlgtD0md0ct
X-Google-Smtp-Source: AGHT+IEAdn2JRKDnhaL2qmt37A4l17luV2CMhXbLee/vFTGYZd/pxxVUthlBX8HJQeQEoIdvrbi8slCg3eRXyv3n/Qs=
X-Received: by 2002:a05:620a:45a7:b0:813:8842:93bf with SMTP id
 af79cd13be357-813c1e8e0femr1958044985a.40.1757582298381; Thu, 11 Sep 2025
 02:18:18 -0700 (PDT)
MIME-Version: 1.0
References: <20250910024328.17911-1-bagasdotme@gmail.com>
 <20250910024328.17911-8-bagasdotme@gmail.com>
In-Reply-To: <20250910024328.17911-8-bagasdotme@gmail.com>
From: Alexander Potapenko <glider@google.com>
Date: Thu, 11 Sep 2025 11:17:41 +0200
X-Gm-Features: AS18NWC9Ax6HJ7xE41xsztIAoL9MxJcZhppucVI7C3-6QUaMqtQ6glgozKyha94
Message-ID: <CAG_fn=WPCtL2Knk7_so+9QMcUPY2wCG93BZN-rwJC+ELLgJ4nQ@mail.gmail.com>
Subject: Re: [PATCH v2 07/13] Documentation: kasan: Use internal link to kunit
To: Bagas Sanjaya <bagasdotme@gmail.com>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
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
 Linux Kernel Build System <linux-kbuild@vger.kernel.org>,
 Linux Networking <netdev@vger.kernel.org>, 
 Linux Sound <linux-sound@vger.kernel.org>, Thomas Gleixner <tglx@linutronix.de>,
 Borislav Petkov <bp@alien8.de>, Peter Zijlstra <peterz@infradead.org>, 
 Josh Poimboeuf <jpoimboe@kernel.org>,
 Pawan Gupta <pawan.kumar.gupta@linux.intel.com>, 
 Jonathan Corbet <corbet@lwn.net>, SeongJae Park <sj@kernel.org>, 
 Andrew Morton <akpm@linux-foundation.org>, David Hildenbrand <david@redhat.com>,
 Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
 "Liam R. Howlett" <Liam.Howlett@oracle.com>, 
 Vlastimil Babka <vbabka@suse.cz>, Mike Rapoport <rppt@kernel.org>,
 Suren Baghdasaryan <surenb@google.com>, 
 Michal Hocko <mhocko@suse.com>, Huang Rui <ray.huang@amd.com>, 
 "Gautham R. Shenoy" <gautham.shenoy@amd.com>,
 Mario Limonciello <mario.limonciello@amd.com>, 
 Perry Yuan <perry.yuan@amd.com>, Jens Axboe <axboe@kernel.dk>, 
 Alexei Starovoitov <ast@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>, 
 Andrii Nakryiko <andrii@kernel.org>, Martin KaFai Lau <martin.lau@linux.dev>, 
 Eduard Zingerman <eddyz87@gmail.com>, Song Liu <song@kernel.org>, 
 Yonghong Song <yonghong.song@linux.dev>,
 John Fastabend <john.fastabend@gmail.com>, 
 KP Singh <kpsingh@kernel.org>, Stanislav Fomichev <sdf@fomichev.me>,
 Hao Luo <haoluo@google.com>, 
 Jiri Olsa <jolsa@kernel.org>, Dwaipayan Ray <dwaipayanray1@gmail.com>, 
 Lukas Bulwahn <lukas.bulwahn@gmail.com>, Joe Perches <joe@perches.com>, 
 Andrey Ryabinin <ryabinin.a.a@gmail.com>,
 Andrey Konovalov <andreyknvl@gmail.com>, 
 Dmitry Vyukov <dvyukov@google.com>,
 Vincenzo Frascino <vincenzo.frascino@arm.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, 
 Eric Biggers <ebiggers@kernel.org>, tytso@mit.edu,
 Richard Weinberger <richard@nod.at>, 
 Zhihao Cheng <chengzhihao1@huawei.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Nathan Chancellor <nathan@kernel.org>,
 Nicolas Schier <nicolas.schier@linux.dev>, 
 Ingo Molnar <mingo@redhat.com>, Will Deacon <will@kernel.org>,
 Boqun Feng <boqun.feng@gmail.com>, 
 Waiman Long <longman@redhat.com>, "David S. Miller" <davem@davemloft.net>, 
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, 
 Simon Horman <horms@kernel.org>, Shay Agroskin <shayagr@amazon.com>, 
 Arthur Kiyanovski <akiyano@amazon.com>, David Arinzon <darinzon@amazon.com>, 
 Saeed Bishara <saeedb@amazon.com>, Andrew Lunn <andrew@lunn.ch>, 
 Alexandru Ciobotaru <alcioa@amazon.com>, 
 The AWS Nitro Enclaves Team <aws-nitro-enclaves-devel@amazon.com>, 
 Jesper Dangaard Brouer <hawk@kernel.org>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Ranganath V N <vnranganath.20@gmail.com>, Steve French <stfrench@microsoft.com>,
 Meetakshi Setiya <msetiya@microsoft.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 "Martin K. Petersen" <martin.petersen@oracle.com>,
 Bart Van Assche <bvanassche@acm.org>, 
 =?UTF-8?Q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>, 
 Masahiro Yamada <masahiroy@kernel.org>,
 Mauro Carvalho Chehab <mchehab+huawei@kernel.org>, 
 Jani Nikula <jani.nikula@intel.com>
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

On Wed, Sep 10, 2025 at 4:44=E2=80=AFAM Bagas Sanjaya <bagasdotme@gmail.com=
> wrote:
>
> Use internal linking to KUnit documentation.
>
> Signed-off-by: Bagas Sanjaya <bagasdotme@gmail.com>
Reviewed-by: Alexander Potapenko <glider@google.com>
