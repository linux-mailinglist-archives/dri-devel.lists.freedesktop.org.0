Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 82FF83FE3F4
	for <lists+dri-devel@lfdr.de>; Wed,  1 Sep 2021 22:25:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E4C2F6E30C;
	Wed,  1 Sep 2021 20:24:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-4323.protonmail.ch (mail-4323.protonmail.ch [185.70.43.23])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 492C06E30C
 for <dri-devel@lists.freedesktop.org>; Wed,  1 Sep 2021 20:24:55 +0000 (UTC)
Date: Wed, 01 Sep 2021 20:24:51 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=emersion.fr;
 s=protonmail; t=1630527892;
 bh=wvdyfuuvgWLif0GJRW36mFo+P+Mh6ICaw07RdRnThMg=;
 h=Date:To:From:Cc:Reply-To:Subject:In-Reply-To:References:From;
 b=FrOHTCIqt3I61txak4+8iO45X6EB6GXHWcTHEKdddUWY4TMJs3jk6y9iRunsikf29
 qxgUBzAuDs+6z/AtVYTrrAqGdbtnsRES5dYDjUhiK996OGbms/vNwaQlSS52QX762A
 c2Er8dhAynJU55dGgf/PsxJpqXGP9k614B8zUIWLD/q4M9FXwrOpQkIQqZGavRXAo7
 anAkGzcOPMk07mYhB6PotWuIQv3JlVbI7Kd/OzvykK1+nmRITr22gKri6oveI4bcTc
 upn39DNKvUZ1wyVU4qvWhjiwdu7HxcTna4lXh8vcpc+r03cU4Ws58Wk46GD9vAAvSm
 HUZPw/Q4fFM9g==
To: Igor Matheus Andrade Torrente <igormtorrente@gmail.com>
From: Simon Ser <contact@emersion.fr>
Cc: rodrigosiqueiramelo@gmail.com, melissa.srw@gmail.com,
 hamohammed.sa@gmail.com, daniel@ffwll.ch, airlied@linux.ie,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: VKMS: New plane formats
Message-ID: <Qkd7rIf9j9Y-IlDoCbF8VB8T5sIKykTIuTfZIc1pCFPfvnfwIBGOMTnFo8i5jAWqGitlGEBH865MLF3C2jdIVk7TbRRFb_KVlte_FI0hjgI=@emersion.fr>
In-Reply-To: <d1ceaa32-e143-8d3c-4bfb-7b31673cc76c@gmail.com>
References: <d1ceaa32-e143-8d3c-4bfb-7b31673cc76c@gmail.com>
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

Ideally the final composition format would have enough precision for
all of the planes. I think it'd make sense to use ARGB16161616 if the
primary plane uses ARGB8888 and an overlay plane uses ARGB16161616.

To simplify the code, maybe it's fine to always use ARGB16161616 for
the output, and add getters which fetch an ARGB16161616 row for each
supported plane format.
