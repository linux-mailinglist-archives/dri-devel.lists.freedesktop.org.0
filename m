Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9989E67E23D
	for <lists+dri-devel@lfdr.de>; Fri, 27 Jan 2023 11:51:59 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A72F610E447;
	Fri, 27 Jan 2023 10:51:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp1.tecnico.ulisboa.pt (smtp1.tecnico.ulisboa.pt
 [193.136.128.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B869810E447;
 Fri, 27 Jan 2023 10:51:53 +0000 (UTC)
Received: from localhost (localhost.localdomain [127.0.0.1])
 by smtp1.tecnico.ulisboa.pt (Postfix) with ESMTP id 2F3BB600EAE9;
 Fri, 27 Jan 2023 10:51:50 +0000 (WET)
X-Virus-Scanned: by amavisd-new-2.11.0 (20160426) (Debian) at
 tecnico.ulisboa.pt
Received: from smtp1.tecnico.ulisboa.pt ([127.0.0.1])
 by localhost (smtp1.tecnico.ulisboa.pt [127.0.0.1]) (amavisd-new, port 10025)
 with LMTP id arxiVCH-fa5m; Fri, 27 Jan 2023 10:51:47 +0000 (WET)
Received: from mail1.tecnico.ulisboa.pt (mail1.ist.utl.pt [193.136.128.10])
 by smtp1.tecnico.ulisboa.pt (Postfix) with ESMTPS id 5C352600EAD2;
 Fri, 27 Jan 2023 10:51:47 +0000 (WET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=tecnico.ulisboa.pt;
 s=mail; t=1674816707;
 bh=wOtTdkOGHgSvvf5JexX+l9uHf4j3jt1tsIZ25QKI0j0=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To;
 b=cpBgIoHHJnxWM2XoEa7+qvhnWuyK79iXAjdRmes8wQRF0FP+L8Wz85IahgzAXJuR7
 DBR+3jqMj0gP+T82lnS4VkVF03qGJh0toeWp6bnXM0bvT6YaN1QfGISCkVriYvYP/3
 Z2y/ic3eHfjSNxWTLRFrnj4Wa8yG47F2uauOQtUs=
Received: from wslaptop (unknown [IPv6:2001:8a0:fbe7:6700:65be:d034:d2ec:60ff])
 (Authenticated sender: ist187313)
 by mail1.tecnico.ulisboa.pt (Postfix) with ESMTPSA id 2A823360090;
 Fri, 27 Jan 2023 10:51:47 +0000 (WET)
Date: Fri, 27 Jan 2023 10:48:42 +0000
From: Diogo Ivo <diogo.ivo@tecnico.ulisboa.pt>
To: Nicolas Chauvet <kwizart@gmail.com>
Subject: Re: [REGRESSION] GM20B probe fails after commit 2541626cfb79
Message-ID: <20230127104842.ahu6thtod7eeuvbe@wslaptop>
References: <20221228144914.z7t7a4fdwvbblnak@wslaptop>
 <CAMwc25rY4xpn0yvCScMr6Hk9pFSdvt=9QOypSQDfj1d5tWmtvA@mail.gmail.com>
 <20230116122403.upk5ci4mbebw23m7@wslaptop>
 <CACAvsv48vH6hbacQCN+yKP8ZcDjFMWciBt6U_Xv-LEYJHZ1q9g@mail.gmail.com>
 <20230120113443.wgwhwp7tm6rnc6je@wslaptop>
 <CACAvsv4_XJLSwnA-s0BXLVbBCESDfnK7kx5-WUPd2+vdJuMojg@mail.gmail.com>
 <CABr+WTmfQkLoHxpONag4bHEsQtGwmno+84mYF-RzAGw0jqo-gA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CABr+WTmfQkLoHxpONag4bHEsQtGwmno+84mYF-RzAGw0jqo-gA@mail.gmail.com>
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
Cc: David Airlie <airlied@redhat.com>, Ben Skeggs <skeggsb@gmail.com>,
 kherbst@redhat.com, dri-devel@lists.freedesktop.org,
 nouveau@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Jan 27, 2023 at 10:03:17AM +0100, Nicolas Chauvet wrote:
> I've tried to run glmark2-wayland under weston with DRI_PRIME=1, it
> seems to work at the beginning, but then I have the following error:
> 
> [ 1510.861730] nouveau 57000000.gpu: gr: DATA_ERROR 00000003
> [INVALID_OPERATION] ch 3 [04002a2000 glmark2-wayland[2753]] subc 0
> class b197 mthd 19d0 data 0000003d
> [ 1510.952000] nouveau 57000000.gpu: gr: DATA_ERROR 00000003
> [INVALID_OPERATION] ch 3 [04002a2000 glmark2-wayland[2753]] subc 0
> class b197 mthd 19d0 data 0000003d
> [ 1510.952060] nouveau 57000000.gpu: gr: DATA_ERROR 0000009c [] ch 3
> [04002a2000 glmark2-wayland[2753]] subc 0 class b197 mthd 0d78 data
> 00000006
> I think it's a separate error as I think I can reproduce on kernel
> 6.1x (I will open a separate thread).

Hello,

Would you mind testing this Mesa merge request (and the kernel patches
mentioned there) to see if it fixes this error:

https://gitlab.freedesktop.org/mesa/mesa/-/merge_requests/20811

Thanks,
Diogo
