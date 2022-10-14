Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A96625FEDD1
	for <lists+dri-devel@lfdr.de>; Fri, 14 Oct 2022 14:05:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5188B10E9A5;
	Fri, 14 Oct 2022 12:05:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qv1-xf33.google.com (mail-qv1-xf33.google.com
 [IPv6:2607:f8b0:4864:20::f33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7EC6D10E9A5
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Oct 2022 12:05:29 +0000 (UTC)
Received: by mail-qv1-xf33.google.com with SMTP id df9so3058637qvb.9
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Oct 2022 05:05:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=fooishbar-org.20210112.gappssmtp.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=kkAhUTPCGtGhz4T15xTdV3cJPOznGTE5f9nONR2qF1Y=;
 b=GL++3u21q5MqvvdpXTsNngPQJj5qlhkPVeKIzr+9GUn1Zctd54rZM6X+GHimoZTD7O
 mMt67ztpEA7FfsTCt+VRpvo3hBEIup+DOhViHNDSeirpViZbDCjv0WzPzEsGFRelnWGn
 Kyf37d35xMiqiu4gscLa8IAZn6t+A+GkMvMs8kUPTUx9qny18KJXP5PQxk3kSdKl10kx
 OB15hrCjQdlY2/MXpqheId7Qtr0NXd+3b6PuOLKuSUQSRa1NMP4qVkQ8FahaqfV76enQ
 nE/kCZiqF8lItvX7AqG9d93BTlWPApR3yDv//TSNvwqoiB2/kpxTEppfrqpXDY5htXhy
 /Ljw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=kkAhUTPCGtGhz4T15xTdV3cJPOznGTE5f9nONR2qF1Y=;
 b=UIiaGFgH5xbASEysYDdaIojCi/jXlVsrsj2S9ujjQzo1xnEacYa1Bxc3h7hBC5MHe6
 OL8jWqq0BIl/5hEvOZM0LAUj7El8+qMZxTres3i/nZ2aN/SQNB5V7wXt9+6MMlewL5NR
 9DZ8Hygt66bHulCxZLYau0uCAwUasJ8Mn8JaHF2eEITTjI+zcotP1wgXVH8Z2XDD3tww
 XtRNkgYNDy9XKIdh673BuCxoUak5VtEvq1UZrszkwGq5zIINZE63vtqBbPgoXCfkVA8M
 KTzvJ5pIz9Kj4Kmj/NkKxkGzG8gy7x0bVlmXLQjsHj/HgeROIUYYX7qbxXAnZincpr+L
 E0Fg==
X-Gm-Message-State: ACrzQf3EoPw0CJ4dQ2vV5HGxBFqZlPRmfRzvli/Zg7oZZ5tAuvbkcxQr
 2VmG1K8n/q/76Qn0Vj1gjLsk/rHPSF6d4bW+6GsxjA==
X-Google-Smtp-Source: AMsMyM51lcUig0hL8RNmUMETJ4OmBas7aX/YgqkpEQMr2EAWocTFa7ooESKIIvD6RxurgRRSJHeRj2csL/66QCvBELY=
X-Received: by 2002:a05:6214:c29:b0:4b1:c69a:4729 with SMTP id
 a9-20020a0562140c2900b004b1c69a4729mr3476195qvd.12.1665749128280; Fri, 14 Oct
 2022 05:05:28 -0700 (PDT)
MIME-Version: 1.0
References: <20221013193148.2027842-1-greenjustin@chromium.org>
 <5723fa3f-033b-07f6-6774-cd5df97d5cbb@collabora.com>
In-Reply-To: <5723fa3f-033b-07f6-6774-cd5df97d5cbb@collabora.com>
From: Daniel Stone <daniel@fooishbar.org>
Date: Fri, 14 Oct 2022 13:05:15 +0100
Message-ID: <CAPj87rO0fNRKbKXWyV56QGR1yuAFN5SB=NyiNsKfTDC1_KQYGQ@mail.gmail.com>
Subject: Re: [PATCH v4] drm/mediatek: Add AFBC support to Mediatek DRM driver
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Type: multipart/alternative; boundary="00000000000013941b05eafd71b6"
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
Cc: chunkuang.hu@kernel.org, Justin Green <greenjustin@chromium.org>,
 airlied@linux.ie, jason-jh.lin@mediatek.com, justin.yeh@mediatek.com,
 dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org,
 wenst@chromium.org, matthias.bgg@gmail.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--00000000000013941b05eafd71b6
Content-Type: text/plain; charset="UTF-8"

Hi,

On Fri, 14 Oct 2022 at 08:46, AngeloGioacchino Del Regno <
angelogioacchino.delregno@collabora.com> wrote:

> Il 13/10/22 21:31, Justin Green ha scritto:
> > Signed-off-by: Justin Green <greenjustin@chromium.org>
>
> Reviewed-by: AngeloGioacchino Del Regno <
> angelogioacchino.delregno@collabora.com>
>

And also:
Acked-by: Daniel Stone <daniels@collabora.com>

I was worried about INVALID being passed through, but for the most part it
seems like it magically turns into LINEAR through either zero extension or
explicit initialisation to zero.

Cheers,
Daniel

--00000000000013941b05eafd71b6
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Hi,</div><br><div class=3D"gmail_quote"><div dir=3D"l=
tr" class=3D"gmail_attr">On Fri, 14 Oct 2022 at 08:46, AngeloGioacchino Del=
 Regno &lt;<a href=3D"mailto:angelogioacchino.delregno@collabora.com">angel=
ogioacchino.delregno@collabora.com</a>&gt; wrote:<br></div><blockquote clas=
s=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid r=
gb(204,204,204);padding-left:1ex">Il 13/10/22 21:31, Justin Green ha scritt=
o:<br>&gt; Signed-off-by: Justin Green &lt;<a href=3D"mailto:greenjustin@ch=
romium.org" target=3D"_blank">greenjustin@chromium.org</a>&gt;<br>
<br>
Reviewed-by: AngeloGioacchino Del Regno &lt;<a href=3D"mailto:angelogioacch=
ino.delregno@collabora.com" target=3D"_blank">angelogioacchino.delregno@col=
labora.com</a>&gt;<br></blockquote><div><br></div><div>And also:<br>Acked-b=
y: Daniel Stone &lt;<a href=3D"mailto:daniels@collabora.com">daniels@collab=
ora.com</a>&gt;</div><div><br></div><div>I was worried about INVALID being =
passed through, but for the most part it seems like it magically turns into=
 LINEAR through either zero extension or explicit initialisation to zero.</=
div><div><br></div><div>Cheers,</div><div>Daniel=C2=A0</div></div></div>

--00000000000013941b05eafd71b6--
