Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C19374F00E0
	for <lists+dri-devel@lfdr.de>; Sat,  2 Apr 2022 13:01:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F0D0210E4A0;
	Sat,  2 Apr 2022 11:00:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 22DAC10E4A0
 for <dri-devel@lists.freedesktop.org>; Sat,  2 Apr 2022 11:00:59 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 87A13612D0;
 Sat,  2 Apr 2022 11:00:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 95345C340EE;
 Sat,  2 Apr 2022 11:00:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1648897258;
 bh=ezOukuLurbs/KLEmmkQlpuS/N2BmFEEo/sZ6OYN2KTQ=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=QWcVk2v7x+w+bNxpd1SIEuCz+CtHJgkorF4hjVtIDf712BbhPPzyL9AH4OT4kMLIV
 8cFsj+NTGCCZonFfMtSMnuP8DtdBljP29ySuofP5IUqaOCexEfxcKFGUrzA+r6maH9
 /0Lk4c85iFx1ZHknxYfKrOOh7UefbJURAK5cCa5A=
Date: Sat, 2 Apr 2022 13:00:55 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Hans de Goede <hdegoede@redhat.com>
Subject: Re: [PATCH 0/1] drm/simpledrm: Add "panel orientation" property on
 non-upright mounted LCD panels
Message-ID: <Ykgs59VBVfU3v5jR@kroah.com>
References: <20220402093029.5334-1-hdegoede@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220402093029.5334-1-hdegoede@redhat.com>
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
Cc: stable@vger.kernel.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sat, Apr 02, 2022 at 11:30:28AM +0200, Hans de Goede wrote:
> Hi Greg,
> 
> Fedora 36 has switched from efifb to simpledrm as the pre-native-GPU driver
> fb provider and the lack of this patch is causing issues for devices with
> non up-right mounted LCD panels (1), can you please add this to the 5.17 stable
> series?
> 
> Regards,
> 
> Hans
> 
> 1) https://bugzilla.redhat.com/show_bug.cgi?id=2071134
> 
> 
> Hans de Goede (1):
>   drm/simpledrm: Add "panel orientation" property on non-upright mounted
>     LCD panels
> 
>  drivers/gpu/drm/tiny/simpledrm.c | 3 +++
>  1 file changed, 3 insertions(+)
> 
> -- 
> 2.35.1
> 

Now queued up, thanks.

greg k-h
