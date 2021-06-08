Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F32503A0572
	for <lists+dri-devel@lfdr.de>; Tue,  8 Jun 2021 23:03:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BBB186E5A1;
	Tue,  8 Jun 2021 21:02:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-x72a.google.com (mail-qk1-x72a.google.com
 [IPv6:2607:f8b0:4864:20::72a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3863B6E1CF
 for <dri-devel@lists.freedesktop.org>; Tue,  8 Jun 2021 21:02:57 +0000 (UTC)
Received: by mail-qk1-x72a.google.com with SMTP id f70so6467414qke.13
 for <dri-devel@lists.freedesktop.org>; Tue, 08 Jun 2021 14:02:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=tI5apJy6qAcGNcp49inXli13iJ5zzU/EHf7L81CBh78=;
 b=JMUKNYQ/Uorm1mPfiretBAqd1KKOje4jcX9qzjAaDdhKuzgxVOlRkeNXNuGVt9waek
 lVUvoKhsvypiE9mSDAbMSjUU6ys+QrVwF10LQw+K/iw41mnZ5/fonFLU+LzFfeaqRfju
 m5Xk+XBo/o2olnwXRL/YUwjnu9PT4U7LZ9xkc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=tI5apJy6qAcGNcp49inXli13iJ5zzU/EHf7L81CBh78=;
 b=jiqAWv7UugsTkOO4JqFVGTUywUi4IcdeJOCso8JTIchVF/3MeHX5yWKv25Nxr2R/j5
 5Y6krKQCBOub5HHBBLK6OUoHipWAQp3txw1hl5AvqdDU6bojkIfz3c+6muV6YhGzDVoD
 GY7Pcb+AaS8scaaGK8UKU7DZSuUuQsWF5Z0x8MVlsSlADt/t9v0c4FQ6JTKh2QJKC341
 Tb/7Ibs6jbQe3iyHrbxkNBptb5OhcrWmmMOFdKOO5N0laIme87C1AcMapqTS9JPCd2z3
 hoDIIBNxu7/9BTKturtQkMfSpl1J6jT7TboA7RQaz7omcavbd3PmwspQBNSzyvD1eSwo
 d8fA==
X-Gm-Message-State: AOAM5312QWuKdtRSM/oeUpOj1tFhWMoSkvMZX+YpNTjzor1T98lYvyiI
 Wghhkf/Wok30wiyuvOGl3w9h0y40mOvmyw==
X-Google-Smtp-Source: ABdhPJy9/LPVf+utKWzp0q5O8a6kRjwNGnh2L84oLQIK9b3fjzPfvCGxOu3shPzfSgLsSRcylz+B3A==
X-Received: by 2002:a37:b147:: with SMTP id a68mr23859911qkf.4.1623186176170; 
 Tue, 08 Jun 2021 14:02:56 -0700 (PDT)
Received: from mail-yb1-f175.google.com (mail-yb1-f175.google.com.
 [209.85.219.175])
 by smtp.gmail.com with ESMTPSA id i1sm11935628qtg.81.2021.06.08.14.02.53
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 08 Jun 2021 14:02:54 -0700 (PDT)
Received: by mail-yb1-f175.google.com with SMTP id p184so32204678yba.11
 for <dri-devel@lists.freedesktop.org>; Tue, 08 Jun 2021 14:02:53 -0700 (PDT)
X-Received: by 2002:a5b:54a:: with SMTP id r10mr34051315ybp.476.1623186173429; 
 Tue, 08 Jun 2021 14:02:53 -0700 (PDT)
MIME-Version: 1.0
References: <1621927831-29471-1-git-send-email-rajeevny@codeaurora.org>
 <1621927831-29471-2-git-send-email-rajeevny@codeaurora.org>
 <4df7dcddd5aca799361642ea91c37fa94e8a4fef.camel@redhat.com>
In-Reply-To: <4df7dcddd5aca799361642ea91c37fa94e8a4fef.camel@redhat.com>
From: Doug Anderson <dianders@chromium.org>
Date: Tue, 8 Jun 2021 14:02:42 -0700
X-Gmail-Original-Message-ID: <CAD=FV=Wy-a_rCrx-mjDwr07CN=281ZyomVX7dcFiWrzFExcTTQ@mail.gmail.com>
Message-ID: <CAD=FV=Wy-a_rCrx-mjDwr07CN=281ZyomVX7dcFiWrzFExcTTQ@mail.gmail.com>
Subject: Re: [v4 1/4] drm/panel-simple: Add basic DPCD backlight support
To: Lyude Paul <lyude@redhat.com>
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
Cc: "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, Daniel Thompson <daniel.thompson@linaro.org>,
 Krishna Manikandan <mkrishn@codeaurora.org>,
 Rajeev Nandan <rajeevny@codeaurora.org>, Jani Nikula <jani.nikula@intel.com>,
 linux-arm-msm <linux-arm-msm@vger.kernel.org>,
 Abhinav Kumar <abhinavk@codeaurora.org>, LKML <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>, Sam Ravnborg <sam@ravnborg.org>,
 Andrzej Hajda <a.hajda@samsung.com>, Thierry Reding <thierry.reding@gmail.com>,
 Sean Paul <seanpaul@chromium.org>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Kalyan Thota <kalyan_t@codeaurora.org>,
 "Kristian H. Kristensen" <hoegsberg@chromium.org>,
 freedreno <freedreno@lists.freedesktop.org>, y@qualcomm.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Lyude,

On Tue, Jun 1, 2021 at 3:20 PM Lyude Paul <lyude@redhat.com> wrote:
>
> oh-looks like my patches just got reviewed, so hopefully I should get a chance
> to get a look at this in the next day or two :)

I'm going to assume that means that you don't need extra eyes on your
backlight patches. If you do, please shout and I'll try to find some
cycles for it. I've always got more things to do than there are hours
in the day, but many folks from the DRM community have helped me out
with numerous reviews over the last year or two and I'm happy to pay
some of that back by giving reviews if it'll help move things forward.
:-)

-Doug
