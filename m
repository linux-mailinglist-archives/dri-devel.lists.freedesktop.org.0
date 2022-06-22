Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 70EC85545EF
	for <lists+dri-devel@lfdr.de>; Wed, 22 Jun 2022 14:06:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EAEBB112EC5;
	Wed, 22 Jun 2022 12:06:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madras.collabora.co.uk (madras.collabora.co.uk [46.235.227.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4AEC8112EC5
 for <dri-devel@lists.freedesktop.org>; Wed, 22 Jun 2022 12:06:33 +0000 (UTC)
Received: from maud (unknown [184.175.41.107])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 (Authenticated sender: alyssa)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id 67D4D6601792;
 Wed, 22 Jun 2022 13:06:28 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1655899591;
 bh=8cKG2HLPA2oaAIYX0UotUfvLxK0B48XnUANfcsC0LWY=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=cJm0580ydroa59n49GclTqIPG1V66lDoS0On8k9dGULedu0QWYyZN7YvMeXfqBURc
 wtCzM9ZGkfNRtCXJ2ouKFMVJQr7/fGNlaPUR3VjAB2Z24noDGuZ8Bdw5S4fVc7fcMI
 /EmO11AmRX85U5bO2V18LZZ3UoNhDWSNi3CLxZj10TV62ZTENJhdB+Xm98yu24lQh2
 SheH+WVe70aT+XjMahzsIEhMyMa4gtC3JVWlLj4LMMbCush+h3DX/migoPX+tYXVoW
 SkkSof5NMEVV3ep1LhgcXOkjahKwjAf83BpBsUKzU7fI4MLm8l2TZ3fP0BEEmYQDXs
 PrFgfYbM4AmiQ==
Date: Wed, 22 Jun 2022 08:06:23 -0400
From: Alyssa Rosenzweig <alyssa@collabora.com>
To: "Chen, Rong A" <rong.a.chen@intel.com>
Subject: Re: [kbuild-all] Re: [PATCH v2 1/1] drm/panfrost: Add support for
 devcoredump
Message-ID: <YrMFv/SJ57poqMXW@maud>
References: <20220621023204.94179-2-adrian.larumbe@collabora.com>
 <202206211114.PJcD2pJh-lkp@intel.com> <YrHWhmNVJnIJ1iaT@maud>
 <f51c03dc-e01b-566b-b634-24c821110208@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <f51c03dc-e01b-566b-b634-24c821110208@intel.com>
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
Cc: kbuild-all@lists.01.org, kernel test robot <lkp@intel.com>,
 tomeu.vizoso@collabora.com, Adri?n Larumbe <adrian.larumbe@collabora.com>,
 dri-devel@lists.freedesktop.org, steven.price@arm.com,
 alyssa.rosenzweig@collabora.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Rong Chen,

Sorry for the noise -- I think that was meant for Adrian!

Apologies,

Alyssa

On Wed, Jun 22, 2022 at 10:30:00AM +0800, Chen, Rong A wrote:
> 
> 
> On 6/21/2022 10:32 PM, Alyssa Rosenzweig wrote:
> > >     drivers/gpu/drm/panfrost/panfrost_dump.c: In function 'panfrost_core_dump':
> > > > > drivers/gpu/drm/panfrost/panfrost_dump.c:115:20: error: 'struct panfrost_job' has no member named 'file_priv'
> > >       115 |         as_nr = job->file_priv->mmu->as;
> > >           |                    ^~
> > 
> > FWIW -- this is due to recent changes in panfrost, you should rebase on
> > the latest drm-misc-next which is where the patch will be applied
> > anyway.
> 
> Hi Alyssa,
> 
> Thanks for your help, we'll try drm-misc-next next time.
> 
> Best Regards,
> Rong Chen
