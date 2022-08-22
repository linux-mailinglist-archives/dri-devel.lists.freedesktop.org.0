Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 85C1559C175
	for <lists+dri-devel@lfdr.de>; Mon, 22 Aug 2022 16:15:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B7FD790061;
	Mon, 22 Aug 2022 14:15:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-x835.google.com (mail-qt1-x835.google.com
 [IPv6:2607:f8b0:4864:20::835])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D3D7912B99A
 for <dri-devel@lists.freedesktop.org>; Mon, 22 Aug 2022 14:15:20 +0000 (UTC)
Received: by mail-qt1-x835.google.com with SMTP id e28so7953260qts.1
 for <dri-devel@lists.freedesktop.org>; Mon, 22 Aug 2022 07:15:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ndufresne-ca.20210112.gappssmtp.com; s=20210112;
 h=mime-version:user-agent:content-transfer-encoding:references
 :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc;
 bh=7erYZR7y/baNHdFg/R+eq9CtBmAuN+I62W1+/+lw+cU=;
 b=VGl87qAgSZFH5MQo+ucFhoxCnIbvfvn64GrCfEeXBnJta/mV/9ThbXHC4Z1Yw8tvQt
 H30d7fI7JYw9d4r2DQM590OqsBL+0GT2ctVypAIYJdv3LW9zDW1onsLALZRmgRzCNujb
 cU5uNXO8yXxGfK8yhQTh41pNMMVI6skHYZduyRzucyoxNFN6ldlVVJ8qWPSkxGgPDUjp
 eeNfQipmPbvcTyvkyoo3LRMe9gb+V0vBubB3JMJ75OV17Fp6f2uogwHNWurKs+9ajlTS
 xo6BEMzOfG2zvYz+Yx20o2WYRoHP4Xsr3V52hyxVX9G3aSyviZsaKwQaIOlP6L1FzWFH
 enwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=mime-version:user-agent:content-transfer-encoding:references
 :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
 :from:to:cc;
 bh=7erYZR7y/baNHdFg/R+eq9CtBmAuN+I62W1+/+lw+cU=;
 b=PupSk6xg/oAKCnm7k2Ihnj6l94Mu/MM2cxKMlwCl5rcIufDiRi1kAFaJaTDsTs0dCz
 hoslwsX4EH0MwhSVD5tnP9C5OvF/5IVH/gP7qLASAbzYNZaxXNVYRDil0hwlwu73zUKk
 byQ9R6hJY8kcrb1+klXJW2yvSVCMvsrvxt9Mtn84Cc3hwoTZMKnviKT4Ytr6Z/EfR5Ov
 8NZTJTypYaV/ySvV21QVDf/SE5LOXmbNFZyTX5Fl2qcd+JrkTUVhbt/uTl/tA2NwLzvz
 r+xAsnZTMg4p4Qa58Suneyo3LJ4TLG5fFAuALa97Lh6YQOuLxHDJXjhzZ5p81xZ5EL16
 /EoQ==
X-Gm-Message-State: ACgBeo2l6qpbtQg7cx0e/QQUB8NETWR5my77dhBZAiB7vYvmcP1STxv4
 2WYvDoaPMzX1ePXrUNK1xMjZlg==
X-Google-Smtp-Source: AA6agR4eJVG9jPyBnQMQqk64yg+IQ0/B6Zje6l0qsBpO5D/bkbMtbjsyJJGN9JYXm9KZAObzs3WV0g==
X-Received: by 2002:a05:622a:58d:b0:344:62be:dae with SMTP id
 c13-20020a05622a058d00b0034462be0daemr15450664qtb.596.1661177719836; 
 Mon, 22 Aug 2022 07:15:19 -0700 (PDT)
Received: from nicolas-tpx395.localdomain (192-222-136-102.qc.cable.ebox.net.
 [192.222.136.102]) by smtp.gmail.com with ESMTPSA id
 l16-20020a37f910000000b006bbe6e89bdcsm7457760qkj.31.2022.08.22.07.15.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 22 Aug 2022 07:15:19 -0700 (PDT)
