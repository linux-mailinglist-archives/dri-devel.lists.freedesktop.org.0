Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 89CD15466E1
	for <lists+dri-devel@lfdr.de>; Fri, 10 Jun 2022 14:53:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 01BC689E5F;
	Fri, 10 Jun 2022 12:53:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-4317.proton.ch (mail-4317.proton.ch [185.70.43.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 88D2C10EB8A
 for <dri-devel@lists.freedesktop.org>; Fri, 10 Jun 2022 12:53:29 +0000 (UTC)
Date: Fri, 10 Jun 2022 12:53:22 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=emersion.fr;
 s=protonmail2; t=1654865607; x=1655124807;
 bh=bQyakDdHtu/mu7qge4S2DS96HIDwGQmpubPsiCuCsBA=;
 h=Date:To:From:Cc:Reply-To:Subject:Message-ID:In-Reply-To:
 References:Feedback-ID:From:To:Cc:Date:Subject:Reply-To:
 Feedback-ID:Message-ID;
 b=m2F7WG6NHsB2hTArqcHjc4aiJh0EJl8nWYvOV9iBed9j44E9e+CQ/gqwD62HlFfTd
 jKRDEh/jxSnyasDmA0jlnA0yHMxI3pZmvpB48CcqGyzS08h+KSZEWZHYOJXAIYDUp6
 KzPVHwYrlBuhuXp6FvMXszcn9EbuhUhJqtBQ9OrajwrsEujjrGgELcgxxNPNmOZphP
 IQEElGBoMkZ95Y/fckbmpARiwdTqHCwsFAqZ5+5E4kWigSPi1so/SshB701lSV74lo
 bXy3dbEsC94gMXNmsUVdtvRezIG9vvKYzn9dCEpZRWO06uE+FiRGUbCXggSC9XbyFT
 r/zAb6+/ZnNfg==
To: Gerd Hoffmann <kraxel@redhat.com>
From: Simon Ser <contact@emersion.fr>
Subject: Re: [PATCH 0/6] drm: Add mouse cursor hotspot support to atomic KMS
Message-ID: <_D4uOTfLqaVCoV94kNfeXYvOph3EjOL80mbzeJNHm1EPqranCclhnAjS2dj40X32-wE8Nux_QM-m-LBXHSHLkXu0P5oypBYLLK3_MWK4STg=@emersion.fr>
In-Reply-To: <20220610123629.fgu2em3fto53fpfy@sirius.home.kraxel.org>
References: <20220602154243.1015688-1-zack@kde.org>
 <wRnf-Lm5zz6v1e-NlnFPteyARuLl-R98mOZZVjePHD5ue7QQNR_TSU7RwYBssgUa7xM5hf7Fe59-gMEj81ESrHY3mu_H7yE0dtGhFHFPTnc=@emersion.fr>
 <YqMDoSMOL2rsfJj/@phenom.ffwll.local>
 <lcIVipq8mkBAPioQAVQmwsM_Gwo0e9fd2334yGSvIW6uEIEElwUrTe-x9J9h29TB1H3NY3liNCohaXDyjslDFIqxPZNSPbSPJ3vctA2jEAk=@emersion.fr>
 <YqMTk9C8/g1buL+8@phenom.ffwll.local>
 <20220610123629.fgu2em3fto53fpfy@sirius.home.kraxel.org>
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
Reply-To: Simon Ser <contact@emersion.fr>
Cc: Thomas Zimmermann <tzimmermann@suse.de>,
 Hans de Goede <hdegoede@redhat.com>, David Airlie <airlied@linux.ie>,
 dri-devel@lists.freedesktop.org, Gurchetan Singh <gurchetansingh@chromium.org>,
 krastevm@vmware.com, Pekka Paalanen <ppaalanen@gmail.com>,
 mombasawalam@vmware.com, wayland-devel <wayland-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Friday, June 10th, 2022 at 14:36, Gerd Hoffmann <kraxel@redhat.com> wrot=
e:

> Hi,
>
> > > As Pekka mentionned, I'd also like to have a conversation of how far =
we want to
> > > push virtualized driver features. I think KMS support is a good featu=
re to have
> > > to spin up a VM and have all of the basics working. However I don't t=
hink it's
> > > a good idea to try to plumb an ever-growing list of fancy features
> > > (seamless integration of guest windows into the host, HiDPI, multi-mo=
nitor,
> > > etc) into KMS. You'd just end up re-inventing Wayland or RDP on top o=
f KMS.
> > > Instead of re-inventing these, just use RDP or waypipe or X11 forward=
ing
> > > directly.
>
> > > So I think we need to draw a line somewhere, and decide e.g. that vir=
tualized
> > > cursors are fine to add in KMS, but HiDPI is not.
>
>
> What is the problem with HiDPI? qemu generates standard edid blobs,
> there should be no need to special-case virtualized drivers in any way.
>
> What is the problem with multi-monitor? That isn't much different than
> physical multi-monitor either.
>
> One little thing though: On physical hardware you just don't know which
> monitor is left and which is right until the user tells you. In case of
> a virtual multi-monitor setup we know how the two windows for the two
> virtual monitors are arranged on the host and can pass that as hint to
> the guest (not sure whenever that is the purpose of the
> suggested_{x,y} properties).

The problem with suggested_x/y is described here:
https://lore.kernel.org/dri-devel/20220610123629.fgu2em3fto53fpfy@sirius.ho=
me.kraxel.org/T/#m119cfbbf736e43831c3105f0c91bd790da2d58fb

HiDPI would need a way to propagate the scale factor back-and-forth:
the VM viewer needs to advertise the preferred scale to the guest
compositor, and the guest compositor needs to indicate the scale it
renders with to the VM viewer.

Sounds familiar? Yup, that's exactly the Wayland protocol. Do we really
want to replicate the Wayland protocol in KMS? I'm not so sure.

> > It's getting a bit far off-topic, but google cros team has an out-of-tr=
ee
> > (at least I think it's not merged yet) wayland-virtio driver for exactl=
y
> > this use-case. Trying to move towards something like that for fancy
> > virtualized setups sounds like the better approach indeed, with kms jus=
t
> > as the bare-bones fallback option.
>
> virtio-gpu got the ability to attach uuids to objects, to allow them
> being identified on the host side. So it could be that wayland-virtio
> still uses kms for framebuffers (disclaimer: don't know how
> wayland-virtio works in detail). But, yes, all the scanout + cursor
> handling would be out of the way, virtio-gpu would "only" handle fast
> buffer sharing.

wayland-virtio is not used with KMS. wayland-virtio proxies the Wayland
protocol between the host and the guest, so the guest doesn't use KMS
in that case.
