Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id F34A144CF1A
	for <lists+dri-devel@lfdr.de>; Thu, 11 Nov 2021 02:39:42 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 621A36E8F5;
	Thu, 11 Nov 2021 01:39:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5EB966E8F5
 for <dri-devel@lists.freedesktop.org>; Thu, 11 Nov 2021 01:39:37 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 50B8460EE4;
 Thu, 11 Nov 2021 01:39:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1636594777;
 bh=cf5yOhrezRaS3az4I+5LjwvWmGyLUDhsfildHNI2s2M=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=TERuJy+0mBTSaXjUPuv97W88N9bqw45z6KMJt40R91eXi2cwfbpZ7DLMiCURoVFrO
 HY9VrAJuvI9zgAUhl5FuPKJD2/ge4X7H873CCkdRjsl02PFlJqerhjL2WDBSYM5kG4
 cdb1WmUVdcOQ56pMUz1UT8zzIhHEsZGAtdIwx0V7uGt32eZaPpQ+ITPB0AnPbcIgj1
 oNUyFGVR0OLShASmRN1xqk0EfJ5LzhEgKOIwdUKjsGqQVzRq2pafRu4O9bpjEAO5SU
 q1PE6zavYqmU8KskvjXGGWbMBRSfoR6gHkykTHNPZwNiOxinnB1ZmXajrtCMf7zUmd
 uP+X+V8iXixqw==
Date: Wed, 10 Nov 2021 17:39:35 -0800
From: Jakub Kicinski <kuba@kernel.org>
To: "Srivatsa S. Bhat" <srivatsa@csail.mit.edu>
Subject: Re: [PATCH v3 3/3] MAINTAINERS: Mark VMware mailing list entries as
 email aliases
Message-ID: <20211110173935.45a9f495@kicinski-fedora-pc1c0hjn.dhcp.thefacebook.com>
In-Reply-To: <163657493334.84207.11063282485812745766.stgit@srivatsa-dev>
References: <163657479269.84207.13658789048079672839.stgit@srivatsa-dev>
 <163657493334.84207.11063282485812745766.stgit@srivatsa-dev>
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
 Nadav Amit <namit@vmware.com>, amakhalov@vmware.com, srivatsab@vmware.com,
 sdeep@vmware.com, linux-scsi@vger.kernel.org,
 Vishal Bhakta <vbhakta@vmware.com>, x86@kernel.org,
 linux-graphics-maintainer@vmware.com, linux-input@vger.kernel.org,
 rostedt@goodmis.org, keerthanak@vmware.com, jgross@suse.com, anishs@vmware.com,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-rdma@vger.kernel.org, joe@perches.com,
 Vivek Thampi <vithampi@vmware.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, 10 Nov 2021 12:09:06 -0800 Srivatsa S. Bhat wrote:
>  DRM DRIVER FOR VMWARE VIRTUAL GPU
> -M:	"VMware Graphics" <linux-graphics-maintainer@vmware.com>
>  M:	Zack Rusin <zackr@vmware.com>
> +R:	VMware Graphics Reviewers <linux-graphics-maintainer@vmware.com>
>  L:	dri-devel@lists.freedesktop.org
>  S:	Supported
>  T:	git git://anongit.freedesktop.org/drm/drm-misc

It'd be preferable for these corporate entries to be marked or
otherwise distinguishable so that we can ignore them when we try 
to purge MAINTAINERS from developers who stopped participating.

These addresses will never show up in a commit tag which is normally
sign of inactivity.
