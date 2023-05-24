Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 683CC70EB91
	for <lists+dri-devel@lfdr.de>; Wed, 24 May 2023 04:52:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 15E4A10E563;
	Wed, 24 May 2023 02:52:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1DAB110E563
 for <dri-devel@lists.freedesktop.org>; Wed, 24 May 2023 02:52:33 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 7599F63812
 for <dri-devel@lists.freedesktop.org>; Wed, 24 May 2023 02:52:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D9AC3C4339B
 for <dri-devel@lists.freedesktop.org>; Wed, 24 May 2023 02:52:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1684896751;
 bh=wWoMXJfcsEqC8USOGU+FMTNfWB3fZsnW3ugmshgZ1Xk=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=Iz2s6O6JL7FH1zyFuywdSiSukvkHkSs5ezJ27dzNWIvUQUehd7ZlnkIrxjh+Jp8+P
 iZHxbMlqxqWBlNH/sVu3h/3mW/LZ9SjkXbxwbXpMnqDmlJDPMYoXxPFEiWWG3VaK88
 bFtFHL6Pvft8z0La+6euexoXgKhdUJU/Ie4fEBNzT3YPeeM8vrAyu8ieF8HV/9S+OI
 BRNhw4InrpCkTdWV0FRSLSobOF8l4a60kGVs/LyPdAThnUOEy+RzZoKdN3BuoUbPLc
 b2RBWhNzdldxFD+fwS6TPBuxR29mtlLhxquZNYraTy5zYoDDGP1sEEixwHrVpnKTVm
 TOHGP0RL6ez4A==
Received: by mail-ej1-f44.google.com with SMTP id
 a640c23a62f3a-96fe2a1db26so65774666b.0
 for <dri-devel@lists.freedesktop.org>; Tue, 23 May 2023 19:52:31 -0700 (PDT)
X-Gm-Message-State: AC+VfDxgU/FQPMplGqVlv2IHR51/jenewPEbUNRg1n4AFY1bjqvtCzPL
 /jliu2yPNBAr/YG1dTKcxEqqGzw4q8Zi0+XTHDU=
X-Google-Smtp-Source: ACHHUZ6J6x108CbZr4DxK0jIw8cgX+MlpLwVdnsGTEbIP0LkrHmvxtEw2W5YjRSePJK+Xk1I+XoIEUkdVKu0hFVNxPg=
X-Received: by 2002:a17:907:7d8c:b0:96f:781e:a4d5 with SMTP id
 oz12-20020a1709077d8c00b0096f781ea4d5mr15327710ejc.77.1684896750091; Tue, 23
 May 2023 19:52:30 -0700 (PDT)
MIME-Version: 1.0
References: <20230520105718.325819-1-15330273260@189.cn>
 <20230520105718.325819-2-15330273260@189.cn>
 <26fd78b9-c074-8341-c99c-4e3b38cd861a@xen0n.name>
 <e7f911cc-6588-bc0f-8e1e-759260f5187a@189.cn>
 <ed795dc0-823a-f3d8-9e70-1cf33c0de7f0@xen0n.name>
 <ac2fde55-c770-fbb5-844d-50fb38dd90be@189.cn>
 <331e7baa-a83b-b0c9-37f7-0e8e39187df4@xen0n.name>
 <5ae49b7a-b8d2-a822-65bc-6a894d2b1b4e@189.cn>
 <0e5e4a4b-1426-ffae-e958-cf8f9aece166@xen0n.name>
 <69edaf49-359a-229c-c8b4-8aa3af622008@189.cn>
 <ece7821e-c4bb-f2b7-3b1d-dacc04729530@xen0n.name>
In-Reply-To: <ece7821e-c4bb-f2b7-3b1d-dacc04729530@xen0n.name>
From: Huacai Chen <chenhuacai@kernel.org>
Date: Wed, 24 May 2023 10:52:18 +0800
X-Gmail-Original-Message-ID: <CAAhV-H7yTDMrZiOCBs6U8+_K3pPDwk-S2boEy2aOJgTqoUGYGw@mail.gmail.com>
Message-ID: <CAAhV-H7yTDMrZiOCBs6U8+_K3pPDwk-S2boEy2aOJgTqoUGYGw@mail.gmail.com>
Subject: Re: [PATCH v14 1/2] drm: add kms driver for loongson display
 controller
To: WANG Xuerui <kernel@xen0n.name>
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
Cc: Nathan Chancellor <nathan@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Christian Koenig <christian.koenig@amd.com>,
 Liu Peibao <liupeibao@loongson.cn>, Li Yi <liyi@loongson.cn>,
 linux-kernel@vger.kernel.org, Sui Jingfeng <15330273260@189.cn>,
 loongson-kernel@lists.loongnix.cn, Emil Velikov <emil.l.velikov@gmail.com>,
 linaro-mm-sig@lists.linaro.org, dri-devel@lists.freedesktop.org,
 Javier Martinez Canillas <javierm@redhat.com>,
 Sumit Semwal <sumit.semwal@linaro.org>, linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, May 23, 2023 at 4:14=E2=80=AFPM WANG Xuerui <kernel@xen0n.name> wro=
