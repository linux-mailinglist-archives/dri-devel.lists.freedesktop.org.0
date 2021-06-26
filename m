Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B3E3D3B4BAE
	for <lists+dri-devel@lfdr.de>; Sat, 26 Jun 2021 02:46:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C2FA76E9A9;
	Sat, 26 Jun 2021 00:46:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk
 [IPv6:2a00:1098:0:82:1000:25:2eeb:e3e3])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 02FDB6E9A9
 for <dri-devel@lists.freedesktop.org>; Sat, 26 Jun 2021 00:46:23 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: ezequiel) with ESMTPSA id A5A4C1F40F21
Message-ID: <c882d9c4f9eacd9d0f82e6e4ce3b33c383087d8c.camel@collabora.com>
Subject: Re: [PATCH 09/12] media: hantro: Enable H.264 on Rockchip VDPU2
From: Ezequiel Garcia <ezequiel@collabora.com>
To: Alex Bee <knaerzche@gmail.com>, linux-media@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, Nicolas Dufresne
 <nicolas.dufresne@collabora.com>
Date: Fri, 25 Jun 2021 21:46:10 -0300
In-Reply-To: <2ae869f3-7f3a-f184-93cc-61fca0f9022f@gmail.com>
References: <20210624182612.177969-1-ezequiel@collabora.com>
 <20210624182612.177969-10-ezequiel@collabora.com>
 <2ae869f3-7f3a-f184-93cc-61fca0f9022f@gmail.com>
Organization: Collabora
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.38.2-1 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
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
Cc: Paul Kocialkowski <paul.kocialkowski@bootlin.com>,
 Jernej Skrabec <jernej.skrabec@siol.net>, Jonas Karlman <jonas@kwiboo.se>,
 David Airlie <airlied@linux.ie>, Hans Verkuil <hverkuil@xs4all.nl>,
 Thierry Reding <thierry.reding@gmail.com>, kernel@collabora.com,
 Sam Ravnborg <sam@ravnborg.org>, Chris Healy <cphealy@gmail.com>,
 maccraft123mc@gmail.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

(Adding Nicolas)

Hi Alex,

On Fri, 2021-06-25 at 01:13 +0200, Alex Bee wrote:
> Hi Ezequiel,
> 
> Am 24.06.21 um 20:26 schrieb Ezequiel Garcia:
> > Given H.264 support for VDPU2 was just added, let's enable it.
> > For now, this is only enabled on platform that don't have
> > an RKVDEC core, such as RK3328.
> 
> Is there any reason, you do not want to enabe H.264 on RK3399? I know 
> H.264 can be done by by rkvdec already, but from what I understand that 
> shouldn't be an issue: The first decoder found that meets the 
> requirements will be taken.
> 

Thanks a lot the review.

I really doubt userspace stacks are readily supporting that strategy.

The first decoder device supporting the codec format will be selected,
I doubt features such as profile and levels are checked to decide
which decoder to use.

I'd rather play safe on the kernel side and avoid offering
two competing devices for the same codec.

Kindly,
Ezequiel

