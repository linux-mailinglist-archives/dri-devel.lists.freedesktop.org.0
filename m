Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 416E4B41656
	for <lists+dri-devel@lfdr.de>; Wed,  3 Sep 2025 09:22:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 702F810E3E1;
	Wed,  3 Sep 2025 07:22:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.b="bXhMGpGc";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 541 seconds by postgrey-1.36 at gabe;
 Wed, 03 Sep 2025 07:22:25 UTC
Received: from codeconstruct.com.au (pi.codeconstruct.com.au [203.29.241.158])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CD7D810E3E1
 for <dri-devel@lists.freedesktop.org>; Wed,  3 Sep 2025 07:22:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=codeconstruct.com.au; s=2022a; t=1756883600;
 bh=+SKJ2DOUnv0ju3m2fzI2NEnnUJ6bjzNIYaMHRG/U5d0=;
 h=Subject:From:To:Cc:Date:In-Reply-To:References;
 b=bXhMGpGcvrD3ixFoy8jvslo3iAJXogAk94gfIIvFFVj1de2p9FgC/vf5/POKe6Syj
 nxxTdvMzr4VnovLF2eSUuNrXUUr5c1m36Tpy7b0ioL3PuRqTq4UEMY04n7seQX6fYq
 eIzMmkXixGU9NhG/jShBOyf726SUtmW3ojaX2hjyzruvVAV2VVj6ne7mZ08Rum+Tny
 3hD+U1cbT8nVea/WZLXNEnco2SkNMzqtwbpz07c1mu69zWt8WhR94sMO5IxG8scl5m
 PNQK2r9wcKupbD847qT0eV1lqYHMyXp8EpL1YaOVvNtTPxfUzQiGPw+hBLzekJhx+n
 wp8lEpQ1rGSmw==
Received: from [10.209.99.88] (unknown [180.150.112.213])
 by mail.codeconstruct.com.au (Postfix) with ESMTPSA id BFE386445D;
 Wed,  3 Sep 2025 15:13:15 +0800 (AWST)
Message-ID: <613456d8ec80c29c6332c8a047bfe2a108dd2e65.camel@codeconstruct.com.au>
Subject: Re: [PATCH] dt-bindings: gpu: Convert aspeed,ast2400-gfx to DT schema
From: Andrew Jeffery <andrew@codeconstruct.com.au>
To: "Rob Herring (Arm)" <robh@kernel.org>, Joel Stanley <joel@jms.id.au>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard
 <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, David Airlie
 <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Krzysztof Kozlowski
 <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Lee Jones
 <lee@kernel.org>
Cc: linux-aspeed@lists.ozlabs.org, dri-devel@lists.freedesktop.org, 
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org
Date: Wed, 03 Sep 2025 16:43:14 +0930
In-Reply-To: <20250829230442.1495926-1-robh@kernel.org>
References: <20250829230442.1495926-1-robh@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.4-2 
MIME-Version: 1.0
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

On Fri, 2025-08-29 at 18:04 -0500, Rob Herring (Arm) wrote:
> Convert the ASpeed GFX Display Controller binding to DT schema format.
> There was a duplicate, incomplete binding in mfd which can be dropped.
>=20
> Signed-off-by: Rob Herring (Arm) <robh@kernel.org>

Reviewed-by: Andrew Jeffery <andrew@codeconstruct.com.au>

Thanks Rob.
