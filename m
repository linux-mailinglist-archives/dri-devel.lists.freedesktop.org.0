Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7DAD4B48E42
	for <lists+dri-devel@lfdr.de>; Mon,  8 Sep 2025 14:55:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CC9AF10E519;
	Mon,  8 Sep 2025 12:55:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=mailbox.org header.i=@mailbox.org header.b="FE/1NCZ/";
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="Ro4eO/7x";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout-p-102.mailbox.org (mout-p-102.mailbox.org [80.241.56.152])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B0D1510E517
 for <dri-devel@lists.freedesktop.org>; Mon,  8 Sep 2025 12:55:32 +0000 (UTC)
Received: from smtp2.mailbox.org (smtp2.mailbox.org [10.196.197.2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mout-p-102.mailbox.org (Postfix) with ESMTPS id 4cL6Pb2tXmz9t2F;
 Mon,  8 Sep 2025 14:55:31 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org;
 s=mail20150812; t=1757336131;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=yRG2aT1HvLNlP84gvZXfdNfs7QVzon3rkDgX1JN5RmA=;
 b=FE/1NCZ/xuruaAdb7u06boqhNLaQ6MJC5hUTkz/8pgq3rRiYxWocpHQvbKbMciRizyTnQg
 O5n5V4oPaYjnztbXiA393PGANv9B2/nxVEzG9tYLfGaHxN1IDamwl1ORyJ1BeSjygIy1wo
 nbw3ubswKSyvbCTJTnUeLNFszUL+kltoXXuGgGZaL2jPQXzGVY2ao82RPRXKu5DzDGv3Dz
 pBPalNAnGfOm5Uw80p/H+qh4jF/Jra2Q4IezSzTuLxN/K2XQ2Jx6Y9NPQkuJ7c/3/mXdAS
 0kpwGafcT4XK9MOJKtIp7vch/lewiUqkzqt0ZaIPleq8soOxWkgemupPA+JErw==
Message-ID: <546b08d8-eb18-41eb-9fbf-4539a621ee5d@mailbox.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org;
 s=mail20150812; t=1757336129;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=yRG2aT1HvLNlP84gvZXfdNfs7QVzon3rkDgX1JN5RmA=;
 b=Ro4eO/7xZYnELe8jxADNs78pH056mM4QIK+4O2bKpVeF3z2l4p5bh+/qGmxUjeuvuAQyIc
 1tn5V8xLgYR7k3U4/6jAHFrPVUPTDKK2fvGRCxQWgfWgSwjNgAWyTtNBjPyCvn7DyKhR0y
 6v6QkJFYGev+qpdnMggZO2fR2105u6mbw7PQKj2blc92ccbyqbGLaf/2kaTSKX/+3ukJun
 7lpkfOkV2npmeKkyRT9bTYBjeL4J8zPKC50byInabIHAVS6zLN3vW/anqxhW01JAEzClI2
 xr4tdm4Vq2nzXdwCrf1Qol4lTik8MgB977Ka+d/dVwLzM3hqBkcqqYqBOl2tyg==
Date: Mon, 8 Sep 2025 14:55:26 +0200
MIME-Version: 1.0
Subject: Re: [PATCH v2] drm/rcar-du: dsi: Implement DSI command support
To: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>,
 Marek Vasut <marek.vasut+renesas@mailbox.org>
Cc: David Airlie <airlied@gmail.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
 Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Magnus Damm <magnus.damm@gmail.com>, Maxime Ripard <mripard@kernel.org>,
 Simona Vetter <simona@ffwll.ch>, Thomas Zimmermann <tzimmermann@suse.de>,
 linux-renesas-soc@vger.kernel.org, dri-devel@lists.freedesktop.org
References: <20250831190507.327848-1-marek.vasut+renesas@mailbox.org>
 <52a285d6-45bd-4ec2-a70b-8d0efe377780@ideasonboard.com>
Content-Language: en-US
From: Marek Vasut <marek.vasut@mailbox.org>
In-Reply-To: <52a285d6-45bd-4ec2-a70b-8d0efe377780@ideasonboard.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-MBO-RS-ID: dc96d6d5afe63086f6c
X-MBO-RS-META: or5wu7jiojd4ayax3ckj14io4mu5m9h1
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

On 9/8/25 8:55 AM, Tomi Valkeinen wrote:
> Hi,

Hello Tomi,

> On 31/08/2025 22:04, Marek Vasut wrote:
>> Implement support for DSI command transfer. Transmission of both Short
>> Packet and Long Packet is implemented, so is command transmission to
>> request response from peripheral device and transmission of non-read
>> command with BTA.
>>
>> The AXI memory access mode is currently not implemented, each transfer
>> is performed purely using controller register interface. Short Packet
>> transfer can transfer up to 2 Bytes of data, Long Packet transfer can
>> transfer up to 16 Bytes of data.
>>
>> Signed-off-by: Marek Vasut <marek.vasut+renesas@mailbox.org>
> 
> Looks good to me, pushing to drm-misc-next.
Thank you
