Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B26358BA703
	for <lists+dri-devel@lfdr.de>; Fri,  3 May 2024 08:28:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 00DBA10EAE4;
	Fri,  3 May 2024 06:28:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="NcaAekJg";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1992E10E0CA;
 Fri,  3 May 2024 06:28:44 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id DCEEFCE17E1;
 Fri,  3 May 2024 06:28:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 81384C116B1;
 Fri,  3 May 2024 06:28:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1714717719;
 bh=iwh0xdjQBV1rMvWbejzBiO4Cm2ywVaCYNNzkgwWts0w=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=NcaAekJgFy/ub8u/nLZ43cpp8Z3hWZWdQJNtfEPSpLSHsnvRSQ9P2dsYcsi2Sx3U8
 CejoBqkoLSP0CHcFIXFqRGIfGEh9EsoSht2sb4QO3J1miDQbbWotJ+RuP0Zh+yExe7
 oFcis4z/7AVU8HlLSG5M0ZW6I2pSvaISQO5obSak=
Date: Fri, 3 May 2024 08:28:36 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Krishna Kurapati PSSNV <quic_kriskura@quicinc.com>
Cc: kernel test robot <lkp@intel.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 Linux Memory Management List <linux-mm@kvack.org>,
 amd-gfx@lists.freedesktop.org, devicetree@vger.kernel.org,
 dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org, linux-arch@vger.kernel.org,
 linux-usb@vger.kernel.org, netdev@vger.kernel.org,
 nouveau@lists.freedesktop.org
Subject: Re: [linux-next:master] BUILD REGRESSION
 9c6ecb3cb6e20c4fd7997047213ba0efcf9ada1a
Message-ID: <2024050314-knelt-sandpaper-3884@gregkh>
References: <202405030439.AH8NR0Mg-lkp@intel.com>
 <2024050342-slashing-froth-bcf9@gregkh>
 <d7f7cfae-78d5-41aa-aaf9-0d558cdfcbea@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <d7f7cfae-78d5-41aa-aaf9-0d558cdfcbea@quicinc.com>
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

On Fri, May 03, 2024 at 11:30:50AM +0530, Krishna Kurapati PSSNV wrote:
> 
> 
> On 5/3/2024 10:42 AM, Greg KH wrote:
> > Ok, I'm getting tired of seeing these for the USB portion of the tree,
> > so I went to look for:
> > 
> > On Fri, May 03, 2024 at 04:44:42AM +0800, kernel test robot wrote:
> > > |-- arc-randconfig-002-20240503
> > > |   `-- drivers-usb-dwc3-core.c:warning:variable-hw_mode-set-but-not-used
> > 
> > This warning (same for all arches), but can't seem to find it anywhere.
> > 
> > Any hints as to where it would be?
> > 
> 
> Hi Greg,
> 
>  I think the hw_mode was not removed in hs_phy_setup and left unused.
> 
>  Thinh reported the same when there was a merge conflict into linux next
> (that the hw_mode variable was removed in ss_phy_setup and should be removed
> in hs_phy_setup as well):
> 
> https://lore.kernel.org/all/20240426213923.tyeddub4xszypeju@synopsys.com/
> 
>  Perhaps that was missed ?

Must have been.  I need it in a format that it can be applied in (a
2-way diff can't apply...)

thanks,

greg k-h
