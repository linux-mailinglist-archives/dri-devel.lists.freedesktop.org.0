Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A25F1791800
	for <lists+dri-devel@lfdr.de>; Mon,  4 Sep 2023 15:25:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BD46810E357;
	Mon,  4 Sep 2023 13:24:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0767B10E357
 for <dri-devel@lists.freedesktop.org>; Mon,  4 Sep 2023 13:24:56 +0000 (UTC)
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-315-bKNb--iEOeywVLi4FGt3Mw-1; Mon, 04 Sep 2023 09:24:54 -0400
X-MC-Unique: bKNb--iEOeywVLi4FGt3Mw-1
Received: by mail-wm1-f71.google.com with SMTP id
 5b1f17b1804b1-3fbdf341934so8923435e9.3
 for <dri-devel@lists.freedesktop.org>; Mon, 04 Sep 2023 06:24:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1693833893; x=1694438693;
 h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
 :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=xPaq3CuDZRpQmuDqucr0HZhD9ZzK56uaUpku88i4nOk=;
 b=KUGEHHqYBujnfACi6wVH8dOAQ8ll3YvVgZD4vWqEofyauBTyA8s+HVjPQRa7xEmtwQ
 edQ+MJW1vh0H2GUPRhvHO7lve63oFViFAz6EM8WZxs1kiNOGT1k1rzBzy5Djp1d9mwMM
 GkYltPcAC6/+oolDoacPp0qDbQju1m/MHRRm9ap+MY4lR17l6KiD6Ax6KS7tq4OhvnqB
 px94natJphEsvY5T9amy223wgXLpelEAVQb/IjqSVsaKz7WE2x/i/uh5aO5iOriv4Rds
 El5X/nkB63FYK6tysyWJFhsugyItO9RM/oFG+oAweTYlJHGUBDTp5a6Zu9K9QCYFGSmv
 5ARw==
X-Gm-Message-State: AOJu0YwyjMZektgv83CtvG22E4Xb4J/d0XRkzzqXQU6rVHGGsq1dLF84
 SDfcyyNt2F+BO75vAU5OND/N9n+wc5nrspXt3C7oGDDjXgz/9QKV41uCI+e4pZGhWYe8IxcPrKi
 nvZV+h0y8oIs9JCT41bhLCgsr50zU
X-Received: by 2002:a7b:ce18:0:b0:3fb:f0ef:4669 with SMTP id
 m24-20020a7bce18000000b003fbf0ef4669mr7620180wmc.17.1693833893702; 
 Mon, 04 Sep 2023 06:24:53 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGVceTFRRCJx3QEHC1v0Fwwk5gpR/JTxujmvjvpSbrcXuud5RQf6XSV8UmJ3S8NFK1PJ6NVpQ==
X-Received: by 2002:a7b:ce18:0:b0:3fb:f0ef:4669 with SMTP id
 m24-20020a7bce18000000b003fbf0ef4669mr7620172wmc.17.1693833893448; 
 Mon, 04 Sep 2023 06:24:53 -0700 (PDT)
Received: from localhost (205.pool92-176-231.dynamic.orange.es.
 [92.176.231.205]) by smtp.gmail.com with ESMTPSA id
 m13-20020a7bce0d000000b003fed630f560sm14111682wmc.36.2023.09.04.06.24.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 04 Sep 2023 06:24:53 -0700 (PDT)
From: Javier Martinez Canillas <javierm@redhat.com>
To: Thomas Zimmermann <tzimmermann@suse.de>, deller@gmx.de, daniel@ffwll.ch,
 sam@ravnborg.org
Subject: Re: [PATCH 5/8] hid: Remove trailing whitespace
In-Reply-To: <20230828132131.29295-6-tzimmermann@suse.de>
References: <20230828132131.29295-1-tzimmermann@suse.de>
 <20230828132131.29295-6-tzimmermann@suse.de>
Date: Mon, 04 Sep 2023 15:24:52 +0200
Message-ID: <87cyyycbq3.fsf@minerva.mail-host-address-is-not-set>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain
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
Cc: linux-fbdev@vger.kernel.org, Jiri Kosina <jikos@kernel.org>,
 linux-staging@lists.linux.dev, linux-hyperv@vger.kernel.org,
 dri-devel@lists.freedesktop.org,
 Benjamin Tissoires <benjamin.tissoires@redhat.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, linux-input@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Thomas Zimmermann <tzimmermann@suse.de> writes:

> Fix coding style in Kconfig. No functional changes.
>
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> Cc: Jiri Kosina <jikos@kernel.org>
> Cc: Benjamin Tissoires <benjamin.tissoires@redhat.com>
> ---

Acked-by: Javier Martinez Canillas <javierm@redhat.com>

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

