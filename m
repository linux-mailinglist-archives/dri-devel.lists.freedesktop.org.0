Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D45CE908AEE
	for <lists+dri-devel@lfdr.de>; Fri, 14 Jun 2024 13:38:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1339310E05C;
	Fri, 14 Jun 2024 11:38:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="d7WEsk88";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9900010E05C
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Jun 2024 11:38:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1718365128;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=MIQcMyT1Vs/YI/jlupNDzy6HFIXPnDO2IsWrF2KHIX4=;
 b=d7WEsk88lfaRYcJRuq8a4xMd6+efUPJNHyPw1lsHgh3mcvbegEtjlDwb15JtOI3jzN9AdU
 LCWZRYkzLFXk3oxDwlZKmnnO4dLBEhN0Vs6MHmdBIySVXPSmWL0SdgGD2zG3xeZ4q551n0
 osdceATEZJkkZHlL2qdzMQYqdmaQjcM=
Received: from mail-lj1-f199.google.com (mail-lj1-f199.google.com
 [209.85.208.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-134-0EL25wJsNJKpdeUGqECmhw-1; Fri, 14 Jun 2024 07:38:46 -0400
X-MC-Unique: 0EL25wJsNJKpdeUGqECmhw-1
Received: by mail-lj1-f199.google.com with SMTP id
 38308e7fff4ca-2eae267d112so3385181fa.1
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Jun 2024 04:38:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1718365125; x=1718969925;
 h=mime-version:user-agent:content-transfer-encoding:references
 :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=MIQcMyT1Vs/YI/jlupNDzy6HFIXPnDO2IsWrF2KHIX4=;
 b=gTMTbnWkObFoRwErMkJsm1PTLIhuHA+nBm7iTrRtU4JHb8BJZuliC9GjI37/vMc2vw
 aZnPkUbuEk/iraSx9azWBH5DoVQ3d+juIuCw2eVj9Q5XCeaV1Qv49MOR27p6SqfmNhsS
 YdGVtNYrshyZ8QZYutNYdhIkKsMoAVLvBg6sZD7BnyFtf3J54j82qc7oX2soKp8LekzZ
 GUTodQCxLV3fJZleIEwHYu0IpMRE+85OJZJDSC2ZJCFjxErq45D8La/JM/SblXFWCEPv
 t+7CX9W7ehKhEeeWwx7umKehfvMFDAq60kD6hInuungi7C59tCJphqMaAQX0PaLSp5AF
 fEhA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXaEhKSp+aoEj7H/Dx5p6oJZvhuyhAtuJnPWOIXUGQAisBlrYK187sanfdwHEeT2LpZByq20UYybWg5a3zhwIX8IE/cmBYD8fhBahbiS7o9
X-Gm-Message-State: AOJu0YypASl8gKtR97VBHukR/7l/QpnUPHRvgZAclg0QUbPHSmbSeSNS
 Y8pB9+gzhGaugx9/bMMTu0YVbdy1TIOBBlgc5jqP/CsxWt7dcVJrIzQiU9EUCN99a/zi0RXj6d0
 LL0QMec+Swr+T2aD3CxqrtrnZ7LEdP5wsOAp9WdjJcy/VNhqsLzNLKPIN5NaUwoDccQ==
X-Received: by 2002:a2e:be9c:0:b0:2eb:e49c:45df with SMTP id
 38308e7fff4ca-2ec0e5c37c6mr19591761fa.4.1718365125197; 
 Fri, 14 Jun 2024 04:38:45 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFW/xqCushfSofwC96M/qZayEpFYcTReZO+++39mq1ZtAs8mEi0k/SDJZEY4P+1P0fa0ssmYg==
X-Received: by 2002:a2e:be9c:0:b0:2eb:e49c:45df with SMTP id
 38308e7fff4ca-2ec0e5c37c6mr19591101fa.4.1718365122671; 
 Fri, 14 Jun 2024 04:38:42 -0700 (PDT)
Received: from pstanner-thinkpadt14sgen1.remote.csb
 (nat-pool-muc-u.redhat.com. [149.14.88.27])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-360750934a4sm4150696f8f.10.2024.06.14.04.38.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 14 Jun 2024 04:38:42 -0700 (PDT)
Message-ID: <442e5119dc4d2630b34d8cf9228c84b9cfee1717.camel@redhat.com>
Subject: Re: [PATCH v9 00/13] Make PCI's devres API more consistent
From: Philipp Stanner <pstanner@redhat.com>
To: Bjorn Helgaas <helgaas@kernel.org>
Cc: Hans de Goede <hdegoede@redhat.com>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Bjorn Helgaas <bhelgaas@google.com>, Sam
 Ravnborg <sam@ravnborg.org>, dakr@redhat.com, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 linux-pci@vger.kernel.org
Date: Fri, 14 Jun 2024 13:38:41 +0200
In-Reply-To: <20240613215743.GA1085850@bhelgaas>
References: <20240613215743.GA1085850@bhelgaas>
User-Agent: Evolution 3.48.4 (3.48.4-1.fc38)
MIME-Version: 1.0
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, 2024-06-13 at 16:57 -0500, Bjorn Helgaas wrote:
> On Thu, Jun 13, 2024 at 01:50:13PM +0200, Philipp Stanner wrote:
> > Changes in v9:
> > =C2=A0 - Remove forgotten dead code ('enabled' bit in struct pci_dev) i=
n
> > =C2=A0=C2=A0=C2=A0 patch No.8 ("Move pinned status bit...")
> > =C2=A0 - Rework patch No.3:
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 - Change title from "Reimplement plural =
devres functions"
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 to "Add partial-BAR devres s=
upport".
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 - Drop excessive details about the gener=
al cleanup from the
> > commit
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0message. Only motivate =
why this patch's new infrastructure
> > is
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0necessary.
> > =C2=A0 - Fix some minor spelling issues (s/pci/PCI ...)
> >=20
> > Changes in v8:
> > =C2=A0 - Rebase the series on the already merged patches which were
> > slightly
> > =C2=A0=C2=A0=C2=A0 modified by Bjorn Helgaas.
> > =C2=A0 - Reword the pci_intx() commit message so it clearly states it's
> > about
> > =C2=A0=C2=A0=C2=A0 reworking pci_intx().
> > =C2=A0 - Move the removal of find_pci_dr() from patch "Remove legacy
> > =C2=A0=C2=A0=C2=A0 pcim_release()" to patch "Give pci_intx() its own de=
vres
> > callback"
> > =C2=A0=C2=A0=C2=A0 since this later patch already removed all calls to =
that
> > function.
> > =C2=A0 - In patch "Give pci_intx() its own devres callback": use
> > =C2=A0=C2=A0=C2=A0 pci_is_enabled() (and, thus, the enabled_cnt in stru=
ct pci_dev)
> > =C2=A0=C2=A0=C2=A0 instead of a separate enabled field. (Bjorn)
> >=20
> > Changes in v7:
> > =C2=A0 - Split the entire series in smaller, more atomic chunks /
> > patches
> > =C2=A0=C2=A0=C2=A0 (Bjorn)
> > =C2=A0 - Remove functions (such as pcim_iomap_region_range()) that do
> > not yet
> > =C2=A0=C2=A0=C2=A0 have a user (Bjorn)
> > =C2=A0 - Don't export interfaces publicly anymore, except for
> > =C2=A0=C2=A0=C2=A0 pcim_iomap_range(), needed by vboxvideo (Bjorn)
> > =C2=A0 - Mention the actual (vboxvideo) bug in "PCI: Warn users..."
> > commit
> > =C2=A0=C2=A0=C2=A0 (Bjorn)
> > =C2=A0 - Drop docstring warnings on PCI-internal functions (Bjorn)
> > =C2=A0 - Rework docstring warnings
> > =C2=A0 - Fix spelling in a few places. Rewrapp paragraphs (Bjorn)
> >=20
> > Changes in v6:
> > =C2=A0 - Restructure the cleanup in pcim_iomap_regions_request_all() so
> > that
> > =C2=A0=C2=A0=C2=A0 it doesn't trigger a (false positive) test robot war=
ning. No
> > =C2=A0=C2=A0=C2=A0 behavior change intended. (Dan Carpenter)
> >=20
> > Changes in v5:
> > =C2=A0 - Add Hans's Reviewed-by to vboxvideo patch (Hans de Goede)
> > =C2=A0 - Remove stable-kernel from CC in vboxvideo patch (Hans de Goede=
)
> >=20
> > Changes in v4:
> > =C2=A0 - Rebase against linux-next
> >=20
> > Changes in v3:
> > =C2=A0 - Use the term "PCI devres API" at some forgotten places.
> > =C2=A0 - Fix more grammar errors in patch #3.
> > =C2=A0 - Remove the comment advising to call (the outdated) pcim_intx()
> > in pci.c
> > =C2=A0 - Rename __pcim_request_region_range() flags-field "exclusive" t=
o
> > =C2=A0=C2=A0=C2=A0 "req_flags", since this is what the int actually rep=
resents.
> > =C2=A0 - Remove the call to pcim_region_request() from patch #10. (Hans=
)
> >=20
> > Changes in v2:
> > =C2=A0 - Make commit head lines congruent with PCI's style (Bjorn)
> > =C2=A0 - Add missing error checks for devm_add_action(). (Andy)
> > =C2=A0 - Repair the "Returns: " marks for docu generation (Andy)
> > =C2=A0 - Initialize the addr_devres struct with memset(). (Andy)
> > =C2=A0 - Make pcim_intx() a PCI-internal function so that new drivers
> > won't
> > =C2=A0=C2=A0=C2=A0 be encouraged to use the outdated pci_intx() mechani=
sm.
> > =C2=A0=C2=A0=C2=A0 (Andy / Philipp)
> > =C2=A0 - Fix grammar and spelling (Bjorn)
> > =C2=A0 - Be more precise on why pcim_iomap_table() is problematic
> > (Bjorn)
> > =C2=A0 - Provide the actual structs' and functions' names in the commit
> > =C2=A0=C2=A0=C2=A0 messages (Bjorn)
> > =C2=A0 - Remove redundant variable initializers (Andy)
> > =C2=A0 - Regroup PM bitfield members in struct pci_dev (Andy)
> > =C2=A0 - Make pcim_intx() visible only for the PCI subsystem so that
> > new=C2=A0=C2=A0=C2=A0=20
> > =C2=A0=C2=A0=C2=A0 drivers won't use this outdated API (Andy, Myself)
> > =C2=A0 - Add a NOTE to pcim_iomap() to warn about this function being
> > the one
> > =C2=A0=C2=A0=C2=A0 exception that does just return NULL.
> > =C2=A0 - Consistently use the term "PCI devres API"; also in Patch #10
> > (Bjorn)
> >=20
> >=20
> > =C2=A1Hola!
> >=20
> > PCI's devres API suffers several weaknesses:
> >=20
> > 1. There are functions prefixed with pcim_. Those are always
> > managed
> > =C2=A0=C2=A0 counterparts to never-managed functions prefixed with pci_=
 =E2=80=93 or
> > so one
> > =C2=A0=C2=A0 would like to think. There are some apparently unmanaged
> > functions
> > =C2=A0=C2=A0 (all region-request / release functions, and pci_intx()) w=
hich
> > =C2=A0=C2=A0 suddenly become managed once the user has initialized the =
device
> > with
> > =C2=A0=C2=A0 pcim_enable_device() instead of pci_enable_device(). This
> > "sometimes
> > =C2=A0=C2=A0 yes, sometimes no" nature of those functions is confusing =
and
> > =C2=A0=C2=A0 therefore bug-provoking. In fact, it has already caused a =
bug in
> > DRM.
> > =C2=A0=C2=A0 The last patch in this series fixes that bug.
> > 2. iomappings: Instead of giving each mapping its own callback, the
> > =C2=A0=C2=A0 existing API uses a statically allocated struct tracking o=
ne
> > mapping
> > =C2=A0=C2=A0 per bar. This is not extensible. Especially, you can't cre=
ate
> > =C2=A0=C2=A0 _ranged_ managed mappings that way, which many drivers wan=
t.
> > 3. Managed request functions only exist as "plural versions" with a
> > =C2=A0=C2=A0 bit-mask as a parameter. That's quite over-engineered
> > considering
> > =C2=A0=C2=A0 that each user only ever mapps one, maybe two bars.
> >=20
> > This series:
> > - add a set of new "singular" devres functions that use devres the
> > way
> > =C2=A0 its intended, with one callback per resource.
> > - deprecates the existing iomap-table mechanism.
> > - deprecates the hybrid nature of pci_ functions.
> > - preserves backwards compatibility so that drivers using the
> > existing
> > =C2=A0 API won't notice any changes.
> > - adds documentation, especially some warning users about the
> > =C2=A0 complicated nature of PCI's devres.
> >=20
> >=20
> > Note that this series is based on my "unify pci_iounmap"-series
> > from a
> > few weeks ago. [1]
> >=20
> > I tested this on a x86 VM with a simple pci test-device with two
> > regions. Operates and reserves resources as intended on my system.
> > Kasan and kmemleak didn't find any problems.
> >=20
> > I believe this series cleans the API up as much as possible without
> > having to port all existing drivers to the new API. Especially, I
> > think
> > that this implementation is easy to extend if the need for new
> > managed
> > functions arises :)
> >=20
> > Greetings,
> > P.
> >=20
> > Philipp Stanner (13):
> > =C2=A0 PCI: Add and use devres helper for bit masks
> > =C2=A0 PCI: Add devres helpers for iomap table
> > =C2=A0 PCI: Add partial-BAR devres support
> > =C2=A0 PCI: Deprecate two surplus devres functions
> > =C2=A0 PCI: Make devres region requests consistent
> > =C2=A0 PCI: Warn users about complicated devres nature
> > =C2=A0 PCI: Remove enabled status bit from pci_devres
> > =C2=A0 PCI: Move pinned status bit to struct pci_dev
> > =C2=A0 PCI: Give pcim_set_mwi() its own devres callback
> > =C2=A0 PCI: Give pci_intx() its own devres callback
> > =C2=A0 PCI: Remove legacy pcim_release()
> > =C2=A0 PCI: Add pcim_iomap_range()
> > =C2=A0 drm/vboxvideo: fix mapping leaks
> >=20
> > =C2=A0drivers/gpu/drm/vboxvideo/vbox_main.c |=C2=A0 20 +-
> > =C2=A0drivers/pci/devres.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 903 +++++++++++=
++++++++++-
> > ----
> > =C2=A0drivers/pci/iomap.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 16 =
+
> > =C2=A0drivers/pci/pci.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=
=C2=A0 94 ++-
> > =C2=A0drivers/pci/pci.h=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=
=C2=A0 23 +-
> > =C2=A0include/linux/pci.h=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=
=A0 5 +-
> > =C2=A06 files changed, 858 insertions(+), 203 deletions(-)
>=20
> This is on pci/devres with some commit log rework and the following
> diffs.=C2=A0 I think the bar short/int thing is the only actual code
> change.=C2=A0 Happy to squash in any other updates or things I botched.

