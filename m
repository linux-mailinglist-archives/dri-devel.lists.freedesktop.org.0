Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 46F20B1B720
	for <lists+dri-devel@lfdr.de>; Tue,  5 Aug 2025 17:07:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E02E210E17C;
	Tue,  5 Aug 2025 15:07:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=xenosoft.de header.i=@xenosoft.de header.b="UtW3xNul";
	dkim=permerror (0-bit key) header.d=xenosoft.de header.i=@xenosoft.de header.b="/VuVr0ey";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 110857 seconds by postgrey-1.36 at gabe;
 Tue, 05 Aug 2025 15:07:00 UTC
Received: from mo4-p02-ob.smtp.rzone.de (mo4-p02-ob.smtp.rzone.de
 [81.169.146.169])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F0ADD10E17C
 for <dri-devel@lists.freedesktop.org>; Tue,  5 Aug 2025 15:07:00 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1754406324; cv=none;
 d=strato.com; s=strato-dkim-0002;
 b=fgRbQ5zUhRnflwfCjOlK90oksMsU6ipBwgMm9uc+df/bCRQAzFA3jHYKU88iZRsChR
 k+qQG/Z1jrdH14Crq7S7I8KUuHTLB5hgbyjMj0HsxzNxDOKsmDRLO05K9vz+jzrboIlF
 9Nib2tb9TtUAIuMiMc2G1Vk8H1dnacXRw9BmaymPMfOm8FkPOiYnVTQzaYBi2fXPN6Cp
 2F7XgQZKRyJLmj5dy3henOaVBbdBDNp/QMHsMYR4OK25CGwb2kIWYF5HiTtGn6Wl5uKi
 Exe0DkP2NSOwKWNp6oHuj/k9doWnuHWZEQEndAobRLwpSjMEX9x1nlm1cDrEcMMHL/w1
 3IOQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; t=1754406324;
 s=strato-dkim-0002; d=strato.com;
 h=In-Reply-To:Date:Message-ID:References:To:From:Subject:Cc:Date:From:
 Subject:Sender;
 bh=9P3R4bXNvZUH1Y9NZ9ByMStxmHC3/CrOso5VMFYCiWc=;
 b=a9ytIFBIvvsKbVYFcbXkOEp4ZJf9XPBUJJPKsQih2pS8UX0Faihsz9p3S7dZJ9BA9f
 KlwyZfU+1qp1o2QGlql4BNDajoWSA06FER/EVrBjWC2w0XKXm21t/BoEFhWLllmdiOhV
 QdnpbCSNpsIKINFr2sztW3SRrLLHgL/NxXpxvQ0AuSCvgdddaTDpXdp1rfFe2KVuLg9T
 RAQGuXge1E4knuMSjDN9Li92Z8pJCdjRBGF6rxRKokEPpCr/Ok1TfJpykloWAuXDFQF+
 c0NMUJ8Pqs/Y3e8Pg9QpWgbrIc5TlcYf9rY0eRggHLStTmarDT4/vgn3QjIxq3JejY1O
 S3IQ==
ARC-Authentication-Results: i=1; strato.com;
    arc=none;
    dkim=none
X-RZG-CLASS-ID: mo02
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1754406324;
 s=strato-dkim-0002; d=xenosoft.de;
 h=In-Reply-To:Date:Message-ID:References:To:From:Subject:Cc:Date:From:
 Subject:Sender;
 bh=9P3R4bXNvZUH1Y9NZ9ByMStxmHC3/CrOso5VMFYCiWc=;
 b=UtW3xNul30Fc1nmj7i3hE08b/Ox68PDVHclKRxXZktH2dlmFWr6EoYRNObitBsMFzq
 IIa6qEOouahJxQLXPPGT+FXAaVeRXa6Jv4jR1R1zw+hGTzqKfST3TAQXg/hSUrPGtV9Q
 aaQoU7VYlk1F6hHImLzfYhXI7aoV+Akb9Nmwy3MKh66I8Yko4cHlu0xAcIh+LjDnAyvI
 XaePNBp8nccThtLkkxdC6+WW3uCFNMgtggDw0C+vKsmbsxnSGRim7a32lm9meSXiF87T
 gKbIBzwkGeEMAhIFh+49V6dwFmzsx65dMCYpVa6B8DCUdZHpumZWmMYFF7Mz5qqTrmH7
 o9Qw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; t=1754406324;
 s=strato-dkim-0003; d=xenosoft.de;
 h=In-Reply-To:Date:Message-ID:References:To:From:Subject:Cc:Date:From:
 Subject:Sender;
 bh=9P3R4bXNvZUH1Y9NZ9ByMStxmHC3/CrOso5VMFYCiWc=;
 b=/VuVr0eyHwhEgbbhpMMvFiwAD+nbNPloUcmg16YCvYJ4Kpmn0wL/pI8qChYJpeNqHn
 fcNpz/Q5gRUWySSXRGCA==
