Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B0D9544D614
	for <lists+dri-devel@lfdr.de>; Thu, 11 Nov 2021 12:50:42 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 46A0A6E9F3;
	Thu, 11 Nov 2021 11:50:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-xb34.google.com (mail-yb1-xb34.google.com
 [IPv6:2607:f8b0:4864:20::b34])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1AED16E9F3
 for <dri-devel@lists.freedesktop.org>; Thu, 11 Nov 2021 11:50:39 +0000 (UTC)
Received: by mail-yb1-xb34.google.com with SMTP id e136so14372857ybc.4
 for <dri-devel@lists.freedesktop.org>; Thu, 11 Nov 2021 03:50:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=fooishbar-org.20210112.gappssmtp.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=kNPIPwp399l+UCsFNAHoQVH86jRq+bwmQqLgC/Pk3lo=;
 b=Ei+O1e0A8OpSUCsfKkNvC/N63gYEYO6ULKzEDV+WFDcKwia5QWV4vvoBisxfD7VZbG
 ePgQK/LtnBSf1hafT1b2TIp3sOFwRkDyeYZXIprUoC38+IROwOThp5KfJNM9zkwcMQvM
 K+tiQJu6r8hZaeVeLMBfw8U9q595w8quCjfd81IRA9EFK555nVuEdh/zFcBDxl9/QxcV
 aZWMddqyZqL5arOseelNit6R6rc5Z+hA3REIdqGkpK+mwGSb+DU8KmNDg+oXgFXmMeYv
 neMrcav7BgXecTQDZ0TYmTzlFGx0KH050SLxAOJfCThf909/dLJ29DzT9hx6fTKHVpYf
 d+Ww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=kNPIPwp399l+UCsFNAHoQVH86jRq+bwmQqLgC/Pk3lo=;
 b=fwk4nrfh6RVqwxgTjpcHwxsIwSLxgHtm9XWuttW+03Km+AS7PttH/xmh0Z+kH7NHfh
 n4VwW+/T1njSd00+s1mE2ZTOyMDgn6n5m4sv8F3N30nqqsQmSjNZO7iqBbGXrk0+KJeI
 fzur47dXXjgJSC6ylC1ULVsgbw+VKCtEds5s4S9/E9cHuGlg1typwM6EHv/2/X0aL2Zo
 363Rc26QYuWAWbIJxdriz8OGM15Rw6K1rluilHn8x51dUYHvbeM9travINbMm72IimjA
 3i7Tn5MQyuChPyXnTRtGgovzjTtkg8y6cF9l0EhUpPgaLBaPZz7Zsu2lYzuuXMsVN3GX
 +u9A==
X-Gm-Message-State: AOAM533UDe7GHZSoRUxIKQH2QlEvwM2FDO1Evl8qhTDC7DE/e7MmsESY
 Gs4ohjFneZXRUeEzbmdzc+VbNtvrM2aXEU26+t8pm9LeQzI=
X-Google-Smtp-Source: ABdhPJzAPv+OrXmvQ9HuKOvfXu6i3RsR/0vPQ7qT53zgHG2+zSfZT7dtWOg0bNKUW5MKwc+VHQ3863obqFVASZKVH5Q=
X-Received: by 2002:a25:4104:: with SMTP id o4mr7251404yba.286.1636631438229; 
 Thu, 11 Nov 2021 03:50:38 -0800 (PST)
MIME-Version: 1.0
References: <20211109085601.170275-1-contact@emersion.fr>
In-Reply-To: <20211109085601.170275-1-contact@emersion.fr>
From: Daniel Stone <daniel@fooishbar.org>
Date: Thu, 11 Nov 2021 11:50:27 +0000
Message-ID: <CAPj87rNA1SzxJnT+L+Vpw8n15Gzed4rWto+OL6LdJRi0KOYReA@mail.gmail.com>
Subject: Re: [PATCH] drm: document DRM_IOCTL_MODE_GETFB2
To: Simon Ser <contact@emersion.fr>
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
Cc: dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, 9 Nov 2021 at 08:56, Simon Ser <contact@emersion.fr> wrote:
> There are a few details specific to the GETFB2 IOCTL.
>
> It's not immediately clear how user-space should check for the
> number of planes. Suggest using the pitches field.

In fairness it is perfectly clear, it's just that I never considered
calling it without master/admin because why would you ever do that?
Anyway, the docs look correct and the more the better for sure, so
this is:
Acked-by: Daniel Stone <daniels@collabora.com>
