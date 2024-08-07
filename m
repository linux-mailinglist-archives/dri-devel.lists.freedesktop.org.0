Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B8BE94B12B
	for <lists+dri-devel@lfdr.de>; Wed,  7 Aug 2024 22:22:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 25BF010E5C3;
	Wed,  7 Aug 2024 20:21:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=paul-moore.com header.i=@paul-moore.com header.b="DQ94BWy9";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-f176.google.com (mail-yb1-f176.google.com
 [209.85.219.176])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 04BCB10E571
 for <dri-devel@lists.freedesktop.org>; Wed,  7 Aug 2024 15:29:23 +0000 (UTC)
Received: by mail-yb1-f176.google.com with SMTP id
 3f1490d57ef6-e05ef3aefcfso1793067276.2
 for <dri-devel@lists.freedesktop.org>; Wed, 07 Aug 2024 08:29:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=paul-moore.com; s=google; t=1723044563; x=1723649363;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=XKQ9M/o3NVnkKygQpCqhb1IVgEtJMwyJqqnPTlCGvnU=;
 b=DQ94BWy9ZIOtkU8/Lwy8WhklNHSzUR4L/2mP5VfC4NA62dXGnHbbNp5ER1Y35jULun
 g3uUh92bo1Lo6hx5+U0UnNMsEcE/Ezc5mC5PnX8hKy21xcE2hjxCb2ecad//w9WOrApa
 DPyIe4AlvuawnW9PPluA82HN4hWmqHMkqTpKu/7vOEbWJQDUKAgzm+V5JdnjlHoUxz/D
 YWp5E5aRKMVMhxAKfusMS4JlGKWTr760iDDfwTBQfALHGkEN5i78yDT2L05YxlZhrnDh
 4nwWgTfSeAr8PMjFGYqO6zdcYhKzTAM+eI+PWIQ8xu2W92/oiQ4gzryqnkNtbmc/Ddd+
 aWBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1723044563; x=1723649363;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=XKQ9M/o3NVnkKygQpCqhb1IVgEtJMwyJqqnPTlCGvnU=;
 b=FF0kb6fx/w1VllywixRZlz/dVyZkzUoDAjnOdWdAaZCXfSfz383kN0sF4ygOom2+Lb
 dU6vQgrBRXhyV2olQ43DH02k+NzSrgzu1fkzggKCOwWRs/lx19BVjwY9uu4HRBNzJoGe
 Wb6Ku0qEpz1nRYoDNUXb7Io9tL3/9EVLi+lGaHnoTz7Bj0S8jBLQvI96Px4/QFuVpNnz
 GzUmceQHbZoayHdwpyrd4DAn6aZEXYyWsaSQD0e5rO/sCLjWVQlctG3rjs75qv7zJmc2
 aI0zFB5haIUdoik9iSY83SFOpceoFzinEWRruzfyG6gx50gHtjQhS2Xva5BmM6AW54LN
 XvjQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUaM3Md7S3tw55v1P46xmHPck2wJ7GShUjg8blp0CRJ0OSIrY5bErFoD22/6QRaNW7/sL+L54Pw0etjJSqtGMZxfP/RUwCtMUWpiNgwCCD+
X-Gm-Message-State: AOJu0Yyg2t4BnGwRhhcTX/EvaSkdhhyWr78jIe8+aJa0Otfl+2vMbPGZ
 9BZoDNEmBekiE9vVjYHPp/i52WHAUBGEiB1D3GhcyN0QBhx5NR45O0X02d1nSvpLK43QPjfov1r
 SCI6lH778H7IXK/59XzxUf8EQ5BFgr+1CXXhb
X-Google-Smtp-Source: AGHT+IFxKYsOrG4ilAXTKiWlIY9sugsT5cdso9SZyJ4+TO3rkpTxQeSesfajzSgpUnqosNMbojqCvWGpQGpS+lQXelM=
X-Received: by 2002:a25:c341:0:b0:e06:fe1a:ffd8 with SMTP id
 3f1490d57ef6-e0bde3ee72cmr18086030276.31.1723044562667; Wed, 07 Aug 2024
 08:29:22 -0700 (PDT)
MIME-Version: 1.0
References: <20240807-macos-build-support-v1-0-4cd1ded85694@samsung.com>
 <20240807-macos-build-support-v1-6-4cd1ded85694@samsung.com>
In-Reply-To: <20240807-macos-build-support-v1-6-4cd1ded85694@samsung.com>
From: Paul Moore <paul@paul-moore.com>
Date: Wed, 7 Aug 2024 11:29:11 -0400
Message-ID: <CAHC9VhS=KGRCbk-zy4aMiNfi2aMRX6YBP8H3VNAw7pY85TxDRA@mail.gmail.com>
Subject: Re: [PATCH 06/12] selinux/genheaders: include bitsperlong and
 posix_types headers
To: da.gomez@samsung.com
Cc: Masahiro Yamada <masahiroy@kernel.org>,
 Nathan Chancellor <nathan@kernel.org>, 
 Nicolas Schier <nicolas@fjasle.eu>, Lucas De Marchi <lucas.demarchi@intel.com>,
 =?UTF-8?Q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>, 
 Rodrigo Vivi <rodrigo.vivi@intel.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, 
 William Hubbs <w.d.hubbs@gmail.com>, Chris Brannon <chris@the-brannons.com>, 
 Kirk Reiser <kirk@reisers.ca>, Samuel Thibault <samuel.thibault@ens-lyon.org>, 
 Stephen Smalley <stephen.smalley.work@gmail.com>,
 Ondrej Mosnacek <omosnace@redhat.com>, 
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 Marc Zyngier <maz@kernel.org>, 
 Oliver Upton <oliver.upton@linux.dev>, James Morse <james.morse@arm.com>, 
 Suzuki K Poulose <suzuki.poulose@arm.com>, Zenghui Yu <yuzenghui@huawei.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Jiri Slaby <jirislaby@kernel.org>, 
 Nick Desaulniers <ndesaulniers@google.com>, Bill Wendling <morbo@google.com>, 
 Justin Stitt <justinstitt@google.com>, linux-kernel@vger.kernel.org, 
 linux-kbuild@vger.kernel.org, intel-xe@lists.freedesktop.org, 
 dri-devel@lists.freedesktop.org, speakup@linux-speakup.org, 
 selinux@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 kvmarm@lists.linux.dev, linux-serial@vger.kernel.org, llvm@lists.linux.dev, 
 Finn Behrens <me@kloenk.dev>, "Daniel Gomez (Samsung)" <d+samsung@kruces.com>,
 gost.dev@samsung.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Mailman-Approved-At: Wed, 07 Aug 2024 20:21:51 +0000
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

On Tue, Aug 6, 2024 at 7:10=E2=80=AFPM Daniel Gomez via B4 Relay
<devnull+da.gomez.samsung.com@kernel.org> wrote:
>
> From: Daniel Gomez <da.gomez@samsung.com>
>
> The genheaders requires the bitsperlong.h and posix_types.h headers.
> To ensure these headers are found during compilation on macOS hosts,
> add usr/include to HOST_EXTRACFLAGS in the genheaders Makefile. This
> adjustment allows the compiler to locate all necessary headers when they
> are not available by default on macOS.
>
> Signed-off-by: Daniel Gomez <da.gomez@samsung.com>
> ---
>  scripts/selinux/genheaders/Makefile | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)

This patch, and 7/12, look fine to me.  I can pull them into the
SELinux tree now, or would you prefer them to go via a different tree?

--=20
paul-moore.com