X-RZG-AUTH: ":L2QefEenb+UdBJSdRCXu93KJ1bmSGnhMdmOod1DhGN0rBVhd9dFr6P1rfO5KiO55fErqxu2Eb6sxKV3/YxiaQ02jtbYNVUhhB5DTrFOLgA=="
Received: from [IPv6:2001:16b8:50f0:3000:cf5c:728c:e924:df58]
 by smtp.strato.de (RZmta 52.1.2 AUTH) with ESMTPSA id e6066c175F5Mwwo
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
 (Client did not present a certificate);
 Tue, 5 Aug 2025 17:05:22 +0200 (CEST)
Subject: [Linux PPC] [X1000] [e5500] Kernel 6.17 testing and DRM issue
From: Christian Zigotzky <chzigotzky@xenosoft.de>
To: Jamie Krueger <jamie@bitbybitsoftwaregroup.com>,
 =?UTF-8?Q?G=c3=bcrkan_Sinan?= <sinan.amigaone@gmail.com>,
 Julian Margetson <runaway@candw.ms>, Darren Stevens
 <darren@stevens-zone.net>, Steven Jeffery <sajeffer@gmail.com>,
 Pat Wall <pjwall@mac.com>, Pat Wall <pjwall@me.com>,
 Lyle Hazelwood <lylehaze@gmail.com>, Steve-David Marguet <steve@esdeem.ch>,
 George Sokianos <walkero@gmail.com>, TJ Ferreira <macsociety1@gmail.com>,
 Christian Zigotzky <info@xenosoft.de>, pjs@pjsa.net,
 Ben Cato Malkenes <ben.cato@gmail.com>, Kenneth Lester <ken@five-star.com>,
 madskateman@gmail.com, Allan Cairns <acefnq@gmail.com>,
 "R.T.Dickinson" <rtd2@xtra.co.nz>, Daniel Reimann <halle_saale@arcor.de>,
 hypexed@yahoo.com.au, Alex Deucher <alexander.deucher@amd.com>,
 developers DRI <dri-devel@lists.freedesktop.org>,
 linuxppc-dev@lists.ozlabs.org
References: <3D84DBE3-1A8B-4BBD-8663-B7B5D1B36B27@xenosoft.de>
 <29E89652-6101-46CD-850B-846BB4EC59A0@xenosoft.de>
Organization: A-EON
Message-ID: <d5225281-5a90-7e3b-840e-bb5c3d7eda7a@xenosoft.de>
Date: Tue, 5 Aug 2025 17:08:02 +0200
X-Mailer: BrassMonkey/33.7.2
MIME-Version: 1.0
In-Reply-To: <29E89652-6101-46CD-850B-846BB4EC59A0@xenosoft.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
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

On 05.08.2025 15:12, Christian Zigotzky wrote:
> Hi All,
>
> Here is the alpha5 of kernel 6.17 for X1000 and e5500 machines (X5000/20, X5000/40, Mirari, and QEMU VMs).
>
> I created kernels with and without the drm-next-2025-07-30 updates [1] because of the issue with the Radeon graphics framebuffer device #15. [2]
>
> Download and further information: https://github.com/chzigotzky/kernels/releases/tag/v6.17.0-alpha5
>
> Please test both kernels.
>
> Thanks,
> Christian
>
> [1] https://web.git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=260f6f4fda93c8485c8037865c941b42b9cba5d2
>
> [2] https://github.com/chzigotzky/kernels/issues/15
I tested both kernels on my X1000 today and I can definitely confirm, 
that the issue is somewhere in the commit drm-next-2025-07-30 updates [1]

The Radeon graphics framebuffer doesn't work with the kernel with the 
drm-next-2025-07-30 updates [1]. Without these updates, the framebuffer 
works.

-- Christian


[1] 
https://web.git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=260f6f4fda93c8485c8037865c941b42b9cba5d2

-- 
Sent with BrassMonkey 33.7.2 (https://github.com/chzigotzky/Web-Browsers-and-Suites-for-Linux-PPC/releases/tag/BrassMonkey_33.7.2)

