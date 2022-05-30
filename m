Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 477CD537617
	for <lists+dri-devel@lfdr.de>; Mon, 30 May 2022 09:55:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3B9F210E241;
	Mon, 30 May 2022 07:55:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-4317.proton.ch (mail-4317.proton.ch [185.70.43.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6C53D10E28E
 for <dri-devel@lists.freedesktop.org>; Mon, 30 May 2022 07:55:39 +0000 (UTC)
Date: Mon, 30 May 2022 07:55:34 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=emersion.fr;
 s=protonmail2; t=1653897336; x=1654156536;
 bh=EPS2InUyK3m4FMz9jgSKih+bd2gRxJzD1JY0wM5T73I=;
 h=Date:To:From:Cc:Reply-To:Subject:Message-ID:In-Reply-To:
 References:Feedback-ID:From:To:Cc:Date:Subject:Reply-To:
 Feedback-ID:Message-ID;
 b=GGGznFgaf+WVdSWj7BC0b6Lz9ITLAQ+6BVe+BzDnyiuvz1PTHAfDlIHuISKCx/lsI
 SvimSim51evlCvOXL5vjwTCxHPJQXh8IizzCGJW+w157SdtEgV0hXvj2atCUoeemDY
 +P8b//86maNv1be6tVrKmxoQ3gdcr/RyR227f+tvCF4O5fSo+LLwwFOyemD8sSs7It
 /gFpIk8EZLOGexl5plPOXlNDiFq4do1Yn2s7I/wnZuXm0pGSBqorFUVGydMdOC0EW6
 66+ZeAaYZ6GM3at08HFHEdX9j59NHZCAROfPDoGrrOV6qmMOLQj1+ghjdiWPcgetC/
 ZeNuGlzOQyA4w==
To: =?utf-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
From: Simon Ser <contact@emersion.fr>
Subject: Re: [PATCH v3] dma-buf: Add a capabilities directory
Message-ID: <UGoyFVc9iEZ71g8hhKM6wxpukFrBLTugOVxKMRXIgSi85_bv_Gc6965qxze48mS_SEz6ixfORQxZEeAqOo1ySe3qTaJpwYf7zaf1hTODmLs=@emersion.fr>
In-Reply-To: <dbee55fd-37ac-d7cd-dc78-d72776dfdfac@amd.com>
References: <20220527073422.367910-1-contact@emersion.fr>
 <dbee55fd-37ac-d7cd-dc78-d72776dfdfac@amd.com>
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
Cc: Jason Ekstrand <jason.ekstrand@collabora.com>, Greg KH <greg@kroah.com>,
 dri-devel@lists.freedesktop.org, Daniel Vetter <daniel.vetter@ffwll.ch>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Monday, May 30th, 2022 at 09:09, Christian K=C3=B6nig <christian.koenig@=
amd.com> wrote:

> I find a separate directory rather unusual, but can't come up with any
> better idea either.
>
> IIRC the security module had a mask file with names for the supported
> capabilities.

Are you referring to /sys/kernel/security/lsm?

This sounds more painful to parse from user-space. Instead of a simple
stat(), user-space would need to read the file, split on commas, and
compare strings.
