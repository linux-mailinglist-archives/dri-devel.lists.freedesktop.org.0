Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5DBBE1A7AE2
	for <lists+dri-devel@lfdr.de>; Tue, 14 Apr 2020 14:34:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 732F789B99;
	Tue, 14 Apr 2020 12:34:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail1.protonmail.ch (mail1.protonmail.ch [185.70.40.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0ED5F89B99
 for <dri-devel@lists.freedesktop.org>; Tue, 14 Apr 2020 12:34:23 +0000 (UTC)
Date: Tue, 14 Apr 2020 12:34:17 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=emersion.fr;
 s=protonmail; t=1586867659;
 bh=qVgX01XPLB1p1FiYFQhuxG0rafpJaCa1eRaWJhtul6M=;
 h=Date:To:From:Cc:Reply-To:Subject:In-Reply-To:References:From;
 b=IT6yDNBB9Irh6Sq8cxMZZUsyK17qCKTvcA1LozAkX0x5rs1lTORixLv99Cys+0oC0
 cqNMbDeO7cK//X8okvXwxTjwfXOjgFiNQESFmPf5Snr52JU++TkGMxUthgNxwd2wU+
 7y0hzDlDEwHXxiB4bsbbjsTnwDMvBrgyhhL3Q0ng=
To: Daniel Vetter <daniel@ffwll.ch>
From: Simon Ser <contact@emersion.fr>
Subject: Re: KMS enums and bitfields UAPI
Message-ID: <gpwDGBjR8hMLhneuVUgofPTRR5r79EHlaSULKoTmIvavvl52qCQS7bXfqihSRC_ABzsDO1xmG0GSbU1d6DPanLEfW0IcsCBqbN0SFvd7gv4=@emersion.fr>
In-Reply-To: <20200414122402.GS3456981@phenom.ffwll.local>
References: <VmzN-pGfjaXAFb8aZXOnS2ibasRIsvB-EbfvxyvjLs07m-PBv4pTcX5hsB7yyrt78pxQQ6Bbu3I-hTtFSXEadxm8CkS60FLccIsZycguSfA=@emersion.fr>
 <u5X6K68v0waX25yZHLng0H_WDIFjNU-MgmnbLCoBZN7bqys3ofRm203wrYKdMnR1f4CStz3q5a12Y0ou8lCZWNMuhRmCCZ1dkTCSuDZjdy4=@emersion.fr>
 <20200414122402.GS3456981@phenom.ffwll.local>
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
Cc: DRI Development <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tuesday, April 14, 2020 2:24 PM, Daniel Vetter <daniel@ffwll.ch> wrote:

> On Mon, Apr 13, 2020 at 10:38:37PM +0000, Simon Ser wrote:
>
> > Daniel Vetter, Ville, any thoughts about this?
>
> Magic 8ball says "unclear", and I feel like I keep flip-flopping around on
> this.
>
> I think best-case outcome here is that we're a) consistent across
> compositors and b) document that consensus in the kernel's uapi section
> (for lack of better places).

Agreed.

> I'm not hung up on what exactly that consensus should be, as long as it's
> a consistent across projects. If you folks can't figure this out I'll do a
> live youtube sessions and throw a dice :-P

It seems like everyone's fine with whatever decision we make as long as
we make one. :P

I guess I'll summarize again my main point here: requiring user-space
to use the KMS API to get enum values just makes it more difficult for
user-space to use KMS. I can't think of any reason why the kernel would
want to use different enum values for a standard property.

Does anybody remember if there was such a use-case when this UAPI was
introduced?

Thanks,

Simon
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
