Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 109A38AD06A
	for <lists+dri-devel@lfdr.de>; Mon, 22 Apr 2024 17:16:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E5ACE112BD4;
	Mon, 22 Apr 2024 15:16:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="enGF0Iz9";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CF6C3112BD4
 for <dri-devel@lists.freedesktop.org>; Mon, 22 Apr 2024 15:16:12 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id 43D5DCE0B8B;
 Mon, 22 Apr 2024 15:16:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2EEB5C113CC;
 Mon, 22 Apr 2024 15:16:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1713798969;
 bh=oWN+0l+LEe/3h6Zg53QjSZjOcE/lb11ML3Q3pZFIQO8=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=enGF0Iz9HE1C83Y3grLgXU2NPX2wxn0mVkwplwWYhK8cJ24odwWSmBDwRG/3V+Isy
 by11fSso2EUDP7CCfxSgeVKNlid1joON1Sq6FCjtXwF6bdrcEBo5FJMz3/MbwIjqJf
 h+jny/CxbHG35d2B2DUE32xwXNkmBk0XYixF2ewz5QINZlNBpLuw6fylGvW7Ct1oiW
 G955ZWI1eARiDKCWdkEedl2f6d2SboDZmn1c4PtqTcQqejKy+iJSWmaviB5Xkccfbk
 OQkb/Eravs+V+hMome5F4k1ZmbQEmhYL/J0pqg+ecOrWoy7aYTe9K9fPghQpY/60dQ
 1nGsHaYmSz97w==
Date: Mon, 22 Apr 2024 10:16:07 -0500
From: Rob Herring <robh@kernel.org>
To: Cong Yang <yangcong5@huaqin.corp-partner.google.com>
Cc: sam@ravnborg.org, neil.armstrong@linaro.org, daniel@ffwll.ch,
 dianders@chromium.org, linus.walleij@linaro.org,
 krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org,
 airlied@gmail.com, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 xuxinxiong@huaqin.corp-partner.google.com
Subject: Re: [PATCH v2 4/7] dt-bindings: display: panel: Add compatible for
 BOE nv110wum-l60
Message-ID: <20240422151607.GA1277508-robh@kernel.org>
References: <20240422090310.3311429-1-yangcong5@huaqin.corp-partner.google.com>
 <20240422090310.3311429-5-yangcong5@huaqin.corp-partner.google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240422090310.3311429-5-yangcong5@huaqin.corp-partner.google.com>
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

On Mon, Apr 22, 2024 at 05:03:07PM +0800, Cong Yang wrote:
> The BOE nv110wum-l60 is a 11.0" WUXGA TFT LCD panel, which fits in nicely
> with the existing himax-hx83102 driver. 

From a h/w perspective, the reason to share the binding is the same 
underlying controller, himax hx83102, is used, not that it is the same 
driver.

Rob