I looked through your tree and only found the following nit:

In commit "PCI: Remove struct pci_devres.enabled status bit" you
changed the line

"The PCI devres implementation has a separate boolean to track whether
a"

to:

"The pci_devres struct has a separate boolean to track whether a device
is"

In past reviews that has been criticized and I was told to always call
it "struct pci_devres", not the other way around. That's also how it's
put in the following paragraph.

>=20
> Planned for v6.11.

\o/

P.

>=20
> diff --git a/drivers/pci/devres.c b/drivers/pci/devres.c
> index 2f0379a4e58f..d9b78a0d903a 100644
> --- a/drivers/pci/devres.c
> +++ b/drivers/pci/devres.c
> @@ -11,7 +11,7 @@
> =C2=A0 * 1. It is very strongly tied to the statically allocated mapping
> table in
> =C2=A0 *=C2=A0=C2=A0=C2=A0 struct pcim_iomap_devres below. This is mostly=
 solved in the
> sense of the
> =C2=A0 *=C2=A0=C2=A0=C2=A0 pcim_ functions in this file providing things =
like ranged
> mapping by
> - *=C2=A0=C2=A0=C2=A0 bypassing this table, wheras the functions that wer=
e present
> in the old
> + *=C2=A0=C2=A0=C2=A0 bypassing this table, whereas the functions that we=
re present
> in the old
> =C2=A0 *=C2=A0=C2=A0=C2=A0 API still enter the mapping addresses into the=
 table for users
