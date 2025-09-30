Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A0E9DBAEA46
	for <lists+dri-devel@lfdr.de>; Wed, 01 Oct 2025 00:05:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7EF1310E049;
	Tue, 30 Sep 2025 22:05:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="N6FGlfXY";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7483110E049
 for <dri-devel@lists.freedesktop.org>; Tue, 30 Sep 2025 22:05:15 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 7BDBC61244;
 Tue, 30 Sep 2025 22:05:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B77F9C4CEF0;
 Tue, 30 Sep 2025 22:05:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1759269914;
 bh=CR+oDBlxH+wJG2IaTz6xx9ORxqdao+j6vCNUPR5fcqk=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=N6FGlfXYVPrw+RIVXIQV2hF66+/z8rW9HJJQ7jXRju3ek7X4ydhic/wFCE2Zc+hbX
 Kvd4jWlup0zuTMibWUdcl4Utmypg5Ppr6nW+rengren7rUOB9pJBPxNjND0otGxQ8a
 51fKSZyEQjhPrQDxkuI6RGiyL8MA5cLfzecAj/Q5flYt49dAwUEewUE0PTGbUiQq9w
 iFEVhsyvWkU81EimfpkRXPk1OmfXekxoYuX/xZdOP1xxu97OrmQ/vf7wBZkT746aNF
 uelHffQGkf2aCeCG5obUOkR9925uv3IxbG8wLO4If25xCjLLtPKyKg/o7jY0od3wUo
 H5vvqlknYfAfw==
Date: Tue, 30 Sep 2025 22:05:12 +0000
From: Wei Liu <wei.liu@kernel.org>
To: Mukesh R <mrathor@linux.microsoft.com>
Cc: Greg KH <gregkh@linuxfoundation.org>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, linux-input@vger.kernel.org,
 linux-hyperv@vger.kernel.org, netdev@vger.kernel.org,
 linux-pci@vger.kernel.org, linux-scsi@vger.kernel.org,
 linux-fbdev@vger.kernel.org, linux-arch@vger.kernel.org,
 virtualization@lists.linux.dev, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, tzimmermann@suse.de, airlied@gmail.com,
 simona@ffwll.ch, jikos@kernel.org, bentiss@kernel.org,
 kys@microsoft.com, haiyangz@microsoft.com, wei.liu@kernel.org,
 decui@microsoft.com, dmitry.torokhov@gmail.com,
 andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@google.com,
 kuba@kernel.org, pabeni@redhat.com, bhelgaas@google.com,
 James.Bottomley@hansenpartnership.com, martin.petersen@oracle.com,
 deller@gmx.de, arnd@arndb.de, sgarzare@redhat.com, horms@kernel.org
Subject: Re: [PATCH v1 2/2] Drivers: hv: Make CONFIG_HYPERV bool
Message-ID: <aNxUGNmRyPCzyUCb@liuwe-devbox-ubuntu-v2.lamzopl0uupeniq2etz1fddiyg.xx.internal.cloudapp.net>
References: <20250906010952.2145389-1-mrathor@linux.microsoft.com>
 <20250906010952.2145389-3-mrathor@linux.microsoft.com>
 <2025090621-rumble-cost-2c0d@gregkh>
 <d7d7b23f-eaea-2dbc-9c9d-4bee082f6fe7@linux.microsoft.com>
 <2025091253-overwrite-carol-b197@gregkh>
 <a8c8305c-b518-c840-fc64-50bcba302725@linux.microsoft.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <a8c8305c-b518-c840-fc64-50bcba302725@linux.microsoft.com>
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

On Fri, Sep 12, 2025 at 11:10:00AM -0700, Mukesh R wrote:
[...]
> > What was it made against?
> > 
> 
> Sorry to hear that. It was built against hyper-next, but perhaps I 
> accidentally used our internal mirror. Let me rebase and send V2
> right away.

Sorry for the late reply -- I was away for two weeks. I can pick this
series up.

Greg, feel free to ignore this series.

Wei

> 
> Thanks,
> -Mukesh
> 
> 
> 
