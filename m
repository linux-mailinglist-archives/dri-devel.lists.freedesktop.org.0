Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 17B972F9B38
	for <lists+dri-devel@lfdr.de>; Mon, 18 Jan 2021 09:25:53 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 607F76E1A2;
	Mon, 18 Jan 2021 08:25:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from hqnvemgate24.nvidia.com (hqnvemgate24.nvidia.com
 [216.228.121.143])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6B1D86E0F6
 for <dri-devel@lists.freedesktop.org>; Mon, 18 Jan 2021 07:49:21 +0000 (UTC)
Received: from hqmail.nvidia.com (Not Verified[216.228.121.13]) by
 hqnvemgate24.nvidia.com (using TLS: TLSv1.2, AES256-SHA)
 id <B60053d800001>; Sun, 17 Jan 2021 23:49:20 -0800
Received: from mtl-vdi-166.wap.labs.mlnx (172.20.145.6) by
 HQMAIL107.nvidia.com (172.20.187.13) with Microsoft SMTP Server (TLS) id
 15.0.1473.3; Mon, 18 Jan 2021 07:49:17 +0000
Date: Mon, 18 Jan 2021 09:49:13 +0200
From: Eli Cohen <elic@nvidia.com>
To: Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>
Subject: Re: Change eats memory on my server
Message-ID: <20210118074913.GA39161@mtl-vdi-166.wap.labs.mlnx>
References: <20210114151529.GA79120@mtl-vdi-166.wap.labs.mlnx>
 <23cf7712-1daf-23b8-b596-792c9586d6b4@suse.de>
 <20210117050837.GA225992@mtl-vdi-166.wap.labs.mlnx>
 <83f74a11-b3c0-db2e-8301-4292d60d803b@amd.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <83f74a11-b3c0-db2e-8301-4292d60d803b@amd.com>
User-Agent: Mutt/1.9.5 (bf161cf53efb) (2018-04-13)
X-Originating-IP: [172.20.145.6]
X-ClientProxiedBy: HQMAIL111.nvidia.com (172.20.187.18) To
 HQMAIL107.nvidia.com (172.20.187.13)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
 t=1610956160; bh=rsaFCxn5rziUK5bWxDCwwJ/J2i2SrzFnWXxKMKEi6sg=;
 h=Date:From:To:CC:Subject:Message-ID:References:MIME-Version:
 Content-Type:Content-Disposition:Content-Transfer-Encoding:
 In-Reply-To:User-Agent:X-Originating-IP:X-ClientProxiedBy;
 b=bDisV0xiUrtecMDMaOm8usJy68hkpobY3zlsxcue7YHmdJdQ/cXO1k0qJn1JdnUmf
 wDKeQczbxf5C+tEUUEkUTFCxEx9xey6pMBvC8qD8YcHJJowAhvZ+RTpBWvL0WAeVBd
 aa7U9lZiq9rZ2UUqWRx2HNGSnQWeM/AOEnbWF/NPrzb0VUZPTu3Ukq+nJ8vaq7f5US
 Xv0TGAlsErJLGadXlT/1qxkp6mllp0bCWU3yei0QhKx1OcBmIp69NvGOXcduAkSXeR
 SHHQKsFd0J56TVQQe8+/zCSJJoC8U/XLyCuYJj6aDGrV8v7T8snpztCut9IJhRdLbk
 gaA7UA6I1W/PA==
X-Mailman-Approved-At: Mon, 18 Jan 2021 08:25:29 +0000
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
Cc: daniel.vetter@ffwll.ch, linux-kernel@vger.kernel.org,
 dri-devel <dri-devel@lists.freedesktop.org>,
 virtualization@lists.linux-foundation.org,
 Thomas Zimmermann <tzimmermann@suse.de>, sam@ravnborg.org
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Jan 18, 2021 at 08:43:12AM +0100, Christian K=F6nig wrote:
> Hi Eli,
> =

> have you already tried using kmemleak?
> =

> This sounds like a leak of memory allocated using kmalloc(), so kmemleak
> should be able to catch it.
> =


Hi Christian,

I have the following configured but I did not see any visible complaint
in dmesg.

CONFIG_HAVE_DEBUG_KMEMLEAK=3Dy
CONFIG_DEBUG_KMEMLEAK=3Dy
CONFIG_DEBUG_KMEMLEAK_MEM_POOL_SIZE=3D16000

Any other configuration that I need to set?
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
