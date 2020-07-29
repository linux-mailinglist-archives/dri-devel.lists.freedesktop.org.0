Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 986562324D0
	for <lists+dri-devel@lfdr.de>; Wed, 29 Jul 2020 20:43:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3C2606E142;
	Wed, 29 Jul 2020 18:43:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x229.google.com (mail-lj1-x229.google.com
 [IPv6:2a00:1450:4864:20::229])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E5E1A6E142
 for <dri-devel@lists.freedesktop.org>; Wed, 29 Jul 2020 18:43:10 +0000 (UTC)
Received: by mail-lj1-x229.google.com with SMTP id 185so15943212ljj.7
 for <dri-devel@lists.freedesktop.org>; Wed, 29 Jul 2020 11:43:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linux-foundation.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=SQrDOEGzsiONMvvyToZ6AXQOHof7I1W0ObrG53hfoy4=;
 b=FF/FzVgGKEtoa6ZNMRJwrintVq5jh2Bq6c0fZ3NnY4HlUx2b3qO1S5u/W72THPB/D2
 5kFWiGbok3mN4nIPfy2Ths4v0XwyP960SYtD0HijzSgeyLgDiA8+6SPRdmS8iBxiNCPG
 mcfWzb1qVPadPo10hFFnqwskw1y2R0YA/EUtI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=SQrDOEGzsiONMvvyToZ6AXQOHof7I1W0ObrG53hfoy4=;
 b=M8Y/B2T6+qkXpp6fEM113YQ16xCOlHwHwFVwSmqPnSvEOSV9o209aX5t6kwFJ7SmPL
 LhRmWEoGTXf0/L6T1sp1TloTUr5GXCTxIKK8Z+VhuT/HmhHUA0m2R2TplSmkGfpskkWx
 Li9HFdqdMMzLwH3xcGN6zbw3x+/YvNcNTEZWizurvKF05vJ8h4C0s3UmVC53d4NQjvgC
 7hBv0Ejmjd2wzNQoa9lHAna1R8hgilSx4Hv9AsltxYqOjr1QK4tw19NZ0Gm76WnvYOUl
 r07DtOzH88qBay3GAlRdmlexhUQmP7pTWq3Li4Sk2jvBEF9f0gLDOg/XiZZJK8vE2BZ1
 mw/A==
X-Gm-Message-State: AOAM531hsu5Gtvt95rA0hv0hq9eUuK5tbcqHYtu2ssLd9oq8Ja2ByTyx
 PbnCS1cgOdGnt7GBUMX77DakPRBPmqQ=
X-Google-Smtp-Source: ABdhPJwivUYlLzcOrjUUTjjk/qAdtpPbbvox2eBO4cQEWuY7BjqTmdQF6x66Sv7mHOmHHR6g4XPKPA==
X-Received: by 2002:a2e:8751:: with SMTP id q17mr15709300ljj.268.1596048188914; 
 Wed, 29 Jul 2020 11:43:08 -0700 (PDT)
Received: from mail-lj1-f177.google.com (mail-lj1-f177.google.com.
 [209.85.208.177])
 by smtp.gmail.com with ESMTPSA id 203sm629711lfk.49.2020.07.29.11.43.07
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 29 Jul 2020 11:43:08 -0700 (PDT)
Received: by mail-lj1-f177.google.com with SMTP id r19so26122784ljn.12
 for <dri-devel@lists.freedesktop.org>; Wed, 29 Jul 2020 11:43:07 -0700 (PDT)
X-Received: by 2002:a2e:9b42:: with SMTP id o2mr14882866ljj.102.1596048187597; 
 Wed, 29 Jul 2020 11:43:07 -0700 (PDT)
MIME-Version: 1.0
References: <CAPM=9tzCWbg3CUSeywiHxQ-fCE1FAGGdOt5Qm+sjsLQLBSExyw@mail.gmail.com>
In-Reply-To: <CAPM=9tzCWbg3CUSeywiHxQ-fCE1FAGGdOt5Qm+sjsLQLBSExyw@mail.gmail.com>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Wed, 29 Jul 2020 11:42:51 -0700
X-Gmail-Original-Message-ID: <CAHk-=wi8Oeg66=eOoR7XPxxPcOXBD+9QqFf=BtABsVudZObjKA@mail.gmail.com>
Message-ID: <CAHk-=wi8Oeg66=eOoR7XPxxPcOXBD+9QqFf=BtABsVudZObjKA@mail.gmail.com>
Subject: Re: [git pull] drm fixes for 5.8-rc8
To: Dave Airlie <airlied@gmail.com>
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Jul 28, 2020 at 9:44 PM Dave Airlie <airlied@gmail.com> wrote:
>
> If you feel this is too much I'm happy to respin with the
> core/drm_fb_helper and nouveau fixes. we have one outstanding nouveau
> regression fix, that I'll follow this up with in the next day or so
> once Ben and James get it reviewed.

This looks fine to me, I've pulled it. I'll be looking forward to (not
really ;) another pull for the remaining issue.

Thanks,

                   Linus
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
