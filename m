Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EDDF96BD4C8
	for <lists+dri-devel@lfdr.de>; Thu, 16 Mar 2023 17:13:12 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E8E9C10ED3E;
	Thu, 16 Mar 2023 16:13:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4EBB510ED3B
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Mar 2023 16:13:09 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id CC69362082;
 Thu, 16 Mar 2023 16:13:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6BDD8C433EF;
 Thu, 16 Mar 2023 16:13:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1678983188;
 bh=g27dXTqF8cc5+DL08sOcgF0turBJEsDQXiN7ampWypE=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Rd/ImrvcXUQDHjMU2hEvZYEUn8o7nc7Is9kO+QZpGHJzwR5bM33QjOYGKec3ivP1d
 rOLpSXpfPwZ1dvknhlBJzDJk7Ui/iETMh5oext1RfIJSGS89Uw3MY5BV66S5NyEh3Z
 2O9QSpqZ93ls0UKwx8UIvh1TKAVgva9g7DslpD8jyzrBpQwVwdtWPPgJ2xN5SuxdgT
 sykJAWRFRAer5w3pqX23pTQKUsghKboh8TsMcyLK3+rhYDML8n60m96d0h1ME3PExa
 85s0QFkbF++9TqOjFGIys979iXGzqQhkh61P964QN7jpDtOBQRIBP76uG2pJ+Hu6Hg
 eXZEvN9Aet15A==
Date: Thu, 16 Mar 2023 16:13:02 +0000
From: Lee Jones <lee@kernel.org>
To: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH] backlight: as3711: Use of_property_read_bool() for
 boolean properties
Message-ID: <20230316161302.GT9667@google.com>
References: <20230310144731.1546190-1-robh@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230310144731.1546190-1-robh@kernel.org>
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
 Jingoo Han <jingoohan1@gmail.com>, Helge Deller <deller@gmx.de>,
 linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, 10 Mar 2023, Rob Herring wrote:

> It is preferred to use typed property access functions (i.e.
> of_property_read_<type> functions) rather than low-level
> of_get_property/of_find_property functions for reading properties.
> Convert reading boolean properties to to of_property_read_bool().
>
> Signed-off-by: Rob Herring <robh@kernel.org>
> ---
>  drivers/video/backlight/as3711_bl.c | 24 ++++++++++++------------
>  1 file changed, 12 insertions(+), 12 deletions(-)

Applied, thanks

--
Lee Jones [李琼斯]
