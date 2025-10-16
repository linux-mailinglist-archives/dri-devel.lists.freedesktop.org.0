Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A5872BE3CFF
	for <lists+dri-devel@lfdr.de>; Thu, 16 Oct 2025 15:54:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3465C10E070;
	Thu, 16 Oct 2025 13:54:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=mailbox.org header.i=@mailbox.org header.b="lRmlgsaI";
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="jOtp8sl1";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout-p-102.mailbox.org (mout-p-102.mailbox.org [80.241.56.152])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4995F10E070
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Oct 2025 13:54:16 +0000 (UTC)
Received: from smtp2.mailbox.org (smtp2.mailbox.org [10.196.197.2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mout-p-102.mailbox.org (Postfix) with ESMTPS id 4cnTvp6PTqz9tvL;
 Thu, 16 Oct 2025 15:54:14 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org;
 s=mail20150812; t=1760622854;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Y2HBKK+lNCbKDrWcJdy0h2VpjcQUt9CTc3J7LrF5Qas=;
 b=lRmlgsaIa/7h8SINAhXmChUj2YB9wyXnIXLuJUbBvFcFtFM6Z1Qf6Ck4U4+udI3uUb/7fz
 8ONWRIYmV8fdx9MEiVpKgo+n/SVfzhuHvO0Sok43h66pERURMVlEZKzEzqgvQQshi8zjfB
 f5iXBs98Nr6B43arcIHvJOTLue4gizh+tViz450mnQFtbYILqpDO+EkqjMW3yYco6U6OOq
 xXllFwJ8wn2gERcJ9fcanS3sJ8aErTdQ9BTJ0ZtF4NzZGEFzATPHCvMJbDbpmfHmRKDWUA
 yrMHZZrvr+gtUXzMSQgOtsSCiJeDRxBNvXiadhOWES9Cmph8n97YUoDUOZoOVQ==
Message-ID: <6f29d7af-a2e5-4412-9575-6368621c1178@mailbox.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org;
 s=mail20150812; t=1760622852;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Y2HBKK+lNCbKDrWcJdy0h2VpjcQUt9CTc3J7LrF5Qas=;
 b=jOtp8sl18MgTut+Y4wgoDFc1XuCY33E7GaPGIe/NoeC2xV8GdPQEdfR+NvBrxfuCMLJjhy
 QhOW5zWW/QerYcQwy8nRoTIhnE5Gd+SioDM/Vfykk4rRTcRrNoh3xeSKcucM3OIrR6eogB
 N6Ty9Jb4HUIR35HgX/7+Rm+n4wsmGF6WUhZTpCkM77pQX9ffyNIP9ScBes6q4CesDjm6G+
 k/yiVdUjpJ/Bjo5WakxM/bifEh6N+rcLaXJ7U4aya7Qb1AjjP+P8YA/E09xDfhFaX3lCDS
 qH0utF7lY6fWWtgoMmcBZBabfX8zyuO2sfAlTVRaEmD+Bq2yKkwzCcIndOqA1g==
Date: Thu, 16 Oct 2025 15:54:06 +0200
MIME-Version: 1.0
Subject: Re: [PATCH v2 2/3] arm64: dts: renesas: r8a77960: Add GX6250 GPU node
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Marek Vasut <marek.vasut+renesas@mailbox.org>,
 linux-arm-kernel@lists.infradead.org,
 =?UTF-8?Q?Niklas_S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>,
 Adam Ford <aford173@gmail.com>, Conor Dooley <conor+dt@kernel.org>,
 David Airlie <airlied@gmail.com>, Frank Binns <frank.binns@imgtec.com>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Magnus Damm <magnus.damm@gmail.com>, Matt Coster <matt.coster@imgtec.com>,
 Maxime Ripard <mripard@kernel.org>, Rob Herring <robh@kernel.org>,
 Simona Vetter <simona@ffwll.ch>, Thomas Zimmermann <tzimmermann@suse.de>,
 devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-renesas-soc@vger.kernel.org
References: <20251015153952.185249-1-marek.vasut+renesas@mailbox.org>
 <20251015153952.185249-2-marek.vasut+renesas@mailbox.org>
 <CAMuHMdVdW+tMA1=g9D+BQV0fk0kis8FzyQgf7BpN-u=pi5eQfA@mail.gmail.com>
 <51ff107d-126d-4481-b94a-f614f31c7bb8@mailbox.org>
 <CAMuHMdW+_1NZYdXrGsNcHkuvh_ym9148BRB+d0Wbz1oZrpWCdg@mail.gmail.com>
Content-Language: en-US
From: Marek Vasut <marek.vasut@mailbox.org>
In-Reply-To: <CAMuHMdW+_1NZYdXrGsNcHkuvh_ym9148BRB+d0Wbz1oZrpWCdg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-MBO-RS-ID: fac68e465852b1d1530
X-MBO-RS-META: x89kt9745ids3mra6uq13s18do64hp1c
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

On 10/16/25 12:14 PM, Geert Uytterhoeven wrote:

Hello Geert,

>> which are also never disabled, do we want to disable the GPU by default
>> and enable per-board ?
> 
> Yes please. We do the same with renesas,*-mali GPU nodes.
> The board may not even have graphical output.
> Or do you envision using the GPU for more general and headless operation?

The GPU does have GP-GPU compute shader, so even headless system can do 
compute on the GPU.

>> I would argue the GPU should be enabled by default, so the GPU driver
>> can do a proper power management of the GPU. If firmware is missing, at
>> least power it off on failed probe, if nothing else.
> 
> The *_PD_3DG_* domains are powered down anyway when unused.

If the driver was bound to the GPU node, then the domain would be surely 
powered down in control of the Linux kernel driver, without depending on 
the prior stage to leave it powered down.

I think it is in fact better to bind the GPU driver to the GPU IP and 
let the GPU driver power manage the GPU in a well defined manner, 
instead of depending on the prior stage to leave the GPU in some 
specific state ?

-- 
Best regards,
Marek Vasut
