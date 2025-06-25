Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A3EBAE8507
	for <lists+dri-devel@lfdr.de>; Wed, 25 Jun 2025 15:44:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 61C9A10E21F;
	Wed, 25 Jun 2025 13:44:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 360 seconds by postgrey-1.36 at gabe;
 Wed, 25 Jun 2025 13:44:31 UTC
Received: from bmailout3.hostsharing.net (bmailout3.hostsharing.net
 [176.9.242.62])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6FB4610E21F
 for <dri-devel@lists.freedesktop.org>; Wed, 25 Jun 2025 13:44:31 +0000 (UTC)
Received: from h08.hostsharing.net (h08.hostsharing.net
 [IPv6:2a01:37:1000::53df:5f1c:0])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256
 client-signature RSA-PSS (4096 bits) client-digest SHA256)
 (Client CN "*.hostsharing.net", Issuer "RapidSSL TLS RSA CA G1" (verified OK))
 by bmailout3.hostsharing.net (Postfix) with ESMTPS id 175662C02052;
 Wed, 25 Jun 2025 15:38:25 +0200 (CEST)
Received: by h08.hostsharing.net (Postfix, from userid 100393)
 id D89613B7094; Wed, 25 Jun 2025 15:38:24 +0200 (CEST)
Date: Wed, 25 Jun 2025 15:38:24 +0200
From: Lukas Wunner <lukas@wunner.de>
To: Hans de Goede <hansg@kernel.org>
Cc: David Airlie <airlied@redhat.com>, dri-devel@lists.freedesktop.org
Subject: Re: [PATCH] agp/amd64: Only try host-bridges when
 agp_try_unsupported is set
Message-ID: <aFv70KKvwkkXl-Pn@wunner.de>
References: <20250625112411.4123-1-hansg@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250625112411.4123-1-hansg@kernel.org>
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

On Wed, Jun 25, 2025 at 01:24:11PM +0200, Hans de Goede wrote:
> On modern AMD Ryzen systems the IOMMU code initializes early on adding
> resources to the "00:00.2 IOMMU" PCI-device without binding a driver to
> it (because it needs to run early).

There's already a patch pending and a discussion ongoing for this issue:

https://lore.kernel.org/r/f8ff40f35a9a5836d1371f60e85c09c5735e3c5e.1750497201.git.lukas@wunner.de/

Thanks,

Lukas
