Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A115C19247
	for <lists+dri-devel@lfdr.de>; Wed, 29 Oct 2025 09:45:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A904610E74D;
	Wed, 29 Oct 2025 08:45:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="tZKMjCpi";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 83B7410E750
 for <dri-devel@lists.freedesktop.org>; Wed, 29 Oct 2025 08:45:35 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 4D328445D7;
 Wed, 29 Oct 2025 08:45:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A8CADC113D0;
 Wed, 29 Oct 2025 08:45:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1761727535;
 bh=0YDrlEIqPkATDsNKVJHLVSFx1NWe0IWJ4rc0ZhZJzXA=;
 h=Date:From:To:Subject:In-Reply-To:References:Cc:From;
 b=tZKMjCpi0P3TR7OLQI+zp7gGpcjGIYSo+Laew3ta9//+kD9YhSPLOn7xsG5IyfsiI
 18AV+SfmQT3vUrPAWg4Fz6rFbe0ped/+htVhv9BOifUsgZ5qs7798uig+Hg0ug2Pw7
 qjdfIiQXzvkNVdDfseGRWDLe/w29omj9Lv5bDTe3Ne9T0WcGFklUtXPxi/v6ZJ75zm
 2Bs2JbWo8QcoLfWQtaAyVR6tlt8n0YUvN1e1uL+fQZT88snGOUZPXojhooAlocgOh6
 oo24C3sUDqq6+G7HCnKeRy4Na4gE7S83kQGbnGwPs0rhwjNnwAu6tK1lWGdjEgTHg2
 e9YEVFDmgUn/w==
Message-ID: <fa56698c6e13b7bd1aedb99d393bb5f9@kernel.org>
Date: Wed, 29 Oct 2025 08:45:31 +0000
From: "Maxime Ripard" <mripard@kernel.org>
To: "Luca Ceresoli" <luca.ceresoli@bootlin.com>
Subject: Re: [PATCH v3 1/7] drm/encoder: add mutex to protect the bridge chain
In-Reply-To: <20251009-drm-bridge-alloc-encoder-chain-mutex-v3-1-c90ed744efec@bootlin.com>
References: <20251009-drm-bridge-alloc-encoder-chain-mutex-v3-1-c90ed744efec@bootlin.com>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, "Andrzej
 Hajda" <andrzej.hajda@intel.com>, "David Airlie" <airlied@gmail.com>, "Hui
 Pu" <Hui.Pu@gehealthcare.com>, "Jernej Skrabec" <jernej.skrabec@gmail.com>,
 "Jonas Karlman" <jonas@kwiboo.se>,
 "Laurent Pinchart" <Laurent.pinchart@ideasonboard.com>, "Maarten
 Lankhorst" <maarten.lankhorst@linux.intel.com>,
 "Maxime Ripard" <mripard@kernel.org>, "Neil
 Armstrong" <neil.armstrong@linaro.org>, "Robert Foss" <rfoss@kernel.org>,
 "Simona
 Vetter" <simona@ffwll.ch>, "Thomas Petazzoni" <thomas.petazzoni@bootlin.com>,
 "Thomas Zimmermann" <tzimmermann@suse.de>
Content-Transfer-Encoding: quoted-printable
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

On Thu, 9 Oct 2025 13:38:56 +0200, Luca Ceresoli wrote:
> The per-encoder bridge chain is currently assumed to be static once it is
> fully initialized. Work is in progress to add hot-pluggable bridges,
> breaking that assumption.
>=20
> With bridge removal, the encoder chain can change without notice, removing
>=20
> [ ... ]

Reviewed-by: Maxime Ripard <mripard@kernel.org>

Thanks!
Maxime
