Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 73E0411827C
	for <lists+dri-devel@lfdr.de>; Tue, 10 Dec 2019 09:40:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 36EF26E832;
	Tue, 10 Dec 2019 08:40:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 603 seconds by postgrey-1.36 at gabe;
 Mon, 09 Dec 2019 10:32:05 UTC
Received: from mail2-relais-roc.national.inria.fr
 (mail2-relais-roc.national.inria.fr [192.134.164.83])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8777D89FFD
 for <dri-devel@lists.freedesktop.org>; Mon,  9 Dec 2019 10:32:05 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.69,294,1571695200"; d="scan'208";a="419359771"
X-MGA-submission: =?us-ascii?q?MDEy0mNecwNuL9Jk5yYbF2EQVnchtra1QLxSda?=
 =?us-ascii?q?LVt2y4q13qmPpebNroNPIYago/EeZChF1k1i8WrzH2uQbUIlF5P+NBEb?=
 =?us-ascii?q?zQ45Lx2dyOC7BDW8GJHNWgCr6Dib9AlaQwu2cPD16slJUMVl5OoQGXuy?=
 =?us-ascii?q?KwBuaKZZ69PpoINS8s52KQlw=3D=3D?=
Received: from zcs-store9.inria.fr ([128.93.142.36])
 by mail2-relais-roc.national.inria.fr with ESMTP; 09 Dec 2019 11:21:57 +0100
Date: Mon, 9 Dec 2019 11:21:57 +0100 (CET)
From: Julia Lawall <julia.lawall@inria.fr>
To: Lukas Bulwahn <lukas.bulwahn@gmail.com>
Message-ID: <1606305704.12702713.1575886917867.JavaMail.zimbra@inria.fr>
In-Reply-To: <20191208105328.15335-1-lukas.bulwahn@gmail.com>
References: <20191208105328.15335-1-lukas.bulwahn@gmail.com>
Subject: Re: [PATCH] drm/vmwgfx: Replace deprecated PTR_RET
MIME-Version: 1.0
X-Originating-IP: [202.161.33.40]
X-Mailer: Zimbra 8.7.11_GA_3800 (ZimbraWebClient - FF70 (Linux)/8.7.11_GA_3800)
Thread-Topic: drm/vmwgfx: Replace deprecated PTR_RET
Thread-Index: E97hwnQVmXIxUQ0U2XENNb5kIN+0Tw==
X-Mailman-Approved-At: Tue, 10 Dec 2019 08:40:05 +0000
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
Cc: Thomas Hellstrom <thellstrom@vmware.com>, Sinclair Yeh <syeh@vmware.com>,
 David Airlie <airlied@linux.ie>, kernel-janitors@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-graphics-maintainer@vmware.com
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

> De: "Lukas Bulwahn" <lukas.bulwahn@gmail.com>
> =C0: "Thomas Hellstrom" <thellstrom@vmware.com>, dri-devel@lists.freedesk=
top.org
> Cc: "David Airlie" <airlied@linux.ie>, "Daniel Vetter" <daniel@ffwll.ch>,=
 "Sinclair Yeh" <syeh@vmware.com>,
> linux-graphics-maintainer@vmware.com, kernel-janitors@vger.kernel.org, li=
nux-kernel@vger.kernel.org, "Lukas Bulwahn"
> <lukas.bulwahn@gmail.com>
> Envoy=E9: Dimanche 8 D=E9cembre 2019 18:53:28
> Objet: [PATCH] drm/vmwgfx: Replace deprecated PTR_RET

> Commit 508108ea2747 ("drm/vmwgfx: Don't refcount command-buffer managed
> resource lookups during command buffer validation") slips in use of
> deprecated PTR_RET. Use PTR_ERR_OR_ZERO instead.
> =

> As the PTR_ERR_OR_ZERO is a bit longer than PTR_RET, we introduce
> local variable ret for proper indentation and line-length limits.

Is 0 actually possible?  I have the impression that it is not, but perhaps =
I missed something.

julia


> Signed-off-by: Lukas Bulwahn <lukas.bulwahn@gmail.com>
> ---
> applies cleanly on current master (9455d25f4e3b) and next-20191207
> compile-tested on x86_64_defconfig + DRM_VMWGFX=3Dy
> =

> drivers/gpu/drm/vmwgfx/vmwgfx_execbuf.c | 21 +++++++++++++++------
> 1 file changed, 15 insertions(+), 6 deletions(-)
> =

> diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_execbuf.c
> b/drivers/gpu/drm/vmwgfx/vmwgfx_execbuf.c
> index 934ad7c0c342..73489a45decb 100644
> --- a/drivers/gpu/drm/vmwgfx/vmwgfx_execbuf.c
> +++ b/drivers/gpu/drm/vmwgfx/vmwgfx_execbuf.c
> @@ -2377,9 +2377,12 @@ static int vmw_cmd_dx_clear_rendertarget_view(stru=
ct
> vmw_private *dev_priv,
> {
> 	VMW_DECLARE_CMD_VAR(*cmd, SVGA3dCmdDXClearRenderTargetView) =3D
> 		container_of(header, typeof(*cmd), header);
> +	struct vmw_resource *ret;
> =

> -	return PTR_RET(vmw_view_id_val_add(sw_context, vmw_view_rt,
> -					   cmd->body.renderTargetViewId));
> +	ret =3D vmw_view_id_val_add(sw_context, vmw_view_rt,
> +				  cmd->body.renderTargetViewId);
> +
> +	return PTR_ERR_OR_ZERO(ret);
> }
> =

> /**
> @@ -2396,9 +2399,12 @@ static int vmw_cmd_dx_clear_depthstencil_view(stru=
ct
> vmw_private *dev_priv,
> {
> 	VMW_DECLARE_CMD_VAR(*cmd, SVGA3dCmdDXClearDepthStencilView) =3D
> 		container_of(header, typeof(*cmd), header);
> +	struct vmw_resource *ret;
> +
> +	ret =3D vmw_view_id_val_add(sw_context, vmw_view_ds,
> +				  cmd->body.depthStencilViewId);
> =

> -	return PTR_RET(vmw_view_id_val_add(sw_context, vmw_view_ds,
> -					   cmd->body.depthStencilViewId));
> +	return PTR_ERR_OR_ZERO(ret);
> }
> =

> static int vmw_cmd_dx_view_define(struct vmw_private *dev_priv,
> @@ -2741,9 +2747,12 @@ static int vmw_cmd_dx_genmips(struct vmw_private
> *dev_priv,
> {
> 	VMW_DECLARE_CMD_VAR(*cmd, SVGA3dCmdDXGenMips) =3D
> 		container_of(header, typeof(*cmd), header);
> +	struct vmw_resource *ret;
> +
> +	ret =3D vmw_view_id_val_add(sw_context, vmw_view_sr,
> +				  cmd->body.shaderResourceViewId);
> =

> -	return PTR_RET(vmw_view_id_val_add(sw_context, vmw_view_sr,
> -					   cmd->body.shaderResourceViewId));
> +	return PTR_ERR_OR_ZERO(ret);
> }
> =

> /**
> --
> 2.17.1
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
