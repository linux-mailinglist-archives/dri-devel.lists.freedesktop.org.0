Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F0C88A7218
	for <lists+dri-devel@lfdr.de>; Tue, 16 Apr 2024 19:19:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 81736112D78;
	Tue, 16 Apr 2024 17:19:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.b="HdGwIGTN";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com
 [209.85.214.171])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 667AB10F242
 for <dri-devel@lists.freedesktop.org>; Tue, 16 Apr 2024 17:19:19 +0000 (UTC)
Received: by mail-pl1-f171.google.com with SMTP id
 d9443c01a7336-1e3c89f3d32so15915ad.0
 for <dri-devel@lists.freedesktop.org>; Tue, 16 Apr 2024 10:19:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1713287958; x=1713892758;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=pMzpM+93sB8KN+aihvsI4sj2s8RINAbT1I+ikFGc/QQ=;
 b=HdGwIGTNz0YQh9NdAKMFvnfrzFaux1bC3cS7CrPhyCCP8y4I0DdrhenuZeGZxmWrm0
 p1aDUnpVHdPBT5MSP7R+U06N+OvqQpDSPc5NG/SQS9GanH+lygBX/CgoO+ORG0ZqgBnZ
 //YtgyNE44lcwiydprbU7ZIxvcLhxaJBvr3C3sy+55zNFc5FqlVZt3MfG2bdw7C+6wOl
 90+9IrvsfhUEbKSs9suok0lA5QU9pSCVykgqKwofczL8KRSyy0XzrJNGXy6E7rjSiZVJ
 LIJcwwV40ikk1jkPmLA2CTAgf3KocPxNMdNCar3PqCWfGK28CLVLkFdEo5tVoJbpwnXe
 y3cg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1713287958; x=1713892758;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=pMzpM+93sB8KN+aihvsI4sj2s8RINAbT1I+ikFGc/QQ=;
 b=q8l4SZDIRqQXLoTnRspqjMDmhaAPDc6ceZTysDytMVcz2f7aScoIdbECAjWmM2g0wi
 u2bxTjET9r65OOOQok/TFot785ujhsADsIHJYVXZ6zqdLUDClwzNvoYFOEoQGJ1RN/95
 1Z8oPRRKVc9PcKv0pQYkxNfgwiYTvZFeo2AgzudAG/dFFQn0fYu56UuOQ76sFwtCrkZk
 DITuh5mKr+sWrev32k0bUQj2id4GAVVSHygXD+iBKaV7fVEIz4+SL+mv4uSVpktC/6DD
 HOtTlMiSzcyrGv00WrGTM06/knEEFeQULtFF3p5LDT227TbOS+gzSu+vjTGSu7XOhn4m
 umeQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCV+nwyX9LERTBnhT+OQMHumY/xNeDdZF2UKpQqYHLCmuECOvedkxESmp1yzQuSeyrrBdY12xqPlmVmMFJy6QuyrFC4Bx7/s0QdTFjN51m2n
X-Gm-Message-State: AOJu0YxVnJUnokjMDfxbLepsEGcKa3uELlW2kt7BlSOlYDgiOGp3Mw0d
 uGBZ2NMxdKYu1X7WhpTQyEZ/4U+gMKECprTapbxWUwWtCaP4/G2wIeL54SVnSXpw9FdpaRuuz6B
 TpurrKdp+NqyegA9I6H3rEw43HUOCGI2DQas=
X-Google-Smtp-Source: AGHT+IE+6v3wDbegK+Ux9rAhzTqqKq8TNFIZbmfaam/cohc7jxMrIVpQZc4dbB+03Ft2nzo9gRjOdyXae1RXd7Onh9g=
X-Received: by 2002:a17:902:fc8b:b0:1e4:33a6:b0d4 with SMTP id
 mf11-20020a170902fc8b00b001e433a6b0d4mr258654plb.9.1713287958225; Tue, 16 Apr
 2024 10:19:18 -0700 (PDT)
MIME-Version: 1.0
References: <20240403102701.369-1-shawn.sung@mediatek.com>
 <20240403102701.369-2-shawn.sung@mediatek.com>
 <70733fe5c919527796bd3d9735ced522bcdd7a25.camel@ndufresne.ca>
In-Reply-To: <70733fe5c919527796bd3d9735ced522bcdd7a25.camel@ndufresne.ca>
From: Jeffrey Kardatzke <jkardatzke@google.com>
Date: Tue, 16 Apr 2024 10:19:02 -0700
Message-ID: <CA+ddPcMWein69X6U46pZbDy51gFHHxXV5d+6BvFq7ma6n0E22w@mail.gmail.com>
Subject: Re: [PATCH v5 1/9] drm/mediatek/uapi: Add DRM_MTK_GEM_CREATE_ENCRYPTED
 flag
To: Nicolas Dufresne <nicolas@ndufresne.ca>
Cc: Shawn Sung <shawn.sung@mediatek.com>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>, 
 Philipp Zabel <p.zabel@pengutronix.de>, David Airlie <airlied@gmail.com>, 
 Daniel Vetter <daniel@ffwll.ch>, Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, Sumit Semwal <sumit.semwal@linaro.org>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
 dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-media@vger.kernel.org, linaro-mm-sig@lists.linaro.org, 
 "Jason-JH.Lin" <jason-jh.lin@mediatek.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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

I would argue 'restricted' is the proper name since that was what was
settled on for the dma-buf code.  :)  But you are definitely right
that this memory is not encrypted.


On Tue, Apr 16, 2024 at 7:09=E2=80=AFAM Nicolas Dufresne <nicolas@ndufresne=
.ca> wrote:
>
> Hi,
>
> Le mercredi 03 avril 2024 =C3=A0 18:26 +0800, Shawn Sung a =C3=A9crit :
> > From: "Jason-JH.Lin" <jason-jh.lin@mediatek.com>
> >
> > Add DRM_MTK_GEM_CREATE_ENCRYPTED flag to allow user to allocate
>
> Is "ENCRYPTED" a proper naming ? My expectation is that this would hold d=
ata in
> a PROTECTED memory region but that no cryptographic algorithm will be inv=
olved.
>
> Nicolas
>
> > a secure buffer to support secure video path feature.
> >
> > Signed-off-by: Jason-JH.Lin <jason-jh.lin@mediatek.com>
> > Signed-off-by: Hsiao Chien Sung <shawn.sung@mediatek.com>
> > ---
> >  include/uapi/drm/mediatek_drm.h | 1 +
> >  1 file changed, 1 insertion(+)
> >
> > diff --git a/include/uapi/drm/mediatek_drm.h b/include/uapi/drm/mediate=
k_drm.h
> > index b0dea00bacbc4..e9125de3a24ad 100644
> > --- a/include/uapi/drm/mediatek_drm.h
> > +++ b/include/uapi/drm/mediatek_drm.h
> > @@ -54,6 +54,7 @@ struct drm_mtk_gem_map_off {
> >
> >  #define DRM_MTK_GEM_CREATE           0x00
> >  #define DRM_MTK_GEM_MAP_OFFSET               0x01
> > +#define DRM_MTK_GEM_CREATE_ENCRYPTED 0x02
> >
> >  #define DRM_IOCTL_MTK_GEM_CREATE     DRM_IOWR(DRM_COMMAND_BASE + \
> >               DRM_MTK_GEM_CREATE, struct drm_mtk_gem_create)
>
>
