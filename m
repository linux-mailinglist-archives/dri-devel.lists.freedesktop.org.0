Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 839413D46FB
	for <lists+dri-devel@lfdr.de>; Sat, 24 Jul 2021 11:54:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F1A756E0D0;
	Sat, 24 Jul 2021 09:54:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [216.205.24.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2BC786E0C6
 for <dri-devel@lists.freedesktop.org>; Sat, 24 Jul 2021 09:54:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1627120486;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=4c+xqVW7MfBsa5VDqyOX8qekDnp6U6DnRr3TNr1ss8g=;
 b=WxPlGU7e2lBai5ITzm77DQ7UNCjTi5orFn0hz3FLjQODnRZoQM6bgpJMXyJxtrdaoIamW7
 Kzw1mz6txK7J0FPnUXhb91z5HT5faUnsFWaQatEGQPaf+j3s3tRe/DuvIr0O+NKwxsWNER
 tNxj7Gbz9Wzc3NYD7+HBB8HyCGUPUUM=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-215--shLghz4PWqJbPGso3OwGA-1; Sat, 24 Jul 2021 05:54:42 -0400
X-MC-Unique: -shLghz4PWqJbPGso3OwGA-1
Received: by mail-wm1-f69.google.com with SMTP id
 f10-20020a7bcc0a0000b0290229a389ceb2so1936849wmh.0
 for <dri-devel@lists.freedesktop.org>; Sat, 24 Jul 2021 02:54:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=4c+xqVW7MfBsa5VDqyOX8qekDnp6U6DnRr3TNr1ss8g=;
 b=HDKThtFcGo44bHK4dIEoobzbVukN2C/ttpn+t31KdQOPMzyiZecoLm2ToiCm2D0Fn7
 ++zqstlhl1pR3Cjj5FW7wKZml4/gKNEyOmdfEk5yjSWXCGB5TYYPpn9Vdb+rUqsvUNO1
 /LAdS3A5BmST5/MwIjq4+Vx5ZwxK3iI7zTqtRIcszR9kRU5NCXlhdAIRL1yv96UZIqx2
 WjrQZJnYkX550T2hbKLm4KqZzpZOcG2f+z4FCZ3MBEbbuAhenSY8aK6EoXwW5KmWQwLS
 K9QipzBpCszhkVWl4fcMLpsQ7pWZRYj6BVqWsoYh31ZoVc1yxfHe7FacVZuvgRyPZCPy
 rFVw==
X-Gm-Message-State: AOAM5308LDfSliYdodubmUt6Dopy7SXxq1g0YnPR6WSm0ThmkxOUaASR
 M3dQoDAbfjYcsZthoFA4EUXQ1MLx4WsQI6Uv7XHi+ELdApLdtG1se3u7jYHpnhanGeIhmBBSmNe
 lZ18x/Tb/uhCedZO6i8fHKSOYnUPyOcCJLrqKXzl7XgSQ
X-Received: by 2002:adf:a148:: with SMTP id r8mr8978534wrr.415.1627120481426; 
 Sat, 24 Jul 2021 02:54:41 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwwwMalzdNDmZeupmmuzGaDQDj9isYPnXIp/RVrPJIn29iuFfmxbG0uKGKcUX72MK2H2D25PbjolghFSWdAD9M=
X-Received: by 2002:adf:a148:: with SMTP id r8mr8978515wrr.415.1627120481145; 
 Sat, 24 Jul 2021 02:54:41 -0700 (PDT)
MIME-Version: 1.0
References: <20210723224617.3088886-1-kherbst@redhat.com>
 <CAK8P3a3u_jsxQW4dPXtsdKkw1mjKXL-h=qN1SGHytvUMPf3fPw@mail.gmail.com>
In-Reply-To: <CAK8P3a3u_jsxQW4dPXtsdKkw1mjKXL-h=qN1SGHytvUMPf3fPw@mail.gmail.com>
From: Karol Herbst <kherbst@redhat.com>
Date: Sat, 24 Jul 2021 11:54:30 +0200
Message-ID: <CACO55tuNWk6emjnnukgv9h-9jbpVP564Ogmi7TGbybc9n5v+ZQ@mail.gmail.com>
Subject: Re: [PATCH] nouveau: make backlight support non optional
To: Arnd Bergmann <arnd@kernel.org>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kherbst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
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
Cc: ML nouveau <nouveau@lists.freedesktop.org>,
 Randy Dunlap <rdunlap@infradead.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>, Ben Skeggs <bskeggs@redhat.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sat, Jul 24, 2021 at 8:55 AM Arnd Bergmann <arnd@kernel.org> wrote:
>
> On Sat, Jul 24, 2021 at 12:47 AM Karol Herbst <kherbst@redhat.com> wrote:
> >
> > In the past this only led to compilation issues. Also the small amount of
> > extra .text shouldn't really matter compared to the entire nouveau driver
> > anyway.
> >
>
> >         select DRM_TTM_HELPER
> > -       select BACKLIGHT_CLASS_DEVICE if DRM_NOUVEAU_BACKLIGHT
> > -       select ACPI_VIDEO if ACPI && X86 && BACKLIGHT_CLASS_DEVICE && INPUT
> > +       select BACKLIGHT_CLASS_DEVICE
> > +       select ACPI_VIDEO if ACPI && X86 && INPUT
> >         select X86_PLATFORM_DEVICES if ACPI && X86
> >         select ACPI_WMI if ACPI && X86
>
> I think the logic needs to be the reverse: instead of 'select
> BACKLIGHT_CLASS_DEVICE',
> this should be 'depends on BACKLIGHT_CLASS_DEVICE', and the same for ACPI_VIDEO.
>
> We may want to add 'default DRM || FB' to BACKLIGHT_CLASS_DEVICE in the
> process so we don't lose it for users doing 'make oldconfig' or 'make defconfig'
>

yeah.. not sure. I tested it locally (config without backlight
enabled) and olddefconfig just worked. I think the problem with
"depends" is that the user needs to enable backlight support first
before even seeing nouveau and I don't know if that makes sense. But
maybe "default" is indeed helping here in this case.

> The rest of the patch looks good to me.
>
>        Arnd
>

