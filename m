Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4BCAD56F981
	for <lists+dri-devel@lfdr.de>; Mon, 11 Jul 2022 11:01:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BE79718A111;
	Mon, 11 Jul 2022 09:01:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailrelay2-1.pub.mailoutpod1-cph3.one.com
 (mailrelay2-1.pub.mailoutpod1-cph3.one.com [46.30.210.183])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 062E618A543
 for <dri-devel@lists.freedesktop.org>; Mon, 11 Jul 2022 09:01:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ravnborg.org; s=rsa1;
 h=in-reply-to:content-type:mime-version:references:message-id:subject:cc:to:
 from:date:from;
 bh=8uxtxIzC7VTJjVlLLYF19CxFJDykhNDLW09VLlCVguY=;
 b=ed+wgJWhustK21yKITJ+Sh/cvhwnyyq0EBvJ9ZObYYV9OrmM+i/QY4Sw43aHpFn2k4TvXzVhrAVe/
 +0KJfZsBOuh0Vi0+ccOGe35umRHtd8LfPjHNrGSMME+GtwmsKYiZ5gNM68LLmpL7AUgBl6bbZaXY00
 jIHy5trfYjVmZcmZ5uq2Fw50D3OBr8vEpWJEY6ZQSlb0xHGTzwLXCT1A5t6HUpo8QAg/K1sufvVDl4
 NGCbRMnrimn1B9Typ9j0LQ9F796GeKYE8L3dsS2ov0vyUp9ZeSYAziEd0g1tJ+WN444JAiNq7658Ae
 MJDPZBLvcNXt8qU4xrZALgzo14mbvHA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed;
 d=ravnborg.org; s=ed1;
 h=in-reply-to:content-type:mime-version:references:message-id:subject:cc:to:
 from:date:from;
 bh=8uxtxIzC7VTJjVlLLYF19CxFJDykhNDLW09VLlCVguY=;
 b=+jD1US786lwsjc7zNQUHfZvSNMuJvnj7mgQo7lE6q375GxKFlagQHPaK5Ph23Vqfxabdi57vbFfEy
 +8bJbGECg==
X-HalOne-Cookie: cc644e34e1800161ac3a3722d9320e2783edacd0
X-HalOne-ID: 00789a1e-00f8-11ed-a917-d0431ea8a290
Received: from mailproxy3.cst.dirpod4-cph3.one.com
 (2-105-2-98-cable.dk.customer.tdc.net [2.105.2.98])
 by mailrelay2.pub.mailoutpod1-cph3.one.com (Halon) with ESMTPSA
 id 00789a1e-00f8-11ed-a917-d0431ea8a290;
 Mon, 11 Jul 2022 09:01:08 +0000 (UTC)
Date: Mon, 11 Jul 2022 11:01:06 +0200
From: Sam Ravnborg <sam@ravnborg.org>
To: Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: [PATCH v1 0/11] drm/via: Make via a single file driver
Message-ID: <Ysvm0tdtSsMdI7TC@ravnborg.org>
References: <20220710085506.1384056-1-sam@ravnborg.org>
 <f7f2e4ce-fced-78d7-258f-a4e723b1bbbf@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <f7f2e4ce-fced-78d7-258f-a4e723b1bbbf@suse.de>
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
Cc: Kevin Brace <kevinbrace@bracecomputerlab.com>,
 Javier Martinez Canillas <javierm@redhat.com>, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Thomas,

On Mon, Jul 11, 2022 at 09:01:50AM +0200, Thomas Zimmermann wrote:
> Hi Sam,
> 
> this looks like a good solution to me. I'd give you a detailed review, but
> dri-devel decided to only send me the color letter. I had to use patchwork
> get the patches.
> 
> For the series
> 
> Acked-by: Thomas Zimmermann <tzimmermann@suse.de>
Thanks!

> 
> with suggestions below.
> 
> Am 10.07.22 um 10:54 schrieb Sam Ravnborg:
> > We have an upcoming openchrome driver for VIA where some
> > of the files conflicts with the existing via driver.
> > 
> > It is not acceptable to just delete the existing DRI1
> > based driver as there are most likely users out there,
> > so a different approach was required.
> > 
> > It was disccussed what to do and the least invasive
> > solution was to keep the DRI1 driver in the current
> > directory as a single file.
> > 
> > Thomas Zimmermann already posted a patch to do the
> > same but it attemped to have a single driver
> > for the DRI1 and the upcoming new driver.
> 
> After the openchrome patches land, there will be an option in Kconfig to
> build the old driver instead of of the new one?
> 
> > 
> > This patchset embeds the files one by one to make the
> > diffs remotely readable and end up with an independent
> > DRI1 driver.
> > 
> > The driver was built tested for each step.
> > 
> > The driver is in the end renamed to via_dri1.
> > Some feedback on this would be good as I do not know
> > what impact it will have on users.
> 
> I don't know how Mesa decides about which userspace driver to load, but It
> seems related to the name of the kernel driver. Renaming the module might
> interfere somehow.  But if the old and new driver are mutually exclusive at
> build time, it should not be a problem to use the same name for both
> modules.

Another option could be to keep the "via.ko" name and come up with a
new name for the openchrome variant (via_drm?).
I think we need to allow both drivers to be built as a user may want to
try out the old and the new driver without to much hassle.

In the next iteration I will drop the rename of the driver - it is easy
to do later as it is a simple one-liner.

> > 
> > The very last patch synchronize the via_3d_reg header
> > file with the one used in the openchrome driver.
> > This was added to verify that the new header would not
> > break the DRI1 driver.
> 
> Some of the macros introduce line wraps. I don't know if you did that
> intentionally, but it shouldn't be necessary. We have a 100-character limit
> per line.
The via_3d_reg file was copied verbatim from the openchrome repo.
I will fix up relevant checkpatch warnings in a follow-up patch so it is
obvious what is changed from the original source.

> Maybe you can also add an extra patch that adds SPDX license tags at the top
> of the files.
Yep, will do.

Thanks for the feedback!

	Sam
