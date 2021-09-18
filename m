Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7BBB04105DE
	for <lists+dri-devel@lfdr.de>; Sat, 18 Sep 2021 12:06:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2CEF188EA1;
	Sat, 18 Sep 2021 10:06:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x532.google.com (mail-ed1-x532.google.com
 [IPv6:2a00:1450:4864:20::532])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3BD306E11A
 for <dri-devel@lists.freedesktop.org>; Sat, 18 Sep 2021 09:18:36 +0000 (UTC)
Received: by mail-ed1-x532.google.com with SMTP id q3so39397988edt.5
 for <dri-devel@lists.freedesktop.org>; Sat, 18 Sep 2021 02:18:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=i3wm.org; s=google;
 h=sender:from:to:subject:in-reply-to:references:date:message-id
 :mime-version:content-transfer-encoding;
 bh=qK4ju5AI6G3Zf6PO3Ul2TzugtvR5Xl/swxPPOE6LQIM=;
 b=nUVS7Dvi3cQixcm9s8Sg4DNhO3PdBGFS7a+UnOWftyWGbK5+rGX4y/yGRNMYHdL+lx
 dild9tArLr4WIR1pgF5zDjdLrvjqr55RTcDgxGOdR5ew+GfwlAG13CSdajKSsIBirRIb
 7gIBHNGTir02CIQzr4cR4uULjoHTIIHOAxAho9E/mL1iWnwaJ2Hh0K59UehKHaDngRYA
 is6xY3Vaom451svbE9K0FYNRSbbVUfETRiDl8/pKis4zkKliFELGHmMizbmyHc3WOom0
 G//G/dGZnjZftXlXnA2/awZ25ZiVUoYZdjFpaNZxaA/YGozwGP0nj+eysNUf9IwUzLS6
 vrcQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=stapelberg.ch; s=google;
 h=sender:from:to:subject:in-reply-to:references:date:message-id
 :mime-version:content-transfer-encoding;
 bh=qK4ju5AI6G3Zf6PO3Ul2TzugtvR5Xl/swxPPOE6LQIM=;
 b=KD3MAFDZEky/hEAyxVkCIxe3yssuKJKFmqyWkNdagdey+fTjP8xApv0vq1RkOh1eNa
 /ZBYcwIvm52U53zSvANzW+h+J9olP2UyuN3dzrrnY/iD18WZzN3TBX6oxhH3rjA30Ewe
 RT/FYHRfpcMKUUFAe9P9dKPqM4Mj0Lv7PzpTnnAPUzsstva6Pl6sCs142vt1YObVrNCz
 eKDX3AuRBU4KYqhEeAV48U47/9x6amBW3709RTniLhKBlBBNwwLgXptTR5Cx4YWKMdVq
 2Q66ra9cb2gx19xkINyZkdPxKLRXa9kQL4yJB158gf1vjt+HR3irRFl91enHmBUPo6DN
 X+cw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:subject:in-reply-to:references
 :date:message-id:mime-version:content-transfer-encoding;
 bh=qK4ju5AI6G3Zf6PO3Ul2TzugtvR5Xl/swxPPOE6LQIM=;
 b=WC189HONccpGhjaC1Xt+EsQgGP7Kp1oqqXVw7lK+QDzW5nVKUZ8lmU8bMO5SL3Lp74
 tMc7MLjTrWDmWQPQXDemnyfoQCHep4Wt8QDDyWMjcyK+VWvJ51omSB/Ll5W4HPWxzkFQ
 if8JSK6unXM1DF7yCtOEkQn6CSQIjsEqeSEeRYcpR/ko9+5bljchnuuF6Oi4/Xk+O4L0
 hRozLtA8soJbRvlFY1WMF7HLnfv99Tn62K+xSWw6wLfUi15dXVaulEd4Ht2Db3I+U4M7
 UYpIeisRiH295O+xnQPOzioySxwtilwZrUuFpHldRaBDBg4HHKBMgzX0l+O/LbnaQanP
 xr4w==
X-Gm-Message-State: AOAM533fjn6pmbe+7UFF+pGRs8x3v11AgNTaa5CkqMO4tAVxx9AkMGmO
 93a3F/6lofdZqEEoBAhEo6oB2Gz+t0d4mw==
X-Google-Smtp-Source: ABdhPJxAu8Pka0K/13/DVUHvhwPcv2PYiwbK7xbBi7XuM27CyZibwcOZ5ZF1BD8Ac3vTS2HofV7ixA==
X-Received: by 2002:a17:906:7147:: with SMTP id
 z7mr17010955ejj.94.1631956714299; 
 Sat, 18 Sep 2021 02:18:34 -0700 (PDT)
Received: from localhost ([2a02:168:4a00:0:e61d:2dff:fe09:a3e0])
 by smtp.gmail.com with ESMTPSA id bm1sm3427533ejb.38.2021.09.18.02.18.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 18 Sep 2021 02:18:33 -0700 (PDT)
From: Michael Stapelberg <michael@stapelberg.ch>
X-Google-Original-From: Michael Stapelberg <michael+drm@stapelberg.ch>
To: dri-devel@lists.freedesktop.org, torvalds@linux-foundation.org,
 felix.kuehling@amd.com, Dave Airlie <airlied@gmail.com>
Subject: Re: [git pull] drm for 5.14-rc1
In-Reply-To: <CAHk-=whgcN6MEyZBgK3UZRw=vwd1CAAK9+rafmZ2vsOiGpsMSA@mail.gmail.com>
References: <CAPM=9tzR4BqTtamrTy4T_XV7E0fUNyduaVtH5zAi=sqwX_3udg@mail.gmail.com>
 <CAHk-=whgcN6MEyZBgK3UZRw=vwd1CAAK9+rafmZ2vsOiGpsMSA@mail.gmail.com>
Date: Sat, 18 Sep 2021 11:18:33 +0200
Message-ID: <871r5mp7h2.fsf@midna.i-did-not-set--mail-host-address--so-tickle-me>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Mailman-Approved-At: Sat, 18 Sep 2021 10:06:27 +0000
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

Hi,

torvalds at linux-foundation.org (Linus Torvalds) writes:
> Did I fix it up correctly? Who knows. The code makes more sense to me
> now and seems valid. But I really *really* want to stress how locking
> is important.

As far as I can tell, this merge conflict resolution made my Raspberry
Pi 3 hang on boot. You can find the full serial console output at:

https://t.zekjur.net/linux-5.14-raspberry-pi-3-hang-vc4.txt

The last few messages are from vc4, then the boot hangs.

Using git-bisect, I tracked this down to
https://github.com/torvalds/linux/commit/e058a84bfddc42ba356a2316f2cf114197=
4625c9,
which is the merge you=E2=80=99re talking about here, AFAICT.

I also tried the git://anongit.freedesktop.org/drm/drm, and that tree
boots as expected, suggesting that the problem really is with the
additional changes.

The code seems to work on my Raspberry Pi 4, just not on the Raspberry
Pi 3. Any ideas why that might be, and how to fix it?

Thanks!

--=20
Best regards,
Michael
