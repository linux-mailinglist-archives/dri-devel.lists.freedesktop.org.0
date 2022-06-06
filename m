Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A35C53E014
	for <lists+dri-devel@lfdr.de>; Mon,  6 Jun 2022 05:33:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ACB2410E7FA;
	Mon,  6 Jun 2022 03:33:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 22AD910E7FA
 for <dri-devel@lists.freedesktop.org>; Mon,  6 Jun 2022 03:33:54 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 5A8C760EE6;
 Mon,  6 Jun 2022 03:33:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 18083C341C0;
 Mon,  6 Jun 2022 03:33:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1654486430;
 bh=TI4P18/3vyoUu1YoM1I93ZEGQv/UWUtMjgpV3is+1kU=;
 h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
 b=tFJZusU1hxG2s1CJAu/uiv0E+bAvVegQhojDIoAHyJhGf2CpfQHdYfd63OYaXP0/3
 tl9nzWxkaafABij8lqsZ5MrgoRiCJkmKhT6mUps3kQJJUcarzBWjvqhX+nnzU7KuuH
 M1sITb9nLev16/CnmDOBLDR9sft1NqYa56mDK6TYh+XhuSxzBGaz00U17pkjsv1ykO
 1xbqro3byn4WFq2ZXjDSp5Mx6gkf+iadKrRgaEInhfU6CUJOoXak/Exda99R6yHsRc
 ZpeQ/WkQ7MtuWXRB2kZKovQ5cRR+ulL6ulkGtXTJWKxLQIUAMOP2Du9HlLMaTPj68u
 6fltf6QTe+EWQ==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org
 (localhost.localdomain [127.0.0.1])
 by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id
 E9551E737F0; Mon,  6 Jun 2022 03:33:49 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH] dt-bindings: Fix properties without any type
From: patchwork-bot+chrome-platform@kernel.org
Message-Id: <165448642995.20111.10251737230487275413.git-patchwork-notify@kernel.org>
Date: Mon, 06 Jun 2022 03:33:49 +0000
References: <20220519211411.2200720-1-robh@kernel.org>
In-Reply-To: <20220519211411.2200720-1-robh@kernel.org>
To: Rob Herring <robh@kernel.org>
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
Cc: alsa-devel@alsa-project.org, linux-usb@vger.kernel.org,
 linux-pci@vger.kernel.org, dri-devel@lists.freedesktop.org,
 thierry.reding@gmail.com, groeck@chromium.org, sam@ravnborg.org,
 chrome-platform@lists.linux.dev, herbert@gondor.apana.org.au, brgl@bgdev.pl,
 linux-serial@vger.kernel.org, linux-input@vger.kernel.org, kuba@kernel.org,
 pabeni@redhat.com, linux-media@vger.kernel.org, devicetree@vger.kernel.org,
 linux-pm@vger.kernel.org, kvalo@kernel.org, linux-gpio@vger.kernel.org,
 broonie@kernel.org, mpm@selenic.com, bhelgaas@google.com, mchehab@kernel.org,
 linux-arm-kernel@lists.infradead.org, gregkh@linuxfoundation.org,
 dmitry.torokhov@gmail.com, sre@kernel.org, peda@axentia.se,
 linux-crypto@vger.kernel.org, netdev@vger.kernel.org, krzk+dt@kernel.org,
 davem@davemloft.net
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hello:

This patch was applied to chrome-platform/linux.git (for-next)
by Rob Herring <robh@kernel.org>:

On Thu, 19 May 2022 16:14:11 -0500 you wrote:
> Now that the schema tools can extract type information for all
> properties (in order to decode dtb files), finding properties missing
> any type definition is fairly trivial though not yet automated.
> 
> Fix the various property schemas which are missing a type. Most of these
> tend to be device specific properties which don't have a vendor prefix.
> A vendor prefix is how we normally ensure a type is defined.
> 
> [...]

Here is the summary with links:
  - dt-bindings: Fix properties without any type
    https://git.kernel.org/chrome-platform/c/4e71ed985389

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


