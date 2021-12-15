Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 681F0475E90
	for <lists+dri-devel@lfdr.de>; Wed, 15 Dec 2021 18:23:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 04F1A10F288;
	Wed, 15 Dec 2021 17:23:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-4317.proton.ch (mail-4317.proton.ch [185.70.43.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7C21410F288
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Dec 2021 17:23:14 +0000 (UTC)
Date: Wed, 15 Dec 2021 17:23:10 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=emersion.fr;
 s=protonmail; t=1639588991;
 bh=T5RefPxZCRBl7q2I8B3Qg3644cjKYhTB6AMn29c9HkI=;
 h=Date:To:From:Cc:Reply-To:Subject:Message-ID:In-Reply-To:
 References:From:To:Cc;
 b=cpGnbwtKgXkLjeQACOTemdbumHMZHaEdxOv0baWixaBT0ddxkHMEEw5+qxKC5Ux0w
 bb1s5ltzUjieUVGyVRpYHDGRh2468cTasIODPMIMt98cyJjw5LQL496l4c5tnW6gRg
 vngTwN/CNUsqW/rzXfs2jCL32pdYeg9mwUGhnxB9y3me2RWJlPD2FBqFQP5mgEnKIB
 f0aDeIhsl8UnzHFO4okNmXKaINXJHVWWJyfO5c5xbri+2jfHkm/JuY70eAy2Ot00Jm
 4U8X+m3sNG941PuBzJGuNYxnFCSasrvQpXDqXNeRbVceWIbB/pMpqCzmAAHfcBfgeQ
 WbAabZbgfs2+A==
To: =?utf-8?Q?Jos=C3=A9_Exp=C3=B3sito?= <jose.exposito89@gmail.com>
From: Simon Ser <contact@emersion.fr>
Subject: Re: [PATCH] drm/vkms: set plane modifiers
Message-ID: <3jzxPysjC6vyPfQXQoY5tuHmyXNupFZCZ3babQzWfWRMnI8epycdbhcSF12HWKrjojVo97MlLrJE2HGtM7jcliGZXGXUJSkNcAFn5eTZSu4=@emersion.fr>
In-Reply-To: <20211215164213.9760-1-jose.exposito89@gmail.com>
References: <20211215164213.9760-1-jose.exposito89@gmail.com>
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
Cc: hamohammed.sa@gmail.com, rodrigosiqueiramelo@gmail.com, airlied@linux.ie,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 melissa.srw@gmail.com, cphealy@gmail.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

You'll need to set the format_mod_supported hook as well, otherwise the ker=
nel
will expose a bogus IN_FORMATS prop with one modifier and zero formats.
