Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D5777F6221
	for <lists+dri-devel@lfdr.de>; Thu, 23 Nov 2023 15:54:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CF29C10E767;
	Thu, 23 Nov 2023 14:54:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 51E0010E767
 for <dri-devel@lists.freedesktop.org>; Thu, 23 Nov 2023 14:54:51 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by ams.source.kernel.org (Postfix) with ESMTP id E9020B82D4A;
 Thu, 23 Nov 2023 14:54:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B8D66C433C8;
 Thu, 23 Nov 2023 14:54:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1700751289;
 bh=WVecSFWfBVZt7eHFDKvJJUv63uzdwj5MUayfwitPJng=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=UI1vN4bXnDluSjqdzluU7xIHm1q2q0PduZMPaBxZJNaJFOJ8QeiJY2xs9hZwjej8A
 +PbvFS5rsJlmivgH6c6kLlwfzU6HhVXxgudulfWfC2pJDrSa30qmQ831rZziWqvWTX
 0ZTeDoyQb73HrG4lHjq1NZh6KXTWZMBa2cm9AhRBC4zXO5gZahAWOjQPKE5H3gS61W
 4M+KsuvhlrywqvebBe9DXy3Z1A021BSGy9Gacewbag8698aktWkWy1RXzeOHVrcVDM
 dadaNEHK6UkxJZAFziVEce8EvU2ezt2howCEwqd9Y5gCbiOKkE+yo7VgBYK2nGyQ22
 sQUNpIgoP94DA==
From: Lee Jones <lee@kernel.org>
To: Lee Jones <lee@kernel.org>, Daniel Thompson <daniel.thompson@linaro.org>, 
 Jingoo Han <jingoohan1@gmail.com>, Helge Deller <deller@gmx.de>, 
 Pavel Machek <pavel@ucw.cz>, Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>, Flavio Suligoi <f.suligoi@asem.it>
In-Reply-To: <20231116105319.957600-1-f.suligoi@asem.it>
References: <20231116105319.957600-1-f.suligoi@asem.it>
Subject: Re: [PATCH v7 0/2] backlight: mp3309c: Add support for MPS MP3309C
Message-Id: <170075128649.1369133.8551722036774346120.b4-ty@kernel.org>
Date: Thu, 23 Nov 2023 14:54:46 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.12.3
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
Cc: devicetree@vger.kernel.org, linux-fbdev@vger.kernel.org,
 linux-leds@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, 16 Nov 2023 11:53:17 +0100, Flavio Suligoi wrote:
> This patchset (rebased on v6.7.0-rc1 kernel version):
> 
> - includes and updates the mps,mp3309c.yaml dt bindings file:
>     - Documentation/devicetree/bindings/leds/backlight/mps,mp3309c.yaml
>     Note: the patch related to this file was previously a separate patch
>           and sent in two versions (v1 and v2).
>           It has now been included in this patchset, starting with the
>           version v6.
> - adds the related device driver to support the MPS MP3309C backlight chip
> - adds missed history of previous versions
> - adds missed "Acked-by" and "Reviewed-by" added in previous versions
> 
> [...]

Applied, thanks!

[1/2] dt-bindings: backlight: mp3309c: remove two required properties
      commit: 87f33a1b8f7e3d223fc331fe54fd8ec337dc9cb9
[2/2] backlight: mp3309c: Add support for MPS MP3309C
      commit: 2e914516a58cf86bd0e42c7d3e25c81d44ec2ab8

--
Lee Jones [李琼斯]

