Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 30D7D2073E3
	for <lists+dri-devel@lfdr.de>; Wed, 24 Jun 2020 15:00:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0C9986EB35;
	Wed, 24 Jun 2020 13:00:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-40136.protonmail.ch (mail-40136.protonmail.ch
 [185.70.40.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C3F166EB35
 for <dri-devel@lists.freedesktop.org>; Wed, 24 Jun 2020 13:00:31 +0000 (UTC)
Date: Wed, 24 Jun 2020 13:00:21 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=emersion.fr;
 s=protonmail; t=1593003629;
 bh=+Q0jPxOqb0AIvIUIGWi9TEzOEu644Z6MOjn9/7ejmyA=;
 h=Date:To:From:Cc:Reply-To:Subject:In-Reply-To:References:From;
 b=r6G6KKy6kozWMs1krzuPRAAqbS7wfsTMnqkl0OBjFcNo3b4I/Vs1fEIPVZGdmKcuQ
 JvwJsGQ/6hsj6eAEurc8/zDo5prZtwy8b3iFHe5LFqwl9yqJhyUjM6JB1t6lnffKDa
 49o7LTCz91s1K3/3ZRt3zwkyad41wwHDBkWsHQq0=
To: Daniel Vetter <daniel.vetter@ffwll.ch>
From: Simon Ser <contact@emersion.fr>
Subject: Re: [PATCH v5] drm/fourcc: document modifier uniqueness requirements
Message-ID: <4L3gyUXh1sjFXZG4PwRjuRp1P0qDMj--TIcNy0srks5n1zkPhmZL7Z-cDPujx7kL8vwbnBSwGJdRQLmjFa5Y2rl2QwZ0L6zDA5R6YwYgUZU=@emersion.fr>
In-Reply-To: <CAKMK7uGZ+iAiyuGf=SAB3ZMmYyAttFdHF3qqRf_2_iTox_KKBw@mail.gmail.com>
References: <rq4ENYWGZ-rcmWZd1GT2lfUyU6n5fhimWeCPOct0dFKVK4OJ0pKbujgy6A4ldMZkg5ldKUzDMX_6Vjnjb_Vnst3a0YCI2RFQin42nUn_Hgk=@emersion.fr>
 <20200624110804.fynorcdkxcbqbasj@DESKTOP-E1NTVVP.localdomain>
 <CAKMK7uGZ+iAiyuGf=SAB3ZMmYyAttFdHF3qqRf_2_iTox_KKBw@mail.gmail.com>
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
Cc: =?utf-8?Q?Marek_Ol=C5=A1=C3=A1k?= <maraeo@gmail.com>,
 Neil Armstrong <narmstrong@baylibre.com>,
 =?utf-8?Q?Michel_D=C3=A4nzer?= <michel@daenzer.net>,
 dri-devel <dri-devel@lists.freedesktop.org>, nd <nd@arm.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

> > The new paragraph below looks good, but this sentence from the end of
> > the paragraph above still needs to be removed:
> > An example is AFBC, where both ARGB and ABGR have the exact same compressed layout.
>
> I think that entire paragraph was meant to be deleted, the replacement
> is the new one below. Otherwise we have 2x the exact same sentence :-)

Err, indeed, sorry about that! Sending a fixed version.
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
