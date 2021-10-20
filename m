Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 41B6A4344BD
	for <lists+dri-devel@lfdr.de>; Wed, 20 Oct 2021 07:40:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A11256E187;
	Wed, 20 Oct 2021 05:40:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx1.smtp.larsendata.com (mx1.smtp.larsendata.com
 [91.221.196.215])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8AA0E6E187
 for <dri-devel@lists.freedesktop.org>; Wed, 20 Oct 2021 05:40:02 +0000 (UTC)
Received: from mail01.mxhotel.dk (mail01.mxhotel.dk [91.221.196.236])
 by mx1.smtp.larsendata.com (Halon) with ESMTPS
 id 2ceee647-3168-11ec-9c3f-0050568c148b;
 Wed, 20 Oct 2021 05:40:04 +0000 (UTC)
Received: from ravnborg.org (80-162-45-141-cable.dk.customer.tdc.net
 [80.162.45.141])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 (Authenticated sender: sam@ravnborg.org)
 by mail01.mxhotel.dk (Postfix) with ESMTPSA id C335B194B70;
 Wed, 20 Oct 2021 07:40:08 +0200 (CEST)
Date: Wed, 20 Oct 2021 07:39:58 +0200
X-Report-Abuse-To: abuse@mxhotel.dk
From: Sam Ravnborg <sam@ravnborg.org>
To: Anitha Chrisanthus <anitha.chrisanthus@intel.com>
Cc: dri-devel@lists.freedesktop.org, edmund.j.dea@intel.com,
 tzimmermann@suse.de
Subject: Re: [PATCH v4 2/2] drm/kmb: Enable support for framebuffer console
Message-ID: <YW+rrtVk3TWHxy2Y@ravnborg.org>
References: <20211019230719.789958-1-anitha.chrisanthus@intel.com>
 <20211019230719.789958-2-anitha.chrisanthus@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211019230719.789958-2-anitha.chrisanthus@intel.com>
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

On Tue, Oct 19, 2021 at 04:07:19PM -0700, Anitha Chrisanthus wrote:
> Enable support for fbcon (framebuffer console).
> 
> v2: added missing static clk_enable
> v3: removed module parameter, use fbdev_emulation instead. Use
> preferred depth of 24 for color depth. (Thomas Z.)
> 
> Signed-off-by: Anitha Chrisanthus <anitha.chrisanthus@intel.com>

Acked-by: Sam Ravnborg <sam@ravnborg.org>
