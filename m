Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4365D55ABBC
	for <lists+dri-devel@lfdr.de>; Sat, 25 Jun 2022 19:26:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3A33D10E851;
	Sat, 25 Jun 2022 17:26:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x336.google.com (mail-ot1-x336.google.com
 [IPv6:2607:f8b0:4864:20::336])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 368B410E851
 for <dri-devel@lists.freedesktop.org>; Sat, 25 Jun 2022 17:26:09 +0000 (UTC)
Received: by mail-ot1-x336.google.com with SMTP id
 cb12-20020a056830618c00b00616b871cef3so1983235otb.5
 for <dri-devel@lists.freedesktop.org>; Sat, 25 Jun 2022 10:26:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=qdOBIdyq2W/XPrbuZUOS3HZJhZlnWjio9PK1s5ldH9w=;
 b=hZQq/Xzg9/2t0QmYfD8eMd0ERp/kboN8Hrh/uFMKSsFkqUeGOdhQ+igDNE6eJdOmco
 P9xNfHOUqyIESA/tO88I91Z32GnfGZtlejdUcw0AIu0arbKJNpXuK+FBaOwnkn5dyYB/
 KZZ43SiuwyDICkH7ESSA/X+dsq84i4/h4zEdk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=qdOBIdyq2W/XPrbuZUOS3HZJhZlnWjio9PK1s5ldH9w=;
 b=67wkRDzWDCsEkDUVf8xNPP8Ei21TrwOG5wVKkJd/E0fkWbz4gUwZ5UnejeosvHXJ2U
 PPp12GYGlGOWf7+CzlOsPFU1A0od4RWcMvue1xmIm5A5Au/1MFEoMae43iuAJOBngOw0
 nG4enV+CezhyM65KVemicSUTXJWFdm/FhjGslNP6Lb5ASZNvNKIWmy2W/il5IuTVARnH
 cUZXMtbGRBIyD5P4xKJ6BxHKvXlNjXvWM6NS05ScDj7ktKtaKnfLla6ITfA+/izjdtvF
 rNkM7FMM7RwuvTdCQTuqg5F1Dh3pnpYbvrV52SGprBN38hLn5CwT5/F2Bl+U++g2AsAz
 CDfw==
X-Gm-Message-State: AJIora+0zhh+8DYDZ6+A/ilXlgB2WWaPMHsxsI4adPRWMsk8+4Tu8ogx
 x1YrC8oVUz9SUAtD+rEzCJFmjJtyfqOVR/M+cRF8DQ==
X-Google-Smtp-Source: AGRyM1v90/YxbmcOktrcWS9DxeWQq808SQa98paCZc/w/xSNEY7prmP71nEBVIMEduTLyuJ+K7GzD2U7EYl6DmFCMRo=
X-Received: by 2002:a9d:178:0:b0:616:a150:dbae with SMTP id
 111-20020a9d0178000000b00616a150dbaemr2407570otu.321.1656177968486; Sat, 25
 Jun 2022 10:26:08 -0700 (PDT)
MIME-Version: 1.0
References: <85a6nq45uh.fsf@linux.intel.com>
 <20220620094907.4101274-1-maciej.kwapulinski@linux.intel.com>
In-Reply-To: <20220620094907.4101274-1-maciej.kwapulinski@linux.intel.com>
From: Daniel Vetter <daniel.vetter@ffwll.ch>
Date: Sat, 25 Jun 2022 19:25:57 +0200
Message-ID: <CAKMK7uFvU3fvx4D2UGdJypc=GGq42zM_9HKgXUM2cu0zPk-WOQ@mail.gmail.com>
Subject: Re: [PATCH v3 00/14] Driver of Intel(R) Gaussian & Neural Accelerator
To: maciej.kwapulinski@linux.intel.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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
Cc: arnd@arndb.de, corbet@lwn.net, gregkh@linuxfoundation.org,
 dragan.cvetic@xilinx.com, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 andy.shevchenko@gmail.com, guy.zadicario@intel.com, derek.kiernan@xilinx.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, 20 Jun 2022 at 11:51, <maciej.kwapulinski@linux.intel.com> wrote:
> On Wed, 16 Jun 2021 09:38:14 +0200, Maciej Kwapulinski wrote:
> > after consulting, we will try to share api and some kernel code
> > between the two drivers.
>
> We prepared a prototype work based on Daniel Vetter=E2=80=99s invitation =
to
> evaluate DRM framework as prospective fit.
>
> Early results look quite promising. Effective leverage of DRM framework f=
or
> non GPU driver has been achieved. GNA driver source code turned out to ha=
ve
> been simplified by offloading some areas (device management + memory
> regions management).
>
> As a result, GNA driver source code size has been reduced by 15% (420
> lines). DRM Framework complexity has not been an issue so far.

Nice.

> Plan for next step is to publish code to dri-devel ML.
> Please share your thoughts.

Sounds like solid progress and looking forward for some patches!

Cheers, Daniel
--=20
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
