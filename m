Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BA9D8509E78
	for <lists+dri-devel@lfdr.de>; Thu, 21 Apr 2022 13:23:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7532C10F39E;
	Thu, 21 Apr 2022 11:23:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 400 seconds by postgrey-1.36 at gabe;
 Wed, 20 Apr 2022 17:15:22 UTC
Received: from lahtoruutu.iki.fi (lahtoruutu.iki.fi [185.185.170.37])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C1BF510E204
 for <dri-devel@lists.freedesktop.org>; Wed, 20 Apr 2022 17:15:22 +0000 (UTC)
Received: from darkstar.musicnaut.iki.fi (85-76-69-216-nat.elisa-mobile.fi
 [85.76.69.216])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest
 SHA256) (No client certificate requested)
 (Authenticated sender: aaro.koskinen)
 by lahtoruutu.iki.fi (Postfix) with ESMTPSA id 75C061B00220;
 Wed, 20 Apr 2022 20:08:38 +0300 (EEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi; s=lahtoruutu; 
 t=1650474519;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=B5msNSogp8zw4YAcAsDj6Qc4zdyDGRTVYmRgqRI/0Bk=;
 b=kTa4PeKcYbiz8v0d1bG/DaDfDPW+JW/Y5caY8AdpKOUIvDM5o36RCvYnTBodU8x4tUxuiF
 ktxA1VDWnp4JhwdnVZN87iQgFWmYig18OVXRM8AVMhj39aWpQH20CPI4avqgLCd+YIg1Qy
 idcTWI4UYPweIAjRUudXT1Zf+FbV1KFQ6CsP671o0mcoZYtmGXBa6OtYrK6P6K3jtGr5MZ
 EHOyrIqm3R/nP1YaqVIW53HsDJDowGirtgtowbqAHter8eYPWisaRosyEAvgWd8N5xDazf
 MEVSDjkPCt3ICTrqoO34GRh7hV71rJoxKjbq4SJKV8lZ4881URlm0+K8k78LMA==
Date: Wed, 20 Apr 2022 20:08:36 +0300
From: Aaro Koskinen <aaro.koskinen@iki.fi>
To: Arnd Bergmann <arnd@kernel.org>
Subject: Re: [PATCH 00/41] OMAP1 full multiplatform conversion
Message-ID: <20220420170836.GB1947@darkstar.musicnaut.iki.fi>
References: <20220419133723.1394715-1-arnd@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220419133723.1394715-1-arnd@kernel.org>
ARC-Seal: i=1; s=lahtoruutu; d=iki.fi; t=1650474519; a=rsa-sha256; cv=none;
 b=fUP5y+/XQ6zNbth6dMfmG2kN9cICXfnwRNYbkGoVeRNsnY+v6znhO5ch2i5vR5slzPAUec
 Sztc4GVEZyZOwSwkjLWA4eNpQZV5fEBKgPV4PA0N+8DX6z5GrX6hFbFsM5SltaEfdOE+4X
 UDuk5UOcv8jYUvEeGfo5RBPyqhwpuA6b4fVpMKqPEFiwGDCvSZdERPOuJX+KlmiYWEjjRQ
 bzFS2MgkL1ik8EAGHbfrB4YVK4K3DZYBDGcMAmDesHi8ybCiB4PqONwfrj/O7/GLX4DLwE
 F7s5Eze8miwVNtjGjumlbsWMr0sA8n2Asp4QdugmIsfg6AnQuJaXDQ3ZfwifVA==
ARC-Authentication-Results: i=1; ORIGINATING;
 auth=pass smtp.auth=aaro.koskinen smtp.mailfrom=aaro.koskinen@iki.fi
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi;
 s=lahtoruutu; t=1650474519;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=B5msNSogp8zw4YAcAsDj6Qc4zdyDGRTVYmRgqRI/0Bk=;
 b=uAZuJDKZ7bj4MVqgI3bbcZAOIBMgL+TVcCp9+D4Bx6tcZMUwn0Yukw4zw8doMpCzXb5WaN
 pJVbadhIweA9yGpQNueUVV9vr1H4bIPdTLnUt9sq85H8sbrTY3WHbuj7hKBBvCPd9hNdLm
 1ukZgRh1UpuRnt4Qyg6muAqbGwQyb+0ufFu2ZZFIwmdViYeENLfMfCKbIoMvRNyQt/3O2K
 fLMvlRgaN2w7kyqhajE30yj5vD3Ir8o/PY21vwX9mxyhgmVGkpxJMIAtFXlT8CRNLmGomp
 hDjQyLXElaOcP4BTszvgdBbpo30Bae+K5TvQUlGAai/EzsAchzF8OdhdOWxG2A==
X-Mailman-Approved-At: Thu, 21 Apr 2022 11:22:59 +0000
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
Cc: Ulf Hansson <ulf.hansson@linaro.org>, linux-usb@vger.kernel.org,
 tony@atomide.com, linux-fbdev@vger.kernel.org,
 Dominik Brodowski <linux@dominikbrodowski.net>,
 Lee Jones <lee.jones@linaro.org>, Daniel Thompson <daniel.thompson@linaro.org>,
 Kevin Hilman <khilman@kernel.org>, Peter Ujfalusi <peter.ujfalusi@gmail.com>,
 Helge Deller <deller@gmx.de>, jmkrzyszt@gmail.com,
 Russell King <linux@armlinux.org.uk>, Krzysztof Kozlowski <krzk@kernel.org>,
 Alan Stern <stern@rowland.harvard.edu>, linux-serial@vger.kernel.org,
 linux-input@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>,
 Mark Brown <broonie@kernel.org>, dri-devel@lists.freedesktop.org,
 linux-omap@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 Felipe Balbi <balbi@kernel.org>, Paul Walmsley <paul@pwsan.com>,
 Jingoo Han <jingoohan1@gmail.com>, Dmitry Torokhov <dmitry.torokhov@gmail.com>,
 linux-mmc@vger.kernel.org, linux-kernel@vger.kernel.org,
 Vinod Koul <vkoul@kernel.org>, dmaengine@vger.kernel.org,
 alsa-devel@alsa-project.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On Tue, Apr 19, 2022 at 03:36:42PM +0200, Arnd Bergmann wrote:
> From: Arnd Bergmann <arnd@arndb.de>
> 
> This is the full series for converting OMAP1 to multiplatform, rebased
> from my 2019 attempt to do the same thing. The soc tree contains simpler
> patches to do the same for iop32x, ixp4xx, ep93xx and s3c24xx, which
> means we are getting closer to completing this for all ARMv5 platforms
> (I have patches for PXA, which is the last one remaining).
> 
> Janusz already tested the branch separately and did the missing work
> for the common-clk conversion after my previous approach was broken.

I tested the full series on the following OMAP1 boards: ams-delta,
nokia770, osk, palmte and sx1 (QEMU only).

Apart from the earlyprintk breakage, everything seemed to work OK.

A minor note, zImage grows about 50 KB with a minimal kernel config. This
is not yet critical, there's still about 7% headroom on 770 to the 2 MB
bootloader limit on my setup. Also the decompression time is approaching
the hardcoded watchdog timeout...

A.
