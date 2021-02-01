Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6CCE230AE17
	for <lists+dri-devel@lfdr.de>; Mon,  1 Feb 2021 18:40:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0D1386E866;
	Mon,  1 Feb 2021 17:40:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x1032.google.com (mail-pj1-x1032.google.com
 [IPv6:2607:f8b0:4864:20::1032])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5D3176E866
 for <dri-devel@lists.freedesktop.org>; Mon,  1 Feb 2021 17:40:38 +0000 (UTC)
Received: by mail-pj1-x1032.google.com with SMTP id d2so14435pjs.4
 for <dri-devel@lists.freedesktop.org>; Mon, 01 Feb 2021 09:40:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=GTMtuxP7iEoUqiDSP2dht+ZCnCmYXbJy1K3YoeV/SmU=;
 b=MDGJWNwJ35gvKBo5NLN7kGZe+ApEGYNEz82zcPwbM4tWvcYrjTo4TAYaPXMoEFK+8u
 1x/oEJhAO4bMA06NTZ5IGC4fRw1CPtoWCY+7O3vErExC0MWqP2OsjWOAAi+aPJoT9zp/
 qVejQXXi2R8y3ngoZHbnpSFo1rxY0P9rYO077gAjHPQYXV7HH34KFJ7sNvKSolvrYOoO
 nIWncGjfwmIiYQvSkdCLiis9c+spsUZz0Mnb2kWPvwbFT1Ko5Fneqw1BzH3kxJ8SH1Sp
 +yOQcj2IPKZSfYtQLww4HhIBNbJOzE8Zjf04DWqD0eYqIBcy8SYWitY5fPl04b3WKE8G
 /naw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=GTMtuxP7iEoUqiDSP2dht+ZCnCmYXbJy1K3YoeV/SmU=;
 b=lOcqTopsUndqABwnqvlR6gN5xLaMH3GgT6Fw9r6VaMgKMBgPIe3csf3ikarXuO/Yvq
 LRzSZ267sQN1GR12a5TA9qOOpBzGpWn9VnDswNGo0Fh0RtPCX1wyTJPrAQTskZpDACaj
 zbg/yQte1OFkiVNzNlOR7yJYfKiAAzjClB9CzLpg6SBHraiEr3U15ZXO6xr17S696f1P
 JREJsVTc8//1JUnll2LdSa/FvHLeFaoLvFAA1z2qwTEZUSNciH7bZ0ZkCvrmca51Od5N
 PI5Hf8K+OSrNAHJ2da3YSumd90zIVdhe1wcSl9gcFZ/hFALSKWjC9eAuj+fgs99E5shu
 BDxA==
X-Gm-Message-State: AOAM531cNpJevvrDuJkM8SpR8UTOw18o2iy3OCKLCRe0KYK39leNRO7T
 oZ4z8Xrj5V/dT7ZPmcvWziOm5fHHI7EEti28ibs=
X-Google-Smtp-Source: ABdhPJzsf/mGYBUXGJkiBfEdfymx5WNNIChE3ZG2ug5Z0AG7OF70uy77dHN6ipEiQgy2rF+Pjpv6HrFP20KM9qiJSp8=
X-Received: by 2002:a17:902:7b96:b029:de:7ae6:b8db with SMTP id
 w22-20020a1709027b96b02900de7ae6b8dbmr18507825pll.0.1612201237868; Mon, 01
 Feb 2021 09:40:37 -0800 (PST)
MIME-Version: 1.0
References: <1611838435-151774-1-git-send-email-zhangxuezhi3@gmail.com>
 <CAHp75Vd=ijxnamuSYuxNLeyhGMCod=HaXWrQ0W0+3QCsQAychg@mail.gmail.com>
 <20210129130110.00003bb1@gmail.com>
 <CAHp75Vdi4H_zY3+QPSq_wmdf20B9xPeqsOT10JHfMLJESX77gA@mail.gmail.com>
 <20210129215638.000047b0@gmail.com>
 <CAHp75VcdOibSRuSBZYhFtEcVxuammYMfcnrUQGvS6ttArFxj6g@mail.gmail.com>
 <20210130143924.00005432@gmail.com>
In-Reply-To: <20210130143924.00005432@gmail.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Mon, 1 Feb 2021 19:40:21 +0200
Message-ID: <CAHp75VenJVOSbAXryGK_BWytRJF=T1zwk5xDimRQOTojoXbMFQ@mail.gmail.com>
Subject: Re: [PATCH v12] staging: fbtft: add tearing signal detect
To: carlis <zhangxuezhi3@gmail.com>
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
Cc: "open list:STAGING SUBSYSTEM" <devel@driverdev.osuosl.org>,
 "open list:FRAMEBUFFER LAYER" <linux-fbdev@vger.kernel.org>,
 Deepak R Varma <mh12gx2825@gmail.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 oliver.graute@kococonnector.com,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Stefano Brivio <sbrivio@redhat.com>, Colin King <colin.king@canonical.com>,
 zhangxuezhi1@yulong.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sat, Jan 30, 2021 at 8:39 AM carlis <zhangxuezhi3@gmail.com> wrote:
> On Fri, 29 Jan 2021 16:26:12 +0200
> Andy Shevchenko <andy.shevchenko@gmail.com> wrote:
> > On Fri, Jan 29, 2021 at 3:56 PM carlis <zhangxuezhi3@gmail.com> wrote:
> > > On Fri, 29 Jan 2021 12:23:08 +0200
> > > Andy Shevchenko <andy.shevchenko@gmail.com> wrote:

...

> > > Hi, I apologize for what I said in the previous two emails. I missed
> > > one email you sent before, and now I probably understand what you
> > > meant. Here is a version I modified according to your suggestion:

I have realized that you are mocking stuff in the generic fbtft
structure for all drivers while only a single one is going to use
that. Consider moving everything to the driver in question.


-- 
With Best Regards,
Andy Shevchenko
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
