Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 172A86314E8
	for <lists+dri-devel@lfdr.de>; Sun, 20 Nov 2022 16:33:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B2F4F10E11C;
	Sun, 20 Nov 2022 15:33:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DE79810E11C
 for <dri-devel@lists.freedesktop.org>; Sun, 20 Nov 2022 15:33:32 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id B0AE560BFC;
 Sun, 20 Nov 2022 15:33:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3FEC5C433C1;
 Sun, 20 Nov 2022 15:33:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1668958411;
 bh=STMHrZ2mtNxU/tb7z1foLodi3zD8eePmga7bh/b5WCY=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=rfe/fq71JqUfVsfDlR/lmuQagelaOZP0R3KsGEtttyJj3FSop0Vkb2OZAWiSzB9d/
 ATf4y9tWTnYJnnqvTqC4fmDSjFpkhQWG4kGgfvmWHnVyxoQ0eu/0J8ifuBUwTHW3ZP
 bffzpTs0G5lM8u27K/oqV4WmGfCTRYgD3BNgFml0=
Date: Sun, 20 Nov 2022 16:26:13 +0100
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Oded Gabbay <ogabbay@kernel.org>
Subject: Re: [PATCH v4 0/4] new subsystem for compute accelerator devices
Message-ID: <Y3pHFa/KW0/w1pBM@kroah.com>
References: <20221119204435.97113-1-ogabbay@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221119204435.97113-1-ogabbay@kernel.org>
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
Cc: dri-devel@lists.freedesktop.org,
 Maciej Kwapulinski <maciej.kwapulinski@linux.intel.com>,
 Christopher Friedt <chrisfriedt@gmail.com>,
 Kevin Hilman <khilman@baylibre.com>, Christoph Hellwig <hch@infradead.org>,
 Jagan Teki <jagan@amarulasolutions.com>, Jason Gunthorpe <jgg@nvidia.com>,
 Jiho Chu <jiho.chu@samsung.com>, Jeffrey Hugo <quic_jhugo@quicinc.com>,
 Arnd Bergmann <arnd@arndb.de>, John Hubbard <jhubbard@nvidia.com>,
 Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>,
 Yuji Ishikawa <yuji2.ishikawa@toshiba.co.jp>,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>, linux-kernel@vger.kernel.org,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Alex Deucher <alexander.deucher@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sat, Nov 19, 2022 at 10:44:31PM +0200, Oded Gabbay wrote:
> This is the fourth (and hopefully last) version of the patch-set to add the
> new subsystem for compute accelerators. I removed the RFC headline as
> I believe it is now ready for merging.
> 
> Compare to v3, this patch-set contains one additional patch that adds
> documentation regarding the accel subsystem. I hope it's good enough for
> this stage. In addition, there were few very minor fixes according to
> comments received on v3.
> 
> The patches are in the following repo:
> https://git.kernel.org/pub/scm/linux/kernel/git/ogabbay/accel.git/log/?h=accel_v4
> 
> As in v3, The HEAD of that branch is a commit adding a dummy driver that
> registers an accel device using the new framework. This can be served
> as a simple reference.

Looks good, thanks for doing this:

Reviewed-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
