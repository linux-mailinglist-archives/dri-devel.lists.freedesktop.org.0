Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 868C118B0BB
	for <lists+dri-devel@lfdr.de>; Thu, 19 Mar 2020 11:01:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 86C076E9D1;
	Thu, 19 Mar 2020 10:01:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail1.protonmail.ch (mail1.protonmail.ch [185.70.40.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 31CE06E9D1
 for <dri-devel@lists.freedesktop.org>; Thu, 19 Mar 2020 10:01:03 +0000 (UTC)
Date: Thu, 19 Mar 2020 10:00:54 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=emersion.fr;
 s=protonmail; t=1584612060;
 bh=36HLGEVvas3Di7zjgB751Bfoyerh1ZQGVa2tqrAXUQU=;
 h=Date:To:From:Cc:Reply-To:Subject:In-Reply-To:References:
 Feedback-ID:From;
 b=hMiT3vvOb3E2KkQZnUkb/b0+Ui/kR1S93P6U+UKOKFTE1IXcHBzvAKF846uoFi+sg
 v8DMDTa2cKbQ4Ml9vUPwpD18Q/8MRP0a1GS1LB8JBXz6jDrGS9QiPylLVh60eEFZxz
 a1aHyLMsI7ouuPAsgwuHT5IfWcuXnDm75BOyLBuQ=
To: Pekka Paalanen <ppaalanen@gmail.com>
From: Simon Ser <contact@emersion.fr>
Subject: Re: Atomic KMS API lacks the ability to set cursor hot-spot
 coordinates
Message-ID: <MPzOVF7HbjWD-DOtY0cwysuavnUFO4OYiyztNSipEfz6cXKDk66GI5AKMzfVhmvatF3kxF-ID6kWi2H8JxPBZ9ii3cI3RWgLBsauIy5l9Xc=@emersion.fr>
In-Reply-To: <20200319115748.276d8f32@eldfell.localdomain>
References: <9d86bbe4-70cf-273d-4d61-aec06011d441@redhat.com>
 <ADrBkiVj05c2ZYEz46BNJrrChY-PCxme8HOeHHGOLjIR5XpBZoyIY5aUnSfXCm0wrYr0-Iuh80vnZqmRQ_jZaslv2Q2P7N6q5yCG0AeWovU=@emersion.fr>
 <20200319115748.276d8f32@eldfell.localdomain>
Feedback-ID: FsVprHBOgyvh0T8bxcZ0CmvJCosWkwVUg658e_lOUQMnA9qynD8O1lGeniuBDfPSkDAUuhiKfOIXUZBfarMyvA==:Ext:ProtonMail
MIME-Version: 1.0
X-Spam-Status: No, score=-1.2 required=7.0 tests=ALL_TRUSTED,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF shortcircuit=no
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on mail.protonmail.ch
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
Cc: Hans de Goede <hdegoede@redhat.com>,
 =?UTF-8?Q?Jonas_=C3=85dahl?= <jadahl@redhat.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thursday, March 19, 2020 10:57 AM, Pekka Paalanen <ppaalanen@gmail.com> wrote:

> On Wed, 18 Mar 2020 14:38:48 +0000
> Simon Ser contact@emersion.fr wrote:
>
> > Hi,
> >
> > > 1.  Letting the VM-viewer window-system draw the cursor as it normally
> > >     would draw it.
> > >
> >
> > Why is this important? Can't the VM viewer hide the cursor and use a
> > sub-surface to manually draw the cursor plane configured by the guest?
> > This would also allow the compositor running inside the VM to correctly
> > have control over the cursor position, which is necessary for pointer
> > constraints.
>
> Aren't pointer motion events delivered in absolute and not relative
> coordinates in the "seamless mode"?
>
> Do we do pointer constraints also with absolute motion?

Some apps do pointer constraints with absolute motion, e.g. games and
VNC/VM viewers. It's usually used to prevent the user from leaving the
constrained surface by mistake.
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
