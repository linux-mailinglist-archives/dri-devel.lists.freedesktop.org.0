Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 72A7F8CD07E
	for <lists+dri-devel@lfdr.de>; Thu, 23 May 2024 12:41:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8A92B10E118;
	Thu, 23 May 2024 10:41:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.b="EsuZXHZM";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com
 [209.85.167.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B841C10E118
 for <dri-devel@lists.freedesktop.org>; Thu, 23 May 2024 10:41:15 +0000 (UTC)
Received: by mail-lf1-f48.google.com with SMTP id
 2adb3069b0e04-5238fe0cfc9so1856796e87.0
 for <dri-devel@lists.freedesktop.org>; Thu, 23 May 2024 03:41:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1716460873; x=1717065673;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=BL1+X00ACKL/bv+6PDk9L99Rw1muN1ABKKcgYAgwe5Y=;
 b=EsuZXHZMMcPr3ROSCjAUR89G8GcUxIdRWKssw/oGKlke4CQNJOZUPU9un5sB1I4Uw5
 bwZeMIXm4hsPo9lIB7okaSwgc6kS3gjGIE6nCWGod1vzbIyGDq40fy4hfaaB2ldwqrW2
 LW47FT4JEBpVup5sAmL2H83+9lTR3FMuO6+Zk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1716460873; x=1717065673;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=BL1+X00ACKL/bv+6PDk9L99Rw1muN1ABKKcgYAgwe5Y=;
 b=p0RAwy8r41ThlgYMdV2TWbiU4V35LgryOxU9rflt07sIVYnauLSuV+C8vUR/HhxHIT
 fJgFMGO37d0TUrqzzuW/4bFMT/ORBwqFGTE5pgXM10vA8zww7SHGSVdvTouw+HRuGiPM
 l2dQlwayxEDuyDebEt0aA5cjmxfaRQ6fBKTPeb+UCyuhoyYm+ujE2QkAt3xYYvUcUC1I
 lic+uM9EsF3TIrNskVTyBwZPzwX+Ye7eHBGdv3PpYu+S9SvXZWfOfIxFXKc2nCRvlCCJ
 Fd6thRQQzB3eY7gbYZq6UkR8sCZ0DJOJgdC89kNlkw4QlxjtArpKPNp4PJ7msZWd+HhM
 hgkg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUZ0M8iHDUqDmrXmM4NbwOnlt5b+amhGi6uFmT6m3DapSr5ldqUwHH9wJE+E3HRoFCslj9OU/s+l7QbhC1D7lNBC3lIBjwBohQ1ULq9E42W
X-Gm-Message-State: AOJu0YwK5iJ9d78zEFi0Xn3Gcep+QCvIdjqCi54K11BCNZGu7KoSXqFk
 aujHEz6n+StmUzu7WBuo8flskSRLEEbHO2yviiCEAUH5AN/O3RHL52UOpHFxU6++Wc/R6XEs0Kt
 ihkYwvXQL/Dog3Xlz4sXg1l9XKNmsSCkofLZJ
X-Google-Smtp-Source: AGHT+IFqTEnp78PCvWoQDhZCseLpuI/oZewTrl4O4PyV0liWJOGAHT0/ixjwOP3rlpfNlPgDIVcGQNWnWwCWzn66LzI=
X-Received: by 2002:ac2:4e45:0:b0:51b:efc:df39 with SMTP id
 2adb3069b0e04-527ef4f5d09mr587927e87.10.1716460873562; Thu, 23 May 2024
 03:41:13 -0700 (PDT)
MIME-Version: 1.0
References: <20240521075717.50330-4-angelogioacchino.delregno@collabora.com>
 <eca4d113-ba59-45aa-9224-22235fb09ddc@bosc.ac.cn>
In-Reply-To: <eca4d113-ba59-45aa-9224-22235fb09ddc@bosc.ac.cn>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Thu, 23 May 2024 18:41:02 +0800
Message-ID: <CAGXv+5Gzau7qFrsOrKsm7yXNX7AKadgNM5S3SaTNNu57=5-8EQ@mail.gmail.com>
Subject: Re: [v5,
 3/3] drm/mediatek: Implement OF graphs support for display paths
To: Sui Jingfeng <suijingfeng@bosc.ac.cn>
Cc: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 chunkuang.hu@kernel.org, 
 robh@kernel.org, krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org, 
 p.zabel@pengutronix.de, airlied@gmail.com, daniel@ffwll.ch, 
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de, 
 matthias.bgg@gmail.com, shawn.sung@mediatek.com, yu-chang.lee@mediatek.com, 
 ck.hu@mediatek.com, jitao.shi@mediatek.com, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
 kernel@collabora.com, Alexandre Mergnat <amergnat@baylibre.com>
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

On Wed, May 22, 2024 at 8:32=E2=80=AFPM Sui Jingfeng <suijingfeng@bosc.ac.c=
n> wrote:
>
> Hi,
>
>
> On 5/21/24 15:57, AngeloGioacchino Del Regno wrote:
> > +static int mtk_drm_of_ddp_path_build(struct device *dev, struct device=
_node *node,
> > +                                  struct mtk_mmsys_driver_data *data)
> > +{
> > +     struct device_node *ep_node;
> > +     struct of_endpoint of_ep;
> > +     bool output_present[MAX_CRTC] =3D { false };
> > +     int ret;
> > +
> > +     for_each_endpoint_of_node(node, ep_node) {
> > +             ret =3D of_graph_parse_endpoint(ep_node, &of_ep);
> > +             of_node_put(ep_node);
>
> There is going to *double* decline the reference counter, as the
> __of_get_next_child() will decrease the reference counter for us
> on the next iteration.
>
>
> > +             if (ret) {
> > +                     dev_err_probe(dev, ret, "Cannot parse endpoint\n"=
);
> > +                     break;
> > +             }
>
> Move the 'of_node_put(ep_node)' into brace '{}' here, if we really cares
> about the reference count.
>
> > +
> > +             if (of_ep.id >=3D MAX_CRTC) {
>
> ditto ?

Maybe we should just add a scoped version of for_each_endpoint_of_node().

See https://lore.kernel.org/all/20240223124432.26443-1-Jonathan.Cameron@hua=
wei.com/

ChenYu

> > +                     ret =3D dev_err_probe(dev, -EINVAL,
> > +                                         "Invalid endpoint%u number\n"=
, of_ep.port);
> > +                     break;
> > +             }
> > +
> > +             output_present[of_ep.id] =3D true;
> > +     }
> > +
> > +     if (ret)
> > +             return ret;
> > +
> > +     if (output_present[CRTC_MAIN]) {
> > +             ret =3D mtk_drm_of_ddp_path_build_one(dev, CRTC_MAIN,
> > +                                                 &data->main_path, &da=
ta->main_len);
> > +             if (ret)
> > +                     return ret;
> > +     }
> > +
> > +     if (output_present[CRTC_EXT]) {
> > +             ret =3D mtk_drm_of_ddp_path_build_one(dev, CRTC_EXT,
> > +                                                 &data->ext_path, &dat=
a->ext_len);
> > +             if (ret)
> > +                     return ret;
> > +     }
> > +
> > +     if (output_present[CRTC_THIRD]) {
> > +             ret =3D mtk_drm_of_ddp_path_build_one(dev, CRTC_THIRD,
> > +                                                 &data->third_path, &d=
ata->third_len);
> > +             if (ret)
> > +                     return ret;
> > +     }
> > +
> > +     return 0;
> > +}
> > +
>
> --
> Best regards
> Sui Jingfeng
>
