Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D45902C3AAC
	for <lists+dri-devel@lfdr.de>; Wed, 25 Nov 2020 09:13:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 702556E868;
	Wed, 25 Nov 2020 08:13:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-x743.google.com (mail-qk1-x743.google.com
 [IPv6:2607:f8b0:4864:20::743])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1E9F96E5CA;
 Tue, 24 Nov 2020 23:46:35 +0000 (UTC)
Received: by mail-qk1-x743.google.com with SMTP id q5so1122895qkc.12;
 Tue, 24 Nov 2020 15:46:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=H+rGPaoJ9R3rr7zK4cuxMwlBlLpdlGUAwlQnvIZjZd8=;
 b=rGjC6KnGzC9NIfLo6IfoTM7C5TiZmv4q08vYNRt8cewMWpFhbX886WW47/gIiopas/
 e2jKhT73QJs/dRAIbILcJdQSFnVW9dal1rOBoIKd0ECBe+nqcukIgJrBRfX2wbZlPbrR
 27L+0GE9CXpbAta7TZEIdoDweQHp+sEvmypYMH9hyutdrnRkkklGbspFfFiZY+HYfDHj
 jsH/8tjPy+0JiTdJWitSDoQxXZntWXoEWL0cWLR+fmdpM332GBoSCjfuWUHY88IWDiPh
 04ztpEPYlCjpB7IXy1yQhW/otwe7DgKcwtOpyIrk5XdAw3ZKiOAkll08YWpT8S+NhzMx
 e/Gw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=H+rGPaoJ9R3rr7zK4cuxMwlBlLpdlGUAwlQnvIZjZd8=;
 b=TYffeSRbe43ODMjM/MAQ0pbAsS+9hDYoSLz32LAh9hG9Op3JqBa3V4pOJtni0SuVPt
 1MOmhxEWNAl2DdpdTS1iSpV1xdxvr3lquvTXNSAWs8BGTg8jVHrqxdZ6mUecAQML3n+h
 D5moQqhzVSJKYgIEWxcvwzgzRA6oM4fjUey/Qk5neci8zl/wIUC82m/lTVf/53Su4I8x
 JVyXLaVJnMXye/bMOO4330yCxyj75ovqSQKGpel6mDvKd/71heGA84hO3I2tcypRLsgw
 GMYFMpIQwyS9rFMowtraYpvGAljs9KX23R+2aXs71p+popqfItFuIHM7b3G5ltxNAZyQ
 LTbw==
X-Gm-Message-State: AOAM53365CnpBUGHPLw4uGuAoAc1XyZOiK4R7TTOkmnCb2CpG4z9Ll6U
 qG0ptjliax1TesISt3SpA5sjgZvXgBp/gut6NLc=
X-Google-Smtp-Source: ABdhPJzOwu2wFsHHn8A1YNPfZeoFLdmnMgNDFogUYxSXdSyfkKR4RJ+IXZpEdbdh4p7RHhstmUROclNZOq0Hltp8jFg=
X-Received: by 2002:a5b:40e:: with SMTP id m14mr627984ybp.33.1606261594309;
 Tue, 24 Nov 2020 15:46:34 -0800 (PST)
MIME-Version: 1.0
References: <cover.1605896059.git.gustavoars@kernel.org>
 <20201120105344.4345c14e@kicinski-fedora-pc1c0hjn.dhcp.thefacebook.com>
 <202011201129.B13FDB3C@keescook>
 <20201120115142.292999b2@kicinski-fedora-pc1c0hjn.dhcp.thefacebook.com>
 <202011220816.8B6591A@keescook>
 <9b57fd4914b46f38d54087d75e072d6e947cb56d.camel@HansenPartnership.com>
 <CANiq72nZrHWTA4_Msg6MP9snTyenC6-eGfD27CyfNSu7QoVZbw@mail.gmail.com>
 <alpine.LNX.2.23.453.2011230938390.7@nippy.intranet>
 <CANiq72=z+tmuey9wj3Kk7wX5s0hTHpsQdLhAqcOVNrHon6xn5Q@mail.gmail.com>
 <alpine.LNX.2.23.453.2011241036520.7@nippy.intranet>
