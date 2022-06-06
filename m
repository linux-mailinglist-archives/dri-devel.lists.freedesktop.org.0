Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7CF4E53E183
	for <lists+dri-devel@lfdr.de>; Mon,  6 Jun 2022 10:11:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9C14E112EF0;
	Mon,  6 Jun 2022 08:11:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-4323.proton.ch (mail-4323.proton.ch [185.70.43.23])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E3602112EF0;
 Mon,  6 Jun 2022 08:11:08 +0000 (UTC)
Date: Mon, 06 Jun 2022 08:11:05 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=emersion.fr;
 s=protonmail2; t=1654503067; x=1654762267;
 bh=4cuOFpZ0dbA4aZsZ+ohjQNPbq3zto6VupijBqQYkXSE=;
 h=Date:To:From:Cc:Reply-To:Subject:Message-ID:In-Reply-To:
 References:Feedback-ID:From:To:Cc:Date:Subject:Reply-To:
 Feedback-ID:Message-ID;
 b=SS/yl4w0AMtDi1ANMz+nmwgPXZzzkhatrbFnxoufTF6CNuVJXewCJuRtHyrqekill
 5fc+E5fRJgFQSSrnCLfM65gkYWc98HGbL31PGQG4/4AEgtSW3cQ3E2JS5RyXNlKlNf
 34NhpkD5l8ZvyLh+N6etYhUNXQlPZMbt2UA2COBbrw6DIOrLUovQMXGZVr6kSZVEGu
 v/AwX31kS1e612B0q8ohcyJvWEwWGmnUePl+Ch70rg889IKu3TFOQ1TMrmSCHAXM+S
 fIxp1q0+womDIluE3ppRSUraM091txL2lGgGRnq1nVGyTUOTdQTu8N4ZPuzxugFNGT
 SDAJTPz7Lk3Iw==
To: Zack Rusin <zackr@vmware.com>
From: Simon Ser <contact@emersion.fr>
Subject: Re: [PATCH 0/6] drm: Add mouse cursor hotspot support to atomic KMS
Message-ID: <liiNQPh03lJP5a4fwMtImlqj9J7NOc-H4MdfEf_E3x1PwQyESH790qprqvF4UPpAncCPP_2wJcg2RQ7LG4pesftTDPrma5wVVNn07srf2QY=@emersion.fr>
In-Reply-To: <EE5BAC79-2FB9-4AAB-9F68-D702C970FEA2@vmware.com>
References: <20220602154243.1015688-1-zack@kde.org>
 <GWQv37zd56Jok0LiKDGflZUSaHMYyk9Uad7M6-6-gqjeUGoT5dJOfsB9XDS4UuVEcZSI34GOTFa4XA0Cf2A1sGNhvbIsE16V7CyhxFne0d4=@emersion.fr>
 <00204913-BCF7-4D42-856D-675342B2B3E9@vmware.com>
 <GpX_UKNDfd2A3OuFfb9ga63xIKRP4vKVT2HTWBRw9mX0gsN743hR9bmx4be0OMukhdVmh0p3djW7Zj-ECCr4Q5-NRiPbWMLWAnTiZaPQVMU=@emersion.fr>
 <1E185B64-591E-47A5-A4D9-55E1BC3105CC@vmware.com>
 <VdFbe3wmVv8sSzgW8rsWsOaP3vTRyGGs86yIrHzf95_hCzy2ZNc90dY1TNUcVCo6057K1hsY0y_kVoFRfZ23hgUKMIpSoRAh5MAh5RmBUZI=@emersion.fr>
 <40CAE3E3-9C74-4DC3-B0FD-8F00C7C29291@vmware.com>
 <UJ7PkcvdPsH-Mg3A4gJZWwCVK560WK9iiZC9N4Soh-1ISTHTDBRiZaS4D4Y-y_rZYzMUeQXbZsLT0-37Lly0zhp9HocepA7iCjE9_0mQZmo=@emersion.fr>
 <EE5BAC79-2FB9-4AAB-9F68-D702C970FEA2@vmware.com>
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
Reply-To: Simon Ser <contact@emersion.fr>
Cc: Martin Krastev <krastevm@vmware.com>, David Airlie <airlied@linux.ie>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 Gurchetan Singh <gurchetansingh@chromium.org>,
 Hans de Goede <hdegoede@redhat.com>, Pekka Paalanen <ppaalanen@gmail.com>,
 Gerd Hoffmann <kraxel@redhat.com>, Thomas Zimmermann <tzimmermann@suse.de>,
 wayland-devel <wayland-devel@lists.freedesktop.org>,
 Maaz Mombasawala <mombasawalam@vmware.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sunday, June 5th, 2022 at 20:16, Zack Rusin <zackr@vmware.com> wrote:

> > At any rate, I consider broken any driver which exposes a cursor plane,
> > then doesn't display it exactly at the CRTC_X/CRTC_Y
>
> But we do=E2=80=A6 The cursor is at crtc_x, crtc_y.

How do you show the cursor on the host side then? Pretty sure you use
the host X11/Wayland cursor? In which case nothing guarantees that the
host cursor position matches CRTC_X/CRTC_Y.
