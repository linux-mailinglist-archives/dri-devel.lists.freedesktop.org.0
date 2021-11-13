Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 55AFA44F2A8
	for <lists+dri-devel@lfdr.de>; Sat, 13 Nov 2021 12:07:12 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C20916FAB8;
	Sat, 13 Nov 2021 11:07:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-xb33.google.com (mail-yb1-xb33.google.com
 [IPv6:2607:f8b0:4864:20::b33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BD9046FAB8
 for <dri-devel@lists.freedesktop.org>; Sat, 13 Nov 2021 11:07:04 +0000 (UTC)
Received: by mail-yb1-xb33.google.com with SMTP id g17so30715852ybe.13
 for <dri-devel@lists.freedesktop.org>; Sat, 13 Nov 2021 03:07:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=VSwBIpAKOvKE9/HfMni6vvyfMrUyqVOn+Ln8uGL1xcQ=;
 b=lmaLjcu6MnsUaKTfJOWQ3NCLah2twVb8rnhqSvRx1VtxjI9xCQ9Ao9/XFIWVKb/HLf
 K5HymG0R5CrZ930OT/c7NdRoI1z9iefbZZ82mVxzfmi5N019vVwam3rY0k9vR9qtuF4j
 II3m0FZW3u9w6RtUpOD5sS9iul4ax2s8WsCF7Bz4t0Hjzsz/AmkDfuEatFMd1z3YbN5/
 Ndw9ECBPcD1XwYRwdl8aubGwWXO47Fxc+XL9OFJKOONAUaqWAvDlGxAJJCXW0X8axC3D
 HEMvlHtxpeOmJNaeP64EcJQs1YgccppntT5w6gjnQRp9P9srtvXxxE9I9wo2HI0yegGH
 q2IQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=VSwBIpAKOvKE9/HfMni6vvyfMrUyqVOn+Ln8uGL1xcQ=;
 b=5RPtcBuTgA76/W4xILRNHmThd+IzEvINuxVH5r3Gz/vsgPjNJpVnGER9iyRpUNSndz
 aZmr0Y37JAygeil736rc3zrMSj6iD4bVniD7dKEeLYPPU+EY0bV/M2XvqkjGnpkQjeId
 088JG/YEvydJiUzuQOh7Y3PsPnzE+L4NHqShZ0kvMUztTGD7sYqpq9p6GlqkmiOubAXX
 DJC2Ueh6GWt5ORHCPoUahH+PT9IFgQKlFMqmqgEPLeBEloXiAjQJgYF2Inf6Hn1Ni8cj
 uTLO4o321nTRc9pVsvfEZ2/BEey4wjFezDuWCnRKPlS6hW9QanTx9XtBBMZv0t2M65PN
 igyw==
X-Gm-Message-State: AOAM533nzs5cI+XpUjb3lP0cjW4S+D7IE7t95bI823PGUDZ6hszChHJP
 Q1RPrLRPzuArIwrvQsSDfvVZqI2h9JaN5TeAZX0=
X-Google-Smtp-Source: ABdhPJyJSJBgIErAQL04cOmL6TrLYrxEMcCzqyulHgBnnK1s8n2Cg7iTYX25GttsV+7OTFXS7M+xXNQnHUz1qgHPDo8=
X-Received: by 2002:a25:bdc5:: with SMTP id g5mr23978411ybk.403.1636801623864; 
 Sat, 13 Nov 2021 03:07:03 -0800 (PST)
MIME-Version: 1.0
References: <CADVatmOuOk6RoZF=M9sZm2L=9NuDDsSNNCJJbAtkgScG0og1Ww@mail.gmail.com>
 <CADVatmP_Sn+SS5Yu5+7sJJ5SVpcaZcW8Z_Bj5vmYz9g3kJD86g@mail.gmail.com>
In-Reply-To: <CADVatmP_Sn+SS5Yu5+7sJJ5SVpcaZcW8Z_Bj5vmYz9g3kJD86g@mail.gmail.com>
From: Sudip Mukherjee <sudipm.mukherjee@gmail.com>
Date: Sat, 13 Nov 2021 11:06:28 +0000
Message-ID: <CADVatmOOzCxAgLhCu1tTz=44sgRDXds5-oMZ3V0w4f5kLCLKrw@mail.gmail.com>
Subject: Re: regression with mainline kernel
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
Cc: linux-kernel <linux-kernel@vger.kernel.org>,
 Nicholas Verne <nverne@chromium.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 "open list:VIRTIO GPU DRIVER" <virtualization@lists.linux-foundation.org>,
 Gerd Hoffmann <kraxel@redhat.com>,
 Gurchetan Singh <gurchetansingh@chromium.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Nov 11, 2021 at 8:51 PM Sudip Mukherjee
<sudipm.mukherjee@gmail.com> wrote:
>
> Hi Linus,
>
> On Thu, Nov 11, 2021 at 2:03 PM Sudip Mukherjee
> <sudipm.mukherjee@gmail.com> wrote:
> >
> > Hi Linus,
> >
> > My testing has been failing for the last few days. Last good test was
> > with 6f2b76a4a384 and I started seeing the failure with ce840177930f5
> > where boot timeout.

Last night's test on 66f4beaa6c1d worked fine. So I guess this has now
been fixed.
Thanks.


-- 
Regards
Sudip
