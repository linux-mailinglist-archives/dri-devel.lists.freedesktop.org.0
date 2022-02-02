Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A00B4A7728
	for <lists+dri-devel@lfdr.de>; Wed,  2 Feb 2022 18:56:26 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 58AC910E43A;
	Wed,  2 Feb 2022 17:56:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx2.smtp.larsendata.com (mx2.smtp.larsendata.com
 [91.221.196.228])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2AE8C10E406
 for <dri-devel@lists.freedesktop.org>; Wed,  2 Feb 2022 17:56:18 +0000 (UTC)
Received: from mail01.mxhotel.dk (mail01.mxhotel.dk [91.221.196.236])
 by mx2.smtp.larsendata.com (Halon) with ESMTPS
 id 8e33124d-8451-11ec-ac19-0050568cd888;
 Wed, 02 Feb 2022 17:57:15 +0000 (UTC)
Received: from ravnborg.org (80-162-45-141-cable.dk.customer.tdc.net
 [80.162.45.141])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 (Authenticated sender: sam@ravnborg.org)
 by mail01.mxhotel.dk (Postfix) with ESMTPSA id 2E168194B1A;
 Wed,  2 Feb 2022 18:56:16 +0100 (CET)
Date: Wed, 2 Feb 2022 18:56:13 +0100
X-Report-Abuse-To: abuse@mxhotel.dk
From: Sam Ravnborg <sam@ravnborg.org>
To: Helge Deller <deller@gmx.de>
Subject: Re: fbdev git tree update
Message-ID: <YfrFvfZuZM1N9frh@ravnborg.org>
References: <e1e5b7d1-ea09-6e28-9c39-45b983734a85@gmx.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <e1e5b7d1-ea09-6e28-9c39-45b983734a85@gmx.de>
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
Cc: linux-fbdev@vger.kernel.org,
 DRI Development <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Helge,

On Sun, Jan 30, 2022 at 10:05:39PM +0100, Helge Deller wrote:
> Hello DRI and fbdev developers,
> 
> I've now mostly checked all queued-up patches on the fbdev mailing list:
> https://patchwork.kernel.org/project/linux-fbdev/list/

Nice to see all the pending fbdev patches processed.

I do not see why most of them are applied - why bother with
dev_err_probe or spelling fixes in old drivers that does not see any
active development. But that's your call.

How come there are backlight, dt-bindings and agp in between
the fbdev patches?
It would be nice to be able to trust that if the fbdev tree has patches
then it is mentioned when the tree touches files outside the fbdev
dir.


These are the patches that caught my eye:

> Arnd Bergmann (1):
>       agp: define proper stubs for empty helpers
> 
> Luca Weiss (2):
>       backlight: qcom-wled: Add PM6150L compatible
>       dt-bindings: simple-framebuffer: allow standalone compatible
> 
> Xu Wang (2):
>       backlight: lm3630a_bl: Remove redundant 'flush_workqueue()' calls

If this was mentioned then fine - but now it looks like patches that do
not belong here.

	Sam
