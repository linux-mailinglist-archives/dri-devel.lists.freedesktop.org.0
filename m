Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 27BF4788629
	for <lists+dri-devel@lfdr.de>; Fri, 25 Aug 2023 13:41:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1F6BC10E659;
	Fri, 25 Aug 2023 11:41:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x12c.google.com (mail-lf1-x12c.google.com
 [IPv6:2a00:1450:4864:20::12c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4562510E659
 for <dri-devel@lists.freedesktop.org>; Fri, 25 Aug 2023 11:41:26 +0000 (UTC)
Received: by mail-lf1-x12c.google.com with SMTP id
 2adb3069b0e04-5007c8308c3so1268545e87.0
 for <dri-devel@lists.freedesktop.org>; Fri, 25 Aug 2023 04:41:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1692963684; x=1693568484;
 h=mime-version:references:in-reply-to:message-id:subject:cc:to:from
 :date:from:to:cc:subject:date:message-id:reply-to;
 bh=7XB8gnfeXwz3PBP03jcAxDaUlg2aSuMcd4cXYoa7Jfk=;
 b=l3dZTosl7Hz9yo3uNyJ027jBuQwNpn0tO07C3kMRvb3/ali/t2h/STlmvOWPZo1AcK
 Man4yRSr/uFPCpRgEeU0oiaZC3h07S6tgb0mWNSTwh64YH8vgpOT7r56TfrTxjDO8LTL
 chQAjdC0bsG5BFxHD4lTiKupBryWo8HJd6ayTu7fHX4feT/qjQcPtxVKxnkTCUGPODe/
 VQq/BVKZVSjHMHV7ePch7Je1mrieoy0jjWqQNz+F9t6aL7sbvhak4VP+D9IoMMOZoFvA
 NeQP+QwUCImDD+Xl2iSaR97g8TdOS+UUE+2HITfg2lrBbScs4rYLaLNQTCewIHe7HVvl
 F5Iw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1692963684; x=1693568484;
 h=mime-version:references:in-reply-to:message-id:subject:cc:to:from
 :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=7XB8gnfeXwz3PBP03jcAxDaUlg2aSuMcd4cXYoa7Jfk=;
 b=cKpoB1gAW2XLIP5zEs5l+cSCnAVuI1DYex4s1ZRH24HLwPzHnzLFFMiB8Tc5j6eYCl
 wwLzLA/n7/YO8LHWgatfpkcHa4XnbkdMpBPbUvpW14gs9GNVYpWzNBBhosyuB6uq3nVH
 Cq6EhPqKLYY+/a9ooUhYWl6OhgDpIS7bDHYuzbdcF3NZquOFrTqAjhM9RHQFtIB75ol9
 5A/3ljJPcIFDhija1gQY21G0f4LQhMQVNbB8ndfFESN8Co3Jx54RG7GV2ylT8Ua6Gbzx
 3rFJe7+e7fPCRJnAUrymRSuNrrhdNsz8Ftbr1+61EJvvH92WdUuNHWbY7iRLl02x0iHH
 zcqw==
X-Gm-Message-State: AOJu0Yz+YXxCruhsPyqMAJ85Wri1YyXG+Pd03PSTnXpoZMNuJye3ErvN
 DsVcTlRW4Lvv2uObeFO8HyI=
X-Google-Smtp-Source: AGHT+IHDgb5Yhbcq9kfuhmnzC36PS1dJtyuRMhZs4ZKUIbWW5GhJVTYMYUihVW8mlau0avuqzWNPNw==
X-Received: by 2002:a05:6512:ba0:b0:500:882b:e55a with SMTP id
 b32-20020a0565120ba000b00500882be55amr11342373lfv.45.1692963683929; 
 Fri, 25 Aug 2023 04:41:23 -0700 (PDT)
Received: from eldfell ([194.136.85.206]) by smtp.gmail.com with ESMTPSA id
 v9-20020a197409000000b004ff91dde4b4sm257584lfe.93.2023.08.25.04.41.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 25 Aug 2023 04:41:23 -0700 (PDT)
Date: Fri, 25 Aug 2023 14:41:10 +0300
From: Pekka Paalanen <ppaalanen@gmail.com>
To: Hsia-Jun Li <Randy.Li@synaptics.com>
Subject: Re: [RFC]: shmem fd for non-DMA buffer sharing cross drivers
Message-ID: <20230825144110.1c58928f@eldfell>
In-Reply-To: <65432c20-a6fd-141c-2ced-a7e6599a1e7c@synaptics.com>
References: <029b982f-da62-4fa8-66c4-ab11a515574a@synaptics.com>
 <CAAFQd5CqAvr7ZUdDSYPEOWSgvbttTBjHa0YWDomxJJSaiZxGog@mail.gmail.com>
 <f8a168e8-1a23-c6b3-0f68-baa73396d594@synaptics.com>
 <20230825104052.4573ab7b@eldfell>
 <65432c20-a6fd-141c-2ced-a7e6599a1e7c@synaptics.com>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.37; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/=7wEatCdcP1mozuK9z20Vy1";
 protocol="application/pgp-signature"; micalg=pgp-sha256
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
Cc: daniels@collabora.com, ayaka <ayaka@soulik.info>, hughd@google.com,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Tomasz Figa <tfiga@chromium.org>, linux-mm@kvack.org,
 Hans Verkuil <hverkuil-cisco@xs4all.nl>, akpm@linux-foundation.org,
 Nicolas Dufresne <nicolas@ndufresne.ca>,
 Linux Media Mailing List <linux-media@vger.kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--Sig_/=7wEatCdcP1mozuK9z20Vy1
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Fri, 25 Aug 2023 15:56:18 +0800
Hsia-Jun Li <Randy.Li@synaptics.com> wrote:

> On 8/25/23 15:40, Pekka Paalanen wrote:
> > Subject:
> > Re: [RFC]: shmem fd for non-DMA buffer sharing cross drivers
> > From:
> > Pekka Paalanen <ppaalanen@gmail.com>
> > Date:
> > 8/25/23, 15:40
> >=20
> > To:
> > Hsia-Jun Li <Randy.Li@synaptics.com>
> > CC:
> > Tomasz Figa <tfiga@chromium.org>, linux-mm@kvack.org,=20
> > dri-devel@lists.freedesktop.org, Linux Media Mailing List=20
> > <linux-media@vger.kernel.org>, hughd@google.com,=20
> > akpm@linux-foundation.org, Simon Ser <contact@emersion.fr>, Hans Verkui=
l=20
> > <hverkuil-cisco@xs4all.nl>, daniels@collabora.com, ayaka=20
> > <ayaka@soulik.info>, linux-kernel@vger.kernel.org, Nicolas Dufresne=20
> > <nicolas@ndufresne.ca>
> >=20
> >=20
> > On Wed, 23 Aug 2023 15:11:23 +0800
> > Hsia-Jun Li<Randy.Li@synaptics.com>  wrote:
> >  =20
> >> On 8/23/23 12:46, Tomasz Figa wrote: =20
> >>> CAUTION: Email originated externally, do not click links or open atta=
chments unless you recognize the sender and know the content is safe.
> >>>
> >>>
> >>> Hi Hsia-Jun,
> >>>
> >>> On Tue, Aug 22, 2023 at 8:14=E2=80=AFPM Hsia-Jun Li<Randy.Li@synaptic=
s.com>  wrote: =20
> >>>> Hello
> >>>>
> >>>> I would like to introduce a usage of SHMEM slimier to DMA-buf, the m=
ajor
> >>>> purpose of that is sharing metadata or just a pure container for cro=
ss
> >>>> drivers.
> >>>>
> >>>> We need to exchange some sort of metadata between drivers, likes dyn=
amic
> >>>> HDR data between video4linux2 and DRM. =20
> >>> If the metadata isn't too big, would it be enough to just have the
> >>> kernel copy_from_user() to a kernel buffer in the ioctl code?
> >>>     =20
> >>>> Or the graphics frame buffer is
> >>>> too complex to be described with plain plane's DMA-buf fd.
> >>>> An issue between DRM and V4L2 is that DRM could only support 4 planes
> >>>> while it is 8 for V4L2. It would be pretty hard for DRM to expend its
> >>>> interface to support that 4 more planes which would lead to revision=
 of
> >>>> many standard likes Vulkan, EGL. =20
> >>> Could you explain how a shmem buffer could be used to support frame
> >>> buffers with more than 4 planes?
> >>> If you are asking why we need this: =20
> >> 1. metadata likes dynamic HDR tone data
> >> 2. DRM also challenges with this problem, let me quote what sima said:
> >> "another trick that we iirc used for afbc is that sometimes the planes
> >> have a fixed layout
> >> like nv12
> >> and so logically it's multiple planes, but you only need one plane slot
> >> to describe the buffer
> >> since I think afbc had the "we need more than 4 planes" issue too"
> >>
> >> Unfortunately, there are vendor pixel formats are not fixed layout.
> >>
> >> 3. Secure(REE, trusted video piepline) info.
> >>
> >> For how to assign such metadata data.
> >> In case with a drm fb_id, it is simple, we just add a drm plane proper=
ty
> >> for it. The V4L2 interface is not flexible, we could only leave into
> >> CAPTURE request_fd as a control. =20
> >>>> Also, there is no reason to consume a device's memory for the content
> >>>> that device can't read it, or wasting an entry of IOMMU for such dat=
a. =20
> >>> That's right, but DMA-buf doesn't really imply any of those. DMA-buf
> >>> is just a kernel object with some backing memory. It's up to the
> >>> allocator to decide how the backing memory is allocated and up to the
> >>> importer on whether it would be mapped into an IOMMU.
> >>>     =20
> >> I just want to say it can't be allocated at the same place which was f=
or
> >> those DMA bufs(graphics or compressed bitstream).
> >> This also could be answer for your first question, if we place this ki=
nd
> >> of buffer in a plane for DMABUF(importing) in V4L2, V4L2 core would try
> >> to prepare it, which could map it into IOMMU.
> >> =20
> >>>> Usually, such a metadata would be the value should be written to a
> >>>> hardware's registers, a 4KiB page would be 1024 items of 32 bits reg=
isters.
> >>>>
> >>>> Still, I have some problems with SHMEM:
> >>>> 1. I don't want the userspace modify the context of the SHMEM alloca=
ted
> >>>> by the kernel, is there a way to do so? =20
> >>> This is generally impossible without doing any of the two:
> >>> 1) copying the contents to an internal buffer not accessible to the
> >>> userspace, OR
> >>> 2) modifying any of the buffer mappings to read-only
> >>>
> >>> 2) can actually be more costly than 1) (depending on the architecture,
> >>> data size, etc.), so we shouldn't just discard the option of a simple
> >>> copy_from_user() in the ioctl.
> >>>     =20
> >> I don't want the userspace access it at all. So that won't be a proble=
m. =20
> > Hi,
> >=20
> > if userspace cannot access things like an image's HDR metadata, then it
> > will be impossible for userspace to program KMS to have the correct
> > color pipeline, or to send intended HDR metadata to a video sink.
> >=20
> > You cannot leave userspace out of HDR metadata handling, because quite
> > probably the V4L2 buffer is not the only thing on screen. That means
> > there must composition of multiple sources with different image
> > properties and metadata, which means it is no longer obvious what HDR
> > metadata should be sent to the video sink.
> >=20
> > Even if it is a TV-like application rather than a windowed desktop, you
> > will still have other contents to composite: OSD (volume indicators,
> > channels indicators, program guide, ...), sub-titles, channel logos,
> > notifications... These components ideally should not change their
> > appearance arbitrarily with the main program content and metadata
> > changes. Either the metadata sent to the video sink is kept static and
> > the main program adapted on the fly, or main program metadata is sent
> > to the video sink and the additional content is adapted on the fly.
> >=20
> > There is only one set of HDR metadata and one composited image that can
> > be sent to a video sink, so both must be chosen and produced correctly
> > at the source side. This cannot be done automatically inside KMS kernel
> > drivers.
> >  =20
> There may be some misunderstanding.
> Let suppose this HDR data is in a vendor specific format.
> Both upstream(decoder) and downstream(DRM) hardware devices are coming=20
> from the same vendor.
> Then we just need to delivery the reference to this metadata buffer from=
=20
> the upstream to downstream, both of drivers know how to handle it.
>=20
> Despite the userspace, we just need to extend a wayland protocol that=20
> making wayland compositor know how to receive the reference to the=20
> metadata and set it to the DRM plane.

