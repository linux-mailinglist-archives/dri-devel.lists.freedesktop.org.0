Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A0E638B9EDD
	for <lists+dri-devel@lfdr.de>; Thu,  2 May 2024 18:49:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1C4C710F6B0;
	Thu,  2 May 2024 16:49:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="B9jc74OP";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D2C0A10F6B0
 for <dri-devel@lists.freedesktop.org>; Thu,  2 May 2024 16:48:59 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id AE09E61B86;
 Thu,  2 May 2024 16:48:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7C6B0C4AF14;
 Thu,  2 May 2024 16:48:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1714668538;
 bh=6KSW55LKrRMaLuZTWE2c+MuzCl3d3O1DhTlxbvZ2JOc=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=B9jc74OP9o36h9eW28C1v+9ASBIYZVP17c1rbyhjlN+tm/BtN0ttPRjAtTGrLdJmn
 sJ9Lxxa6d9V4ar4afrdx8JuGN/m6sNRB3oNc4qS7L5Fg+i08TLm9FKOkZ73G78YH5g
 CPxx8DvpGBSZ7m//fmNKO8SMHK5dqv50PHCNDMNysfmGnaMFy+ZPsSTFYXhbUny71p
 IddfpncgZfgxa1EGeHC+P1t2JF0Be0inNgaSMBE8r0KuomUDtN47BRa1Yz/GiVCQhw
 cJSoesmxBtR6Od6CDGmYMHJkUqM2rPjX/R1GqkcTMOmd0+j3SVGZ0Wr19gKy+Y3LHE
 nJBeMzQ+XGctA==
Date: Thu, 2 May 2024 17:48:53 +0100
From: Lee Jones <lee@kernel.org>
To: Daniel Thompson <daniel.thompson@linaro.org>,
 Jingoo Han <jingoohan1@gmail.com>, Helge Deller <deller@gmx.de>,
 Dan Carpenter <dan.carpenter@linaro.org>,
 Flavio Suligoi <f.suligoi@asem.it>
Cc: dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: Re: (subset) [PATCH v1 1/1] backlight: mp3309c: fix leds flickering
 in pwm mode
Message-ID: <20240502164853.GB1200070@google.com>
References: <20240417153105.1794134-1-f.suligoi@asem.it>
 <20240417153105.1794134-2-f.suligoi@asem.it>
 <171466849494.1206441.17324969195592920195.b4-ty@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <171466849494.1206441.17324969195592920195.b4-ty@kernel.org>
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

On Thu, 02 May 2024, Lee Jones wrote:

> On Wed, 17 Apr 2024 17:31:05 +0200, Flavio Suligoi wrote:
> > The mp3309 has two configuration registers, named according to their
> > address (0x00 and 0x01).
> > In the second register (0x01), the bit DIMS (Dimming Mode Select) must
> > be always 0 (zero), in both analog (via i2c commands) and pwm dimming
> > mode.
> > 
> > In the initial driver version, the DIMS bit was set in pwm mode and
> > reset in analog mode.
> > But if the DIMS bit is set in pwm dimming mode and other devices are
> > connected on the same i2c bus, every i2c commands on the bus generates a
> > flickering on the LEDs powered by the mp3309c.
> > 
> > [...]
> 
> Applied, thanks!
> 
> [1/1] backlight: mp3309c: fix leds flickering in pwm mode
>       commit: ce60cddc2abf61902dfca71d630624db95315124

Applied, but in future it's; I2C, PWM and LED, thanks.

-- 
Lee Jones [李琼斯]
