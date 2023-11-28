Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 99D6A7FBAA5
	for <lists+dri-devel@lfdr.de>; Tue, 28 Nov 2023 14:00:26 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 42CFC10E508;
	Tue, 28 Nov 2023 13:00:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oa1-f44.google.com (mail-oa1-f44.google.com
 [209.85.160.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0CD7110E508
 for <dri-devel@lists.freedesktop.org>; Tue, 28 Nov 2023 13:00:22 +0000 (UTC)
Received: by mail-oa1-f44.google.com with SMTP id
 586e51a60fabf-1fa1e17a0b1so597892fac.1
 for <dri-devel@lists.freedesktop.org>; Tue, 28 Nov 2023 05:00:22 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1701176421; x=1701781221;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=izpuOZu6B1FXpmXyClCOOq7hLe9BRki4gCMUdF0sfoE=;
 b=OeBzkYt1ngqZNqr55KITL77nk5TNFJpsUjOBwLycQfeOgRKgzX5MEkXEhxkZiAQQmF
 GiuML0Aaa8gZkhnoKKvzUATJv5pfP7JGSv+XxHtSuenyHTxtkm+vAyiiTj4/vS8svgMY
 Ah/5CDzeNG84eZAe8giK60Yf62Rn2ghBmIqR66xwMeRgicFUA4Q/CpJnrcz/QUgNCc6r
 5eEmxAB51Gtru0e2OCs8BmMkrPcZq/itAs9KxZbQJNZcCqDpj5p8ifUYstVzZC7qaJNK
 +BwtNRk6BhyZkRqStThbh7FM9LTsav8jrRRQ0f7EVAuRqH9IZdhQV//TjpnuJnzMK7mr
 2Ayw==
X-Gm-Message-State: AOJu0YwAWWji8Lijya7MVj+H+7DWDS44FWBTmm9p+4NRNIkVdG2kVIhq
 7/CFOyk0RpKnexderDw+30dbWrqEeYiUYHJWhLU=
X-Google-Smtp-Source: AGHT+IH3xR6DOsCkD1of/eXssJ1e/6sSIiopYReTW26r7dLvwzjn2ck3KdQA/zJ/sEzTXs4F9DTlnuSwrVIOzIMnplg=
X-Received: by 2002:a05:6870:168d:b0:1fa:132a:ad11 with SMTP id
 j13-20020a056870168d00b001fa132aad11mr16243385oae.2.1701176421293; Tue, 28
 Nov 2023 05:00:21 -0800 (PST)
MIME-Version: 1.0
References: <2023112815-faculty-thud-add8@gregkh>
In-Reply-To: <2023112815-faculty-thud-add8@gregkh>
From: "Rafael J. Wysocki" <rafael@kernel.org>
Date: Tue, 28 Nov 2023 14:00:10 +0100
Message-ID: <CAJZ5v0j-+AbutYRbvoU_8Du6VNevvRW_HOD5BZAzgOSoy2ZiuQ@mail.gmail.com>
Subject: Re: [PATCH] driver core: make device_is_dependent() static
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Content-Type: text/plain; charset="UTF-8"
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
Cc: Saravana Kannan <saravanak@google.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, "Rafael J. Wysocki" <rafael@kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Nov 28, 2023 at 11:28=E2=80=AFAM Greg Kroah-Hartman
<gregkh@linuxfoundation.org> wrote:
>
> The function device_is_dependent() is only called by the driver core
> internally and should not, at this time, be called by anyone else
> outside of it, so mark it as static so as not to give driver authors the
> wrong idea.
>
> Cc: "Rafael J. Wysocki" <rafael@kernel.org>
> Cc: Saravana Kannan <saravanak@google.com>
> Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>

Acked-by: "Rafael J. Wysocki" <rafael@kernel.org>

> ---
>  drivers/base/core.c    | 2 +-
>  include/linux/device.h | 1 -
>  2 files changed, 1 insertion(+), 2 deletions(-)
>
> diff --git a/drivers/base/core.c b/drivers/base/core.c
> index dafdb9970901..6dcc26eec096 100644
> --- a/drivers/base/core.c
> +++ b/drivers/base/core.c
> @@ -298,7 +298,7 @@ static inline bool device_link_flag_is_sync_state_onl=
y(u32 flags)
>   * Check if @target depends on @dev or any device dependent on it (its c=
hild or
>   * its consumer etc).  Return 1 if that is the case or 0 otherwise.
>   */
> -int device_is_dependent(struct device *dev, void *target)
> +static int device_is_dependent(struct device *dev, void *target)
>  {
>         struct device_link *link;
>         int ret;
> diff --git a/include/linux/device.h b/include/linux/device.h
> index c11d60cabaab..6a4ee40af3df 100644
> --- a/include/linux/device.h
> +++ b/include/linux/device.h
> @@ -1071,7 +1071,6 @@ int device_rename(struct device *dev, const char *n=
ew_name);
>  int device_move(struct device *dev, struct device *new_parent,
>                 enum dpm_order dpm_order);
>  int device_change_owner(struct device *dev, kuid_t kuid, kgid_t kgid);
> -int device_is_dependent(struct device *dev, void *target);
>
>  static inline bool device_supports_offline(struct device *dev)
>  {
> --
> 2.43.0
>
