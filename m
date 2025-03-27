Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C727A73E04
	for <lists+dri-devel@lfdr.de>; Thu, 27 Mar 2025 19:26:42 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C9AD610E936;
	Thu, 27 Mar 2025 18:26:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=darkrefraction-com.20230601.gappssmtp.com header.i=@darkrefraction-com.20230601.gappssmtp.com header.b="2/dLzEJW";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com
 [209.85.218.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9592410E936
 for <dri-devel@lists.freedesktop.org>; Thu, 27 Mar 2025 18:26:38 +0000 (UTC)
Received: by mail-ej1-f54.google.com with SMTP id
 a640c23a62f3a-aaf0f1adef8so184670266b.3
 for <dri-devel@lists.freedesktop.org>; Thu, 27 Mar 2025 11:26:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=darkrefraction-com.20230601.gappssmtp.com; s=20230601; t=1743099997;
 x=1743704797; darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=CTyrCRgo5ha+JUdwfzwN807l63P0OcURzXC+ycir374=;
 b=2/dLzEJWz9BMr/GugG4T0gDB98C9u/Fvs6YiSmbzY4kKyoPxK9PLHhS4EnajlLByWM
 LMQEiyBH2EDReh3eO5VK5mjANlHZIFu1EL86yyg/hvKZ/zTn6Oxre/foOKaavR8Xvm/F
 TOwfF7m+2VKVwm7OVa0rI1hZsrdXBMKwXBE2eCX4ymQsRPACXXwsaelNLCzyeZbMGxE9
 yWW3zYRtx3Eb5q0xzRdkwEh7g02nOG4d1SED+RYNa3dhI9wzJk/DoiUf1n1kf3VZvTk2
 N6By6necByU9PJ+T2X2epnHzujNAn7AAmHgkZJHdOuG+KbSjdBP2AZne1d2ZHB4KX9F2
 5c0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1743099997; x=1743704797;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=CTyrCRgo5ha+JUdwfzwN807l63P0OcURzXC+ycir374=;
 b=QuHNVUiQfFHnjLYeQXXedtaa06NrsAD+rYroYIJOZA/bxTvsa6Ap+IFyzgj24SLAF6
 fklCStBsYk7EBTpuyEs/TgmFsN0wMZRb6NY8SpHpXifmzXwyj+OZQv85Vqec3rJcqWyk
 sk3nFZMfzNtugGjgaDYVH3TfapUPkQ6EKQBjXqnX+r6kHUDLTWXuR1KyqklBG7mYiMe7
 wTmUWAWOj/LqfpW8iZ+VmZaE3sIMSi47lFmsyW++7+a4iItuDLJvZ4oQU2vDlpnOPCnu
 mrR35hO2xcttQlGD8IVUTGaqWh4j4PEbVkEx/pIe8HK6GT8vEO24YJyytQd+Gk6MsDad
 7abw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVYp44RblJCmcxKSUVtmDZ8OzFgzyk2KHlA4M7MexZg7ReaMrybTLcMrnOfpt5KTkk1KZpUvG+M8yU=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwNe5vp/plhMHbYAN6jTxhAQHIdI+OSjLr2D1BsVtYGaEkyD52D
 IJFKkAfuY9+/H6rOfLfUM59SRCUJyPHWTf+gvLYGIlA/6W/bRM/3e3FRUd67N3Ujxmrs8LG2PEe
 OsYePi97VrVcUtvxOWnv8EYTXKtndXt3ECW7o0A==
X-Gm-Gg: ASbGncsF7dOfINdPTDckCgn5rELeSWXbMJi2qxeFOLnWE7mf6b35QhMNcuegK1tHpPp
 F+z7EVgKJ/j+jb5lKWo5Ibw2s4phnWQMPnSpcLJxedT8Gxhh63M96bV5dje+DZbc4WxZ7n7+0oX
 GgBoHNBktkDcyYpVh1qTm3KGylvMuPdjZ+/wuKsD7nUIjIfZ6v+MGKzDWKfg==
X-Google-Smtp-Source: AGHT+IET0BCFr//EzIPopKFaGN5jZeir/J+CVx/Z+vlQ+1+JmTOCYtSGfPtUJKXO2oYFfeOennYoIUh2PSb/hxTp95w=
X-Received: by 2002:a17:907:6ea7:b0:ac2:88df:6a5b with SMTP id
 a640c23a62f3a-ac6fb14cefcmr417811366b.42.1743099996622; Thu, 27 Mar 2025
 11:26:36 -0700 (PDT)
MIME-Version: 1.0
References: <20250312213746.228042-1-mhenning@darkrefraction.com>
 <20250312213746.228042-2-mhenning@darkrefraction.com>
 <Z9xb5SABWcwYnV-x@pollux>
 <abcc6ddc-47d5-4970-8fc1-e82c150fbfd9@nvidia.com> <Z9x0NLY6HHsvxOFD@pollux>
 <CAAgWFh1VzRnt9QdCR9xOVhar7vEYAGPBcMHfqXGq_QHm0A6H8Q@mail.gmail.com>
 <Z-VK8eeA_7BURiBy@cassiopeiae>
In-Reply-To: <Z-VK8eeA_7BURiBy@cassiopeiae>
From: M Henning <mhenning@darkrefraction.com>
Date: Thu, 27 Mar 2025 14:26:09 -0400
X-Gm-Features: AQ5f1JrzgQIz946PQKGDBUroIHuC_WtCuVXd9vIquncA5sGiP4wdWFbj9jwxrno
Message-ID: <CAAgWFh1yGZkEi+Fr9htOp+iXJjLo6Q1B+rszKKAcxgw4Y0D1RQ@mail.gmail.com>
Subject: Re: [PATCH 1/2] drm/nouveau: Add DRM_IOCTL_NOUVEAU_GET_ZCULL_INFO
To: Danilo Krummrich <dakr@kernel.org>
Cc: Ben Skeggs <bskeggs@nvidia.com>, Karol Herbst <kherbst@redhat.com>, 
 Lyude Paul <lyude@redhat.com>, Faith Ekstrand <faith.ekstrand@collabora.com>, 
 dri-devel@lists.freedesktop.org, nouveau@lists.freedesktop.org
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

On Thu, Mar 27, 2025 at 8:56=E2=80=AFAM Danilo Krummrich <dakr@kernel.org> =
wrote:
>
> On Tue, Mar 25, 2025 at 07:40:56PM -0400, M Henning wrote:
> > Okay, that sounds reasonable since I don't expect this to change very q=
uickly.
> >
> > Since I don't fully understand, is the suggestion here to:
> > 1) add the interface as a function on nvkm_gr using the nvkm_gr_func
> > vtable and store the actual data on r535_gr
> > or
> > 2) add the interface to NVIF (which IF?) and store the actual data on n=
vkm_gr
> > ?
>
> I think we want both.
>
> 1) I think the suggestion was to store the data directly in nvkm_gr, howe=
ver the
>    structure is indeed specific to r535, so I think, unfortunately, we ne=
ed the
>    vtable and store that data in r535_gr.

