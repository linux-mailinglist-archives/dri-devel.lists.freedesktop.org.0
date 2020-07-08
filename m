Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EFB06218F89
	for <lists+dri-devel@lfdr.de>; Wed,  8 Jul 2020 20:14:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2D4066E909;
	Wed,  8 Jul 2020 18:14:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D87A76E909;
 Wed,  8 Jul 2020 18:14:06 +0000 (UTC)
Received: from embeddedor (unknown [201.162.240.161])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id E4BD520760;
 Wed,  8 Jul 2020 18:14:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1594232046;
 bh=7dXnrSdNo3mR2eRfQtUcUioXGNY6rLTR4PxhcaEmK5M=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=aCsfligRbF9gZkPNMIuA7cziVFU6a8zmaBDG+cTssZHTjd1Pxy8nVavtCMeiwfuw/
 AJUcIKVfudJMSOxkElKxRa+rGzYbozvUmmaNbGMPbopLfWOintVMFG2rhld0ra8ZGz
 UlIm3dF/CLOq6FsOeI7F0Nt4KKbGxRn8QjNLj7xw=
Date: Wed, 8 Jul 2020 13:19:35 -0500
From: "Gustavo A. R. Silva" <gustavoars@kernel.org>
To: Ben Skeggs <skeggsb@gmail.com>
Subject: Re: [PATCH][next] drm/nouveau: Use fallthrough pseudo-keyword
Message-ID: <20200708181935.GE11533@embeddedor>
References: <20200707173628.GA29695@embeddedor>
 <CACAvsv4ahps=4gWwGXwvHFZOTBg1ubW86t3++dN4fAJ6JsBhDw@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CACAvsv4ahps=4gWwGXwvHFZOTBg1ubW86t3++dN4fAJ6JsBhDw@mail.gmail.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
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
Cc: David Airlie <airlied@linux.ie>, ML nouveau <nouveau@lists.freedesktop.org>,
 LKML <linux-kernel@vger.kernel.org>,
 ML dri-devel <dri-devel@lists.freedesktop.org>,
 Ben Skeggs <bskeggs@redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Jul 08, 2020 at 01:22:35PM +1000, Ben Skeggs wrote:
> On Wed, 8 Jul 2020 at 03:31, Gustavo A. R. Silva <gustavoars@kernel.org> wrote:
> >
> > Replace the existing /* fall through */ comments and its variants with
> > the new pseudo-keyword macro fallthrough[1]. Also, remove unnecessary
> > fall-through markings when it is the case.
> I really like this!  I was not a fan of explicitly marking those with comments.
> 

:)

> Thank you, taken in my tree.

Thanks, Ben.
--
Gustavo
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
