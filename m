Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C721C5A01F5
	for <lists+dri-devel@lfdr.de>; Wed, 24 Aug 2022 21:16:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0FBAAC0A6D;
	Wed, 24 Aug 2022 19:16:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qv1-xf33.google.com (mail-qv1-xf33.google.com
 [IPv6:2607:f8b0:4864:20::f33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3058F10F3A5
 for <dri-devel@lists.freedesktop.org>; Fri, 19 Aug 2022 15:26:50 +0000 (UTC)
Received: by mail-qv1-xf33.google.com with SMTP id c5so3169467qvt.11
 for <dri-devel@lists.freedesktop.org>; Fri, 19 Aug 2022 08:26:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ndufresne-ca.20210112.gappssmtp.com; s=20210112;
 h=mime-version:user-agent:content-transfer-encoding:references
 :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc;
 bh=R+dNyyhZWqiKyDnj3wr9Zou8hF3lxJeexkrsHsTQHCs=;
 b=gIDMRZx+giubIoQBdvXlT0umgT/qdGwDGI05hYyh2Vvu0kpK5kdNyw1KGVPnTyVcS4
 PSPoWV70wIKHa4mFlRK/CiXR892ZCQmDp9V0E2iIYQnrn6PlCj2jk64SBmmKC6K20De9
 PG5VnUWE6kIHmWUPCbBn9B79Q5f0hRBiDP3mcL4Eafkyr1HTjJiEHKcteD9UWxFQb3i5
 OQJNEairgzp2nTftuwMeHSkXzzviY++/vPgW5it1RfWCMh9b350LmCkohPl8n6NFyhLq
 /9JennJOD4aTdblZCluX4cAijvnPMuW2VHNg8bz+WkObDLFYgqSH96PU3TaY5asFjKeF
 LV/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=mime-version:user-agent:content-transfer-encoding:references
 :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
 :from:to:cc;
 bh=R+dNyyhZWqiKyDnj3wr9Zou8hF3lxJeexkrsHsTQHCs=;
 b=h+oiT6jYsbX17VzynWSxrbYNsS5xz+Wa4ftZ52TBjbcLRTRUo7A96HbwuTjYJb97Nq
 FkzZ3SwIj91hD3xfkWSIofJCkX2MNfI8CzsEtwNlHTpLJ3hImHk6W7/4PAOXMB0UPNdJ
 Bw4NDscuB65HmSS4PZAzWwxqDlCU/6dj8A2yH7EBPZ3Na2RSLiq55PTIoMslCboPSpUh
 XS77vXMaI4XUdLavn60BO7cX+9OxseNe87iGOJyxDohmHtkWphECLogLb1wAOS/GL7We
 AoSAlSJDfRMSf/UPAdzBe98ZbvKc+cQikm097P0fJyViA+Znyf+K9AhXQwYLNdRdhYzb
 Q23A==
X-Gm-Message-State: ACgBeo1EGa41SCMLN1J9aGqhmeJftv5vpRe+K3+fn6rY5anyNBhIzbup
 5fINWx1kEHm9hCbELdlMHQw28Q==
X-Google-Smtp-Source: AA6agR7U56cQNY2xUyo+d5l6PVKsi2MOXOr/PEkSHhmZKzpQfdPj2IQ/vETNRnqdrxY7d2iUdYlsbA==
X-Received: by 2002:a05:6214:e68:b0:474:89bf:ca1b with SMTP id
 jz8-20020a0562140e6800b0047489bfca1bmr6975461qvb.107.1660922809183; 
 Fri, 19 Aug 2022 08:26:49 -0700 (PDT)
Received: from nicolas-tpx395.localdomain (192-222-136-102.qc.cable.ebox.net.
 [192.222.136.102]) by smtp.gmail.com with ESMTPSA id
 ee7-20020a05620a800700b006bb82221013sm4292050qkb.0.2022.08.19.08.26.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 19 Aug 2022 08:26:48 -0700 (PDT)
Message-ID: <64fbaceed1cc140e54aec54747e56b40b68378ca.camel@ndufresne.ca>
Subject: Re: [PATCH 2/2] [WIP]: media: Add Synaptics compressed tiled format
From: Nicolas Dufresne <nicolas@ndufresne.ca>
To: Hsia-Jun Li <Randy.Li@synaptics.com>, Tomasz Figa <tfiga@chromium.org>
Date: Fri, 19 Aug 2022 11:26:45 -0400
In-Reply-To: <13d37c15-79f3-4e16-8cf4-fc37846f4a04@synaptics.com>
References: <20220808162750.828001-1-randy.li@synaptics.com>
 <20220808162750.828001-3-randy.li@synaptics.com>
 <CAAFQd5AKjpJ+fPAeCqdNnJbS4R7SdaHkfyW4qG1xXr-sE801pQ@mail.gmail.com>
 <13d37c15-79f3-4e16-8cf4-fc37846f4a04@synaptics.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.44.4 (3.44.4-1.fc36) 
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
Cc: linux-arm-kernel@lists.infradead.org, ezequiel@vanguardiasur.com.ar,
 sebastian.hesselbarth@gmail.com, airlied@linux.ie,
 linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
 sakari.ailus@linux.intel.com, dri-devel@lists.freedesktop.org,
 tzimmermann@suse.de, ribalda@chromium.org, hverkuil-cisco@xs4all.nl,
 mchehab@kernel.org, jszhang@kernel.org, laurent.pinchart@ideasonboard.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Le jeudi 18 ao=C3=BBt 2022 =C3=A0 14:33 +0800, Hsia-Jun Li a =C3=A9crit=C2=
=A0:
>=20
> On 8/18/22 14:06, Tomasz Figa wrote:
> > CAUTION: Email originated externally, do not click links or open attach=
ments unless you recognize the sender and know the content is safe.
> >=20
> >=20
> > Hi Randy,
> >=20
> > On Tue, Aug 9, 2022 at 1:28 AM Hsia-Jun Li <randy.li@synaptics.com> wro=
te:
> > >=20
> > > From: "Hsia-Jun(Randy) Li" <randy.li@synaptics.com>
> > >=20
> > > The most of detail has been written in the drm.
> > > Please notice that the tiled formats here request
> > > one more plane for storing the motion vector metadata.
> > > This buffer won't be compressed, so you can't append
> > > it to luma or chroma plane.
> >=20
> > Does the motion vector buffer need to be exposed to userspace? Is the
> > decoder stateless (requires userspace to specify the reference frames)
> > or stateful (manages the entire decoding process internally)?
> >=20
> No, users don't need to access them at all. Just they need a different=
=20
> dma-heap.
>=20
> You would only get the stateful version of both encoder and decoder.

Can't you just allocate and manage these internally in the kernel driver wi=
thout
adding kernel APIs ? This is notably what Mediatek and (downstream) RPi HEV=
C
driver do, as it allow reducing quite a lot the memory usage. In Hantro, we=
 bind
them due to HW limitation.

Nicolas

> > Best regards,
> > Tomasz
> >=20
> > >=20
> > > Signed-off-by: Hsia-Jun(Randy) Li <randy.li@synaptics.com>
> > > ---
> > >   drivers/media/v4l2-core/v4l2-common.c | 1 +
> > >   drivers/media/v4l2-core/v4l2-ioctl.c  | 2 ++
> > >   include/uapi/linux/videodev2.h        | 2 ++
> > >   3 files changed, 5 insertions(+)
> > >=20
> > > diff --git a/drivers/media/v4l2-core/v4l2-common.c b/drivers/media/v4=
l2-core/v4l2-common.c
> > > index e0fbe6ba4b6c..f645278b3055 100644
> > > --- a/drivers/media/v4l2-core/v4l2-common.c
> > > +++ b/drivers/media/v4l2-core/v4l2-common.c
> > > @@ -314,6 +314,7 @@ const struct v4l2_format_info *v4l2_format_info(u=
32 format)
> > >                  { .format =3D V4L2_PIX_FMT_SGBRG12,       .pixel_enc=
 =3D V4L2_PIXEL_ENC_BAYER, .mem_planes =3D 1, .comp_planes =3D 1, .bpp =3D =
{ 2, 0, 0, 0 }, .hdiv =3D 1, .vdiv =3D 1 },
> > >                  { .format =3D V4L2_PIX_FMT_SGRBG12,       .pixel_enc=
 =3D V4L2_PIXEL_ENC_BAYER, .mem_planes =3D 1, .comp_planes =3D 1, .bpp =3D =
{ 2, 0, 0, 0 }, .hdiv =3D 1, .vdiv =3D 1 },
> > >                  { .format =3D V4L2_PIX_FMT_SRGGB12,       .pixel_enc=
 =3D V4L2_PIXEL_ENC_BAYER, .mem_planes =3D 1, .comp_planes =3D 1, .bpp =3D =
{ 2, 0, 0, 0 }, .hdiv =3D 1, .vdiv =3D 1 },
> > > +               { .format =3D V4L2_PIX_FMT_NV12M_V4H1C, .pixel_enc =
=3D V4L2_PIXEL_ENC_YUV, .mem_planes =3D 5, .comp_planes =3D 2, .bpp =3D { 1=
, 2, 0, 0 }, .hdiv =3D 2, .vdiv =3D 2, .block_w =3D { 128, 128 }, .block_h =
=3D { 128, 128 } },
> > >          };
> > >          unsigned int i;
> > >=20
> > > diff --git a/drivers/media/v4l2-core/v4l2-ioctl.c b/drivers/media/v4l=
2-core/v4l2-ioctl.c
> > > index e6fd355a2e92..8f65964aff08 100644
> > > --- a/drivers/media/v4l2-core/v4l2-ioctl.c
> > > +++ b/drivers/media/v4l2-core/v4l2-ioctl.c
> > > @@ -1497,6 +1497,8 @@ static void v4l_fill_fmtdesc(struct v4l2_fmtdes=
c *fmt)
> > >                  case V4L2_PIX_FMT_MT21C:        descr =3D "Mediatek =
Compressed Format"; break;
> > >                  case V4L2_PIX_FMT_QC08C:        descr =3D "QCOM Comp=
ressed 8-bit Format"; break;
> > >                  case V4L2_PIX_FMT_QC10C:        descr =3D "QCOM Comp=
ressed 10-bit Format"; break;
> > > +               case V4L2_PIX_FMT_NV12M_V4H1C:  descr =3D "Synaptics =
Compressed 8-bit tiled Format";break;
> > > +               case V4L2_PIX_FMT_NV12M_10_V4H3P8C:     descr =3D "Sy=
naptics Compressed 10-bit tiled Format";break;
> > >                  default:
> > >                          if (fmt->description[0])
> > >                                  return;
> > > diff --git a/include/uapi/linux/videodev2.h b/include/uapi/linux/vide=
odev2.h
> > > index 01e630f2ec78..7e928cb69e7c 100644
> > > --- a/include/uapi/linux/videodev2.h
> > > +++ b/include/uapi/linux/videodev2.h
> > > @@ -661,6 +661,8 @@ struct v4l2_pix_format {
> > >   #define V4L2_PIX_FMT_NV12MT_16X16 v4l2_fourcc('V', 'M', '1', '2') /=
* 12  Y/CbCr 4:2:0 16x16 tiles */
> > >   #define V4L2_PIX_FMT_NV12M_8L128      v4l2_fourcc('N', 'A', '1', '2=
') /* Y/CbCr 4:2:0 8x128 tiles */
> > >   #define V4L2_PIX_FMT_NV12M_10BE_8L128 v4l2_fourcc_be('N', 'T', '1',=
 '2') /* Y/CbCr 4:2:0 10-bit 8x128 tiles */
> > > +#define V4L2_PIX_FMT_NV12M_V4H1C v4l2_fourcc('S', 'Y', '1', '2')   /=
* 12  Y/CbCr 4:2:0 tiles */
> > > +#define V4L2_PIX_FMT_NV12M_10_V4H3P8C v4l2_fourcc('S', 'Y', '1', '0'=
)   /* 12  Y/CbCr 4:2:0 10-bits tiles */
> > >=20
> > >   /* Bayer formats - see https://urldefense.proofpoint.com/v2/url?u=
=3Dhttp-3A__www.siliconimaging.com_RGB-2520Bayer.htm&d=3DDwIBaQ&c=3D7dfBJ8c=
XbWjhc0BhImu8wVIoUFmBzj1s88r8EGyM0UY&r=3DP4xb2_7biqBxD4LGGPrSV6j-jf3C3xlR7P=
XU-mLTeZE&m=3DvmpysqneiHK3UXcq6UOewdMwobFa70zKB3RuOgYT02aFw9fCs6qd7j-U1sYSe=
y79&s=3DyblzF1GwanMEJFC3yt9nBAQjaaAEJKKlNgj4k64v5eE&e=3D   */
> > >   #define V4L2_PIX_FMT_SBGGR8  v4l2_fourcc('B', 'A', '8', '1') /*  8 =
 BGBG.. GRGR.. */
> > > --
> > > 2.17.1
> > >=20
>=20

