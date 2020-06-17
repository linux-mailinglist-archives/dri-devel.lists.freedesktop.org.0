Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9425B1FC361
	for <lists+dri-devel@lfdr.de>; Wed, 17 Jun 2020 03:36:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1F02F6E0F0;
	Wed, 17 Jun 2020 01:36:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2FB446E0F0
 for <dri-devel@lists.freedesktop.org>; Wed, 17 Jun 2020 01:36:02 +0000 (UTC)
IronPort-SDR: aUBkIh9AqF3V8iwNKvEk/AGEJFQ7zVsZAR95RAcmdfF8pPTleTNTPxrnFrCinn316CwEds8JPc
 QRO9Y2VwPKXg==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jun 2020 18:36:01 -0700
IronPort-SDR: BZxflcu76aIOxnlna8HDHI83ao9e0Tw+afvPDR2ci7DLGaJjV8ag7LWISB1sS7UojZGHCl73aw
 m0ogTTHGS3Bg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.73,520,1583222400"; d="scan'208";a="476671951"
Received: from shao2-debian.sh.intel.com (HELO [10.239.13.3]) ([10.239.13.3])
 by fmsmga005.fm.intel.com with ESMTP; 16 Jun 2020 18:35:59 -0700
Subject: Re: [drm/mgag200] e44e907dd8:
 phoronix-test-suite.glmark2.800x600.score -64.9% regression
To: Emil Velikov <emil.l.velikov@gmail.com>
References: <20200515083233.32036-6-tzimmermann@suse.de>
 <20200603090929.GG12456@shao2-debian>
 <CACvgo50e5ddtqWfcBiB9b05XGVuTz=8m4yH7BvAqwV2mKcuupA@mail.gmail.com>
 <62dc5960-ef0d-1fb5-d377-1f0eb9a4bc0d@intel.com>
 <CACvgo5111Z6Zq4SYYKOJTbiSYPwY2JmG7apX=qx4k3e1DPO62Q@mail.gmail.com>
From: Rong Chen <rong.a.chen@intel.com>
Message-ID: <4227c06c-233e-dfcb-e498-185116d6daf5@intel.com>
Date: Wed, 17 Jun 2020 09:35:41 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <CACvgo5111Z6Zq4SYYKOJTbiSYPwY2JmG7apX=qx4k3e1DPO62Q@mail.gmail.com>
Content-Language: en-US
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
Cc: john.p.donnelly@oracle.com, ML dri-devel <dri-devel@lists.freedesktop.org>,
 lkp@lists.01.org, OTC LSE PnP <otc.lse.pnp@intel.com>,
 Gerd Hoffmann <kraxel@redhat.com>, Thomas Zimmermann <tzimmermann@suse.de>,
 Dave Airlie <airlied@redhat.com>, Sam Ravnborg <sam@ravnborg.org>,
 Emil Velikov <emil.velikov@collabora.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Emil,

Thanks for the guidance, we'll add these information in future reports.

Best Regards,
Rong Chen

On 6/16/20 9:49 PM, Emil Velikov wrote:
> Hi Rong,
>
> Thanks for the prompt reply and information. Can I suggest including
> the suggested information in future reports.
> I've included a command for each one, to aid automating things.
>
> Namely:
> Xorg: 1.20.4 (or None)
> $ which Xorg 2>/dev/null  || echo None && Xorg -version |& grep -o "X
> Server.*" | sed "s/X Server//"
>
> Mesa: 20.0.7
> $ grep -E -o "Mesa [1-9]+.*" | head -n1 | sed "s/Mesa//"
>
> Mesa module: swrast_dri.so
> $ basename `LD_DEBUG=libs glxinfo |& grep _dri.so | head -n1 | cut -f3 -d:`
>
> Mesa device: llvmpipe (LLVM 10.0.0, 128 bits) (0xffffffff)
> $ glxinfo | grep -i device | cut -f2 -d:
>
> GPU: Matrox Electronics ...
> $ lspci -nn | grep -E "VGA|Display|3D" | cut -f2- -d:
>
> Thanks
> -Emil

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
