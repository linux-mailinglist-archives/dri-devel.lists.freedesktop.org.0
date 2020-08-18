Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 714462495AA
	for <lists+dri-devel@lfdr.de>; Wed, 19 Aug 2020 08:57:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 574B96E20B;
	Wed, 19 Aug 2020 06:57:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mo4-p01-ob.smtp.rzone.de (mo4-p01-ob.smtp.rzone.de
 [85.215.255.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9D0BE89715
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Aug 2020 11:08:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1597748915;
 s=strato-dkim-0002; d=xenosoft.de;
 h=In-Reply-To:Date:Message-ID:From:References:Cc:To:Subject:
 X-RZG-CLASS-ID:X-RZG-AUTH:From:Subject:Sender;
 bh=koJFguAnm5m7Yf22e906vapRRMCc7tRf8L4mLRereyM=;
 b=tE1H5RMmZ0CbpkeMHZPUKGREgamiO+aKUC+F7Qkxs8nE7Geey2obkUiECeTzTol8uR
 VTIl5b5qX2AN1DHmpc1s7u7EtZJws3koMS0oDQD5SHSBk/Y4K0+SWeiIXHndjx9qULgs
 rQ+/gGcX1E5Qv+yoR4i1yWljwy1ryieEcsL1lS9OiYEZ0HE0fJSNfJQzVEjmBihjT4ff
 PI4fMGsJjaKL0PeC2uuKSdRiKeGXcXSgH6kc26IPji4v6Mxt2noDSQc2IfREsmrZwEat
 W2TGNUVsIzXr1oDLq85zQeyARVC0zjKd/cOQZTHEDM7mxdLlDu/wSy5nAwE3ZSBOxpSu
 NRKw==
X-RZG-AUTH: ":L2QefEenb+UdBJSdRCXu93KJ1bmSGnhMdmOod1DhGM4l4Hio94KKxRySfLxnHvJzedV4hp0hM3BukOMWh+LViYiuzXqVlZzVo7xSI73ElHU="
X-RZG-CLASS-ID: mo00
Received: from [IPv6:2a01:598:b10d:7054:8ddd:9a9:703b:cd26]
 by smtp.strato.de (RZmta 46.10.5 AUTH)
 with ESMTPSA id 60686ew7IB8Sqqz
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
 (Client did not present a certificate);
 Tue, 18 Aug 2020 13:08:28 +0200 (CEST)
Subject: Re: [Virtual ppce500] virtio_gpu virtio0: swiotlb buffer is full
To: Gerd Hoffmann <kraxel@redhat.com>
References: <87h7tb4zwp.fsf@linux.ibm.com>
 <E1C071A5-19D1-4493-B04A-4507A70D7848@xenosoft.de>
 <bc1975fb-23df-09c2-540a-c13b39ad56c5@xenosoft.de>
 <51482c70-1007-1202-9ed1-2d174c1e923f@xenosoft.de>
 <9688335c-d7d0-9eaa-22c6-511e708e0d2a@linux.ibm.com>
 <9805f81d-651d-d1a3-fd05-fb224a8c2031@xenosoft.de>
 <3162da18-462c-72b4-f8f0-eef896c6b162@xenosoft.de>
 <3eee8130-6913-49d2-2160-abf0bf17c44e@xenosoft.de>
 <20200818081830.d2a2cva4hd2jzwba@sirius.home.kraxel.org>
From: Christian Zigotzky <chzigotzky@xenosoft.de>
Message-ID: <56faac9f-49e8-2f0b-6cd5-f8e589db4c8c@xenosoft.de>
Date: Tue, 18 Aug 2020 13:08:27 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <20200818081830.d2a2cva4hd2jzwba@sirius.home.kraxel.org>
Content-Language: de-DE
X-Mailman-Approved-At: Wed, 19 Aug 2020 06:56:51 +0000
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
Cc: Darren Stevens <darren@stevens-zone.net>, "R.T.Dickinson" <rtd2@xtra.co.nz>,
 daniel.vetter@ffwll.ch, =?UTF-8?Q?Michel_D=c3=a4nzer?= <michel@daenzer.net>,
 "kvm-ppc@vger.kernel.org" <kvm-ppc@vger.kernel.org>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>,
 mad skateman <madskateman@gmail.com>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 18 August 2020 at 10:18 am, Gerd Hoffmann wrote:
> On Mon, Aug 17, 2020 at 11:19:58AM +0200, Christian Zigotzky wrote:
>> Hello
>>
>> I compiled the RC1 of kernel 5.9 today. Unfortunately the issue with the
>> VirtIO-GPU (see below) still exists. Therefore we still need the patch (see
>> below) for using the VirtIO-GPU in a virtual e5500 PPC64 QEMU machine.
> It is fixed in drm-misc-next (commit 51c3b0cc32d2e17581fce5b487ee95bbe9e8270a).
>
> Will cherry-pick into drm-misc-fixes once the branch is 5.9-based, which
> in turn should bring it to 5.9-rc2 or -rc3.
>
> take care,
>    Gerd
>
Thank you!
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
