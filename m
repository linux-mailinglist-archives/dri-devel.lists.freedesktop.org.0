Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 23CA44DDD9B
	for <lists+dri-devel@lfdr.de>; Fri, 18 Mar 2022 17:05:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2907910E0E6;
	Fri, 18 Mar 2022 16:05:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x62e.google.com (mail-ej1-x62e.google.com
 [IPv6:2a00:1450:4864:20::62e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8969210E0E6
 for <dri-devel@lists.freedesktop.org>; Fri, 18 Mar 2022 16:05:24 +0000 (UTC)
Received: by mail-ej1-x62e.google.com with SMTP id yy13so17941008ejb.2
 for <dri-devel@lists.freedesktop.org>; Fri, 18 Mar 2022 09:05:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Ng3Zfgvd5FVkTd0Uh5IRUD76rsMejGN3gWOznRlV1AU=;
 b=eMQlO+mrb9A2jfxLMXqk9N4cwzcfjYk9PgwRUQPbbWq8PrJcsRqiioCuc/lcGeT/Rb
 di3UfDN3w9jX5W2eU19SQU/huMP6WAWIldLoFr6nCEtXMIIx6uKZMqKk2oaf2RSUCvef
 jua3dvYZYcgdw1vgb3AKiQzvF/r6V5cTNVonE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Ng3Zfgvd5FVkTd0Uh5IRUD76rsMejGN3gWOznRlV1AU=;
 b=hLn4j3UPkGETNtC1q3DcT2PosJMNN3uFET8ZWDAyVuCX89P1+rjLkD6r970qjVHvFk
 yBkUNIEdI/ocjvikai5hwjkdZBacyNCweGZTFp89EA0qpeKsPhcdfaPh7NYU9s0Or3d4
 U+aLicdstMwtE8Rv0I/hJYwyOkxpL1AhzuaaxyC2F+euFff6rOvoqs+eWaSicHhyKQj9
 EWSlNuKLYiQWZsjIa1zIS3xgqJPPAFCGRIJ18wWHESbBG5Y5NT3ijpK2n+F6NLCEHIcf
 xyHISlkPMThcnkRwML3UeuV486WRgYoB4+H8RVGkzJXtiyj+5QG/NVrD27CtaTmeKQ3a
 ECGg==
X-Gm-Message-State: AOAM5331jL7HKNa1MHHhq5v0fROhChk08bhE9ZfHf37U7cJB98audFpn
 WA724XP95MCEOBGGDmGnIcrfsfsFJsR4am2y8Pc9Rg==
X-Google-Smtp-Source: ABdhPJxE4LldAUD+bZTnDyWv9PpK8dKAkCwuerF34kj2CvGwv8y9h0bYTsBnCSE7kym6Ww2DP2jqRKvPNKBCYl4dqWU=
X-Received: by 2002:a17:907:60cf:b0:6df:a8e8:3597 with SMTP id
 hv15-20020a17090760cf00b006dfa8e83597mr5578067ejc.111.1647619522963; Fri, 18
 Mar 2022 09:05:22 -0700 (PDT)
MIME-Version: 1.0
References: <20220309143200.111292-1-paul.kocialkowski@bootlin.com>
In-Reply-To: <20220309143200.111292-1-paul.kocialkowski@bootlin.com>
From: Jagan Teki <jagan@amarulasolutions.com>
Date: Fri, 18 Mar 2022 21:35:11 +0530
Message-ID: <CAMty3ZAZKHTqfR=ecRgpzJtVefhFFrSpcEqueSQ6K-=Q75XU4w@mail.gmail.com>
Subject: Re: [PATCH] drm: of: Properly try all possible cases for bridge/panel
 detection
To: Paul Kocialkowski <paul.kocialkowski@bootlin.com>
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
Cc: David Airlie <airlied@linux.ie>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Thomas Zimmermann <tzimmermann@suse.de>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Paul,

On Wed, Mar 9, 2022 at 8:02 PM Paul Kocialkowski
<paul.kocialkowski@bootlin.com> wrote:
>
> While bridge/panel detection was initially relying on the usual
> port/ports-based of graph detection, it was recently changed to
> perform the lookup on any child node that is not port/ports
> instead when such a node is available, with no fallback on the
> usual way.
>
> This results in breaking detection when a child node is present
> but does not contain any panel or bridge node, even when the
> usual port/ports-based of graph is there.

Can you add that pipeline example on the commit message, it gives more
information on specific use cases why the existing code breaks.

Thanks,
Jagan.
