Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3948FA63678
	for <lists+dri-devel@lfdr.de>; Sun, 16 Mar 2025 17:47:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E6BC910E1B5;
	Sun, 16 Mar 2025 16:47:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="QqoKdvsH";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DABA910E1B5
 for <dri-devel@lists.freedesktop.org>; Sun, 16 Mar 2025 16:47:28 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 9908DA45BC3;
 Sun, 16 Mar 2025 16:41:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 01B32C4CEDD;
 Sun, 16 Mar 2025 16:47:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1742143647;
 bh=wgV//taCTMUJjudcVBSnKDSNzr1TCMc7wkIEuJcvFdA=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=QqoKdvsHtmKWm1TtDCDdH97PQn/UOqDcFwVg7jCrZVtZLcO5vWgFr6Ditxr0KyNS5
 Cb6GqMfgwT/ofvQu5LO+791H0FhDFPMfByGpfUiJDjVPk6cCUgCewioNNhz/ElIC0h
 xPe7M4vPOqN5s9ujV0BJbbRTRrEbhxCT4pJv8BSfhykM53iv2Kaf4HVczO7pw/ezBA
 a43TV+/GwZtY8+rn+1CWAjKGlWheK1km6NZ/jW88nRT+9oTCWm73xXMUXUV0HZrjDa
 RfiHDyZxC82u8mPq8xU9BGuaIC2T10wcRuH6GSHTBcByB/RAefKuzrHLTXNsRzfuv2
 gxaKtYsJpDnDQ==
Date: Sun, 16 Mar 2025 17:47:23 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: =?utf-8?B?TWHDrXJh?= Canal <mcanal@igalia.com>
Cc: Melissa Wen <mwen@igalia.com>, Iago Toral <itoral@igalia.com>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
 Nicolas Saenz Julienne <nsaenz@kernel.org>, Stefan Wahren <wahrenst@gmx.net>, 
 Florian Fainelli <florian.fainelli@broadcom.com>,
 Phil Elwell <phil@raspberrypi.com>, 
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 kernel-dev@igalia.com
Subject: Re: [PATCH v5 2/6] dt-bindings: gpu: v3d: Add per-compatible
 register restrictions
Message-ID: <20250316-positive-aquatic-albatross-a39431@krzk-bin>
References: <20250316-v3d-gpu-reset-fixes-v5-0-9779cdb12f06@igalia.com>
 <20250316-v3d-gpu-reset-fixes-v5-2-9779cdb12f06@igalia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20250316-v3d-gpu-reset-fixes-v5-2-9779cdb12f06@igalia.com>
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

On Sun, Mar 16, 2025 at 11:15:09AM -0300, Ma=C3=ADra Canal wrote:
> In order to enforce per-SoC register rules, add per-compatible
> restrictions. V3D 3.3 (used in brcm,7268-v3d) has a cache controller
> (GCA), which is not present in other V3D generations. Declaring these
> differences helps ensure the DTB accurately reflect the hardware design.
>=20
> This commit breaks the ABI for BCM7268 to enforce an ascending address

Wait, why? That's not a reason to break ABI! First, there is no rule of
ascending address order. Really no. Second, even if there was such
coding style recommendation, it would not be reason to break ABI.

This patchset is not going to right direction. Read the previous
feedbacks about what is expected.

Best regards,
Krzysztof

