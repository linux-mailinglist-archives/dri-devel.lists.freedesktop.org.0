Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 465A23BAA1F
	for <lists+dri-devel@lfdr.de>; Sat,  3 Jul 2021 21:29:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B6C7389ECD;
	Sat,  3 Jul 2021 19:29:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from foo.stuge.se (foo.stuge.se [212.116.89.98])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3BDC789ECD
 for <dri-devel@lists.freedesktop.org>; Sat,  3 Jul 2021 19:29:41 +0000 (UTC)
Received: (qmail 26406 invoked by uid 1000); 3 Jul 2021 19:29:38 -0000
Message-ID: <20210703192938.26405.qmail@stuge.se>
Date: Sat, 3 Jul 2021 19:29:38 +0000
From: Peter Stuge <peter@stuge.se>
To: Noralf =?utf-8?Q?Tr=C3=B8nnes?= <noralf@tronnes.org>
Subject: Re: [PATCH 2/2] drm/gud: Add async_flush module parameter
References: <20210703141321.35494-1-noralf@tronnes.org>
 <20210703141321.35494-2-noralf@tronnes.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20210703141321.35494-2-noralf@tronnes.org>
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
Cc: dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Noralf Trønnes wrote:
> Provide a way for userspace to choose synchronous flushing/pageflips.
> This helps save CPU and power.
> 
> It is also useful for test scripts since userspace can know when a flush
> has happended and wait before doing the next visual test.
> 
> Cc: Peter Stuge <peter@stuge.se>
> Cc: Linus Walleij <linus.walleij@linaro.org>
> Signed-off-by: Noralf Trønnes <noralf@tronnes.org>

Reviewed-by: Peter Stuge <peter@stuge.se>