> of the old
> =C2=A0 *=C2=A0=C2=A0=C2=A0 API.
> =C2=A0 *
> @@ -25,10 +25,11 @@
> =C2=A0 *=C2=A0=C2=A0=C2=A0 Consequently, in the new API, region requests =
performed by the
> pcim_
> =C2=A0 *=C2=A0=C2=A0=C2=A0 functions are automatically cleaned up through=
 the devres
> callback
> =C2=A0 *=C2=A0=C2=A0=C2=A0 pcim_addr_resource_release().
> - *=C2=A0=C2=A0=C2=A0 Users utilizing pcim_enable_device() + pci_*region*=
() are
> redirected in
> + *
> + *=C2=A0=C2=A0=C2=A0 Users of pcim_enable_device() + pci_*region*() are =
redirected
> in
> =C2=A0 *=C2=A0=C2=A0=C2=A0 pci.c to the managed functions here in this fi=
le. This isn't
> exactly
> - *=C2=A0=C2=A0=C2=A0 perfect, but the only alternative way would be to p=
ort ALL
> drivers using
> - *=C2=A0=C2=A0=C2=A0 said combination to pcim_ functions.
> + *=C2=A0=C2=A0=C2=A0 perfect, but the only alternative way would be to p=
ort ALL
> drivers
> + *=C2=A0=C2=A0=C2=A0 using said combination to pcim_ functions.
> =C2=A0 *
> =C2=A0 * TODO:
> =C2=A0 * Remove the legacy table entirely once all calls to
> pcim_iomap_table() in
> @@ -42,7 +43,7 @@ struct pcim_iomap_devres {
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0void __iomem *table[PCI_S=
TD_NUM_BARS];
> =C2=A0};
> =C2=A0
> -/* Used to restore the old intx state on driver detach. */
> +/* Used to restore the old INTx state on driver detach. */
> =C2=A0struct pcim_intx_devres {
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0int orig_intx;
> =C2=A0};
> @@ -77,7 +78,7 @@ struct pcim_addr_devres {
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0void __iomem *baseaddr;
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0unsigned long offset;
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0unsigned long len;
> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0short bar;
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0int bar;
> =C2=A0};
> =C2=A0
> =C2=A0static inline void pcim_addr_devres_clear(struct pcim_addr_devres
> *res)
> @@ -108,8 +109,9 @@ static inline void pcim_addr_devres_clear(struct
> pcim_addr_devres *res)
> =C2=A0 * Request a range within a device's PCI BAR.=C2=A0 Sanity check th=
e
> input.
> =C2=A0 */
> =C2=A0static int __pcim_request_region_range(struct pci_dev *pdev, int
> bar,
> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0unsigned long offset, unsigned long maxlen,
> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0const char *name, int req_flags)
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
 unsigned long offset,
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
 unsigned long maxlen,
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
 const char *name, int
