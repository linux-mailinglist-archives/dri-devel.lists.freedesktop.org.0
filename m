Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D1ECB28D3F
	for <lists+dri-devel@lfdr.de>; Sat, 16 Aug 2025 13:02:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6447310E106;
	Sat, 16 Aug 2025 11:02:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bmailout1.hostsharing.net (bmailout1.hostsharing.net
 [83.223.95.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F2C2C10E106
 for <dri-devel@lists.freedesktop.org>; Sat, 16 Aug 2025 11:02:25 +0000 (UTC)
Received: from h08.hostsharing.net (h08.hostsharing.net
 [IPv6:2a01:37:1000::53df:5f1c:0])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256
 client-signature RSA-PSS (4096 bits) client-digest SHA256)
 (Client CN "*.hostsharing.net", Issuer "RapidSSL TLS RSA CA G1" (verified OK))
 by bmailout1.hostsharing.net (Postfix) with ESMTPS id 604372C06644;
 Sat, 16 Aug 2025 13:02:22 +0200 (CEST)
Received: by h08.hostsharing.net (Postfix, from userid 100393)
 id 4BF932E66FB; Sat, 16 Aug 2025 13:02:22 +0200 (CEST)
Date: Sat, 16 Aug 2025 13:02:22 +0200
From: Lukas Wunner <lukas@wunner.de>
To: Thorsten Blum <thorsten.blum@toblux.com>
Cc: obitton@habana.ai, ogabbay@kernel.org, ttayar@habana.ai,
 fkassabri@habana.ai, osharabi@habana.ai, dliberman@habana.ai,
 quic_carlv@quicinc.com, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Koby Elbaz <koby.elbaz@intel.com>,
 Konstantin Sinyuk <konstantin.sinyuk@intel.com>
Subject: Re: [RESEND PATCH] accel/habanalabs/gaudi2: Use kvfree() for memory
 allocated with kvcalloc()
Message-ID: <aKBlPnl69z85WblU@wunner.de>
References: <20240820231028.136126-1-thorsten.blum@toblux.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240820231028.136126-1-thorsten.blum@toblux.com>
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

On Wed, Aug 21, 2024 at 01:10:28AM +0200, Thorsten Blum wrote:
> Use kvfree() to fix the following Coccinelle/coccicheck warning reported
> by kfree_mismatch.cocci:
> 
>   WARNING kvmalloc is used to allocate this memory at line 10398
> 
> Reviewed-by: Tomer Tayar <ttayar@habana.ai>
> Signed-off-by: Thorsten Blum <thorsten.blum@toblux.com>

Applied to drm-misc-fixes, thanks.

You used toblux.com in the Signed-off-by tag but have since amended
.mailmap to use linux.dev instead.  To avoid a mismatch between the
Signed-off-by tag and the commit author, I've taken the liberty to
hand-edit the former to use linux.dev.

I've also added a Fixes tag and stable designation.

Qianfeng Rong later submitted an identical patch, so I've added a
Reported-by tag to acknowledge that:
https://patch.msgid.link/20250808085530.233737-1-rongqianfeng@vivo.com

Thanks,

Lukas
