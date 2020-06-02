Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C6411EC4AF
	for <lists+dri-devel@lfdr.de>; Tue,  2 Jun 2020 23:56:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 312A06E479;
	Tue,  2 Jun 2020 21:56:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x241.google.com (mail-lj1-x241.google.com
 [IPv6:2a00:1450:4864:20::241])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 747046E479
 for <dri-devel@lists.freedesktop.org>; Tue,  2 Jun 2020 21:56:36 +0000 (UTC)
Received: by mail-lj1-x241.google.com with SMTP id b6so183830ljj.1
 for <dri-devel@lists.freedesktop.org>; Tue, 02 Jun 2020 14:56:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linux-foundation.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=ZFXpnaRfbFT4qc2OekIf1wIsAFI+MC0nu33d3pEpk/o=;
 b=Pf6ZCcMfs32paMZ+A6vyBAKHYfskO6g12cXyNDwWKdXTZNYfCWP+/YD2fqEFUY6Gcg
 Y7/ubm/9l0oGkth8a9i638SVf7dkUsymUnILaERjpeZ6Rlj7YWZ3VcjcwI7yaO72bFxi
 wjqFS1hTYv6TNtQz1j1Md+NMh+Ni8RqnIN8ro=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=ZFXpnaRfbFT4qc2OekIf1wIsAFI+MC0nu33d3pEpk/o=;
 b=KdhVKYItoOez5wTcf0QGEr6a8WsJcd2NZvVXat5K3IZ7C4jCP8gn+z4n9t/krGiK6n
 MSUl9Yel8zXWykG9/cyrWCZscFDmgIt1OGXHCGthga95OxNO6hlqok2mvr/e1MYmlNo5
 ZiqWXoAaGbzLbUACzxj9KgcEKbU+42WXrAF413g7Mwc2AnDkTJk3aoURqwv4XnrFDRXv
 X+LT4BCMIRQKqyG9Q6trtUkrvL6TrA26c8BfEvjujIvXYuTaP9K1ZQ9imQlOzKlC8ber
 cfQ+LHwN5v8kwfoFtIqVV4HM/UZrKpoqz/2eju5wUqo153bWtuF3g1hGTNWXJPi86LHP
 fGww==
X-Gm-Message-State: AOAM5311lKeCZja3p7sMfUnEEGsfkjLAHp6F/X9j6+Mfgaz2o1FDAOpK
 G5kHH2pJASnMvV0Ceoadl8LpDXaj73w=
X-Google-Smtp-Source: ABdhPJwB0WIDoWcFSUMYk0ELdHgCQhBndhF2gg5/IZ/ONiBmfhHJoEtZRKr38IWndY9vCeOCt9fhGQ==
X-Received: by 2002:a2e:3e16:: with SMTP id l22mr528559lja.333.1591134993607; 
 Tue, 02 Jun 2020 14:56:33 -0700 (PDT)
Received: from mail-lj1-f173.google.com (mail-lj1-f173.google.com.
 [209.85.208.173])
 by smtp.gmail.com with ESMTPSA id f74sm73127lfd.68.2020.06.02.14.56.31
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 02 Jun 2020 14:56:32 -0700 (PDT)
Received: by mail-lj1-f173.google.com with SMTP id z18so115240lji.12
 for <dri-devel@lists.freedesktop.org>; Tue, 02 Jun 2020 14:56:31 -0700 (PDT)
X-Received: by 2002:a2e:974e:: with SMTP id f14mr526774ljj.102.1591134991617; 
 Tue, 02 Jun 2020 14:56:31 -0700 (PDT)
MIME-Version: 1.0
References: <CAPM=9txGww+omvateOTizZRV9_wLdAbq6uAz3DRa_S6bn1jQuQ@mail.gmail.com>
 <CAHk-=wjvVjei5d45D=GQMsFMssD8knSFWqxMbd4bH8qSgXk-Lg@mail.gmail.com>
In-Reply-To: <CAHk-=wjvVjei5d45D=GQMsFMssD8knSFWqxMbd4bH8qSgXk-Lg@mail.gmail.com>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Tue, 2 Jun 2020 14:56:15 -0700
X-Gmail-Original-Message-ID: <CAHk-=wiug3vS=J7obQsyCLp+6qQvT5v6ctOddHRXbVgsLFTLwQ@mail.gmail.com>
Message-ID: <CAHk-=wiug3vS=J7obQsyCLp+6qQvT5v6ctOddHRXbVgsLFTLwQ@mail.gmail.com>
Subject: Re: [git pull] drm for 5.8-rc1
To: Dave Airlie <airlied@gmail.com>, Tomi Valkeinen <tomi.valkeinen@ti.com>, 
 Thomas Zimmermann <tzimmermann@suse.de>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Jyri Sarha <jsarha@ti.com>
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

On Tue, Jun 2, 2020 at 2:21 PM Linus Torvalds
<torvalds@linux-foundation.org> wrote:
>
> I'm still working through the rest of the merge, so far that was the
> only one that made me go "Whaa?".

Hmm. I'm also ending up effectively reverting the drm commit
b28ad7deb2f2 ("drm/tidss: Use simple encoder") because commit
9da67433f64e ("drm/tidss: fix crash related to accessing freed
memory") made the premise of that simply encoder commit no longer be
true.

If there is a better way to sort that out (ie something like "use
simple encoder but make it free things at destroy time"), I don't know
of it.

I'll let you guys fight it out (added people involved with those
commits to the participants,

                    Linus
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
