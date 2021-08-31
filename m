Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9ACD23FCB93
	for <lists+dri-devel@lfdr.de>; Tue, 31 Aug 2021 18:39:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1BA4589F85;
	Tue, 31 Aug 2021 16:38:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com
 [IPv6:2a00:1450:4864:20::42c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5C0C789F71
 for <dri-devel@lists.freedesktop.org>; Tue, 31 Aug 2021 16:38:56 +0000 (UTC)
Received: by mail-wr1-x42c.google.com with SMTP id x6so20522302wrv.13
 for <dri-devel@lists.freedesktop.org>; Tue, 31 Aug 2021 09:38:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=w8Pqc83PIRgH3BzycVik/NXM5xJcLHU0opchQoMghiA=;
 b=ohTmwadsjLj+nN9yVdB0KWJYMalk079iIuEW2E0omzhq/AkuPSQ99UXMoJH2rflYHr
 9Pn3ebrbpXnxZNYEQ4cDlPF/2gmVFY8BLNVmmFpfPn4BCYKLn8D9x6iJpW8Js/PWJCkr
 dsDxNsrbxzJ7/B6vv6l4/S7unoT3U7AWp3/ZLHG8W92wecrU9PwH/+a00Tmh+A1nGQfE
 9KQ3LJ7x1vfuFaeP/3ejee2Ppwu/7xzG3gkqX8ZlrQpLAkENLjQtGCeWyUVbNVWy1jdJ
 T3FklFix0j3n7hpqQG1Bj17BRk1xLrnty32xfekHcFbvGqteswksRbZXZAiIS9CMxFlh
 Sccg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=w8Pqc83PIRgH3BzycVik/NXM5xJcLHU0opchQoMghiA=;
 b=JAVyFn4j/f6pcvb8bQ7Y+nCZTfiNW6xEAFwIIChKRKTyyID1Re+0FtkGwp9ZQYG9Nj
 w5rRtmrE0+JQ/LCiYOOaFYireSuYAna9WlQfqndKr+5/50X2xGSWWjudLYDmuBJTn3gP
 Z23a7VkE3qVCX3lGTNHt9RcqSqIRFxA6ZHrUpmTKV6fmht0hYWFB/bx7bVQevB/BcZTC
 ps9r/FCD3qbre8KYLwOokCIcJJUX55ErZDC9w2Wm7m3EeJdP+7Ytd0BRXHy/cSTxx2WE
 uWOs+WwL64lpG1pwElL7mcnG7aB2xp/m293hl2Pc9TN4UmnE5Q+LR++aR2ftSP1bp2aC
 vRGA==
X-Gm-Message-State: AOAM530fOZ3Nb/A7PxVkliJkIAOe8KHSrAMQf9AtJI3cJf3Cm/RV3TKP
 6eoNhrwoBXRCbo08Zsaa9+k=
X-Google-Smtp-Source: ABdhPJxzc5ivgUekzySQzRU9Vf+RmAdoZOerJx8PIQ3ULePwuTt/SuSyqiJrF4TtZ4s91DT7Ap4x9w==
X-Received: by 2002:adf:c104:: with SMTP id r4mr12682824wre.404.1630427934982; 
 Tue, 31 Aug 2021 09:38:54 -0700 (PDT)
Received: from kista.localnet (cpe-86-58-29-253.static.triera.net.
 [86.58.29.253])
 by smtp.gmail.com with ESMTPSA id d9sm23133899wrb.36.2021.08.31.09.38.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 31 Aug 2021 09:38:54 -0700 (PDT)
From: Jernej =?utf-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: Roman Stratiienko <r.stratiienko@gmail.com>
Cc: dri-devel@lists.freedesktop.org, linux-sunxi@lists.linux.dev
Subject: Re: Re: DE2.0 YV12 playback issues after ea067aee45a8
Date: Tue, 31 Aug 2021 18:38:53 +0200
Message-ID: <5260533.ZaFvgIizOL@kista>
In-Reply-To: <CAGphcd=L8GazB_io8Guy-0TdPGAt-m+4H38jrwCzNmt4+=moNg@mail.gmail.com>
References: <CAGphcd=ZR-Gh0zq=y-L9mf9agLwJBiav34q6TqUV+Te_UWFBuA@mail.gmail.com>
 <CAGphcd=L8GazB_io8Guy-0TdPGAt-m+4H38jrwCzNmt4+=moNg@mail.gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Roman!

Dne petek, 27. avgust 2021 ob 15:16:03 CEST je Roman Stratiienko napisal(a):
> +CC: jernej.skrabec@gmail.com
>=20
> =D0=BF=D1=82, 27 =D0=B0=D0=B2=D0=B3. 2021 =D0=B3. =D0=B2 16:12, Roman Str=
atiienko <r.stratiienko@gmail.com>:
> >
> > Hello Jernej,
> >
> > During local testing I faced an issue where YV12 buffers are displayed
> > all in blue.
> >
> > Issue can be fixed by reverting:
> > ea067aee45a8 ("drm/sun4i: de2/de3: Remove redundant CSC matrices")
> >
> > Could you have a look please?

Yes, but I need more info - which SoCs are you using? Different routes are=
=20
taken for DE3 and DE2. In theory, they should be the same...

Best regards,
Jernej

> >
> > Best regards,
> > Roman Stratiienko
>=20


