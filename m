Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D6DA88A6D67
	for <lists+dri-devel@lfdr.de>; Tue, 16 Apr 2024 16:09:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5771910EC70;
	Tue, 16 Apr 2024 14:09:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=ndufresne-ca.20230601.gappssmtp.com header.i=@ndufresne-ca.20230601.gappssmtp.com header.b="XgzNsrXa";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-f171.google.com (mail-qk1-f171.google.com
 [209.85.222.171])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BE70810F0DD
 for <dri-devel@lists.freedesktop.org>; Tue, 16 Apr 2024 14:09:21 +0000 (UTC)
Received: by mail-qk1-f171.google.com with SMTP id
 af79cd13be357-78d77b309f2so385546685a.2
 for <dri-devel@lists.freedesktop.org>; Tue, 16 Apr 2024 07:09:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ndufresne-ca.20230601.gappssmtp.com; s=20230601; t=1713276560; x=1713881360;
 darn=lists.freedesktop.org; 
 h=mime-version:user-agent:content-transfer-encoding:autocrypt
 :references:in-reply-to:date:cc:to:from:subject:message-id:from:to
 :cc:subject:date:message-id:reply-to;
 bh=NyD7CJia6dqQdPW0B5XtV/th76QRRg/WSyHypuuA1Ic=;
 b=XgzNsrXavE23h/6KXHkJQ1MpoBUsH3HfNdyr1YVCEMBBT9dUVKrVEYkqwWR08A5jJ8
 ZhTu6wZyJdDP/jSBE4bqYG06ZMFaH2SRINotgMq34COZ/If1Yu6U8hs6D6E8XvWsJopv
 GUBl+VNokkwjTqtSzT5pqe///RZgq2+vucVsyX1V2QsKjz/5KhPvuaWoXjhOjAKZe0yw
 Li8oXKTvp/IoOjl7C/y5pZ4X7X1ShAZ2F0zfW1hW2h0il2KWa4GRUY/JNxF+roGiUVpZ
 MfVcFBWyjwPiNuHVOKBClrYwmgWixRNNNZW6AV9gzmIY/krfEYH5WlPHiO+dmjqbWaX8
 iCUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1713276560; x=1713881360;
 h=mime-version:user-agent:content-transfer-encoding:autocrypt
 :references:in-reply-to:date:cc:to:from:subject:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=NyD7CJia6dqQdPW0B5XtV/th76QRRg/WSyHypuuA1Ic=;
 b=jHlDlxdftM76VnAbPGxiVc0UV9orl2Yct8/q4sJf5r44hN3y5YZ0o4XjU+bgYSfp1L
 VVEweLdlJIMqPv/mQhx0QW71BNYimqRGfgMPTedLY546FjeHrR6Y1VQOYvFmWEQb5Cqj
 GxSRKz6muRzeBLZLCbTs0lSxY6GRHDeodw5TzNQIK6HpZ8sVD6opJvVHFcIIqfDTegrg
 E3GEKhrAS4njobuuu50qgkwIix4DFedkppfzi0JZ8Ky9uJmNciuybx5QelLslVtDGbqD
 zj0uQAuTjPRbIrNypixaimZrKyAx49Bl9+LHFAw/UJJtHjiw4yWLuaiHRKkjBHsBsHEG
 O3mA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUWJvBK9LHQfgKB50C8wvmet19WZMhuYigXWR91udW6qm9HG4e0NlglzgCtCOmMJ6gmgHWyeiMLE8vEw4I+6Hbg0Fw0pVsUW0iBIw3ICEu+
X-Gm-Message-State: AOJu0Yxef+tJY2hZz16ZvWe9fk1KVX6I+ygafqFLI7s1yvDW+79G02qs
 mOuI0S+p5R0ZDS4uTAeWRnXgwtaoIzffJ4DnFqBBdlM0HHrSNxoYSIIho5IAbFA=
X-Google-Smtp-Source: AGHT+IHTZXOlhLzrZJKOCo7oGobPLBHBqfpA1Y9jlLfjJ81O6tnjovWTxBF2SvorngJtfMN3Z4Hm+g==
X-Received: by 2002:ad4:44a7:0:b0:69f:f2ae:cad6 with SMTP id
 n7-20020ad444a7000000b0069ff2aecad6mr1244518qvt.11.1713276560547; 
 Tue, 16 Apr 2024 07:09:20 -0700 (PDT)
Received: from nicolas-tpx395.localdomain ([2606:6d00:17:6448::7a9])
 by smtp.gmail.com with ESMTPSA id
 dd10-20020ad4580a000000b0069b563d5d8fsm6128137qvb.20.2024.04.16.07.09.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 16 Apr 2024 07:09:20 -0700 (PDT)
