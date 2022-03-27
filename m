Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 15C8D4E889E
	for <lists+dri-devel@lfdr.de>; Sun, 27 Mar 2022 17:59:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 03ED410E397;
	Sun, 27 Mar 2022 15:59:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-x736.google.com (mail-qk1-x736.google.com
 [IPv6:2607:f8b0:4864:20::736])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AA65710E397;
 Sun, 27 Mar 2022 15:59:40 +0000 (UTC)
Received: by mail-qk1-x736.google.com with SMTP id r127so9635231qke.13;
 Sun, 27 Mar 2022 08:59:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=3ZnzCFRByXntSU7k5TRZSgVAD599ZPHNRY98L+OsrQw=;
 b=DqBfb5jIk2ktmkrV+knoXXQmcfSvVoQoTGiplm8hYemtLvRyRO0gCc9VF/3i6MWNEh
 P3Kg5/MCveBJhKIZ5HfuscK8u1hQP20FZslvKQNhbYKkjqUjRfBbEZhOZCR5UsCZKb4I
 rwHgIioqNxZEzAQn8z7BLR8cSQQS4WT/b+mcXAljKFnjXpWFhVWYTkHXYfaMJ/zHfbjI
 wchaEKOaK1D0lz/vzsjvJ5vhjNm7ylxVJzdDbKcd8w+PzS4KRNTO9L2JHmoqOl+1gV8O
 KBSFOj0Z5ThEMhqbqT/h3lX1mE96yhGdAkHgM2j5JKiKDeplMIsG77RHO7dUaOXTtZsP
 Jmuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=3ZnzCFRByXntSU7k5TRZSgVAD599ZPHNRY98L+OsrQw=;
 b=NTVll7oMKXtI/cJOXB3CRwRJ5R/FuiSwRM9ouJupuG1NOrF6C5esVYrE+52gx4YHqn
 qLkmClCs735nAcy02ItH4WziNBh8JhT7Oxo9wDQ1hRIMLLBuw3rduiqx0wUi7rdgR+qg
 IEGTgKLYh4GRJfGO8O+5+NeikGhAJCTi9HKk7sDPNphH7kujkia49oUlXQRKIHFZWh6/
 a3uS7BMYB/fK+rjUb05SRiX+yU9nlIHiAFFgCOME5EgghZQxQvwL6T+oFWKzSLpUG4ax
 hG+uS2pytKOutdNb9YZhvvvGNRsMFnLod2+nUxVWBr8fiH8y0GQl5gtsUSUNjnxeT9wr
 X0nQ==
X-Gm-Message-State: AOAM532qj4IY8+MFVmfkYKZGm0TbNCsmZpsIKPcWkQKo4osaYhLIiex2
 X8Cv3wiwWy0IhSs2ftWgGrnu9Wt6Y7LcIMxRc8E=
X-Google-Smtp-Source: ABdhPJxdniX0MXVep0Yv4bjS9+PKe9AQZapJOFcqCjRTA5QaiGCa9suZ8apvfMlweJa5b3areRFbKMEWvgqcTmDfwtQ=
X-Received: by 2002:a05:620a:1a87:b0:680:cba9:ed5c with SMTP id
 bl7-20020a05620a1a8700b00680cba9ed5cmr2151933qkb.482.1648396779731; Sun, 27
 Mar 2022 08:59:39 -0700 (PDT)
MIME-Version: 1.0
References: <20220327073925.11121-1-xiam0nd.tong@gmail.com>
In-Reply-To: <20220327073925.11121-1-xiam0nd.tong@gmail.com>
From: Emil Velikov <emil.l.velikov@gmail.com>
Date: Sun, 27 Mar 2022 16:59:28 +0100
Message-ID: <CACvgo50pK3rr5UH_FyfR1pADmPRjEawi43cAecoaz7nM5AFgBg@mail.gmail.com>
Subject: Re: [PATCH] dispnv50: atom: fix an incorrect NULL check on list
 iterator
To: Xiaomeng Tong <xiam0nd.tong@gmail.com>
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
Cc: Karol Herbst <kherbst@redhat.com>, Dave Airlie <airlied@linux.ie>,
 ML nouveau <nouveau@lists.freedesktop.org>,
 "Linux-Kernel@Vger. Kernel. Org" <linux-kernel@vger.kernel.org>,
 ML dri-devel <dri-devel@lists.freedesktop.org>,
 Ben Skeggs <bskeggs@redhat.com>, yangyingliang@huawei.com,
 "# 3.13+" <stable@vger.kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sun, 27 Mar 2022 at 08:39, Xiaomeng Tong <xiam0nd.tong@gmail.com> wrote:
>
> The bug is here:
>         return encoder;
>
> The list iterator value 'encoder' will *always* be set and non-NULL
> by drm_for_each_encoder_mask(), so it is incorrect to assume that the
> iterator value will be NULL if the list is empty or no element found.
> Otherwise it will bypass some NULL checks and lead to invalid memory
> access passing the check.
>
> To fix this bug, just return 'encoder' when found, otherwise return
> NULL.
>

Isn't this covered by the upcoming list* iterator rework [1] or is
this another iterator glitch?
IMHO we should be looking at fixing the implementation and not the
hundreds of users through the kernel.

HTH
-Emil
[1] https://lwn.net/Articles/887097/
