Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7159C3AFEB5
	for <lists+dri-devel@lfdr.de>; Tue, 22 Jun 2021 10:05:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 772C989FEC;
	Tue, 22 Jun 2021 08:05:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-4317.protonmail.ch (mail-4317.protonmail.ch [185.70.43.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4EC4589FEC
 for <dri-devel@lists.freedesktop.org>; Tue, 22 Jun 2021 08:04:58 +0000 (UTC)
Date: Tue, 22 Jun 2021 08:04:53 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=emersion.fr;
 s=protonmail3; t=1624349095;
 bh=G/pZPGLWw8xPSg8u+BnvKpg8hIZxfrEr5BbzpiNsjQg=;
 h=Date:To:From:Cc:Reply-To:Subject:In-Reply-To:References:From;
 b=rwqQro6mDrG9kKTjG3V2SpTlO6BpBippD85BtqfjPO7UyuMnI/Upvunw+n9KLmjZQ
 bkatLZKLE1/a4OP9IKEW+LaFp2qpV8cJlVrfJ2HiDN7P8YumO+MKElHDBpaLK2fCW6
 aHZbJRq9vR8mh0e0TpQqaOTX0TJ0whzQqbgG9jeAnuObuV6MLmU6EYd9wd267WbXkS
 uFhxXngauc+dozk3SJPDSp4MVSlCjHuUso6b8ksA4iiA3ZuZba5GZAByIrHcuc3MhV
 UUsYe2X8NJxrpKD7QKIMMsnwceNQACzB/H1YESSpdklfKtepwbtt8/UOlg8auQC8ro
 4Ll0lsI5GIUIg==
To: Tomohito Esaki <etom@igel.co.jp>
From: Simon Ser <contact@emersion.fr>
Subject: Re: [PATH 0/4] [RFC] Support virtual DRM
Message-ID: <08kxmstH-uYXe0-6PB5pM0R4Ng9s8AKF4IUiqVzHUDVR3eztlXVsNCY_syeRm6ItQtYAqUysd2NxbeF9YYY4NgwEjPEgIUza7BtuGYmFoI4=@emersion.fr>
In-Reply-To: <20210621064403.26663-1-etom@igel.co.jp>
References: <20210621064403.26663-1-etom@igel.co.jp>
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
Cc: devicetree@vger.kernel.org, Thomas Zimmermann <tzimmermann@suse.de>,
 linux-doc@vger.kernel.org, David Airlie <airlied@linux.ie>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-renesas-soc@vger.kernel.org,
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Monday, June 21st, 2021 at 08:43, Tomohito Esaki <etom@igel.co.jp> wrote=
:

> Virtual DRM splits the overlay planes of a display controller into multip=
le
> virtual devices to allow each plane to be accessed by each process.
> This makes it possible to overlay images output from multiple processes o=
n a
> display. For example, one process displays the camera image without compo=
sitor
> while another process overlays the UI.

Updating the KMS state from multiple processes doesn't sound like a
good idea. This opens up synchronization and global device limits
issues.

Are you aware of DRM leasing?
