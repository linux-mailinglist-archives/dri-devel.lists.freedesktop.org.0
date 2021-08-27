Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C2163F9ADB
	for <lists+dri-devel@lfdr.de>; Fri, 27 Aug 2021 16:26:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 90D226E975;
	Fri, 27 Aug 2021 14:26:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x530.google.com (mail-pg1-x530.google.com
 [IPv6:2607:f8b0:4864:20::530])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6A9D56E934
 for <dri-devel@lists.freedesktop.org>; Fri, 27 Aug 2021 13:16:15 +0000 (UTC)
Received: by mail-pg1-x530.google.com with SMTP id g184so5936540pgc.6
 for <dri-devel@lists.freedesktop.org>; Fri, 27 Aug 2021 06:16:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=WterxneLBK/OCP/E7bFO9SR6ncKFFjBVYrR2V8OSQcQ=;
 b=KL2Yo4CySi2AFRj1BLeMGAl0tFgwTSxjFXRH7Td59NAh6eWduJ2gzDzGmzSC7/YJFT
 ONEWd/ZSnddGymiWAg7ih0pfZACWZwNAT7g96GOIEh9uYlhvR/3McsJTrQPv4PWbz7nB
 xeZevyC4r2jmH6bjT8d3u4Gd1kRfA5tioUn4hQgiJ3uvR3X95fgCXV8EEQIvZWJKsHH2
 Mys9zCwZUCJrwOFMScmEjxQh/wJPywDenMOL1/EZCswsgP0cO8ksKN8rnq0DeFFPAKr3
 tA6ZDmQY2nwkhhWPvsNJgtFATHSIDqoejFbp0LtkQQ0JYUUN7TfXIE7jxsXz0UEJnKhK
 WqUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=WterxneLBK/OCP/E7bFO9SR6ncKFFjBVYrR2V8OSQcQ=;
 b=sB/YztsX7w4HzheB6jjqUXWt7u1pCkJIb533oGDm6UudzU8rlaAABGSVDX9Sj6jwO5
 NBEXPFAejzmVlkcowJJzzF4zc6lRP256ywSoa3pJnAstTdJ7G4A4sfC4jS2ic+l6XiKh
 pllHNd5S2pH06pj1fV9OvsrkgLnZZvtuGOxtUCqj42KQ+uiTC/X6qQ7q7hxZUA1hFpCY
 +bBgLIzIJdqwO10lxmT0Z2kXG2ZtH3F35nVoQs1xCiZ6/8nB4p4bvtGWK2FEBe8yUn/Q
 XMU/HD20H9eZ8a5HtB4Gk3EnfGuDbP4FhqN+g6tsdu3YYXxdXmoBdwy/MkIplmID3sXP
 s+vw==
X-Gm-Message-State: AOAM530N5Y8x6ZE97zLw85RDvBBZnjhwYRrihc7QsUN4jKabRBcDhB2f
 3r6xXtpXacYrmT4G9ad2W0HPfLMU/wKvSEWEBjSo2jn0hSc=
X-Google-Smtp-Source: ABdhPJzLYGADqZhxBCkXHH8aaA6+1exmoi7R3gZCpIBguXGiWFPBtn02FaOs3Wbur95Y7N7SNpE08zmbY4+4+FKZrcI=
X-Received: by 2002:a62:e402:0:b0:3f7:656:6ad2 with SMTP id
 r2-20020a62e402000000b003f706566ad2mr301877pfh.4.1630070174842; Fri, 27 Aug
 2021 06:16:14 -0700 (PDT)
MIME-Version: 1.0
References: <CAGphcd=ZR-Gh0zq=y-L9mf9agLwJBiav34q6TqUV+Te_UWFBuA@mail.gmail.com>
In-Reply-To: <CAGphcd=ZR-Gh0zq=y-L9mf9agLwJBiav34q6TqUV+Te_UWFBuA@mail.gmail.com>
From: Roman Stratiienko <r.stratiienko@gmail.com>
Date: Fri, 27 Aug 2021 16:16:03 +0300
Message-ID: <CAGphcd=L8GazB_io8Guy-0TdPGAt-m+4H38jrwCzNmt4+=moNg@mail.gmail.com>
Subject: Re: DE2.0 YV12 playback issues after ea067aee45a8
To: jernej.skrabec@gmail.com
Cc: dri-devel@lists.freedesktop.org, linux-sunxi@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Mailman-Approved-At: Fri, 27 Aug 2021 14:26:25 +0000
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

+CC: jernej.skrabec@gmail.com

=D0=BF=D1=82, 27 =D0=B0=D0=B2=D0=B3. 2021 =D0=B3. =D0=B2 16:12, Roman Strat=
iienko <r.stratiienko@gmail.com>:
>
> Hello Jernej,
>
> During local testing I faced an issue where YV12 buffers are displayed
> all in blue.
>
> Issue can be fixed by reverting:
> ea067aee45a8 ("drm/sun4i: de2/de3: Remove redundant CSC matrices")
>
> Could you have a look please?
>
> Best regards,
> Roman Stratiienko
