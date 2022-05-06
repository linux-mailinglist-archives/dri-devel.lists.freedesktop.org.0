Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 493A051DDDB
	for <lists+dri-devel@lfdr.de>; Fri,  6 May 2022 18:50:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E336A10F206;
	Fri,  6 May 2022 16:50:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x52e.google.com (mail-ed1-x52e.google.com
 [IPv6:2a00:1450:4864:20::52e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 829F310F206
 for <dri-devel@lists.freedesktop.org>; Fri,  6 May 2022 16:50:06 +0000 (UTC)
Received: by mail-ed1-x52e.google.com with SMTP id g20so9355187edw.6
 for <dri-devel@lists.freedesktop.org>; Fri, 06 May 2022 09:50:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linux-foundation.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=yplf98ia4dOhlCOAe+KKhCE6naxsVz+d+kEBiiSDb2o=;
 b=bKMsEZkyKCQY7Fxfb0+ouGSxND7jafXV0dLZYhl+HLtJKACIZ5cQbaDz0frgAy1W10
 nC5jAznFwMgcchc3gQrHcWTvbpyXwFmtCo/n0RF87Vhl5WbR8564JDrYNq2PiAtXBLhg
 DrMsq7DLAFtq1VXC4o3RCco6faxQxHGb8fxeM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=yplf98ia4dOhlCOAe+KKhCE6naxsVz+d+kEBiiSDb2o=;
 b=zr17zVNz/eXmnByjVdMOPp9Rw7ph30D/LQUBmwnvQOYwhxpVypk5SaPaEDWYcwu7AT
 2oYlXHp083xtUW1xwABDXrUK2ZYZ2FnWMiJ1gvTh31SUHJi45jGIbQA1l5J+Mzz4kpA6
 KuIVoF5sIj21+CMO8DWmGIhsDltnSHgpW79Rfuw7lOE6V+kKBBolmTIop0fEbf1qyjX8
 pKMHq7mHKgy5mr4FcHrvjO17g4j1kMT7+QIPoAhGwAzFMJdB4MSYuu1Unkt5POV4PO2g
 6dYNnxOt7gwKg3Ag+MX89s8skSbZQDeBFiBmp3h2hI/MopaNU6Rrcg63bMJajSYcxyaK
 7Pcg==
X-Gm-Message-State: AOAM532KM/6eCu/XOua9Vaie8Y134nrdNVRVbxQL5ffuqCsT4680udfO
 G1FKnfLh0nsv0E4GTwmYlpx33NT3MQj0XIsFrcI=
X-Google-Smtp-Source: ABdhPJx03PZle+QaqpGAhs6qxxcE7CDP4B8a4M/4CL5Xr/236C3GwBr+jmSZYHERGDIgfM9g4Whb+Q==
X-Received: by 2002:a05:6402:3695:b0:427:b16e:e1b4 with SMTP id
 ej21-20020a056402369500b00427b16ee1b4mr4348418edb.117.1651855803192; 
 Fri, 06 May 2022 09:50:03 -0700 (PDT)
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com.
 [209.85.221.52]) by smtp.gmail.com with ESMTPSA id
 mm9-20020a170906cc4900b006f3ef214e48sm2132483ejb.174.2022.05.06.09.50.02
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 06 May 2022 09:50:02 -0700 (PDT)
Received: by mail-wr1-f52.google.com with SMTP id x18so10816984wrc.0
 for <dri-devel@lists.freedesktop.org>; Fri, 06 May 2022 09:50:02 -0700 (PDT)
X-Received: by 2002:adf:ec08:0:b0:20a:d39d:6ab6 with SMTP id
 x8-20020adfec08000000b0020ad39d6ab6mr3430614wrn.442.1651855802195; Fri, 06
 May 2022 09:50:02 -0700 (PDT)
MIME-Version: 1.0
References: <CAPM=9tyaQ8RSYwuh4muEefV3fbjio5gVvYipWVaKjqUycRkS+A@mail.gmail.com>
In-Reply-To: <CAPM=9tyaQ8RSYwuh4muEefV3fbjio5gVvYipWVaKjqUycRkS+A@mail.gmail.com>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Fri, 6 May 2022 09:49:45 -0700
X-Gmail-Original-Message-ID: <CAHk-=wjtEptPBvJtdbezMLJh6k3O7Y-on=tbC31z4e+ksLda1w@mail.gmail.com>
Message-ID: <CAHk-=wjtEptPBvJtdbezMLJh6k3O7Y-on=tbC31z4e+ksLda1w@mail.gmail.com>
Subject: drm pull request (was Re: )
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

On Thu, May 5, 2022 at 9:07 PM Dave Airlie <airlied@gmail.com> wrote:
>
> pretty quiet week, one fbdev, msm, kconfig, and 2 amdgpu fixes, about
> what I'd expect for rc6.

You're not getting the automated pr-tracker-bot response, because your
subject line was missing...

Just a "how did that happen" together with a "here's the manual
response instead".

                  Linus
