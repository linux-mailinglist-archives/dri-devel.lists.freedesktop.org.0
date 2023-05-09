Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 972136FCF5B
	for <lists+dri-devel@lfdr.de>; Tue,  9 May 2023 22:22:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B872510E3CB;
	Tue,  9 May 2023 20:22:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-4317.proton.ch (mail-4317.proton.ch [185.70.43.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3BF6E10E3CB
 for <dri-devel@lists.freedesktop.org>; Tue,  9 May 2023 20:22:40 +0000 (UTC)
Date: Tue, 09 May 2023 20:22:30 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=emersion.fr;
 s=protonmail; t=1683663757; x=1683922957;
 bh=jluNRV+zrKP6umMrd0/fSmDFJEh4Whb8lMEQSiGz8co=;
 h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
 Message-ID:BIMI-Selector;
 b=K86wrMKPBsL3jTjTaqMNTdKvTXJCqLCZv0suMOr8I41NaJmJhTCAPxb5IknNs/Uy+
 qS1dcDPOi83TzUo2xdaZ19WjhICgsOhBIu9aR+XOtd69QkaGGeE5Z5KYx98QsIzta+
 Rc6rxupYqjujHNi/wO3Kkp761Rxw2C1uX7Uzc4JCu5qPkBmh7F/cFIZDUiX43ADY1Y
 lZ7NL6gIkFgUVVtn/8pn74YtiMrN0JswwvPr7mzv5kPIQq4lcncFio+GiCd+YSao9H
 cwG2omqibduzK+T8bvm5MLzcOB8xZjHNpm7ixRI2SyUHrAjKY5PSMWo7BrXNmtNNKj
 Dgkx1PuiCrnWw==
To: Dave Airlie <airlied@gmail.com>
From: Simon Ser <contact@emersion.fr>
Subject: Re: [RFC] Plane color pipeline KMS uAPI
Message-ID: <QL28tg_ZcXPQ1W5l8Hp3rDlvyKuMh09kjGHpj1GRKVrMqlB-hNI2F6FzRSP-NyfkMpk6tsO55t8UYF6Uk9b7IF1O1BHH1WKc88kNTgY2Ugk=@emersion.fr>
In-Reply-To: <CAPM=9tyOFhE0zC8540KBOkDaZE1c3zTtke_vX=DEkMTmo04A4Q@mail.gmail.com>
References: <QMers3awXvNCQlyhWdTtsPwkp5ie9bze_hD5nAccFW7a_RXlWjYB7MoUW_8CKLT2bSQwIXVi5H6VULYIxCdgvryZoAoJnC5lZgyK1QWn488=@emersion.fr>
 <CAPM=9tz54Jc1HSjdh5A7iG4X8Gvgg46qu7Ezvgnmj4N6gbY+Kw@mail.gmail.com>
 <CA+hFU4x++RDOxkc-_ZvDtQs3DtupwDV0KJyD3YAgrdh4daLotA@mail.gmail.com>
 <CAPM=9twjPr9fiJwbyNS9j=mCKmLhxbTjB5Vzq9F+Du8sdHac-A@mail.gmail.com>
 <e903d920-788f-7d70-c6f0-1faaac3c9843@amd.com>
 <CAPM=9tyOFhE0zC8540KBOkDaZE1c3zTtke_vX=DEkMTmo04A4Q@mail.gmail.com>
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
 "xaver.hugl@gmail.com" <xaver.hugl@gmail.com>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 wayland-devel <wayland-devel@lists.freedesktop.org>,
 Melissa Wen <mwen@igalia.com>,
 =?utf-8?Q?Jonas_=C3=85dahl?= <jadahl@redhat.com>,
 Uma Shankar <uma.shankar@intel.com>,
 Victoria Brekenfeld <victoria@system76.com>,
 =?utf-8?Q?Michel_D=C3=A4nzer?= <mdaenzer@redhat.com>,
 Aleix Pol <aleixpol@kde.org>, Joshua Ashton <joshua@froggi.es>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tuesday, May 9th, 2023 at 21:53, Dave Airlie <airlied@gmail.com> wrote:

> There are also other vendor side effects to having this in userspace.
>=20
> Will the library have a loader?
> Will it allow proprietary plugins?
> Will it allow proprietary reimplementations?
> What will happen when a vendor wants distros to ship their
> proprietary fork of said library?
>=20
> How would NVIDIA integrate this with their proprietary stack?

Since all color operations exposed by KMS are standard, the library
would just be a simple one: no loader, no plugin, no proprietary pieces,
etc.
