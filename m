Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 09181B28D45
	for <lists+dri-devel@lfdr.de>; Sat, 16 Aug 2025 13:06:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D791410E2FB;
	Sat, 16 Aug 2025 11:06:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bmailout2.hostsharing.net (bmailout2.hostsharing.net
 [83.223.78.240])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 84F6E10E2E4
 for <dri-devel@lists.freedesktop.org>; Sat, 16 Aug 2025 11:06:26 +0000 (UTC)
Received: from h08.hostsharing.net (h08.hostsharing.net
 [IPv6:2a01:37:1000::53df:5f1c:0])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256
 client-signature RSA-PSS (4096 bits) client-digest SHA256)
 (Client CN "*.hostsharing.net", Issuer "RapidSSL TLS RSA CA G1" (verified OK))
 by bmailout2.hostsharing.net (Postfix) with ESMTPS id 453052009181;
 Sat, 16 Aug 2025 13:06:25 +0200 (CEST)
Received: by h08.hostsharing.net (Postfix, from userid 100393)
 id 27C5030A43D; Sat, 16 Aug 2025 13:06:25 +0200 (CEST)
Date: Sat, 16 Aug 2025 13:06:25 +0200
From: Lukas Wunner <lukas@wunner.de>
To: Qianfeng Rong <rongqianfeng@vivo.com>
Cc: Yaron Avizrat <yaron.avizrat@intel.com>, Oded Gabbay <ogabbay@kernel.org>,
 Farah Kassabri <fkassabri@habana.ai>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Koby Elbaz <koby.elbaz@intel.com>,
 Konstantin Sinyuk <konstantin.sinyuk@intel.com>
Subject: Re: [PATCH] accel/habanalabs: fix mismatched alloc/free for kvcalloc()
Message-ID: <aKBmMU0_e2tGwCHT@wunner.de>
References: <20250808085530.233737-1-rongqianfeng@vivo.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250808085530.233737-1-rongqianfeng@vivo.com>
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

On Fri, Aug 08, 2025 at 04:55:27PM +0800, Qianfeng Rong wrote:
> Replace kfree() with kvfree() for memory allocated by kvcalloc().
> 
> Compile-tested only.
> 
> Fixes: f728c17fc97a ("accel/habanalabs/gaudi2: move HMMU page tables to device memory")
> Signed-off-by: Qianfeng Rong <rongqianfeng@vivo.com>

Thorsten Blum submitted an identical patch a year earlier:
https://patch.msgid.link/20240820231028.136126-1-thorsten.blum@toblux.com

I've just applied his patch but added a Reported-by tag with your name to
acknowledge your contribution.

Thanks!

Lukas
