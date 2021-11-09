Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 50DB244AA80
	for <lists+dri-devel@lfdr.de>; Tue,  9 Nov 2021 10:22:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2572B6EA1F;
	Tue,  9 Nov 2021 09:22:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-40136.proton.ch (mail-40136.proton.ch [185.70.40.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EE6906EA21
 for <dri-devel@lists.freedesktop.org>; Tue,  9 Nov 2021 09:22:29 +0000 (UTC)
Date: Tue, 09 Nov 2021 09:22:26 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=emersion.fr;
 s=protonmail; t=1636449747;
 bh=QVgJ6mYrWm8AKVHyTJa+baXr7jpRyUsoWGTxdVG4oT4=;
 h=Date:To:From:Cc:Reply-To:Subject:In-Reply-To:References:From;
 b=ZFYlkLFMSWDbCOt8ko2W18YrYy1zzD/8r5F2MRzPJ1ksT675lWJbMP4C72x3/rUWY
 NRo9VpWnz2xEr5uZObQFDDr8eaiPD1Ex70iGgrYaqqWBO3DUOIQDkn+oWjHDJWBcRp
 nylBeIG7FFKTsuaJhUCeJg9+SqPmz0XwQ//aJO8YvR4glsWD3u6Pq1zW0iuxtaky3l
 K7LJmbcGHDiIIomlwQ/XbtasqTM/pkxxbHdktSAjTtzrvyXXW8hVCvk7sPx09mtVG9
 EDX8peiyMoDV07oyfcbn/auGvIa1nZyvifrp+Fn9B9gAa5zRPMDoKHOlVcXzk08GCM
 ZgZ3JsmdMtmkw==
To: Daniel Vetter <daniel@ffwll.ch>
From: Simon Ser <contact@emersion.fr>
Subject: Re: [PATCH] doc: gpu: Add document describing buffer exchange
Message-ID: <gwWWtf19snTx_NBQ-FQykK8Kt1Fcp4mzdlMt0dTjF3W3VX5pB2xqGcC_Y8gSxd53tk8nv2Qu6yecK6g3UIktFRTHUXsT-89G6UFZy7bjYQQ=@emersion.fr>
In-Reply-To: <YYo7wHBACwgwy3W+@phenom.ffwll.local>
References: <20210905122742.86029-1-daniels@collabora.com>
 <AqG6tXWB4u3qhQs6QV8AkOhbOhpAsenbzEKPlyG4IRBDtqevEHfx61dGX80b1U49N-nnoovcWzW1smGRlK6OhRrFkonCSFMalVxbhgdoNuE=@emersion.fr>
 <f27654e4-3abb-3950-1629-c32b881332ed@nvidia.com>
 <YYo7wHBACwgwy3W+@phenom.ffwll.local>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
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
Cc: James Jones <jajones@nvidia.com>, Daniel Stone <daniels@collabora.com>,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tuesday, November 9th, 2021 at 10:13, Daniel Vetter <daniel@ffwll.ch> wr=
ote:

> On Mon, Nov 08, 2021 at 04:18:22PM -0800, James Jones wrote:
> > On 9/6/21 5:28 AM, Simon Ser wrote:
> > > > Since there's a lot of confusion around this, document both the rul=
es
> > > > and the best practice around negotiating, allocating, importing, an=
d
> > > > using buffers when crossing context/process/device/subsystem bounda=
ries.
> > > >
> > > > This ties up all of dmabuf, formats and modifiers, and their usage.
> > > >
> > > > Signed-off-by: Daniel Stone <daniels@collabora.com>
> > >
> > > Thanks a lot for this write-up! This looks very good to me, a few com=
ments
> > > below.
> >
> > Agreed, it would be awesome if this were merged somewhere. IMHO, a lot =
of
> > the non-trivial/typo suggestions below could be taken care of as follow=
-on
> > patches, as the content here is better in than out, even if it could be
> > clarified a bit.
>
> Seconded on just landing this without trying to perfect it first, because
> I was just looking for it and didn't find it anywhere :-/

Let me know if you lack time for this daniels, I can work on a new version.
I don't want this to be lost in review limbo!
