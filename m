Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EF69237F979
	for <lists+dri-devel@lfdr.de>; Thu, 13 May 2021 16:13:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D2AD66E893;
	Thu, 13 May 2021 14:13:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BC91F6E893
 for <dri-devel@lists.freedesktop.org>; Thu, 13 May 2021 14:13:33 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 105B8613C3;
 Thu, 13 May 2021 14:13:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1620915213;
 bh=kllVikt0r4o0lTiJBCujGg+94+ZoBWoJZFcF+r/Uws8=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=lKMBpvL/za/xNL9+KA/ejuSkAhOL1S0lD8cIQZqNhA4ezMprGP9W0BaJpJ8ZG/FRR
 2W8QTGfC+9q2DMeBqtCNrHSsK2lQTD1V9btVXuagxjzoCNq98rCo5NP9KGeNdstaf7
 6hlWlhVrEmCWm55u3z1kN1th9aU2lBKldCD8fpEo=
Date: Thu, 13 May 2021 16:13:31 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Yiyuan GUO <yguoaz@gmail.com>
Subject: Re: [PATCH] agp: check if ndevs is zero before enabling node
Message-ID: <YJ00C/Kdhe3bSrtH@kroah.com>
References: <20210513135332.62581-1-yguoaz@cse.ust.hk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210513135332.62581-1-yguoaz@cse.ust.hk>
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
Cc: airlied@linux.ie, Yiyuan GUO <yguoaz@cse.ust.hk>, keescook@chromium.org,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, May 13, 2021 at 09:53:32PM +0800, Yiyuan GUO wrote:
> In function agp_3_5_enable from drivers/char/agp/isoch.c, the
> variable ndevs may remain zero if all AGP devices have type of
> "Bridge" or "Unclassified device".

Can that actually happen with real hardware?  Given the age of AGP code,
odds are if this could have happened, it would have by now :)

thanks,

greg k-h
