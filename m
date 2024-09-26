Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B42DA9878CF
	for <lists+dri-devel@lfdr.de>; Thu, 26 Sep 2024 20:03:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0D7D410EBC4;
	Thu, 26 Sep 2024 18:03:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="kqzgGSDj";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E1D9410EBC4
 for <dri-devel@lists.freedesktop.org>; Thu, 26 Sep 2024 18:03:21 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id C3CE4A43695;
 Thu, 26 Sep 2024 18:03:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 144FBC4CEC5;
 Thu, 26 Sep 2024 18:03:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1727373800;
 bh=3228WUQ9vmLAriBD/5+dhgd2dxqg90jLNlv96f6hosU=;
 h=Date:From:To:cc:Subject:In-Reply-To:References:From;
 b=kqzgGSDjhP9snOiX20gWrwtkbxJ4FT5Wr4UnFIvZITpLLNwtGuCrqFBd3IakG6See
 nDxbBih8Zn1IIAloR6eyav9COsM5dOW0otLgXHbz1I0kgI0h7pXBI7nQkGUJ771AbJ
 HjP4mn+U1A2UzFj0LV0U9h2Z75VZ+adbkvvH3RXcrZJt0ccu1m9ytnk4WA0ELaZE3H
 Zovmdk2HacZO/U/zLomD9FiYCGGjQiHVswcr++7/Ps7IkTyJ4KGDj+3Z+ISkdC1CEW
 2NE7OmEu7oJ6sqhhsUNsqNzc791js6xBjDOTP8hJBr+YvXxLAx009ER3uOt+dCnAYh
 wbM9oX/tY68kQ==
Date: Thu, 26 Sep 2024 20:03:18 +0200 (CEST)
From: Jiri Kosina <jikos@kernel.org>
To: Aditya Garg <gargaditya08@live.com>, 
 "airlied@gmail.com" <airlied@gmail.com>
cc: "tzimmermann@suse.de" <tzimmermann@suse.de>, 
 "maarten.lankhorst@linux.intel.com" <maarten.lankhorst@linux.intel.com>, 
 "mripard@kernel.org" <mripard@kernel.org>, 
 "daniel@ffwll.ch" <daniel@ffwll.ch>, 
 "bentiss@kernel.org" <bentiss@kernel.org>, 
 =?ISO-8859-15?Q?Thomas_Wei=DFschuh?= <thomas@t-8ch.de>, 
 Orlando Chamberlain <orlandoch.dev@gmail.com>, 
 Kerem Karabay <kekrby@gmail.com>, 
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
 "linux-input@vger.kernel.org" <linux-input@vger.kernel.org>, 
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, 
 "torvalds@linux-foundation.org" <torvalds@linux-foundation.org>
Subject: Re: [WHY SUCH DELAY!] Touch Bar support for T2 Macs
In-Reply-To: <MA0P287MB0217A06CA89D6A7D0631466EB86A2@MA0P287MB0217.INDP287.PROD.OUTLOOK.COM>
Message-ID: <nycvar.YFH.7.76.2409262001520.31206@cbobk.fhfr.pm>
References: <DD9C41AD-6543-47CE-8504-69E4992229B2@live.com>
 <MA0P287MB02176175318B96135BE3E320B8902@MA0P287MB0217.INDP287.PROD.OUTLOOK.COM>
 <nycvar.YFH.7.76.2409111420040.31206@cbobk.fhfr.pm>
 <MA0P287MB0217A06CA89D6A7D0631466EB86A2@MA0P287MB0217.INDP287.PROD.OUTLOOK.COM>
User-Agent: Alpine 2.21 (LSU 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
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

On Thu, 26 Sep 2024, Aditya Garg wrote:

> It has been more than a month since I've sent this patch set and I 
> haven't got a clear yes or not for the same. I understand maintainers 
> are busy people, but I'd really appreciate if I get some response for 
> this series of patches from the HID and DRM maintainers.

Just to reiterate -- I am waiting for Ack from the DRM people and will 
then take it through hid.git.

Dave, who'd be the best person to do this from the DRM side please?

Thanks,

-- 
Jiri Kosina
SUSE Labs

