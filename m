Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 473661282A
	for <lists+dri-devel@lfdr.de>; Fri,  3 May 2019 08:55:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 38F96896C7;
	Fri,  3 May 2019 06:54:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x244.google.com (mail-oi1-x244.google.com
 [IPv6:2607:f8b0:4864:20::244])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C33A389875
 for <dri-devel@lists.freedesktop.org>; Thu,  2 May 2019 21:57:37 +0000 (UTC)
Received: by mail-oi1-x244.google.com with SMTP id v23so2972243oif.8
 for <dri-devel@lists.freedesktop.org>; Thu, 02 May 2019 14:57:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=G2sjyoUeuJYuIjngX2ILD83GnYlukRSwvUsebFbNhTk=;
 b=DpMERSwRnL2VrdiC6QBEkjR87ZseFMp6u3mSd6JouYMRTHW7q4qiPewfTueiWs0Big
 GWrZaTob3GcZUPXKLOEqRtUShjqgPx6QsQYmp9AhvzI5r5YtbweNEdt3166SugwGxCsn
 gdCjoobDy+vxLshh8oxeTEn3DjSNW9eweTJKQ7ws9tn12XayIpwOP8wrXK7b5sAgFHVY
 unJynUKRWBEdDSADfWQZeWupE9bfFHAquknXcNoWy/nOj+o84Rm21fuxe4Cm4O0gx+5G
 Ctki2pn3bIb7Lc9l7cyATLfI9YwWHGpOeYd/u9v3zt+9pqmUwnBI/qMjRBx6XiT9IU+w
 xw/g==
X-Gm-Message-State: APjAAAXuAARD/s7HecbbkYE3Hs1017UuKUZzPyV+jbVPe7o9rGs0ZQ0o
 T7USCOcXYUbalD2E5TO2RisyYMfDKtAMvpkUuNZ9/A==
X-Google-Smtp-Source: APXvYqyfUiLwZ0iRvaYg1t9hxkmISx8EQUC46UkYdIfqvKTXOkic4Yk3nXHBYK7Ucq2QTSPvYggvfgk0k+L2u7CpP0U=
X-Received: by 2002:aca:be89:: with SMTP id o131mr3882910oif.138.1556834256688; 
 Thu, 02 May 2019 14:57:36 -0700 (PDT)
MIME-Version: 1.0
References: <20190502180346.4769-1-john.stultz@linaro.org>
 <CAOvepGk_0UTnXztVgXh6qYGBF_3aQFBqs4HUpwhmfMV0G8TMNQ@mail.gmail.com>
 <CALAqxLXQV4jJpcV5VgECXQR5rw288v7LvBjEvzKm5eJb7oqPjA@mail.gmail.com>
In-Reply-To: <CALAqxLXQV4jJpcV5VgECXQR5rw288v7LvBjEvzKm5eJb7oqPjA@mail.gmail.com>
From: Dan Willemsen <dwillemsen@google.com>
Date: Thu, 2 May 2019 14:57:25 -0700
Message-ID: <CALQgHdmcPgGrW+0TfH6V3UGPwkf5i6SBsDPbag-4zNpvxJ+qAg@mail.gmail.com>
Subject: Re: [RFC][PATCH 0/3] mesa: Initial build fixups for AOSP/master
To: John Stultz <john.stultz@linaro.org>
X-Mailman-Approved-At: Fri, 03 May 2019 06:54:46 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=G2sjyoUeuJYuIjngX2ILD83GnYlukRSwvUsebFbNhTk=;
 b=AjkqhnS4J0Ie1/QvhXG1KY/qcYGN4y+pBz38Fd9dZl20+kZ+ZnCvtSRLq4ONUgmTAf
 oqEtCotHSCDGDOWQXAmCWPt+RB0/by/H20x2jdgh4m9yFR6LfLZqcuwLVFRyZK5HTqcj
 8qvmWcqgpHZAJXStP4Fi0GYorY/ZHT4ps4fnCWsu9umdAAxURQziJooZqFEEb8eOp/Lh
 JUQgG7WjC0FLCbucS3OwVsgw/AOW3ptYd2ykjE2yC6NOPbhAmKhZww3FWQK5fx2n6EHh
 Lt5fYBzVSESz685cymXIx0oH+luZjCbjx8rotqP++OYsWwj62kuIS0pv17PeF7EcYnCK
 JoZA==
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.23
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
Cc: Rob Clark <robdclark@chromium.org>, Amit Pundir <amit.pundir@linaro.org>,
 Greg Hartman <ghartman@google.com>, Emil Velikov <emil.l.velikov@gmail.com>,
 Alistair Strachan <astrachan@google.com>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Jason Ekstrand <jason@jlekstrand.net>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVGh1LCBNYXkgMiwgMjAxOSBhdCAxOjUyIFBNIEpvaG4gU3R1bHR6IDxqb2huLnN0dWx0ekBs
aW5hcm8ub3JnPiB3cm90ZToKPgo+IFdlIG5lZWQgc29sdXRpb25zIGZvciB0aGUgeGdldHRleHQg
YW5kIHRoZSBweXRob24tbWFrbyB1c2FnZS4KCiBBbmRyb2lkIGRvZXNuJ3Qgc3VwcG9ydCB0cmFu
c2xhdGlvbnMgYXQgdGhpcyBsZXZlbCwgc28geW91IG1heSBiZQphYmxlIHRvIGp1c3Qgc2tpcCB4
Z2V0dGV4dCBhbHRvZ2V0aGVyLgoKLSBEYW4KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMu
ZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlz
dGluZm8vZHJpLWRldmVs
