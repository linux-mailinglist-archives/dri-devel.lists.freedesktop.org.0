Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id ECFA64FF21D
	for <lists+dri-devel@lfdr.de>; Wed, 13 Apr 2022 10:38:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7A41610FBCE;
	Wed, 13 Apr 2022 08:38:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-40136.proton.ch (mail-40136.proton.ch [185.70.40.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C07E810FBCE
 for <dri-devel@lists.freedesktop.org>; Wed, 13 Apr 2022 08:38:41 +0000 (UTC)
Date: Wed, 13 Apr 2022 08:38:34 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=emersion.fr;
 s=protonmail2; t=1649839119;
 bh=CduJERpBA+LB5lgdzvUmRF7q7s840dpd/4b+UFe8xvY=;
 h=Date:To:From:Cc:Reply-To:Subject:Message-ID:In-Reply-To:
 References:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
 Message-ID;
 b=gNGCu1IYk97mm+vmsBKXhq7f//ZEvj27xgLcsgaJsK21AGukpgCU4gepNj6wWwHQe
 oSrhs64y6UjliJKTuS1Puoe4h6fDKeVATkQK6jrAJJevcQD4LnGjFAKLuBGMzDzlA4
 ZGNKHwXNULfPijf4NRkciidGBOHS0BU542tV5MUEInOmRpwQdLI1SJ/KX2T1vsHNun
 jhfv5EO1wwECpebh8M/KAkn+3XXqEl8RniJJmv8EJ3TbUxRNxCrwgGYKkRjD/c+m/h
 hZWFUyCb7zxYmPrKvrSgnHpzTCCH7iTNNyOYktT6iDdzHhixsZoXBcVDWcsZ+DWNld
 WxzORIkoARnmA==
To: Daniel Vetter <daniel@ffwll.ch>
From: Simon Ser <contact@emersion.fr>
Subject: Re: [RFC] drm/kms: control display brightness through drm_connector
 properties
Message-ID: <LMxfGfYBM2IWiZPlL_Ol3FaVKJt8pii_1VE66n_721607U5hefduf-mHLx0TEOcqphiNxtI5oiyZsT_Qpmm8Ay_femnZJjJAo_07MdK0-tU=@emersion.fr>
In-Reply-To: <YlaKnRY/aON+EUOx@phenom.ffwll.local>
References: <0d188965-d809-81b5-74ce-7d30c49fee2d@redhat.com>
 <dP36CeeNjDVKgcJzbBAdkNM0HzB3N5Uzd6cgBcmrb5mA6xzWs9AKMmRdMKG2y6c1geMhZ1i8hONKQmxYYHN-ZhRLGT_TXz5IhtqnJSWBD9Q=@emersion.fr>
 <0e1cffc1-e8b6-dc58-56ff-53f911f33e60@redhat.com>
 <CADnq5_OGtERRYUPLskgjVD4eLbb2PxKdzcr+xmR2mRMAK73Log@mail.gmail.com>
 <Yk/tOG+iga/wj/Gt@phenom.ffwll.local>
 <acd0c8b6-b045-bab7-dc92-ea166b22c1c6@redhat.com>
 <dc3754a4-3f74-95bb-adae-56000a3756f5@redhat.com>
 <AQ3YD3wm6m_Knso5FAW-CKcokQqjDweExgrnV-f84VGkcOk8B0UcaooLiNqFMsHLOnhVnsnxC9kJMh_gY7z6rHlFaIx1OAZxSUfrOnd2jtY=@emersion.fr>
 <ca6eead3-13e7-2973-657d-48798c6cf89f@redhat.com>
 <YlaKnRY/aON+EUOx@phenom.ffwll.local>
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
Reply-To: Simon Ser <contact@emersion.fr>
Cc: Sebastian Wick <sebastian.wick@redhat.com>,
 Martin Roukala <martin.roukala@mupuf.org>,
 Christoph Grenz <christophg+lkml@grenz-bonn.de>,
 wayland <wayland-devel@lists.freedesktop.org>,
 Hans de Goede <hdegoede@redhat.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 Yusuf Khan <yusisamerican@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wednesday, April 13th, 2022 at 10:32, Daniel Vetter <daniel@ffwll.ch> wr=
ote:

> Inflicting hotplug complications on all userspace (including uevent
> handling for this hotpluggable backlight and everything) just because
> fixing the old crap systems is work is imo really not a good idea. Much
> better if we get to the correct future step-by-step.

Yup, I fully agree. As a user-space dev I'm perfectly fine with an API
only available on some systems as a first step.
