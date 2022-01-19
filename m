Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 313E4493B92
	for <lists+dri-devel@lfdr.de>; Wed, 19 Jan 2022 15:01:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BDE8310E68B;
	Wed, 19 Jan 2022 14:01:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x52d.google.com (mail-ed1-x52d.google.com
 [IPv6:2a00:1450:4864:20::52d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A34B110E68B
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Jan 2022 14:01:23 +0000 (UTC)
Received: by mail-ed1-x52d.google.com with SMTP id m11so12052639edi.13
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Jan 2022 06:01:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linux-foundation.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=9nBImq/nQkQnpOEWVoZQh94HXj35ecrQ4IXZo3Dyzmw=;
 b=KSHMHMEeC0dv+WHm/tTZDcjCTpmGgJ+2O/Bcj5nqx14TU6rVFm0TYJQNimzbkDNAZn
 R8D5a4s470rm4/0YtqDbW1Uye6IoKCIq7W9dhj78xwaHPlVVV6WmGawx0MQMZTuxkVFU
 HmV0aG6V3m/+6aXvoG0EXnalfyW8QG4N8bJgA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=9nBImq/nQkQnpOEWVoZQh94HXj35ecrQ4IXZo3Dyzmw=;
 b=R7km9jgsuy2sfhegxQLyWg6Nlx72U8aGLoyYXkGzmsMvVitEWAcGyzZfZLcUJafRFU
 dG2ljndz0ZomgphtDNYtwlpoY9L2AQOR9oaIa61zPcy+eiZbnB5W3H40AvyYAnkR6b8Y
 3rO2KgUEUwk3wa7F5W3Ie9nBN/AWLRkQpKpS06JTK0P2otK3o4KR3P+j0Q6bnBQoGAqE
 Cv2Tg2N5RDe0Iqvhfx6I7ncHQIQKFqiYfi03ThGr1Zf9ZDcuKckjXZf9PWZpIZZiFFpb
 fxQXXGeaMjrDkYUeaLVoqQTUKvzbTYtMgwSk8l+Qr/1hPdExi8jt875HN62a+m2EseX2
 2o0w==
X-Gm-Message-State: AOAM531bVKJpOAKiLobBUIvXiNK/B5kEwnwr5LTc7Z+/v+b/66i9CAuD
 JhH+SQnIunc3bVpgVCR+4JOqpu0LHd88kf8i6ek=
X-Google-Smtp-Source: ABdhPJzipJvL6ar+8UKmwxWfbi4PGFj6/EXoepdh7m98mU2GkU8t35LxFfPF1gzxeipEE+gVhCA3Eg==
X-Received: by 2002:a17:907:3d88:: with SMTP id
 he8mr10646970ejc.490.1642600881990; 
 Wed, 19 Jan 2022 06:01:21 -0800 (PST)
Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com.
 [209.85.208.44])
 by smtp.gmail.com with ESMTPSA id pk10sm6397450ejb.84.2022.01.19.06.01.20
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 19 Jan 2022 06:01:21 -0800 (PST)
Received: by mail-ed1-f44.google.com with SMTP id j23so7064727edp.5
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Jan 2022 06:01:20 -0800 (PST)
X-Received: by 2002:adf:c74e:: with SMTP id b14mr29011574wrh.97.1642600880273; 
 Wed, 19 Jan 2022 06:01:20 -0800 (PST)
MIME-Version: 1.0
References: <20220119110839.33187-1-deller@gmx.de>
 <20220119110839.33187-3-deller@gmx.de>
 <Yef0j8+DBbwC7Kjv@kroah.com> <Yef15k2GtC40aJEu@kroah.com>
 <CAMuHMdVWFJEDwjf-htZ_D1484efmuPnz_L-qhcTeUE-GVpvZXA@mail.gmail.com>
 <4d8950c7-5f51-ca2b-4c93-741c7805a214@gmx.de>
In-Reply-To: <4d8950c7-5f51-ca2b-4c93-741c7805a214@gmx.de>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Wed, 19 Jan 2022 16:01:01 +0200
X-Gmail-Original-Message-ID: <CAHk-=wikFKjwdUBWCLCu=iL3rFq4BDDF0aBGdXC6ay74yJb+5Q@mail.gmail.com>
Message-ID: <CAHk-=wikFKjwdUBWCLCu=iL3rFq4BDDF0aBGdXC6ay74yJb+5Q@mail.gmail.com>
Subject: Re: [PATCH 2/2] Revert "fbcon: Disable accelerated scrolling"
To: Helge Deller <deller@gmx.de>
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
Cc: Linux Fbdev development list <linux-fbdev@vger.kernel.org>,
 Pavel Machek <pavel@ucw.cz>, Sam Ravnborg <sam@ravnborg.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Javier Martinez Canillas <javierm@redhat.com>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Claudio Suarez <cssk@net-c.es>, Tomi Valkeinen <tomi.valkeinen@ti.com>,
 Geert Uytterhoeven <geert@linux-m68k.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Daniel Vetter <daniel.vetter@intel.com>, Sven Schnelle <svens@stackframe.org>,
 Gerd Hoffmann <kraxel@redhat.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Jan 19, 2022 at 2:29 PM Helge Deller <deller@gmx.de> wrote:
>
> >>
> >> Ah, no, that was just the soft scrollback code I was thinking of, which
>
> Right.
> That was commit 973c096f6a85 and it was about vgacon, not fbcon.

No, fbcon had some bug too, although I've paged out the details. See
commit 50145474f6ef ("fbcon: remove soft scrollback code").

If I remember correctly (and it's entirely possible that I don't), the
whole "softback_lines" logic had serious problems with resizing the
console (or maybe changing the font size).

There may have been some other bad interaction with
foreground/background consoles too, I forget.

       Linus
