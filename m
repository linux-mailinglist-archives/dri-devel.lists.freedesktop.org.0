Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 518546092C4
	for <lists+dri-devel@lfdr.de>; Sun, 23 Oct 2022 14:40:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 39DA210E192;
	Sun, 23 Oct 2022 12:40:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2E5DB10E192
 for <dri-devel@lists.freedesktop.org>; Sun, 23 Oct 2022 12:40:47 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id B0EB460D3F;
 Sun, 23 Oct 2022 12:40:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 948D5C433D7;
 Sun, 23 Oct 2022 12:40:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1666528846;
 bh=zeujhYE1bMPLUIcjMh+dFlDPihy8eHXhNHEOtixIc3A=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=zzT9dsBVcEod7iC1wfTcwQAnNUvMKbsiPOFsnSoOqmGm/+TMYVFU4ZUTlznCEM9pO
 +aIW6koCs4aIBW+jHIC7X/3N8YliFEHQNbd6fqRVsNPlhS7bTucqxV7QBN+L/o03+G
 T/VYnilixK2ANUqLI7j/DoHxJgn3pblyRFxpjzlc=
Date: Sun, 23 Oct 2022 14:40:43 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Oded Gabbay <ogabbay@kernel.org>
Subject: Re: [RFC PATCH 1/3] drivers/accel: add new kconfig and update
 MAINTAINERS
Message-ID: <Y1U2Sy3hHmYfveaD@kroah.com>
References: <20221022214622.18042-1-ogabbay@kernel.org>
 <20221022214622.18042-2-ogabbay@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221022214622.18042-2-ogabbay@kernel.org>
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
Cc: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>,
 Jeffrey Hugo <quic_jhugo@quicinc.com>, Arnd Bergmann <arnd@arndb.de>,
 Thomas Zimmermann <tzimmermann@suse.de>, John Hubbard <jhubbard@nvidia.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Yuji Ishikawa <yuji2.ishikawa@toshiba.co.jp>,
 Jagan Teki <jagan@amarulasolutions.com>, Jason Gunthorpe <jgg@nvidia.com>,
 Jiho Chu <jiho.chu@samsung.com>, Alex Deucher <alexander.deucher@amd.com>,
 Christoph Hellwig <hch@infradead.org>,
 Maciej Kwapulinski <maciej.kwapulinski@linux.intel.com>,
 Kevin Hilman <khilman@baylibre.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sun, Oct 23, 2022 at 12:46:20AM +0300, Oded Gabbay wrote:
> Add a new Kconfig for the accel subsystem. The Kconfig currently
> contains only the basic CONFIG_ACCEL option that will be used to
> decide whether to compile the accel registration code as part of the
> drm core functionality.
> 
> I have taken the liberty to appropriate the dri-devel mailing list and
> the dri-devel IRC channel for the accel subsystem.
> 
> Signed-off-by: Oded Gabbay <ogabbay@kernel.org>
> ---
>  MAINTAINERS           |  8 ++++++++
>  drivers/Kconfig       |  2 ++
>  drivers/accel/Kconfig | 24 ++++++++++++++++++++++++

YOu never use drivers/accel/ again in this patch series, was that
intentional?

thanks,

greg k-h