te:
>
> On 5/22/23 21:13, Sui Jingfeng wrote:
> > Hi,
> >
> > On 2023/5/22 18:25, WANG Xuerui wrote:
> >> On 2023/5/22 18:17, Sui Jingfeng wrote:
> >>> Hi,
> >>>
> >>> On 2023/5/22 18:05, WANG Xuerui wrote:
> >>>> On 2023/5/22 17:49, Sui Jingfeng wrote:
> >>>>> Hi,
> >>>>>
> >>>>> On 2023/5/22 17:28, WANG Xuerui wrote:
> >>>>>> On 2023/5/22 17:25, Sui Jingfeng wrote:
> >>>>>>> Hi,
> >>>>>>>
> >>>>>>> On 2023/5/21 20:21, WANG Xuerui wrote:
> >>>>>>>>> + * LS3A4000/LS3A5000/LS3A6000 CPU, they are equipped with
> >>>>>>>>> on-board video RAM
> >>>>>>>>> + * typically. While LS2K0500/LS2K1000/LS2K2000 are low cost
> >>>>>>>>> SoCs which share
> >>>>>>>>> + * the system RAM as video RAM, they don't has a dediacated
> >>>>>>>>> VRAM.
> >>>>>>>>
> >>>>>>>> CPU models are not typically prefixed with "LS", so "Loongson
> >>>>>>>> 3A4000/3A5000/3A6000".
> >>>>>>>>
> >>>>>>> Here is because when you do programming, variable name should
> >>>>>>> prefix with letters.
> >>>>>>
> >>>>>> Commit messages, comments, and log messages etc. are natural
> >>>>>> language, so it's better to treat them differently. No problem to
> >>>>>> keep code as-is IMO.
> >>>>>>
> >>>>> Then you get two name for a single chip,  take  LS7A1000 as an
> >>>>> example.
> >>>>>
> >>>>> You name it as Loongson 7A1000 in commit message,  and then you
> >>>>> have to define another name in the code,  say LS7A1000.
> >>>>>
> >>>>> "Loongson 7A1000" is too long,  not as compact as LS7A1000.
> >>>>>
> >>>>> This also avoid bind the company name to a specific product,
> >>>>> because a company can produce many product.
> >>>>
> >>>> Nah, the existing convention is "LS7Xxxxx" for bridges and
> >>>> "Loongson 3Axxxx" for CPUs (SoCs like 2K fall under this category
> >>>> too). It's better to stick with existing practice so it would be
> >>>> familiar to long-time Loongson/LoongArch developers, but I
> >>>> personally don't think it will hamper understanding if you feel
> >>>> like doing otherwise.
> >>>>
> >>> Can you explain why it is better?
> >>>
> >>> is it that the already existing is better ?
> >>
> >> It's not about subjective perception of "better" or "worse", but
> >> about tree-wide consistency, and about reducing any potential
> >> confusion from newcomers. I remember Huacai once pointing out that
> >> outsiders usually have a hard time remembering "1, 2, and 3 are CPUs,
> >> some 2 are SoCs, 7 are bridge chips", and consistently referring to
> >> the bridge chips throughout the tree as "LS7A" helped.
> >>
> >> In any case, for the sake of consistency, you can definitely refer to
> >> the CPU models in natural language like "LS3Axxxx"; just make sure to
> >> refactor for example every occurrence in arch/loongarch and other
> >> parts of drivers/. That's a lot of churn, though, so I don't expect
> >> such changes to get accepted, and that's why the tree-wide
> >> consistency should be favored over the local one.
> >>
> > There are document[1] which named LS7A1000 bridge chip as Loongson
> > 7A1000 Bridge,
> >
> > which is opposed to what you have said "the existing convention is
> > LS7Xxxxx for bridges".
> >
> >
> > there are also plenty projects[2] which encode ls2k1000 as project
> > name, which simply
> >
> > don't fall into the category as you have mentioned("Loongson 3Axxxx").
> >
> >
> > See [1][2] for reference, how to explain this phenomenon then?
>
> Turn down the flames a little bit, okay? ;-)
>
> What I'm describing is simply the kernel convention. Try grepping the
> commit log of linux: you can see almost all mentions of "Loongson 7A" is
> just referring to the manual which is named like that; that "LS3A" only
> ever appear as part of some board name; and that "LS2K" only briefly
> appearing when mentioned together with LS7A, maybe that's emphasis on
> the SoC's bridge part. "Loongson [123]" and "LS7A" are clearly the
> majority there.
>
> But, as the convention was established by Huacai and I'm only
> reiterating his rules, you may instead just check with him and not
> continue the boring debate with me. Meanwhile maybe keeping all "LS3A"
> and/or "LS2K" is kind of acceptable, given such naming is etched right
> on the chip's packaging; I'd follow whatever Huacai mandates.
Yes, I can confirm that.

For CPU: we always use the full name, "Loongson-3A".
For Bridge: we only use the full name when referring to the manuals,
otherwise use the abbrev. name "LS7A".
For SoC: depending on scenarios, in architectural code we usually use
the full name "Loongson-2K", and in drivers it is allowed to call
"LS2K" to keep consistency, especially in DTS.

Huacai
>
> --
> WANG "xen0n" Xuerui
>
> Linux/LoongArch mailing list: https://lore.kernel.org/loongarch/
>
