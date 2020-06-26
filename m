Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E69C20B117
	for <lists+dri-devel@lfdr.de>; Fri, 26 Jun 2020 14:05:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B6E5F6EC7B;
	Fri, 26 Jun 2020 12:05:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail2.protonmail.ch (mail2.protonmail.ch [185.70.40.22])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EAFBC6EC7B
 for <dri-devel@lists.freedesktop.org>; Fri, 26 Jun 2020 12:05:25 +0000 (UTC)
Date: Fri, 26 Jun 2020 12:05:16 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=emersion.fr;
 s=protonmail; t=1593173123;
 bh=uy03d4pApFyanUzPJXiERmqHFFLTbXO9IL+H2+sdMJg=;
 h=Date:To:From:Cc:Reply-To:Subject:In-Reply-To:References:From;
 b=PilCOIho4m//3Ix6MLxRnoWheqITdhmwPSqHyUVeeKxk1oJh3xkrIAbbsEr7k1U5g
 v2gCXK5F2x3POmlf2FZJG64lpJsgmzHNcjGBDv5/RK4Zk/ftkOmv3J3eIMxEouxqkN
 AjJ5Yebl//C9Y6vz1EiQq3EQeeX5pboUEOmhYZ5w=
To: Pekka Paalanen <ppaalanen@gmail.com>
From: Simon Ser <contact@emersion.fr>
Subject: Re: [RFC] drm: expose connector status values in uapi
Message-ID: <4MY6RJHdVv-Ad6CY6Ds1G3aXoDmtABtBaIQHoC3Rfaj5zJ6WV3fOzFOZnIrKczKBcdh4gTHljlRRDaoKKa2vCUzW5TTYNobB5p3BcRdLwdw=@emersion.fr>
In-Reply-To: <20200626121541.31835549@eldfell>
References: <-LYZxtmyBTf36wklyxa0PphDQ1FecAgEF7TMnSvyCm9Y_EFmz-4AUROX6qc4HKUjomE0HumDgVrSIbHsUMJnRSrBR2c3gPCVDNUmz7klPkE=@emersion.fr>
 <20200626121541.31835549@eldfell>
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
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Friday, June 26, 2020 11:15 AM, Pekka Paalanen <ppaalanen@gmail.com> wrote:

> I have no opinion really if adding yet another set of the same
> definitions is good or not. We do need the UAPI doc, but that does not
> necessarily mean we also need definition code in UAPI headers.
>
> I give this one a shrug.

But then uapi docs don't document uapi, instead document internal
kernel enums? And also user-space not using libdrm needs to have these
hardcoded somewhere.

The libdrm re-definitions are annoying. Maybe a better way forward
would be to have a "status" prop, which could then also be used for
the planned fine-grained uapi events.
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
