Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 549A259D108
	for <lists+dri-devel@lfdr.de>; Tue, 23 Aug 2022 08:11:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CA25BAEC9C;
	Tue, 23 Aug 2022 06:11:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oa1-x35.google.com (mail-oa1-x35.google.com
 [IPv6:2001:4860:4864:20::35])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 337A3AEC8D
 for <dri-devel@lists.freedesktop.org>; Tue, 23 Aug 2022 06:11:35 +0000 (UTC)
Received: by mail-oa1-x35.google.com with SMTP id
 586e51a60fabf-11d08d7ece2so8939684fac.0
 for <dri-devel@lists.freedesktop.org>; Mon, 22 Aug 2022 23:11:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc;
 bh=43IBXBukEMZBKHMY65bP6l6zHy53lFBv8pp6iM6iFtQ=;
 b=WJ1Qj/Jv832SskSyFIV8J8wTY+IaV31ImleU35pKbc1aVg2IjbYQZIC61Ug4eR2TGw
 OYinxYvz34GsRtgC/CpH6nRTWaZmV40L6zRMlg9z0vs7JBdJpf0xGe/XySsxPjq6jW8k
 m8JvpHbdzR3PDzK/iENMv48OlTAGCK1+MScEI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc;
 bh=43IBXBukEMZBKHMY65bP6l6zHy53lFBv8pp6iM6iFtQ=;
 b=jEhySBuhCdKnJOPsCDKNQvQKBBDPU9Na0M2BkSWhtx11L2MAiks0Nn1+AfMijeNvoo
 VnqAI87TnsSo3oB0JuhmD5Dh3rRWfV6iAwol6lENoU1ACgRZSKFUezfb3LPCAhosYpi5
 xPvTV0an5UfqBoFPdcMU4COyG27XDYo9AGzkbtbhOOpb1PgOpSj1s2OX3j6q02tO5QXc
 O2jyGg46Q3PDIykYOJ75Ml3tr3C1nMRpByQyOWXZIoOgez7r80NC8TcSiB1nUyQB3Kwx
 f28ODW6gfV0rUjnyRhQaGSqKLJ+1eqf7ezpsDm68TSi42qqU9bjCjATJYI/WFSv7fWl0
 Ctfw==
X-Gm-Message-State: ACgBeo07AGpi98mFM6p6pO5dwbD9UK66ORyz1BJogZ08P2oF2SssaL91
 jsgioGgyOTy9wsTfNOy4A2/4ABVMq3pY3Ojt
X-Google-Smtp-Source: AA6agR4bauQQuiJQy0furZ04RdQU6Y+nE4rKdtZh5fE5jUe8srcrKqkOeXl1JKgY8Nz7Ypm7OdpbrA==
X-Received: by 2002:a05:6870:a689:b0:10c:289b:78df with SMTP id
 i9-20020a056870a68900b0010c289b78dfmr774874oam.25.1661235094293; 
 Mon, 22 Aug 2022 23:11:34 -0700 (PDT)
Received: from mail-oo1-f43.google.com (mail-oo1-f43.google.com.
 [209.85.161.43]) by smtp.gmail.com with ESMTPSA id
 l13-20020a056820030d00b0044893e6a2a4sm2952746ooe.11.2022.08.22.23.11.33
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 22 Aug 2022 23:11:34 -0700 (PDT)
Received: by mail-oo1-f43.google.com with SMTP id
 n11-20020a4aa7cb000000b0044b3583d373so233454oom.2
 for <dri-devel@lists.freedesktop.org>; Mon, 22 Aug 2022 23:11:33 -0700 (PDT)
X-Received: by 2002:a81:1117:0:b0:336:45a1:221b with SMTP id
 23-20020a811117000000b0033645a1221bmr25033845ywr.229.1661234716981; Mon, 22
 Aug 2022 23:05:16 -0700 (PDT)
MIME-Version: 1.0
References: <20220808162750.828001-1-randy.li@synaptics.com>
 <20220808162750.828001-3-randy.li@synaptics.com>
 <CAAFQd5AKjpJ+fPAeCqdNnJbS4R7SdaHkfyW4qG1xXr-sE801pQ@mail.gmail.com>
 <13d37c15-79f3-4e16-8cf4-fc37846f4a04@synaptics.com>
 <Yv7HnHE7bLmgq5D0@pendragon.ideasonboard.com>
 <6da7faf329128312f0862f555d1a855437ae99f3.camel@ndufresne.ca>
 <50dd9b7a-8f48-0799-57f6-048d20de8dcc@synaptics.com>
