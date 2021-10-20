Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8FE3B4344BC
	for <lists+dri-devel@lfdr.de>; Wed, 20 Oct 2021 07:39:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5C3B76E113;
	Wed, 20 Oct 2021 05:39:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx2.smtp.larsendata.com (mx2.smtp.larsendata.com
 [91.221.196.228])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BA51E6E113
 for <dri-devel@lists.freedesktop.org>; Wed, 20 Oct 2021 05:39:41 +0000 (UTC)
Received: from mail01.mxhotel.dk (mail01.mxhotel.dk [91.221.196.236])
 by mx2.smtp.larsendata.com (Halon) with ESMTPS
 id 249e4d48-3168-11ec-ac3c-0050568cd888;
 Wed, 20 Oct 2021 05:39:50 +0000 (UTC)
Received: from ravnborg.org (80-162-45-141-cable.dk.customer.tdc.net
 [80.162.45.141])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 (Authenticated sender: sam@ravnborg.org)
 by mail01.mxhotel.dk (Postfix) with ESMTPSA id 809CB194B17;
 Wed, 20 Oct 2021 07:39:46 +0200 (CEST)
Date: Wed, 20 Oct 2021 07:39:36 +0200
X-Report-Abuse-To: abuse@mxhotel.dk
From: Sam Ravnborg <sam@ravnborg.org>
To: Anitha Chrisanthus <anitha.chrisanthus@intel.com>
Cc: dri-devel@lists.freedesktop.org, edmund.j.dea@intel.com,
 tzimmermann@suse.de
Subject: Re: [PATCH v4 1/2] drm/kmb: Enable ADV bridge after modeset
Message-ID: <YW+rmF0Y7Bhr7qys@ravnborg.org>
References: <20211019230719.789958-1-anitha.chrisanthus@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211019230719.789958-1-anitha.chrisanthus@intel.com>
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

On Tue, Oct 19, 2021 at 04:07:18PM -0700, Anitha Chrisanthus wrote:
> On KMB, ADV bridge must be programmed and powered on prior to
> MIPI DSI HW initialization.
> 
> v2: changed to atomic_bridge_chain_enable (Sam)
> 
> Fixes: 98521f4d4b4c ("drm/kmb: Mipi DSI part of the display driver")
> Co-developed-by: Edmund Dea <edmund.j.dea@intel.com>

Co-developed-by must be paired with a Signed-off-by: from the same
person.

With this fixed,
Acked-by: Sam Ravnborg <sam@ravnborg.org>

	Sam
