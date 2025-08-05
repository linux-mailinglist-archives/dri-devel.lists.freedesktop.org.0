Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 87850B1B787
	for <lists+dri-devel@lfdr.de>; Tue,  5 Aug 2025 17:33:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C8C4610E6B6;
	Tue,  5 Aug 2025 15:33:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=xenosoft.de header.i=@xenosoft.de header.b="WtQZIQha";
	dkim=permerror (0-bit key) header.d=xenosoft.de header.i=@xenosoft.de header.b="4niWqeKr";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mo4-p02-ob.smtp.rzone.de (mo4-p02-ob.smtp.rzone.de
 [81.169.146.168])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DB78410E6B6
 for <dri-devel@lists.freedesktop.org>; Tue,  5 Aug 2025 15:33:16 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1754407907; cv=none;
 d=strato.com; s=strato-dkim-0002;
 b=aEDRsie7BDVTyeDQQpy83PtWfAsBvkoGwqqpLwHyWGvzZ45u7KxPCMQMBoVqRFi4GV
 Q4fnh3MjjaW4FvJ11uKCAhunSUR3EfehLs3Wyeqrj4n40Zn4+KdvSLX2qNNL8LLg0Rcl
 ueIgr1osr6FR5PsyeALsGVehsva6pIulcZleITaA2risQs/18Y3ZMIMoXjkp7ub3pzd/
 q7WLcxminkY/eb1iMrKuV3bRdEE1qOQW7IQM1xUXYpkcKDeYWkLQdGSrnrwOM9GdAPbJ
 hwuKkyj0NImZECEJu28FQZMXc9ClFMdgKgfk8LkzKkq3da+nq++LHqGNGuTvPHrKHOH3
 9wCA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; t=1754407907;
 s=strato-dkim-0002; d=strato.com;
 h=In-Reply-To:Date:Message-ID:References:To:From:Subject:Cc:Date:From:
 Subject:Sender;
 bh=IqzbW0bVaN5Qic6Q627tbDjP+Ulc5486yfbca1WVBJo=;
 b=B3bpWTru9AFoPfXlk0jyJbp0W9E3cOrYf3ngVfp+VqSry5ouWs6xqIEv6hxebatAc0
 tPhsMH2GaxsAyrThr8wY7RYWnMPU5g3oxBBsTz/p1aSjlegaRibdHHWs0IHUsQyiF734
 9CCFrUYjHlwtV71pC0E/9ekx9z3QY21twV6DrlobEcKNEeQOLXAq4e7hqzHG3Y0TPBiQ
 rXlncArJN72EkMO9R6KN4S9oeZvtepcGQJiCEwoj4fiuyxEcKv17f48/qD8qlapj54G2
 Tg0PVfZLfILaARx+j+2F5ADMdsWUDIvZJtoe9ShPpnxOjOzIOQ87H3ieNr/cQAUglZKp
 K7VA==
ARC-Authentication-Results: i=1; strato.com;
    arc=none;
    dkim=none
X-RZG-CLASS-ID: mo02
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1754407907;
 s=strato-dkim-0002; d=xenosoft.de;
 h=In-Reply-To:Date:Message-ID:References:To:From:Subject:Cc:Date:From:
 Subject:Sender;
 bh=IqzbW0bVaN5Qic6Q627tbDjP+Ulc5486yfbca1WVBJo=;
 b=WtQZIQha08VXAW+iqDSnOmhMP3VfG2ivILA5gg6K8mWkVYMRWeqckY2I/KeNEJL3pe
 BcbY7bNvjN8KOvuRFuLvLOjW5u7Y35ldLwJQpX0HiRp90OWjKo5rCcDEQuqqbQvnIkyH
 lUcKxNXSJdois+3zkBvU7pNd5nSkd7VhLdfKLDfI+3muRKmP8oFZ3kmON2/72rlfz/zl
 Q7A6FozF4See3WBPM4JDh+ZA5hzhO5YNpbvZ6do8vR8AxRKtYd9nMgWBhZayCfvUNZ3i
 Sciv59hNkUe4hKMI1COeEEGC07Twetk78KkIgVl1J0i3W0hdPOmY1MkGcaTgUSYSjPFt
 tgew==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; t=1754407907;
 s=strato-dkim-0003; d=xenosoft.de;
 h=In-Reply-To:Date:Message-ID:References:To:From:Subject:Cc:Date:From:
 Subject:Sender;
 bh=IqzbW0bVaN5Qic6Q627tbDjP+Ulc5486yfbca1WVBJo=;
 b=4niWqeKrcCGRFmQGufMm29ZAC46HwQZJs9lDw2n9uOc+TMsU2JHhjLTUMjCBD7zeP7
 ycOux6nDQOurh+1wQVAg==
