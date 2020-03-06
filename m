Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 424D117BE35
	for <lists+dri-devel@lfdr.de>; Fri,  6 Mar 2020 14:24:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 047276E426;
	Fri,  6 Mar 2020 13:24:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x142.google.com (mail-lf1-x142.google.com
 [IPv6:2a00:1450:4864:20::142])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 723476E426
 for <dri-devel@lists.freedesktop.org>; Fri,  6 Mar 2020 13:24:25 +0000 (UTC)
Received: by mail-lf1-x142.google.com with SMTP id s1so1918095lfd.3
 for <dri-devel@lists.freedesktop.org>; Fri, 06 Mar 2020 05:24:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linux-foundation.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=KDYKc7DCCCP8IsrCVczT6C88EXaizXrCTGtH/4pFS+M=;
 b=VTpKH3Biqo5cU85DKD5haoqo18n+/RQoz9ihmzUmZ5B0M2R0YjtQfJed8PR6zrMRO1
 2ea9U1wJXWVScHhHE2o5+2OgNGtj5WyMDW8J/uT9Wf53EI7cz7Zz3lxHDzbK5mwn+zgv
 ePnqCnmrM06Mn9VuTwcgknPZ9VlTxFNxMm7BU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=KDYKc7DCCCP8IsrCVczT6C88EXaizXrCTGtH/4pFS+M=;
 b=mtzuEt4NzQfnAf6RlPjAYPB0KaRco5ygTv3ZGZs0sj7FMjqmdygu5Af3USdKVi4sD7
 ZLKCrb3+L/j1NBEW4KCE8cah+gVGhjQalTHDxYRVfT9V4faGzTNv2qZaSjVbUw4WQZ6w
 9eHQtsxqEgzI5XdX8QKB38WbXfgCCUWE1xtBVWWt/iBGTEQJeSPKcE+krkRYNaUneB5G
 U0fbiPOsZ+o6ojCO5pXFbt7FwPaMNlqZfIpwl2a8VGGsyiPKyhfYDrH7CerKh4vbZwAS
 7Sr7jtIuIXZ0OWeICoXd2KZko14OcH9gtMGmn1FQvu4NQG1AM4dfLZSkgfTJ5qvr5dgp
 jrvg==
X-Gm-Message-State: ANhLgQ00Syh4pS2yQsZJj2o4gWoeLoAcCSMoYCc0dNZEXywrAB0UGFGh
 CdMms3zPQptLKCHFBZU7awkJBBkxDN2ntg==
X-Google-Smtp-Source: ADFU+vuTkHCyi5nVkfcbg7LKIsfivmgDljIVf/jleBREWatCga03/Bnm3o5NOCez1//0IpiNvolFXw==
X-Received: by 2002:a05:6512:3191:: with SMTP id
 i17mr1945352lfe.33.1583501063127; 
 Fri, 06 Mar 2020 05:24:23 -0800 (PST)
Received: from mail-lj1-f171.google.com (mail-lj1-f171.google.com.
 [209.85.208.171])
 by smtp.gmail.com with ESMTPSA id u15sm7258628ljl.34.2020.03.06.05.24.22
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 06 Mar 2020 05:24:22 -0800 (PST)
Received: by mail-lj1-f171.google.com with SMTP id w1so2204220ljh.5
 for <dri-devel@lists.freedesktop.org>; Fri, 06 Mar 2020 05:24:22 -0800 (PST)
X-Received: by 2002:a2e:9356:: with SMTP id m22mr1274250ljh.201.1583501061710; 
 Fri, 06 Mar 2020 05:24:21 -0800 (PST)
MIME-Version: 1.0
References: <20200304022429.37738-1-zhangxiaoxu5@huawei.com>
 <20200306103846.GS2363188@phenom.ffwll.local>
 <CAHk-=wgA7wCXf2s+ihRopi7dzfzc7hWQ0jGiQiV8vMW-XVdD-A@mail.gmail.com>
 <CAKMK7uF_JnyWi+2QUG9OscC9DUA+4wh4dZGAXXAyYeXMTzXFyw@mail.gmail.com>
In-Reply-To: <CAKMK7uF_JnyWi+2QUG9OscC9DUA+4wh4dZGAXXAyYeXMTzXFyw@mail.gmail.com>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Fri, 6 Mar 2020 07:24:05 -0600
X-Gmail-Original-Message-ID: <CAHk-=wi-vJ9-snUQeotBD0Zmb-Y=ggPQcY3yP=M2qjsXttvCOQ@mail.gmail.com>
Message-ID: <CAHk-=wi-vJ9-snUQeotBD0Zmb-Y=ggPQcY3yP=M2qjsXttvCOQ@mail.gmail.com>
Subject: Re: [v4] vgacon: Fix a UAF in vgacon_invert_region
To: Daniel Vetter <daniel@ffwll.ch>
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
Cc: Andrew Morton <akpm@osdl.org>, Petr Mladek <pmladek@suse.com>,
 wangkefeng.wang@huawei.com,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 Zhang Xiaoxu <zhangxiaoxu5@huawei.com>,
 Linux Fbdev development list <linux-fbdev@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Sergey Senozhatsky <sergey.senozhatsky@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Mar 6, 2020 at 7:12 AM Daniel Vetter <daniel@ffwll.ch> wrote:
>
> I'll stuff it into a pull and throw that your way, that's simplest.

Thanks.

> btw we did add dri-devel to lore a while back, so should be there:

Indeed. I tried (incompetently) to look up your message ID, but I
didn't put the dri-devel part and saw the 404, and assumed it wasn't
there.

My bad.

> > It does strike me that there's nothing that seems to check for
> > overflow in the "(width << 1) * height" calculation. Hmm?
>
> Indeed I failed to hunt for that :-/ But I think we're good, in
> vc_do_resize() we have
>
>     if (cols > VC_RESIZE_MAXCOL || lines > VC_RESIZE_MAXROW)
>         return -EINVAL;

Perfect. I just looked at the quoted patch itself.

            Linus
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
