Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 08A9B6FFA20
	for <lists+dri-devel@lfdr.de>; Thu, 11 May 2023 21:29:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 39EEA10E09A;
	Thu, 11 May 2023 19:29:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-4323.proton.ch (mail-4323.proton.ch [185.70.43.23])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B0F5910E09A
 for <dri-devel@lists.freedesktop.org>; Thu, 11 May 2023 19:29:48 +0000 (UTC)
Date: Thu, 11 May 2023 19:29:27 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=emersion.fr;
 s=protonmail; t=1683833385; x=1684092585;
 bh=LnOAuB6RhwhVFrFTqDl0rTz44h20G9jcFumgJfQCe4Q=;
 h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
 Message-ID:BIMI-Selector;
 b=m36fvbScLYMFhFsqYXSSjW4KW2GVaDNi9ikcNYDmn7EcaVZ/+A7irDB1Q6B+8H9SL
 5zKdFPEbVhc3Cm+9UNZIjDJ8ENKNSZ4vB/lHjtDWzsCpTaVOOGFI+cztja9KVrRoLW
 JOlgKZmzZcY1LoZZ3QddKHRu+J5ZxMVODi3pFxPZbbxBN1SrBJbwsNWx1OwvVb72SA
 NGaBa35V6JFNRH5RQQm99yTRaBAXPmqhewm9DzYIljihhF7+OswAQGsG63Zce5P6Z5
 qDNYKWAfXlgKrtFP8Y65bLovlCkAvxANaYob0yES/UXxf91nAcVZ7yGASexNIxvzjr
 Vha3Yo+qs6N1A==
To: Joshua Ashton <joshua@froggi.es>
From: Simon Ser <contact@emersion.fr>
Subject: Re: [RFC] Plane color pipeline KMS uAPI
Message-ID: <k6yN8_WlW_AoQ7bxsopuqRsCxAbjFJ_vpM3iJjy_st--rHf305SsBVubqMbNDkSm4ez1ygoPH2Dc7VffRQjlZBk4fyKFpcZpQGpSA5vA6G0=@emersion.fr>
In-Reply-To: <CAEZNXZCCn7ZFgyy-NzpSEp0wB0L7PZ-jheHmMWkgQq5pQ+930A@mail.gmail.com>
References: <QMers3awXvNCQlyhWdTtsPwkp5ie9bze_hD5nAccFW7a_RXlWjYB7MoUW_8CKLT2bSQwIXVi5H6VULYIxCdgvryZoAoJnC5lZgyK1QWn488=@emersion.fr>
 <CAPM=9tz54Jc1HSjdh5A7iG4X8Gvgg46qu7Ezvgnmj4N6gbY+Kw@mail.gmail.com>
 <CA+hFU4x++RDOxkc-_ZvDtQs3DtupwDV0KJyD3YAgrdh4daLotA@mail.gmail.com>
 <CAPM=9twjPr9fiJwbyNS9j=mCKmLhxbTjB5Vzq9F+Du8sdHac-A@mail.gmail.com>
 <e903d920-788f-7d70-c6f0-1faaac3c9843@amd.com>
 <CAPM=9tyOFhE0zC8540KBOkDaZE1c3zTtke_vX=DEkMTmo04A4Q@mail.gmail.com>
 <QL28tg_ZcXPQ1W5l8Hp3rDlvyKuMh09kjGHpj1GRKVrMqlB-hNI2F6FzRSP-NyfkMpk6tsO55t8UYF6Uk9b7IF1O1BHH1WKc88kNTgY2Ugk=@emersion.fr>
 <ZFtO2bMQOWVhRkSG@redhat.com>
 <CACO55tvzdOU4hnqbpTsd=_SeP0GHt235w=NGL74Oq0Fd35V6HQ@mail.gmail.com>
 <CAEZNXZCCn7ZFgyy-NzpSEp0wB0L7PZ-jheHmMWkgQq5pQ+930A@mail.gmail.com>
Feedback-ID: 1358184:user:proton
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
Cc: Sebastian Wick <sebastian.wick@redhat.com>,
 Pekka Paalanen <pekka.paalanen@collabora.com>,
 Karol Herbst <kherbst@redhat.com>, Aleix Pol <aleixpol@kde.org>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 "xaver.hugl@gmail.com" <xaver.hugl@gmail.com>, Melissa Wen <mwen@igalia.com>,
 =?utf-8?Q?Jonas_=C3=85dahl?= <jadahl@redhat.com>,
 Uma Shankar <uma.shankar@intel.com>,
 Victoria Brekenfeld <victoria@system76.com>,
 =?utf-8?Q?Michel_D=C3=A4nzer?= <mdaenzer@redhat.com>,
 wayland-devel <wayland-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thursday, May 11th, 2023 at 18:56, Joshua Ashton <joshua@froggi.es> wrot=
e:

> When we are talking about being 'prescriptive' in the API, are we
> outright saying we don't want to support arbitrary 3D LUTs, or are we
> just offering certain algorithms to be 'executed' for a plane/crtc/etc
> in the atomic API? I am confused...

From a kernel PoV:

- Prescriptive =3D here are the available hardware blocks, feel free to
  configure each as you like
- Descriptive =3D give me the source and destination color-spaces and I
  take care of everything

This proposal is a prescriptive API. We haven't explored _that_ much
how a descriptive API would look like, probably it can include some way
to do Night Light and similar features but not sure how high-level
they'd look like. A descriptive API is inherently more restrictive than
a prescriptive API.
