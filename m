Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8126A6A81D5
	for <lists+dri-devel@lfdr.de>; Thu,  2 Mar 2023 13:02:00 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 31DA310E129;
	Thu,  2 Mar 2023 12:01:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-40136.proton.ch (mail-40136.proton.ch [185.70.40.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1AE2110E129
 for <dri-devel@lists.freedesktop.org>; Thu,  2 Mar 2023 12:01:56 +0000 (UTC)
Date: Thu, 02 Mar 2023 12:01:48 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=emersion.fr;
 s=protonmail; t=1677758514; x=1678017714;
 bh=Igz6czKYFjQk78TxKiZBKDfuQsvMIUirFGFifsLTeGk=;
 h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
 Message-ID:BIMI-Selector;
 b=uwBtPn+RtQMXeYieBPFRIsFMQf/tdfFUFx6ugi+1344EVPFmduIK+g14VMWaTUHaT
 Ubrn57po8wW7tY5v25jsS2PYJ849vwJ2fThtXYjMZU21tmX/41SchBi2M7q/7jnfw8
 /fwJv6CgKXg13b30+BM45o2jqg9vzzDoMIYXYPGAdcnwFyK+SCJPcFwTf3FoqtY1VC
 cal7m9sFc/nWmR9VPXAeg4zysNVEfL44w21NGtjSkvX2XNV2OTBeJ25I6Mh8UXkc38
 fQD39c/GgIwwkYoMmizk+Z6wZgI0m8DFKAo3Odq2lT36PZgEUF044f8bVo1CnhhdpG
 2BdR3nk5IJsaw==
To: Peter Stuge <peter@stuge.se>
From: Simon Ser <contact@emersion.fr>
Subject: Re: gud: set PATH connector property
Message-ID: <wuQMYhnV3GpWUX4DNccEvVlJspHv8B5GO_KUwDOd-Dp4Mj3yED93_ICPoPafUQuKjSgUSZYDSRenzpVmwu9ZuzK4G4NpkdYm_NtM2E83wMY=@emersion.fr>
In-Reply-To: <20230228151654.6175.qmail@stuge.se>
References: <l85gVq-EKaN9dzH4I8FXxv-4FyPkLSh7R5SgmqwFuh-oBtzFXFfvK8VVnTdvWpKBDITXvGrnMM0VijQoUkXeWCMMaFb4GSYpaUcmXm2fvlM=@emersion.fr>
 <20230228123134.1311.qmail@stuge.se>
 <Rg-l1BDgSgbo04Mgca01xzLlg0MjL1P9SxE2GvPPQbOlkMLH1AtqvZ6zj6DItsDBfSIkScUbK4YIctzF57Y5Diinb99sXLqlgCCsAOEjNTc=@emersion.fr>
 <20230228151654.6175.qmail@stuge.se>
Feedback-ID: 1358184:user:proton
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
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
Cc: =?utf-8?Q?Noralf_Tr=C3=B8nnes?= <noralf@tronnes.org>,
 DRI Development <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tuesday, February 28th, 2023 at 16:16, Peter Stuge <peter@stuge.se> wrot=
e:

> Simon Ser wrote:
>=20
> > > > Would it be possible to set the PATH connector property based on th=
e
> > > > USB port used by gud?
> > >=20
> > > Sadly not really easily.
> > >=20
> > > The physical topology underneath each host controller is stable but
> > > bus numbers (usb1, usb2 etc.) are not.
> >=20
> > Oh, that's news to me. So if I unplug and replug a USB device, the bus
> > number and bus device number might change?
>=20
> The bus number is stable as long as the bus (host controller) exists.
>=20
> > Or does this happen after a power-cycle? Or is this hardware-specific?
>=20
> Consider a host controller on a plug-in card, like ExpressCard (usb1)
> and perhaps Thunderbolt (usb2) for a more modern example.
>=20
> The bus on each new host controller gets the next available bus number.
>=20
> Plug ExpressCard before Thunderbolt to get the order above. Unplug
> both (usb1+usb2 disappear) then plug Thunderbolt back in before
> ExpressCard; now Thunderbolt is usb1 and ExpressCard usb2.

Hm, right. With a first-come-first-served scheme, there is no way to
have stable identifiers.

I'm having a look at prior art: udev has similar needs for network
interface names. For USB they use [2] a scheme with
port/config/interface. I have no idea what meaning these have, but
would they be useful for building a PATH KMS property?

[1]: https://www.freedesktop.org/software/systemd/man/systemd.net-naming-sc=
heme.html
[2]: https://github.com/systemd/systemd/blob/7a67afe33192ce4a55e6825b80554f=
b4ebbb4b03/src/udev/udev-builtin-net_id.c#L758

> > > For onboard host controllers it could be possible to anchor to a
> > > PCI or platform bus device.
> >=20
> > But the PCI bus device isn't enough I think? If I have a onboard host
> > controller with 2 physical USB ports, the PCI bus device isn't enough
> > to tell these 2 physical ports apart?
>=20
> Only the PCI bus device is not enough, but it could serve as a
> unique anchor and some host controller-specific information (e.g.
> root port number) can be added to that.
>=20
> > > How about using e.g. the serial number of the gud USB device instead
> > > of host topology, or maybe some other information from the panel
> > > behind it?
> >=20
> > The PATH property is really about the port path, not the sink. IOW, if
> > I have two USB displays, one USB port, and switch between the two
> > displays on this one port, the PATH property isn't supposed to change.
> =20
> Hmm. What is "port path" supposed to mean across a hot-pluggable bus?
>=20
> Should PATH refer to the one ExpressCard host controller if it moves
> between slots (assuming a computer with two slots) or should it
> rather refer to "the upper USB port on the right hand side ExpressCard"
> so I can insert another brand host controller in that slot without
> PATH changing?

I think the latter makes most sense. I'll try to send a patch to improve
the PATH property docs.
