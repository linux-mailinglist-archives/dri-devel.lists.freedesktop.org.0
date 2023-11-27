Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 036B87FA178
	for <lists+dri-devel@lfdr.de>; Mon, 27 Nov 2023 14:54:16 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5E12510E2A2;
	Mon, 27 Nov 2023 13:54:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0EA3C10E2A1
 for <dri-devel@lists.freedesktop.org>; Mon, 27 Nov 2023 13:54:13 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by ams.source.kernel.org (Postfix) with ESMTP id 997F6B835E4;
 Mon, 27 Nov 2023 13:54:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9FCFAC433C9;
 Mon, 27 Nov 2023 13:54:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1701093251;
 bh=HndP7kMXn51lK3Jva+NBlGfD5QReY9K9C8oB1c8J5F8=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=cxS9hJoPFPRbEyqh+oWQyk0yNzXtrRvykVN1klQqYitHYieP7b673yHpCfzMUNgQG
 IbEx0KSA0SoSHl5Q43WfL78AZ8f4Q0kPnvmXLv4Jrm5crXkFlLSlcB53klG6zuvURS
 ZEecMvXhzfqBdCdyaTnGZdEXS0fm/DE1IhRyN8P0=
Date: Mon, 27 Nov 2023 13:29:58 +0000
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: [PATCH v2 25/32] staging/sm750fb: Declare fb_ops as constant
Message-ID: <2023112750-ditzy-scrutiny-f105@gregkh>
References: <20231127131655.4020-1-tzimmermann@suse.de>
 <20231127131655.4020-26-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231127131655.4020-26-tzimmermann@suse.de>
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
Cc: linux-fbdev@vger.kernel.org, Teddy Wang <teddy.wang@siliconmotion.com>,
 deller@gmx.de, linux-staging@lists.linux.dev, javierm@redhat.com,
 dri-devel@lists.freedesktop.org, Sudip Mukherjee <sudipm.mukherjee@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Nov 27, 2023 at 02:15:54PM +0100, Thomas Zimmermann wrote:
> Split up lynxfb_ops and declare each as constant. The fb_ops
> instance used to be modified while initializing the driver. It is
> now constant and the driver picks the correct instance, depending
> on the settings for acceleration and cursor support.
> 
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> Cc: Sudip Mukherjee <sudipm.mukherjee@gmail.com>
> Cc: Teddy Wang <teddy.wang@siliconmotion.com>
> Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> Cc: linux-staging@lists.linux.dev
> Acked-by: Javier Martinez Canillas <javierm@redhat.com>
> ---
>  drivers/staging/sm750fb/sm750.c | 59 +++++++++++++++++++++++++++------
>  1 file changed, 49 insertions(+), 10 deletions(-)

Acked-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
