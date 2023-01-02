Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B8B5D65BC23
	for <lists+dri-devel@lfdr.de>; Tue,  3 Jan 2023 09:25:05 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0190C10E24F;
	Tue,  3 Jan 2023 08:24:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 314 seconds by postgrey-1.36 at gabe;
 Mon, 02 Jan 2023 10:39:20 UTC
Received: from mout.gmx.net (mout.gmx.net [212.227.15.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4BA6710E16E
 for <dri-devel@lists.freedesktop.org>; Mon,  2 Jan 2023 10:39:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.ch; s=s31663417;
 t=1672655955; bh=le00TsP+r/dWYsocjTldOuUeZzcZibPnf3GxCIea4CA=;
 h=X-UI-Sender-Class:Date:Subject:To:Cc:References:From:In-Reply-To;
 b=VhSIObmi0y0bqvS25bS844wLhw/odfN1UopnpWOpDA947CyBYxn6fhgVOOBtIgWVC
 bW9ZNhHXPcZcF71w3hwno9lCm5SGPw3CUgFu3vxjP0KMNfGIFTDawfbhacH6wmXGqR
 EP7fPp+NC7DaJnaNzuOZaZQ7K0WE49n3Yw5vdCriCFa3i/E+5HU2U4dh2+HOzE07AC
 abbBb9MSQ6QW8z4+tydUT+KYONMuL2KiqotJ7MYHM1kMmLVvOsrHLegy9AgKwsttST
 Q5kPl+DmGK5p0wbpaBVO78+OI38HSkL6IUHg/QxYO7N2q8Fjsu1FYy4HyMwuIW2o9r
 0hbhvLDn65/5A==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.100.106] ([89.217.230.95]) by mail.gmx.net (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MBDjA-1p6Dbi2H8A-00Clya; Mon, 02
 Jan 2023 11:34:00 +0100
Message-ID: <4ddb5909-0f1e-d701-5678-ce7f3a57446b@gmx.ch>
Date: Mon, 2 Jan 2023 11:33:59 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH 2/2] vfio/pci: Remove console drivers
Content-Language: en-US
To: "mb@lab.how" <mb@lab.how>, Thomas Zimmermann <tzimmermann@suse.de>
References: <CAEdEoBYXHq9cCzsbMYTpG1B41Yz=-QAjFx7bJDOnPanN5Tmo7A@mail.gmail.com>
 <20221204175142.658d5c37.alex.williamson@redhat.com>
 <1e4d62cf-8893-0bff-51f5-5a2e419ed5a0@suse.de>
 <CAEdEoBYZa9cg0nq=P7EDsDS9m2EKYrd8M8ucqi8U0Csj0mtjDg@mail.gmail.com>
 <c1c8bfa5-8ba4-c365-1663-535f656ca353@suse.de>
 <CAEdEoBaixaTEuNfQGv1das7TwHKV9MiRMKQM0kLspveJmipzyg@mail.gmail.com>
From: Shawn Michaels <shawn_michaels@gmx.ch>
In-Reply-To: <CAEdEoBaixaTEuNfQGv1das7TwHKV9MiRMKQM0kLspveJmipzyg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Provags-ID: V03:K1:qqG346XXu7KgwSPHUbVfmllcgd5cT4QzwWYi1Ot1NgviNO1WbqX
 AeJvhaKR67wBUgK1L1PQP/ywUImVLYd3GGb/rxRGQcJGnlSz/bB/cOyUQdzx2kIgwo6DD7E
 12QofRuibf2Ng2c1/l6hQFoNK7Qh5rZTg6D8kgSA4EIO20aYyukUEyJ3dcAZukJ3v9fGSWI
 nGqNJl0jPf0mBbgPXQPqg==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:LWaH++l2rFQ=;y4hfKGjhIQeburLCHaJnqinMXLT
 9KWeUj6/1uZTPq2A8IX8+fBFJBYIEs7WWEF6hkVl6fgO0UCGgXgxb1tsQlnxbS7CKSR75HE9n
 RdfGzVs8HIJXt07AyGt0Q41d75o6/DOuiYlpoaN02/znXa35GBeKChhApiPXJnwaSURCL+MN+
 rd33Z8zZcEpRT+fX9of5lZcHYXZYJz3HpyryDg8j/etMFAUnltJ5BGxaxt0qwHmU1FluzS/lr
 u/3UNYaq+mlgsYzwSrnCPp8juOZpv5l7RIiUmyyFCvLCr/R9l/s0ZJHxItbeU+ViQbvdbgOmA
 Xjfh7OJ2isjWXxpn6SM1dSbB9WSWdFc80yXvq8f57ZibdZV/uHx2udYE6SZChvgoxKrq4Jcju
 VkrHxbOGma+Bt5PpddYTREVrMIXcp2wTANgI5fQFziRBQSTiCHYqgE4t9cl3vq/OlNxyLgxCt
 pWkmivXY0lJFv2C/H9cc89vupf9DEyBNNyOz60FkQAOIjK/M1nZVNv0QcwqfYpdb7VT41exHA
 PXOF1evWeVVDCLEtC97VnesjR4r20GRZqBDSRIV/1yTEUfczpb6ZkV0gsDz6qX/LJyYI2c8nP
 mK4Pn5ari2Mgy0eb/NH7hJL77rgl2zELapKVdQQdAeV28zVUUg0zOPeFgKYHHcYsg42/bmLxR
 e8kuYrZ964i7wBWAo/GACAViJ1PbKrX88XRg/gE57lceyPzs3FR03OIDdrrSWf3WjRvEWNOyR
 HNIsSN+4hfLjgV9LjE6SGOqVUz3Ab27DWBve146C4g5o9vOnfwqRGyij608FUwoee/OsydqSq
 HoNxZGq3sNwa2ewxMr3PfNOui304Htp7xF2W5MONiN4iRV8ojbZybD6nziRiWXFEieTWwfwb8
 fqIp2LLyaGwWyw13jEuJZUx+wcMCo2Y28awFbsRAtNoEA9w2X5gYgHJwPKojWWzABSKPafOAR
 HxwjcQ==
X-Mailman-Approved-At: Tue, 03 Jan 2023 08:24:55 +0000
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
Cc: kvm@vger.kernel.org, airlied@linux.ie, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Alex Williamson <alex.williamson@redhat.com>,
 kraxel@redhat.com, lersek@redhat.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

I just upgraded my system (after 7 months) and I also lost my framebuffer on boot.
At first, I thought that my computer was freezing on startup, but it turns out
that it is running fine (I can SSH to it and even startx remotely), only the
framebuffer stops working very early on boot:

	:: running early hook [udev]
	Starting systemd-udevd version 252.4-2-arch
	[3.400568] VFIO - User Level meta-driver version: 0.3
	*LOSING FRAMEBUFFER HERE*

Running startx from an SSH session starts my X server and display works again.

I have two identical GPU cards (nVidia GTX 1070). I have been using the method
from [1] for years in order to prevent the nvidia driver from grabbing my guest
GPU. As mb already pointed out, vfio_pci now kills the framebuffer of the host
GPU even though it is assigned to the guest GPU. I could isolate it to the
following line from [1]:

	echo "vfio-pci" > "$GPU/driver_override"

I also double checked and this is correctly written to the guest GPU, and not
to the host GPU. My kernel version is:

	Linux cc 6.1.1-arch1-1 #1 SMP PREEMPT_DYNAMIC Wed, 21 Dec 2022 22:27:55 +0000 x86_64 GNU/Linux

You can find people having the same issue in threads from [2] and [3]. There are
also some reports on the VFIO discord server.

This is a problem for people using an encrypted filesystem (password needs to be
typed blindly) or in case boot fails for some reason (and you cannot see console
logs). In my case, I switched from manually starting X with startx to using a
graphical login manager. Blacklisting the vfio_pci module by passing the following
kernel parameter brings the boot console back:

	module_blacklist=vfio_pci

Happy new year everyone

Shawn

[1] https://wiki.archlinux.org/title/PCI_passthrough_via_OVMF#Passthrough_all_GPUs_but_the_boot_GPU
[2] https://bbs.archlinux.org/viewtopic.php?pid=2063423
[3] https://forum.level1techs.com/t/linux-kernel-6-seems-to-be-incompatible-with-the-vfio-pci-module-needed-for-pci-passthrough/190039/11