X-RZG-AUTH: ":L2QefEenb+UdBJSdRCXu93KJ1bmSGnhMdmOod1DhGN0rBVhd9dFr6P1rfO5KiO55fErqxu2Eb6sxKV3/YxiaQ02jtbYNVUhhB5DTrFOLgA=="
Received: from [IPv6:2001:16b8:50f0:3000:cf5c:728c:e924:df58]
 by smtp.strato.de (RZmta 52.1.2 AUTH) with ESMTPSA id e6066c175FVkx0d
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
 (Client did not present a certificate);
 Tue, 5 Aug 2025 17:31:46 +0200 (CEST)
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
 linuxppc-dev@lists.ozlabs.org, airlied@gmail.com
References: <3D84DBE3-1A8B-4BBD-8663-B7B5D1B36B27@xenosoft.de>
 <29E89652-6101-46CD-850B-846BB4EC59A0@xenosoft.de>
 <d5225281-5a90-7e3b-840e-bb5c3d7eda7a@xenosoft.de>
Organization: A-EON
Message-ID: <8620ee13-bc7d-33a0-290a-b27c430804f5@xenosoft.de>
Date: Tue, 5 Aug 2025 17:34:26 +0200
X-Mailer: BrassMonkey/33.7.2
MIME-Version: 1.0
In-Reply-To: <d5225281-5a90-7e3b-840e-bb5c3d7eda7a@xenosoft.de>
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

On 05.08.2025 17:08, Christian Zigotzky wrote:
> On 05.08.2025 15:12, Christian Zigotzky wrote:
>> Hi All,
>>
>> Here is the alpha5 of kernel 6.17 for X1000 and e5500 machines 
>> (X5000/20, X5000/40, Mirari, and QEMU VMs).
>>
>> I created kernels with and without the drm-next-2025-07-30 updates 
>> [1] because of the issue with the Radeon graphics framebuffer device 
>> #15. [2]
>>
>> Download and further information: 
>> https://github.com/chzigotzky/kernels/releases/tag/v6.17.0-alpha5
>>
>> Please test both kernels.
>>
>> Thanks,
>> Christian
>>
>> [1] 
>> https://web.git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=260f6f4fda93c8485c8037865c941b42b9cba5d2
>> [2] https://github.com/chzigotzky/kernels/issues/15
> I tested both kernels on my X1000 today and I can definitely confirm, 
> that the issue is somewhere in the commit drm-next-2025-07-30 updates 
> [1].
>
> The Radeon graphics framebuffer doesn't work with the kernel with the 
> drm-next-2025-07-30 updates [1]. Without these updates, the 
> framebuffer works.
>
> -- Christian
>
>
> [1] 
> https://web.git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=260f6f4fda93c8485c8037865c941b42b9cba5d2
>
There are some other user reports:

- https://forum.hyperion-entertainment.com/viewtopic.php?p=60606#p60606
- https://forum.hyperion-entertainment.com/viewtopic.php?p=60595#p60595

They use other Radeon graphics chips.

+ Dave Airlie


-- 
Sent with BrassMonkey 33.7.2 (https://github.com/chzigotzky/Web-Browsers-and-Suites-for-Linux-PPC/releases/tag/BrassMonkey_33.7.2)