> req_flags)
> =C2=A0{
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0resource_size_t start =3D=
 pci_resource_start(pdev, bar);
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0resource_size_t len =3D p=
ci_resource_len(pdev, bar);
> @@ -118,7 +120,7 @@ static int __pcim_request_region_range(struct
> pci_dev *pdev, int bar,
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0if (start =3D=3D 0 || len=
 =3D=3D 0) /* Unused BAR. */
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0return 0;
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0if (len <=3D offset)
> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0return=C2=A0 -EINVAL;
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0return -EINVAL;
> =C2=A0
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0start +=3D offset;
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0len -=3D offset;
> @@ -141,7 +143,8 @@ static int __pcim_request_region_range(struct
> pci_dev *pdev, int bar,
> =C2=A0}
> =C2=A0
> =C2=A0static void __pcim_release_region_range(struct pci_dev *pdev, int
> bar,
> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0unsigned long offset, unsigned long maxlen)
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0unsigned long offset,
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0unsigned long maxlen)
> =C2=A0{
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0resource_size_t start =3D=
 pci_resource_start(pdev, bar);
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0resource_size_t len =3D p=
ci_resource_len(pdev, bar);
> @@ -166,7 +169,7 @@ static void __pcim_release_region_range(struct
> pci_dev *pdev, int bar,
> =C2=A0}
> =C2=A0
> =C2=A0static int __pcim_request_region(struct pci_dev *pdev, int bar,
> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0const char *name, int flags)
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 const char *name, int flags)
> =C2=A0{
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0unsigned long offset =3D =
0;
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0unsigned long len =3D pci=
_resource_len(pdev, bar);
> @@ -208,7 +211,7 @@ static struct pcim_addr_devres
> *pcim_addr_devres_alloc(struct pci_dev *pdev)
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0struct pcim_addr_devres *=
res;
> =C2=A0
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0res =3D devres_alloc_node=
(pcim_addr_resource_release,
> sizeof(*res),
> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0GFP_KERNE=
L, dev_to_node(&pdev->dev));
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0GFP_KERNEL, dev_to_node(&pdev->dev))=
;
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0if (res)
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0pcim_addr_devres_clear(res);
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0return res;
> @@ -223,7 +226,8 @@ static inline void pcim_addr_devres_free(struct
> pcim_addr_devres *res)
> =C2=A0/*
> =C2=A0 * Used by devres to identify a pcim_addr_devres.
> =C2=A0 */
> -static int pcim_addr_resources_match(struct device *dev, void
> *a_raw, void *b_raw)
> +static int pcim_addr_resources_match(struct device *dev,
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 void *a_raw=
, void *b_raw)
> =C2=A0{
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0struct pcim_addr_devres *=
a, *b;
> =C2=A0
> @@ -402,7 +406,6 @@ int pcim_set_mwi(struct pci_dev *pdev)
> =C2=A0}
> =C2=A0EXPORT_SYMBOL(pcim_set_mwi);
> =C2=A0
> -
> =C2=A0static inline bool mask_contains_bar(int mask, int bar)
> =C2=A0{
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0return mask & BIT(bar);
> @@ -438,8 +441,8 @@ static struct pcim_intx_devres
> *get_or_create_intx_devres(struct device *dev)
> =C2=A0 *
> =C2=A0 * Returns: 0 on success, -ENOMEM on error.
> =C2=A0 *
> - * Enables/disables PCI INTx for device @pdev.
> - * Restores the original state on driver detach.
> + * Enable/disable PCI INTx for device @pdev.
> + * Restore the original state on driver detach.
> =C2=A0 */
> =C2=A0int pcim_intx(struct pci_dev *pdev, int enable)
> =C2=A0{
> @@ -492,7 +495,7 @@ int pcim_enable_device(struct pci_dev *pdev)
> =C2=A0
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0/*
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 * We prefer removing the=
 action in case of an error over
> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 * devm_add_action_or_reset() =
because the later could
> theoretically be
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 * devm_add_action_or_reset() =
because the latter could
> theoretically be
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 * disturbed by users hav=
ing pinned the device too soon.
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 */
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0ret =3D pci_enable_device=
(pdev);
> @@ -618,7 +621,7 @@ static void
> pcim_remove_mapping_from_legacy_table(struct pci_dev *pdev,
> =C2=A0 * The same as pcim_remove_mapping_from_legacy_table(), but
> identifies the
> =C2=A0 * mapping by its BAR index.
> =C2=A0 */
> -static void pcim_remove_bar_from_legacy_table(struct pci_dev *pdev,
> short bar)
> +static void pcim_remove_bar_from_legacy_table(struct pci_dev *pdev,
> int bar)
> =C2=A0{
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0void __iomem **legacy_iom=
ap_table;
> =C2=A0
> @@ -783,7 +786,7 @@ static void pcim_iounmap_region(struct pci_dev
> *pdev, int bar)
> =C2=A0int pcim_iomap_regions(struct pci_dev *pdev, int mask, const char
> *name)
> =C2=A0{
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0int ret;
> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0short bar;
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0int bar;
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0void __iomem *mapping;
> =C2=A0
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0for (bar =3D 0; bar < DEV=
ICE_COUNT_RESOURCE; bar++) {
> @@ -813,7 +816,7 @@ int pcim_iomap_regions(struct pci_dev *pdev, int
> mask, const char *name)
> =C2=A0EXPORT_SYMBOL(pcim_iomap_regions);
> =C2=A0
> =C2=A0static int _pcim_request_region(struct pci_dev *pdev, int bar, cons=
t
> char *name,
> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0int request_flags)
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0int request_flags)
> =C2=A0{
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0int ret;
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0struct pcim_addr_devres *=
res;
> @@ -903,7 +906,7 @@ void pcim_release_region(struct pci_dev *pdev,
> int bar)
> =C2=A0 */
> =C2=A0static void pcim_release_all_regions(struct pci_dev *pdev)
> =C2=A0{
> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0short bar;
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0int bar;
> =C2=A0
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0for (bar =3D 0; bar < PCI=
_STD_NUM_BARS; bar++)
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0pcim_release_region(pdev, bar);
> @@ -923,7 +926,7 @@ static void pcim_release_all_regions(struct
> pci_dev *pdev)
> =C2=A0static int pcim_request_all_regions(struct pci_dev *pdev, const cha=
r
> *name)
> =C2=A0{
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0int ret;
> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0short bar;
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0int bar;
> =C2=A0
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0for (bar =3D 0; bar < PCI=
_STD_NUM_BARS; bar++) {
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0ret =3D pcim_request_region(pdev, bar, name);
> @@ -960,7 +963,7 @@ static int pcim_request_all_regions(struct
> pci_dev *pdev, const char *name)
> =C2=A0int pcim_iomap_regions_request_all(struct pci_dev *pdev, int mask,
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 const char *name)
> =C2=A0{
> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0short bar;
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0int bar;
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0int ret;
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0void __iomem **legacy_iom=
ap_table;
> =C2=A0
> @@ -1004,14 +1007,14 @@
> EXPORT_SYMBOL(pcim_iomap_regions_request_all);
> =C2=A0 */
> =C2=A0void pcim_iounmap_regions(struct pci_dev *pdev, int mask)
> =C2=A0{
> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0short bar;
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0int i;
> =C2=A0
> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0for (bar =3D 0; bar < PCI_STD_=
NUM_BARS; bar++) {
> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0if (!mask_contains_bar(mask, bar))
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0for (i =3D 0; i < PCI_STD_NUM_=
BARS; i++) {
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0if (!mask_contains_bar(mask, i))
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0con=
tinue;
> =C2=A0
> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0pcim_iounmap_region(pdev, bar);
> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0pcim_remove_bar_from_legacy_table(pdev, bar);
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0pcim_iounmap_region(pdev, i);
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0pcim_remove_bar_from_legacy_table(pdev, i);
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0}
> =C2=A0}
> =C2=A0EXPORT_SYMBOL(pcim_iounmap_regions);
> diff --git a/drivers/pci/pci.c b/drivers/pci/pci.c
> index 1b4832a60047..807f8be043cd 100644
> --- a/drivers/pci/pci.c
> +++ b/drivers/pci/pci.c
> @@ -4073,6 +4073,11 @@ EXPORT_SYMBOL(pci_release_regions);
> =C2=A0 *
> =C2=A0 * Returns 0 on success, or %EBUSY on error.=C2=A0 A warning
> =C2=A0 * message is also printed on failure.
> + *
> + * NOTE:
> + * This is a "hybrid" function: It's normally unmanaged, but becomes
> managed
> + * when pcim_enable_device() has been called in advance. This hybrid
> feature is
> + * DEPRECATED! If you want managed cleanup, use the pcim_* functions
> instead.
> =C2=A0 */
> =C2=A0int pci_request_regions(struct pci_dev *pdev, const char *res_name)
> =C2=A0{
> @@ -4437,17 +4442,13 @@ void pci_disable_parity(struct pci_dev *dev)
> =C2=A0 * NOTE:
> =C2=A0 * This is a "hybrid" function: It's normally unmanaged, but become=
s
> managed
> =C2=A0 * when pcim_enable_device() has been called in advance. This hybri=
d
> feature is
> - * DEPRECATED!
> + * DEPRECATED! If you want managed cleanup, use pcim_intx() instead.
> =C2=A0 */
> =C2=A0void pci_intx(struct pci_dev *pdev, int enable)
> =C2=A0{
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0u16 pci_command, new;
> =C2=A0
> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0/*
> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 * This is done for backwards =
compatibility, because the old
> PCI devres
> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 * API had a mode in which thi=
s function became managed if
> the dev had
> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 * been enabled with pcim_enab=
le_device() instead of
> pci_enable_device().
> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 */
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0/* Preserve the "hybrid" behav=
ior for backwards compatibility
> */
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0if (pci_is_managed(pdev))=
 {
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0WARN_ON_ONCE(pcim_intx(pdev, enable) !=3D 0);
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0return;
> diff --git a/drivers/pci/pci.h b/drivers/pci/pci.h
> index e51e6fa79fcc..e6d299b93c21 100644
> --- a/drivers/pci/pci.h
> +++ b/drivers/pci/pci.h
> @@ -813,7 +813,8 @@ static inline pci_power_t
> mid_pci_get_power_state(struct pci_dev *pdev)
> =C2=A0int pcim_intx(struct pci_dev *dev, int enable);
> =C2=A0
> =C2=A0int pcim_request_region(struct pci_dev *pdev, int bar, const char
> *name);
> -int pcim_request_region_exclusive(struct pci_dev *pdev, int bar,
> const char *name);
> +int pcim_request_region_exclusive(struct pci_dev *pdev, int bar,
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 const char *name);
> =C2=A0void pcim_release_region(struct pci_dev *pdev, int bar);
> =C2=A0
> =C2=A0/*
>=20

