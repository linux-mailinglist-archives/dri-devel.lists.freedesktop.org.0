Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 852B19078A0
	for <lists+dri-devel@lfdr.de>; Thu, 13 Jun 2024 18:48:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 50DE010E130;
	Thu, 13 Jun 2024 16:48:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="jFIsMXMs";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 712E110EAF4
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Jun 2024 16:48:11 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id 1B936CE266F;
 Thu, 13 Jun 2024 16:48:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 33A62C2BBFC;
 Thu, 13 Jun 2024 16:48:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1718297285;
 bh=AJl67d8slnynIjtfzAGyDRCCHUC9dNMUzxCpIOQc+nk=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=jFIsMXMsqyze/Z8v8/dCBH6z8+PH7v0VhR21enZw/mKLXpd2yA5UKmd9ZI+HmmHOr
 SlS/6ZqRAW4O9bgxtS7vHQGsxDBZ4oyWpjTK9LGu7MrDOYhmLl6hR9DsJjPxcWbt17
 jm7fV9vzwQ/Ht77V8LZikuWrBANBwzKZHiXgA1QnUwafXf9+gZGg2dGIZvdGh572nI
 8u3i5uFK3JkwYfaOsmzE8HeUgpZrNXk84jgmjHfzD9cV8Z5vGeDsxWdLkKURfMp3B9
 BJaqQV6OtfVwLFHf22SBJKPlh/3Si7zG2rqhnV4WsU8f+zm9AykHp+hDypM+FqhBSC
 xzI6Zn5PMI42A==
From: Lee Jones <lee@kernel.org>
To: Patrick Gansterer <paroga@paroga.com>, 
 Dan Carpenter <dan.carpenter@linaro.org>
Cc: Daniel Thompson <daniel.thompson@linaro.org>, 
 Jingoo Han <jingoohan1@gmail.com>, Helge Deller <deller@gmx.de>, 
 dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org, 
 linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org
In-Reply-To: <187b5bc5-a010-46c2-8ead-980df9efae79@moroto.mountain>
References: <187b5bc5-a010-46c2-8ead-980df9efae79@moroto.mountain>
Subject: Re: (subset) [PATCH] backlight: lm3509_bl: Fix NULL vs IS_ERR()
 check in register() function
Message-Id: <171829728292.2711571.6119910061158578189.b4-ty@kernel.org>
Date: Thu, 13 Jun 2024 17:48:02 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.13.0
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

On Thu, 06 Jun 2024 16:10:23 +0300, Dan Carpenter wrote:
> The devm_backlight_device_register() doesn't return NULL, it returns
> error pointers.  Update the error checking to match.
> 
> 

Applied, thanks!

[1/1] backlight: lm3509_bl: Fix NULL vs IS_ERR() check in register() function
      commit: 90b7f2ead953aab5677ae8235d78841cee8fd13e

--
Lee Jones [李琼斯]

