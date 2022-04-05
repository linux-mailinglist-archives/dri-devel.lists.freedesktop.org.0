Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F3374F3D3A
	for <lists+dri-devel@lfdr.de>; Tue,  5 Apr 2022 20:47:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 55D3410ECEF;
	Tue,  5 Apr 2022 18:47:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-40136.proton.ch (mail-40136.proton.ch [185.70.40.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 46D6910EDB2
 for <dri-devel@lists.freedesktop.org>; Tue,  5 Apr 2022 18:47:27 +0000 (UTC)
Date: Tue, 05 Apr 2022 18:47:18 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=emersion.fr;
 s=protonmail2; t=1649184444;
 bh=6L7of7E65q5vQ0xJuzAPP6lQLWnoa62rv326Zeq7oBE=;
 h=Date:To:From:Cc:Reply-To:Subject:Message-ID:In-Reply-To:
 References:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
 Message-ID;
 b=KdHa2vRhNncdcL+Grh0IW4V36ZjCWa9g5K5OVecpSk8yBGpAzab9lUCP75WD595+K
 Mns4tUPc2lXW1NNXsWgUzH91B/ZJoPrGR5Hr4aaczoOIHx7vTpssUyjLclg4F3P1qR
 Tfn23CSXNo5FXoJpAy8F06pbzG0pZpHbq4jMZYiOcKH+wqTfYF/FVGAcYEW3fWvx8U
 sM02+Eum/DgcOk2Adr3KFpoKbcHbeAXNxTWllASGymc8jaWzW6g+lZh6J0k53hnkDx
 HQWfobpsTqdumW68eBjtxSXrFzKpN5ue2Gj91FrelSKULCng7RCQoK5hOu1bj4ZSnz
 8YUtXiqdB1dhw==
To: Randy Dunlap <rdunlap@infradead.org>
From: Simon Ser <contact@emersion.fr>
Subject: Re: [PATCH] drm/format_helper: fix a kernel-doc typo
Message-ID: <zO0fTUWc0nKMy-cwUaONpM1AHlfPoNe77IooCuHLEYiowkM165XiiuM2JGASUQrOFcvNMVSGUwETeF7JAIf40r84dwNvh_Gl1MF_ZXYOHWE=@emersion.fr>
In-Reply-To: <c336dd9d-dae2-f654-4849-669c9b9b568f@infradead.org>
References: <20220403232902.1753-1-rdunlap@infradead.org>
 <ttcrpLw9HkdhAH5SkXylXDBi9SBf7LWgOeW09ZvTF4U4_zKJAOXBQZlFxfw6NKY0Hip6dXBFape6zkX09cstuOno72c-c00wmZ_VbNDg6xs=@emersion.fr>
 <b20bbd22-895c-9e74-e579-d2f3561a2fe1@infradead.org>
 <BzpH4s8ZYn84kTlJQ3BHVMQzZlESb2Fk6v-uO5KBaaeBNMvRvC98lpuBLUNLE3a5bdoYTb5JRvo6EU__5AGJ79LUirSppO39I1t1xlwx-fI=@emersion.fr>
 <fda186f7-2cf4-a69a-d68e-58073d35cbea@redhat.com>
 <c544d79e-90ec-7bbe-77ad-de96a700d711@infradead.org>
 <qjTlHAInyuxpFWsTWPGXoVeByVdVe-NF-kg-FUeLWQbKy9SovMzCcK-eDsijpDt1roaSubDr-8kBGKQSt_7CXFa4-BxQ6SrGSNeoZrdiq-s=@emersion.fr>
 <c336dd9d-dae2-f654-4849-669c9b9b568f@infradead.org>
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
Cc: David Airlie <airlied@linux.ie>, dri-devel@lists.freedesktop.org,
 Javier Martinez Canillas <javierm@redhat.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tuesday, April 5th, 2022 at 19:58, Randy Dunlap <rdunlap@infradead.org> =
wrote:

> On 4/5/22 08:05, Simon Ser wrote:
>
> > On Tuesday, April 5th, 2022 at 16:39, Randy Dunlap rdunlap@infradead.or=
g wrote:
> >
> > > On 4/4/22 23:26, Javier Martinez Canillas wrote:
> > >
> > > > On 4/5/22 08:12, Simon Ser wrote:
> > > >
> > > > > On Monday, April 4th, 2022 at 23:35, Randy Dunlap rdunlap@infrade=
ad.org wrote:
> > > > >
> > > > > > On 4/4/22 09:04, Simon Ser wrote:
> > > > > >
> > > > > > > Both doc patches pushed, thanks. I had to manually edit them =
because they
> > > > > > > wouldn't apply cleanly. Next time, please use git-send-email =
(see
> > > > > > > https://git-send-email.io/ for setup instructions).
> > > > > >
> > > > > > That's odd. I did use 'git send-email' and I don't usually have=
 any
> > > > > > problems (AFAIK). I'll check those setup instructions.
> > > > >
> > > > > Hm, maybe the issue isn't git-send-email, but the way the patch w=
as
> > > > > generated? I had to manually edit these lines for the first patch=
 to work:
> > > > >
> > > > > --- linux-next-20211217.orig/include/drm/drm_file.h
> > > > > +++ linux-next-20211217/include/drm/drm_file.h
> > > > >
> > > > > I changed these to:
> > > > >
> > > > > --- a/include/drm/drm_file.h
> > > > > +++ b/include/drm/drm_file.h
>
>
> quilt (which I am using) can generate a/ b/ patches instead of linux.orig=
/ and
> linux/ patches.
>
> > > > > This wasn't enough for the second patch, I had to re-do the chang=
es by hand
> > > > > from scratch.
>
>
> I would like more information about this one if it's not too much trouble
> for you.

IIRC it was the usual git-am error "fatal: sha1 information is lacking
or useless". Maybe you wrote the patch for an old tree and drm-misc-next
contained changes near the lines you changed? Maybe providing base-commit
information in the patch would've helped? I'm not sure.
