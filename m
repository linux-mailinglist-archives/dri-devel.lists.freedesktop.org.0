Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5AE995FB1A0
	for <lists+dri-devel@lfdr.de>; Tue, 11 Oct 2022 13:39:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E127F10E2DB;
	Tue, 11 Oct 2022 11:39:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-4323.proton.ch (mail-4323.proton.ch [185.70.43.23])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D3FB710E2DB
 for <dri-devel@lists.freedesktop.org>; Tue, 11 Oct 2022 11:39:42 +0000 (UTC)
Date: Tue, 11 Oct 2022 11:39:30 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=emersion.fr;
 s=protonmail3; t=1665488381; x=1665747581;
 bh=xYLkYj6RJc4FXEI+Pjj68bM+v+X0WHqA4rt6pjMSGkQ=;
 h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
 Message-ID;
 b=TtdOibR4ADIKCQ6mnEIQFDwoSfXIPkpaZi+U7MSsCDE4lBB52St+hKr0jM/1hgrqO
 TRJIOvpi0uL8nRMFRzGFOaAlXYrKmlfQUzt4nOMcqpahGX+5kd0Mw8GS0YResn0JFN
 6NMl992fu9JCt1Z8yXMktNIr8DyGZg/IWMCPSIAZEkH/BWRKeN9GnobAta+YR0Yoyn
 N+wHnaK/UijZFgchS4zaLzuHPjI+OT+6HrHVlmhAKOakji7rCmB0+EUXjbM2KRz8sV
 gAB2E6iB0wbxBr3vl/TVbzfh4ez3ZT4IF/PvqZEtfZRQ5mVttRvDlfDB9t7q/OYAxM
 Rg5DsfTUe/C3A==
To: =?utf-8?Q?Christian_K=C3=B6nig?= <ckoenig.leichtzumerken@gmail.com>
From: Simon Ser <contact@emersion.fr>
Subject: Re: [PATCH 1/2] drm: remove DRM_MINOR_CONTROL
Message-ID: <nrRxPQtWoC6aCzSuZn5fl7wccdhP9fOpc86YTIJUlck9LK2NtPTNb5QeZa_Gsl0PYpkTn5FiCcEAzsm_C-ypBEUP4jz4avyuUwJ2P6jmX3w=@emersion.fr>
In-Reply-To: <20221011110437.15258-2-christian.koenig@amd.com>
References: <20221011110437.15258-1-christian.koenig@amd.com>
 <20221011110437.15258-2-christian.koenig@amd.com>
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
Cc: airlied@linux.ie, dri-devel@lists.freedesktop.org,
 =?utf-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tuesday, October 11th, 2022 at 13:04, Christian K=C3=B6nig <ckoenig.leic=
htzumerken@gmail.com> wrote:

> --- a/include/drm/drm_file.h
> +++ b/include/drm/drm_file.h
> @@ -54,7 +54,6 @@ struct file;
>   */
>  enum drm_minor_type {
>  =09DRM_MINOR_PRIMARY,
> -=09DRM_MINOR_CONTROL,
>  =09DRM_MINOR_RENDER,
>  };

This makes me uncomfortable: this enum no longer matches DRM_NODE_* in
libdrm.