Message-ID: <e15165f60ce801dd502bfe1992ea430fe37c5a91.camel@ndufresne.ca>
Subject: Re: [PATCH 2/2] [WIP]: media: Add Synaptics compressed tiled format
From: Nicolas Dufresne <nicolas@ndufresne.ca>
To: Hsia-Jun Li <Randy.Li@synaptics.com>
Date: Mon, 22 Aug 2022 10:15:17 -0400
In-Reply-To: <1f926989-eb13-14ee-e30d-ac6d01b86c52@synaptics.com>
References: <20220808162750.828001-1-randy.li@synaptics.com>
 <20220808162750.828001-3-randy.li@synaptics.com>
 <CAAFQd5AKjpJ+fPAeCqdNnJbS4R7SdaHkfyW4qG1xXr-sE801pQ@mail.gmail.com>
 <13d37c15-79f3-4e16-8cf4-fc37846f4a04@synaptics.com>
 <Yv7HnHE7bLmgq5D0@pendragon.ideasonboard.com>
 <6da7faf329128312f0862f555d1a855437ae99f3.camel@ndufresne.ca>
 <50dd9b7a-8f48-0799-57f6-048d20de8dcc@synaptics.com>
 <2662ac698898f71f60b9b7e0ad4703854de1d012.camel@ndufresne.ca>
 <1f926989-eb13-14ee-e30d-ac6d01b86c52@synaptics.com>
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
Cc: linux-arm-kernel@lists.infradead.org,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 sebastian.hesselbarth@gmail.com, airlied@linux.ie,
 linux-kernel@vger.kernel.org, ribalda@chromium.org,
 linux-media@vger.kernel.org, Tomasz Figa <tfiga@chromium.org>,
 dri-devel@lists.freedesktop.org, tzimmermann@suse.de,
 sakari.ailus@linux.intel.com, hverkuil-cisco@xs4all.nl, mchehab@kernel.org,
 jszhang@kernel.org, ezequiel@vanguardiasur.com.ar
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Le samedi 20 ao=C3=BBt 2022 =C3=A0 08:10 +0800, Hsia-Jun Li a =C3=A9crit=C2=
=A0:
>=20
> On 8/20/22 03:17, Nicolas Dufresne wrote:
> > CAUTION: Email originated externally, do not click links or open attach=
ments unless you recognize the sender and know the content is safe.
> >=20
> >=20
> > Le vendredi 19 ao=C3=BBt 2022 =C3=A0 23:44 +0800, Hsia-Jun Li a =C3=A9c=
rit :
> > >=20
> > > On 8/19/22 23:28, Nicolas Dufresne wrote:
> > > > CAUTION: Email originated externally, do not click links or open at=
tachments unless you recognize the sender and know the content is safe.
> > > >=20
> > > >=20
> > > > Le vendredi 19 ao=C3=BBt 2022 =C3=A0 02:13 +0300, Laurent Pinchart =
a =C3=A9crit :
> > > > > On Thu, Aug 18, 2022 at 02:33:42PM +0800, Hsia-Jun Li wrote:
> > > > > > On 8/18/22 14:06, Tomasz Figa wrote:
> > > > > > > On Tue, Aug 9, 2022 at 1:28 AM Hsia-Jun Li <randy.li@synaptic=
s.com> wrote:
> > > > > > > >=20
> > > > > > > > From: "Hsia-Jun(Randy) Li" <randy.li@synaptics.com>
> > > > > > > >=20
> > > > > > > > The most of detail has been written in the drm.
> > > > >=20
> > > > > This patch still needs a description of the format, which should =
go to
> > > > > Documentation/userspace-api/media/v4l/.
> > > > >=20
> > > > > > > > Please notice that the tiled formats here request
> > > > > > > > one more plane for storing the motion vector metadata.
> > > > > > > > This buffer won't be compressed, so you can't append
> > > > > > > > it to luma or chroma plane.
> > > > > > >=20
> > > > > > > Does the motion vector buffer need to be exposed to userspace=
? Is the
> > > > > > > decoder stateless (requires userspace to specify the referenc=
e frames)
> > > > > > > or stateful (manages the entire decoding process internally)?
> > > > > >=20
> > > > > > No, users don't need to access them at all. Just they need a di=
fferent
> > > > > > dma-heap.
> > > > > >=20
> > > > > > You would only get the stateful version of both encoder and dec=
oder.
> > > > >=20
> > > > > Shouldn't the motion vectors be stored in a separate V4L2 buffer,
> > > > > submitted through a different queue then ?
> > > >=20
> > > > Imho, I believe these should be invisible to users and pooled separ=
ately to
> > > > reduce the overhead. The number of reference is usually lower then =
the number of
> > > > allocated display buffers.
> > > >=20
> > > You can't. The motion vector buffer can't share with the luma and chr=
oma
> > > data planes, nor the data plane for the compression meta data.
> > >=20
> > > You could consider this as a security requirement(the memory region f=
or
> > > the MV could only be accessed by the decoder) or hardware limitation.
> > >=20
> > > It is also not very easy to manage such a large buffer that would cha=
nge
> > > when the resolution changed.
> >=20
> > Your argument are just aiming toward the fact that you should not let t=
he user
> > allocate these in the first place. They should not be bound to the v4l2=
 buffer.
