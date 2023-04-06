Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DEB706D8EF2
	for <lists+dri-devel@lfdr.de>; Thu,  6 Apr 2023 07:49:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D09D310E175;
	Thu,  6 Apr 2023 05:49:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-vs1-xe29.google.com (mail-vs1-xe29.google.com
 [IPv6:2607:f8b0:4864:20::e29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0FDD310E175
 for <dri-devel@lists.freedesktop.org>; Thu,  6 Apr 2023 05:48:58 +0000 (UTC)
Received: by mail-vs1-xe29.google.com with SMTP id h27so33533352vsa.1
 for <dri-devel@lists.freedesktop.org>; Wed, 05 Apr 2023 22:48:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1680760137;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=YZ8PVA/atiia/tjTYHEDk3XUx3h0g9cX9xWoZrnfSaI=;
 b=VAJUd7AkFuitBCaDn4PDCke2qUypZywbfeYT2Ko80sDqTyivuobWW8FDMdqeUCZDql
 MoEXSViUMBV7PMMIsLKdnr4H5mWcL98In5TEPR6cYjze1wdNL6Pq4/XHl1q8EYepFsIP
 6gUGhA52NjbDOp5i4NfyZ7ar2DhgYcgwV3INo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680760137;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=YZ8PVA/atiia/tjTYHEDk3XUx3h0g9cX9xWoZrnfSaI=;
 b=04GPa6feig7jj20uWZW1/e5hXifX6ioe/W5LcoZNxci+7qCa7oKubV7ciirIDngwHo
 ZPQ8jXZGJx8Gxp7lq/+x5A3ROAfbK0r8NFzTUPS3kNEEk0nVD5m2QhrMFIFAbrjh2Exn
 BW/V5UZkkhB1l1XxiEP+0v/kDBJHoe2aYUCwrIlqohLUw0JheIeRE2oyJds8Uwt0C3wh
 PUtHRobXllIl3y1w6e3G/7gRyCsklcWMkt3wSwQuQERGhmqO5hZrvMQ+wUwC85OAX86+
 Qp2sG9yXcCqrNttELSJi+8vAv06uUGOJjeSMNXIqzKv9K5bIHLCeLb/XxXHAoKeONiMs
 P72g==
X-Gm-Message-State: AAQBX9eOQF0cHkZm5C4yEoQyn284L1Lp88T6lXJDBFItvVfZtwN7SyKf
 qUePFtL5pUmBI5OEBPrFgboqwGVJS9F67afTuYHt3Q==
X-Google-Smtp-Source: AKy350Y2i4qLGhKpJdOSUX/56KNRjC2/+DH+F1JftCexRGQwx88QRzq9YP9OtVd02aeOmfZgXAVDSLfBCAmwYW1igdo=
X-Received: by 2002:a67:c01c:0:b0:425:f1e7:fecf with SMTP id
 v28-20020a67c01c000000b00425f1e7fecfmr6371648vsi.7.1680760137615; Wed, 05 Apr
 2023 22:48:57 -0700 (PDT)
MIME-Version: 1.0
References: <20230321121859.2355-1-nancy.lin@mediatek.com>
 <17831605-5c9d-9c92-d190-04f91060ace4@collabora.com>
 <CAAOTY_8ZAxVSLnJ1u5snsRgkszV7ixwhjUS2nDimE_Lpj=cUCA@mail.gmail.com>
 <97a5f383-38f5-e8ea-e1d8-489b690e4521@collabora.com>
 <CAAOTY_9_vn-m2jTaaHkFDV+v2-LeaAxtCLNNnOxZq5Httb-TAQ@mail.gmail.com>
 <CAGXv+5FJCuG_zHnaKZ=baNzKAWKLEe3jZnghNAxuGv7i7L6e7Q@mail.gmail.com>
 <CAAOTY_9Dbtubah3ndj9+FeYDh7D42k6-BtHrYMNc=CP6GL6uFA@mail.gmail.com>
 <d0b9d8a2-14ae-8c0d-309b-5f5d60d43a1d@linaro.org>
In-Reply-To: <d0b9d8a2-14ae-8c0d-309b-5f5d60d43a1d@linaro.org>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Thu, 6 Apr 2023 13:48:46 +0800
Message-ID: <CAGXv+5HGmsfbN7GggASZPXtXCVvKUS4e-xjUFDG-87KvA_0W7w@mail.gmail.com>
Subject: Re: [PATCH v30 0/7] Add MediaTek SoC DRM (vdosys1) support for mt8195
To: Chun-Kuang Hu <chunkuang.hu@kernel.org>
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
Cc: devicetree@vger.kernel.org, singo.chang@mediatek.com,
 Nathan Chancellor <nathan@kernel.org>,
 Nick Desaulniers <ndesaulniers@google.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com,
 clang-built-linux@googlegroups.com,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Rob Herring <robh+dt@kernel.org>, linux-mediatek@lists.infradead.org,
 krzysztof.kozlowski+dt@linaro.org, Matthias Brugger <matthias.bgg@gmail.com>,
 "Nancy.Lin" <nancy.lin@mediatek.com>, linux-arm-kernel@lists.infradead.org,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Apr 3, 2023 at 5:47=E2=80=AFPM Krzysztof Kozlowski
<krzysztof.kozlowski@linaro.org> wrote:
>
> On 03/04/2023 05:30, Chun-Kuang Hu wrote:
> > Hi, Chen-yu:
> >
> > Chen-Yu Tsai <wenst@chromium.org> =E6=96=BC 2023=E5=B9=B43=E6=9C=8830=
=E6=97=A5 =E9=80=B1=E5=9B=9B =E4=B8=8B=E5=8D=887:05=E5=AF=AB=E9=81=93=EF=BC=
=9A
> >>
> >> On Mon, Mar 27, 2023 at 11:17=E2=80=AFPM Chun-Kuang Hu <chunkuang.hu@k=
ernel.org> wrote:
> >>>
> >>> Hi, Angelo:
> >>>
> >>> AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com> =
=E6=96=BC
> >>> 2023=E5=B9=B43=E6=9C=8824=E6=97=A5 =E9=80=B1=E4=BA=94 =E4=B8=8B=E5=8D=
=884:38=E5=AF=AB=E9=81=93=EF=BC=9A
> >>>>
> >>>> Il 24/03/23 00:25, Chun-Kuang Hu ha scritto:
> >>>>> Hi, Angelo:
> >>>>>
> >>>>> AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com=
> =E6=96=BC
> >>>>> 2023=E5=B9=B43=E6=9C=8823=E6=97=A5 =E9=80=B1=E5=9B=9B =E4=B8=8B=E5=
=8D=884:58=E5=AF=AB=E9=81=93=EF=BC=9A
> >>>>>>
> >>>>>> Il 21/03/23 13:18, Nancy.Lin ha scritto:
> >>>>>>> The hardware path of vdosys1 with DPTx output need to go through =
by several modules, such as, OVL_ADAPTOR and MERGE.
> >>>>>>>
> >>>>>>> Add DRM and these modules support by the patches below:
> >>>>>>>
> >>>>>>
> >>>>>> I've tested v30 again on MT8173, MT8192 and MT8195 based Chromeboo=
ks.
> >>>>>> Green light from me.
> >>>>>
> >>>>> I'm curious about how you build code and test on Chromebooks. Do yo=
u
> >>>>> build in cros environment or pure linux
> >>>>> (https://archlinuxarm.org/platforms/armv8/mediatek/acer-chromebook-=
r13).
> >>>>> I've a MT8183 based Chromebook (HP 11a) and I've tried to run a
> >>>>> upstream kernel on it. cros is too heavy for me and I doubt I could
> >>>>> use it. I've tried the pure linux and could boot up with console, b=
ut
> >>>>> display does not work. If you use the pure linux environment, could
> >>>>> you share how it works?
> >>>>>
> >>>>
> >>>> I haven't tested MT8183 (I don't actually have any 8183 machine in m=
y hands)... but
> >>>> yes, I can share my test environment.
> >>>>
> >>>> I have one MicroSD that I use either in the MicroSD slot of the targ=
et machine, or
> >>>> in a USB reader; this *single* system is what I boot on *all* Chrome=
books that I
> >>>> have: one kernel, multiple devicetrees, same Debian-based userspace.
> >>>>
> >>>> What we have to prepare this bootable media can be found at [1], but=
 beware that
> >>>> it currently uses an outdated kernel, so, what I have locally is a s=
ymlink to my
> >>>> kernel tree.
> >>>> You can change/add/remove the devicetree blobs that will get added t=
o the image
> >>>> by modifying `chromebook-setup.sh`; before tampering with kernel tre=
e symlink,
> >>>> please run that script for the first time, as it will download a cro=
ss-compiler,
> >>>> a kernel tree (that you will replace for sure) and the (very old) De=
bian rootfs
> >>>> that you can update with `apt-get dist-upgrade` after booting the Ch=
romebook.
> >>>>
> >>>> If you want to check about possible kernel configuration differences=
, what I use
> >>>> is at [2], so that you can compare.
> >>>
> >>> Thanks for the information, I would try to compare the kernel config =
first.
> >>
> >> Hi CK,
> >>
> >> Would you consider adding your repo to linux-next? That would let ever=
yone
> >> do integration testing, especially automated ones, earlier, before you=
 send
> >> your PRs to drm maintainers.
> >>
> >> You can do so by sending an email to Stephen Rothwell to do so.
> >
> > I don't understand what this process is. Does it means that I directly
> > upstream patches into linux-next? I prefer that my patches go through
> > drm maintainers' tree. Does any document introduce this process?
>
> All maintainers and sub-maintainers trees are supposed to be fed into
> linux-next.
>
> https://lore.kernel.org/linux-next/20230327124805.3ca4f3cc@canb.auug.org.=
au/T/#md226a8e714cc731c2ab4ba5ee7eb43fe21a55009
>
> Documentation/process/howto.rst
> Documentation/process/2.Process.rst

As Krzysztof mentioned, the purpose of linux-next is for integration testin=
g.
Your queued up patches still go through the DRM tree for eventually merging
into Linus's tree. Getting included into linux-next means that your branch
gets automatically merged together with other branches, gets build and boot
tested by the various CI platforms and bots out there, and provides a commo=
n
base for other developers.

I don't think there is any downside to having your branch integrated into
linux-next.

ChenYu
