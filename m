Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EF184550D84
	for <lists+dri-devel@lfdr.de>; Mon, 20 Jun 2022 01:02:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5765A10E6FB;
	Sun, 19 Jun 2022 23:02:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x632.google.com (mail-ej1-x632.google.com
 [IPv6:2a00:1450:4864:20::632])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D625D10E6FB
 for <dri-devel@lists.freedesktop.org>; Sun, 19 Jun 2022 23:02:07 +0000 (UTC)
Received: by mail-ej1-x632.google.com with SMTP id y19so17892624ejq.6
 for <dri-devel@lists.freedesktop.org>; Sun, 19 Jun 2022 16:02:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=3wOSMgmdFPmEE3/wp8E3w87FI4cutyYqlnph4GnnNhQ=;
 b=fp12Hsd+naPXKFthNk827WjcI2lsD0y0V8vniHBB8F7+bPmUlZ1URtVhLxmTXyTyDp
 N/zaYd6MMMUMryo4AXfiAS9KTYN8MKTHJ0EJ2l7G5YeKckjbj8O5ZH84kxA1+oQi3OYU
 JfLiIb9iTfTL9XUZQRTSybMwwJhwipYt2nxFw4U+o+WJ2krarTP9UOC9wNUIhl4Qj0da
 jJTY+DHmJeZN1Ppnw8jI5DmauZhDHNtdxEPMvtdVa/LqbXXMlHsCXWSP0gfmpCmVMrUF
 Noevu+DU7RwlqbdC/7B/QZ+tZkasK3BJkcopBLHFKH5UkLGlc0SjuwiFudUDq5bEkOQZ
 TM5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=3wOSMgmdFPmEE3/wp8E3w87FI4cutyYqlnph4GnnNhQ=;
 b=t24Nx4UjFSFDK7ZOiiS0AhSv7sao9Q2gb07GIWZnEg8jZifHUFnGh4lBSJF6ctrzrY
 OdgAc2yYZCZoIAOQybLPSJeh/RbSm0cWauuqjAaOdvDWHTfaKf5LMTnbFddeC60FnRib
 Ly72VzKq2nBSAgxg5IAlLmjoPJu8/fh5Y2afk1oaqu8oFZNGPYaeSIJvHO+Us8CO/yA9
 oBjNzTWRc+zv7NN7u24Hssw2mj9gQJsShVakTZeah+S9ajyBBSS/IeEf+OhbyQEukoSa
 /D8IEBznbR0IDiWjrJXyWebAXUycHGmUIAi2rHDFw4+fjHsCRKq+YatGX43NiOqW5GrC
 oFUg==
X-Gm-Message-State: AJIora+kXCYLTgbqyCoSEpc64BPm8A24HCZlHtY+AdrFWVmVPO2VBvN3
 NPPStD8gbSEaOj5BkT40N0raLFNMyNcRyW6vg7Q=
X-Google-Smtp-Source: AGRyM1vT4M+DuMrAjP+bMbKiyCeWNkhD2WVFQMfWGy3+wtARLEhBGkZSp4Dn1G8y7LZNMsy1Htvh5FON80kXiT5IGiE=
X-Received: by 2002:a17:907:6e8f:b0:710:865b:9c90 with SMTP id
 sh15-20020a1709076e8f00b00710865b9c90mr17449710ejc.27.1655679726177; Sun, 19
 Jun 2022 16:02:06 -0700 (PDT)
MIME-Version: 1.0
References: <CAEXMXLS9jD_gvPzZ4xBJ9wOY9sbJLDdLLpYOFk0Wt2s1RStv5w@mail.gmail.com>
 <9096beed-91e2-05d3-c5a0-fee9f65d972f@suse.de>
In-Reply-To: <9096beed-91e2-05d3-c5a0-fee9f65d972f@suse.de>
From: =?UTF-8?Q?Nuno_Gon=C3=A7alves?= <nunojpg@gmail.com>
Date: Mon, 20 Jun 2022 00:01:54 +0100
Message-ID: <CAEXMXLRGFuQE=2SNaO8HUtc93RG__AbJ+i7RzgNER9wc1zcb7Q@mail.gmail.com>
Subject: Re: DRM FB interface does not sanitize len when mmap'ed
To: Thomas Zimmermann <tzimmermann@suse.de>
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
Cc: dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Jun 17, 2022 at 10:27 AM Thomas Zimmermann <tzimmermann@suse.de> wr=
ote:
> Could you please try the attached patch? It's similar to your solution,
> but closer to the original intention of the code.

Works fine.

Tested-by: Nuno Gon=C3=A7alves <nunojpg@gmail.com>

Thanks,
Nuno
