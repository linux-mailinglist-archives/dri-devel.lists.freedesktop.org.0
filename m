Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D2A875392E
	for <lists+dri-devel@lfdr.de>; Fri, 14 Jul 2023 13:01:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 69CC210E873;
	Fri, 14 Jul 2023 11:01:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-4022.proton.ch (mail-4022.proton.ch [185.70.40.22])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BB8D910E873
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Jul 2023 11:01:34 +0000 (UTC)
Date: Fri, 14 Jul 2023 11:01:16 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=emersion.fr;
 s=protonmail; t=1689332492; x=1689591692;
 bh=F3OiycbB7GwewJiwDg1BPAMuGwncE0fbQtGP05byLxg=;
 h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
 Message-ID:BIMI-Selector;
 b=q2d8DrMuIwkModOw3DwooRH7TZ9c++tg28yaJ1iWYJU4EcAPwJ8Ypp9YmqsKFe9y3
 B3YCPVQ6SbBQwoJLtgOuRji+NIbAcB0OM330aM8q3C2R8gpZwsJmg5A10B/KvBCdFx
 XHfhI8BURyiseu7lnmQAvp1KeLdNn1d3a6m3wgFTjO6oIoCEey/zLgDUMT/eas+eWy
 L8mudu9r6uIZxbFf52RCTjuma+QEbAddngsM3X/AmocQ8TY4qqwW8cJUkA9kRDlcvL
 ablhpBngARj6eWLsqII/Jcq7Lj2LThVf/rrpeRBRpOhkS+U14EnFAI6EqDWqvKDg9p
 HSibtV9lR623g==
To: Geert Uytterhoeven <geert@linux-m68k.org>
From: Simon Ser <contact@emersion.fr>
Subject: Re: [PATCH 5/8] drm/client: Convert drm_mode_create_dumb() to
 drm_mode_addfb2()
Message-ID: <0KNCLmzXJwmF0RTaQXUBd456dzaM5QsAot8g_yT36aNlEhJbSssTxBOS95x99DJHYkEzUJeMO7zJCX4JGjX6DEmY40BWtLKVZf6nB4HQMSc=@emersion.fr>
In-Reply-To: <9090c1b423e0b56c8e906155fe53ff0841830a03.1689252746.git.geert@linux-m68k.org>
References: <cover.1689252746.git.geert@linux-m68k.org>
 <9090c1b423e0b56c8e906155fe53ff0841830a03.1689252746.git.geert@linux-m68k.org>
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
Cc: Thomas Zimmermann <tzimmermann@suse.de>,
 Javier Martinez Canillas <javierm@redhat.com>,
 Maxime Ripard <mripard@kernel.org>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thursday, July 13th, 2023 at 15:17, Geert Uytterhoeven <geert@linux-m68k=
.org> wrote:

> Currently drm_client_buffer_addfb() uses the legacy drm_mode_addfb(),
> which uses bpp and depth to guess the wanted buffer format.
> However, drm_client_buffer_addfb() already knows the exact buffer
> format, so there is no need to convert back and forth between buffer
> format and bpp/depth, and the function can just call drm_mode_addfb2()
> directly instead.

By any chance, is the commit message wrong? The title refers to
drm_mode_create_dumb(), but the description and code refer to
drm_client_buffer_addfb().
