Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B94C2304244
	for <lists+dri-devel@lfdr.de>; Tue, 26 Jan 2021 16:22:56 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8A8AB6E069;
	Tue, 26 Jan 2021 15:22:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x134.google.com (mail-lf1-x134.google.com
 [IPv6:2a00:1450:4864:20::134])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6A23B6E069
 for <dri-devel@lists.freedesktop.org>; Tue, 26 Jan 2021 15:22:53 +0000 (UTC)
Received: by mail-lf1-x134.google.com with SMTP id i187so12934415lfd.4
 for <dri-devel@lists.freedesktop.org>; Tue, 26 Jan 2021 07:22:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=4+mBnR3VXkaRy9N4OGkkdcyJa4ZmDlJBBt01ZGkJAXs=;
 b=AfwqIi885h0UWkW29YOZV5Lde+xpkHcW9kNV2bCWZOTzbUWT/sbstMW4AA2/xl3kfk
 0efaE9AMlSPbt16b0+3qPIbzOLjmiiKU/bGGgIPkLnTdHFf2st+6I3CPYhzoKvVKKfYF
 3Oopufis/JRKY11nnrUQdYQ8CKyfQaQKhSKbhKnM6rSS/1g9kNu8Fe0Kd3sfoEDDCtI9
 rFvSd/Y/ghtLUXIX7TB5gm1b5yzHpiPhWP8FEckt3U6OMu0ZZGMdslPtWIpDi/5/FtLp
 U72I7i/Wc2BpALP11ajlxoe5/p/QipOqqaVtp0B6+B/JXRgPHVlz0niF0kIfDAwcz73I
 WnvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=4+mBnR3VXkaRy9N4OGkkdcyJa4ZmDlJBBt01ZGkJAXs=;
 b=bf15OOkICfNcDTh6v0mevRYQDe0y8Bei3yAYgdNs4RkLJu/ZyaEFAM9uIoMDvAYFza
 nP3hBRdAQe09pb8mL6TI07iQ8h5p+OOxy0sx3aetymMac+AAAIZaXJV6iDlij4QjTAti
 2w206br+/47owcXNkCU/3MAgETcB1+uxDlCsBNl4Q/1YJUO+FVVWGTBr4SNOu5EAcfFO
 xNwbrJK7sJWKbLkolFCuinTTWy/30tj9jIQIsttvXTTpmyI4Bg9gDn7PSlqZS4FOaG/F
 /ZiHoHhkgfQqtTGqEW5Ecurq4+rGc7Jtd0B8NpSl+vq33uNiMV3pxVEohdy+niEcH0Iq
 +N/A==
X-Gm-Message-State: AOAM532lj9tTFPefFzrz29VJX0lW4Lmean4NYhk9Ob9Hgab5XxMjv3Ot
 YwgfYFBnd0n3vO0HKZ7mNBYYg/lNLNRb2psAUtI=
X-Google-Smtp-Source: ABdhPJxmhAGVYKyYPou5zTitgoNIUKx4ylZWLEkZUUua5BVLo1gqz/4FfNng1wXXktSOawRGZGtUoRVXKmh3ahMaRO8=
X-Received: by 2002:a19:7ecf:: with SMTP id z198mr2752766lfc.650.1611674571883; 
 Tue, 26 Jan 2021 07:22:51 -0800 (PST)
MIME-Version: 1.0
References: <YBANNJ8XtoRf7SuW@smile.fi.intel.com>
In-Reply-To: <YBANNJ8XtoRf7SuW@smile.fi.intel.com>
From: Patrik Jakobsson <patrik.r.jakobsson@gmail.com>
Date: Tue, 26 Jan 2021 16:22:40 +0100
Message-ID: <CAMeQTsbGBrTvfkz6BStwL240Kz-dbrQVKtXbYkRtbD3OoUKCcg@mail.gmail.com>
Subject: Re: [GIT PULL] ib-drm-gpio-pdx86-rtc-wdt-v5.12-1
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
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
Cc: linux-rtc@vger.kernel.org, Alessandro Zummo <a.zummo@towertech.it>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Mark Gross <mgross@linux.intel.com>, linux-watchdog@vger.kernel.org,
 linux-gpio@vger.kernel.org, dri-devel <dri-devel@lists.freedesktop.org>,
 platform-driver-x86@vger.kernel.org, Hans de Goede <hdegoede@redhat.com>,
 Bartosz Golaszewski <bgolaszewski@baylibre.com>,
 Wim Van Sebroeck <wim@linux-watchdog.org>, Guenter Roeck <linux@roeck-us.net>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Jan 26, 2021 at 1:37 PM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:
>
> Hi guys,
>
> This is first part of Intel MID outdated platforms removal. It's collected into
> immutable branch with a given tag, please pull to yours subsystems.

Hi Andy,
Do you plan on eventually removing X86_INTEL_MID completely? If so,
then I should probably start looking at removing the corresponding
parts in GMA500.

Thanks
Patrik
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
