Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5BCEE45041D
	for <lists+dri-devel@lfdr.de>; Mon, 15 Nov 2021 13:09:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E8D496E9E3;
	Mon, 15 Nov 2021 12:09:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-40136.proton.ch (mail-40136.proton.ch [185.70.40.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9BE8E6E9E3
 for <dri-devel@lists.freedesktop.org>; Mon, 15 Nov 2021 12:09:50 +0000 (UTC)
Date: Mon, 15 Nov 2021 12:09:47 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=emersion.fr;
 s=protonmail; t=1636978187;
 bh=Yr7EnYFJu7YaEkQtZa9LmyxwnyudbLl1zN9hT31muvE=;
 h=Date:To:From:Cc:Reply-To:Subject:In-Reply-To:References:From;
 b=TZthGBVZUpbIflULsmxUjNAN6/6zYCmZLdkvAtbMpW5jiZxnoIj9teJzhtNd3luq9
 mBPKV8yz6fVubIqO0AfREJlmfk9cLML2I6s/v8P3Uy6J4uVDdaMwtPDLOre9wZupw0
 ma0Cs5czZYTjoV/4DC8NTgmPM+w4cvgACH60QF6/z7zsIlq5qPLl11szg1vTHkxWJ8
 oXmXMx4MBAs5zqG01H791URxmvfFkTs0L+gS/ybm/cffe809ekFMbQjGqW1SR5budT
 SmbESXhsC3k1EwNiMiWM2f8ZspibsXK/XV+yUFa7NV1FMM8YUVQ3xsiZvxhx3fkqg/
 bkoU93DNzfbrA==
To: Daniel Stone <daniel@fooishbar.org>
From: Simon Ser <contact@emersion.fr>
Subject: Re: [PATCH] drm: document DRM_IOCTL_MODE_GETFB2
Message-ID: <K23DZgTtMERkTEFRX3ZTohvEJ4DCdbJ3uj7rCmQC2Hh8n5z3mOioMVz4Q6TxxJjgVPao9H2RRTBL1NuCsDOCmJhrD0VelHPwqW6AhsbS7dA=@emersion.fr>
In-Reply-To: <CAPj87rNA1SzxJnT+L+Vpw8n15Gzed4rWto+OL6LdJRi0KOYReA@mail.gmail.com>
References: <20211109085601.170275-1-contact@emersion.fr>
 <CAPj87rNA1SzxJnT+L+Vpw8n15Gzed4rWto+OL6LdJRi0KOYReA@mail.gmail.com>
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
Cc: dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thursday, November 11th, 2021 at 12:50, Daniel Stone <daniel@fooishbar.o=
rg> wrote:

> In fairness it is perfectly clear, it's just that I never considered
> calling it without master/admin because why would you ever do that?

FWIW, drm_info does it to display the current buffers metadata. Pretty
useful when debugging.
