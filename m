Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 517BF7912D2
	for <lists+dri-devel@lfdr.de>; Mon,  4 Sep 2023 09:59:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5A13110E2D9;
	Mon,  4 Sep 2023 07:59:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EFF3910E2D9
 for <dri-devel@lists.freedesktop.org>; Mon,  4 Sep 2023 07:59:14 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 84CD3B80DB8;
 Mon,  4 Sep 2023 07:59:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DB773C433C8;
 Mon,  4 Sep 2023 07:59:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1693814352;
 bh=Hr+ZVUZEtyT9aITIw/fbNSO12wCle6xA57F6oFkrN3k=;
 h=Date:From:To:Subject:In-Reply-To:References:Cc:From;
 b=KkkWskWDxG1X90HqkhWXFHeZoCRsNKCmSzu9orGP+4K/SCoRyfG20SI2ru5IDQijk
 hJqqkixqI4seMEDdys16rT1nQNOGslEBv9uBxI9VTGXaiIebdApyL1DITesFLrLFj/
 nniNvjq9gIsscuV63xrzZg48ycKBnadFgf0XB2IlRnKkn1rqN2Vz9vk/wPFCWGIsFE
 F+eaGMLokU5QAhbPjtEjiPj0nzPGgdc3kgHBTGh6PjsL3Ghd+BFaGC7CgFsIW+7859
 h8Urw/DwIxPxLVkpip+r+TttIYdzA0FdDktWWBzgrQySke4kmuXU7j5NQ1qmOhoC2i
 8dsoBDq9ETQmA==
Message-ID: <bd57ed13cfa3f59b17bbae922c4e8bd1.mripard@kernel.org>
Date: Mon, 04 Sep 2023 07:59:09 +0000
From: "Maxime Ripard" <mripard@kernel.org>
To: "Douglas Anderson" <dianders@chromium.org>
Subject: Re: [RFT PATCH 4/6] drm/ssd130x: Call drm_atomic_helper_shutdown()
 at remove time
In-Reply-To: <20230901163944.RFT.4.I4752a39ad9f8fd08b32c2b78a8a3e40491bfb5eb@changeid>
References: <20230901163944.RFT.4.I4752a39ad9f8fd08b32c2b78a8a3e40491bfb5eb@changeid>
Content-Transfer-Encoding: 7bit
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
Cc: linux-kernel@vger.kernel.org, Maxime
 Ripard <mripard@kernel.org>, javierm@redhat.com,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, 1 Sep 2023 16:39:55 -0700, Douglas Anderson wrote:
> Based on grepping through the source code, this driver appears to be
> missing a call to drm_atomic_helper_shutdown() at remove time. Let's
> add it.
> 
> The fact that we should call drm_atomic_helper_shutdown() in the case
> 
> [ ... ]

Acked-by: Maxime Ripard <mripard@kernel.org>

Thanks!
Maxime
