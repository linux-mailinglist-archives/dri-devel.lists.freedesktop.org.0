Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 566D8449F59
	for <lists+dri-devel@lfdr.de>; Tue,  9 Nov 2021 01:16:42 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E73B989CE0;
	Tue,  9 Nov 2021 00:16:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 14D4589CE0
 for <dri-devel@lists.freedesktop.org>; Tue,  9 Nov 2021 00:16:38 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 04F9261104;
 Tue,  9 Nov 2021 00:16:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1636416997;
 bh=e6eETMfldk25YhhOCrkCCcAt2VNZWoeJqi7WGDCXDYA=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=ovBqOJljx/XmzXcfiQ71NhXBMqv0jdOpQW/90L/ozBJV36lZvgnTusUibrM/UOQaE
 JouikJZURVmWWRE27Z1mTVfte3f5ZJmXzBiIK7l3FkWv77uZprpZwMBepL26Fhf1+s
 UFRlPRHuRD3riePXbgl/5WD5W7wA2PGqq0krDN8GBJwE9r9hQBxqoyovP0MKbov+2w
 XEX7Bb094YYrIilz4p+2zXHFnq00sOZ+J9/UyGQnNVZabYkWnGqlcG2nT1j9hrHmuU
 iKSlLXibZ2AZEk+eIGwM3nmCEFzFGCcTiHs6l+tnm6s5lL2wIq94QPsUYe40qJ007Y
 +XnrRmheNXVAQ==
Date: Mon, 8 Nov 2021 16:16:31 -0800
From: Jakub Kicinski <kuba@kernel.org>
To: Joe Perches <joe@perches.com>
Subject: Re: [PATCH 2/2] MAINTAINERS: Mark VMware mailing list entries as
 private
Message-ID: <20211108161631.2941f3a7@kicinski-fedora-pc1c0hjn.dhcp.thefacebook.com>
In-Reply-To: <5179a7c097e0bb88f95642a394f53c53e64b66b1.camel@perches.com>
References: <163640336232.62866.489924062999332446.stgit@srivatsa-dev>
 <163640339370.62866.3435211389009241865.stgit@srivatsa-dev>
 <5179a7c097e0bb88f95642a394f53c53e64b66b1.camel@perches.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
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
Cc: Ronak Doshi <doshir@vmware.com>, pv-drivers@vmware.com,
 dri-devel@lists.freedesktop.org, virtualization@lists.linux-foundation.org,
 Nadav Amit <namit@vmware.com>, amakhalov@vmware.com,
 "Srivatsa S. Bhat" <srivatsa@csail.mit.edu>, srivatsab@vmware.com,
 sdeep@vmware.com, linux-scsi@vger.kernel.org,
 Vishal Bhakta <vbhakta@vmware.com>, x86@kernel.org,
 linux-graphics-maintainer@vmware.com, linux-input@vger.kernel.org,
 keerthanak@vmware.com, jgross@suse.com, anishs@vmware.com,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-rdma@vger.kernel.org, Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Vivek Thampi <vithampi@vmware.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, 08 Nov 2021 15:37:53 -0800 Joe Perches wrote:
> > @@ -6134,8 +6134,8 @@ T:	git git://anongit.freedesktop.org/drm/drm-misc
> >  F:	drivers/gpu/drm/vboxvideo/
> >  
> >  DRM DRIVER FOR VMWARE VIRTUAL GPU
> > -M:	"VMware Graphics" <linux-graphics-maintainer@vmware.com>
> >  M:	Zack Rusin <zackr@vmware.com>
> > +L:	linux-graphics-maintainer@vmware.com (private)  
> 
> This MAINTAINERS file is for _public_ use, marking something
> non-public isn't useful.

But Greg has a point. Corporations like to send us code with a list 
as the maintainer and MODULE_AUTHOR set to corp's name. We deal with
humans, not legal entities.

I've been trying to get them to use "M: email" without the name,
but "L: list (private)" also works.

Either way I feel like we need _some_ way to tell humans from corporate
"please CC this address" entries.

> private makes no sense and likely these L: entries shouldn't exist.
