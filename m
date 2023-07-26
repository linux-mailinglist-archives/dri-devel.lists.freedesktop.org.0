Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C27577632A2
	for <lists+dri-devel@lfdr.de>; Wed, 26 Jul 2023 11:42:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0031F10E451;
	Wed, 26 Jul 2023 09:42:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-4323.proton.ch (mail-4323.proton.ch [185.70.43.23])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 18C1C10E451
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Jul 2023 09:42:52 +0000 (UTC)
Date: Wed, 26 Jul 2023 09:42:44 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=emersion.fr;
 s=protonmail2; t=1690364570; x=1690623770;
 bh=RJNvi7B4sDVhXuJId2oQ4aWkbDzlsyvtpUuhusz9OFY=;
 h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
 Message-ID:BIMI-Selector;
 b=oiHNaqiEkReBQ1T3RcKZwJ0Ali6bAJOAZFL99LF1bH71q7apjuVE55/hFJsP0bDq4
 RwrNRH+VzyblBtjjamwwx4YgCNUsuhKN1MDh3ZH99DsknxxUIBhQSPPqljrhpQ0GqK
 Hcy1e7Fqghf3RY+wcSpplfEg6/6ToN3VmebtH0HnGLZ0UzmGTFdn/U50JoMim8LwuU
 BCnE5Bf1bjgHRVSz1aGEQ50Mc5tHATfFT9OCWFMAT9onqAATUR2KX/cyokUTP366fw
 6CObU61Jb2kY/9Vv2RBue1pBWj8z0QWTgkKPifCW0NU46oVcFJFqTakZbcBs6LUg92
 GqALgx4gcW3MQ==
To: Erik Kurzinger <ekurzinger@nvidia.com>
From: Simon Ser <contact@emersion.fr>
Subject: Re: [PATCH v3] drm/syncobj: add
 DRM_IOCTL_SYNCOBJ_IMPORT/EXPORT_SYNC_FILE
Message-ID: <Mbd3iXlSItsEQuZrUrhM3BXijm6b8G9FxRgwozWrvetyscevgyglJqZi-oexTwYxyXCe9T3g8uggWV5VeFGewfPAh-mchPIprVDTHWIA-os=@emersion.fr>
In-Reply-To: <TZK6kU3lyjlGSvXhPEsXscjTWtNuKjkMIYhIkAoXPK7h3wbeRPw6SgMhcskqbCTn3t7ukpH7Z-h3navHqYkqswrsun9HO9ynrK-nb8imDwA=@emersion.fr>
References: <5e687ad8-78ad-0350-6052-a698b278cc8c@nvidia.com>
 <TZK6kU3lyjlGSvXhPEsXscjTWtNuKjkMIYhIkAoXPK7h3wbeRPw6SgMhcskqbCTn3t7ukpH7Z-h3navHqYkqswrsun9HO9ynrK-nb8imDwA=@emersion.fr>
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
Cc: Austin Shafer <ashafer@nvidia.com>, James Jones <jajones@nvidia.com>,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wednesday, July 26th, 2023 at 11:41, Simon Ser <contact@emersion.fr> wro=
te:

> Overall looks pretty good to me, a few comments below.

Ooops, that reply was meant for IGT=E2=80=A6 Re-sending it there.
