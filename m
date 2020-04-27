Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B3611BAF85
	for <lists+dri-devel@lfdr.de>; Mon, 27 Apr 2020 22:32:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 291A489D8D;
	Mon, 27 Apr 2020 20:32:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from asavdk4.altibox.net (asavdk4.altibox.net [109.247.116.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7FA2189D8D
 for <dri-devel@lists.freedesktop.org>; Mon, 27 Apr 2020 20:32:13 +0000 (UTC)
Received: from ravnborg.org (unknown [158.248.194.18])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by asavdk4.altibox.net (Postfix) with ESMTPS id 263748046C;
 Mon, 27 Apr 2020 22:32:10 +0200 (CEST)
Date: Mon, 27 Apr 2020 22:32:08 +0200
From: Sam Ravnborg <sam@ravnborg.org>
To: Andrew Morton <akpm@linux-foundation.org>
Subject: Re: [PATCH] get_maintainer: Add email addresses from .yaml files
Message-ID: <20200427203208.GA3312@ravnborg.org>
References: <87d082jtfn.fsf@collabora.com> <20200420175909.GA5810@ravnborg.org>
 <CAL_JsqJXa8QxQmLfkCO8_SSsgYm2nTFW1J6wx4bGbZgAy8Sxog@mail.gmail.com>
 <9a32f150f85f851d04afd148b2a9a5cf203f7ce1.camel@perches.com>
 <7beaedfd63017973b910dd21cac13ecb42dbe503.camel@perches.com>
 <20200427055755.GA21898@ravnborg.org>
 <79ade7bc8ce57ef11f94011bad1842372c61fdd7.camel@perches.com>
 <20200427130448.74b75c3a6c91e5ede31542e4@linux-foundation.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200427130448.74b75c3a6c91e5ede31542e4@linux-foundation.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.3 cv=MOBOZvRl c=1 sm=1 tr=0
 a=UWs3HLbX/2nnQ3s7vZ42gw==:117 a=UWs3HLbX/2nnQ3s7vZ42gw==:17
 a=8nJEP1OIZ-IA:10 a=L2k0239gBzhLS6eM0JoA:9 a=wPNLvfGTeEIA:10
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
Cc: devicetree@vger.kernel.org,
 Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
 Neil Armstrong <narmstrong@baylibre.com>,
 Adrian Ratiu <adrian.ratiu@collabora.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Andrzej Hajda <a.hajda@samsung.com>, Rob Herring <robh+dt@kernel.org>,
 Joe Perches <joe@perches.com>, Collabora Kernel ML <kernel@collabora.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Andrew.

> The patch assumes that we have
> =

> -	    if ($file_emails) {
> -		my @poss_addr =3D $text =3D~ m$[A-Za-z_-_\"\' \,\.\+-]*\s*[\,]*\s*[\(\=
<\{]{0,1}[A-Za-z0-9_\.\+-]+\@[A-Za-z0-9\.-]+\.[A-Za-z0-9]+[\)\>\}]{0,1}$g;
> -		push(@file_emails, clean_file_emails(@poss_addr));
> -	    }

If you look in the original mail it has:
> -             my @poss_addr =3D $text =3D~ m$[A-Za-z=C0-=FF

So somehow "=C0-=FF" is silently converted to _-_ when the patch is saved or
processed by further tools.

Strange, maybe an encoding thing of the mail?

	Sam
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