In-Reply-To: <alpine.LNX.2.23.453.2011241036520.7@nippy.intranet>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Wed, 25 Nov 2020 00:46:23 +0100
Message-ID: <CANiq72=Ybm2MHmOizo1xQ_QYGuvbthtnLbwCkr8AFb8PcfmuQw@mail.gmail.com>
Subject: Re: [PATCH 000/141] Fix fall-through warnings for Clang
To: Finn Thain <fthain@telegraphics.com.au>
X-Mailman-Approved-At: Wed, 25 Nov 2020 08:11:52 +0000
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
Cc: alsa-devel@alsa-project.org, linux-atm-general@lists.sourceforge.net,
 reiserfs-devel@vger.kernel.org, linux-iio@vger.kernel.org,
 linux-wireless <linux-wireless@vger.kernel.org>, linux-fbdev@vger.kernel.org,
 dri-devel@lists.freedesktop.org, "Gustavo A. R. Silva" <gustavoars@kernel.org>,
 James Bottomley <James.Bottomley@hansenpartnership.com>,
 linux-ide@vger.kernel.org, dm-devel@redhat.com, keyrings@vger.kernel.org,
 linux-mtd@lists.infradead.org, GR-everest-linux-l2@marvell.com,
 wcn36xx@lists.infradead.org, samba-technical@lists.samba.org,
 linux-i3c@lists.infradead.org, linux1394-devel@lists.sourceforge.net,
 linux-afs@lists.infradead.org, usb-storage@lists.one-eyed-alien.net,
 drbd-dev@lists.linbit.com, devel@driverdev.osuosl.org,
 linux-cifs@vger.kernel.org, rds-devel@oss.oracle.com,
 Nick Desaulniers <ndesaulniers@google.com>, linux-scsi@vger.kernel.org,
 Nathan Chancellor <natechancellor@gmail.com>, linux-rdma@vger.kernel.org,
 oss-drivers@netronome.com, bridge@lists.linux-foundation.org,
 linux-security-module@vger.kernel.org, amd-gfx@lists.freedesktop.org,
 linux-stm32@st-md-mailman.stormreply.com, cluster-devel@redhat.com,
 linux-acpi@vger.kernel.org, coreteam@netfilter.org,
 intel-wired-lan@lists.osuosl.org, linux-input <linux-input@vger.kernel.org>,
 Miguel Ojeda <ojeda@kernel.org>, Jakub Kicinski <kuba@kernel.org>,
 Ext4 Developers List <linux-ext4@vger.kernel.org>,
 Linux Media Mailing List <linux-media@vger.kernel.org>,
 Kees Cook <keescook@chromium.org>, selinux@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, intel-gfx@lists.freedesktop.org,
 linux-geode@lists.infradead.org, linux-can@vger.kernel.org,
 linux-block@vger.kernel.org, linux-gpio@vger.kernel.org,
 op-tee@lists.trustedfirmware.org, linux-mediatek@lists.infradead.org,
 xen-devel@lists.xenproject.org, nouveau@lists.freedesktop.org,
 linux-hams@vger.kernel.org, ceph-devel@vger.kernel.org,
 virtualization@lists.linux-foundation.org, target-devel@vger.kernel.org,
 Linux ARM <linux-arm-kernel@lists.infradead.org>, linux-hwmon@vger.kernel.org,
 linux-watchdog@vger.kernel.org, linux-nfs@vger.kernel.org,
 GR-Linux-NIC-Dev@marvell.com, tipc-discussion@lists.sourceforge.net,
 Linux-MM <linux-mm@kvack.org>, Network Development <netdev@vger.kernel.org>,
 linux-decnet-user@lists.sourceforge.net, linux-mmc@vger.kernel.org,
 linux-kernel <linux-kernel@vger.kernel.org>, linux-renesas-soc@vger.kernel.org,
 linux-sctp@vger.kernel.org, linux-usb@vger.kernel.org,
 netfilter-devel@vger.kernel.org,
 Linux Crypto Mailing List <linux-crypto@vger.kernel.org>,
 patches@opensource.cirrus.com, Joe Perches <joe@perches.com>,
 linux-integrity@vger.kernel.org,
 "maintainer:X86 ARCHITECTURE \(32-BIT AND 64-BIT\)" <x86@kernel.org>,
 linux-hardening@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Nov 24, 2020 at 1:58 AM Finn Thain <fthain@telegraphics.com.au> wrote:
>
> What I meant was that you've used pessimism as if it was fact.

"future mistakes that it might prevent" is neither pessimism nor states a fact.

> For example, "There is no way to guess what the effect would be if the
> compiler trained programmers to add a knee-jerk 'break' statement to avoid
> a warning".

It is only knee-jerk if you think you are infallible.

> Moreover, what I meant was that preventing programmer mistakes is a
> problem to be solved by development tools

This warning comes from a development tool -- the compiler.

> The idea that retro-fitting new
> language constructs onto mature code is somehow necessary to "prevent
> future mistakes" is entirely questionable.

The kernel is not a frozen codebase.

Further, "mature code vs. risk of change" arguments don't apply here
because the semantics of the program and binary output isn't changing.

> Sure. And if you put -Wimplicit-fallthrough into the Makefile and if that
> leads to well-intentioned patches that cause regressions, it is partly on
> you.

Again: adding a `fallthrough` does not change the program semantics.
If you are a maintainer and want to cross-check, compare the codegen.

> Have you ever considered the overall cost of the countless
> -Wpresume-incompetence flags?

Yeah: negative. On the other hand, the overall cost of the countless
-fI-am-infallible flags is very noticeable.

> Perhaps you pay the power bill for a build farm that produces logs that
> no-one reads? Perhaps you've run git bisect, knowing that the compiler
> messages are not interesting? Or compiled software in using a language
> that generates impenetrable messages? If so, here's a tip:
>
> # grep CFLAGS /etc/portage/make.conf
> CFLAGS="... -Wno-all -Wno-extra ..."
> CXXFLAGS="${CFLAGS}"
>
> Now allow me some pessimism: the hardware upgrades, gigawatt hours and
> wait time attributable to obligatory static analyses are a net loss.

If you really believe compiler warnings and static analysis are
useless and costly, I think there is not much point in continuing the
discussion.

> No, it's not for me to prove that such patches don't affect code
> generation. That's for the patch author and (unfortunately) for reviewers.

I was not asking you to prove it. I am stating that proving it is very easy.

Cheers,
Miguel
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
