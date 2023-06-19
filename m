Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 032C37351D7
	for <lists+dri-devel@lfdr.de>; Mon, 19 Jun 2023 12:19:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0A22110E1DC;
	Mon, 19 Jun 2023 10:19:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2A32B10E1EE
 for <dri-devel@lists.freedesktop.org>; Mon, 19 Jun 2023 10:19:41 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 3506760B5E
 for <dri-devel@lists.freedesktop.org>; Mon, 19 Jun 2023 10:19:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 99392C433CD
 for <dri-devel@lists.freedesktop.org>; Mon, 19 Jun 2023 10:19:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1687169979;
 bh=Ql8oZeiPv3Nsx9lfoBIsiA/5xPyBJlH0pHjr4hER5Sg=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=hZl3fmoF1JhP3Ist+qWejavEM/YR7wwlD0YS26Has4R8IOSP+/MKxB1vvjy/yaDgs
 ke4M5cgPdEapN45hnHsPld56xxsn21/V1MOdLrXRUBCwpDA9Z/4qcBdLvarojuc0H6
 qU8iyKnFNLuOuyeEoV7FUTcoO3UwGwlXup9MjgFOs0vBnZkKSEt6kxZdj0qFl8Re/s
 SY4HF1c3LiKxHB2Tkjo0RZjJhQwH09mK/fZGJlR3mi/XdCNNOseY6xMunRzbQOWIsH
 IBhUtCPeo2cTEYIh3KG50tRXjdAlGvCmrrPmGzSVD1sOV3K+lt5aIsH2PV3Gfy1mcK
 ELlu9eX+xcnAQ==
Received: by mail-lj1-f181.google.com with SMTP id
 38308e7fff4ca-2b4769a2ee5so14160401fa.3
 for <dri-devel@lists.freedesktop.org>; Mon, 19 Jun 2023 03:19:39 -0700 (PDT)
X-Gm-Message-State: AC+VfDz1z9GpFcgdnHo9ZgWh/ny6ijPyTpHOHG/xjM6lT0spS/AqET1w
 sF0Bc+YCaniIi2U1WfAwLuWXUg7jncKx1DztnUE=
X-Google-Smtp-Source: ACHHUZ7PTalzmKF7Cp+12G5Jv5NjTJY5Tl4rwUPo9156swI3VqtOp6tE/X9s8ABJSUnbGUhg//LFpe+/pYOhOyd9bdU=
X-Received: by 2002:a2e:3c16:0:b0:2b4:765b:f6ee with SMTP id
 j22-20020a2e3c16000000b002b4765bf6eemr1694734lja.41.1687169977592; Mon, 19
 Jun 2023 03:19:37 -0700 (PDT)
MIME-Version: 1.0
References: <20230615143613.1236245-1-15330273260@189.cn>
 <20230615143613.1236245-2-15330273260@189.cn>
 <CAAhV-H704swbRxsZoJN5ef3X41n9Vw-js_73tptK3cAjCWP6tQ@mail.gmail.com>
 <f1f24be6-20c6-03de-a4a7-4ad874b8a0f5@loongson.cn>
In-Reply-To: <f1f24be6-20c6-03de-a4a7-4ad874b8a0f5@loongson.cn>
From: Huacai Chen <chenhuacai@kernel.org>
Date: Mon, 19 Jun 2023 18:19:25 +0800
X-Gmail-Original-Message-ID: <CAAhV-H5_B5g5tkv29z2bPBeiuR-gaBgRMFPSmOp1U+bqrOGQPA@mail.gmail.com>
Message-ID: <CAAhV-H5_B5g5tkv29z2bPBeiuR-gaBgRMFPSmOp1U+bqrOGQPA@mail.gmail.com>
Subject: Re: [PATCH v15 1/2] drm: Add kms driver for loongson display
 controller
To: Sui Jingfeng <suijingfeng@loongson.cn>
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
Cc: Nathan Chancellor <nathan@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, inux-kernel@vger.kernel.org,
 Christian Koenig <christian.koenig@amd.com>,
 Emil Velikov <emil.l.velikov@gmail.com>, Maxime Ripard <mripard@kernel.org>,
 Sui Jingfeng <15330273260@189.cn>, loongson-kernel@lists.loongnix.cn,
 Liu Peibao <liupeibao@loongson.cn>, dri-devel@lists.freedesktop.org,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Sumit Semwal <sumit.semwal@linaro.org>, linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Jun 19, 2023 at 6:07=E2=80=AFPM Sui Jingfeng <suijingfeng@loongson.=
cn> wrote:
>
> Hi,
>
>
> On 2023/6/19 17:18, Huacai Chen wrote:
> > This patch is too large to review, lsdc_benchmark.c, lsdc_benchmark.h
> > and their call sites can be split to a separate patch.
>
> Better not, large is not a problem.
My review was rejected by the maillist, this is a very big problem.

>
> Single patch is more easy to manage.
>
> The first patch of this driver should comes a whole.
Benchmarks and debugfs are not the very basic parts.

Huacai
>
> --
> Jingfeng
>
