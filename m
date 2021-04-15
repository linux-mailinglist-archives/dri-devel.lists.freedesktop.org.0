Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CA9B5361332
	for <lists+dri-devel@lfdr.de>; Thu, 15 Apr 2021 21:57:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8D7D16EADE;
	Thu, 15 Apr 2021 19:57:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail3-relais-sop.national.inria.fr
 (mail3-relais-sop.national.inria.fr [192.134.164.104])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 60E176EADE
 for <dri-devel@lists.freedesktop.org>; Thu, 15 Apr 2021 19:57:11 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.82,225,1613430000"; d="scan'208";a="378797013"
Received: from 173.121.68.85.rev.sfr.net (HELO hadrien) ([85.68.121.173])
 by mail3-relais-sop.national.inria.fr with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 15 Apr 2021 21:57:07 +0200
Date: Thu, 15 Apr 2021 21:57:07 +0200 (CEST)
From: Julia Lawall <julia.lawall@inria.fr>
X-X-Sender: jll@hadrien
To: "Fabio M. De Francesco" <fmdefrancesco@gmail.com>
Subject: Re: [Outreachy kernel] [PATCH] drm: nouveau: dispnv50: disp.c: Remove
 set but unused variables
In-Reply-To: <20210415194423.4880-1-fmdefrancesco@gmail.com>
Message-ID: <alpine.DEB.2.22.394.2104152156530.32851@hadrien>
References: <20210415194423.4880-1-fmdefrancesco@gmail.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
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
Cc: David Airlie <airlied@linux.ie>, Daniel Vetter <daniel.vetter@ffwll.ch>,
 dri-devel@lists.freedesktop.org, Melissa Wen <melissa.srw@gmail.com>,
 outreachy-kernel@googlegroups.com, Ben Skeggs <bskeggs@redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On Thu, 15 Apr 2021, Fabio M. De Francesco wrote:

> Removed two set but unused variables.

Would it be useful to use the values?

julia

>
> Signed-off-by: Fabio M. De Francesco <fmdefrancesco@gmail.com>
> ---
>  drivers/gpu/drm/nouveau/dispnv50/disp.c | 8 +++-----
>  1 file changed, 3 insertions(+), 5 deletions(-)
>
> diff --git a/drivers/gpu/drm/nouveau/dispnv50/disp.c b/drivers/gpu/drm/nouveau/dispnv50/disp.c
> index 196612addfd6..828f48d5bdd4 100644
> --- a/drivers/gpu/drm/nouveau/dispnv50/disp.c
> +++ b/drivers/gpu/drm/nouveau/dispnv50/disp.c
> @@ -1386,12 +1386,11 @@ nv50_mstm_cleanup(struct nv50_mstm *mstm)
>  {
>  	struct nouveau_drm *drm = nouveau_drm(mstm->outp->base.base.dev);
>  	struct drm_encoder *encoder;
> -	int ret;
>
>  	NV_ATOMIC(drm, "%s: mstm cleanup\n", mstm->outp->base.base.name);
> -	ret = drm_dp_check_act_status(&mstm->mgr);
> +	drm_dp_check_act_status(&mstm->mgr);
>
> -	ret = drm_dp_update_payload_part2(&mstm->mgr);
> +	drm_dp_update_payload_part2(&mstm->mgr);
>
>  	drm_for_each_encoder(encoder, mstm->outp->base.base.dev) {
>  		if (encoder->encoder_type == DRM_MODE_ENCODER_DPMST) {
> @@ -1410,10 +1409,9 @@ nv50_mstm_prepare(struct nv50_mstm *mstm)
>  {
>  	struct nouveau_drm *drm = nouveau_drm(mstm->outp->base.base.dev);
>  	struct drm_encoder *encoder;
> -	int ret;
>
>  	NV_ATOMIC(drm, "%s: mstm prepare\n", mstm->outp->base.base.name);
> -	ret = drm_dp_update_payload_part1(&mstm->mgr);
> +	drm_dp_update_payload_part1(&mstm->mgr);
>
>  	drm_for_each_encoder(encoder, mstm->outp->base.base.dev) {
>  		if (encoder->encoder_type == DRM_MODE_ENCODER_DPMST) {
> --
> 2.31.1
>
> --
> You received this message because you are subscribed to the Google Groups "outreachy-kernel" group.
> To unsubscribe from this group and stop receiving emails from it, send an email to outreachy-kernel+unsubscribe@googlegroups.com.
> To view this discussion on the web visit https://groups.google.com/d/msgid/outreachy-kernel/20210415194423.4880-1-fmdefrancesco%40gmail.com.
>
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
