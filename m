Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9789D487CC8
	for <lists+dri-devel@lfdr.de>; Fri,  7 Jan 2022 20:05:26 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5CCBC10E4D3;
	Fri,  7 Jan 2022 19:05:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x52a.google.com (mail-pg1-x52a.google.com
 [IPv6:2607:f8b0:4864:20::52a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B08A610E584
 for <dri-devel@lists.freedesktop.org>; Fri,  7 Jan 2022 19:05:22 +0000 (UTC)
Received: by mail-pg1-x52a.google.com with SMTP id g2so6182491pgo.9
 for <dri-devel@lists.freedesktop.org>; Fri, 07 Jan 2022 11:05:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=+S72sOYOwXg9RPix1lZvjtLtkj3XFLsZ4gEDpSvt8vs=;
 b=UNlRvA2ZuRZGr24qbY8d8HRyinc6EpOYSKt7DfYa7U+pylhqD10egaBHZVcWbFvg+d
 HZZoCKimfsUYVZ6hLdx9fE8635nsrgDrj+L00L/QA/Cjac6/OItLx2Gm1LMQY7kdBjlm
 gUl11sQ+hRSXhsijE3Lz0JsafCc/WMzMcjN+p2ZjS7WJkqTYR8lO8OzMXzBLllf3FZN8
 6SuFHJFHb0+VTxIFi9KbZl/oUBDvS7ua7q/kqOUOmGT9RC+dhhVS1J2U1EpVpDJqJhew
 Efg7LRldeNgMVDWyPjGhSj7BNZ5UuIesQ0y/zYKcFCgYdMO4ccJ3NrTfKraxrHj6N1TQ
 QivQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=+S72sOYOwXg9RPix1lZvjtLtkj3XFLsZ4gEDpSvt8vs=;
 b=jbGG0UeA8xVjM5/A47fwqcyClZNwRcUkpJhRgGJoKXrcFqUAkgiYtTxC3K3Z7pq7EX
 44EjbQto3jIk5JcpD0tZ64wUOjDYiPRbMjJGh2gHEM+rLWa8RggEJ+YylV93N7wmNO47
 CJVAVbh04JKLN35EVAHeNK36aj7IsP2aSLRTv6CQZkSZVTDcfJPTRV8UvQcbK9vjkg5s
 LKYPWnplZwfh/yn12ewDhXXET1HX3jkcm5bexXFusopJtzjxYzDqAod8AANX/hQFB/QM
 9RbIfoLKykziuBi0BCfJY8dGkPEqvDOoxFVj/KyDFwylFtV3OZEWSI1+5/ShIUB0wYdd
 A5zA==
X-Gm-Message-State: AOAM532Hi63neX9X6ekRW907xBYKQmceXWJ2lZO6uXz38emgAwA59v/O
 tK2y2cEQCdRaPaZCAibHtw83C2xZ8lzDR5rIThlcOA==
X-Google-Smtp-Source: ABdhPJybEblBw8MdINxXy3+9JK7qlDbdUwo1shN48fzEsrE5iAHxprn/bdZ6bdR1DoPb8Rx12GSfNjxZRna6xpg2RNM=
X-Received: by 2002:a05:6a00:1249:b0:4bb:4a31:1e0a with SMTP id
 u9-20020a056a00124900b004bb4a311e0amr65535466pfi.81.1641582321973; Fri, 07
 Jan 2022 11:05:21 -0800 (PST)
MIME-Version: 1.0
References: <20211222001127.3337471-1-rajatja@google.com>
 <20211222001127.3337471-2-rajatja@google.com>
 <Ydh7u1kuXSMzwmW0@google.com>
In-Reply-To: <Ydh7u1kuXSMzwmW0@google.com>
From: Rajat Jain <rajatja@google.com>
Date: Fri, 7 Jan 2022 11:04:46 -0800
Message-ID: <CACK8Z6HbKR5QktJjK1+QCKoLCJUHK8btQN5Xbij8A66VYzhcHw@mail.gmail.com>
Subject: Re: [PATCH v4 2/3] platform/chrome: Add driver for ChromeOS
 privacy-screen
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
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
Cc: gwendal@google.com, marcheu@google.com,
 Thomas Zimmermann <tzimmermann@suse.de>, seanpaul@google.com,
 ibm-acpi-devel@lists.sourceforge.net, David Airlie <airlied@linux.ie>,
 linux-kernel@vger.kernel.org, platform-driver-x86@vger.kernel.org,
 Mark Gross <markgross@kernel.org>, Hans de Goede <hdegoede@redhat.com>,
 dri-devel@lists.freedesktop.org, Henrique de Moraes Holschuh <hmh@hmh.eng.br>,
 rajatxjain@gmail.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Dmitry, Benson,

On Fri, Jan 7, 2022 at 9:43 AM Dmitry Torokhov
<dmitry.torokhov@gmail.com> wrote:
>
> Hi Rajat,
>
> On Tue, Dec 21, 2021 at 04:11:26PM -0800, Rajat Jain wrote:
> > +static int chromeos_privacy_screen_remove(struct acpi_device *adev)
> > +{
> > +     struct drm_privacy_screen *drm_privacy_screen = acpi_driver_data(adev);
>
> Please add an empty line here:
>
> WARNING: Missing a blank line after declarations
> #292: FILE: drivers/platform/chrome/chromeos_privacy_screen.c:129:
> +       struct drm_privacy_screen *drm_privacy_screen = acpi_driver_data(adev);
> +       drm_privacy_screen_unregister(drm_privacy_screen);
>
> > +     drm_privacy_screen_unregister(drm_privacy_screen);
> > +     return 0;
> > +}
> > +
> > +static const struct acpi_device_id chromeos_privacy_screen_device_ids[] = {
> > +     {"GOOG0010", 0}, /* Google's electronic privacy screen for eDP-1 */
> > +     {}
> > +};
> > +MODULE_DEVICE_TABLE(acpi, chromeos_privacy_screen_device_ids);
> > +
> > +static struct acpi_driver chromeos_privacy_screen_driver = {
> > +     .name = "chromeos_privacy_screen_drvr",
>
> Could I buy 2 move vowels? ;)
>
> > +     .class = "ChromeOS",
> > +     .ids = chromeos_privacy_screen_device_ids,
> > +     .ops = {
> > +             .add = chromeos_privacy_screen_add,
> > +             .remove = chromeos_privacy_screen_remove,
> > +     },
> > +};
> > +
> > +module_acpi_driver(chromeos_privacy_screen_driver);
> > +MODULE_LICENSE("GPL v2");
> > +MODULE_DESCRIPTION("ChromeOS ACPI Privacy Screen driver");
> > +MODULE_AUTHOR("Rajat Jain <rajatja@google.com>");
>
> Otherwise
>
> Reviewed-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>

Thanks! I took care of your comments and posted a v5:
https://patchwork.kernel.org/project/platform-driver-x86/patch/20220107190208.95479-2-rajatja@google.com/

Thanks & Best Regards,

Rajat


>
> Thanks.
>
> --
> Dmitry
