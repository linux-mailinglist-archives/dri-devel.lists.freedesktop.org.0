Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 92A1C4B6675
	for <lists+dri-devel@lfdr.de>; Tue, 15 Feb 2022 09:48:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8069C10E40C;
	Tue, 15 Feb 2022 08:48:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CD7A810E3F4
 for <dri-devel@lists.freedesktop.org>; Tue, 15 Feb 2022 08:48:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1644914879;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=+0eleqiUVBeAPaQGD2Q6ihFW/Z9JIAN0Kj0GeNRsLaA=;
 b=ayphHF/zz/QRT1LtgSyf1ZNurdY3ZWjlPMleazOL4obzkYrLOaUkjPHx48MLeXSGDjEml3
 FgDcGj7sk8oOyMZq9cCqhrWx8PKM5uzJ5/FEKp9yGBqW98g1a81XVSY6c/juNsND1Haz75
 Sh5yTD9yDaBontOCOez+FBIoh5O7Jzk=
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com
 [209.85.216.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-189-wqDijQCsMeKAZ0yhAV2t0A-1; Tue, 15 Feb 2022 03:47:55 -0500
X-MC-Unique: wqDijQCsMeKAZ0yhAV2t0A-1
Received: by mail-pj1-f69.google.com with SMTP id
 w3-20020a17090ac98300b001b8b914e91aso1396151pjt.0
 for <dri-devel@lists.freedesktop.org>; Tue, 15 Feb 2022 00:47:55 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=+0eleqiUVBeAPaQGD2Q6ihFW/Z9JIAN0Kj0GeNRsLaA=;
 b=3QWi85iBAHaXpJMmr79OPsAQ8tOh+RNqgEG4/b4geJqeiyqfJRfHUortMBVWWAaaT5
 kraFEa6dpnjo4pm8sqv6lh3Q+rKSmxKH+a1huZZEwAKCdRZexDc0rOzS9K3Mfj34kejd
 cLti5tagVcAJjip6iguASxn0BlEY7ttN7FFpbHJSR0hAlmoq2PLlU61F9zcWLLd1vwZh
 drsErswBiCGG/nwcik6MoI4D7StAiFz7AEWuRDkXIWpvL9GXfXTPn81pARZzZG4vgpVG
 cK9Vg178OlBeHZm4O9mhOtdd7LvZOZuJfm6HdnwViHm7typVzyqKi1jIzldwIV5+ScTm
 Jtfw==
X-Gm-Message-State: AOAM532Nv9Q4ezbErdm1OZ/ZgV1MWFENlPpqXIc0HDcyTLdg3SdpTC/c
 knt+cfb7CPR1uu3f/9Hs+IPbZNv25DI6TFyIm03PL1/GSC7ezRBEKGUeJ5iMO9dPPidR1SZ1x7O
 OFyVzDGDGvBK//P4ofJ5yQlCs7vOgUGYWLdYNIjMwnEZO
X-Received: by 2002:a05:6a00:9a9:: with SMTP id
 u41mr3233702pfg.83.1644914874666; 
 Tue, 15 Feb 2022 00:47:54 -0800 (PST)
X-Google-Smtp-Source: ABdhPJy1RXfHqGKUOwHiOd9TXDCmkRfLOApnv8+NP4UBdUIs2zHseVmQ3Z770IwhZgE/Zg1NSmgYeteqUdN9fAOzix8=
X-Received: by 2002:a05:6a00:9a9:: with SMTP id
 u41mr3233676pfg.83.1644914874405; 
 Tue, 15 Feb 2022 00:47:54 -0800 (PST)
MIME-Version: 1.0
References: <1644890154-64915-1-git-send-email-wangqing@vivo.com>
 <1644890154-64915-6-git-send-email-wangqing@vivo.com>
In-Reply-To: <1644890154-64915-6-git-send-email-wangqing@vivo.com>
From: Benjamin Tissoires <benjamin.tissoires@redhat.com>
Date: Tue, 15 Feb 2022 09:47:43 +0100
Message-ID: <CAO-hwJJK5yeW+K_vLpWV9t3TsEdk0xCO-ETxeJsXM2c117JzNw@mail.gmail.com>
Subject: Re: [PATCH V3 5/13] hid: use time_is_after_jiffies() instead of open
 coding it
To: Qing Wang <wangqing@vivo.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=btissoir@redhat.com
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
Cc: Dmitry Torokhov <dmitry.torokhov@gmail.com>,
 Mike Snitzer <snitzer@redhat.com>, David Airlie <airlied@linux.ie>,
 Michael Turquette <mturquette@baylibre.com>, dri-devel@lists.freedesktop.org,
 Hans Verkuil <hverkuil@xs4all.nl>, dm-devel@redhat.com,
 Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>,
 linux-clk@vger.kernel.org, Alasdair Kergon <agk@redhat.com>,
 amd-gfx@lists.freedesktop.org,
 "open list:HID CORE LAYER" <linux-input@vger.kernel.org>,
 xen-devel@lists.xenproject.org, linux-media@vger.kernel.org,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 intel-gfx@lists.freedesktop.org, Jiri Kosina <jikos@kernel.org>,
 linux-block@vger.kernel.org, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Jens Axboe <axboe@kernel.dk>,
 Stephen Boyd <sboyd@kernel.org>, "Pan, Xinhui" <Xinhui.Pan@amd.com>,
 lkml <linux-kernel@vger.kernel.org>, Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Feb 15, 2022 at 2:56 AM Qing Wang <wangqing@vivo.com> wrote:
>
> From: Wang Qing <wangqing@vivo.com>
>
> Use the helper function time_is_{before,after}_jiffies() to improve
> code readability.
>
> Signed-off-by: Wang Qing <wangqing@vivo.com>
> Acked-by: Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>

FWIW, this one is
Acked-by: Benjamin Tissoires <benjamin.tissoires@redhat.com>

Wang, is there any plan to take this series through the trivial tree
or should each maintainer take the matching patches?

Cheers,
Benjamin

> ---
>  drivers/hid/intel-ish-hid/ipc/ipc.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/hid/intel-ish-hid/ipc/ipc.c b/drivers/hid/intel-ish-hid/ipc/ipc.c
> index 8ccb246..15e1423
> --- a/drivers/hid/intel-ish-hid/ipc/ipc.c
> +++ b/drivers/hid/intel-ish-hid/ipc/ipc.c
> @@ -578,7 +578,7 @@ static void _ish_sync_fw_clock(struct ishtp_device *dev)
>         static unsigned long    prev_sync;
>         uint64_t        usec;
>
> -       if (prev_sync && jiffies - prev_sync < 20 * HZ)
> +       if (prev_sync && time_is_after_jiffies(prev_sync + 20 * HZ))
>                 return;
>
>         prev_sync = jiffies;
> --
> 2.7.4
>

