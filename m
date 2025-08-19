Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A2F25B2BA19
	for <lists+dri-devel@lfdr.de>; Tue, 19 Aug 2025 09:04:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0BB9610E53B;
	Tue, 19 Aug 2025 07:04:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="NnZMMbnw";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2366010E53B
 for <dri-devel@lists.freedesktop.org>; Tue, 19 Aug 2025 07:04:03 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 6230B42B5F;
 Tue, 19 Aug 2025 07:04:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A4C4EC4CEF1;
 Tue, 19 Aug 2025 07:04:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1755587042;
 bh=0vu8uRD5MfWdeKle5bX1tsYUWtyclem5Lnk7ypt5keg=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=NnZMMbnwDepMMdrzLL0FMHs8XKjuH5O8zJJAb02gh1zm3KVMS5Iyz4ddN6dtYDmgb
 3ZnAY1SlabTIbOpmE5n+IaNdm2Agt8dnsRW1v7je2PzwjLhq+nEFKo7L7q0KWw3oYV
 5zkL5w/4XaH89lzmtb0edWZHdmM/2HeXuXXr/AOzK1kkdD1pkIseS7lD8eBc+3xNjE
 lM0d/N4EbS6wQunxFhA/6AC++33/wfQuaaym34QvX4ptZWeFc/fqIFgBuKRm9DKajq
 QRiB8P76JiVVr6IYwfQLD0CrSBvmkXHQBEQgSDhgswbpI4Ecfv4S/mDhYDQ6aHKAxA
 KYIfsXE+JOAIA==
Date: Tue, 19 Aug 2025 09:03:58 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Mike Looijmans <mike.looijmans@topic.nl>
Cc: dri-devel@lists.freedesktop.org, 
 Andrzej Hajda <andrzej.hajda@intel.com>, David Airlie <airlied@gmail.com>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, Jonas Karlman <jonas@kwiboo.se>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
 Robert Foss <rfoss@kernel.org>, Simona Vetter <simona@ffwll.ch>, 
 Thomas Zimmermann <tzimmermann@suse.de>, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 2/2] drm: bridge: Add TI tmds181 and sn65dp159 driver
Message-ID: <20250819-asparagus-dogfish-of-greatness-ab089e@kuoka>
References: <20250819053205.9976-1-mike.looijmans@topic.nl>
 <1b153bce-a66a-45ee-a5c6-963ea6fb1c82.949ef384-8293-46b8-903f-40a477c056ae.9365be0b-205e-4d59-ad18-c1924bf45277@emailsignatures365.codetwo.com>
 <20250819053205.9976-3-mike.looijmans@topic.nl>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250819053205.9976-3-mike.looijmans@topic.nl>
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

On Tue, Aug 19, 2025 at 07:31:15AM +0200, Mike Looijmans wrote:
> +	switch (data->chip) {
> +	case dp159:
> +		val = 0;
> +		if (!of_property_read_u32(client->dev.of_node,
> +					"slew-rate", &param)) {

You never tested your code or your DTS.

Best regards,
Krzysztof

