Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 376CC58969A
	for <lists+dri-devel@lfdr.de>; Thu,  4 Aug 2022 05:38:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6FF8F10EE72;
	Thu,  4 Aug 2022 03:38:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x62a.google.com (mail-ej1-x62a.google.com
 [IPv6:2a00:1450:4864:20::62a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3F21110FA19
 for <dri-devel@lists.freedesktop.org>; Thu,  4 Aug 2022 03:37:50 +0000 (UTC)
Received: by mail-ej1-x62a.google.com with SMTP id j8so9417390ejx.9
 for <dri-devel@lists.freedesktop.org>; Wed, 03 Aug 2022 20:37:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc;
 bh=LVd6x4jd0g7TYMdesIbqiqpXq1pUyWFD95vFNyBmMLc=;
 b=FkkSlScGm6mmeoBPA6MeYQvLc1RnIXfWRfW6UA/pN/ey69EO4VPSsor2KcBvVz0+Dn
 1Rk4TnfLz0rgPESu3F9VyKL2aPXEWVzFNX0LyBh3y0LEfvGdAxUy+59k2eOeHcNeKTPf
 veXtqJ8V5phXmzyywQ1UJS85hO4i4fYjAX1NSMjYrhLC4YFjRpj/j7e1TTjIoK/YppbE
 eMhMBIsn/Y8GmVMomR0RSzM6Lg/C2vThcpU04rgz/wFoYLmzulfETi6l6uUwu21ij3wl
 wP7hyx/EgJA6qE3q9I9IflSw+gWwRpjltOkJW4q2RNR7iClEFzdTtrpNvV/Oc0ehRaVG
 iMTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc;
 bh=LVd6x4jd0g7TYMdesIbqiqpXq1pUyWFD95vFNyBmMLc=;
 b=QZO3BWnw1eZA3/i8tzO0tH+MhqvqOe+b2wLVVaR8DBaQK/Nclz5omYiMmPFCd0liRq
 U4v7ai8ASN9w17t6i3fguGievbTwVm271R281PPfwsZGNXvW1f2dxM2hDjVXtqCBArRJ
 d4um8DuhyNGw9ZDwD6JoZ34GyLlmp1QN/V55u2fULsEnDPpR10XUIOwhkJKPHzr6a49E
 I7SsU9Qa+hG2DUWcCcld5GVhVyRVq6TUWb6zWkOCXsHvYmhv+NJA/RAQXpTrv9eCGJxF
 oB2IzEhWMlogFM9P2l8MT9mlvo4wPhhvN2RCy9SiNKd01vt3b0ISBple2bWWReXMjQ0F
 C4ZA==
X-Gm-Message-State: AJIora+CfNv0jeSd3YX9/7ZfG1CHNgHwqgSNJm+yi02rpCFf0fYziOz/
 kVSr4jGT7AiSqIDMlkLuL4G2jELvhkK88+CAPx8=
X-Google-Smtp-Source: AGRyM1vNZJq1ARxRxepmPJ8am83ern4n6XWg8Qno1AlZusGnNYHH8H+kH3ubIVjYYRgPJUjrFi715BXNE5LFABQwerY=
X-Received: by 2002:a17:907:96ac:b0:72f:1dea:5b66 with SMTP id
 hd44-20020a17090796ac00b0072f1dea5b66mr22316171ejc.266.1659584268602; Wed, 03
 Aug 2022 20:37:48 -0700 (PDT)
MIME-Version: 1.0
References: <CAPM=9twFEv8AcRQG-WXg5owy_Xhxy3DqnvVCFHgtd4TYCcKWEQ@mail.gmail.com>
 <CAHk-=whXSt2N0GcoPC6XxXXLMpXm-34ua+X4AhPsLoqBcF6Xqg@mail.gmail.com>
 <CAHk-=wj8UHvjsVPohpRA1RJo1upyKoSnjcsys+=vbRVbpPvBMg@mail.gmail.com>
In-Reply-To: <CAHk-=wj8UHvjsVPohpRA1RJo1upyKoSnjcsys+=vbRVbpPvBMg@mail.gmail.com>
From: Dave Airlie <airlied@gmail.com>
Date: Thu, 4 Aug 2022 13:37:37 +1000
Message-ID: <CAPM=9txsYE1zFDW+ehHQv138DoeT1Fw6hfzfPa4czvXGSjefjw@mail.gmail.com>
Subject: Re: [git pull] drm for 5.20/6.0
To: Linus Torvalds <torvalds@linux-foundation.org>
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

On Thu, 4 Aug 2022 at 13:16, Linus Torvalds
<torvalds@linux-foundation.org> wrote:
>
> On Wed, Aug 3, 2022 at 7:46 PM Linus Torvalds
> <torvalds@linux-foundation.org> wrote:
> >
> > I think I have it resolved, am still doing a full build test, and will
> > then compare against what your suggested merge is.
>
> Hmm.
>
> I end up with *almost* the same thing.
>
> Except I ended up with a
>
>         select DRM_BUDDY
>
> for the DRM_AMDGPU config entry, and you don't have that.
>
> I *think* my version is correct, in that clearly the amdgpu driver now
> uses that buddy logic (just doing a random "grep drm_buddy_block" to
> see).

Actually I did miss that so that looks good.

>
> But this was messy enough to resolve that I think people should
> double-check my end, and maybe I just got confused at some point in
> the process.
>
> And while I seem to have gotten the same result as you did on the i915
> firmware side too, again, I'd like people to re-verify.

I'll pull it down and look over it.

Dave.
