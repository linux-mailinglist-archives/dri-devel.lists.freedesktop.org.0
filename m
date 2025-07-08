Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 74FCCAFC304
	for <lists+dri-devel@lfdr.de>; Tue,  8 Jul 2025 08:44:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C648010E0FB;
	Tue,  8 Jul 2025 06:44:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="wJiuZQHz";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 782BF10E0FB;
 Tue,  8 Jul 2025 06:44:04 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id DA113441F8;
 Tue,  8 Jul 2025 06:44:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 69EC5C4CEF7;
 Tue,  8 Jul 2025 06:44:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1751957043;
 bh=DvY6ddnJvY5QtMoG2PLJJjvnCEyDtclB7qg7r18UWHQ=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=wJiuZQHzl1uFzTiqyQ9nKSD4j8U8/imXG0WgwSwRJyZW+oAvW0w/xTqokzN5Hr8ud
 DkpTB7qj0mI6P+mDRc6p7K9/gXWH+nlNi76Bj0SomIcBVh2InxdNq5I9leDz7HHbLx
 eJcwzWxfqt6acMWew8bCu4Rahs+D2O5yl4KNy3e8=
Date: Tue, 8 Jul 2025 08:44:01 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Badal Nilawar <badal.nilawar@intel.com>
Cc: intel-xe@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, anshuman.gupta@intel.com,
 rodrigo.vivi@intel.com, alexander.usyskin@intel.com,
 daniele.ceraolospurio@intel.com
Subject: Re: [PATCH v7 1/9] mei: bus: add mei_cldev_mtu interface
Message-ID: <2025070816-latch-sultry-0e4f@gregkh>
References: <20250707191237.1782824-1-badal.nilawar@intel.com>
 <20250707191237.1782824-2-badal.nilawar@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250707191237.1782824-2-badal.nilawar@intel.com>
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

On Tue, Jul 08, 2025 at 12:42:29AM +0530, Badal Nilawar wrote:
> From: Alexander Usyskin <alexander.usyskin@intel.com>
> 
> Allow to bus client to obtain client mtu.

I'm sorry, but this does not make sense.  Please work on a better
changelog text here after reading the kernel documentation that gives
you a lot of information on how to do this well.

thanks,

greg k-h
