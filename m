Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5908C3B720F
	for <lists+dri-devel@lfdr.de>; Tue, 29 Jun 2021 14:29:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C803289762;
	Tue, 29 Jun 2021 12:28:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk
 [IPv6:2a00:1098:0:82:1000:25:2eeb:e3e3])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7687289762
 for <dri-devel@lists.freedesktop.org>; Tue, 29 Jun 2021 12:28:56 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: ezequiel) with ESMTPSA id 9049A1F42F46
Message-ID: <454371a3c93cf2fccad868fee431124429837f18.camel@collabora.com>
Subject: Re: [PATCH 09/12] media: hantro: Enable H.264 on Rockchip VDPU2
From: Ezequiel Garcia <ezequiel@collabora.com>
To: Alex Bee <knaerzche@gmail.com>, linux-media@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, Nicolas Dufresne
 <nicolas.dufresne@collabora.com>
Date: Tue, 29 Jun 2021 09:28:44 -0300
In-Reply-To: <1979d843-129a-8b48-2926-0f50157974ec@gmail.com>
References: <20210624182612.177969-1-ezequiel@collabora.com>
 <20210624182612.177969-10-ezequiel@collabora.com>
 <2ae869f3-7f3a-f184-93cc-61fca0f9022f@gmail.com>
 <c882d9c4f9eacd9d0f82e6e4ce3b33c383087d8c.camel@collabora.com>
 <1979d843-129a-8b48-2926-0f50157974ec@gmail.com>
Organization: Collabora
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.38.3-1 
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

Hi Alex,

On Sat, 2021-06-26 at 10:33 +0200, Alex Bee wrote:
> Hi Ezequiel,
> 
> Am 26.06.21 um 02:46 schrieb Ezequiel Garcia:
> > (Adding Nicolas)
> > 
> > Hi Alex,
> > 
> > On Fri, 2021-06-25 at 01:13 +0200, Alex Bee wrote:
> > > Hi Ezequiel,
> > > 
> > > Am 24.06.21 um 20:26 schrieb Ezequiel Garcia:
> > > > Given H.264 support for VDPU2 was just added, let's enable it.
> > > > For now, this is only enabled on platform that don't have
> > > > an RKVDEC core, such as RK3328.
> > > Is there any reason, you do not want to enabe H.264 on RK3399? I know
> > > H.264 can be done by by rkvdec already, but from what I understand that
> > > shouldn't be an issue: The first decoder found that meets the
> > > requirements will be taken.
> > > 
> > Thanks a lot the review.
> > 
> > I really doubt userspace stacks are readily supporting that strategy.
> > 
> > The first decoder device supporting the codec format will be selected,
> > I doubt features such as profile and levels are checked to decide
> > which decoder to use.
> > 
> > I'd rather play safe on the kernel side and avoid offering
> > two competing devices for the same codec.
> 
> I wasn't aware of that. Current ffmpeg v4l2_request implementation seems 
> to not do VIDIOC_ENUM_FRAMESIZES - so we might end up being able to 
> decode up to 1920x1088 only if hantro decoder is picked/checked first.
> 

Speaking of ffmpeg, now that MPEG-2, VP8 and H.264 control interfaces
are stable, I think one of the next priorities would be to push Jonas'
ffmpeg patches.

It would be really cool if someone could take the lead on that front,
as it would reduce kodi's out of tree stack, enable mpv, and so on.
-- 
Kindly,
Ezequiel

