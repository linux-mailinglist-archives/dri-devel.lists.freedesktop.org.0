Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 76660A40900
	for <lists+dri-devel@lfdr.de>; Sat, 22 Feb 2025 15:29:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1D3DB898C4;
	Sat, 22 Feb 2025 14:29:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="rbY6Dl0q";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 43A8C898C4
 for <dri-devel@lists.freedesktop.org>; Sat, 22 Feb 2025 14:29:23 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 5A39A5C56E6;
 Sat, 22 Feb 2025 14:28:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5F820C4CED1;
 Sat, 22 Feb 2025 14:29:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1740234562;
 bh=+kOgJOLeUsEcRopHliSLADFOsTli+aEEbCVMgK8cpS8=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=rbY6Dl0q/olSwgwc9kO9jEoujL0x2R/2TQRchZ7LbOwjr09BtdqA+MppLWUdFxDXB
 lkNihXX1fPfbopiPvnoOFKXUU6YLgepdwwKLh99HXML/1cs6EtYSvD2nm9cPql8PcU
 tSvNYO3hARszAv1ANjDXG0Zv5OkKbJcqgL0jnnR/sRcZtO8J2k9RUQoeh1bHTb1ZPr
 B/SPwPJ8X47mEqGhqiAQZkVA60KYSx3WijrZX45DeKTs3yJbc22xqna4TbGGf8Wfvz
 FQmzDkdFWJltu4InfCyvKc6HTcEedQlaps7JFAFqEw7iqFEiXMJEtc8rFaK1cv7VGR
 C9DVChcOcyVyw==
Date: Sat, 22 Feb 2025 14:29:10 +0000
From: Jonathan Cameron <jic23@kernel.org>
To: Svyatoslav Ryhel <clamor95@gmail.com>
Cc: Lee Jones <lee@kernel.org>, Rob Herring <robh@kernel.org>, Krzysztof
 Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 Lars-Peter Clausen <lars@metafoo.de>, Pavel Machek <pavel@ucw.cz>, Daniel
 Thompson <danielt@kernel.org>, Jingoo Han <jingoohan1@gmail.com>, Helge
 Deller <deller@gmx.de>, Andy Shevchenko
 <andriy.shevchenko@linux.intel.com>, Uwe =?UTF-8?B?S2xlaW5lLUvDtm5pZw==?=
 <u.kleine-koenig@baylibre.com>, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-iio@vger.kernel.org,
 linux-leds@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-fbdev@vger.kernel.org
Subject: Re: [PATCH v2 1/2] dt-bindings: mfd: Document TI LM3533 MFD
Message-ID: <20250222142910.4e6b706d@jic23-huawei>
In-Reply-To: <20250218132702.114669-2-clamor95@gmail.com>
References: <20250218132702.114669-1-clamor95@gmail.com>
 <20250218132702.114669-2-clamor95@gmail.com>
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.48; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
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

On Tue, 18 Feb 2025 15:26:59 +0200
Svyatoslav Ryhel <clamor95@gmail.com> wrote:

> Add bindings for the LM3533 - a complete power source for
> backlight, keypad, and indicator LEDs in smartphone handsets.
> The high-voltage inductive boost converter provides the
> power for two series LED strings display backlight and keypad
> functions.

Wrap patch descriptions to 75 chars as describe in submitting-patches.rst

> 
> Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
