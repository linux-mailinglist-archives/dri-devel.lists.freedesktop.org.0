Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 96939BBF897
	for <lists+dri-devel@lfdr.de>; Mon, 06 Oct 2025 23:05:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A4DC010E6C4;
	Mon,  6 Oct 2025 21:05:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="DOfYPAth";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yx1-f43.google.com (mail-yx1-f43.google.com
 [74.125.224.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D6D2D10E6C4
 for <dri-devel@lists.freedesktop.org>; Mon,  6 Oct 2025 21:05:00 +0000 (UTC)
Received: by mail-yx1-f43.google.com with SMTP id
 956f58d0204a3-633bca5451cso5742731d50.1
 for <dri-devel@lists.freedesktop.org>; Mon, 06 Oct 2025 14:05:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1759784700; x=1760389500; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=gh/1hCpTCFiJ3MpyS9ebbJMVcH5jnSRG0s18AMTb7Ac=;
 b=DOfYPAthcg242rZi25ujVYQROcjJ0fX1CT9uXmA/bmPNfOnjj+HfqUZF+yYd68LvNM
 K/rvFdIXQgHw5D7M0j4NZhqo7qGP78mD6Hl+9fKZ7xQG7igplMZxyRe4MJE/tjPBGJ6v
 Py2O2HKDzUNJQelMUUeIvJhuXdM7PhhCsgfOUIr6PM1mWeQzqARKXHy3dCeB+WtKu6I/
 PukAeYYkDBmWlLZLjfq9eMocWnkKADZooi0Z16uCujg9RmNdklroxZco/3SFmzmuimuQ
 ngZBkZEtx5UAeWgdsjAKsGN/6YdIT5C2go2iiDlwaJI0bVHPXPi+wyWCboHOFjfdncRg
 YwdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1759784700; x=1760389500;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=gh/1hCpTCFiJ3MpyS9ebbJMVcH5jnSRG0s18AMTb7Ac=;
 b=Ixsgs/p1C2kH7pqd6LrKzjo/NcG4TYRdeZdkXsAjMJ+g0AtI5+CPZU2eEhGp0GOtjJ
 3iFbLeYgQKadxHu6QEqKIQht/0CqEUo09O/I6nVkFVzI2EWaY1Ti7lCleIDI2dEOyp0n
 uR3YAD2hGwzFzA6TbyeS7PBGhLXbmx4+ANJ0Z9GnZ1YSeavpvNg0pBIr/Xkyx99l9G2F
 WfyQB7NR8rGLe3XqHWJ59BtSCmPqEK2q6SKK2ypd5oWaTjzylz8Qq35Uk6xo56mG4TrP
 NnbjST9yReJjKMbHadzmIJckaW13w3i/rUT6Q871JXab+YTBDldGYUyi4Q/yV5nj2b3W
 D2+A==
X-Forwarded-Encrypted: i=1;
 AJvYcCWIXbLlRAtw7LcUj0rNiZ8oxLFIXT7x9PWKUzep9dmlwhDNKw9O0/s/SozicN85BK4zRj18GtD8zKI=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yxiq7p9Lsde5/+zHRuVnZby76tm7Oy44lrgoPmXhpxTePpaez2F
 dcdHQVgMUjA/fZhV/ugJXbp0RuVqkVpYs1Wg9sMGwsqCAKjnaTssdFv2lnUgBDPC9x+67g6qVrz
 BvaKD+QRjgrjO5nA+hpjqC2QXyMXiTFs=
X-Gm-Gg: ASbGncsiweJ2do/ZexYBKJjGBvCqmNvMIScPmxnZYPnFWPtjIiRK9IJ24Fx5AR/+yGO
 wPIqvhLJ5GgWf4yLb+5IR58Fdpq9KlmyvUp2V6cUttmM+P7SJ/YOO1DyZmJSVv0S2Gtcapi1NOR
 FDdM2D+rSKy8/2qEHRdp1Giw3yAKv4BAN/xiJu5eKUF7/kG/AZHqqXlqooNQmexsvTygRu51yaI
 dVj3fkYRW5sXUUKIm45zLyvhRMX9hkVr7bRQD7SX4uUcJHeqK30yEjld4Tq6PyqurC24yz1896+
 /XKly4RyUSbti7aU937t
X-Google-Smtp-Source: AGHT+IF4xkkTilN4YEtEhnfPfN25QA6ZIFD/iJbZXtYdAElQTTq8oeHPRaHaerXlZZR34BKg1BTlyQ1AF1UcE0MCFkw=
X-Received: by 2002:a05:690e:4285:10b0:631:fff6:ccf6 with SMTP id
 956f58d0204a3-63b9a0e0ef3mr12791599d50.28.1759784699507; Mon, 06 Oct 2025
 14:04:59 -0700 (PDT)
MIME-Version: 1.0
References: <20251003-mt8196-gpufreq-v6-0-76498ad61d9e@collabora.com>
 <8586490.T7Z3S40VBb@workhorse>
 <94866bc6-0fdb-4e6c-ba78-5ebd7138f193@collabora.com>
 <4457422.ejJDZkT8p0@workhorse>
 <97228670-1e68-4bd5-8ee7-3d87bdf3eaad@collabora.com>
In-Reply-To: <97228670-1e68-4bd5-8ee7-3d87bdf3eaad@collabora.com>
From: Chia-I Wu <olvaffe@gmail.com>
Date: Mon, 6 Oct 2025 14:04:47 -0700
X-Gm-Features: AS18NWCbWn1oadXlL9WLhR4kyHPNlkk_u0qh4w6jFYsHza4g5RN6zo6CaNPaCak
Message-ID: <CAPaKu7RGPS8zoSMrNYm7-ZPivDt8UAwjJ-2YB4tdKRdYSd_amw@mail.gmail.com>
Subject: Re: [PATCH v6 7/7] pmdomain: mediatek: Add support for MFlexGraphics
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>, 
 Boris Brezillon <boris.brezillon@collabora.com>,
 Jassi Brar <jassisinghbrar@gmail.com>, 
 Chen-Yu Tsai <wenst@chromium.org>, Steven Price <steven.price@arm.com>, 
 Liviu Dudau <liviu.dudau@arm.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, Kees Cook <kees@kernel.org>, 
 "Gustavo A. R. Silva" <gustavoars@kernel.org>,
 Ulf Hansson <ulf.hansson@linaro.org>, kernel@collabora.com, 
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, linux-hardening@vger.kernel.org, 
 linux-pm@vger.kernel.org
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

On Mon, Oct 6, 2025 at 7:28=E2=80=AFAM AngeloGioacchino Del Regno
<angelogioacchino.delregno@collabora.com> wrote:
>
> Il 06/10/25 14:16, Nicolas Frattaroli ha scritto:
> > On Monday, 6 October 2025 13:37:28 Central European Summer Time AngeloG=
ioacchino Del Regno wrote:
> >> Il 06/10/25 12:58, Nicolas Frattaroli ha scritto:
> >>> On Friday, 3 October 2025 23:41:16 Central European Summer Time Chia-=
I Wu wrote:
> >>>> On Fri, Oct 3, 2025 at 1:16=E2=80=AFPM Nicolas Frattaroli
> >>>> <nicolas.frattaroli@collabora.com> wrote:
> >>>>>
> >>>>> Various MediaTek SoCs use GPU integration silicon named "MFlexGraph=
ics"
> >>>>> by MediaTek. On the MT8196 and MT6991 SoCs, interacting with this
> >>>>> integration silicon is required to power on the GPU.
> >>>>>
> >>>>> This glue silicon is in the form of an embedded microcontroller run=
ning
> >>>>> special-purpose firmware, which autonomously adjusts clocks and
> >>>>> regulators.
> >>>>>
> >>>>> Implement a driver, modelled as a pmdomain driver with a
> >>>>> set_performance_state operation, to support these SoCs.
> >>>> I like this model a lot. Thanks!
> >>>>
> >>>> panthor might potentially need to interact with this driver beyond
> >>>> what pmdomain provides. I am thinking about querying
> >>>> GF_REG_SHADER_PRESENT. Not sure if we've heard back from the vendor.
> >>>
> >>> We did. The vendor confirmed this value is read by the EB firmware
> >>> from an efuse, but considers the efuse address to be confidential.
> >>> Consequently, we are not allowed to know the efuse address, or any
> >>> of the other information required to read the efuse ourselves
> >>> directly, such as what clocks and power domains it depends on.
> >>>
> >>> We therefore likely need to pass GF_REG_SHADER_PRESENT onward, but
> >>> I do have an idea for that: struct generic_pm_domain has a member
> >>> "cpumask_var_t cpus", which is there to communicate a mask of which
> >>> CPUs are attached to a power domain if the power domain has the flag
> >>> GENPD_FLAG_CPU_DOMAIN set. If the flag isn't set, the member is
> >>> unused.
> >>
> >> cpumask_var_t is not going to be the right type for anything else that=
 is
> >> not a cpumask, as that is limited by NR_CPUS.
> >
> > Hmmm, good point, I thought that would be done by the allocation
> > but nope.
> >
> >> You'd have to declare a new bitmap, suitable for generic devices, whic=
h may
> >> get a little complicated on deciding how many bits would be enough... =
and
> >> if we look at GPUs... AMD and nV have lots of cores, so that becomes a=
 bit
> >> unfeasible to put in a bitmap.
> >>
> >> Not sure then how generic that would be.
> >
> > Yeah, at this point I'm rapidly approaching "shove stuff into pmdomain
> > for no obvious pmdomain reason" territory, because we're not really
> > communicating that this pmdomain is only tied to these cores, but
> > rather that only these cores are present. Subtle difference that
> > could come bite us in the rear once some other chip has several power
> > domains that tie to different GPU shader cores.
> >
>
> I think that the only thing that we might see at some point in the future=
 is one
> power domain per "set of shader cores", but not even sure that's really g=
oing to
> ever be a thing, as it might just not be worth implementing from a firmwa=
re
> perspective.
>
> I am guessing here - we won't ever see one power domain per core.
>
> Besides, also remember that many GPUs do have internal power management (=
as in,
> per-core or per-core-set shutdown) so there already is such a power savin=
g way.
> That makes a vendor-specific implementation of that way less likely to se=
e, even
> though.. being cautious, never say never.
>
> In any case, we can't predict the future, we can only guess - and evaluat=
e things
> that could or could not realistically make sense.
>
> (anyway if you find a magic ball, please share, I need it for some other =
stuff :P)
>
> >>
> >>>
> >>> This means we could overload its meaning, e.g. with a new flag, to
> >>> communicate such masks for other purposes, since it's already the
> >>> right type and all. This would be quite a generic way for hardware
> >>> other than cpus to communicate such core masks. I was planning to
> >>> develop and send out an RFC series for this, to gauge how much Ulf
> >>> Hansson hates that approach.
> >>>
> >>> A different solution could be that mtk-mfg-pmdomain could act as an
> >>> nvmem provider, and then we integrate generic "shader_present is
> >>> stored in nvmem" support in panthor, and adjust the DT binding for
> >>> this.
> >>>
> >>> This approach would again be generic across vendors from panthor's
> >>> perspective. It would, however, leak into DT the fact that we have
> >>> to implement this in the gpufreq device, rather than having the
> >>> efuse read directly.
> >>>
> >>>> Have you considered moving this to drivers/soc/mediatek such that we
> >>>> can provide include/linux/mtk-mfg.h to panthor?
> >>>
> >>> Having panthor read data structures from mtk-mfg-pmdomain would be a
> >>> last resort for me if none of the other approaches work out, as I'm
> >>> not super keen on adding vendor-specific code paths to panthor
> >>> itself. A new generic code path in panthor that is only used by one
> >>> vendor for now is different in that it has the potential to be used
> >>> by a different vendor's integration logic in the future as well.
> >>>
> >>> So for now I'd like to keep it out of public includes and panthor as
> >>> much as possible, unless the two other approaches don't work out for
> >>> us.
> >>>
> >>
> >> I don't really like seeing more and more vendor specific APIs: MediaTe=
k does
> >> suffer quite a lot from that, with cmdq being one of the examples - an=
d the
> >> fact that it's not just MediaTek having those, but also others like Qu=
alcomm,
> >> Rockchip, etc, is not an excuse to keep adding new ones when there are=
 other
> >> alternatives.
> >>
> >> Also another fact there is that I don't think that panthor should get =
any
> >> vendor specific "things" added (I mean, that should be avoided as much=
 as
> >> possible).
> >
> > The big issue to me is that vendors will always prefer to shoehorn
> > more vendor specific hacks into panthor, because the alternative is
> > to tell us how the hardware actually works. Which they all hate
> > doing.
>
> That's a bit too much pessimistic... I hope.
>
> > I definitely agree that we should work from the assumption
> > that panthor can support a Mali implementation without adding too
> > much special code for it, because in 10 years there will still be
> > new devices that use panthor as a driver, but few people will still
> > be testing MT8196 codepaths within panthor, which makes refactoring
> > prone to subtle breakage.
>
> I had no doubt that you were thinking alike, but happy to see that confir=
med.
>
> >
> > Not to mention that we don't want to rewrite all the vendor specific
> > code for Tyr.
> >
> >> That said - what you will be trying to pass is really a value that is =
read
> >> from eFuse, with the EB firmware being a wrapper over that: if we want=
, we
> >> could see that yet-another-way of interfacing ourselves with reading n=
vmem
> >> where, instead of a direct MMIO read, we're asking a firmware to give =
us a
> >> readout.
> >>
> >> This leads me to think that one of the possible options could be to ac=
tually
> >> register (perhaps as a new platform device, because I'm not sure that =
it could
> >> be feasible to register a pmdomain driver as a nvmem provider, but ult=
imately
> >> that is Ulf and Srinivas' call I guess) a nvmem driver that makes an I=
PI call
> >> to GPUEB and gives back the value to panthor through generic bindings.
> >
> > Lee Jones will probably tell me to use MFD instead and that I'm silly
> > for not using MFD, so we might as well. Should I do that for v7 or
> > should v7 be less disruptive? Also, would I fillet out the clock
> > provider stuff into an MFD cell as well, or is that too much?
> >
> > Also, nb: there is no IPI call for getting the SHADER_PRESENT value
> > that we know of. It's a location in the reserved shared memory
> > populated by the EB during the shared mem init, which ideally isn't
> > done multiple times by multiple drivers because that's dumb.
> >
> > On the other hand, I don't really know what we get out of splitting
> > this up into several drivers, other than a more pleasing directory
> > structure and get_maintainers picking up the right subsystem people.
> >
>
> I'm not sure. A power controller being also a clock provider isn't entire=
ly
> uncommon (look at i.MX8 MP), but then think about it: if you add a MFD, y=
ou
> are still introducing vendor APIs around... as you'd need a way to do you=
r
> piece of communication with the EB.
>
> The benefit, then, is only what you just said.
>
> There are literally too many alternatives to do the very same as what you=
're
> doing here, including having a (firmware|soc)/mediatek-gpueb.c driver man=
aging
> only the communication part, and the rest all in small different drivers,=
 or...
>
> ...you could share the reserved-memory between the two drivers, and have =
the efuse
> driver getting a power domain from mtk-mfg-pmdomain (to check and call mf=
g power
> on), then reading the byte(s) that you need from GF_REG_SHADER_PRESENT fr=
om there.
>
> Not sure then what's the best option.
>
> One thing I'm sure about is that you're setting how everything works *now=
*, and
> changing that later is going to cause lots of pain and lots of suffering,=
 so a
> decision must be taken right now.
If mtk-mfg registers a nvmem cell, I guess all panthor needs to do is
to handle something like:

  nvmem-cells =3D <&gpueb_shmem_shader_present>;
  nvmem-cell-names =3D "shader-present";

That sounds like a reasonable generalization from panthor's point of view.

>
> >>>>>
> >>>>> The driver also exposes the actual achieved clock rate, as read bac=
k
> >>>>> from the MCU, as common clock framework clocks, by acting as a cloc=
k
> >>>>> provider as well.
> >>>>>
> >>>>> Signed-off-by: Nicolas Frattaroli <nicolas.frattaroli@collabora.com=
>
> >>>>> ---
> >>>>>    drivers/pmdomain/mediatek/Kconfig            |   16 +
> >>>>>    drivers/pmdomain/mediatek/Makefile           |    1 +
> >>>>>    drivers/pmdomain/mediatek/mtk-mfg-pmdomain.c | 1027 ++++++++++++=
++++++++++++++
> >>>>>    3 files changed, 1044 insertions(+)
> >>>> [...]
> >>>>> +static int mtk_mfg_init_shared_mem(struct mtk_mfg *mfg)
> >>>>> +{
> >>>>> +       struct device *dev =3D &mfg->pdev->dev;
> >>>>> +       struct mtk_mfg_ipi_msg msg =3D {};
> >>>>> +       int ret;
> >>>>> +
> >>>>> +       dev_dbg(dev, "clearing GPUEB shared memory, 0x%X bytes\n", =
mfg->shared_mem_size);
> >>>>> +       memset_io(mfg->shared_mem, 0, mfg->shared_mem_size);
> >>>>> +
> >>>>> +       msg.cmd =3D CMD_INIT_SHARED_MEM;
> >>>>> +       msg.u.shared_mem.base =3D mfg->shared_mem_phys;
> >>>>> +       msg.u.shared_mem.size =3D mfg->shared_mem_size;
> >>>>> +
> >>>>> +       ret =3D mtk_mfg_send_ipi(mfg, &msg);
> >>>>> +       if (ret)
> >>>>> +               return ret;
> >>>>> +
> >>>>> +       if (readl(mfg->shared_mem) !=3D GPUEB_MEM_MAGIC) {
> >>>> Add the offset GF_REG_MAGIC, even though it is 0.
> >>>
> >>> Good catch, will do!
> >>>
> >>>>
> >>>>> +               dev_err(dev, "EB did not initialise shared memory c=
orrectly\n");
> >>>>> +               return -EIO;
> >>>>> +       }
> >>>>> +
> >>>>> +       return 0;
> >>>>> +}
> >>>> [...]
> >>>>> +static int mtk_mfg_mt8196_init(struct mtk_mfg *mfg)
> >>>>> +{
> >>>>> +       void __iomem *e2_base;
> >>>>> +
> >>>>> +       e2_base =3D devm_platform_ioremap_resource_byname(mfg->pdev=
, "hw-revision");
> >>>>> +       if (IS_ERR(e2_base))
> >>>>> +               return dev_err_probe(&mfg->pdev->dev, PTR_ERR(e2_ba=
se),
> >>>>> +                                    "Couldn't get hw-revision regi=
ster\n");
> >>>>> +
> >>>>> +       if (readl(e2_base) =3D=3D MFG_MT8196_E2_ID)
> >>>>> +               mfg->ghpm_en_reg =3D RPC_DUMMY_REG_2;
> >>>>> +       else
> >>>>> +               mfg->ghpm_en_reg =3D RPC_GHPM_CFG0_CON;
> >>>>> +
> >>>>> +       return 0;
> >>>>> +};
> >>>> Extraneous semicolon.
> >>>
> >>> Good catch, will fix!
> >>>
> >>>>
> >>>>> +static int mtk_mfg_init_mbox(struct mtk_mfg *mfg)
> >>>>> +{
> >>>>> +       struct device *dev =3D &mfg->pdev->dev;
> >>>>> +       struct mtk_mfg_mbox *gf;
> >>>>> +       struct mtk_mfg_mbox *slp;
> >>>>> +
> >>>>> +       gf =3D devm_kzalloc(dev, sizeof(*gf), GFP_KERNEL);
> >>>>> +       if (!gf)
> >>>>> +               return -ENOMEM;
> >>>>> +
> >>>>> +       gf->rx_data =3D devm_kzalloc(dev, GPUEB_MBOX_MAX_RX_SIZE, G=
FP_KERNEL);
> >>>> It looks like gfx->rx_data can simply be "struct mtk_mfg_ipi_msg rx_=
data;".
> >>>
> >>> Hmmm, good point. I'll change it to that.
> >>>
> >>
> >> Honestly, I prefer the current version. No strong opinions though.
> >
> > And I just realised you're sorta right in that; struct mtk_mfg_mbox is
> > a type used by both the gpufreq mbox and the sleep mbox. The struct
> > mtk_mfg_ipi_msg type is only the right type to use for the gpufreq
> > mbox. By making rx_data a `struct mtk_mfg_ipi_msg` type, we're
> > allocating it for both channels, and in the case of the sleep mailbox,
> > it's the wrong type to boot (though not like sleep replies).
> >
> > So yeah I think I'll keep the current construct. If this driver grows
> > another limb in the future that talks to yet another mailbox channel,
> > we'll appreciate not having to untangle that.
>
> ...that was the implicit reasoning around my statement, yes.
Sounds good.
>
> Cheers,
> Angelo
>
> >
> >> [...]
> >
> > Kind regards,
> > Nicolas Frattaroli
> >
> >
>
>
