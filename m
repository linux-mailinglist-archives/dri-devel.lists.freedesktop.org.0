Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 982663F98FC
	for <lists+dri-devel@lfdr.de>; Fri, 27 Aug 2021 14:30:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7F9906E92D;
	Fri, 27 Aug 2021 12:30:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x529.google.com (mail-ed1-x529.google.com
 [IPv6:2a00:1450:4864:20::529])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3769C6E92D
 for <dri-devel@lists.freedesktop.org>; Fri, 27 Aug 2021 12:30:16 +0000 (UTC)
Received: by mail-ed1-x529.google.com with SMTP id q3so9637309edt.5
 for <dri-devel@lists.freedesktop.org>; Fri, 27 Aug 2021 05:30:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=vanguardiasur-com-ar.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=/K61xpCiRQ+3op5aOrhoO9Yb6+RQ2HLnwLmdSAbezAc=;
 b=qZ8+rzN6RoaXRywz+Z8KeRg95H6lNUxamSqFn7UPdpEs8cmI9OyM8dlqKh0ikdDKi5
 rabP883wFHFAKROr8f5CbVn6O12UReJbDOSHpL9+ISKG048WPfXAg9UeGCPJQKPgNDoN
 UXkP6EiXIwvjwVypxJkcZeByE+UCZWFrp6f9wVLLKYfsdq8EWJSmcvVV+0WfhhocibZ2
 4x04MxWsNc0oIfsefMRVWvPkjyIirXz1WY5juB3Rd0NTbihzz5tKwt9RHuk/nBWLoGS4
 3ldrvuVDuch/92tb7zRQyG8WGWjk7GfuUA3D63gxCom0UhOXFi6el54d8rFscCRMZn2e
 QD4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=/K61xpCiRQ+3op5aOrhoO9Yb6+RQ2HLnwLmdSAbezAc=;
 b=M963lFvOZSWlB97UcJ/fBhNAMkDqWGX/u7bE2OphiTHt6VIVpxdcYEy9a2jQjmFlDO
 CP8HouysgRW4YPQCCPHJlAydjsSfs4j1G49OPsTlawKGEfoIe84KjV4Zjwt0MzSqU6zg
 F7VQ80U3uV4Spjob5IWVizlTJLLZmQZVCTI184gynRi8HWAlcP4PVJTSfymI57Ci4cKV
 zNnG0Y0RraiUIQx6RLUqMMOvkqTAptSKO7eGnYc6WpR5ilDFhisesWkjcsBjoTn3jVxJ
 d8zAIq0v2gytz1qbfMakMufcFKmmIuuaVhv25Nd2k8ZEmqqXrZibGekkn+WzDNuCE3dx
 VGsA==
X-Gm-Message-State: AOAM530I3uexvWi4H+rmUf24JBTukeCC58y/1Tsnbc5au7vx2yQe7xBz
 Uwf5jp3cQeST5HCx9LsXgde3jNSYxt0OsAPHT5ZCtw==
X-Google-Smtp-Source: ABdhPJwRe8cK23eKdCq5fSm06hgcTMh7zB/AKYp9PJ+kEHGOT0MXrud7ctMxFfiBDpil8JcerbkiCS+rVRvl1cmTWvY=
X-Received: by 2002:aa7:d6d5:: with SMTP id x21mr9658075edr.213.1630067414703; 
 Fri, 27 Aug 2021 05:30:14 -0700 (PDT)
MIME-Version: 1.0
References: <20210826091343.1039763-1-daniel.vetter@ffwll.ch>
In-Reply-To: <20210826091343.1039763-1-daniel.vetter@ffwll.ch>
From: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
Date: Fri, 27 Aug 2021 09:30:03 -0300
Message-ID: <CAAEAJfCF_1HYd1K_YGeoqSgUrBQBUVhqCSOFM7SwOAs5EaxhYA@mail.gmail.com>
Subject: Re: [PATCH] MAINTAINERS: Add dri-devel for component.[hc]
To: Daniel Vetter <daniel.vetter@ffwll.ch>
Cc: DRI Development <dri-devel@lists.freedesktop.org>,
 LKML <linux-kernel@vger.kernel.org>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 "Rafael J. Wysocki" <rafael@kernel.org>, 
 Daniel Vetter <daniel.vetter@intel.com>
Content-Type: text/plain; charset="UTF-8"
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Daniel,

On Thu, 26 Aug 2021 at 06:13, Daniel Vetter <daniel.vetter@ffwll.ch> wrote:
>
> dri-devel is the main user, and somehow there's been the assumption
> that component stuff is unmaintained.
>
> References: https://lore.kernel.org/dri-devel/CAAEAJfDWOzCJxZFNtxeT7Cvr2pWbYrfz-YnA81sVNs-rM=8n4Q@mail.gmail.com/
> Cc: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
> Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> Cc: "Rafael J. Wysocki" <rafael@kernel.org>
> Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>
> ---
>  MAINTAINERS | 5 +++++
>  1 file changed, 5 insertions(+)
>
> diff --git a/MAINTAINERS b/MAINTAINERS
> index ac58d0032abd..7cdc19815ec4 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -5707,6 +5707,11 @@ F:       Documentation/admin-guide/blockdev/
>  F:     drivers/block/drbd/
>  F:     lib/lru_cache.c
>
> +DRIVER COMPONENT FRAMEWORK
> +L:     dri-devel@lists.freedesktop.org
> +F:     drivers/base/component.c
> +F:     include/linux/component.h
> +

Thanks for taking care of this, much appreciated.

Ezequiel
