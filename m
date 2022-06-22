Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B156554057
	for <lists+dri-devel@lfdr.de>; Wed, 22 Jun 2022 04:01:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 30848113588;
	Wed, 22 Jun 2022 02:01:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay.hostedemail.com (smtprelay0014.hostedemail.com
 [216.40.44.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A33DC113588
 for <dri-devel@lists.freedesktop.org>; Wed, 22 Jun 2022 02:01:06 +0000 (UTC)
Received: from omf04.hostedemail.com (a10.router.float.18 [10.200.18.1])
 by unirelay07.hostedemail.com (Postfix) with ESMTP id 04B3F212D2;
 Wed, 22 Jun 2022 02:01:02 +0000 (UTC)
Received: from [HIDDEN] (Authenticated sender: joe@perches.com) by
 omf04.hostedemail.com (Postfix) with ESMTPA id 1EC4A20028; 
 Wed, 22 Jun 2022 02:01:00 +0000 (UTC)
Message-ID: <2795eb1388bb22122250f3886c2585a22d844106.camel@perches.com>
Subject: Re: [PATCH] drm/nouveau/mmu: Fix a typo
From: Joe Perches <joe@perches.com>
To: Zhang Jiaming <jiaming@nfschina.com>, airlied@linux.ie, daniel@ffwll.ch
Date: Tue, 21 Jun 2022 19:00:55 -0700
In-Reply-To: <20220622015249.8390-1-jiaming@nfschina.com>
References: <20220622015249.8390-1-jiaming@nfschina.com>
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.44.1-0ubuntu1 
MIME-Version: 1.0
X-Rspamd-Queue-Id: 1EC4A20028
X-Spam-Status: No, score=-0.10
X-Stat-Signature: imeduxfusbtqh6mhxt5pou7tpebnh9uh
X-Rspamd-Server: rspamout06
X-Session-Marker: 6A6F6540706572636865732E636F6D
X-Session-ID: U2FsdGVkX1/G1juJFWadYNMhEC2gMuIwA4DXe0U4CVo=
X-HE-Tag: 1655863260-877950
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
Cc: kherbst@redhat.com, nouveau@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 liqiong@nfschina.com, bskeggs@redhat.com, renyu@nfschina.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, 2022-06-22 at 09:52 +0800, Zhang Jiaming wrote:
> There is a typo in comments. Change 'neeed' to 'need'.
[]
> diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/mmu/vmm.c b/drivers/gpu/=
drm/nouveau/nvkm/subdev/mmu/vmm.c
[]
> @@ -280,7 +280,7 @@ nvkm_vmm_unref_ptes(struct nvkm_vmm_iter *it, bool pf=
n, u32 ptei, u32 ptes)
>  	if (desc->type =3D=3D SPT && (pgt->refs[0] || pgt->refs[1]))
>  		nvkm_vmm_unref_sptes(it, pgt, desc, ptei, ptes);
> =20
> -	/* PT no longer neeed?  Destroy it. */
> +	/* PT no longer need?  Destroy it. */

needed

