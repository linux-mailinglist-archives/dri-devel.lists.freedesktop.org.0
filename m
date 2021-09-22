Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 23F2B41515D
	for <lists+dri-devel@lfdr.de>; Wed, 22 Sep 2021 22:25:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 933E189838;
	Wed, 22 Sep 2021 20:25:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x134.google.com (mail-lf1-x134.google.com
 [IPv6:2a00:1450:4864:20::134])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ADCA289838
 for <dri-devel@lists.freedesktop.org>; Wed, 22 Sep 2021 20:25:40 +0000 (UTC)
Received: by mail-lf1-x134.google.com with SMTP id i4so16851963lfv.4
 for <dri-devel@lists.freedesktop.org>; Wed, 22 Sep 2021 13:25:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linux-foundation.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=32+aYzuaFD1O1viEyMAbzrc37otijziLTHIx/x5GVqU=;
 b=bglC1jKwLFWblaCzoqFGj2TZxYkx2+0o4kjbG7EFOH/ZWj79L+2XA4WbYVlaiZPaaF
 p3XlKpu+DswBZY+rQXxwpEf8QQCUMLJZxPq8D1nboHRcPpi+Dl/IeuEPE+NsF0BJNo9k
 fnz0WVF9fzqBHN0ReOA/z8WWB2VX+cNiaifZI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=32+aYzuaFD1O1viEyMAbzrc37otijziLTHIx/x5GVqU=;
 b=0qUatTCJlCAvA517JBHCPURpx/Di/cG9CH5RJ43wtLXgx0bxM+i1TsCH0kxnkbhsXQ
 T5Kud4OB9uO1X46/5UjOaN+maVGXmngVFpoeK6SiQNktFi/2krYxvPIKyf6vvOnQFaHk
 NJf58f6iuPeQxUIf4UIJwNty513zCgBDd8EGlgQ96COkYevXavp3K0/pLW9N8MfaygCa
 Qg/A86NW/+IoRIdrpDZbwiuFxSG3Er+kMfdOhTczsjVDLFRtky3o3HejG6eTWZnZgHP/
 iucYQN8gilBY3ydCfgZL7ezTW3xxEbW4qm9DtVxLyXJ781X3nw0pBsEA2VniVN3Z7Gt+
 GoTg==
X-Gm-Message-State: AOAM530ZG9tYR95vIr9lXWaHrbl7wr3yBXw265/IwnB6FiYPUhNQ/lyk
 AI832hREm+eG22hMNfkL2OphAJ9MPWGqKKpyw8k=
X-Google-Smtp-Source: ABdhPJwnzBf44FrhHJIW61qwEsAeXNmWclY7HR2Xn47+aQojwk0F6AO5qyGhPKl38ZHSLimO4TteCA==
X-Received: by 2002:a2e:984:: with SMTP id 126mr1259583ljj.169.1632342338891; 
 Wed, 22 Sep 2021 13:25:38 -0700 (PDT)
Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com.
 [209.85.167.42])
 by smtp.gmail.com with ESMTPSA id q5sm256566lfn.277.2021.09.22.13.25.37
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 22 Sep 2021 13:25:38 -0700 (PDT)
Received: by mail-lf1-f42.google.com with SMTP id t10so16933208lfd.8
 for <dri-devel@lists.freedesktop.org>; Wed, 22 Sep 2021 13:25:37 -0700 (PDT)
X-Received: by 2002:a05:651c:1250:: with SMTP id
 h16mr1357916ljh.68.1632342337491; 
 Wed, 22 Sep 2021 13:25:37 -0700 (PDT)
MIME-Version: 1.0
References: <20210903160302.yh42vpkuob45dbpb@gilmour>
 <CADVatmMqT1yq3YHBzt4-VsL8uVHUULmy2gpaH27rAqimao2i_A@mail.gmail.com>
 <20210904091050.g5axxctgelciihjn@gilmour>
 <CADVatmN+9euG5Fegor1+kaSPewbW8vRwBgnxmr5SsK3mOE6FEg@mail.gmail.com>
 <20210920144730.d7oabqfbx7pmyyfb@gilmour>
 <20210920154333.vunyxeshdb7jt5ka@gilmour>
 <20210920155350.h6624mt65vwg72p2@gilmour>
 <CADVatmNi+jN+EwiWuoDoocZFyErDVNt1ND0BxtjuKiV63aNuJg@mail.gmail.com>
 <20210920171042.oq3ndp3ox4xv5odh@gilmour>
 <CADVatmOs7Cc1EdCZXMyXcWM-3-J4bU_3zF1thkOohVUL-G6ZrQ@mail.gmail.com>
 <20210922095725.dk4vk42zb3kh7y6s@gilmour>
 <CADVatmOMV5gMhCuoP65O9mbW639x5=0+bGh92WVL8FFX2Mvu3w@mail.gmail.com>
 <CAHk-=wi=8Wp31FSyOH5A8KY+7f3dSuP62zUpvTtyvENm1Hh7xA@mail.gmail.com>
 <CADVatmNZB6yjS6zXqUcY4xsUTyX3pa6VysB6RmT1CGV5LXer6g@mail.gmail.com>
 <CAHk-=wh+y=C5hVhE1X=AvZz+OM5Yp8eLHYGth31pfoJVF7UKKQ@mail.gmail.com>
 <CADVatmPDeSxeY3GTZyC6+G0N76su0E6Y3LF_h6BOcBf5QAtjvg@mail.gmail.com>
In-Reply-To: <CADVatmPDeSxeY3GTZyC6+G0N76su0E6Y3LF_h6BOcBf5QAtjvg@mail.gmail.com>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Wed, 22 Sep 2021 13:25:21 -0700
X-Gmail-Original-Message-ID: <CAHk-=whASMriPYRdH8kxC_UwObBtwHbPvf7rb58sUEZZyaFxJg@mail.gmail.com>
Message-ID: <CAHk-=whASMriPYRdH8kxC_UwObBtwHbPvf7rb58sUEZZyaFxJg@mail.gmail.com>
Subject: Re: Regression with mainline kernel on rpi4
To: Sudip Mukherjee <sudipm.mukherjee@gmail.com>
Cc: Maxime Ripard <maxime@cerno.tech>, Emma Anholt <emma@anholt.net>,
 David Airlie <airlied@linux.ie>, 
 Daniel Vetter <daniel@ffwll.ch>, Philipp Zabel <p.zabel@pengutronix.de>, 
 dri-devel <dri-devel@lists.freedesktop.org>, 
 linux-kernel <linux-kernel@vger.kernel.org>
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

On Wed, Sep 22, 2021 at 1:19 PM Sudip Mukherjee
<sudipm.mukherjee@gmail.com> wrote:
>
> I added some debugs to print the addresses, and I am getting:
> [   38.813809] sudip crtc 0000000000000000
>
> This is from struct drm_crtc *crtc = connector->state->crtc;

Yeah, that was my personal suspicion, because while the line number
implied "crtc->state" being NULL, the drm data structure documentation
and other drivers both imply that "crtc" was the more likely one.

I suspect a simple

        if (!crtc)
                return;

in vc4_hdmi_set_n_cts() is at least part of the fix for this all, but
I didn't check if there is possibly something else that needs to be
done too.

                Linus
