Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 949D61B1E9D
	for <lists+dri-devel@lfdr.de>; Tue, 21 Apr 2020 08:10:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7DAB36E886;
	Tue, 21 Apr 2020 06:10:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 20C186E886
 for <dri-devel@lists.freedesktop.org>; Tue, 21 Apr 2020 06:10:36 +0000 (UTC)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
 by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 03L6AROO039864;
 Tue, 21 Apr 2020 01:10:27 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1587449427;
 bh=/Qm0nN975rNbEtln8d0XpXBdQQvlYJtmMjr4wru7glU=;
 h=Subject:To:CC:References:From:Date:In-Reply-To;
 b=fRuulgzt4zXB8MqaH7y5qB/XhsahY0jTar48Gd1ed7BB33v0TkmF3voYiTHpsiNSc
 jCa/fXw1+F01OlUpokUcMdgpplxhBfm2akMNOKudjGzDdX2y4c9RGCifhGOuGOypp9
 7SNI72VRLy99GRVqjdM/BXyV6f92Rxd+OmVnJDO4=
Received: from DFLE108.ent.ti.com (dfle108.ent.ti.com [10.64.6.29])
 by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTP id 03L6ARKN129595;
 Tue, 21 Apr 2020 01:10:27 -0500
Received: from DFLE110.ent.ti.com (10.64.6.31) by DFLE108.ent.ti.com
 (10.64.6.29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3; Tue, 21
 Apr 2020 01:10:27 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DFLE110.ent.ti.com
 (10.64.6.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3 via
 Frontend Transport; Tue, 21 Apr 2020 01:10:27 -0500
Received: from [192.168.2.6] (ileax41-snat.itg.ti.com [10.172.224.153])
 by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 03L6APCg037008;
 Tue, 21 Apr 2020 01:10:26 -0500
Subject: Re: linux-next: manual merge of the drm-misc tree with the
 drm-misc-fixes tree
To: Stephen Rothwell <sfr@canb.auug.org.au>, Daniel Vetter
 <daniel.vetter@ffwll.ch>, Intel Graphics <intel-gfx@lists.freedesktop.org>,
 DRI <dri-devel@lists.freedesktop.org>
References: <20200421115241.704f2fbf@canb.auug.org.au>
From: Tomi Valkeinen <tomi.valkeinen@ti.com>
Message-ID: <c299b6d5-a786-1620-2863-8814a1242cf8@ti.com>
Date: Tue, 21 Apr 2020 09:10:25 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <20200421115241.704f2fbf@canb.auug.org.au>
Content-Language: en-US
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
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
Cc: Linux Next Mailing List <linux-next@vger.kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On 21/04/2020 04:52, Stephen Rothwell wrote:
> Hi all,
> 
> Today's linux-next merge of the drm-misc tree got a conflict in:he drm-misc tree with the drm-misc-fixes tree
> 
>    drivers/gpu/drm/tidss/tidss_encoder.c
> 
> between commit:
> 
>    9da67433f64e ("drm/tidss: fix crash related to accessing freed memory")
> 
> from the drm-misc-fixes tree and commit:
> 
>    b28ad7deb2f2 ("drm/tidss: Use simple encoder")
> 
> from the drm-misc tree.
> 
> I fixed it up (I just used the latter version of this file) and can

We need to use "drm/tidss: fix crash related to accessing freed memory" version.

> carry the fix as necessary. This is now fixed as far as linux-next is
> concerned, but any non trivial conflicts should be mentioned to your
> upstream maintainer when your tree is submitted for merging.  You may
> also want to consider cooperating with the maintainer of the conflicting
> tree to minimise any particularly complex conflicts.

I have fixed this with drm-misc's dim tool, so I presume the conflict goes away when drm-misc-fixes 
is merged to drm-fixes, and drm-fixes is then at some point merged to drm-misc-next.

It was a bit bad timing with the "drm/tidss: Use simple encoder", which removes the plumbing I 
needed to implement the fix. So I effectively revert the "drm/tidss: Use simple encoder".

  Tomi

-- 
Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki.
Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