> > Allocate these in your driver, and leave to your user the pixel buffer =
(and
> > compress meta) allocation work.
> >=20
> What I want to say is that userspace could allocate buffers then make=20
> the v4l2 decoder import these buffers, but each planes should come from=
=20
> the right DMA-heaps. Usually the userspace would know better the memory=
=20
> occupation, it would bring some flexibility here.
>=20
> Currently, they are another thing bothers me, I need to allocate a small=
=20
> piece of memory(less than 128KiB) as the compression metadata buffers as=
=20
> I mentioned here. And these pieces of memory should be located in a=20
> small region, or the performance could be badly hurt, besides, we don't=
=20
> support IOMMU for this kind of data.
>=20
> Any idea about assign a small piece of memory from a pre-allocated=20
> memory or select region(I don't think I could reserve them in a=20
> DMA-heap) for a plane in the MMAP type buffer ?

A V4L2 driver should first implement the V4L2 semantic before adding option=
al
use case like buffer importation. For this reason, your V4L2 driver should =
know
all the memory requirements and how to allocate that memory. Later on, your
importing driver will have to validate that the userland did it right at
importation. This is to follow V4L2 semantic and security model. If you mov=
e
simply trust the userland (gralloc), you are not doing it right.

>=20
> Besides, I am not very satisfied with the dynamic resolution change=20
> steps if I understand it correct. Buffers reallocation should happen=20
> when we receive the event not until the drain is done. A resolution=20
> rising is very common when you are playing a network stream, it would be=
=20
> better that the decoder decided how many buffers it need for the=20
> previous sequence while the userspace could reallocate the reset of=20
> buffers in the CAPTURE queue.
> > Other driver handle this just fine, if your v4l2 driver implement the v=
4l2
> > resolution change mechanism, is should be very simple to manage.

This is a limitation of the queue design of V4L2. While streaming the buffe=
rs
associated with the queue must currently be large enough to support the sel=
ected
format. "large enough" in your case is complex, and validation must be
programmed in your driver.

There was discussion on perhaps extending on CREATE_BUFS feature, that let =
you
allocate at run-time for a different format/resolution (no drivers currentl=
y
allow that). The rules around that aren't specified (and will have to be de=
fined
before a driver starts making use of that). Note that to be usable, a
DELETE_BUF(s) ioctl would probably be needed too.

In current state, If your driver can support it, userland does not strictly=
 need
to re-allocate if the resolution is changed to smaller. In most SVC scenari=
os,
the largest resolution is known in advance, so pre-allocation can happen to=
 the
appropriate resolution and queue size. Re-allocation is then rarely trigger=
ed at
run time. Unlike your system, IOMMU system are not as affected by allocatio=
n
latency and manages to do gapless transition despite this inefficiency.

Note that all this is pure recommendation. What I'm seeing here is a pixel
format documented with Android assumptions rather then mainline, and sent
without the associated implementation. This simply raises some question on =
the
viability of the whole. This is not a critic but just some verification tha=
t
ensure you are following the V4L2 spec.