Well, NV2080_CTRL_GR_GET_ZCULL_INFO_PARAMS is r535-specific, but we
need to convert it into a common structure and combine it with info
from NV0080_CTRL_FIFO_GET_ENGINE_CONTEXT_PROPERTIES at some point, so
I think it makes sense to do that conversion+combination before
storing it on any structure. In that case, maybe we store the
structure on nvkm_gr directly during r535_gr_oneinit and then the call
to get the info only goes through NVIF?


> 2) Yes, this should be passed through nvif. Unfortunately, I think it wou=
ld need
>    to be a whole new one (similar to the fifo one).
>
> Maybe Ben can provide you some additional pointers one this? Mayber he ca=
n
> suggest a shortcut, since he has patches queued to simplify the whole int=
erface.
>
> >
> > (Sorry, I don't understand how these layers are intended to fit togethe=
r.))
> >
> > On Thu, Mar 20, 2025 at 4:02=E2=80=AFPM Danilo Krummrich <dakr@kernel.o=
rg> wrote:
> > >
> > > On Fri, Mar 21, 2025 at 05:57:55AM +1000, Ben Skeggs wrote:
> > > > On 21/3/25 04:18, Danilo Krummrich wrote:
> > > >
> > > > > Hi Mel,
> > > > >
> > > > > On Wed, Mar 12, 2025 at 05:36:14PM -0400, Mel Henning wrote:
> > > >
> > > > > > @@ -72,6 +75,9 @@ struct nvkm_device {
> > > > > >                   bool armed;
> > > > > >                   bool legacy_done;
> > > > > >           } intr;
> > > > > > +
> > > > > > + bool has_zcull_info;
> > > > > > + struct drm_nouveau_get_zcull_info zcull_info;
> > > > > This is bypassing the nvif layer entirely. I think you should sto=
re the contents
> > > > > of struct NV2080_CTRL_GR_GET_ZCULL_INFO_PARAMS in struct r535_gr =
and have an
> > > > > nvif interface to access the data.
> > > >
> > > > I agree here, though nvkm_gr would be a better choice for a couple =
of
> > > > reasons, not least that it's possible (and should be reasonably tri=
vial) to
> > > > support this on earlier GPUs - should someone desire to at a later =
point.
> > >
> > > I agree, if the interface is stable enough -- I don't know whether th=
is is prone
> > > to change or not.
