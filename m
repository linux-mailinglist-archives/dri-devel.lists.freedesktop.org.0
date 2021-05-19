Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 68EA5388BA2
	for <lists+dri-devel@lfdr.de>; Wed, 19 May 2021 12:26:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 923D16ED09;
	Wed, 19 May 2021 10:26:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com
 [IPv6:2a00:1450:4864:20::32b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CC89C6ED09
 for <dri-devel@lists.freedesktop.org>; Wed, 19 May 2021 10:26:29 +0000 (UTC)
Received: by mail-wm1-x32b.google.com with SMTP id
 z137-20020a1c7e8f0000b02901774f2a7dc4so3052262wmc.0
 for <dri-devel@lists.freedesktop.org>; Wed, 19 May 2021 03:26:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=fooishbar-org.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=UNWZLY2sTCYamgAowtBHln7nVdejVdVpAEw+f3DRPJk=;
 b=P1KnO21ed4MQSUKyuRhv+tr9JnmCSQApne9R71xwVWbgBJZTk194JMXdlih56MmjLI
 GJqLV8ifdvdDI0xbkVl7h0P8Kre3UmZY2o9caMH0vgqyMNAcQnmXXGOcB/PWkHueuzZ0
 /JBq8y788fOUTRxsqVNVgL0KEU8ONXfOlXEG0TR77AyUAuPtqZYXpDFWaIjAmR5eYkM4
 Fg0Jp5vJpcacbAeMOYMfV07nCq4ZZ6MeBf90aVlUA0pauITMIpZC+8JE9AmRhzEAntqT
 mh50IjFo0RhLmPickBSBI6PgbT+kFPa9sMBFdrRkR6Qv0HUZ7l9Yxy8eBFik+pJiuOOu
 eRkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=UNWZLY2sTCYamgAowtBHln7nVdejVdVpAEw+f3DRPJk=;
 b=E7phAelBqzlpfOUmLzSTzwJ7xSkaeQJaaxM4FomzD1gN3a2F3Og/HiqhP86xFC9bgI
 KRM/lL21uCh95qD+ydTqQEDz54/qaTpxBPDk0WNVBurjv4fBuEGYAw+zFQy78Iw/t4SX
 OjWQTkT3eP0b/BY6x34/Ir3IfdXusJ4a9vhmnCJjy7y3wQWpdijttCoVsbt0YDD96rM1
 1hMWkVI2ulPxUZOJ+6eNTel8RDZvptrX86tRUS7t8i+tYOppB8UA9dyQqPtK3r9lG6uN
 BM04omgD5o7FEzv6B4A7O7QtQhbEv3zpn0k1oj56tjq/W09+GnoOwKn+lkY7R5ACXilY
 oijg==
X-Gm-Message-State: AOAM5321nKLzR68ULyFNhKLhlMjKf8oLpXuHoJ0LQ5Iqi1BbXRv4tWSS
 hUKeEFTesHMgXQmpo4VMiM2Uy/jhUyyr95B4ypCyWZDyv4fjiQ==
X-Google-Smtp-Source: ABdhPJwx7p33qgoP2Gq6aFqA3MEgTPSyRXNhTqF6swhKVtXukZjHSkkr8SXDB5EFLveieQH/fd5CaMKw8Buoz782IqI=
X-Received: by 2002:a05:600c:4b88:: with SMTP id
 e8mr5442267wmp.98.1621419988471; 
 Wed, 19 May 2021 03:26:28 -0700 (PDT)
MIME-Version: 1.0
References: <8tBryxsjXiKtYZP4whnTumr2AsWx9X1xPmwFAdp5Nc@cp4-web-037.plabs.ch>
In-Reply-To: <8tBryxsjXiKtYZP4whnTumr2AsWx9X1xPmwFAdp5Nc@cp4-web-037.plabs.ch>
From: Daniel Stone <daniel@fooishbar.org>
Date: Wed, 19 May 2021 11:26:17 +0100
Message-ID: <CAPj87rNCozpNP=dZAF8CPSc9_pFmLx02qpfh1c+GnxADptDJjQ@mail.gmail.com>
Subject: Re: [PATCH 3/3] drm: document minimum kernel version for
 DRM_CLIENT_CAP_*
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
Cc: Daniel Stone <daniels@collabora.com>,
 dri-devel <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Simon,

On Tue, 18 May 2021 at 12:15, Simon Ser <contact@emersion.fr> wrote:
> The kernel versions including the following commits are referenced:
> [...]

Thanks a lot for writing this up! I trust your ability to drive git
log/blame/describe so didn't bother double-checking the version
numbers. So this is:
Acked-by: Daniel Stone <daniels@collabora.com>

Cheers,
Daniel
