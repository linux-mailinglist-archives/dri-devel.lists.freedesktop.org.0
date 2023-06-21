Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 51A8C738CEA
	for <lists+dri-devel@lfdr.de>; Wed, 21 Jun 2023 19:19:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CA6D210E32E;
	Wed, 21 Jun 2023 17:19:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 36C8A10E2EC
 for <dri-devel@lists.freedesktop.org>; Wed, 21 Jun 2023 17:19:11 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 0F6A66160B;
 Wed, 21 Jun 2023 17:19:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4535DC433C8;
 Wed, 21 Jun 2023 17:19:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1687367949;
 bh=ohs90axjGL2P+Qq4eDlVdKf2VcnUUb1Drl3OZZKM5rw=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=mo3yHvfUGXMmPm7yRXI9pIucRki7M1yHZyZQc5gQ+uaZ96t0LWOg8+/XnVmdiqQxI
 vCm9wkQw5xmBeNMAg4zIj9xwmieebtgET7eiwmdsWfY/3YMVF0ojERE1hUr+AlLwdb
 YXzM2wKoHkaD8ud+keYPNpBti7HFH/dZ0fjAFQJc+E0pG50G8scBMr+ZuOLmLoi1pO
 r1+KJGXglZRxFCENeax8jC7DkDYuQHy4EOlIdQlimmdIjddU85MEuLVwHczZTrf2k+
 +xjxNw8Ck2YeDaAJKYheb1YMXhECLrMFnB5J6SEowhlz3LWqjfBgVkwx3ZdhYloaOE
 j4U48zkCBANvg==
Date: Wed, 21 Jun 2023 18:19:04 +0100
From: Lee Jones <lee@kernel.org>
To: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH] dt-bindings: backlight: kinetic,ktz8866: Add missing
 type for "current-num-sinks"
Message-ID: <20230621171904.GO10378@google.com>
References: <20230613201022.2823392-1-robh@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230613201022.2823392-1-robh@kernel.org>
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
Cc: devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>,
 Pavel Machek <pavel@ucw.cz>, Jingoo Han <jingoohan1@gmail.com>,
 Daniel Thompson <daniel.thompson@linaro.org>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Jianhua Lu <lujianhua000@gmail.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 linux-leds@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, 13 Jun 2023, Rob Herring wrote:

> "current-num-sinks" is missing a type, add it.
> 
> Signed-off-by: Rob Herring <robh@kernel.org>
> ---
>  .../devicetree/bindings/leds/backlight/kinetic,ktz8866.yaml      | 1 +
>  1 file changed, 1 insertion(+)

Applied, thanks

-- 
Lee Jones [李琼斯]
