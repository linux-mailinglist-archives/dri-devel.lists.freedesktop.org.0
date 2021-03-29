Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2197D34CF3A
	for <lists+dri-devel@lfdr.de>; Mon, 29 Mar 2021 13:41:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3C5F26E19C;
	Mon, 29 Mar 2021 11:41:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from aposti.net (aposti.net [89.234.176.197])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 542BF6E19C
 for <dri-devel@lists.freedesktop.org>; Mon, 29 Mar 2021 11:41:14 +0000 (UTC)
Date: Mon, 29 Mar 2021 12:41:00 +0100
From: Paul Cercueil <paul@crapouillou.net>
Subject: Re: [PATCH] drm: DON'T require each CRTC to have a unique primary
 plane
To: Pekka Paalanen <ppaalanen@gmail.com>
Message-Id: <C4BQQQ.FDNJ4NAK9OAD3@crapouillou.net>
In-Reply-To: <20210329111533.47e44f72@eldfell>
References: <20210327112214.10252-1-paul@crapouillou.net>
 <1J_tcDPSAZW23jPO8ApyzgINcVRRWcNyFP0LvrSFVIMbZB9lH6lCWvh2ByU9rNt6bj6xpgRgv8n0hBKhXAvXNfLBGfTIsvbhYuHW3IIDd7Y=@emersion.fr>
 <24LMQQ.CRNKYEI6GB2T1@crapouillou.net> <20210329111533.47e44f72@eldfell>
MIME-Version: 1.0
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
Cc: David Airlie <airlied@linux.ie>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, od@zcrc.me, stable@vger.kernel.org,
 Thomas Zimmermann <tzimmermann@suse.de>
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="iso-8859-1"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

Le lun. 29 mars 2021 =E0 11:15, Pekka Paalanen <ppaalanen@gmail.com> a =

=E9crit :
> On Sat, 27 Mar 2021 11:26:26 +0000
> Paul Cercueil <paul@crapouillou.net> wrote:
> =

>>  It has two mutually exclusive background planes (same Z level) + one
>>  overlay plane.
> =

> What's the difference between the two background planes?
> =

> How will generic userspace know to pick the "right" one?

First primary plane cannot scale, supports RGB and C8. Second primary =

plane goes through the IPU, and as such can scale and convert pixel =

formats; it supports RGB, non-planar YUV, and multi-planar YUV.

Right now the userspace apps we have will simply pick the first one =

that fits the bill.

Cheers,
-Paul

>>  Le sam. 27 mars 2021 =E0 11:24, Simon Ser <contact@emersion.fr> a =

>> =E9crit
>>  :
>>  > On Saturday, March 27th, 2021 at 12:22 PM, Paul Cercueil
>>  > <paul@crapouillou.net> wrote:
>>  >
>>  >>  The ingenic-drm driver has two mutually exclusive primary planes
>>  >>  already; so the fact that a CRTC must have one and only one =

>> primary
>>  >>  plane is an invalid assumption.
>>  >
>>  > Why does this driver expose two primary planes, if it only has a
>>  > single
>>  > CRTC?
>> =

>> =

>>  _______________________________________________
>>  dri-devel mailing list
>>  dri-devel@lists.freedesktop.org
>>  https://lists.freedesktop.org/mailman/listinfo/dri-devel
> =



_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
