Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F3376A211B
	for <lists+dri-devel@lfdr.de>; Fri, 24 Feb 2023 19:04:26 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 24E4A10E5AF;
	Fri, 24 Feb 2023 18:04:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-x831.google.com (mail-qt1-x831.google.com
 [IPv6:2607:f8b0:4864:20::831])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 29C5510E256
 for <dri-devel@lists.freedesktop.org>; Fri, 24 Feb 2023 18:04:22 +0000 (UTC)
Received: by mail-qt1-x831.google.com with SMTP id w42so301224qtc.2
 for <dri-devel@lists.freedesktop.org>; Fri, 24 Feb 2023 10:04:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ndufresne-ca.20210112.gappssmtp.com; s=20210112;
 h=mime-version:user-agent:content-transfer-encoding:references
 :in-reply-to:date:to:from:subject:message-id:from:to:cc:subject:date
 :message-id:reply-to;
 bh=bx+u2jxrWIooKnQnvTZMZQOT03vWJmrOO/mxGamlw3I=;
 b=utHnK7ViPP8IIEMHObTiU24gYW/MdqOknk0TZGMMqe+MBZkuxxrPwWGvEQOQ3WKiXl
 1ecUu88H5F0OMaoNuQE7mMfPSTGxvhmmUgxY/+2FDoEsa+rr2At1AgdWG+DkFkxCfOGI
 kOxKKkb9TKqyfCRMHWj8d1CLflc+R4Pd+Qd6YLmhJVM15PLw447nfz6jmmPH1ILsk7B6
 6vlteR2wbCnMpkF87b3Hbub4MN27ew2LIZoD0+DGaJ/uGTSxCi414BU7HfltKntrXx5U
 Qh9VadxG2t1xlCRTzAZhjIJTZw6yG0w5yIgzLztWMadyo/azZBavhFPA0vfJ5pp7cdO9
 xbKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=mime-version:user-agent:content-transfer-encoding:references
 :in-reply-to:date:to:from:subject:message-id:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=bx+u2jxrWIooKnQnvTZMZQOT03vWJmrOO/mxGamlw3I=;
 b=5FKvRHgRY4aCb+KS1+nvQ8ZAJcCssiOMlTveaK4UkHMer+1tPLcsZv6w33Gx2l5NIG
 xQA6ldYIsGuGzjhdPgIhBTx69r243AAL+Ew40uqpJbGZEse5TG5usSMQSCHNCrH+aOp5
 9AAPaaGrXcmr//zdh9sBZZXimOf2jPa853B3FbSJzA2q5ITFtnIkyk0M8rzSNvpzTc6M
 oEU7yGXYtvGI3SOPURN+U3siIODxAAKWaqsyyUFXfQet/sxuBogJxkllXU68RsyUMDmx
 qDmRRKQn8x7LAOn1EEJJX6H0uyH8Q2JVd3uh3FihLCvwLzRhKu6obDV3w6KkAtGiGeIL
 qdcQ==
X-Gm-Message-State: AO0yUKXf+fELt7VUtTSZHX632Cc0ctJDIoME5eB6tCf5x46IaOj4iOxM
 Lr/C6GtH0VD33RrjCSCrYvbdBah0+XS68Wn0
X-Google-Smtp-Source: AK7set+TXLmLNmj6/nIcApT0F8hLwTPkJ+w+ozZOWX5Ybz7cB63TJJ5jCW2UtLCAXLfgr82GUPX+Yw==
X-Received: by 2002:a05:622a:410:b0:3bf:b950:f684 with SMTP id
 n16-20020a05622a041000b003bfb950f684mr6552067qtx.53.1677261861259; 
 Fri, 24 Feb 2023 10:04:21 -0800 (PST)
Received: from nicolas-tpx395.localdomain (192-222-136-102.qc.cable.ebox.net.
 [192.222.136.102]) by smtp.gmail.com with ESMTPSA id
 t41-20020a05622a182900b003bfad864e81sm4791266qtc.69.2023.02.24.10.04.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 24 Feb 2023 10:04:20 -0800 (PST)
Message-ID: <f4becff94466ca364dc1408f7491de131a36f0c3.camel@ndufresne.ca>
Subject: Re: [PATCH v3 2/7] media: Add Y210, Y212 and Y216 formats
From: Nicolas Dufresne <nicolas@ndufresne.ca>
To: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>, 
 linux-renesas-soc@vger.kernel.org, linux-media@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, Laurent Pinchart
 <laurent.pinchart@ideasonboard.com>, Kieran Bingham
 <kieran.bingham@ideasonboard.com>, Geert Uytterhoeven
 <geert@linux-m68k.org>,  Ming Qian <ming.qian@nxp.com>
Date: Fri, 24 Feb 2023 13:04:19 -0500
In-Reply-To: <029a92fa-d1e0-54da-76b9-a6e1dd65298e@ideasonboard.com>
References: <20221221092448.741294-1-tomi.valkeinen+renesas@ideasonboard.com>
 <20221221092448.741294-3-tomi.valkeinen+renesas@ideasonboard.com>
 <691e89bd57907c96cbb8e922cb12b1264b31d471.camel@ndufresne.ca>
 <029a92fa-d1e0-54da-76b9-a6e1dd65298e@ideasonboard.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.3 (3.46.3-1.fc37) 
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

Le jeudi 23 f=C3=A9vrier 2023 =C3=A0 15:10 +0200, Tomi Valkeinen a =C3=A9cr=
it=C2=A0:
> Hi,
>=20
> On 22/02/2023 17:28, Nicolas Dufresne wrote:
> > Hi Tomi,
> >=20
> > Le mercredi 21 d=C3=A9cembre 2022 =C3=A0 11:24 +0200, Tomi Valkeinen a =
=C3=A9crit=C2=A0:
> > > Add Y210, Y212 and Y216 formats.
> > >=20
> > > Signed-off-by: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.co=
m>
> > > ---
> > >   .../media/v4l/pixfmt-packed-yuv.rst           | 49 ++++++++++++++++=
++-
> > >   drivers/media/v4l2-core/v4l2-ioctl.c          |  3 ++
> > >   include/uapi/linux/videodev2.h                |  8 +++
> > >   3 files changed, 58 insertions(+), 2 deletions(-)
> >=20
> > It seems you omitted to update v4l2-common.c, Ming Qian had made a supl=
icated
> > commit for this, I'll ask him if he can keep the -common changes you fo=
rgot.
>=20
> Ah, I wasn't aware of the format list in that file.
>=20
> I think you refer to the "media: imx-jpeg: Add support for 12 bit=20
> extended jpeg" series. Yes, I'm fine if he can add the -common changes=
=20
> there, but I can also send a separate patch. In fact, maybe a separate=
=20
> fix patch is better, so that we can have it merged in the early 6.3 rcs.

I don't think we need to worry about backporting this though. I simply care=
 that
we keep updating -common and encourage using it. The goal of this lib is to
provide a common set of helpers to do calculate format related information.=
 You
don't have to use it at any cost. Allocation is often the cause of memory
corruption issues, and is a very recurrent thing we have to debug and fix.

This was also discussed on IRC yesterday, for Renesas driver, "just porting=
 it"
to use that could mean duplicating the lookup, as Renesas driver also needs=
 its
own map to get the HW specific formats and other information. This looks li=
ke a
valid use case to me, and is definitely something -common could improve on.

Nicolas
