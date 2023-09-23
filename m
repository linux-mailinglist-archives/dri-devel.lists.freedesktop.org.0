Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B1687ABEEF
	for <lists+dri-devel@lfdr.de>; Sat, 23 Sep 2023 10:31:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CBB7510E039;
	Sat, 23 Sep 2023 08:31:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 27A9B10E039
 for <dri-devel@lists.freedesktop.org>; Sat, 23 Sep 2023 08:30:53 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by ams.source.kernel.org (Postfix) with ESMTP id BC2ADB82477;
 Sat, 23 Sep 2023 08:30:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 94A71C433C7;
 Sat, 23 Sep 2023 08:30:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1695457851;
 bh=/8TgiVvhyoEQjmMNICoH2j+HfPup1Rblzd+bjpUol3k=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=ASEhycr2FAMdWrL/OB4mh3/h0p+L6i4+5LKvAnpuQz27PcVDgubdC5KgU2vI+psv5
 Ysx1hX+tPcroZK2hrCo6gwJgUuKG0ADca/2U7gDYEqCGKPeSEeVlqetEubaBkM5Zyp
 YiILXRIcPgVC4Pm9zFCDcFKnF0FsZoxosDQDYHZY=
Date: Sat, 23 Sep 2023 10:30:48 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Sui Jingfeng <suijingfeng@loongson.cn>
Subject: Re: [PATCH 5.4 000/367] 5.4.257-rc1 review
Message-ID: <2023092342-shading-wrongful-84de@gregkh>
References: <20230920112858.471730572@linuxfoundation.org>
 <CA+G9fYsM0Lr8TNQJxsZFDZwcH-rEzkVV+y+x5FX18oH5wm5dRg@mail.gmail.com>
 <cab7d157-946e-6b8f-1b29-5618a0ac0da6@loongson.cn>
 <741fb6da-3a77-84de-0f03-b925defd7f52@loongson.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <741fb6da-3a77-84de-0f03-b925defd7f52@loongson.cn>
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
Cc: Chun-Kuang Hu <chunkuang.hu@kernel.org>, f.fainelli@gmail.com,
 dri-devel@lists.freedesktop.org, rwarsow@gmx.de, pavel@denx.de,
 conor@kernel.org, shuah@kernel.org, Naresh Kamboju <naresh.kamboju@linaro.org>,
 patches@lists.linux.dev, stable@vger.kernel.org, linux-kernel@vger.kernel.org,
 lkft-triage@lists.linaro.org, srw@sladewatkins.net, patches@kernelci.org,
 akpm@linux-foundation.org, jonathanh@nvidia.com, torvalds@linux-foundation.org,
 sudipm.mukherjee@gmail.com, linux@roeck-us.net
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Sep 21, 2023 at 09:16:57PM +0800, Sui Jingfeng wrote:
> Hi,
> 
> 
> On 2023/9/21 21:10, Sui Jingfeng wrote:
> > return -ERR_PTR(-ENOMEM)
> 
> 
> return ERR_PTR(-ENOMEM);

Thanks, now fixed up.

greg k-h
