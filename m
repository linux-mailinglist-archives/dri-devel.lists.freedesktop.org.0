Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 33C6843127C
	for <lists+dri-devel@lfdr.de>; Mon, 18 Oct 2021 10:52:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BA1BB6E9A2;
	Mon, 18 Oct 2021 08:52:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-4018.proton.ch (mail-4018.proton.ch [185.70.40.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 21B036E9A2
 for <dri-devel@lists.freedesktop.org>; Mon, 18 Oct 2021 08:52:10 +0000 (UTC)
Date: Mon, 18 Oct 2021 08:52:07 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=emersion.fr;
 s=protonmail; t=1634547128;
 bh=rGANSEBcEK+EYmPU+ascz7nuylCMdy6N/CxVqmQGpgc=;
 h=Date:To:From:Cc:Reply-To:Subject:In-Reply-To:References:From;
 b=UiK486HL6nZCXA/w7pH4PdK1MC67e+UOGL+ryYC2TR5a14u5WkiyAz+63rs9mQd5r
 6Ai0/jRsu2sCSOCD5uMeQ6tGVytrBBtzEf8UHZzEH7og3cg7jffyPNwBjm59FyXKq9
 p7JnvRdu2u/PeUgCyHIM6BuPcPJQhsOTvKPiwqjTizXR2CSVb10Kc6mhdVwBVISEqM
 O1KyIfOCuzdv717ek26CY0RmLP80KiS5gu6XBt76MGo3Wzw1UDSHFfBQDbgmJGlfZk
 PntCQKrJovMrUHyKPSKKZTK2P+OtP5gPzM0z8/TJFTJUS0GUlNzZjvYY/wAOIe7wr0
 azH7hWHP0KqNA==
To: Pekka Paalanen <ppaalanen@gmail.com>
From: Simon Ser <contact@emersion.fr>
Cc: dri-devel@lists.freedesktop.org, Hans de Goede <hdegoede@redhat.com>,
 Dennis Filder <d.filder@web.de>, Daniel Vetter <daniel@ffwll.ch>,
 Rob Clark <robdclark@gmail.com>, Sean Paul <seanpaul@chromium.org>
Subject: Re: [PATCH RFC 2/2] drm: introduce CLOSEFB IOCTL
Message-ID: <vxzI1Ass5g8-VxDSTf4hR5wCFywlZCHq05IoyykdFnr8lpaxtDjld_MVECB6LFwo06Rc0xZzYDyTpjfFKg2fZZc22Ol37k74-OKRqJxnz2I=@emersion.fr>
In-Reply-To: <20211008102911.3bafa4f2@eldfell>
References: <20211007131507.149734-1-contact@emersion.fr>
 <20211007131507.149734-2-contact@emersion.fr>
 <20211008102911.3bafa4f2@eldfell>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Thanks for having a look at this patch, Pekka!

On Friday, October 8th, 2021 at 09:29, Pekka Paalanen <ppaalanen@gmail.com>=
 wrote:

> > +#define DRM_IOCTL_MODE_CLOSEFB=09=09DRM_IOWR(0xCF, unsigned int)
>
> Should it have a structure with 'flags' for future-proofing?
>
> ISTR some rule of thumb that everything new must have 'flags' field
> enforced to be zero just in case. I only now saw that RMFB cannot have
> flags.

I wonder. I don't mind adding a struct with flags or padding, not sure what=
 the
policy is for the DRM subsystem.
