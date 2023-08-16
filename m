Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 599D677DBB1
	for <lists+dri-devel@lfdr.de>; Wed, 16 Aug 2023 10:07:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8600810E07B;
	Wed, 16 Aug 2023 08:07:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-4323.proton.ch (mail-4323.proton.ch [185.70.43.23])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8CB4710E07B
 for <dri-devel@lists.freedesktop.org>; Wed, 16 Aug 2023 08:07:41 +0000 (UTC)
Date: Wed, 16 Aug 2023 08:07:16 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=emersion.fr;
 s=protonmail2; t=1692173259; x=1692432459;
 bh=SO2JqcSs1hAf7clbqA22P5Or3NZrVZ6I4Ec7LsgL1fE=;
 h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
 Message-ID:BIMI-Selector;
 b=lpqJbWFvCDIUUlOZQiPbSMvIrsCCvXOdlKgqrWDFh0vqFMoQYMGNGl7npphDrU2iV
 nVlhM+y9JzhQ4WkIkh7NE10EF1ih2lSejTXkuWTDt4eQEvWwf5DLsESimcv4DAzIFl
 TpC+ullJaSq56TRq3dkYnclQl7GmQG3c1aQyHxKIklt253eAPzmMWVAipbIKObUkwy
 Yw11sIgM3lFfCIvkNTgQK4r/jpU3weP7lDcYL0dzithJ080dzni4lKH8VfX4qAApDI
 5vBr5ktJH5cc56Vgj9CznXq2BDh+aw/cgX7xSsUWlzVcdg4dXT1Za1QekpCWdYOlm0
 awvhhBZ2ChZew==
To: Erik Kurzinger <ekurzinger@nvidia.com>
From: Simon Ser <contact@emersion.fr>
Subject: Re: [PATCH] drm/syncobj: fix DRM_SYNCOBJ_WAIT_FLAGS_WAIT_AVAILABLE
Message-ID: <h5javWWoWX16S8nN5VOasUwJQahAJ3WU5LTMAHtPrCvigqObIpip3t__AvBAanLMVeAo578jHTZUHrj3HPyG8EvP9xi21w_07jDyZmeEYCM=@emersion.fr>
In-Reply-To: <7121004b-65b5-691e-c73f-67bebacd6074@nvidia.com>
References: <7121004b-65b5-691e-c73f-67bebacd6074@nvidia.com>
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
Cc: faith@gfxstrand.net, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tuesday, August 15th, 2023 at 20:19, Erik Kurzinger <ekurzinger@nvidia.c=
om> wrote:

> If DRM_IOCTL_SYNCOBJ_TIMELINE_WAIT is invoked with the
> DRM_SYNCOBJ_WAIT_FLAGS_WAIT_AVAILABLE flag set but no fence has yet been
> submitted for the given timeline point the call will fail immediately
> with EINVAL. This does not match the intended behavior where the call
> should wait until the fence has been submitted (or the timeout expires).

Good catch!

Reviewed-by: Simon Ser <contact@emersion.fr>
