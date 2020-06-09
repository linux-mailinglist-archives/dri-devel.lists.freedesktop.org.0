Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 36F4D1F4855
	for <lists+dri-devel@lfdr.de>; Tue,  9 Jun 2020 22:53:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 196356E0D6;
	Tue,  9 Jun 2020 20:53:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x242.google.com (mail-lj1-x242.google.com
 [IPv6:2a00:1450:4864:20::242])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 672476E0D6
 for <dri-devel@lists.freedesktop.org>; Tue,  9 Jun 2020 20:53:41 +0000 (UTC)
Received: by mail-lj1-x242.google.com with SMTP id a25so26848581ljp.3
 for <dri-devel@lists.freedesktop.org>; Tue, 09 Jun 2020 13:53:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=anholt-net.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=TFHcUUoO1FylPt5rc0c0PdKgmY833A9Es0GuuQUo5KY=;
 b=jDhXoJNBsNpo+l35SQi7b81dRYCdRiZywWIJdMDv31IWxI8b3VSlSYeuVFagof6fvk
 28LT1R7cTEm6SFyVGINWDlJ8gu8Jgf0szWW3IZ/kpBy9ao/bvafTaRSLf5e3FUo+WdK4
 Zt6x+k3jqXt1wW7d/6qxF3bo2iTm/zRSVgKEBO+IgDqjagRi7AIuR0YRPtdLGXuE8IJx
 qKhgk/hk1Lj9rk67XOuiF8cqIbye4/RFk3MNhUA2QBmhQjGaB2Yn7OBBrdEYvf6a0JfD
 PoioSTvHiYWzuS/duNHw2xEZLCRG5GtIxSxwJ7VL1NLkKk8PxKzAsje3cNfMOH7Ekuju
 o6RQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=TFHcUUoO1FylPt5rc0c0PdKgmY833A9Es0GuuQUo5KY=;
 b=cRPnGjKJh7WgVlkfk6igsu4uzhpZFkDh6a2JYHMdXbSax6bMuCzFHti9QPmCVJVf4V
 ZU9wthRjxu0XXvI+EeUsxtu7SdDbYIEhM1/Uq17owjJ0Abnb/hf50aiWx7KqCpT/kL48
 eofgx1XsiXfGitAlIjs/Vy1nqVt2QunyOI+Q6Z8k5H0bBaMhHCvLyoegnNu0pH8Py2bL
 cXUWuhiyNP8P8SZIUHkxnzWELQnyk874u1vN0IZFAF2Ywbex9b0UtO2FBUnP7Jtw/J3g
 WnoohsYF2gD4ov7ypVRrxTBjsqgC0qEbUKU4Ou+9zbcWZB8m9XO4mBlRobL1Arccq/we
 cp7g==
X-Gm-Message-State: AOAM5309v16R8Ow4q2JCyR6kFbHcP1TkJAgnPPOsPSkSRjS5mu3/AxUd
 uTcIePFSgvusRG8p22hGZ2cvxXOJTpLW+CPM4zMt/w==
X-Google-Smtp-Source: ABdhPJwcLX/s9SsSPOWcglqJwxXBNcSsqG9gpJAls07UlYvl0E3XXfEatVbM2fJFcosuqjHK+8QhAwuvJpEGU/s3Ssc=
X-Received: by 2002:a2e:9147:: with SMTP id q7mr74383ljg.430.1591736019791;
 Tue, 09 Jun 2020 13:53:39 -0700 (PDT)
MIME-Version: 1.0
References: <20200609200446.153209-1-linus.walleij@linaro.org>
 <20200609200446.153209-4-linus.walleij@linaro.org>
 <CADaigPX_9mBqr3hKA0-aC-TOY3hEnXnQremMiPopw8DUcGCzgQ@mail.gmail.com>
 <CACRpkdbY=ALou98n6uW8C5Wwup1-qyaNZhqTSwC8B5FydjbgQA@mail.gmail.com>
In-Reply-To: <CACRpkdbY=ALou98n6uW8C5Wwup1-qyaNZhqTSwC8B5FydjbgQA@mail.gmail.com>
From: Eric Anholt <eric@anholt.net>
Date: Tue, 9 Jun 2020 13:53:28 -0700
Message-ID: <CADaigPV-=Wh1T=9+PDobUNLcTQ4mXYx6gzeTOXsW6EY=Ekf_gA@mail.gmail.com>
Subject: Re: [PATCH 4/4] drm: pl111: Update documentation
To: Linus Walleij <linus.walleij@linaro.org>
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
Cc: Russell King <linux@armlinux.org.uk>,
 DRI Development <dri-devel@lists.freedesktop.org>, Sean Paul <sean@poorly.run>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Jun 9, 2020 at 1:17 PM Linus Walleij <linus.walleij@linaro.org> wrote:
>
> On Tue, Jun 9, 2020 at 10:11 PM Eric Anholt <eric@anholt.net> wrote:
>
> > FWIW, series is Reviewed-by: Eric Anholt <eric@anholt.net>
>
> Thanks Eric, do I remember correct that you were using this
> driver for something like a clock display? Are you still using it
> for that?
>
> Nowadays the biggest user is arguably the ARM FVP emulator
> which is running a full Android stack using this driver.

I've since moved on from Broadcom (now working at Google on open
source qualcomm graphics) but as far as I know the HW team at broadcom
making those phones will still be using this driver in combination
with vc4.  I had ported their phone as a vehicle to get vc4 onto more
versions of the graphics chip and hopefully get more of bcm invested
in open source graphics.
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
