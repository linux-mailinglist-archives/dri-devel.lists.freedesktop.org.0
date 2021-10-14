Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CC86042E15F
	for <lists+dri-devel@lfdr.de>; Thu, 14 Oct 2021 20:33:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 675176EC12;
	Thu, 14 Oct 2021 18:33:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx1.smtp.larsendata.com (mx1.smtp.larsendata.com
 [91.221.196.215])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CB5FA6EC12
 for <dri-devel@lists.freedesktop.org>; Thu, 14 Oct 2021 18:33:19 +0000 (UTC)
Received: from mail01.mxhotel.dk (mail01.mxhotel.dk [91.221.196.236])
 by mx1.smtp.larsendata.com (Halon) with ESMTPS
 id 33047c4e-2d1d-11ec-9c3f-0050568c148b;
 Thu, 14 Oct 2021 18:33:17 +0000 (UTC)
Received: from ravnborg.org (80-162-45-141-cable.dk.customer.tdc.net
 [80.162.45.141])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 (Authenticated sender: sam@ravnborg.org)
 by mail01.mxhotel.dk (Postfix) with ESMTPSA id ED1C4194B57;
 Thu, 14 Oct 2021 20:33:24 +0200 (CEST)
Date: Thu, 14 Oct 2021 20:33:15 +0200
X-Report-Abuse-To: abuse@mxhotel.dk
From: Sam Ravnborg <sam@ravnborg.org>
To: Anitha Chrisanthus <anitha.chrisanthus@intel.com>
Cc: dri-devel@lists.freedesktop.org, edmund.j.dea@intel.com
Subject: Re: [PATCH v3 1/7] drm/kmb: Work around for higher system clock
Message-ID: <YWh3625R4wOFf78N@ravnborg.org>
References: <20211013233632.471892-1-anitha.chrisanthus@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211013233632.471892-1-anitha.chrisanthus@intel.com>
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

Hi Anitha,

On Wed, Oct 13, 2021 at 04:36:26PM -0700, Anitha Chrisanthus wrote:
> Use a different value for system clock offset in the
> ppl/llp ratio calculations for clocks higher than 500 Mhz.
> 
> Fixes: 98521f4d4b4c ("drm/kmb: Mipi DSI part of the display driver")
> Signed-off-by: Anitha Chrisanthus <anitha.chrisanthus@intel.com>

Looks fine.
Acked-by: Sam Ravnborg <sam@ravnborg.org>

	Sam
