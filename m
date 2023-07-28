Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E7F6B7672A3
	for <lists+dri-devel@lfdr.de>; Fri, 28 Jul 2023 19:03:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9504010E1AC;
	Fri, 28 Jul 2023 17:02:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x135.google.com (mail-lf1-x135.google.com
 [IPv6:2a00:1450:4864:20::135])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A5B1110E1AC
 for <dri-devel@lists.freedesktop.org>; Fri, 28 Jul 2023 17:02:54 +0000 (UTC)
Received: by mail-lf1-x135.google.com with SMTP id
 2adb3069b0e04-4fe0e34f498so3882137e87.2
 for <dri-devel@lists.freedesktop.org>; Fri, 28 Jul 2023 10:02:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linux-foundation.org; s=google; t=1690563772; x=1691168572;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=HAf0f1T2SfrQfohRytga1xgLxnQTJqNRQWwR6CnDUiU=;
 b=TVl+WJYrvGsGpB323l5pe+F90lKlzEGgHxpHO9BPsNpTu4wYnwMTzhvrVjrbShLnkU
 D13XZ1N2Cy0z+NkKLQJvegXFJDoESEQ4WU40pFB6h713fJn3lVTbnFyw4aPTNxlvcRg2
 0e3cJ7278hBNIihwzHnZkhoVv3eKz2B/RXKug=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1690563772; x=1691168572;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=HAf0f1T2SfrQfohRytga1xgLxnQTJqNRQWwR6CnDUiU=;
 b=FKK4BLMkl6DvuIk0stymcRBqJvvljF2p92jmNVK718Y0EUDyEE8DKSKqh8ktJDmzhS
 gaNDAD5GrcmVtVn4JRZy8ZSwZRDDOccegKe/zVmK2ZJSRTDr8IhcjuanymyRq2N608QL
 xVtNq8os1bHbWj0eF4HPn6H8P/bKDfXEJjJQlWF4lsPB7HQGEhUS7671jDeoltiHVnvP
 SKhAUhr3TroqWmcSDjmmzIfoCREp1WGT9hbkycEi+pPLZ0BpWNaBcDh6DojRPojKYCY2
 gFxjh1jOXGY3gx6ETMnBZKeEOCz4KOAOrGT1mmFnU9LfCSjIfUmqnuI1+gJqmte8r0UB
 4Tdw==
X-Gm-Message-State: ABy/qLb474q/zXhmuG2Qw0QVj5nvFJFVNk8V2OKZ5xq7FOqukTkZvK9n
 sw08GByK5qfcNkFRwiVGG9qBio138zkjguMBSCtm8jux
X-Google-Smtp-Source: APBJJlGqvB6wNaKSq6ggH1ysoizgOOQXp99RhbYuSBVyObbFf5kpp2hhUN1hcHxBigQf5/qTy2N7/A==
X-Received: by 2002:a19:2d07:0:b0:4fd:c715:5667 with SMTP id
 k7-20020a192d07000000b004fdc7155667mr2057640lfj.20.1690563772519; 
 Fri, 28 Jul 2023 10:02:52 -0700 (PDT)
Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com.
 [209.85.167.46]) by smtp.gmail.com with ESMTPSA id
 y7-20020ac24207000000b004fbc6a8ad08sm887041lfh.306.2023.07.28.10.02.51
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 28 Jul 2023 10:02:52 -0700 (PDT)
Received: by mail-lf1-f46.google.com with SMTP id
 2adb3069b0e04-4fba8f2197bso3889157e87.3
 for <dri-devel@lists.freedesktop.org>; Fri, 28 Jul 2023 10:02:51 -0700 (PDT)
X-Received: by 2002:ac2:5df3:0:b0:4fb:89b3:3373 with SMTP id
 z19-20020ac25df3000000b004fb89b33373mr2187854lfq.43.1690563771697; Fri, 28
 Jul 2023 10:02:51 -0700 (PDT)
MIME-Version: 1.0
References: <CAPM=9twwk0C6kGQXFZdvEhxnLe7DhnwN8doj_yA3a9S3hs7c1w@mail.gmail.com>
In-Reply-To: <CAPM=9twwk0C6kGQXFZdvEhxnLe7DhnwN8doj_yA3a9S3hs7c1w@mail.gmail.com>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Fri, 28 Jul 2023 10:02:35 -0700
X-Gmail-Original-Message-ID: <CAHk-=wj2A91gCW8U_4zxe7=HY=zKL1EC7_4Z19AhM7sTsj5hfw@mail.gmail.com>
Message-ID: <CAHk-=wj2A91gCW8U_4zxe7=HY=zKL1EC7_4Z19AhM7sTsj5hfw@mail.gmail.com>
Subject: Re: [git pull] drm fixes for 6.5-rc4
To: Dave Airlie <airlied@gmail.com>
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
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>, LKML <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, 27 Jul 2023 at 19:20, Dave Airlie <airlied@gmail.com> wrote:
>
> Regular scheduled fixes, msm and amdgpu leading the way, with some
> i915 and a single misc fbdev, all seems fine.

Pulled.

Tangentially related: where do you keep your pgp key? The one I have
is long expired, and doing a refresh doesn't get any updates...

                Linus