Message-ID: <70733fe5c919527796bd3d9735ced522bcdd7a25.camel@ndufresne.ca>
Subject: Re: [PATCH v5 1/9] drm/mediatek/uapi: Add
 DRM_MTK_GEM_CREATE_ENCRYPTED flag
From: Nicolas Dufresne <nicolas@ndufresne.ca>
To: Shawn Sung <shawn.sung@mediatek.com>, Chun-Kuang Hu
 <chunkuang.hu@kernel.org>
Cc: Philipp Zabel <p.zabel@pengutronix.de>, David Airlie
 <airlied@gmail.com>,  Daniel Vetter <daniel@ffwll.ch>, Matthias Brugger
 <matthias.bgg@gmail.com>, AngeloGioacchino Del Regno
 <angelogioacchino.delregno@collabora.com>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, Sumit Semwal
 <sumit.semwal@linaro.org>, Christian =?ISO-8859-1?Q?K=F6nig?=
 <christian.koenig@amd.com>, dri-devel@lists.freedesktop.org, 
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org, 
 linaro-mm-sig@lists.linaro.org, "Jason-JH.Lin" <jason-jh.lin@mediatek.com>
Date: Tue, 16 Apr 2024 10:09:19 -0400
In-Reply-To: <20240403102701.369-2-shawn.sung@mediatek.com>
References: <20240403102701.369-1-shawn.sung@mediatek.com>
 <20240403102701.369-2-shawn.sung@mediatek.com>
Autocrypt: addr=nicolas@ndufresne.ca; prefer-encrypt=mutual;
 keydata=mQGiBEUQN0MRBACQYceNSezSdMjx7sx6gwKkMghrrODgl3B0eXBTgNp6c431IfOOEsdvkoOh1kwoYcQgbg4MXw6beOltysX4e8fFWsiRkc2nvvRW9ir9kHDm49MkBLqaDjTqOkYKNMiurFW+gozpr/lUW15QqT6v68RYe0zRdtwGZqeLzX2LVuukGwCg4AISzswrrYHNV7vQLcbaUhPgIl0D+gILYT9TJgAEK4YHW+bFRcY+cgUFoLQqQayECMlctKoLOE69nIYOc/hDr9uih1wxrQ/yL0NJvQCohSPyoyLF9b2EuIGhQVp05XP7FzlTxhYvGO/DtO08ec85+bTfVBMV6eeY4MS3ZU+1z7ObD7Pf29YjyTehN2Dan6w1g2rBk5MoA/9nDocSlk4pbFpsYSFmVHsDiAOFje3+iY4ftVDKunKYWMhwRVBjAREOByBagmRau0cLEcElpf4hX5f978GoxSGIsiKoDAlXX+ICDOWC1/EXhEEmBR1gL0QJgiVviNyLfGJlZWnPjw6xhhmtHYWTDxBOP5peztyc2PqeKsLsLWzAr7RDTmljb2xhcyBEdWZyZXNuZSAoQi4gU2MuIEluZm9ybWF0aXF1ZSkgPG5pY29sYXMuZHVmcmVzbmVAZ21haWwuY29tPohgBBMRAgAgBQJFlCyOAhsDBgsJCAcDAgQVAggDBBYCAwECHgECF4AACgkQcVMCLawGqBwhLQCgzYlrLBj6KIAZ4gmsfjXD6ZtddT8AoIeGDicVq5WvMHNWign6ApQcZUihtElOaWNvbGFzIER1ZnJlc25lIChCLiBTYy4gSW5mb3JtYXRpcXVlKSA8bmljb2xhcy5kdWZyZXNuZUBjb2xsYWJvcmEuY28udWs+iGIEExECACIFAkuzca8CGwMGCwkIBwMCBhUIAgkKCwQWA
 gMBAh4BAheAAAoJEHFTAi2sBqgcQX8An2By6LDEeMxi4B9hUbpvRnzaaeNqA
 J9Rox8rfqHZnSErw9bCHiBwvwJZ77QxTmljb2xhcyBEdWZyZXNuZSA8bmljb2xhcy5kdWZyZXNuZUBjb2xsYWJvcmEuY29tPohiBBMRAgAiBQJNzZzPAhsDBgsJCAcDAgYVCAIJCgsEFgIDAQIeAQIXgAAKCRBxUwItrAaoHLlxAKCYAGf4JL7DYDLs/188CPMGuwLypwCfWKc9DorA9f5pyYlD5pQo6SgSoiC0J05pY29sYXMgRHVmcmVzbmUgPG5pY29sYXNAbmR1ZnJlc25lLmNhPohiBBMRAgAiBQJVwNwgAhsDBgsJCAcDAgYVCAIJCgsEFgIDAQIeAQIXgAAKCRBxUwItrAaoHCZ4AJ0QwU6/G4c7h9CkMBT9ZxGLX4KSnQCgq0P7CX7hv/M7HeyfMFZe8t3vAEW0RE5pY29sYXMgRHVmcmVzbmUgKEIuIFNjLiBJbmZvcm1hdGlxdWUpIDxuaWNvbGFzZEBibHVlc3RyZWFrdGVjaC5jb20+iGAEExECACAFAkZjGzoCGwMGCwkIBwMCBBUCCAMEFgIDAQIeAQIXgAAKCRBxUwItrAaoHBl7AJ0d2lrzshMmJaik/EaDEakzEwqgxQCg0JVZMZm9gRfEou1FvinuZxwf/mu0R05pY29sYXMgRHVmcmVzbmUgKEIgU2MuIEluZm9ybWF0aXF1ZSkgPG5pY29sYXMuZHVmcmVzbmVAdXNoZXJicm9va2UuY2E+iGAEExECACAFAkUQN0MCGwMGCwkIBwMCBBUCCAMEFgIDAQIeAQIXgAAKCRBxUwItrAaoHPTnAJ0WGgJJVspoctAvEcI00mtp5WAFGgCgr+E7ItOqZEHAs+xabBgknYZIFPW5Ag0ERRA3UhAIAJ0rxl2HsVg/nSOAUt7U/T/W+RKzVAlD9orCB0pRVvyWNxSr8MHcH
 mWCxykLuB34ouM4GuDVRKfGnqLzJRBfjs7Ax9K2FI3Odund9xpviLCt1jFC0K
 XL04RebrFT7xjDfocDaSLFvgxMVs/Jr2/ckKPId1oKvgYgt/o+MzUabKyFB8wIvq4GMtj3LoBKLCie2nCaSt7uVUt6q2t5bNWrd3lO6/mWn7YMc5Hsn33H9pS0+9szw6m3dG08eMKNueDlt72QxiYl2rhjzkT4ltKEkFgYBdyrtIj1UO6eX+YXb4E1rCMJrdjBSgqDPK1sWHC7gliy+izr+XTHuFwlfy8gBpsAAwUIAJJNus64gri4HAL632eqVpza83EphX1IuHzLi1LlMnQ9Tm7XKag46NhmJbOByMG33LwBsBdLjjHQSVkYZFWUifq+NWSFC/kqlb72vW8rBAv64+i3QdfxK9FWbweiRsPpvuHjJQuecbPDJpubLaxKbu2aqLCN5LuHXvdQr6KiXwabT+OJ9AJAqHG7q4IEzg4RNUVn9AS6L8bxqMSocjqpWNBCY2efCVd/c6k4Acv6jXu+wDAZEbWXK+71uaUHExhigBYBpiHGrobe32YlTVE/XEIzKKywhm/Hkn5YKWzumLte6xiD9JhKabmD7uqIvLt2twUpz4BdPzj0dvGlSmvFcaaISQQYEQIACQUCRRA3UgIbDAAKCRBxUwItrAaoHJLyAKDeS3AFowM3f1Y3OFU6XRCTKK2ZhwCfT/7P9WDjkkmiq5AfeOiwVlpuHtM=
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.50.4 (3.50.4-1.fc39) 
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

