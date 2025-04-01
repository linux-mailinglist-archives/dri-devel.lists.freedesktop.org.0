Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B4064A776B2
	for <lists+dri-devel@lfdr.de>; Tue,  1 Apr 2025 10:45:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A905010E516;
	Tue,  1 Apr 2025 08:45:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="s+7pij40";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 82CA610E516
 for <dri-devel@lists.freedesktop.org>; Tue,  1 Apr 2025 08:44:59 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id A847143D24;
 Tue,  1 Apr 2025 08:44:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 32CDBC4CEE4;
 Tue,  1 Apr 2025 08:44:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1743497096;
 bh=wGqJBd7vfSvA8X3iZNsqbJZdCnTFtO00dJM6lUv2rKY=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=s+7pij409ktgdqtrmt5J2yw5Avsc47NJG6b2awemQ7Om7i7j1fYfw9q1XtGP9eS+L
 gJMod3wyBgb67LwHItVpzHD0E601jawMP7ajeSUL9kWse3RVzPQxENjfFBa18z3oAr
 vRpSf3MtwxcYr59wFo3KM/BP/sjxcu0bkHAr8hEan4yQBqvs/rwwdhPpvZcw5jY/dl
 IWbMKVgHKQ9JqTZb2vAmWnNlokqhq36bm9tMQy2wvIi7sGXXkvS6/4RmuLWo6mS0kX
 FEuknwhmhNPFDtLmwNK+Rnr2TfwTn2/zqNM7s4pUgxOuRd9U8UzwGz/o+HK11wsZp7
 V1eqFVOMgIAsg==
Date: Tue, 1 Apr 2025 09:44:51 +0100
From: Daniel Thompson <danielt@kernel.org>
To: Henry Martin <bsdhenrymartin@gmail.com>
Cc: lee@kernel.org, jingoohan1@gmail.com, deller@gmx.de,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-fbdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Subject: Re: [PATCH v3] backlight: pm8941: Add NULL check in wled_configure()
Message-ID: <Z-ung-_3ErYHqnXU@aspen.lan>
References: <20250401025737.16753-1-bsdhenrymartin@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250401025737.16753-1-bsdhenrymartin@gmail.com>
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

On Tue, Apr 01, 2025 at 10:57:37AM +0800, Henry Martin wrote:
> devm_kasprintf() returns NULL when memory allocation fails. Currently,
> wled_configure() does not check for this case, which results in a NULL
> pointer dereference.
>
> Add NULL check after devm_kasprintf() to prevent this issue.
>
> Fixes: f86b77583d88 ("backlight: pm8941: Convert to using %pOFn instead of device_node.name")
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> Signed-off-by: Henry Martin <bsdhenrymartin@gmail.com>

Reviewed-by: Daniel Thompson (RISCstar) <danielt@kernel.org>


Daniel.
