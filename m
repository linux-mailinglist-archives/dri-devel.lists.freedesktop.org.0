Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3898B4F3ACD
	for <lists+dri-devel@lfdr.de>; Tue,  5 Apr 2022 17:05:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2BA6A10E19A;
	Tue,  5 Apr 2022 15:05:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-4317.proton.ch (mail-4317.proton.ch [185.70.43.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7A6C510E19A
 for <dri-devel@lists.freedesktop.org>; Tue,  5 Apr 2022 15:05:28 +0000 (UTC)
Date: Tue, 05 Apr 2022 15:05:17 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=emersion.fr;
 s=protonmail2; t=1649171125;
 bh=t+hIRZtv/5J72gOq5YhoXVrS/FiYqIfmQiB83JSrhzM=;
 h=Date:To:From:Cc:Reply-To:Subject:Message-ID:In-Reply-To:
 References:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
 Message-ID;
 b=ru1fLrLFoyieVqTtaX1uC01gDuQjSCnK7Ljdh8R2cG0as4M3vxMFjpQAwOaqHjrW7
 kFnCqk1G2nuLsNvZVQqJWP2RyBmiolkuND1Q4BSdDlmtCO3xFSwT60C0Xe8QeBOzwL
 6B78G9ucKB8GMYB9ezsonO3HFyGQF2YUzl7skwJceOlQcYOGX5zuhoQmrgnKL1XFU+
 DeVBOmCBbpFFauC34ukoOlILVXl8mt3fZ4n2PJur0FFm67z1Igl4YFGbHFzm9D4MK8
 iIEJLG5sYsqQttjfEwpRcqquHdxyEXwnsdY34nDXP3WeLho1BxlAQP7NfIyKEXoBOh
 kft73uhSV1RIg==
To: Randy Dunlap <rdunlap@infradead.org>
From: Simon Ser <contact@emersion.fr>
Subject: Re: [PATCH] drm/format_helper: fix a kernel-doc typo
Message-ID: <qjTlHAInyuxpFWsTWPGXoVeByVdVe-NF-kg-FUeLWQbKy9SovMzCcK-eDsijpDt1roaSubDr-8kBGKQSt_7CXFa4-BxQ6SrGSNeoZrdiq-s=@emersion.fr>
In-Reply-To: <c544d79e-90ec-7bbe-77ad-de96a700d711@infradead.org>
References: <20220403232902.1753-1-rdunlap@infradead.org>
 <ttcrpLw9HkdhAH5SkXylXDBi9SBf7LWgOeW09ZvTF4U4_zKJAOXBQZlFxfw6NKY0Hip6dXBFape6zkX09cstuOno72c-c00wmZ_VbNDg6xs=@emersion.fr>
 <b20bbd22-895c-9e74-e579-d2f3561a2fe1@infradead.org>
 <BzpH4s8ZYn84kTlJQ3BHVMQzZlESb2Fk6v-uO5KBaaeBNMvRvC98lpuBLUNLE3a5bdoYTb5JRvo6EU__5AGJ79LUirSppO39I1t1xlwx-fI=@emersion.fr>
 <fda186f7-2cf4-a69a-d68e-58073d35cbea@redhat.com>
 <c544d79e-90ec-7bbe-77ad-de96a700d711@infradead.org>
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

On Tuesday, April 5th, 2022 at 16:39, Randy Dunlap <rdunlap@infradead.org> =
wrote:

> On 4/4/22 23:26, Javier Martinez Canillas wrote:
>
> > On 4/5/22 08:12, Simon Ser wrote:
> >
> > > On Monday, April 4th, 2022 at 23:35, Randy Dunlap rdunlap@infradead.o=
rg wrote:
> > >
> > > > On 4/4/22 09:04, Simon Ser wrote:
> > > >
> > > > > Both doc patches pushed, thanks. I had to manually edit them beca=
use they
> > > > > wouldn't apply cleanly. Next time, please use git-send-email (see
> > > > > https://git-send-email.io/ for setup instructions).
> > > >
> > > > That's odd. I did use 'git send-email' and I don't usually have any
> > > > problems (AFAIK). I'll check those setup instructions.
> > >
> > > Hm, maybe the issue isn't git-send-email, but the way the patch was
> > > generated? I had to manually edit these lines for the first patch to =
work:
> > >
> > > --- linux-next-20211217.orig/include/drm/drm_file.h
> > > +++ linux-next-20211217/include/drm/drm_file.h
> > >
> > > I changed these to:
> > >
> > > --- a/include/drm/drm_file.h
> > > +++ b/include/drm/drm_file.h
> > >
> > > This wasn't enough for the second patch, I had to re-do the changes b=
y hand
> > > from scratch.
> >
> > Yes, I believe the suggestion should be to use git-format-patch instead=
.
> >
> > To make sure that was is posted can be consumed by the git-am command.
>
>
> Considering that I am not using git, I think it will be difficult
> to use git-format-patch.

Ah, okay. Would you consider using Git for you next patches?

(FYI, I'll pass next time I hit a patch which doesn't apply cleanly.
Nothing personal, it's just that I don't have time to deal with broken
patches.)
