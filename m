Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E8AE9619AAD
	for <lists+dri-devel@lfdr.de>; Fri,  4 Nov 2022 15:58:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CF0FB10E855;
	Fri,  4 Nov 2022 14:57:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oa1-x30.google.com (mail-oa1-x30.google.com
 [IPv6:2001:4860:4864:20::30])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8708710E855
 for <dri-devel@lists.freedesktop.org>; Fri,  4 Nov 2022 14:57:55 +0000 (UTC)
Received: by mail-oa1-x30.google.com with SMTP id
 586e51a60fabf-13bd19c3b68so5781741fac.7
 for <dri-devel@lists.freedesktop.org>; Fri, 04 Nov 2022 07:57:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=K1gVxuAF8E1wt+B0yAv3PkO74sKGbKOwH5XfGox/81U=;
 b=NfGTep0WZ282nqPfUCT1yPZnvr5+ho8fiJ/z0UpoCyVZzhrQdMNRii/8GOTt1jOwW1
 d4UXaR4Hrk7qLw+Ivht92BPiQ7Tjj0o92VDDVGfLqf81zK5btnIlC7GAz0lLHJk8fiPc
 6t5wfU1ZcdJIqNF9JK3cjS/ttqBrNIeMFeXAjwpMO11T/q7EzoNa2qrAAQsnP3ZX3EWC
 UQnxBwDeHStXRIuFSIWULamY3yMVfoFHNYt5huwSYpkkjD8MNiNzw8a6JKxgXXHMolhX
 7uqdGFCHN5rsSP7Rt2mTfjalzA/Ut7FN3KgDMSLox1NXn19GtLEgVS+t7DpzOSy8FA0e
 NB0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=K1gVxuAF8E1wt+B0yAv3PkO74sKGbKOwH5XfGox/81U=;
 b=LxRuARvuV7/T8ldTADev8YvDe8ntxY/+y882Vg/k6J8cKlvX2hR9gsrj0+kW+bUu6q
 CA8IwHbYPrDWbaBdL3ncTxstskQ0B557hl7M7H+tJOtll+iPoe2bH/GONqU0enaZAowD
 1FS5hBdRsqLg3buPfTfSpEkY6+fYS0FE4hF1SkniVN1KQH+5jBTRFHFYuxdGS2bJ7vh8
 59CQ66+m/3TFTqkdTlP8ON7fMJk7bD5yIrdZpiBp55Hf1ZnLuueMUQPJS+M7VTuLDXyc
 NYtVLF2ebgdrRzSTJgwSBMc4gc/K648m8W2w9KHJKiwjvhAzWYrhjx48ij9pVzm+K3S8
 Xnaw==
X-Gm-Message-State: ACrzQf34N+Bqm/Bk9gNMzmxJRrkkuJ6PLN/wrO23+rK9LCcFCVRVHS/j
 OKgdGKgO9b34GpfbredoOnDNyLE9OfQ8MY9TwZ0JrNmi
X-Google-Smtp-Source: AMsMyM5mz3AyGVGUjs64ztiZ8jLTD6vuWi8Q2ktVP7OaVqbvnBliCbxIy/fr43OWxh//b+OpIdMHQIq0HkRF1DOtzQQ=
X-Received: by 2002:a05:6871:6a4:b0:13b:a056:f97f with SMTP id
 l36-20020a05687106a400b0013ba056f97fmr21374670oao.38.1667573874523; Fri, 04
 Nov 2022 07:57:54 -0700 (PDT)
MIME-Version: 1.0
References: <20221020121316.3946-1-christian.koenig@amd.com>
 <3d7353f3fa5905ce18e5b2d92f758f098189bc5a.camel@pengutronix.de>
 <7f5eff36-6886-bb06-061a-dd4263b61605@gmail.com>
 <f5de84cfe81fee828bbe0d47d379028d28ef6ca6.camel@pengutronix.de>
 <e02cedc2-6741-8813-a7a5-f8769e301745@gmail.com>
 <a53e5df51ec0f2f9d4c2d377c0cc5ba85f2e58ff.camel@ndufresne.ca>
 <9d716641-55c6-1590-26c2-1c3b14a28226@gmail.com>
 <CAPj87rMPkmimR_RJHhxYZokH__TVpPArk0h6drOUSx7Z9+oAHA@mail.gmail.com>
 <11a6f97c-e45f-f24b-8a73-48d5a388a2cc@gmail.com>
 <caf4d6b82843788db97555a58bc9e33915e5b50a.camel@ndufresne.ca>
 <b422be59-4b4b-2d0d-8e8c-b19f27c6832e@gmail.com>
 <4fa4e5d3b1f46e46139bad069cbf5e795e63afa8.camel@pengutronix.de>
 <cc091a11-d012-d998-b7e2-8b3d616867a7@gmail.com>
In-Reply-To: <cc091a11-d012-d998-b7e2-8b3d616867a7@gmail.com>
From: Rob Clark <robdclark@gmail.com>
Date: Fri, 4 Nov 2022 07:58:12 -0700
Message-ID: <CAF6AEGsA_AqMm2csMv_21Y8wFdbnCiYT36AEUszGK63zJM0hqw@mail.gmail.com>
Subject: Re: Try to address the DMA-buf coherency problem
To: =?UTF-8?Q?Christian_K=C3=B6nig?= <ckoenig.leichtzumerken@gmail.com>
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
Cc: Nicolas Dufresne <nicolas@ndufresne.ca>, linaro-mm-sig@lists.linaro.org,
 ppaalanen@gmail.com, dri-devel@lists.freedesktop.org,
 linux-media@vger.kernel.org, sumit.semwal@linaro.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Nov 2, 2022 at 5:21 AM Christian K=C3=B6nig
<ckoenig.leichtzumerken@gmail.com> wrote:
>
> Hi Lucas,
>
> Am 02.11.22 um 12:39 schrieb Lucas Stach:
> > Hi Christian,
> >
> > going to reply in more detail when I have some more time, so just some
> > quick thoughts for now.
> >
> > Am Mittwoch, dem 02.11.2022 um 12:18 +0100 schrieb Christian K=C3=B6nig=
:
> >> Am 01.11.22 um 22:09 schrieb Nicolas Dufresne:
> >>> [SNIP]
> >> As far as I can see it you guys just allocate a buffer from a V4L2
> >> device, fill it with data and send it to Wayland for displaying.
> >>
> >> To be honest I'm really surprised that the Wayland guys hasn't pushed
> >> back on this practice already.
> >>
> >> This only works because the Wayland as well as X display pipeline is
> >> smart enough to insert an extra copy when it find that an imported
> >> buffer can't be used as a framebuffer directly.
> >>
> > With bracketed access you could even make this case work, as the dGPU
> > would be able to slurp a copy of the dma-buf into LMEM for scanout.
>
> Well, this copy is what we are trying to avoid here. The codec should
> pump the data into LMEM in the first place.
>

For the dGPU VRAM case, shouldn't this be amdgpu re-importing it's own
dmabuf, which more or less bypasses dma-buf to get back the backing
GEM obj?

BR,
-R
