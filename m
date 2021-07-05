Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B53D3BC18C
	for <lists+dri-devel@lfdr.de>; Mon,  5 Jul 2021 18:18:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A180C893DB;
	Mon,  5 Jul 2021 16:18:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x62e.google.com (mail-ej1-x62e.google.com
 [IPv6:2a00:1450:4864:20::62e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 15E5F893DB
 for <dri-devel@lists.freedesktop.org>; Mon,  5 Jul 2021 16:18:46 +0000 (UTC)
Received: by mail-ej1-x62e.google.com with SMTP id bu12so29798647ejb.0
 for <dri-devel@lists.freedesktop.org>; Mon, 05 Jul 2021 09:18:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=Uogth1vo7FFIvLcqfqJbWIXn6CWMEy3BB9p64RATby4=;
 b=pJkbU3ANKjIhiYm2lVUKXVmkfxcYavhkwnEP/LKl81WDMpr1OxYkmNepnXtkhAfxrt
 9flLOe9Dc6YTd5ZbbouFtQYJ0fOuU/XGrG4HwfxBoxnq2nl5VSJ4EzTQcVPBh7IHE8AQ
 2jsVBvxGMLe9Yt+qZ0Ug1WsIKLtYaXw2CNNdSu5csr7Fg54SsX1u7qJhMAW6I7TDSMUd
 MCJIH5BkvrchbB9OtomWo1ar/zii3KSmlIK/ZbAd59x/xkQxfOSbTWkqw3L+LRRLctex
 vLq6Xs8e+LrEG/0I6h516/bBHbFrxKwXGFZyf95vTD1wv6GjaVElbJ2gE+7Hf4fQfWwV
 lMhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=Uogth1vo7FFIvLcqfqJbWIXn6CWMEy3BB9p64RATby4=;
 b=HvHwP4xWdKP2qTu5/MHhBNgEqUFAmM2LfBnL1nE8rl/KM6ySM4/VM9I1LdCT0UoJxw
 n4/5PzOz0f5EIATWE/eLelz1rEXoCujLnxFxC/iL1LPsSXpuwN6CQHg0Jx4pPS9OlWxV
 tYq39DMbErSWNzydYqiJF2nek51Hs/6q2hrrRXudzDpey+HxKZemsf2Tg1jITqQRmmuI
 Jb0BwFuJZbyoRFY1cnpkm43I9W0u8DMgWfr6HiC+EqWRvX2z1e3DB+4PI93juNHmNq5B
 iwolpK7iG5IUI4ot7Rxbeou/Uc9wQuiIucVWZQJV5KZ9LiKG8d+kl8aJPGgEPBrHCje5
 t/kQ==
X-Gm-Message-State: AOAM533jVKWjKQSes2TjfFc19yBDhNSLQ0PC8fljlx+slvcElLho+bjg
 lQiCA9tQ7xDWLeTxSsIC06VXGDcx+mK+P61R5tzbMQAx
X-Google-Smtp-Source: ABdhPJzuVaiHSCbpsFFd3em0oJ43OhjxLdV/qskPyI/sbjzvF8RKFjhjKEFGPLrQSptCg5Ur+iRZZS31xnG++pz65Yw=
X-Received: by 2002:a17:906:919:: with SMTP id
 i25mr13742722ejd.171.1625501924690; 
 Mon, 05 Jul 2021 09:18:44 -0700 (PDT)
MIME-Version: 1.0
References: <20210703195940.25797-1-mario.kleiner.de@gmail.com>
 <925d87a5-f364-4735-6762-dbd32f375db7@daenzer.net>
In-Reply-To: <925d87a5-f364-4735-6762-dbd32f375db7@daenzer.net>
From: Mario Kleiner <mario.kleiner.de@gmail.com>
Date: Mon, 5 Jul 2021 18:18:33 +0200
Message-ID: <CAEsyxygNcFYS754U80FNbA9OMJnqkoK-e=+dW1=v10FeSRq_2w@mail.gmail.com>
Subject: Re: [PATCH libdrm] headers: drm: Sync with drm-next
To: =?UTF-8?Q?Michel_D=C3=A4nzer?= <michel@daenzer.net>
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
Cc: dri-devel <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Jul 5, 2021 at 9:39 AM Michel D=C3=A4nzer <michel@daenzer.net> wrot=
e:
>
> On 2021-07-03 9:59 p.m., Mario Kleiner wrote:
> > Generated using make headers_install from the drm-next
> > tree - git://anongit.freedesktop.org/drm/drm
> > branch - drm-next
> > commit - 8a02ea42bc1d4c448caf1bab0e05899dad503f74
> >
> > The changes were as follows (shortlog from
> > b10733527bfd864605c33ab2e9a886eec317ec39..HEAD):
>
> libdrm uses GitLab merge requests now: https://gitlab.freedesktop.org/mes=
a/drm/-/merge_requests
>

Thanks for the info Michel. Merge request sent out. Maybe the
Contributing doc needs some updates, as it describes a patch + mailing
list workflow?

-mario
