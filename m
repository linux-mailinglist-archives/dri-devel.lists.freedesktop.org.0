Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 00F737FAC91
	for <lists+dri-devel@lfdr.de>; Mon, 27 Nov 2023 22:32:26 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B135E10E307;
	Mon, 27 Nov 2023 21:32:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x535.google.com (mail-ed1-x535.google.com
 [IPv6:2a00:1450:4864:20::535])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1942310E307;
 Mon, 27 Nov 2023 21:32:19 +0000 (UTC)
Received: by mail-ed1-x535.google.com with SMTP id
 4fb4d7f45d1cf-54acdd65c88so4835581a12.2; 
 Mon, 27 Nov 2023 13:32:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1701120737; x=1701725537; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=GMXt/QjcB0PpuNepHtXYY7nCcTRfB6opzAYutejmCyg=;
 b=QQtQLHVDW258MIxmgYq4d0DmQvCgRTqScM8BjhOpM5vh3p/V2iucg0dd2TqovZqNje
 T3FSc4LBa05z2YPzIvUvsPYvq18wU8C0eLW6PMIs/eYeahDwPWf7v5OUY/EZUuM5cTPN
 /4jrzQM7Nh8tD3DYbBprrZMHux2OdRixoRherdOTa/RUP3azikGVCp8C6pGouzjdMEj3
 E9nnQFBRETBgdmhyR3WXqgfMqPiDG8mkia4xGEIR88PHjmA0xU7TzWqthe2X4Aod3bid
 zrdJzVlr1euoz9xL7VWCuqzWHCyBJn1Rx7XbfYaP1pJEoXDFWQnh1HAvj3Tw737d1g4O
 3Keg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1701120737; x=1701725537;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=GMXt/QjcB0PpuNepHtXYY7nCcTRfB6opzAYutejmCyg=;
 b=I00fMldHUEnKRx8jN8QG7g1MMhjm2RkTc6RdP5svI5XAAfK2zrGkZcketsjiF/h4ML
 P4Uzj65m8SW7NK4fy/BV9P7yWSDQJzWPTwQpFpdhW2u4b4mZ9qNK2v7EE7RTs+o3rcUf
 RocWnimSjmSOvqVV83Brxt3RYs5fxXipuLqDl4Dg3HWcwcaXrHtNUgSR6Ev8G7vUGIF3
 kjtwfibg9qvgTCBZ9FtggQEu5bumpMcr5cxW9BEBzWqR0o+d04EzFTvWUWNs4/niRNkw
 6BlwoCqg4m5jYKyylax/IEG5+Z96/O8XDsf3rkTvbjudDKuIZqdRqzYCgteF6eY0V5uN
 C0rg==
X-Gm-Message-State: AOJu0YwTQ1PqM5uhLYiuHPvpOR4Slz2UdUZNIfZBXnVMTMlU/fTM3Qdc
 3ccjm05eyQ5RmUTIJfVtgFiGfcsUBhjOegztgoXIJt+i
X-Google-Smtp-Source: AGHT+IHpXenmf965VvBUb4xFNCHgEsV2WxRxqKXOum4qkVw+gL1gGfQMh7KwpXT11oBNNP0Yi1HINgh9NvDRfsUB+Ms=
X-Received: by 2002:a17:907:b011:b0:9bd:bbc1:1c5f with SMTP id
 fu17-20020a170907b01100b009bdbbc11c5fmr7510864ejc.35.1701120736901; Mon, 27
 Nov 2023 13:32:16 -0800 (PST)
MIME-Version: 1.0
References: <20231031051943.1957328-1-airlied@gmail.com>
 <20231031051943.1957328-4-airlied@gmail.com>
 <CAOZdJXXxd2RhsZ10D9gotcTk-4CUussRgwKceSvEroivj9Pn1A@mail.gmail.com>
In-Reply-To: <CAOZdJXXxd2RhsZ10D9gotcTk-4CUussRgwKceSvEroivj9Pn1A@mail.gmail.com>
From: Dave Airlie <airlied@gmail.com>
Date: Tue, 28 Nov 2023 07:32:05 +1000
Message-ID: <CAPM=9txvgGnC26hTOqR=7zsX8OUcR5vc87x88u8jk5Tm7EG8+A@mail.gmail.com>
Subject: Re: [Nouveau] [PATCH 3/3] nouveau/gsp: add some basic registry
 entries.
To: Timur Tabi <timur@kernel.org>
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
Cc: nouveau@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, 28 Nov 2023 at 06:48, Timur Tabi <timur@kernel.org> wrote:
>
> On Tue, Oct 31, 2023 at 12:20=E2=80=AFAM Dave Airlie <airlied@gmail.com> =
wrote:
> >         rpc->size =3D sizeof(*rpc);
> > -       rpc->numEntries =3D 1;
> > -       rpc->entries[0].nameOffset =3D offsetof(typeof(*rpc), entries[1=
]);
> > -       rpc->entries[0].type =3D 1;
> > -       rpc->entries[0].data =3D 0;
> > -       rpc->entries[0].length =3D 4;
> > -
> > -       strings =3D (char *)&rpc->entries[1];
> > -       strings[0] =3D '\0';
> > +       rpc->numEntries =3D NV_GSP_REG_NUM_ENTRIES;
> > +
> > +       str_offset =3D offsetof(typeof(*rpc), entries[NV_GSP_REG_NUM_EN=
TRIES]);
> > +       strings =3D (char *)&rpc->entries[NV_GSP_REG_NUM_ENTRIES];
> > +       for (i =3D 0; i < NV_GSP_REG_NUM_ENTRIES; i++) {
> > +               int name_len =3D strlen(r535_registry_entries[i].name) =
+ 1;
> > +               rpc->entries[i].nameOffset =3D str_offset;
> > +               rpc->entries[i].type =3D 1;
> > +               rpc->entries[i].data =3D r535_registry_entries[i].value=
;
> > +               rpc->entries[i].length =3D 4;
> > +               memcpy(strings, r535_registry_entries[i].name, name_len=
);
> > +               strings +=3D name_len;
> > +               str_offset +=3D name_len;
> > +       }
>
> I'm working on a patch that replaces this code with a
> dynamically-generated registry so that we can set registry keys via
> the driver's command-line (like the Nvidia driver).

I'm not sure we'd want that, except maybe as a debugging aid, I'd
really like to have nouveau just pick the correct set of registry
entries, but I suppose there might be some cases where setting the
from the command line would be good for testing.

> a bug here.  rpc->size must be the total size of the RPC, including
> all the PACKED_REGISTRY_ENTRY structs and the strings that follow
> them.  You can see this by looking at RmPackageRegistry() and
> regCountEntriesAndSize() in OpenRM.

Oh interesting, I'll take a look today.

Dave.
