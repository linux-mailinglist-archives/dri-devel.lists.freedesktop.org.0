Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B8AC302302
	for <lists+dri-devel@lfdr.de>; Mon, 25 Jan 2021 09:50:12 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0CB1C89D2E;
	Mon, 25 Jan 2021 08:50:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4D6BF89D2E
 for <dri-devel@lists.freedesktop.org>; Mon, 25 Jan 2021 08:50:09 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 4681322CF6;
 Mon, 25 Jan 2021 08:50:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1611564608;
 bh=8R/dDVa/hq2LeuM0260+HWRNutMZSEiafO+90owIq/8=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=weq9SpnMXwrA+VZ/5vfxP964jkqA/Gr0znk6NIJpNLgAuFvTjS4znC/8won2G8FOx
 SLkHzz0TE/S4vl8IQoW6w6zYfWSmaRnIaKRjrl6sxA3JCuCKKwn5p+O1idzX2md5ut
 VP+DKWLss7qo78tBQSRGDyDKD2btuAgbDsJ8Mu4E=
Date: Mon, 25 Jan 2021 09:50:06 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: Carlis <zhangxuezhi3@gmail.com>
Subject: Re: [PATCH v2] fbtft: add tearing signal detect
Message-ID: <YA6GPqYbhFzfySDc@kroah.com>
References: <1611564252-84205-1-git-send-email-zhangxuezhi3@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1611564252-84205-1-git-send-email-zhangxuezhi3@gmail.com>
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
Cc: devel@driverdev.osuosl.org, linux-fbdev@vger.kernel.org,
 mh12gx2825@gmail.com, oliver.graute@kococonnector.com,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 sbrivio@redhat.com, colin.king@canonical.com, zhangxuezhi1@yulong.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Jan 25, 2021 at 04:44:12PM +0800, Carlis wrote:
> From: "carlis.zhang_cp" <zhangxuezhi1@yulong.com>

I need a "real" name here, and in the signed-off-by: area as I do not
think you sign documents with a "." and "_", right?

thanks,

greg k-h
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
