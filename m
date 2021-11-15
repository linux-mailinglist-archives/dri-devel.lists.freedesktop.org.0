Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A77E2450999
	for <lists+dri-devel@lfdr.de>; Mon, 15 Nov 2021 17:27:28 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0AC016E14F;
	Mon, 15 Nov 2021 16:27:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx1.smtp.larsendata.com (mx1.smtp.larsendata.com
 [91.221.196.215])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D1A096E14F
 for <dri-devel@lists.freedesktop.org>; Mon, 15 Nov 2021 16:27:20 +0000 (UTC)
Received: from mail01.mxhotel.dk (mail01.mxhotel.dk [91.221.196.236])
 by mx1.smtp.larsendata.com (Halon) with ESMTPS
 id f36bb195-4630-11ec-9c3f-0050568c148b;
 Mon, 15 Nov 2021 16:27:39 +0000 (UTC)
Received: from ravnborg.org (80-162-45-141-cable.dk.customer.tdc.net
 [80.162.45.141])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 (Authenticated sender: sam@ravnborg.org)
 by mail01.mxhotel.dk (Postfix) with ESMTPSA id BC5B5194C09;
 Mon, 15 Nov 2021 17:27:17 +0100 (CET)
Date: Mon, 15 Nov 2021 17:27:15 +0100
X-Report-Abuse-To: abuse@mxhotel.dk
From: Sam Ravnborg <sam@ravnborg.org>
To: Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: [PATCH 2/3] drm/vmwgfx: Copy DRM hash-table code into driver
Message-ID: <YZKKY2wQS7SEujPh@ravnborg.org>
References: <20211115125539.1730-1-tzimmermann@suse.de>
 <20211115125539.1730-3-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211115125539.1730-3-tzimmermann@suse.de>
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
Cc: airlied@linux.ie, ray.huang@amd.com, linux-graphics-maintainer@vmware.com,
 dri-devel@lists.freedesktop.org, christian.koenig@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Thomas,

On Mon, Nov 15, 2021 at 01:55:38PM +0100, Thomas Zimmermann wrote:
> Besides some legacy code, vmwgfx is the only user of DRM's hash-
> table implementation. Copy the code into the driver, so that the
> core code can be retired.
For the record - I have no clue what legacy code uses the DRM hash-table
for.

> 
> No functional changes. However, the real solution for vmwgfx is to
> use Linux' generic hash-table functions.
Would it be possible to use the Linux hash-table now rather than this
mid-step where a lot of code is added to wmgfx only to be removed
later?

If we go for this way then a todo item to fix this in wmgfx so someone
can fix this later would be nice.

	Sam
