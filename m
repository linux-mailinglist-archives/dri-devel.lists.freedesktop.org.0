Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3016859E4CC
	for <lists+dri-devel@lfdr.de>; Tue, 23 Aug 2022 16:03:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2637B113F92;
	Tue, 23 Aug 2022 14:03:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-x72a.google.com (mail-qk1-x72a.google.com
 [IPv6:2607:f8b0:4864:20::72a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4458911A6A9
 for <dri-devel@lists.freedesktop.org>; Tue, 23 Aug 2022 14:03:01 +0000 (UTC)
Received: by mail-qk1-x72a.google.com with SMTP id j6so10299059qkl.10
 for <dri-devel@lists.freedesktop.org>; Tue, 23 Aug 2022 07:03:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ndufresne-ca.20210112.gappssmtp.com; s=20210112;
 h=mime-version:user-agent:content-transfer-encoding:references
 :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc;
 bh=jRUo4nl7tl9pX47F0x5YruOzEMD0aHc+/88gLpdPWL4=;
 b=leOysB+a8HZAzxP/lrGQlEYkhNxjhg7t+/UPTG6diBlyEZtJnd2ERRcDrWAJiKT9U7
 uADiyLQ/Ngkso8IID4jMTfHsa1qsaY+JQWxnwTruqQQ+AKPBP+kzBn3vbpJcPd9BDPp0
 Unw3zRkg8OVzycw2n395EFRtxBJwVaq4R/MqyziKLqsKuOjmj+sFs4KYO/d8i80QPd84
 Q0YPUdJlk+Wuo3CECaGE946LXyjAooEKFm79fA1EU/7t+dAUMZItdABOtTvBXqyWFMBe
 KTNa3w8T7xNMJqB7/NWnKikC2n2wOfWIgPZ4BucEH0jJXekxPbgrKh2yDJGyPiH50Dhz
 T1xQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=mime-version:user-agent:content-transfer-encoding:references
 :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
 :from:to:cc;
 bh=jRUo4nl7tl9pX47F0x5YruOzEMD0aHc+/88gLpdPWL4=;
 b=BlIb5+XkFnygL5nr9WiJvDGl5BnzfdUuA1t7fAt/Dn9i9vN2sIvdl7SeEY+AOInYog
 9o2bmVpprBiXMlKks6OUrdQOptvxeeLOdnhjo/j8jiNRyQMRUzhimbGdGh+8wULPvu5e
 RZzDLq5lwsUGa+Z9ICaIo1QRSzMwRqrudhlbtaEzfYJKY2uqpy64l8U5vCD8VMkEYFm5
 XQtynHOs9dk7smZCuVrwlGO4CUaAEWvneX3c2MiKo2U82tlxnJVIczLUuyGHvtuWL5ir
 nTCiWZsnwf/KYnnv2zpF7Ulb1x6ybvwq2VbuDg7Sk369ho2oUp+xCG/ja2M6p83MG92m
 9mCg==
X-Gm-Message-State: ACgBeo0VbaYCBOxuw+8p4THtdyjF1syrbVuCTJeKrq7ZmoqoF6pjPBM4
 1kGogcgynZFNd7XzxWWfHTf9KQ==
X-Google-Smtp-Source: AA6agR6JBR72DNDprfjZIDyUHp02fG8tIe23csyc/MtqqQDlh2d5tIZX08F5roiqaMtSOqs7dJl1UQ==
X-Received: by 2002:a37:444f:0:b0:6bb:186e:345e with SMTP id
 r76-20020a37444f000000b006bb186e345emr16046030qka.105.1661263380235; 
 Tue, 23 Aug 2022 07:03:00 -0700 (PDT)
Received: from nicolas-tpx395.localdomain (192-222-136-102.qc.cable.ebox.net.
 [192.222.136.102]) by smtp.gmail.com with ESMTPSA id
 a18-20020ac844b2000000b0031ef69c9024sm10560431qto.91.2022.08.23.07.02.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 23 Aug 2022 07:02:57 -0700 (PDT)
Message-ID: <2d68e435dfb6cd0655293f09f1c5ec3032f42dc6.camel@ndufresne.ca>
Subject: Re: [PATCH 2/2] [WIP]: media: Add Synaptics compressed tiled format
From: Nicolas Dufresne <nicolas@ndufresne.ca>
To: Hsia-Jun Li <Randy.Li@synaptics.com>, Tomasz Figa <tfiga@chromium.org>
Date: Tue, 23 Aug 2022 10:02:56 -0400
In-Reply-To: <93ebc96e-5750-bb6b-c97e-a178c8d49952@synaptics.com>
References: <20220808162750.828001-1-randy.li@synaptics.com>
 <20220808162750.828001-3-randy.li@synaptics.com>
 <CAAFQd5AKjpJ+fPAeCqdNnJbS4R7SdaHkfyW4qG1xXr-sE801pQ@mail.gmail.com>
 <13d37c15-79f3-4e16-8cf4-fc37846f4a04@synaptics.com>
 <Yv7HnHE7bLmgq5D0@pendragon.ideasonboard.com>
 <6da7faf329128312f0862f555d1a855437ae99f3.camel@ndufresne.ca>
 <50dd9b7a-8f48-0799-57f6-048d20de8dcc@synaptics.com>
 <CAAFQd5D-eG-1cHvRX2nF0nKv6Zz3vVq6_KJ7HV0zZjADV9v1Zg@mail.gmail.com>
 <93ebc96e-5750-bb6b-c97e-a178c8d49952@synaptics.com>
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
 linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
 sakari.ailus@linux.intel.com, dri-devel@lists.freedesktop.org,
 tzimmermann@suse.de, ribalda@chromium.org, hverkuil-cisco@xs4all.nl,
 mchehab@kernel.org, jszhang@kernel.org, ezequiel@vanguardiasur.com.ar
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Le mardi 23 ao=C3=BBt 2022 =C3=A0 15:03 +0800, Hsia-Jun Li a =C3=A9crit=C2=
=A0:
>=20
> On 8/23/22 14:05, Tomasz Figa wrote:
> > CAUTION: Email originated externally, do not click links or open attach=
ments unless you recognize the sender and know the content is safe.
> >=20
> >=20
> > On Sat, Aug 20, 2022 at 12:44 AM Hsia-Jun Li <Randy.Li@synaptics.com> w=
rote:
> > >=20
> > >=20
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
> >=20
> > I believe what Nicolas is suggesting is to just keep the MV buffer
> > handling completely separate from video buffers. Just keep a map
> > between frame buffer and MV buffer in the driver and use the right
> > buffer when triggering a decode.
> >=20
> > >=20
> > > You could consider this as a security requirement(the memory region f=
or
> > > the MV could only be accessed by the decoder) or hardware limitation.
> > >=20
> > > It is also not very easy to manage such a large buffer that would cha=
nge
> > > when the resolution changed.
> >=20
> > How does it differ from managing additional planes of video buffers?
> I should say I am not against his suggestion if I could make a DMA-heap=
=20
> v4l2 allocator merge into kernel in the future. Although I think we need=
=20
> two heaps here one for the normal video and one for the secure video, I=
=20
> don't have much idea on how to determine whether we are decoding a=20
> secure or non-secure video here (The design here is that the kernel=20
> didn't know, only hardware and TEE care about that).

Its always nice when "the design" get discussed upstream, so we can raise a=
ny
known issues and improve it. Here, not knowing if we are handling secure or=
 non-
secure memory in kernel driver would indeed require external allocation for
everything, and V4L2 does not currently work like this. There is a few use =
cases
(not all of them might apply to your driver, but they exists).

1. Secondary buffers

When a CODEC is combined with a post-processor, the driver is then responsi=
ble
for reference frame allocation. In both known secure memory approach (NXP s=
ecure
bit and secondary mmu), the driver must know, as it won't be allowed produc=
e any
non-secure buffer while secure (and vis-versa). It would be very difficult =
to
make secondary buffers externally allocated, since the fact secondary buffe=
rs
are used is no known by userspace. You slightly mention about adding a new =
queue
type, this seems like an option, though one will have to figure-out how to =
make
this work in a backward compatible manner.

2. Internally managed feedback buffers

Existing case of feedback buffers is VP9 decoders. I initially thought that
would only be a challenge for stateless decoders, but it turns out that Aml=
ogic
stateful drivers also needs to take care. In VP9, the bitstream is further
compressed using probability obtained through decoding. Those probability c=
an be
further tuned with updates placed in the compressed header. In Amlogic and
existing VP9 stateless decoder, the merging of the feedback and compressed
header updates is done using the CPU, hence that feedback buffer cannot be
secure. With lets say NXP secure domain HW, this is impossible. The OPT-TEE
needs to be involved to abstract the programming of the HW and copy back th=
e
secure buffers to non-secure, making sure it is not being tricked into
delivering a copy of the wrong data. For the MMU approach, no copy is neede=
d,
but to be sure the memory being mapped into the Linux Kernel MMU is the rig=
ht
one, some level of abstraction of the CODEC is needed.

In short, you need a mix of secure and non-secure memory. This is a huge
challenge that isn't well covered by any secure memory design at the moment=
, its
not even clear if the HW can work. Remember that these feedback buffers are=
 not
exposed to userspace, hence cannot be allocated there. Recent discussion sh=
ows
that NXP might be just giving up on their stateless codec so they can solve=
 this
with a full codec abstraction (stateful codec).

Feedback buffers also exist in stateless encoders, but we don't have yet
existing drivers for that. Encoders also have to deal with secure memory,
notably when encoding from HDCP enabled HDMI receivers. Though this task is
quite likely limited to dedicated system, which can be considered secure as=
 a
whole, time will define this.

>=20
> Just one place that I think it would be more simple for me to manage the=
=20
> buffer here. When the decoder goes to the drain stage, then the MV=20
> buffer goes when the data buffer goes and create when the data buffer=20
> creates.
> I know that is not a lot of work to doing the mapping between them. I=20
> just need to convince the other accepting that do not allocator the MV=
=20
> buffer outside.

Its also a big memory saver if you manage to convince them.

> >=20
> > Best regards,
> > Tomasz
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
> > > --
> > > Hsia-Jun(Randy) Li
>=20

