Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CF4FA4A67FD
	for <lists+dri-devel@lfdr.de>; Tue,  1 Feb 2022 23:29:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B7CA410E21B;
	Tue,  1 Feb 2022 22:29:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-4317.proton.ch (mail-4317.proton.ch [185.70.43.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3BB8F10E21B
 for <dri-devel@lists.freedesktop.org>; Tue,  1 Feb 2022 22:29:22 +0000 (UTC)
Date: Tue, 01 Feb 2022 22:29:18 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=emersion.fr;
 s=protonmail2; t=1643754559;
 bh=MGtp5mMwNn+8qDhigeSXS0uKyHzpDrXsYo+t1ISZnqg=;
 h=Date:To:From:Cc:Reply-To:Subject:Message-ID:In-Reply-To:
 References:From:To:Cc;
 b=l0iICYndrhAtRRrRBbQ7jYwKoH6YKKhnrBfLHSNjH7IjZ+TC8QiODbSZ1SxHk0Hvw
 DFDsjKq29VC01r0LzwvdRfAORPmS4GVUgrt9waPKhUhtaqeNq03wWaJSsYJtBpwTla
 XunPVeybo2QOVbgGgGxIwNNpyzNSH5vj0Ac7fVWWtU36ISv/e40HPrLX+XUr94R7F0
 GvWUQmGrTNHucyTejYVfezQqaVmE/HW4L1VKbvx/87SiW3bVlRHkW+sXVNqcZvvEzr
 pUEj9qjNZYW2o2UU+D+mQdqc2E2vZ8ujSj8FmXKPgnLD501TOFva9dO38vCbhP4fRu
 PkJOcSAyPRMNg==
To: Sam Ravnborg <sam@ravnborg.org>
From: Simon Ser <contact@emersion.fr>
Subject: Re: [PATCH 1/4] drm: Add I2C connector type
Message-ID: <0yOiGD-56rTdV--oDietLeMO46Z8iFNnCNVVRg3Yh9D13AghGCYm5aP67SoswHY7Ye3vc3UEKzgtI02-F6vJ4b5xGLlE5yg6n2HznaWzYvg=@emersion.fr>
In-Reply-To: <YfmeztkVXwZzAwYe@ravnborg.org>
References: <20220131201225.2324984-1-javierm@redhat.com>
 <20220131201225.2324984-2-javierm@redhat.com> <YfhMESTylI1NTKDg@ravnborg.org>
 <4d9a56a7-da25-b411-61cc-372c6fa9011d@tronnes.org>
 <YfmeztkVXwZzAwYe@ravnborg.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-1.2 required=10.0 tests=ALL_TRUSTED,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,T_SCC_BODY_TEXT_LINE
 shortcircuit=no autolearn=disabled version=3.4.4
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
Cc: linux-fbdev@vger.kernel.org, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel.vetter@ffwll.ch>,
 Emil Velikov <emil.l.velikov@gmail.com>,
 Javier Martinez Canillas <javierm@redhat.com>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org,
 =?utf-8?Q?Noralf_Tr=C3=B8nnes?= <noralf@tronnes.org>,
 Geert Uytterhoeven <geert@linux-m68k.org>, Maxime Ripard <maxime@cerno.tech>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tuesday, February 1st, 2022 at 21:57, Sam Ravnborg <sam@ravnborg.org> wr=
ote:

> As I wrote in another part of this thread(s) - typing the patch is easy.
> But I do not understand the userspace implications so I need someone
> else to say go.

User-space shouldn't really use the connector for anything except making it
easier for the user to understand where to plug the display cable. I think =
a
generic "panel" connector type makes sense.
