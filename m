Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 087E07A8434
	for <lists+dri-devel@lfdr.de>; Wed, 20 Sep 2023 15:56:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9F55E10E4BE;
	Wed, 20 Sep 2023 13:56:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madras.collabora.co.uk (madras.collabora.co.uk
 [IPv6:2a00:1098:0:82:1000:25:2eeb:e5ab])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8B7E610E4BE
 for <dri-devel@lists.freedesktop.org>; Wed, 20 Sep 2023 13:56:29 +0000 (UTC)
Received: from localhost (unknown [IPv6:2a01:e0a:2c:6930:5cf4:84a1:2763:fe0d])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: bbrezillon)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id B10F366071F1;
 Wed, 20 Sep 2023 14:56:27 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1695218188;
 bh=+7S4NMiv+np81ToK3JyeIZNiCivkP3XpM4WJFaNSwmo=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=MrdMhU5PgEMu5SqCLcujP0bdYtf0CnePgScpro5cDowAF1qFxYa1rl2T3J0Ulk457
 cTOFVpvjr3tr0wXrPtFKuhLM8oUMRb1IoMl95ivjeBNw+h8F7qIbthUsWJCIwZygTA
 tOkSuHUdPXUnN3WdSSDUhoMZrwLx/VCQjv/Lnj/UYDcm8IIwChXOtF7raqPA6pXzZ3
 E5l8A2zDltv2aRcDds256TYNTq3OEin7JK7hNSWWvxIpzbVIUh9m29S6m4PAtQ3jlE
 cZcAphZt9pWL/C5rZSpNPQox2sdLX3IK6UhAJirVloXfiIrpTggYckvR9d/bvYbQEY
 B6J6HDEgy93AQ==
Date: Wed, 20 Sep 2023 15:56:24 +0200
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Liviu Dudau <Liviu.Dudau@arm.com>
Subject: Re: [PATCH v2 14/15] dt-bindings: gpu: mali-valhall-csf: Add
 initial bindings for panthor driver
Message-ID: <20230920155624.1934eb34@collabora.com>
In-Reply-To: <ZQr2cTMz1-PsOMRP@e110455-lin.cambridge.arm.com>
References: <20230809165330.2451699-1-boris.brezillon@collabora.com>
 <20230809165330.2451699-15-boris.brezillon@collabora.com>
 <3517f2e9-d9d7-5bf8-1905-62f52d68c512@linaro.org>
 <ZQr2cTMz1-PsOMRP@e110455-lin.cambridge.arm.com>
Organization: Collabora
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
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
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Nicolas Boichat <drinkcat@chromium.org>,
 Daniel Stone <daniels@collabora.com>, devicetree@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Steven Price <steven.price@arm.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Rob Herring <robh+dt@kernel.org>,
 =?UTF-8?B?Q2zDqW1lbnQgUMOpcm9u?= <peron.clem@gmail.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, "Marty E .
 Plummer" <hanetzer@startmail.com>, Robin Murphy <robin.murphy@arm.com>,
 Faith Ekstrand <faith.ekstrand@collabora.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, 20 Sep 2023 14:41:05 +0100
Liviu Dudau <Liviu.Dudau@arm.com> wrote:

> > 
> > Please describe also power domains - constrains and names.  
> 
> I'm not sure the power domains and how to handle them have been
> entirely settled for Rockchip, hence why they were not included. Will
> check with Collabora to see if they have anything to add here,

On rk3588, it's just one power domain feeding all GPU blocks.

> but
> for non-Rockchip platforms (like Juno with FPGAs) the constraints
> are going to be different.
