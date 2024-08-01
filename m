Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 14379944B53
	for <lists+dri-devel@lfdr.de>; Thu,  1 Aug 2024 14:31:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CF93610E0C6;
	Thu,  1 Aug 2024 12:31:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="kDe5rfuX";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3EC0A10E0C6
 for <dri-devel@lists.freedesktop.org>; Thu,  1 Aug 2024 12:31:53 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id ACA4860E8E;
 Thu,  1 Aug 2024 12:31:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B2212C4AF0A;
 Thu,  1 Aug 2024 12:31:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1722515512;
 bh=ZjQuBDumfc/DgkWQGmObSG2aAiMcovJ0npp+N3X9kwg=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=kDe5rfuXsj6HdkLVTT5zLVTRnJxyeVMzODaxsf1CrRy7PhL0LaD4drQqVKUBJvqM7
 lwojFwJAkMnmzVXKqdlHJXidx88D/9wN+jWMMnYdhR4jVDavvpgrzFcIAmgLrwgXxI
 PYmpoSnxLclazfAl8ndhtFEnx/WyF1RD0283anZZXv7OHNWX2WIFmTB+lMwQLOp/a4
 7JIwCmPyfFNuAdZeloplWCOCZErkWLJVRUfExIhkN3ApbQRmNeT8bjYN/ysitFaaEH
 xLEW20oMTmiU5YXZcyMPJsDo5BfURlOGiBzYN9IWSrtKrLuS6mlszGKBKI/xzMny9K
 +k7FOH2wYDjTg==
Date: Thu, 1 Aug 2024 13:31:47 +0100
From: Lee Jones <lee@kernel.org>
To: Martin =?utf-8?Q?Kepplinger-Novakovi=C4=87?=
 <martin.kepplinger-novakovic@ginzinger.com>
Cc: ukleinek@kernel.org, daniel.thompson@linaro.org, jingoohan1@gmail.com,
 linux-pwm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-fbdev@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] backlight: pwm_bl: print errno for probe errors
Message-ID: <20240801123147.GA6756@google.com>
References: <20240801091255.1410027-1-martin.kepplinger-novakovic@ginzinger.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240801091255.1410027-1-martin.kepplinger-novakovic@ginzinger.com>
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

On Thu, 01 Aug 2024, Martin Kepplinger-Novaković wrote:

> This makes debugging often easier.
> 
> Signed-off-by: Martin Kepplinger-Novaković <martin.kepplinger-novakovic@ginzinger.com>
> ---
>  drivers/video/backlight/pwm_bl.c | 9 ++++++---
>  1 file changed, 6 insertions(+), 3 deletions(-)

Please refrain from signing your mails like this.  It means that some of
us have to physically click a pop-up box as we are parsing our inboxes.

I'm deleting all mails in this thread.

-- 
Lee Jones [李琼斯]
