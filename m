Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id ADDECAFC31B
	for <lists+dri-devel@lfdr.de>; Tue,  8 Jul 2025 08:49:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 17DAC10E139;
	Tue,  8 Jul 2025 06:49:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="SWoxfese";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8880810E138;
 Tue,  8 Jul 2025 06:49:11 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id E493E444A6;
 Tue,  8 Jul 2025 06:49:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 74DDDC4CEED;
 Tue,  8 Jul 2025 06:49:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1751957350;
 bh=3k185cUYo5bJWuw0CqBWooFjPzqcQhBT7MHlU0zMS7A=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=SWoxfeserAco0gSB/pwkKURGCnk1ZTPqebJj9VUfCzyeZwbXdGxWOKLCaKSRCaOMu
 /1XCcpWw29trF53Ip13jQv37XTRMPT3XzKmjYktLGxI2xKggOYFwaW/jyBg1jDJqnk
 YbsB1BzLmMIZ/8Mb8yxV1umzBGPgFDttaN65zwDs=
Date: Tue, 8 Jul 2025 08:49:08 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Badal Nilawar <badal.nilawar@intel.com>
Cc: intel-xe@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, anshuman.gupta@intel.com,
 rodrigo.vivi@intel.com, alexander.usyskin@intel.com,
 daniele.ceraolospurio@intel.com
Subject: Re: [PATCH v7 0/9] Introducing firmware late binding
Message-ID: <2025070824-uncertain-exit-eaf9@gregkh>
References: <20250707191237.1782824-1-badal.nilawar@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250707191237.1782824-1-badal.nilawar@intel.com>
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

On Tue, Jul 08, 2025 at 12:42:28AM +0530, Badal Nilawar wrote:
> v7:
>  xe_kmd:
>  - resolved kernel doc warnings
>  mei:
>  - Address v6 review comments (greg kh)

I don't know what comments you addressed, please be specific, as in the
past other ones have not been addressed (i.e. the .owner stuff) and I
had to find that review again...

thanks,

greg k-h
