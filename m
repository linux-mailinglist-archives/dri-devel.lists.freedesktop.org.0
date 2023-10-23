Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 66CBA7D4CC3
	for <lists+dri-devel@lfdr.de>; Tue, 24 Oct 2023 11:42:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 36D1110E311;
	Tue, 24 Oct 2023 09:42:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 70F9010E30F
 for <dri-devel@lists.freedesktop.org>; Tue, 24 Oct 2023 09:42:40 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 782C562ADE;
 Tue, 24 Oct 2023 09:42:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C48BDC433C8;
 Tue, 24 Oct 2023 09:42:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1698140559;
 bh=9oklU2sgIPdhg197uemsXfWQY+HVG4t3da0358w+iDU=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=jDNue9WKlEw3PXvRsxfZSwJD5JJayxhWt0e1BnYpenvbyGXv08zQZa2W4e26mZLRr
 zFTSkYbXZzyQTEzuILbSujKuLpTZtbcqDr7dZj8F7aYHzdrntHbPFrSGVtG5iyrsHg
 NzhGHsPyn7c7XD3Uo0+en4S1NKbUsXRXOR8b5n3x2rzbSBccFWbdJrWsarNTCt5LvM
 0Mz9OQEh5Q0Dykn0io9rvNSEI+ijgVlg5h9w6TPjmZqKN94JdUin+Fz/sb/FgB5nWs
 WGZOW2VZRV+71wUI1MoQvfxvoKo3oe5LxqgIrulFiXVkV003ZuRpaFDVBTk1BfjF80
 Qj3OW3xWcMV2g==
From: Maxime Ripard <mripard@kernel.org>
To: linux-kernel@vger.kernel.org, 
 Dario Binacchi <dario.binacchi@amarulasolutions.com>
In-Reply-To: <20231023085929.1445594-1-dario.binacchi@amarulasolutions.com>
References: <20231023085929.1445594-1-dario.binacchi@amarulasolutions.com>
Subject: Re: (subset) [PATCH] drm/vc4: fix typo
Message-Id: <169807119062.131218.9254830713560666523.b4-ty@kernel.org>
Date: Mon, 23 Oct 2023 16:26:30 +0200
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.12.3
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
Cc: Eric Anholt <eric@anholt.net>, dri-devel@lists.freedesktop.org,
 Emma Anholt <emma@anholt.net>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, 23 Oct 2023 10:59:20 +0200, Dario Binacchi wrote:
> Replace 'pack' with 'back'.
> 
> 

Applied to drm/drm-misc (drm-misc-next).

Thanks!
Maxime

