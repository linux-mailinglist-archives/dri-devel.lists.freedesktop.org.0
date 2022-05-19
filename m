Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8EDFB52CF03
	for <lists+dri-devel@lfdr.de>; Thu, 19 May 2022 11:09:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 102F511A824;
	Thu, 19 May 2022 09:08:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout.gmx.net (mout.gmx.net [212.227.15.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 25828112B7B
 for <dri-devel@lists.freedesktop.org>; Thu, 19 May 2022 09:08:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1652951329;
 bh=mow7febAtsiXYt2cZHELtD6fs3k1Y7cifTC+AMdNbm0=;
 h=X-UI-Sender-Class:Date:Subject:To:Cc:References:From:In-Reply-To;
 b=Q7XUbDCe/LyabFtLQpRjysmhHzaRsSwCdcHc+mrcAYOGzcs0LSXZcRCcgzgnBy/im
 w+l4DmLAMLok/mR0RApY5ubSsczXO26OtS5cuCfWdj/j11+fJqiMDdQVwzB+Maye2l
 9Ad5tc97i0BWDshy7GVopNg7faEfOkjyEGZq970k=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from [192.168.20.60] ([92.116.152.7]) by mail.gmx.net (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MacOW-1nKCLL02Ic-00cAlv; Thu, 19
 May 2022 11:08:49 +0200
Message-ID: <4d8738fd-f8da-9e6b-3dae-f6b8f3bf6a73@gmx.de>
Date: Thu, 19 May 2022 11:08:39 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
Subject: Re: [PATCH] video: hyperv_fb: Allow resolutions with size > 64 MB for
 Gen1
Content-Language: en-US
To: Dexuan Cui <decui@microsoft.com>, Haiyang Zhang <haiyangz@microsoft.com>, 
 Wei Liu <wei.liu@kernel.org>, Saurabh Sengar <ssengar@linux.microsoft.com>,
 "Michael Kelley (LINUX)" <mikelley@microsoft.com>
References: <1651067273-6635-1-git-send-email-ssengar@linux.microsoft.com>
 <20220428143746.sya775ro5zi3kgm3@liuwe-devbox-debian-v2>
 <DM5PR21MB1749EE7458996FF22AAA9AF8CAC39@DM5PR21MB1749.namprd21.prod.outlook.com>
 <BYAPR21MB12702855D53B456E898ED5E0BFC39@BYAPR21MB1270.namprd21.prod.outlook.com>
 <BYAPR21MB1270E4CBA78869748D28C81BBFD19@BYAPR21MB1270.namprd21.prod.outlook.com>
From: Helge Deller <deller@gmx.de>
In-Reply-To: <BYAPR21MB1270E4CBA78869748D28C81BBFD19@BYAPR21MB1270.namprd21.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:fsFTwQueqwO4oFMtMruopc536RUFH/jkjJGavwLAcqZycaqXjKl
 aOAvA6Enmc0kqQQBV3TrqonTive5CT4O7gHe3MPJeNp2X3m8uC/4yhlJhTnkHSVOq6jNsJZ
 v3BydNMRZ8uTe/2zMOG16g07i7t21L6nbs3nv+u6TW4jgO40HSSpKJ6M/0spwbCIMRamRin
 tu2qJeojqc8oIoTY2lSWA==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:kJTEzCKtHG8=:XiqDKXyew94g1dpZi0TwlA
 PI6J0k4AAHKobwYovTrfVaXEm8F4JyhC+lr8mJG935rELkCzoEgSCbo4lJ9C/YR+/R7D3risN
 LCxwMbiP/ZpCG7MFH3XXcMyKN6KVMCjYAp3abd21AQagjT7+saBZ+QjOhXCu1QwsD0yf/muTX
 Cn6IUz1RnMjdqeY33hPV2Xbk8WZogBBVe9wCcUAv3eAUkWSqdoLm/irfDqXGceHxpRDZZi2vq
 ERk05zg2PRZCs+gi4oJm9c2zVBZ+x5V+D+CyziskVSE4ifvl5TnhtxYsBQ8kk3/Ue+4twmR6q
 OjwfYLbWrXlp29LAD+cIvhrjHD2SlcyRm8B6ScHgmceENSc+osWH50hn869MWRVLXOPeRaOdk
 TxzpP9UhwAfW+XLGXz5FDqJz66oiOB3nC5dkReSNotUNh674tZoNc/8qons0pvYo6YbDxvLWe
 CkpDHsrlObQynU2r/1M57t6MA+WxTjLXW1aheDA8HXKBqNivNt+Ph7QrG21qoTy7ba4G2AGUL
 ZQfsoriUSL0jnZt6ciRDmAws1ymcirrcSr3RXNztktIioOncHoQoJFpDhqg+4BOjBPMOGDGc/
 zqjAciADxqQyjBhnaJ+kwBiGn3upVG1xyFyzztTUf9FSAib31g9CqNfkiJmmkTl4kVeyyJHN5
 tdqNhebU9tH7eayKcEwTi+dI7U0V2p+6k37xi2JmV8WzqgkiJd24BA/Uun6kPlLoezJnyvnDJ
 2UywPA/FOaFnPzaVhnDd3EjfMRj/SozEDrdoanTRZczROatEovDguAZlSDAkHo38PmJ7gLqW1
 SjWP/XvR0klkJw9LdqEHV91CJMozYOLisbOnfk8hCMJhsqovNMoRHaPhiDdxg5rvM9lB2FE5M
 rP/AgHGawmZD72sCyKK9bbSETGN+BaJjBNfFCnMEReEryS00hKhIRO3x8JYguuhFY3WIwDpnl
 m3uaWc3VafpSCo2WedlHiPHiV2JjITrDKayTfuGQopb4uobHLGDhIGJp2Vt7NAjRnyUye1hLs
 SJxLeX13NccWP/m3vmSvndxTefv50l9wr8KKdxuTjVzI6gDImgX6O5eFsVXyEGEvGcmTzZIsT
 LI1zrywtOLR7OdrjOi9bLeob6a6fkoAdM3pjUQwY3Qcmq5iK/QEVk6Apg==
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
Cc: "linux-hyperv@vger.kernel.org" <linux-hyperv@vger.kernel.org>,
 Stephen Hemminger <sthemmin@microsoft.com>,
 Saurabh Singh Sengar <ssengar@microsoft.com>,
 "linux-fbdev@vger.kernel.org" <linux-fbdev@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 KY Srinivasan <kys@microsoft.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 5/18/22 20:48, Dexuan Cui wrote:
>> From: Dexuan Cui <decui@microsoft.com>
>> Sent: Wednesday, May 4, 2022 10:05 AM
>> To: Haiyang Zhang <haiyangz@microsoft.com>; Wei Liu <wei.liu@kernel.org=
>;
>>> ...
>>> When I initially implemented this driver 10 years ago, I believe there
>>> was smaller limit for the fb... But I think this patch is good for the
>>> newer MMIO alloc scheme. I hope to see reviews also from
>>>  @Dexuan Cui @Michael Kelley (LINUX) who are more familiar with
>>> the PCI/BAR/MMIO area.
>>>
>>> Thanks,
>>> - Haiyang
>>
>> The patch looks good to me but I suggest we check with the Hyper-V
>> team to figure out how a Gen1 Windows VM supports a higher
>> resolution that needs a VRAM size of more than 64MB. Just in case we
>> miss something..
>>
>> Thanks,
>> -- Dexuan
>
> Reviewed-by: Dexuan Cui <decui@microsoft.com>
>
> Saurabh checked this with Hyper-V team, who said there is no
> Generation 1-specific block for larger VRAM sizes in Windows VM.
>
> When the driver was originally developed, we didn't have the API
> vmbus_allocate_mmio(), and I guess we just used the PCI device's BAR
> address for simplicity, and didn't realize the restriction with very hig=
h
> resolutions that require >64 MB VRAM. It looks like the synthetic
> VMBus framebuffer device doesn't have to use the same MMIO range
> used by the Hyper-V legacy PCI framebuffer device, so the patch
> looks good to me.

Thanks for the review, Dexuan!

I've applied this patch now to the fbdev git tree.

> BTW, please check the hyperv-drm driver as well:
> drivers/gpu/drm/hyperv/hyperv_drm_drv.c
> I think we should make the same change there to support 7680x4320
> for Gen1 VMs.

Haiyang, can you check that as well and send another patch for
the drm tree ?

Helge
