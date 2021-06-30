Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 766413B7F9A
	for <lists+dri-devel@lfdr.de>; Wed, 30 Jun 2021 11:04:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CA35E6E0F6;
	Wed, 30 Jun 2021 09:04:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EAD636E0F6
 for <dri-devel@lists.freedesktop.org>; Wed, 30 Jun 2021 09:04:24 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 5169F60230;
 Wed, 30 Jun 2021 09:04:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1625043864;
 bh=NPtuVyJ1SquEZYecXwu/psgsGngWAT93saUxxDZv6KU=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=ZzGuiQyk3IecS34Q5M1uBeOsVgULTGCXRcRNDuLVG1AA/qdrRpHwyuQK2jSCBw1kB
 JJUiKlu9OtGU0Evz/xsDRKCHEX4+Ib6DQfT2lClXkgpzBUX55elfDl+ZfZLRlk8a8O
 tOYFzhhHXTaKAg010F1+iw7K2CdG01NmQSDhoSoE=
Date: Wed, 30 Jun 2021 11:04:22 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Aaron Ma <aaron.ma@canonical.com>
Subject: Re: [PATCH] drm/i915: Force DPCD backlight mode for Samsung 16727
 panel
Message-ID: <YNwzlqgBF/54qFMX@kroah.com>
References: <20210519095305.47133-1-aaron.ma@canonical.com>
 <57b373372cb64e8a48d12e033a23e7711332b0ec.camel@redhat.com>
 <33f42229-780f-9b4e-69db-db3fad32bf3a@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <33f42229-780f-9b4e-69db-db3fad32bf3a@canonical.com>
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
Cc: jani.nikula@intel.com, linux-kernel@vger.kernel.org, airlied@linux.ie,
 dri-devel@lists.freedesktop.org, stable@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Jun 30, 2021 at 12:29:05PM +0800, Aaron Ma wrote:
> Hi Greg:
> 
> Could this patch get a chance to be applied on stable kernel?
> It only for 5.11- kernel, not for Linus' tree.

What is the git commit id for it in Linus's tree?

And if this is not for Linus's tree, please resubmit it and document the
heck out of why it is not valid for Linus's tree and exactly what stable
trees you want this applied to (hint, 5.11 is long end-of-life and 5.12
only has about 1-2 more weeks left...)

thanks,

greg k-h
