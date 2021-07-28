Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C6B2B3D92B5
	for <lists+dri-devel@lfdr.de>; Wed, 28 Jul 2021 18:03:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8B16D6E8A7;
	Wed, 28 Jul 2021 16:03:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ua1-x930.google.com (mail-ua1-x930.google.com
 [IPv6:2607:f8b0:4864:20::930])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 051DB6E8A7
 for <dri-devel@lists.freedesktop.org>; Wed, 28 Jul 2021 16:03:34 +0000 (UTC)
Received: by mail-ua1-x930.google.com with SMTP id j7so1285408uaj.10
 for <dri-devel@lists.freedesktop.org>; Wed, 28 Jul 2021 09:03:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=e028qpFiEN6pE1p9Z+hkByATyqBMa+hXycEeUkEN5us=;
 b=lMtKSwKOMhSXMgrhGuHeXlRuHc0OzfNKOXS4j+eAnPTZaylGpo0nWxgVshJPPA7dSW
 Tc5mofXQdo25Kcc2fnlYpyJTPPCUHHLpwjVsDn7yb1yo2Zt4eJ0t2i4CLHhhpaYa9URa
 kAh4eRuwqVxZujy5iCK1rTBs5wJHPsM/f3GkjqZ4mtXLRFY6vHXH0kKUt7EKFnUW8jER
 CdiSf027yC0vAZTLZ6GlGNM8o/RBDcUxORRpTHuVBYeiv4hWnpnmMLeLSPnrKh0/lTYg
 eUKCvoVlmJIlCPO1iIf5hesKWRyS+M3FkqT9pMREGzBPpBzgwDPRidqiHpGEnSQxN3ZI
 iVRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=e028qpFiEN6pE1p9Z+hkByATyqBMa+hXycEeUkEN5us=;
 b=XGOxZqU0UOJq49wu+cscRlkb5prAnNQLJeAGIPEsyzzLSt6cuDe/W5nnCxE4bJcVmz
 +aSYqa7cDr1qB3IKofu9jUgufNuNd5BVD0LYI+XL3UNCLwCI/gQsD9mFg+NkyzYg8qCB
 3m6j3inku1c3qrgPkci8IlHWNTj2AoXu42NIUUh2H05ABhjCJkcZfHjbmO8oagi0YeVE
 hyHUE9Gge9YL0M/8Bqk65V/LPWSzMC03sU+qExiPXq1eMngARehAuY7V/VJ2gE6MAx84
 NM7XT+wEl2wtScDh0UFKhY5R1z+VXRoOdJ6xxnBtqgrrz60W7UVWjDoC46hcvuDWBGzc
 jRQw==
X-Gm-Message-State: AOAM530RpQZku+ZwQqjm9uD6s5lbfsCkYxQozCFcjY4svJbO8rPgRzSf
 fCYRY0KfGsf5SJm7vcYG1zCm7jcRQ9XsREQxF0E=
X-Google-Smtp-Source: ABdhPJzJSKzqO1+ZSjRHME6kbEmz6tiBpA5JU8JgO8MFdxvCstGjsf9X8Y8RkZA/Rbc1bMMIDa4Zu2ojt/Y272F5PJM=
X-Received: by 2002:ab0:7187:: with SMTP id l7mr670183uao.13.1627488213023;
 Wed, 28 Jul 2021 09:03:33 -0700 (PDT)
MIME-Version: 1.0
References: <20210721175526.22020-1-sean@poorly.run>
 <20210721175526.22020-6-sean@poorly.run>
In-Reply-To: <20210721175526.22020-6-sean@poorly.run>
From: jim.cromie@gmail.com
Date: Wed, 28 Jul 2021 12:03:07 -0400
Message-ID: <CAJfuBxwrHy5fwVBv+Jur=-=OeitRBWdnL0WwpaN3DwQFnrb3ug@mail.gmail.com>
Subject: Re: [RESEND PATCH v6 05/14] drm/print: rename drm_debug* to be more
 syslog-centric
To: Sean Paul <sean@poorly.run>
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
Cc: David Airlie <airlied@linux.ie>, daniel.vetter@ffwll.ch,
 dri-devel@lists.freedesktop.org, Sean Paul <seanpaul@chromium.org>,
 Thomas Zimmermann <tzimmermann@suse.de>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Jul 21, 2021 at 1:55 PM Sean Paul <sean@poorly.run> wrote:
>
> From: Sean Paul <seanpaul@chromium.org>
>
> In preparation for tracefs support, rename drm_debug related functions
> to reflect that it targets the syslog. This will allow us to selectively
> target syslog and/or tracefs.
>
> No functional changes here.

I feel like a fish asking "whats water?"

from a parochial dynamic-debug view, there is only syslog.
(maybe theres also console, I try not to think of the rogue tty gonna eat me)

is there something in the tracefs work that makes this necessary ?
