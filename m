Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D19675711C
	for <lists+dri-devel@lfdr.de>; Tue, 18 Jul 2023 02:53:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 40EE210E2C1;
	Tue, 18 Jul 2023 00:53:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4CD5B10E2C1
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Jul 2023 00:53:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1689641581;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=DFSrEgmWLZm6bu1iSfsXtoqGsJ5ryBMo2E5K6xSRRW4=;
 b=VEDxCn6D5m2X8crWIArHYLSJ0nKeLdh+TPPQUANuY17ZCkUu65TZRw5LO8qW7EkfDVb1CL
 lQj/4TpA3XojRhu7tG99hBfKZZ03Gy+TrFm7CT7dOzHyhV3jLaxipbeD8BDA2I3zS0FJv1
 yRea+hyn1Rypt54lf2PuMP5YciZSBOw=
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com
 [209.85.160.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-36-7ANHUmboPc2zAarmSkVDFA-1; Mon, 17 Jul 2023 20:52:59 -0400
X-MC-Unique: 7ANHUmboPc2zAarmSkVDFA-1
Received: by mail-qt1-f199.google.com with SMTP id
 d75a77b69052e-403a95be2e7so55037351cf.3
 for <dri-devel@lists.freedesktop.org>; Mon, 17 Jul 2023 17:52:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1689641579; x=1692233579;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=DFSrEgmWLZm6bu1iSfsXtoqGsJ5ryBMo2E5K6xSRRW4=;
 b=NXNytWdWhqJjVxWlWKYKCtp70Oc8deJqzjvZP1uH2W6O+71vmdbpV+Sg+N7BfmWGBo
 Rm8K3+8IofKHtZhDY5pHDdhURCZ5HZkZOBFN0o19oOFMvZFPtrhgq0fzQygi+iYkiolX
 Jvrr55M0Fho8YoIPEKsOpQmVOLJuZ7VY2zvM3c+HG9zFqHUD3B+nTHIlLukIzkKJO120
 f9MMXEWshrhgMSYGJ/yOqMsIQ6jTF4ZI+q6ND9gA4F27px8lvssuz1Tt+cjEWb5VPpxX
 Pm9BtPyL/23EqjIOs2EooZLw4thfWZcwdiGddKBbu/t+uHbPoMt4TEtI5hU2gMs2X8+q
 XHRg==
X-Gm-Message-State: ABy/qLbQfrcjURKCPG3VCU7pcTMuS3HT9ok4NGwAYbl4s2sbU/itl26m
 sLS8R4B8Tub8HTpIQlCU4FoyGYuBgngBknYswY1k4Gr+AdtScvJaVBH+/5iWJq3RWD1Igxp8SYU
 kBL6BwM6F01m04ba0KQOoaD/ItoXBQoKQjnlq3lEbvlKw
X-Received: by 2002:a05:622a:15c5:b0:403:b236:9efa with SMTP id
 d5-20020a05622a15c500b00403b2369efamr17747373qty.31.1689641579129; 
 Mon, 17 Jul 2023 17:52:59 -0700 (PDT)
X-Google-Smtp-Source: APBJJlFgDp6w2uPjyDYej6SHTVr3hzmMFzjXwEz9LBEPBhFG828AadjWpGU21+dHcfKofrbnXFrjee1+3m4fBTnE2lE=
X-Received: by 2002:a05:622a:15c5:b0:403:b236:9efa with SMTP id
 d5-20020a05622a15c500b00403b2369efamr17747361qty.31.1689641578911; Mon, 17
 Jul 2023 17:52:58 -0700 (PDT)
MIME-Version: 1.0
References: <20230704025322.2623556-1-airlied@gmail.com>
 <20230704025322.2623556-3-airlied@gmail.com>
 <ZKhcbBHqkEmGtU6I@bombadil.infradead.org>
 <ls3fmucy6vgh2ifyqy5grxymynwhaceieacfpsiklkvscyzxdz@j4gpugiwfxuj>
In-Reply-To: <ls3fmucy6vgh2ifyqy5grxymynwhaceieacfpsiklkvscyzxdz@j4gpugiwfxuj>
From: David Airlie <airlied@redhat.com>
Date: Tue, 18 Jul 2023 10:52:47 +1000
Message-ID: <CAMwc25qSx_O8Gah5-yeE-kFQVzqwWux35LxggMwa-WZN=OQmMQ@mail.gmail.com>
Subject: Re: [PATCH 2/2] modules/firmware: add a new option to denote a
 firmware group to choose one.
To: Lucas De Marchi <lucas.demarchi@intel.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
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
Cc: Luis Chamberlain <mcgrof@kernel.org>, linux-modules@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Lucas De Marchi <lucas.de.marchi@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Jul 18, 2023 at 5:41=E2=80=AFAM Lucas De Marchi
<lucas.demarchi@intel.com> wrote:
>
> On Fri, Jul 07, 2023 at 11:41:48AM -0700, Luis Chamberlain wrote:
> >On Tue, Jul 04, 2023 at 12:50:50PM +1000, Dave Airlie wrote:
> >> From: Dave Airlie <airlied@redhat.com>
> >>
> >> This adds two tags that will go into the module info.
> >>
> >> The first denotes a group of firmwares, when that tag is present all
> >> MODULE_FIRMWARE lines between the tags will be ignored by new versions=
 of
> >> dracut.
> >>
> >> The second makes an explicitly ordered group of firmwares to search fo=
r
> >> inside a group setting. New dracut will pick the first available firmw=
are
> >> from this to put in the initramfs.
> >>
> >> Old dracut will just ignore these tags and fallback to installing all
> >> the firmwares.
> >>
> >> The corresponding dracut code it at:
> >> https://github.com/dracutdevs/dracut/pull/2309
> >>
> >> Cc: Luis Chamberlain <mcgrof@kernel.org>
> >> Cc: linux-modules@vger.kernel.org
> >> Cc: dri-devel@lists.freedesktop.org
> >> Signed-off-by: Dave Airlie <airlied@redhat.com>
> >
> >Lucas, did this end up working for you as well?
>
> I didn't try this yet, no. My opinion is similar to the first version of
> this series:  this is the first case in which we are making the order of
> 2 different keys to be relevant and it doesn't look so pretty. It may
> also be hard to adapt some of the drivers like i915 to intertwine the 2
> modinfo keys.

This doesn't have as much reliance on order, it just relies on the
group tags not being reordered outside the modinfos between them.

>
> However, the alternative I provided also has some flaws, so I said I'd
> be ok continuing in this direction. Humn... how about merging part of my
> suggestion to mitigate the duplication we have now?
>
>         - Document that when using a fw group, it's expected userspace
>           will consider higher versions within a group to have higher
>           prio and add only one of them. Thinking on a distro packaging,
>           it could be extended to packaging fewer blobs too.
>
> If we agree on "firmware files within a group are version-sorted", then
> we don't need the extra MODULE_FIRMWARE_GROUP_LIST, do we?

But what is the versioning to be used, I have to be very careful to
have this be backwards compat, and not suddenly stop pulling in some
versions of a fw because they happen to have used a version scheme
that this tramples.

If you are saying, we need to define a firmware versioning rule, then
that's a big task and would involve changing a bunch of things in the
fw and drivers.

i915:
adlp_dmc_ver2_14.bin.xz
dg2_guc_70.1.2.bin.xz
mtl_guc_70.bin.xz

amdgpu:
polaris11_mec.bin.xz
polaris11_mec2.bin.xz
polaris11_mec_2.bin.xz
polaris11_mec2_2.bin.xz

I don't see what is a version field I can sort on reliably here. Now
maybe I could introduce a new field

Do you think we should just add explicit ordering to each module group?,

so we create a

MODULE_FIRMWARE_GROUP_VERSIONED("nvidia/ga106/gsp/gsp-5258902.bin", 1);
MODULE_FIRMWARE_GROUP_VERSIONED("nvidia/ga106/gsp/gsp-5303002.bin", 2);

and I just output group brackets + that? and fix dracut to deal with it?

Dave.