Le mercredi 03 avril 2024 =C3=A0 18:26 +0800, Shawn Sung a =C3=A9crit=C2=A0=
:
> From: "Jason-JH.Lin" <jason-jh.lin@mediatek.com>
>=20
> Add DRM_MTK_GEM_CREATE_ENCRYPTED flag to allow user to allocate

Is "ENCRYPTED" a proper naming ? My expectation is that this would hold dat=
a in
a PROTECTED memory region but that no cryptographic algorithm will be invol=
ved.

Nicolas

> a secure buffer to support secure video path feature.
>=20
> Signed-off-by: Jason-JH.Lin <jason-jh.lin@mediatek.com>
> Signed-off-by: Hsiao Chien Sung <shawn.sung@mediatek.com>
> ---
>  include/uapi/drm/mediatek_drm.h | 1 +
>  1 file changed, 1 insertion(+)
>=20
> diff --git a/include/uapi/drm/mediatek_drm.h b/include/uapi/drm/mediatek_=
drm.h
> index b0dea00bacbc4..e9125de3a24ad 100644
> --- a/include/uapi/drm/mediatek_drm.h
> +++ b/include/uapi/drm/mediatek_drm.h
> @@ -54,6 +54,7 @@ struct drm_mtk_gem_map_off {
> =20
>  #define DRM_MTK_GEM_CREATE		0x00
>  #define DRM_MTK_GEM_MAP_OFFSET		0x01
> +#define DRM_MTK_GEM_CREATE_ENCRYPTED	0x02
> =20
>  #define DRM_IOCTL_MTK_GEM_CREATE	DRM_IOWR(DRM_COMMAND_BASE + \
>  		DRM_MTK_GEM_CREATE, struct drm_mtk_gem_create)

