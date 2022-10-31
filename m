Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A785613364
	for <lists+dri-devel@lfdr.de>; Mon, 31 Oct 2022 11:13:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2E54310E185;
	Mon, 31 Oct 2022 10:13:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from muru.com (muru.com [72.249.23.125])
 by gabe.freedesktop.org (Postfix) with ESMTP id 78FDF10E185
 for <dri-devel@lists.freedesktop.org>; Mon, 31 Oct 2022 10:13:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by muru.com (Postfix) with ESMTPS id 3C5EA80CD;
 Mon, 31 Oct 2022 10:04:12 +0000 (UTC)
Date: Mon, 31 Oct 2022 12:13:39 +0200
From: Tony Lindgren <tony@atomide.com>
To: Ivaylo Dimitrov <ivo.g.dimitrov.75@gmail.com>
Subject: Re: [PATCH 3/3] drm: omapdrm: Do no allocate non-scanout GEMs
 through DMM/TILER
Message-ID: <Y1+f0zG50ZR4aWGX@atomide.com>
References: <1642587791-13222-1-git-send-email-ivo.g.dimitrov.75@gmail.com>
 <1642587791-13222-4-git-send-email-ivo.g.dimitrov.75@gmail.com>
 <4B3F8E50-3472-4AED-9A77-3E265DF8C928@goldelico.com>
 <0000784a-ae89-1081-0ec7-fc77d3381545@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <0000784a-ae89-1081-0ec7-fc77d3381545@gmail.com>
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
Cc: tomba@kernel.org, airlied@linux.ie,
 "H. Nikolaus Schaller" <hns@goldelico.com>, merlijn@wizzup.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-omap@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

* Ivaylo Dimitrov <ivo.g.dimitrov.75@gmail.com> [221031 06:55]:
> On 31.10.22 г. 0:08 ч., H. Nikolaus Schaller wrote:
> > [   39.419846] WARNING: CPU: 0 PID: 3673 at drivers/bus/omap_l3_noc.c:139 l3_interrupt_handler+0x23c/0x330
> > [   39.429914] 44000000.l3-noc:L3 Custom Error: MASTER MPU TARGET GPMC (Idle): Data Access in Supervisor mode during Functional access
> > ...
> > 
> 
> I have no idea what that error is supposed to mean. @Tony?

The error above is GPMC related. It means GPMC is not properly clocked or powered
while trying to access it's IO range.

Maybe DSS is somehow trying to access GPMC address space registers with DMA? The
GPMC address space starts at 0. Maybe the DSS DMA address is 0 somwhere?

Regards,

Tony
