Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8CD6C1A9CB6
	for <lists+dri-devel@lfdr.de>; Wed, 15 Apr 2020 13:38:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8C4106E1BA;
	Wed, 15 Apr 2020 11:38:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8B6776E1BA
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Apr 2020 11:38:38 +0000 (UTC)
Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com
 [209.85.167.53])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 1E59E20775
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Apr 2020 11:38:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1586950718;
 bh=R43hO9Q3If9QrtnZ5K9TcR/a0ZvrCDhZjgGwgzT0xFE=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=E5odArf/RDc2lUAWXYieDSICfp9q8nBXEpH8oGXMbl511ftW6vzpHvHktcBE2iKiC
 CKixYDKgMb9QlA1aORiC5Eu+aRqxfTt+PKHC5/btAAOBgUVlxZbVPCpfvrqokmXOdZ
 CbKDC6mtkLWOW1EL3z3pC7fdPh/RNVXyWZm30v4k=
Received: by mail-lf1-f53.google.com with SMTP id h6so2397275lfc.0
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Apr 2020 04:38:38 -0700 (PDT)
X-Gm-Message-State: AGi0PuZkZqQe13IyCjI0ncmfSlKnmBAuZJd7O2YhuXB41uk5GdMM2Ggb
 HWt72VFXFYUnY+k1iwXaTXIYIyct9SajqCTN9d4=
X-Google-Smtp-Source: APiQypI+VI3dpF2YbI7yVr/aHwnSBVAysHwaY+SScdUs4Jyyh+GbDgIy/bRBbEhJiawYLq4RWaZKVJOwvX1RTOgkOWY=
X-Received: by 2002:a19:ae16:: with SMTP id f22mr2914229lfc.2.1586950716265;
 Wed, 15 Apr 2020 04:38:36 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1586939718.git.hns@goldelico.com>
 <004611c9660943759b635a87484932869927cf74.1586939718.git.hns@goldelico.com>
In-Reply-To: <004611c9660943759b635a87484932869927cf74.1586939718.git.hns@goldelico.com>
From: Krzysztof Kozlowski <krzk@kernel.org>
Date: Wed, 15 Apr 2020 13:38:25 +0200
X-Gmail-Original-Message-ID: <CAJKOXPdEkWniffmGZmf=S6E5UxWTdVGXnycqTFftXwo_45rz3w@mail.gmail.com>
Message-ID: <CAJKOXPdEkWniffmGZmf=S6E5UxWTdVGXnycqTFftXwo_45rz3w@mail.gmail.com>
Subject: Re: [PATCH v6 07/12] ARM: DTS: omap5: add sgx gpu child node
To: "H. Nikolaus Schaller" <hns@goldelico.com>
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
Cc: Mark Rutland <mark.rutland@arm.com>, David Airlie <airlied@linux.ie>,
 James Hogan <jhogan@kernel.org>, dri-devel@lists.freedesktop.org,
 linux-mips@vger.kernel.org, Paul Cercueil <paul@crapouillou.net>,
 "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>,
 linux-omap@vger.kernel.org, Paul Burton <paulburton@kernel.org>,
 Tony Lindgren <tony@atomide.com>, Chen-Yu Tsai <wens@csie.org>,
 Kukjin Kim <kgene@kernel.org>, devicetree@vger.kernel.org,
 =?UTF-8?Q?Beno=C3=AEt_Cousson?= <bcousson@baylibre.com>,
 Rob Herring <robh+dt@kernel.org>, letux-kernel@openphoenux.org,
 linux-arm-kernel@lists.infradead.org,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 Philipp Rossak <embed3d@gmail.com>, openpvrsgx-devgroup@letux.org,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Ralf Baechle <ralf@linux-mips.org>, kernel@pyra-handheld.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, 15 Apr 2020 at 10:36, H. Nikolaus Schaller <hns@goldelico.com> wrote:
>
> and add interrupt.
>
> Tested-by: H. Nikolaus Schaller <hns@goldelico.com> # Pyra-Handheld.

Don't add your own Tested-by tags. These are implied by authorship,
otherwise all patches people make should have such tag.

Best regards,
Krzysztof
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