Hi,

FWIW, I don't think Wayland upstream (wayland-protocols) would be any
more welcoming to opaque vendor-specific proprietary data blobs than the
upstream Linux.

(To everyone not following #dri-devel: There was a fairly long IRC
discussion about how HDR metadata is an exceptionally poor use case
example for "hidden" ancillary data blobs, and then continuing to how a
mechanism to pass proprietary data blobs around would not be accepted
upstream:
https://oftc.irclog.whitequark.org/dri-devel/2023-08-25#1692950883-16929604=
35;
)

> If you want a common HDR formats for all HDR variants(HDR10+, DV), I am=20
> not against it. But it won't make the userspace be able to fill the HDR=20
> metadata even the HDR data comes from the bitstream(likes SEI). We must=20
> consider the case of Secure Video Path(Digital Right), the bitstream is=20
> not accessible from (REE) userspace nor linux kernel, the downstream=20
> must take what the upstream feed.

In that case, Secure Video Path is simply not possible to have (in
upstream). Keeping actual pixels restricted is one thing, and
understandable given they are the essence of the copyrighted material
that the providers want to keep inaccessible. Not being able to deliver
the metadata to userspace OTOH does not seem to have any justification
in comparison.


Thanks,
pq

> >>>> 2. Should I create a helper function for installing the SHMEM file a=
s a fd? =20
> >>> We already have the udmabuf device [1] to turn a memfd into a DMA-buf,
> >>> so maybe that would be enough?
> >>>
> >>> [1]https://elixir.bootlin.com/linux/v6.5-rc7/source/drivers/dma-buf/u=
dmabuf.c
> >>>     =20
> >> It is the kernel driver that allocate this buffer. For example, v4l2
> >> CAPTURE allocate a buffer for metadata when VIDIOC_REQBUFS.
> >> Or GBM give you a fd which is assigned with a surface.
> >>
> >> So we need a kernel interface. =20
> >>> Best,
> >>> Tomasz
> >>>     =20
> >>>> --
> >>>> Hsia-Jun(Randy) Li =20
> >  =20
>=20


