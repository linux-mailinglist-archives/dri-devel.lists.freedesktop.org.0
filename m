Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D15458970D
	for <lists+dri-devel@lfdr.de>; Thu,  4 Aug 2022 06:28:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8BEF112B7F0;
	Thu,  4 Aug 2022 04:28:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x52c.google.com (mail-ed1-x52c.google.com
 [IPv6:2a00:1450:4864:20::52c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F31978B5FC
 for <dri-devel@lists.freedesktop.org>; Thu,  4 Aug 2022 04:27:56 +0000 (UTC)
Received: by mail-ed1-x52c.google.com with SMTP id z2so13419644edc.1
 for <dri-devel@lists.freedesktop.org>; Wed, 03 Aug 2022 21:27:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linux-foundation.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc;
 bh=WHUvnwYFxV5A4ffpdozxVm8wDmlyhI1HeR3vH2yCyf8=;
 b=P+E9m0qAVnO//aySex5TWRd4ra/sPgEawpwF8xWegvfQGYCpZRS/jYRlzfpxNNqSUd
 w7RDXwTq0FASod8CEoIss6EInqViEippn515GWsrjnn216k79PM9oOXu/9sB5/6IoriF
 wwd02IPfL9jwDAvsJJdtPeD4Op0KQU6lOoT0A=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc;
 bh=WHUvnwYFxV5A4ffpdozxVm8wDmlyhI1HeR3vH2yCyf8=;
 b=d7iy0sZ9GMKV/M62sJLBUUM3ZNHAPdR57BpaxOz6pNnWmpwxjMIU0OLER2a/gLV2ul
 SSpDLHyFcgzy6I8JOyk+q3PyfHP9AnziUq5sgr913lCjhzbyrcBMgY8yqmZTgK1siECm
 y/ivjB6iddI/6obx3HPhdejXUzt7VA/GpCSDQxgrieMxTM00TfykOdgRbJMEdK3lQ32D
 u1PDe+2Kc9wezLP/PUCV4eKvgKjNjKUCiyjCD3KQIsYv/L8qX82ia2y9e+Jd69UUEqsn
 KKlkl7vnYSPQor+CfIZF05JlNZJ+wVdW/JzimMK0fxPmNaRo2bzzxf3WbgRXVUZuQQNc
 KyHg==
X-Gm-Message-State: ACgBeo17hkQx4u5SsmoGNDCbHUoTQifMQHlV673ctEfN5faEW9/YW6en
 WJzsfBc886voY9xbXEBF2d+hkYrcXzyM3ovp
X-Google-Smtp-Source: AA6agR6kp+37PeR9t/1+Tjl8l1NMJgJ22b+EUT0u+tqVl1wjhTN6S8efKMHpo3GgmTd226nMsKtHng==
X-Received: by 2002:a05:6402:1f87:b0:43b:b88d:1d93 with SMTP id
 c7-20020a0564021f8700b0043bb88d1d93mr71721edc.314.1659587274946; 
 Wed, 03 Aug 2022 21:27:54 -0700 (PDT)
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com.
 [209.85.128.50]) by smtp.gmail.com with ESMTPSA id
 kw19-20020a170907771300b007121361d54asm8012773ejc.25.2022.08.03.21.27.53
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 03 Aug 2022 21:27:54 -0700 (PDT)
Received: by mail-wm1-f50.google.com with SMTP id
 r67-20020a1c4446000000b003a34ac64bdfso1519620wma.1
 for <dri-devel@lists.freedesktop.org>; Wed, 03 Aug 2022 21:27:53 -0700 (PDT)
X-Received: by 2002:a05:600c:21d7:b0:3a3:2088:bbc6 with SMTP id
 x23-20020a05600c21d700b003a32088bbc6mr4655050wmj.68.1659587273590; Wed, 03
 Aug 2022 21:27:53 -0700 (PDT)
MIME-Version: 1.0
References: <CAPM=9twFEv8AcRQG-WXg5owy_Xhxy3DqnvVCFHgtd4TYCcKWEQ@mail.gmail.com>
 <CAHk-=whXSt2N0GcoPC6XxXXLMpXm-34ua+X4AhPsLoqBcF6Xqg@mail.gmail.com>
 <CAHk-=wj8UHvjsVPohpRA1RJo1upyKoSnjcsys+=vbRVbpPvBMg@mail.gmail.com>
 <CAPM=9txsYE1zFDW+ehHQv138DoeT1Fw6hfzfPa4czvXGSjefjw@mail.gmail.com>
 <CAHk-=wj+yzauNXiEwHfCrkbdLSQkizdR1Q3YJLAqPo6AVq2_4Q@mail.gmail.com>
 <CAPM=9txkjJg5uArn1ann7Hf+JFCukQFGwqv+YHAx97Cdxezs_Q@mail.gmail.com>
 <CAHk-=whWcektQzPJgSPa2DC3wMPxgLh8fJVQWeo8i99XMXPjfg@mail.gmail.com>
 <CAPM=9twUvRoVcWHhBH7yuDDVj8K8aM0APQ8Yx3cx19keLJP8Gg@mail.gmail.com>
In-Reply-To: <CAPM=9twUvRoVcWHhBH7yuDDVj8K8aM0APQ8Yx3cx19keLJP8Gg@mail.gmail.com>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Wed, 3 Aug 2022 21:27:37 -0700
X-Gmail-Original-Message-ID: <CAHk-=wjbfAuN1eV+F0wWFsWEaMmJsT2p3DXnUvxo7bQ-xJwKCQ@mail.gmail.com>
Message-ID: <CAHk-=wjbfAuN1eV+F0wWFsWEaMmJsT2p3DXnUvxo7bQ-xJwKCQ@mail.gmail.com>
Subject: Re: [git pull] drm for 5.20/6.0
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

On Wed, Aug 3, 2022 at 9:24 PM Dave Airlie <airlied@gmail.com> wrote:
>
> I've reproduced it, I'll send you a revert pile when I confirm it is
> the buddy allocator.

I've bisected it to 86bd6706c404..074293dd9f61 and don't see "buddy"
in any of those commits.

I'll do a few more. It's close enough already that it should be just
four more reboots to pinpoint exactly which commit breaks.

                  Linus
