Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2EF287E912D
	for <lists+dri-devel@lfdr.de>; Sun, 12 Nov 2023 15:23:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 81DF610E14C;
	Sun, 12 Nov 2023 14:23:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mo4-p01-ob.smtp.rzone.de (mo4-p01-ob.smtp.rzone.de
 [81.169.146.166])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3A7A610E14C
 for <dri-devel@lists.freedesktop.org>; Sun, 12 Nov 2023 14:23:30 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1699798986; cv=none;
 d=strato.com; s=strato-dkim-0002;
 b=dio4lLbn3/jywnt801rAbBsamvYYadyWIE+isnwe7sgJp1wTSdBSXDzxiX2G8QS+ck
 IdQuiUONaA9hokBMNWi5TWMqp7GuHnvEs4tacF646OWNQOfi3Gv8B5NSNMS1Mu4f5Ecn
 UtQwpnZaRqZMkXzYj3OFd9M58eMi8C7HFpkln5UuBJF86ddF8TcGYypsTUyTvtDwrMW2
 sY2eZ4UXOl38dLped/oajh/hy3zaVkgYzutSbmbCSW6KeXmzPKNeNqHewfMFWT95GWrb
 7UNN2p/v1lSuFbCrWKfdIVMoHU87SdP6swB/EwX+6comoQ3Lc/rKxxUnv12V4DJfLniE
 ksHQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; t=1699798986;
 s=strato-dkim-0002; d=strato.com;
 h=In-Reply-To:References:Cc:To:From:Subject:Date:Message-ID:Cc:Date:
 From:Subject:Sender;
 bh=mjG7YwAJp4k2QkZinnk5octoydC6gLIVGWiY+XAd17I=;
 b=mgKVqHF8ndl61qyh+sv8NneA1bjfrfhGCK+nJ6EqBahTrGPwbkYeBwGkqEW33KZTRU
 HRrtV3bTOiXMCJI7sevlwa+SNEpkbkAbF23iU62/N94FUw216Jicg5n9jmCydHqFqdEV
 VVGLTd1ReO8GGwqVbvA8dzGVDx8IZT0MfMjEkY6GW8sGiJEbawMqt1HsgG6O0YqYiZba
 VYeRwFL4nLmONSNPOgT+KFAqOmueUM74WvxAwoo5V6S/5CWlzEqQxCX18OMsZpnlyZML
 7/WHGsT+mQrZHueHxfHI8q3QYb7WBeREjMHYWMHn2D9ANYISFpxQFlulwQbY5ziHrZJp
 HGfw==
ARC-Authentication-Results: i=1; strato.com;
    arc=none;
    dkim=none
X-RZG-CLASS-ID: mo01
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1699798986;
 s=strato-dkim-0002; d=xenosoft.de;
 h=In-Reply-To:References:Cc:To:From:Subject:Date:Message-ID:Cc:Date:
 From:Subject:Sender;
 bh=mjG7YwAJp4k2QkZinnk5octoydC6gLIVGWiY+XAd17I=;
 b=gfNLXMCC/egprOcO6Myhmbx7N6bIUGYfbobLbxzy6Jex2VHbNP0RMGeuB22oCDx5Zu
 MDkWUvcTrmTnik5L2aBja6nNdydESxevlAuA++BjM75Le7OVCbl2aLT7Wzv9ky19GBm8
 oTR4Q46Fsvno6XWNtE9kC2GKgiMdoyZi96XZJOQxovWpF05bZ/iyRLctniYX6Z2ceUEr
 kertOJdcdGyuCL3rNrzhuV2f3mJ6cc1RPb0lvBFsaYyXnDxdAB1oT5aY6COtnvTLjeji
 +LeFlBvLspIniPmGnTGxbhd4urAysucm9nB23L+rN9HTQV5/HhK8k3FTZ/DI7Tc7iOh1
 PMBA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; t=1699798986;
 s=strato-dkim-0003; d=xenosoft.de;
 h=In-Reply-To:References:Cc:To:From:Subject:Date:Message-ID:Cc:Date:
 From:Subject:Sender;
 bh=mjG7YwAJp4k2QkZinnk5octoydC6gLIVGWiY+XAd17I=;
 b=Lx+p2LNn3AFZ55m69P3h8vWnKnDDYYRIs+kf6ZxlFde1A/tG0q1ZqIRHgzMsJwhS3L
 aOg3x5YVyEZUH0kWGHDw==
X-RZG-AUTH: ":L2QefEenb+UdBJSdRCXu93KJ1bmSGnhMdmOod1DhGM4l4Hio94KKxRySfLxnHfJ+Dkjp5DdBfi4XXBswJY16kD3CwXgXvoho5EVcTpYNLI+8gQ=="
Received: from [IPV6:2a02:8109:8984:5d00:9968:b934:532f:387a]
 by smtp.strato.de (RZmta 49.9.1 AUTH) with ESMTPSA id m61756zACEN5NtO
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
 (Client did not present a certificate);
 Sun, 12 Nov 2023 15:23:05 +0100 (CET)
Message-ID: <6530cea3-4507-454e-bc36-a6970c8e7578@xenosoft.de>
Date: Sun, 12 Nov 2023 15:23:04 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Fbdev issue after the drm updates 'drm-next-2023-10-31-1'
From: Christian Zigotzky <chzigotzky@xenosoft.de>
To: Maling list - DRI developers <dri-devel@lists.freedesktop.org>,
 =?UTF-8?Q?Michel_D=C3=A4nzer?= <michel@daenzer.net>, airlied@gmail.com,
 deller@gmx.de, kraxel@cs.tu-berlin.de,
 Geert Uytterhoeven <geert@linux-m68k.org>
References: <a1d9e09b-f533-5e2c-7a13-af96647e1a71@embeddedor.com>
 <10D1983F-33EF-46C3-976E-463D1CB5A6E9@xenosoft.de>
 <9bb5fcbd-daf5-1669-b3e7-b8624b3c36f9@xenosoft.de>
 <c47fba21-3ae9-4021-9f4a-09c2670ebdbc@xenosoft.de>
 <0d89bcd0-9b68-4c0a-acd8-2c7532e62f6d@xenosoft.de>
Content-Language: de-DE
In-Reply-To: <0d89bcd0-9b68-4c0a-acd8-2c7532e62f6d@xenosoft.de>
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

+ Helge Deller <deller@gmx.de>
+ Gerd Knorr <kraxel@cs.tu-berlin.de>
+ Geert Uytterhoeven <geert@linux-m68k.org>


On 07 November 2023 at 09:36 am, Christian Zigotzky wrote:
> Hello,
>
> I have found out that fbdev no longer works with virtio-gpu-pci and 
> virtio-vga. It is not a problem with the penguin logos.
>
> Could you please check fbdev in QEMU virtual machines with 
> virtio-gpu-pci and virtio-vga graphics?
>
> Many thanks in advance,
>
> Christian
>
>
> On 02 November 2023 at 03:45 pm, Christian Zigotzky wrote:
>> Hello,
>>
>> There is a fbdev issue with the virtio-gpu-pci and virtio-vga. (The 
>> penguins are not displayed at boot time)
>>
>> Error message:  [    0.889302] virtio-pci 0000:00:02.0: [drm] *ERROR* 
>> fbdev: Failed to setup generic emulation (ret=-2)
>>
>> The kernel 6.6 final doesn't have this issue.
>>
>> Please check the fbdev changes in the drm updates 
>> 'drm-next-2023-10-31-1'.
>>
>> Thanks,
>> Christian
>

