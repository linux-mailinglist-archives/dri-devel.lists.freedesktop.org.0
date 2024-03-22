Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 518B18869B6
	for <lists+dri-devel@lfdr.de>; Fri, 22 Mar 2024 10:52:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E60C610EF3C;
	Fri, 22 Mar 2024 09:52:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6D1E110EF3C
 for <dri-devel@lists.freedesktop.org>; Fri, 22 Mar 2024 09:52:05 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 75D3C61323;
 Fri, 22 Mar 2024 09:52:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A6E22C433F1;
 Fri, 22 Mar 2024 09:52:03 +0000 (UTC)
Date: Fri, 22 Mar 2024 10:52:01 +0100
From: Greg KH <greg@kroah.com>
To: Thomas Zimmermann <tzimmermann@suse.de>
Cc: lee@kernel.org, daniel.thompson@linaro.org, jingoohan1@gmail.com,
 deller@gmx.de, andy@kernel.org, geert@linux-m68k.org,
 dan.carpenter@linaro.org, sam@ravnborg.org,
 dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org,
 linux-staging@lists.linux.dev
Subject: Re: [PATCH v2 5/6] staging: fbtft: Remove reference to fb_blank
Message-ID: <2024032255-parole-stubbly-37ad@gregkh>
References: <20240319093915.31778-1-tzimmermann@suse.de>
 <20240319093915.31778-6-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240319093915.31778-6-tzimmermann@suse.de>
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

On Tue, Mar 19, 2024 at 10:37:24AM +0100, Thomas Zimmermann wrote:
> The field fb_blank in struct backlight_properties is deprecated and
> should not be used. Don't output its value in the driver's debug print.
> 
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> Reviewed-by: Dan Carpenter <dan.carpenter@linaro.org>

Acked-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