--Sig_/=7wEatCdcP1mozuK9z20Vy1
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEJQjwWQChkWOYOIONI1/ltBGqqqcFAmTok1YACgkQI1/ltBGq
qqeJTQ//YMiq0BxH7MunqPu+HKNs+EQYCnO4e82D4TNR96frJ7j9Nyd1ru8ZFSav
vdgXX0LN/mt682PDcZHIPLle/83LjpNwfD33ed/P3czpu9NMjhQHQ5wLu1kvvSv2
SINZnCmH8KitLvJsu51jWhI0mxEt74u/YjACIpgnxXLvsvZoyx+FOCF5XDm94qEi
TAAbMdaFA5LBDFlHiarSbF17aM8aFm/XSJWPQZU9KHTv5ZCIiiU83CyDXIpV78OY
FfxBhCCefD8NS11UUjqkEWb8VGQ97O5ZTtyl8Dio6A5lMcohWHnCFZr6bqGSG8kA
OEPnm8WPEITW2nVUT3TMmJrPZFp3YPWZ3K/I0U7+KOzbI8FRl4nelg4jv5875eXi
isQZ3iivpYLf2/0l7WKvu9ca50SFKxK6qsGy9qsi6jxph7PDQ0KaPz7E7iF15oQB
z4rJY8cBfHSV0AVT7FQPiE0w8z7fWfvqzgtaVwk6fIkorxdHE32IdSsHOGjBnwWC
EOmF96euDy/IG7eYatqN3Dld5sZyj4IZagRg2iQuMFnDpd++GdjZFUyvkkLjBVMP
AdgaIM7sfLxPQNJDv5dqfhRGeFQrLWSGkXg7S40gY/9G1oqc3RtCu4XWbjR9ZrMm
sGdU/4fFgELc4T+9oYTU5d7Cl6IwHKn1u2Kvdoa4hrFg8ynP5zI=
=ltBp
-----END PGP SIGNATURE-----

--Sig_/=7wEatCdcP1mozuK9z20Vy1--
