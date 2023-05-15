Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D6B04702DD4
	for <lists+dri-devel@lfdr.de>; Mon, 15 May 2023 15:17:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D690810E1D1;
	Mon, 15 May 2023 13:17:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C8AD710E1D1
 for <dri-devel@lists.freedesktop.org>; Mon, 15 May 2023 13:17:44 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 7B72B61EEE;
 Mon, 15 May 2023 13:17:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 647A5C433D2;
 Mon, 15 May 2023 13:17:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1684156662;
 bh=ptDRNornCJGXOlGr4nU5vrPyK26ECBlQszQEugZstUQ=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=iws3ptO9Y43Dk6Huf+l2QWXtv3DcWcG6tiJSo117mnlxgnUXpX9DIQWm2GgA35dow
 aUd+0SANkCLuUna5px+0qnwTMsaBBx+Cv9+aZdhEmZ/ivDLExQXbs/i72ZQQESqghj
 B789wdoeWb+9ic8yh9M3A0QKsplQj67+tN2MZ29vW5Ffdl5TeoQe7qlipSKIjFMvD+
 dAMc040gh6y4QdqgxL3u5lOTqpmxBdTIoZvx9diD2tkT74GJVrzQqDy4w77Nwg7AgY
 61tRB7ZPEBJ/kp1qbE/OBdF8Pd4e1f4CgNdRyN+Al0wCx3O2G8KHmsKtKdKIXGW8Gg
 EC9woxkEF1JsQ==
Date: Mon, 15 May 2023 14:17:37 +0100
From: Lee Jones <lee@kernel.org>
To: Jianhua Lu <lujianhua000@gmail.com>
Subject: Re: [PATCH] dt-bindings: leds: backlight: ktz8866: Add reg property
 and update example
Message-ID: <20230515131737.GG10825@google.com>
References: <20230428160246.16982-1-lujianhua000@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230428160246.16982-1-lujianhua000@gmail.com>
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
Cc: devicetree@vger.kernel.org, Daniel Thompson <daniel.thompson@linaro.org>,
 Pavel Machek <pavel@ucw.cz>, Jingoo Han <jingoohan1@gmail.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Rob Herring <robh+dt@kernel.org>, ~postmarketos/upstreaming@lists.sr.ht,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 phone-devel@vger.kernel.org, linux-leds@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sat, 29 Apr 2023, Jianhua Lu wrote:

> The kinetic,ktz8866 is a I2C driver, so add the missing reg property.
> And update example to make it clear.
> 
> Signed-off-by: Jianhua Lu <lujianhua000@gmail.com>
> ---
>  .../leds/backlight/kinetic,ktz8866.yaml       | 29 ++++++++++++-------
>  1 file changed, 19 insertions(+), 10 deletions(-)

Applied, thanks

-- 
Lee Jones [李琼斯]
