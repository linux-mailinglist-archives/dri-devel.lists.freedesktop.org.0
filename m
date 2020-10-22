Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 39B6D295CCA
	for <lists+dri-devel@lfdr.de>; Thu, 22 Oct 2020 12:38:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A92726F5CA;
	Thu, 22 Oct 2020 10:38:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail2.protonmail.ch (mail2.protonmail.ch [185.70.40.22])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 93E3A6F5CA
 for <dri-devel@lists.freedesktop.org>; Thu, 22 Oct 2020 10:38:37 +0000 (UTC)
Date: Thu, 22 Oct 2020 10:38:27 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=emersion.fr;
 s=protonmail2; t=1603363115;
 bh=CFta1NYY21eVoME33PhWyEf4GoddwMBZIdpD4PTKYwg=;
 h=Date:To:From:Cc:Reply-To:Subject:In-Reply-To:References:From;
 b=M2vKh5RF/jjvsq8Jo7J32nYriWEUNVk/iW/QVhg/+NVqE4JlY6AufkiHBNgHjZiNP
 unKbhMAkEBJTF7V4qIg4p2OxS0U53iR/IDas+inctlLXZBPqSmiM6qvnLS54TdqS8t
 p00h0DXYKDkzPkleGQwk0qzVDOQffE4jfmnE0v0PChCoBZeCi79RCsYsoab7UtVZ5X
 7BQoF+AKHTYMNMFCOWnjJREKvacz+ur26JIYbX0Dn0n5uSydcmK2RYDSZEadDQ08uS
 wo3RzMj+AIPhaus8pH6EAiOWbS2Xv88VmINq38W3RL8rVBgH8qpq/1VmnL/jA7ZWZi
 sOf2NZfbwpFqw==
To: Brian Starkey <brian.starkey@arm.com>
From: Simon Ser <contact@emersion.fr>
Subject: Re: [PATCH] drm: document that user-space should avoid parsing EDIDs
Message-ID: <XqLtjEGDZ2vK_mLnRNQP7ApChrWKQm4QPkzpykD9AS0veXASHWxbkT3wBCkK4G5dXucjrJcvkT2ujE61mkEmVpYDzMSgaGwcWF_FTNHyc5A=@emersion.fr>
In-Reply-To: <20201009102523.efvrvznkt66ry24o@DESKTOP-E1NTVVP.localdomain>
References: <izOAkOJk67APzk9XP_DhUGr5Nvo_KwmIXlGQhiL101xxttvMO3K1DUdEQryIFXe2EjG16XGuc_YPMlTimZjqePYR3dB0m4Xs4J8Isa3mBAI=@emersion.fr>
 <20201009102523.efvrvznkt66ry24o@DESKTOP-E1NTVVP.localdomain>
MIME-Version: 1.0
X-Spam-Status: No, score=-1.2 required=10.0 tests=ALL_TRUSTED,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF shortcircuit=no
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on
 mailout.protonmail.ch
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
Cc: Daniel Vetter <daniel.vetter@intel.com>, "nd@arm.com" <nd@arm.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 Pekka Paalanen <pekka.paalanen@collabora.co.uk>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Friday, October 9, 2020 12:25 PM, Brian Starkey <brian.starkey@arm.com> wrote:

> I assume that this is so that the kernel can apply quirks/limits in
> cases where it knows it needs to? I think it would be nice to put at
> least a few words indicating "why", otherwise this feels like an
> arbitrary commandment with no justification.

I mainly wanted to avoid having some user-space developers think "but
I know better than the kernel!". I don't want to document that the
kernel will exclusively change the mode list because of quirks, then
figuring out that we need to fix-up another EDID field for other
reasons, and end up with complains.

I added an intentionally short explanation in v2.
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
