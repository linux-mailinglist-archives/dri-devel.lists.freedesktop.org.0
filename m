Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BAB31B0D3FC
	for <lists+dri-devel@lfdr.de>; Tue, 22 Jul 2025 09:57:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 19C8E10E622;
	Tue, 22 Jul 2025 07:57:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="JdcFf6pg";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6C2CD10E622;
 Tue, 22 Jul 2025 07:57:38 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 0EC9EA55D88;
 Tue, 22 Jul 2025 07:57:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6E9B5C4CEEB;
 Tue, 22 Jul 2025 07:57:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1753171056;
 bh=wEUHDmsgHVPe5kSmdb1Wec3UqL9t1n89LTQEk85htD0=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=JdcFf6pgjhk/nGBgS+COUsHqDSedZPrRp7PmpD9jj0Sy18W7SgAXvzKROr973tS19
 GmDs4Z2sApDs+Xt0VQpiOqw2NeYSo/wv/f2IDtHwKTBYe7ze0KkyW9m1MQ29aRc7hI
 g+r9qkREXxILI6FRvwKRc9d4sfo0vJI9m3c+MSdQ=
Date: Tue, 22 Jul 2025 09:57:33 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: WangYuli <wangyuli@uniontech.com>
Cc: airlied@gmail.com, akpm@linux-foundation.org,
 alison.schofield@intel.com, andrew+netdev@lunn.ch,
 andriy.shevchenko@linux.intel.com, arend.vanspriel@broadcom.com,
 bp@alien8.de, brcm80211-dev-list.pdl@broadcom.com,
 brcm80211@lists.linux.dev, colin.i.king@gmail.com,
 cvam0000@gmail.com, dan.j.williams@intel.com,
 dave.hansen@linux.intel.com, dave.jiang@intel.com,
 dave@stgolabs.net, davem@davemloft.net,
 dri-devel@lists.freedesktop.org, edumazet@google.com,
 guanwentao@uniontech.com, hpa@zytor.com,
 ilpo.jarvinen@linux.intel.com, intel-xe@lists.freedesktop.org,
 ira.weiny@intel.com, j@jannau.net, jeff.johnson@oss.qualcomm.com,
 jgross@suse.com, jirislaby@kernel.org, johannes.berg@intel.com,
 jonathan.cameron@huawei.com, kuba@kernel.org, kvalo@kernel.org,
 kvm@vger.kernel.org, linux-cxl@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-serial@vger.kernel.org,
 linux-wireless@vger.kernel.org, linux@treblig.org,
 lucas.demarchi@intel.com, marcin.s.wojtas@gmail.com,
 ming.li@zohomail.com, mingo@kernel.org, mingo@redhat.com,
 netdev@vger.kernel.org, niecheng1@uniontech.com,
 oleksandr_tyshchenko@epam.com, pabeni@redhat.com,
 pbonzini@redhat.com, quic_ramess@quicinc.com, ragazenta@gmail.com,
 rodrigo.vivi@intel.com, seanjc@google.com, shenlichuan@vivo.com,
 simona@ffwll.ch, sstabellini@kernel.org, tglx@linutronix.de,
 thomas.hellstrom@linux.intel.com, vishal.l.verma@intel.com,
 x86@kernel.org, xen-devel@lists.xenproject.org,
 yujiaoliang@vivo.com, zhanjun@uniontech.com
Subject: Re: [PATCH v2 6/8] serial: 8250_dw: Fix typo "notifer"
Message-ID: <2025072252-halves-sadness-18dc@gregkh>
References: <BD5C52D2838AEA48+20250715134050.539234-1-wangyuli@uniontech.com>
 <2BF1749F02ADE664+20250715134407.540483-6-wangyuli@uniontech.com>
 <2025071607-outbid-heat-b0ba@gregkh>
 <634BA467821D37FE+0b2ace38-07d9-4500-8bb7-5a4fa65c4b9f@uniontech.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <634BA467821D37FE+0b2ace38-07d9-4500-8bb7-5a4fa65c4b9f@uniontech.com>
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

On Tue, Jul 22, 2025 at 03:22:18PM +0800, WangYuli wrote:
> Hi greg k-h,
> 
> On 2025/7/16 16:08, Greg KH wrote:
> > > Signed-off-by: WangYuli <wangyuli@uniontech.com>
> > Is your name all one word like that, or should there be a " " between
> > them?
> 
> If I were to follow Western naming conventions, my name would be written as
> 'Yuli Wang'.
> 
> However, frankly, I find it unnecessary and can't be bothered to follow
> their customs, unless a maintainer strongly insists. (For example, you can
> see that my signature on commits for the LoongArch subsystem is different
> from my other contributions).
> 
> Since Chinese names are written without any spaces in Chinese characters, I
> don't think it matters.

Then use your Chinese name, don't feel like you need to change it to any
other naming convention.  There's no requirement here at all to do so.

thanks,

greg k-h
