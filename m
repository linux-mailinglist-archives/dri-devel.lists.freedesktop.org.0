Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A28A37FABF1
	for <lists+dri-devel@lfdr.de>; Mon, 27 Nov 2023 21:48:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5AE0F10E151;
	Mon, 27 Nov 2023 20:48:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1A8D610E151;
 Mon, 27 Nov 2023 20:48:20 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by ams.source.kernel.org (Postfix) with ESMTP id 703F8B8379B;
 Mon, 27 Nov 2023 20:48:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C9FF6C433C7;
 Mon, 27 Nov 2023 20:48:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1701118097;
 bh=F+DixVQHqnZfFWplCVsKeDl8KieaAO0CwhsSrf5zwc8=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=huRLyeI3wMnPtr/FMRJBUfGoMiI2V//3OQCHJKme42RHApPqVTXBjV7ZLUQpFdaBY
 9kgTQ+dl8s+kW0oEwC3huqqxibyjnZ3Rxx91XqRdwDLvMxQRD/Dn+YtG7+diFIXXir
 j2p2mvo97Co9laJv/5TqBcU3d81O80SE294iJv1YsVwJKO4mHr5MB0iDnrlZSy7c97
 2OG0lkgWV8cjvrhlA+3eTe7CpqJ6UAJvC7b9v75+tgwV7nW+J9kucdiApZMhNcQh8k
 4ERGZJa9Ll+tBLx8Qg8YHkdeeYT83CEJceTkJ420/MfonN0VaInBX/yrTPfxAvqwya
 lRIZ0acMPzQyQ==
Received: by mail-ed1-f49.google.com with SMTP id
 4fb4d7f45d1cf-54b18c9b21bso3180524a12.0; 
 Mon, 27 Nov 2023 12:48:17 -0800 (PST)
X-Gm-Message-State: AOJu0YyZ+S37jz5+F3yCKjVT8u6Jm4FHkMPpnUbzYC/RSwvMdOtPhbeJ
 Iyo3+sp4+PPrNaMV+m7z5nY7/7ivT/96LnI0vDs=
X-Google-Smtp-Source: AGHT+IGHVAOgiSfNiBUMoBzciRv2pya3/IYbvyUyGZifhXAh/Ggz0yVMKeH1VsB0efnUD7XNV2BfLrLZRCVfkYSajrc=
X-Received: by 2002:a17:906:224c:b0:9e5:3a0:8610 with SMTP id
 12-20020a170906224c00b009e503a08610mr4354261ejr.30.1701118096273; Mon, 27 Nov
 2023 12:48:16 -0800 (PST)
MIME-Version: 1.0
References: <20231031051943.1957328-1-airlied@gmail.com>
 <20231031051943.1957328-4-airlied@gmail.com>
In-Reply-To: <20231031051943.1957328-4-airlied@gmail.com>
From: Timur Tabi <timur@kernel.org>
Date: Mon, 27 Nov 2023 14:47:39 -0600
X-Gmail-Original-Message-ID: <CAOZdJXXxd2RhsZ10D9gotcTk-4CUussRgwKceSvEroivj9Pn1A@mail.gmail.com>
Message-ID: <CAOZdJXXxd2RhsZ10D9gotcTk-4CUussRgwKceSvEroivj9Pn1A@mail.gmail.com>
Subject: Re: [Nouveau] [PATCH 3/3] nouveau/gsp: add some basic registry
 entries.
To: Dave Airlie <airlied@gmail.com>
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

On Tue, Oct 31, 2023 at 12:20=E2=80=AFAM Dave Airlie <airlied@gmail.com> wr=
ote:
>         rpc->size =3D sizeof(*rpc);
> -       rpc->numEntries =3D 1;
> -       rpc->entries[0].nameOffset =3D offsetof(typeof(*rpc), entries[1])=
;
> -       rpc->entries[0].type =3D 1;
> -       rpc->entries[0].data =3D 0;
> -       rpc->entries[0].length =3D 4;
> -
> -       strings =3D (char *)&rpc->entries[1];
> -       strings[0] =3D '\0';
> +       rpc->numEntries =3D NV_GSP_REG_NUM_ENTRIES;
> +
> +       str_offset =3D offsetof(typeof(*rpc), entries[NV_GSP_REG_NUM_ENTR=
IES]);
> +       strings =3D (char *)&rpc->entries[NV_GSP_REG_NUM_ENTRIES];
> +       for (i =3D 0; i < NV_GSP_REG_NUM_ENTRIES; i++) {
> +               int name_len =3D strlen(r535_registry_entries[i].name) + =
1;
> +               rpc->entries[i].nameOffset =3D str_offset;
> +               rpc->entries[i].type =3D 1;
> +               rpc->entries[i].data =3D r535_registry_entries[i].value;
> +               rpc->entries[i].length =3D 4;
> +               memcpy(strings, r535_registry_entries[i].name, name_len);
> +               strings +=3D name_len;
> +               str_offset +=3D name_len;
> +       }

I'm working on a patch that replaces this code with a
dynamically-generated registry so that we can set registry keys via
the driver's command-line (like the Nvidia driver).  However, you have
a bug here.  rpc->size must be the total size of the RPC, including
all the PACKED_REGISTRY_ENTRY structs and the strings that follow
them.  You can see this by looking at RmPackageRegistry() and
regCountEntriesAndSize() in OpenRM.