In-Reply-To: <50dd9b7a-8f48-0799-57f6-048d20de8dcc@synaptics.com>
From: Tomasz Figa <tfiga@chromium.org>
Date: Tue, 23 Aug 2022 15:05:05 +0900
X-Gmail-Original-Message-ID: <CAAFQd5D-eG-1cHvRX2nF0nKv6Zz3vVq6_KJ7HV0zZjADV9v1Zg@mail.gmail.com>
Message-ID: <CAAFQd5D-eG-1cHvRX2nF0nKv6Zz3vVq6_KJ7HV0zZjADV9v1Zg@mail.gmail.com>
Subject: Re: [PATCH 2/2] [WIP]: media: Add Synaptics compressed tiled format
To: Hsia-Jun Li <Randy.Li@synaptics.com>
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
Cc: linux-arm-kernel@lists.infradead.org,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 sebastian.hesselbarth@gmail.com, airlied@linux.ie,
 linux-kernel@vger.kernel.org, ribalda@chromium.org,
 linux-media@vger.kernel.org, Nicolas Dufresne <nicolas@ndufresne.ca>,
 dri-devel@lists.freedesktop.org, tzimmermann@suse.de,
 sakari.ailus@linux.intel.com, hverkuil-cisco@xs4all.nl, mchehab@kernel.org,
 jszhang@kernel.org, ezequiel@vanguardiasur.com.ar
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sat, Aug 20, 2022 at 12:44 AM Hsia-Jun Li <Randy.Li@synaptics.com> wrote=
:
>
>
>
> On 8/19/22 23:28, Nicolas Dufresne wrote:
> > CAUTION: Email originated externally, do not click links or open attach=
ments unless you recognize the sender and know the content is safe.
> >
> >
> > Le vendredi 19 ao=C3=BBt 2022 =C3=A0 02:13 +0300, Laurent Pinchart a =
=C3=A9crit :
> >> On Thu, Aug 18, 2022 at 02:33:42PM +0800, Hsia-Jun Li wrote:
> >>> On 8/18/22 14:06, Tomasz Figa wrote:
> >>>> On Tue, Aug 9, 2022 at 1:28 AM Hsia-Jun Li <randy.li@synaptics.com> =
wrote:
> >>>>>
> >>>>> From: "Hsia-Jun(Randy) Li" <randy.li@synaptics.com>
> >>>>>
> >>>>> The most of detail has been written in the drm.
> >>
> >> This patch still needs a description of the format, which should go to
> >> Documentation/userspace-api/media/v4l/.
> >>
> >>>>> Please notice that the tiled formats here request
> >>>>> one more plane for storing the motion vector metadata.
> >>>>> This buffer won't be compressed, so you can't append
> >>>>> it to luma or chroma plane.
> >>>>
> >>>> Does the motion vector buffer need to be exposed to userspace? Is th=
e
> >>>> decoder stateless (requires userspace to specify the reference frame=
s)
> >>>> or stateful (manages the entire decoding process internally)?
> >>>
> >>> No, users don't need to access them at all. Just they need a differen=
t
> >>> dma-heap.
> >>>
> >>> You would only get the stateful version of both encoder and decoder.
> >>
> >> Shouldn't the motion vectors be stored in a separate V4L2 buffer,
> >> submitted through a different queue then ?
> >
> > Imho, I believe these should be invisible to users and pooled separatel=
y to
> > reduce the overhead. The number of reference is usually lower then the =
number of
> > allocated display buffers.
> >
> You can't. The motion vector buffer can't share with the luma and chroma
> data planes, nor the data plane for the compression meta data.

I believe what Nicolas is suggesting is to just keep the MV buffer
handling completely separate from video buffers. Just keep a map
between frame buffer and MV buffer in the driver and use the right
buffer when triggering a decode.

>
> You could consider this as a security requirement(the memory region for
> the MV could only be accessed by the decoder) or hardware limitation.
>
> It is also not very easy to manage such a large buffer that would change
> when the resolution changed.

How does it differ from managing additional planes of video buffers?

Best regards,
Tomasz

