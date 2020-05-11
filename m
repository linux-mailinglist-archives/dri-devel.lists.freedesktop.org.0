Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 35DB61CE602
	for <lists+dri-devel@lfdr.de>; Mon, 11 May 2020 22:51:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B26E96E58A;
	Mon, 11 May 2020 20:51:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com
 [IPv6:2a00:1450:4864:20::32e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F36976E58A
 for <dri-devel@lists.freedesktop.org>; Mon, 11 May 2020 20:51:52 +0000 (UTC)
Received: by mail-wm1-x32e.google.com with SMTP id g12so20924199wmh.3
 for <dri-devel@lists.freedesktop.org>; Mon, 11 May 2020 13:51:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=rkikq0zDsxgZt2W2jtJbRT70OAbPB2Rkt0vH5UDJcS0=;
 b=o+7Ut8Jag9RWpvLoH11fEO6vIhINeYGTOmAxLWkr8sUBh/tLA/vG7hh+uFjfmN5nEA
 6HJLJZxV6GflCVeZWq31KFMdQ2PGlfH2WBIsQuCxyk0vmMEZ0jU80svp+SShggTd6T2y
 G+VcSc+Z6S7v8eTjNB2lKwkvDRwu2EjE6UpDkAnehrzYVquspzQTGOtx0vseQDC/jFeG
 BZJF6Zq17YSMvnTd5mpT6+6cqcbeOdovW9Pl8MWHBlAimB5z3gnPbh5b4HgYicOI391x
 T1pqeoZGv2xFvv7EQD4bvnXWWgJmf5V/P2kLehsukETdRD59tDCaLUTSInS4SHbda6Mc
 WM1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=rkikq0zDsxgZt2W2jtJbRT70OAbPB2Rkt0vH5UDJcS0=;
 b=B1DQaQGYJfOctG052qkjwsUbvTczNpvsaBSPcoNYFjRtLlekS6iWEoOFRw/l4aeUSE
 QcI+iDIDwlnfbWl4iaZxa1sZ+CXJ+SzoqOsUijpgcSTYUNfbLcZVbR3qfTHfob4SoKx5
 Bz0rhIhB1iwQ81O4CdwnGXJPFseEzPJYwADsFyATjCtJ8pYXxuDYsiU5SoCbO/kf6QHY
 80zDg7m+iwcW7ER+5KcG/VewyLijbgDO1AK5Pr9+wjYChviLUdRpgny9IEcyrcs15g/E
 pfoj6DT+ALawMv9PTymL92pw5I0AWwrl97dZs2K3eWQhkuy77RURayniErLk+ftD3NZ8
 D7/Q==
X-Gm-Message-State: AGi0Pub/YGGTPLY31+bIJq7n6jcydmOV5WeMyWBg3kJnFT2I0UY92ha2
 sfVVafc7WzBU5yBb+p0VB0F5Yo/QpHF31pjpUO5laQ==
X-Google-Smtp-Source: APiQypI35SgzQ9lRlgIBY5BZtIhkcQCQXrQ1nwqU7bzCxY63uI41lYvdt12rJwX0qzG6xJB7ff7RqTBXwNpk//dOqp8=
X-Received: by 2002:a1c:98c7:: with SMTP id a190mr16513543wme.56.1589230311626; 
 Mon, 11 May 2020 13:51:51 -0700 (PDT)
MIME-Version: 1.0
References: <d249c339-fa3f-4440-bbc8-c9cf08338174@physik.fu-berlin.de>
 <CADnq5_NkD4+AMbNJceOJVSeBbJNQ3KDJq-kb7aHyF2jW8Y6dOA@mail.gmail.com>
 <CALjTZvZcg60rgDux7+Kh3zaMBkd-OiqoJ7GyYrLxfvnwgc4Xng@mail.gmail.com>
In-Reply-To: <CALjTZvZcg60rgDux7+Kh3zaMBkd-OiqoJ7GyYrLxfvnwgc4Xng@mail.gmail.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Mon, 11 May 2020 16:51:40 -0400
Message-ID: <CADnq5_M61r7CMtfMBx6Cf_N9SnJJn0PouiMjVg8wytEMF1YZfw@mail.gmail.com>
Subject: Re: [RFC] Remove AGP support from Radeon/Nouveau/TTM
To: Rui Salvaterra <rsalvaterra@gmail.com>
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
Cc: =?UTF-8?Q?Christian_K=C3=B6nig?= <ckoenig.leichtzumerken@gmail.com>,
 "debian-powerpc@lists.debian.org" <debian-powerpc@lists.debian.org>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>,
 John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, May 11, 2020 at 4:25 PM Rui Salvaterra <rsalvaterra@gmail.com> wrote:
>
>
>
> A segunda, 11/05/2020, 21:21, Alex Deucher <alexdeucher@gmail.com> escreveu:
>>
>>
>>
>> Note there is no loss of functionality here, at least on radeon
>> hardware.  It just comes down to which MMU gets used for access to
>> system memory, the AGP MMU on the chipset or the MMU built into the
>> GPU.  On powerpc hardware, AGP has been particularly unstable, and
>> IIRC, AGP has been disabled by default on radeon on powerpc for a
>> while.
>
>
> So this basically just drops support for the AGP GART? What happens to the AGP signalling rates (beyond the base rate)?

I don't remember enough of the details, but I strongly doubt it was
related to which MMU was used per se.  On r1xx/r2xx parts, AGP was
effectively the non-snooped route to memory and the internal MMU only
provided snooped (coherent) access to memory.  That and the limited
TLB space are probably want limited performance in that case.  I don't
recall what sort of TLBs the chipset GART tables provided.  On r3xx
and newer the, on-chip MMU supported both snooped and unsnooped
transactions and had more TLB space so the difference wasn't
significant IIRC.

Alex
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
