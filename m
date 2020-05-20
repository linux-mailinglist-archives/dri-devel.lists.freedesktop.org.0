Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E2A81DE057
	for <lists+dri-devel@lfdr.de>; Fri, 22 May 2020 08:56:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E151F6E988;
	Fri, 22 May 2020 06:56:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 397 seconds by postgrey-1.36 at gabe;
 Wed, 20 May 2020 10:44:05 UTC
Received: from a3.inai.de (a3.inai.de [IPv6:2a01:4f8:10b:45d8::f5])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C04CB89D8D
 for <dri-devel@lists.freedesktop.org>; Wed, 20 May 2020 10:44:05 +0000 (UTC)
Received: by a3.inai.de (Postfix, from userid 25121)
 id 76BFF593C1A70; Wed, 20 May 2020 12:37:25 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by a3.inai.de (Postfix) with ESMTP id 72BB36259D2B5;
 Wed, 20 May 2020 12:37:25 +0200 (CEST)
Date: Wed, 20 May 2020 12:37:25 +0200 (CEST)
From: Jan Engelhardt <jengelh@inai.de>
To: Sasha Levin <sashal@kernel.org>
Subject: Re: [RFC PATCH 0/4] DirectX on Linux
In-Reply-To: <20200519203608.GG33628@sasha-vm>
Message-ID: <nycvar.YFH.7.77.849.2005201222370.19642@n3.vanv.qr>
References: <20200519163234.226513-1-sashal@kernel.org>
 <CAKMK7uGnSDHdZha-=dZN5ns0sJ2CEnK2693uix4tzqyZb9MXCQ@mail.gmail.com>
 <20200519203608.GG33628@sasha-vm>
User-Agent: Alpine 2.22 (LSU 394 2020-01-19)
MIME-Version: 1.0
X-Mailman-Approved-At: Fri, 22 May 2020 06:56:07 +0000
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
Cc: linux-hyperv@vger.kernel.org, Olof Johansson <olof.johansson@gmail.com>,
 Tvrtko Ursulin <tvrtko.ursulin@intel.com>,
 Greg KH <gregkh@linuxfoundation.org>, Haiyang Zhang <haiyangz@microsoft.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>, "Wilson,
 Chris" <chris@chris-wilson.co.uk>, Jerome Glisse <jglisse@redhat.com>,
 spronovo@microsoft.com,
 Linux Fbdev development list <linux-fbdev@vger.kernel.org>,
 Jason Ekstrand <jason@jlekstrand.net>, iourit@microsoft.com,
 Alex Deucher <alexander.deucher@amd.com>,
 Stephen Hemminger <sthemmin@microsoft.com>,
 "K. Y. Srinivasan" <kys@microsoft.com>, Wei Liu <wei.liu@kernel.org>,
 Hawking Zhang <Hawking.Zhang@amd.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On Tuesday 2020-05-19 22:36, Sasha Levin wrote:
>
>> - Why DX12 on linux? Looking at this feels like classic divide and
>
> There is a single usecase for this: WSL2 developer who wants to run
> machine learning on his GPU. The developer is working on his laptop,
> which is running Windows and that laptop has a single GPU that Windows
> is using.

It does not feel right conceptually. If the target is a Windows API
(DX12/ML), why bother with Linux environments? Make it a Windows executable,
thereby skipping the WSL translation layer and passthrough.
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
