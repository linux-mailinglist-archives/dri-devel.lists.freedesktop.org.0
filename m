Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EED8D4A5D86
	for <lists+dri-devel@lfdr.de>; Tue,  1 Feb 2022 14:38:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6C41B10E118;
	Tue,  1 Feb 2022 13:38:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-40136.proton.ch (mail-40136.proton.ch [185.70.40.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D43D610E118
 for <dri-devel@lists.freedesktop.org>; Tue,  1 Feb 2022 13:38:37 +0000 (UTC)
Date: Tue, 01 Feb 2022 13:38:33 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=emersion.fr;
 s=protonmail2; t=1643722714;
 bh=valyEaCvKP8AYN0OMsIUT594MFxMMOA8Q9u7vU/eGYg=;
 h=Date:To:From:Cc:Reply-To:Subject:Message-ID:In-Reply-To:
 References:From:To:Cc;
 b=HAJ++8dKYEbgWakn1yr04UCjsKEwyph33Wsk6UItTqFp0ZS3a8xjeqbsdJcJrzDGr
 y4feUF/RnhNBbVCl3JyDXkDYNWltXAGmzAxECiCcSCqkzsCI6Z7otuDEX94Y7CN7TY
 cQuBnEMgPSIRhqV757BuH6TmECxr7DdX/aE1/4juY524DHHNrmHTUAcdsh6SI3kAhb
 5XOKfHlqatkp1p9EB36YhTPP08KOZo5kJMaL6S3C5G7NMQWWRhAp72S/Rh9R55yiAv
 RHTEfW+2/zzPivL5ufg/LHBGjBASmwcIsJgIg3slHRS3qeV22Py+q3F3cRACfqXNBX
 Z36ISSx+sXmEQ==
To: =?utf-8?Q?Noralf_Tr=C3=B8nnes?= <noralf@tronnes.org>
From: Simon Ser <contact@emersion.fr>
Subject: Re: [PATCH 1/4] drm: Add I2C connector type
Message-ID: <vbOCbsYZGDCHDj8wKOHAZ1u2HMTc_UKM5umAyMug7KZn5ABy4sDMMdNOtwLI5kH_ifctnfmzQejqC_HP1vhXNt6k7vEU0WqFVNUwKnibIn4=@emersion.fr>
In-Reply-To: <4d9a56a7-da25-b411-61cc-372c6fa9011d@tronnes.org>
References: <20220131201225.2324984-1-javierm@redhat.com>
 <20220131201225.2324984-2-javierm@redhat.com> <YfhMESTylI1NTKDg@ravnborg.org>
 <4d9a56a7-da25-b411-61cc-372c6fa9011d@tronnes.org>
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
 linux-kernel@vger.kernel.org, Geert Uytterhoeven <geert@linux-m68k.org>,
 Maxime Ripard <maxime@cerno.tech>, Thomas Zimmermann <tzimmermann@suse.de>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Sam Ravnborg <sam@ravnborg.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On Tuesday, February 1st, 2022 at 13:58, Noralf Tr=C3=B8nnes <noralf@tronne=
s.org> wrote:

> It turned out that I wasn't entirely correct here, mpv didn't cope with
> unknown types. In the PR to add support Emil Velikov wondered if libdrm
> should handle these connector names:

Opened this MR to try to make things easier for user-space:
https://gitlab.freedesktop.org/mesa/drm/-/merge_requests/222
