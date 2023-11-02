Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D10B7DF56E
	for <lists+dri-devel@lfdr.de>; Thu,  2 Nov 2023 15:58:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9424C10E8DE;
	Thu,  2 Nov 2023 14:58:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 705 seconds by postgrey-1.36 at gabe;
 Thu, 02 Nov 2023 14:58:04 UTC
Received: from mo4-p01-ob.smtp.rzone.de (mo4-p01-ob.smtp.rzone.de
 [81.169.146.164])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8330310E8D8
 for <dri-devel@lists.freedesktop.org>; Thu,  2 Nov 2023 14:58:04 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1698936359; cv=none;
 d=strato.com; s=strato-dkim-0002;
 b=RP7qF55grm6E+/IZejlk7Tc+GbC/09azxoCcbWF3AP7idyz+6RSkuOITDX77eCWqPM
 WK87pCXstjXcwWuuY54IIOGYqemy5hELXNfuyfBInvxAziuMroNqhL5E9dZXsTPDve+Z
 430FE3ZC5PFhwh1xqeV5BazTRg9Z0U7vkZOdIjkgtFKsaKAAZDUQEHH6MNwyJSV4lVsu
 SgIMJ9ZC7m+qnL/U7/28a2VGBS13SqSk4Z/+1DwFzgAb0+Ct2T4OYi56nCpnzUVuw/wZ
 Pq9lmOjwQkwT3VLsxOvtpGvPK8zpVIXlPAWYCyyz3Z7A0BGktwxftdxNFuEVZT4ds2DD
 Yw9w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; t=1698936359;
 s=strato-dkim-0002; d=strato.com;
 h=In-Reply-To:References:Cc:To:From:Subject:Date:Message-ID:Cc:Date:
 From:Subject:Sender;
 bh=qtPFIfgVAkjEIk8Kp4nDjcvuBALChWXRANLp0TFLX/8=;
 b=MLPkEeoFXLVo2IXy4HZDluyQOXL386QAA4c/u6rAOL/eSBs18Y6cyxYYwJ3jw5MC7l
 Q+PjjBx/D3FMNBYlEpNGF/j/6714IEuvQafyXuNPoT0NxqNqZpEoYSWals+6X8Xd92+N
 R0XjkShFEKBQDWxXukIw44GCmkdRFTTRkE5VM9wmoywo6k3uKutMuWyB0IqnKef5WotX
 rGe4oqCDi0WgLmu/jQ58l8jdM8WJ4v9oQWrpPXWfljWjDnThPVpRR1lNtINBoVBnEBKQ
 A3MOFCChEjr1PQbNIMXp+yPIq4kp1E9ONLH7cNpQ3Hk+gesInopcWwLSE9xX3QnlZFcn
 kb9A==
ARC-Authentication-Results: i=1; strato.com;
    arc=none;
    dkim=none
X-RZG-CLASS-ID: mo01
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1698936359;
 s=strato-dkim-0002; d=xenosoft.de;
 h=In-Reply-To:References:Cc:To:From:Subject:Date:Message-ID:Cc:Date:
 From:Subject:Sender;
 bh=qtPFIfgVAkjEIk8Kp4nDjcvuBALChWXRANLp0TFLX/8=;
 b=iMztjmTYsx5UkYPaulqZHLsXpVn2xeTqD4txWKNPBGs0Tv+02LwL5/jAxRVem2chSa
 8fHHo2k0TZRajj/5guP5k5WEOtrr9z5urVvGKgSSvbcrW6b4if58qPrntcKF6phUG5Le
 AoefrW/180/vPUtVM3JklenZ0//TUvANLQD3Uq4Jer8YZ68HgIcVxYEV76OOYOXVCv5E
 mLQ/U6EGLPE2nZD2VZGNHI9QlgfHe/x4N+SFmXiUXvAXh2vMQUj/16jR6VsNLUGrZACD
 VqPUvCpfYDz6bvuVDzyQECbiQMPffUH+KdIvzoSggRE9hhJHwEQCBiz3qzvpopPLY+BS
 UtXA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; t=1698936359;
 s=strato-dkim-0003; d=xenosoft.de;
 h=In-Reply-To:References:Cc:To:From:Subject:Date:Message-ID:Cc:Date:
 From:Subject:Sender;
 bh=qtPFIfgVAkjEIk8Kp4nDjcvuBALChWXRANLp0TFLX/8=;
 b=k7U8ubAcuz1t6//aPG7e8FbPz3BcWWLIKYsyF+Tnd0MSjp75gSIkalaSg+bn2DKt5i
 dLinFuZgUiFbCtaB20BA==
X-RZG-AUTH: ":L2QefEenb+UdBJSdRCXu93KJ1bmSGnhMdmOod1DhGM4l4Hio94KKxRySfLxnHfJ+Dkjp5DdBfi4XXBswJY0hzUZlL7nnJJC35Rs6bya78Fhg"
Received: from [IPV6:2a02:8109:8984:5d00:bdcf:160a:a05:bd18]
 by smtp.strato.de (RZmta 49.9.1 AUTH) with ESMTPSA id m61756zA2EjwcjA
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
 (Client did not present a certificate);
 Thu, 2 Nov 2023 15:45:58 +0100 (CET)
Message-ID: <c47fba21-3ae9-4021-9f4a-09c2670ebdbc@xenosoft.de>
Date: Thu, 2 Nov 2023 15:45:58 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Fbdev issue after the drm updates 'drm-next-2023-10-31-1'
From: Christian Zigotzky <chzigotzky@xenosoft.de>
To: Maling list - DRI developers <dri-devel@lists.freedesktop.org>,
 =?UTF-8?Q?Michel_D=C3=A4nzer?= <michel@daenzer.net>, airlied@gmail.com
References: <a1d9e09b-f533-5e2c-7a13-af96647e1a71@embeddedor.com>
 <10D1983F-33EF-46C3-976E-463D1CB5A6E9@xenosoft.de>
 <9bb5fcbd-daf5-1669-b3e7-b8624b3c36f9@xenosoft.de>
Content-Language: de-DE
In-Reply-To: <9bb5fcbd-daf5-1669-b3e7-b8624b3c36f9@xenosoft.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
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
Cc: Darren Stevens <darren@stevens-zone.net>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 "R.T.Dickinson" <rtd2@xtra.co.nz>, mad skateman <madskateman@gmail.com>,
 Christian Zigotzky <info@xenosoft.de>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hello,

There is a fbdev issue with the virtio-gpu-pci and virtio-vga. (The 
penguins are not displayed at boot time)

Error message:  [    0.889302] virtio-pci 0000:00:02.0: [drm] *ERROR* 
fbdev: Failed to setup generic emulation (ret=-2)

The kernel 6.6 final doesn't have this issue.

Please check the fbdev changes in the drm updates 'drm-next-2023-10-31-1'.

Thanks,
Christian
