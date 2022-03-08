Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 50E384D150D
	for <lists+dri-devel@lfdr.de>; Tue,  8 Mar 2022 11:46:42 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1B73210E502;
	Tue,  8 Mar 2022 10:46:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EED2010E502
 for <dri-devel@lists.freedesktop.org>; Tue,  8 Mar 2022 10:46:38 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 02E5BB81860;
 Tue,  8 Mar 2022 10:46:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 55D7AC340F7;
 Tue,  8 Mar 2022 10:46:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1646736395;
 bh=IKXUYtmKjsKoAjOIxL2cGHVYl7X2/wSeAGkMxrw6wbk=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=2HgbNvC3Zl7sd8IKCk+IBar9B5vPyQwHEDCQKWfVOSPk3Z85YuSayYAQC/6l5dKxT
 Nw5PuSjss76hIwTLRNo0BeNQSaRwgX1E50WTH3phRbR4LWfAtcCzUuPD9LGBUCCeL/
 6w2J6tEK5xl8aNLUZXMZjPebohzuKEIf3pkzOiEU=
Date: Tue, 8 Mar 2022 11:46:32 +0100
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: Re: [PATCH v1 1/1] staging: fbtft: Consider type of init sequence
 values in fbtft_init_display()
Message-ID: <Yic0CN+qSvDtSiEz@kroah.com>
References: <20220304193414.88006-1-andriy.shevchenko@linux.intel.com>
 <Yictcf0BCvveVT+V@smile.fi.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Yictcf0BCvveVT+V@smile.fi.intel.com>
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
Cc: linux-fbdev@vger.kernel.org, linux-staging@lists.linux.dev,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Helge Deller <deller@gmx.de>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Mar 08, 2022 at 12:18:25PM +0200, Andy Shevchenko wrote:
> +Cc: Helge
> 
> Maybe you can pick this up?
> 
> On Fri, Mar 04, 2022 at 09:34:14PM +0200, Andy Shevchenko wrote:

You sent this less than a week ago!  Please relax, staging driver
patches are way down my list of priorities at the moment.  Wait at least
2 weeks before trying to get someone else to take patches for this
subsystem.

relax...

greg k-h
