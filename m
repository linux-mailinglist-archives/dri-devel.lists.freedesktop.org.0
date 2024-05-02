Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A09448B9ED9
	for <lists+dri-devel@lfdr.de>; Thu,  2 May 2024 18:48:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B52A210E394;
	Thu,  2 May 2024 16:48:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="Ir5mxJnj";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D459A10E394
 for <dri-devel@lists.freedesktop.org>; Thu,  2 May 2024 16:48:21 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id C7D77CE168E;
 Thu,  2 May 2024 16:48:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2B002C113CC;
 Thu,  2 May 2024 16:48:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1714668497;
 bh=wNDnU38OrwB2elGxkleTWMYW3InPgN3uSRSVCxbvH6s=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=Ir5mxJnjLXguyI7fGVg3eUd2HSK4jptyW4KlKHhXd+fWejI6L9F/kOodlKSwi5JOD
 gV5ELtHOv4EHZlWgv3CBS5OC54KSVu9WsKMGbUYxLAXcA4Adf1Z3Q5R96f/td4j7BO
 B2xG6/aobzeSrkZIBE3DwTTgUcNU5uQETJDH3qGA+hOvygOGHovvrFo1nz/AWhZU1T
 hl3Bx9cNW2eGX/50cN6Aq/gdkUuXaa2FNRmkwaWsKApdt7AH9CIChImRfVgPKOLPw6
 vsWRbws3/+EOaOBfCKXXmauH6xT1JVC0O4VuXP5RBFaRIYdHyNITvi2gyt3TgWiWN0
 v9uaTOfsPNhTw==
From: Lee Jones <lee@kernel.org>
To: Lee Jones <lee@kernel.org>, Daniel Thompson <daniel.thompson@linaro.org>, 
 Jingoo Han <jingoohan1@gmail.com>, Helge Deller <deller@gmx.de>, 
 Dan Carpenter <dan.carpenter@linaro.org>, 
 Flavio Suligoi <f.suligoi@asem.it>
Cc: dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org, 
 linux-kernel@vger.kernel.org
In-Reply-To: <20240417153105.1794134-2-f.suligoi@asem.it>
References: <20240417153105.1794134-1-f.suligoi@asem.it>
 <20240417153105.1794134-2-f.suligoi@asem.it>
Subject: Re: (subset) [PATCH v1 1/1] backlight: mp3309c: fix leds
 flickering in pwm mode
Message-Id: <171466849494.1206441.17324969195592920195.b4-ty@kernel.org>
Date: Thu, 02 May 2024 17:48:14 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.12.4
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

On Wed, 17 Apr 2024 17:31:05 +0200, Flavio Suligoi wrote:
> The mp3309 has two configuration registers, named according to their
> address (0x00 and 0x01).
> In the second register (0x01), the bit DIMS (Dimming Mode Select) must
> be always 0 (zero), in both analog (via i2c commands) and pwm dimming
> mode.
> 
> In the initial driver version, the DIMS bit was set in pwm mode and
> reset in analog mode.
> But if the DIMS bit is set in pwm dimming mode and other devices are
> connected on the same i2c bus, every i2c commands on the bus generates a
> flickering on the LEDs powered by the mp3309c.
> 
> [...]

Applied, thanks!

[1/1] backlight: mp3309c: fix leds flickering in pwm mode
      commit: ce60cddc2abf61902dfca71d630624db95315124

--
Lee Jones [李琼斯]