> >>
> >>>>> Signed-off-by: Hsia-Jun(Randy) Li <randy.li@synaptics.com>
> >>>>> ---
> >>>>>    drivers/media/v4l2-core/v4l2-common.c | 1 +
> >>>>>    drivers/media/v4l2-core/v4l2-ioctl.c  | 2 ++
> >>>>>    include/uapi/linux/videodev2.h        | 2 ++
> >>>>>    3 files changed, 5 insertions(+)
> >>>>>
> >>>>> diff --git a/drivers/media/v4l2-core/v4l2-common.c b/drivers/media/=
v4l2-core/v4l2-common.c
> >>>>> index e0fbe6ba4b6c..f645278b3055 100644
> >>>>> --- a/drivers/media/v4l2-core/v4l2-common.c
> >>>>> +++ b/drivers/media/v4l2-core/v4l2-common.c
> >>>>> @@ -314,6 +314,7 @@ const struct v4l2_format_info *v4l2_format_info=
(u32 format)
> >>>>>                   { .format =3D V4L2_PIX_FMT_SGBRG12,       .pixel_=
enc =3D V4L2_PIXEL_ENC_BAYER, .mem_planes =3D 1, .comp_planes =3D 1, .bpp =
=3D { 2, 0, 0, 0 }, .hdiv =3D 1, .vdiv =3D 1 },
> >>>>>                   { .format =3D V4L2_PIX_FMT_SGRBG12,       .pixel_=
enc =3D V4L2_PIXEL_ENC_BAYER, .mem_planes =3D 1, .comp_planes =3D 1, .bpp =
=3D { 2, 0, 0, 0 }, .hdiv =3D 1, .vdiv =3D 1 },
> >>>>>                   { .format =3D V4L2_PIX_FMT_SRGGB12,       .pixel_=
enc =3D V4L2_PIXEL_ENC_BAYER, .mem_planes =3D 1, .comp_planes =3D 1, .bpp =
=3D { 2, 0, 0, 0 }, .hdiv =3D 1, .vdiv =3D 1 },
> >>>>> +               { .format =3D V4L2_PIX_FMT_NV12M_V4H1C, .pixel_enc =
=3D V4L2_PIXEL_ENC_YUV, .mem_planes =3D 5, .comp_planes =3D 2, .bpp =3D { 1=
, 2, 0, 0 }, .hdiv =3D 2, .vdiv =3D 2, .block_w =3D { 128, 128 }, .block_h =
=3D { 128, 128 } },
> >>>>>           };
> >>>>>           unsigned int i;
> >>>>>
> >>>>> diff --git a/drivers/media/v4l2-core/v4l2-ioctl.c b/drivers/media/v=
4l2-core/v4l2-ioctl.c
> >>>>> index e6fd355a2e92..8f65964aff08 100644
> >>>>> --- a/drivers/media/v4l2-core/v4l2-ioctl.c
> >>>>> +++ b/drivers/media/v4l2-core/v4l2-ioctl.c
> >>>>> @@ -1497,6 +1497,8 @@ static void v4l_fill_fmtdesc(struct v4l2_fmtd=
esc *fmt)
> >>>>>                   case V4L2_PIX_FMT_MT21C:        descr =3D "Mediat=
ek Compressed Format"; break;
> >>>>>                   case V4L2_PIX_FMT_QC08C:        descr =3D "QCOM C=
ompressed 8-bit Format"; break;
> >>>>>                   case V4L2_PIX_FMT_QC10C:        descr =3D "QCOM C=
ompressed 10-bit Format"; break;
> >>>>> +               case V4L2_PIX_FMT_NV12M_V4H1C:  descr =3D "Synaptic=
s Compressed 8-bit tiled Format";break;
> >>>>> +               case V4L2_PIX_FMT_NV12M_10_V4H3P8C:     descr =3D "=
Synaptics Compressed 10-bit tiled Format";break;
> >>>>>                   default:
> >>>>>                           if (fmt->description[0])
> >>>>>                                   return;
> >>>>> diff --git a/include/uapi/linux/videodev2.h b/include/uapi/linux/vi=
deodev2.h
> >>>>> index 01e630f2ec78..7e928cb69e7c 100644
> >>>>> --- a/include/uapi/linux/videodev2.h
> >>>>> +++ b/include/uapi/linux/videodev2.h
> >>>>> @@ -661,6 +661,8 @@ struct v4l2_pix_format {
> >>>>>    #define V4L2_PIX_FMT_NV12MT_16X16 v4l2_fourcc('V', 'M', '1', '2'=
) /* 12  Y/CbCr 4:2:0 16x16 tiles */
> >>>>>    #define V4L2_PIX_FMT_NV12M_8L128      v4l2_fourcc('N', 'A', '1',=
 '2') /* Y/CbCr 4:2:0 8x128 tiles */
> >>>>>    #define V4L2_PIX_FMT_NV12M_10BE_8L128 v4l2_fourcc_be('N', 'T', '=
1', '2') /* Y/CbCr 4:2:0 10-bit 8x128 tiles */
> >>>>> +#define V4L2_PIX_FMT_NV12M_V4H1C v4l2_fourcc('S', 'Y', '1', '2')  =
 /* 12  Y/CbCr 4:2:0 tiles */
> >>>>> +#define V4L2_PIX_FMT_NV12M_10_V4H3P8C v4l2_fourcc('S', 'Y', '1', '=
0')   /* 12  Y/CbCr 4:2:0 10-bits tiles */
> >>>>>
> >>>>>    /* Bayer formats - see https://urldefense.proofpoint.com/v2/url?=
u=3Dhttp-3A__www.siliconimaging.com_RGB-2520Bayer.htm&d=3DDwIFaQ&c=3D7dfBJ8=
cXbWjhc0BhImu8wVIoUFmBzj1s88r8EGyM0UY&r=3DP4xb2_7biqBxD4LGGPrSV6j-jf3C3xlR7=
PXU-mLTeZE&m=3DlkQiuhx0yMAYHGcW-0WaHlF3e2etMHsu-FoNIBdZILGH6FPigwSAmel2vAdc=
VLkp&s=3DJKsBzpb_3u9xv52MaMuT4U3T1pPqcObYkpHDBxvcx_4&e=3D   */
> >>>>>    #define V4L2_PIX_FMT_SBGGR8  v4l2_fourcc('B', 'A', '8', '1') /* =
 8  BGBG.. GRGR.. */
> >>
> >
>
> --
> Hsia-Jun(Randy) Li