> >=20
> > > > >=20
> > > > > > > > Signed-off-by: Hsia-Jun(Randy) Li <randy.li@synaptics.com>
> > > > > > > > ---
> > > > > > > >     drivers/media/v4l2-core/v4l2-common.c | 1 +
> > > > > > > >     drivers/media/v4l2-core/v4l2-ioctl.c  | 2 ++
> > > > > > > >     include/uapi/linux/videodev2.h        | 2 ++
> > > > > > > >     3 files changed, 5 insertions(+)
> > > > > > > >=20
> > > > > > > > diff --git a/drivers/media/v4l2-core/v4l2-common.c b/driver=
s/media/v4l2-core/v4l2-common.c
> > > > > > > > index e0fbe6ba4b6c..f645278b3055 100644
> > > > > > > > --- a/drivers/media/v4l2-core/v4l2-common.c
> > > > > > > > +++ b/drivers/media/v4l2-core/v4l2-common.c
> > > > > > > > @@ -314,6 +314,7 @@ const struct v4l2_format_info *v4l2_for=
mat_info(u32 format)
> > > > > > > >                    { .format =3D V4L2_PIX_FMT_SGBRG12,     =
  .pixel_enc =3D V4L2_PIXEL_ENC_BAYER, .mem_planes =3D 1, .comp_planes =3D =
1, .bpp =3D { 2, 0, 0, 0 }, .hdiv =3D 1, .vdiv =3D 1 },
> > > > > > > >                    { .format =3D V4L2_PIX_FMT_SGRBG12,     =
  .pixel_enc =3D V4L2_PIXEL_ENC_BAYER, .mem_planes =3D 1, .comp_planes =3D =
1, .bpp =3D { 2, 0, 0, 0 }, .hdiv =3D 1, .vdiv =3D 1 },
> > > > > > > >                    { .format =3D V4L2_PIX_FMT_SRGGB12,     =
  .pixel_enc =3D V4L2_PIXEL_ENC_BAYER, .mem_planes =3D 1, .comp_planes =3D =
1, .bpp =3D { 2, 0, 0, 0 }, .hdiv =3D 1, .vdiv =3D 1 },
> > > > > > > > +               { .format =3D V4L2_PIX_FMT_NV12M_V4H1C, .pi=
xel_enc =3D V4L2_PIXEL_ENC_YUV, .mem_planes =3D 5, .comp_planes =3D 2, .bpp=
 =3D { 1, 2, 0, 0 }, .hdiv =3D 2, .vdiv =3D 2, .block_w =3D { 128, 128 }, .=
block_h =3D { 128, 128 } },
> > > > > > > >            };
> > > > > > > >            unsigned int i;
> > > > > > > >=20
> > > > > > > > diff --git a/drivers/media/v4l2-core/v4l2-ioctl.c b/drivers=
/media/v4l2-core/v4l2-ioctl.c
> > > > > > > > index e6fd355a2e92..8f65964aff08 100644
> > > > > > > > --- a/drivers/media/v4l2-core/v4l2-ioctl.c
> > > > > > > > +++ b/drivers/media/v4l2-core/v4l2-ioctl.c
> > > > > > > > @@ -1497,6 +1497,8 @@ static void v4l_fill_fmtdesc(struct v=
4l2_fmtdesc *fmt)
> > > > > > > >                    case V4L2_PIX_FMT_MT21C:        descr =
=3D "Mediatek Compressed Format"; break;
> > > > > > > >                    case V4L2_PIX_FMT_QC08C:        descr =
=3D "QCOM Compressed 8-bit Format"; break;
> > > > > > > >                    case V4L2_PIX_FMT_QC10C:        descr =
=3D "QCOM Compressed 10-bit Format"; break;
> > > > > > > > +               case V4L2_PIX_FMT_NV12M_V4H1C:  descr =3D "=
Synaptics Compressed 8-bit tiled Format";break;
> > > > > > > > +               case V4L2_PIX_FMT_NV12M_10_V4H3P8C:     des=
cr =3D "Synaptics Compressed 10-bit tiled Format";break;
> > > > > > > >                    default:
> > > > > > > >                            if (fmt->description[0])
> > > > > > > >                                    return;
> > > > > > > > diff --git a/include/uapi/linux/videodev2.h b/include/uapi/=
linux/videodev2.h
> > > > > > > > index 01e630f2ec78..7e928cb69e7c 100644
> > > > > > > > --- a/include/uapi/linux/videodev2.h
> > > > > > > > +++ b/include/uapi/linux/videodev2.h
> > > > > > > > @@ -661,6 +661,8 @@ struct v4l2_pix_format {
> > > > > > > >     #define V4L2_PIX_FMT_NV12MT_16X16 v4l2_fourcc('V', 'M',=
 '1', '2') /* 12  Y/CbCr 4:2:0 16x16 tiles */
> > > > > > > >     #define V4L2_PIX_FMT_NV12M_8L128      v4l2_fourcc('N', =
'A', '1', '2') /* Y/CbCr 4:2:0 8x128 tiles */
> > > > > > > >     #define V4L2_PIX_FMT_NV12M_10BE_8L128 v4l2_fourcc_be('N=
', 'T', '1', '2') /* Y/CbCr 4:2:0 10-bit 8x128 tiles */
> > > > > > > > +#define V4L2_PIX_FMT_NV12M_V4H1C v4l2_fourcc('S', 'Y', '1'=
, '2')   /* 12  Y/CbCr 4:2:0 tiles */
> > > > > > > > +#define V4L2_PIX_FMT_NV12M_10_V4H3P8C v4l2_fourcc('S', 'Y'=
, '1', '0')   /* 12  Y/CbCr 4:2:0 10-bits tiles */
> > > > > > > >=20
> > > > > > > >     /* Bayer formats - see https://urldefense.proofpoint.co=
m/v2/url?u=3Dhttp-3A__www.siliconimaging.com_RGB-2520Bayer.htm&d=3DDwIFaQ&c=
=3D7dfBJ8cXbWjhc0BhImu8wVIoUFmBzj1s88r8EGyM0UY&r=3DP4xb2_7biqBxD4LGGPrSV6j-=
jf3C3xlR7PXU-mLTeZE&m=3DlkQiuhx0yMAYHGcW-0WaHlF3e2etMHsu-FoNIBdZILGH6FPigwS=
Amel2vAdcVLkp&s=3DJKsBzpb_3u9xv52MaMuT4U3T1pPqcObYkpHDBxvcx_4&e=3D   */
> > > > > > > >     #define V4L2_PIX_FMT_SBGGR8  v4l2_fourcc('B', 'A', '8',=
 '1') /*  8  BGBG.. GRGR.. */
> > > > >=20
> > > >=20
> > >=20
> >=20
>=20

