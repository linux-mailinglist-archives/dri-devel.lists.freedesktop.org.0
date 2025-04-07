Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B188A7EE89
	for <lists+dri-devel@lfdr.de>; Mon,  7 Apr 2025 22:09:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E603C10E55C;
	Mon,  7 Apr 2025 20:09:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=infradead.org header.i=@infradead.org header.b="ICOw4FTn";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A1F3F10E55C;
 Mon,  7 Apr 2025 20:09:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
 :MIME-Version:Message-ID:References:In-Reply-To:Subject:To:From:Date:Sender:
 Reply-To:Cc:Content-ID:Content-Description;
 bh=nwYn9nVWEAL7xQ3HaDaQiXQcSLpnZYjP7Z2xXj+3I+U=; b=ICOw4FTnS6zWysfveKufWcBU53
 GRbwN/RDGYlOw9edZNxNRwu6yestLYwD7PJxV7DQiWD7Mrk/Zve2vJcSt7+BBZFPwmhi1YOyq7Xlk
 9UaJfDDkyU+zpAD55unTeCcSRsZTRwdb9CMLW1H02R1e4INiPOVNkujBncuad+qDxuuGcwmbG5Pa3
 9BnMh5B/OzJFLeECuqSLM0/5mVRdcHjXrYVuiG8EBY7/+xc4DHUuzJQZU6EJpWwMcB3Bf3zyGf/FP
 CRMCpihQJgK3vpIdPHoGPXUbnUuqGDjg296DOw9JT9xhD7I/A4e9sYC4Uh7unHBFGLTnvpB43p1ZB
 rzNAIsfw==;
Received: from [2001:8b0:10b:5:fffc:f342:c6b:892] (helo=[IPv6:::1])
 by desiato.infradead.org with esmtpsa (Exim 4.98.1 #2 (Red Hat Linux))
 id 1u1smH-000000088zV-3OIT; Mon, 07 Apr 2025 20:09:06 +0000
Date: Mon, 07 Apr 2025 21:09:06 +0100
From: David Woodhouse <dwmw2@infradead.org>
To: Timur Tabi <ttabi@nvidia.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "nouveau@lists.freedesktop.org" <nouveau@lists.freedesktop.org>,
 Ben Skeggs <bskeggs@nvidia.com>
Subject: =?US-ASCII?Q?Re=3A_=5B6=2E13=2E6_stable_regression=3F=5D_Nouvea?=
 =?US-ASCII?Q?u_reboot_failure_in_r535=5Fgsp=5Fmsg=5Frecv=28=29?=
User-Agent: K-9 Mail for Android
In-Reply-To: <83204f028c1fb0b2e36812b79cedd438966b4c6f.camel@nvidia.com>
References: <69997152cb8688a63b50fd8d3f189cc0e2668225.camel@infradead.org>
 <71e3db014ae5bf84048313197ec08abb271ce757.camel@nvidia.com>
 <5a0a20cddbc13d3f9eb96067491034a22830620e.camel@infradead.org>
 <9890af80b576c61bd503134c13ee866a105a89fa.camel@nvidia.com>
 <7acb91aac7e7e720e735b5271e4938f866a476ac.camel@nvidia.com>
 <b26d088c043a83aecff243a9d08457f77381b5f0.camel@infradead.org>
 <b3632ad6a6f8f4848ee70583286f72668406e10e.camel@nvidia.com>
 <bf00be734d5311b703a3d9eb491b345f64ea8092.camel@infradead.org>
 <83204f028c1fb0b2e36812b79cedd438966b4c6f.camel@nvidia.com>
Message-ID: <5B682A0A-C81D-47F4-A0A2-BA81A6281413@infradead.org>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-SRS-Rewrite: SMTP reverse-path rewritten from <dwmw2@infradead.org> by
 desiato.infradead.org. See http://www.infradead.org/rpr.html
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

On 7 April 2025 20:51:50 BST, Timur Tabi <ttabi@nvidia=2Ecom> wrote:
>On Mon, 2025-04-07 at 20:41 +0100, David Woodhouse wrote:
>> Yes=2E The proprietary driver (570=2E133=2E07) did manage to light up t=
he
>> external monitor over USB-C/DP=2E
>>=20
>> It was utterly unusable, as I couldn't make it do 100% scaling on the
>> external screen and 200% on the high-DPI laptop screen, and my attempts
>> to do so (just using the GNOME control panel) ended up with weird
>> effects and wrong scaling and the mouse pointer not really taking
>> effect in the place I thought it was pointing=2E=2E=2E but setting that
>> aside, yes=2E The display *did* light up=2E
>
>I don't know anything about capabilities of our driver w=2Er=2Et=2E scali=
ng, but
>what happens if you try to keep everything at 100%?
>
>It's possible what you're trying to do is just not supported by GNOME,
>Wayland, Xorg, and/or our driver=2E =20
>
>> > If the proprietary driver works just fine, then we know that it's a
>> > bug/limitation in how Nouveau talks to GSP-RM=2E=C2=A0 One of the Nou=
veau devs
>> > can
>> > help with that=2E
>>=20
>> Is the first step there to try beta testing the r570 update?
>
>So here's the problem=2E  If the proprietary driver doesn't work, then th=
ere's
>no hope for Nouveau working=2E =C2=A0That's because the GSP-RM firmware t=
hat
>Nouveau depends on *is* the Nvidia proprietary driver=2E
>
>I hate to say this, but you're going to have to work with your laptop ven=
dor
>and/or Nvidia support to get the proprietary driver working first=2E

It *was* working, as long as I could tolerate it being scaled to 200% like=
 the internal display=2E It *did* light up the external display just fine=
=2E

