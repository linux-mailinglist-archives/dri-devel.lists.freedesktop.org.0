Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E46998355A3
	for <lists+dri-devel@lfdr.de>; Sun, 21 Jan 2024 13:23:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3321789CC4;
	Sun, 21 Jan 2024 12:23:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 393 seconds by postgrey-1.36 at gabe;
 Sun, 21 Jan 2024 11:49:20 UTC
Received: from forward501b.mail.yandex.net (forward501b.mail.yandex.net
 [178.154.239.145])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3F24110E19D;
 Sun, 21 Jan 2024 11:49:20 +0000 (UTC)
Received: from mail-nwsmtp-smtp-production-main-23.myt.yp-c.yandex.net
 (mail-nwsmtp-smtp-production-main-23.myt.yp-c.yandex.net
 [IPv6:2a02:6b8:c12:3e12:0:640:17da:0])
 by forward501b.mail.yandex.net (Yandex) with ESMTP id DDF4360D66;
 Sun, 21 Jan 2024 14:42:04 +0300 (MSK)
Received: by mail-nwsmtp-smtp-production-main-23.myt.yp-c.yandex.net
 (smtp/Yandex) with ESMTPSA id 3gOTgEDOjuQ0-jJX27bQz; 
 Sun, 21 Jan 2024 14:42:04 +0300
X-Yandex-Fwd: 1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yandex.ru; s=mail;
 t=1705837324; bh=y5458s/X8yR8F47Fjf1tqfrHWWcL9b/6ztzQ8ic8dMc=;
 h=In-Reply-To:Cc:References:To:From:Date:Subject:Message-ID;
 b=YkCZs+HmmNz3b3iGHyAZcLnbL/iBcTXYb58LBA5TbsP45VxpPG1J7KVxWEwqHt7E1
 MI29DAXojEnky6KHQ9iyMMlIk+YgCfTIhDQNVCJLSOuXSEcq7zUrOe/YVwWEv9zv9H
 rJwEnMYHc3mTvnUDd5N2tIuAviT5y5Dk04miwcyk=
Authentication-Results: mail-nwsmtp-smtp-production-main-23.myt.yp-c.yandex.net;
 dkim=pass header.i=@yandex.ru
Message-ID: <ba86e699db5598acd83ce4916585d902688fe29b.camel@yandex.ru>
Subject: Re: Mesa >= 23.3.x and python 3.6 (was a typo 2.6)
 =?UTF-8?Q?=E2=80=A6?=
From: Konstantin Kharlamov <Hi-Angel@yandex.ru>
To: Stefan Dirsch <sndirsch@suse.com>, Matt Turner <mattst88@gmail.com>
Date: Sun, 21 Jan 2024 14:42:03 +0300
In-Reply-To: <20240119193253.ththa6dvqcz5gcth@suse.de>
References: <20240118123752.bl3qss3qbbxgvpdk@suse.de>
 <CAEdQ38GM63O2Y=1UR9wX0PTTGyZuZiT1NZyaVwSfnFuG8eoqFw@mail.gmail.com>
 <20240119193253.ththa6dvqcz5gcth@suse.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.50.3 
MIME-Version: 1.0
X-Mailman-Approved-At: Sun, 21 Jan 2024 12:23:03 +0000
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
Cc: mesa-dev@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, 2024-01-19 at 20:32 +0100, Stefan Dirsch wrote:
> On Fri, Jan 19, 2024 at 12:35:58PM -0500, Matt Turner wrote:
> > On Thu, Jan 18, 2024 at 10:22=E2=80=AFAM Stefan Dirsch <sndirsch@suse.c=
om>
> > wrote:
> > > I noticed that with version 23.3.x Mesa no longer can be built
> > > with python
> > > 2.6. It still worked with Mesa 23.2.1.
> >=20
> > For anyone who got this far and was completely incredulous... this
> > (and the subject) is typo'd -- the problem is about Python 3.6, not
> > 2.6.
>=20
> I'm pretty sure you were the first and only one. :-( I've corrected
> it in the
> body by doing a reply to my own message, but how do I correct a typo
> in the
> subject ... I'll try to send the message again with also the correct
> subject. Then I'll be blamed for bringing up the same topic twice and
> spamming
> the list. Sigh.

Don't worry, just fix the title while replying. You can also add
something like "(was a typo 2.6)" as I just did in this email, so that
people who read by thread would be aware this isn't about python2 =F0=9F=98=
=8A
