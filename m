Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 813B22BFDF3
	for <lists+dri-devel@lfdr.de>; Mon, 23 Nov 2020 02:07:16 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0789689B99;
	Mon, 23 Nov 2020 01:07:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-xb2f.google.com (mail-yb1-xb2f.google.com
 [IPv6:2607:f8b0:4864:20::b2f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7B80789BDB;
 Sun, 22 Nov 2020 20:36:10 +0000 (UTC)
Received: by mail-yb1-xb2f.google.com with SMTP id k65so14049276ybk.5;
 Sun, 22 Nov 2020 12:36:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=GG13N+h9bYKW0tA8PzZdEh0PqD5/qSPuWfMm4/MLZZE=;
 b=tX7AFJY3IoP+sTWjLWjwUeA0EiMqyjgmEMGUK52Uheybmur4GieXYHjq/4452d4+Q2
 I9IJc2W+KgP7eM5cLMrffBSaL1fq5VPLYq7a7Nqy7aqiJs+SWc7hYJy9lsWlIs20dLH2
 W28Iwaw2K1E1/9bR59jMmk/7Gq8vv14a82SqbrX8Cr26/AWqo5ergIUL6PfX6EI1DxrF
 H3tDAymEGdy6lnWgT39rAP3JOfP6UnfKa9FSSCeE7ggKiNT9+2hZ/9zdGiTOU+6HH+d5
 TmFQQAuEaRP9Z2Bh9bU0txdUhaZCbT+Ezs+qExtvq1zOJlrZzRYF6kJpZnKXIPWyTN/2
 bJqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=GG13N+h9bYKW0tA8PzZdEh0PqD5/qSPuWfMm4/MLZZE=;
 b=AG3Pn6+xVQ+B6AwjXFOIx0phlIOFEUuGSuy8QmPUEzo+sS0hc2d04CD14uk5agLtos
 YGIO0Y7p5w2DuYdYvhdUKfzQ8S1fTD1vtRtsGdVj6If9Ov5QCluq2a9Q+czNGDNWgtnj
 h0f7rUxYpOVrL/kiHexlX5nqx4puQd0crsXWrEQwIMunnbNn+d8Fe5qKrpHWEbyh4FyQ
 To6vsCbElCj8fowtTeHNRriPOXtmEFB6JJrkj2EIoygxUdsJ2YCvu/RGFb/Xx0j72n8e
 oydG929oxz9KtAjeQn642HMrWFe1G8lIsV/DqkcfYXnhde7TCuF2++btE4/6NmnDIjLW
 zKzw==
X-Gm-Message-State: AOAM530hZkYDHSHmoP7oOPCmhT8CNo9j5KceiQUemaCE/O4iA3jJ3DCE
 shs2E0DE1NdlvkuiK/3wuTfHbOd6jZUmG2RBE98=
X-Google-Smtp-Source: ABdhPJzCLkP7XKvI+ogPcqXNjFlbBz0ulixnxLa8L+LTJiC1sb757UHHSouM0vJ9LX/4+Ocy8hzM6Anb9s4lPpy7cZY=
X-Received: by 2002:a25:6986:: with SMTP id e128mr4956056ybc.93.1606077369721; 
 Sun, 22 Nov 2020 12:36:09 -0800 (PST)
MIME-Version: 1.0
References: <cover.1605896059.git.gustavoars@kernel.org>
 <20201120105344.4345c14e@kicinski-fedora-pc1c0hjn.dhcp.thefacebook.com>
 <202011201129.B13FDB3C@keescook>
 <20201120115142.292999b2@kicinski-fedora-pc1c0hjn.dhcp.thefacebook.com>
 <202011220816.8B6591A@keescook>
 <9b57fd4914b46f38d54087d75e072d6e947cb56d.camel@HansenPartnership.com>
In-Reply-To: <9b57fd4914b46f38d54087d75e072d6e947cb56d.camel@HansenPartnership.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Sun, 22 Nov 2020 21:35:58 +0100
Message-ID: <CANiq72nZrHWTA4_Msg6MP9snTyenC6-eGfD27CyfNSu7QoVZbw@mail.gmail.com>
Subject: Re: [PATCH 000/141] Fix fall-through warnings for Clang
To: James Bottomley <James.Bottomley@hansenpartnership.com>
X-Mailman-Approved-At: Mon, 23 Nov 2020 01:06:28 +0000
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
 Nathan Chancellor <natechancellor@gmail.com>, linux-ide@vger.kernel.org,
 dm-devel@redhat.com, keyrings@vger.kernel.org, linux-mtd@lists.infradead.org,
 GR-everest-linux-l2@marvell.com, wcn36xx@lists.infradead.org,
 samba-technical@lists.samba.org, linux-i3c@lists.infradead.org,
 linux1394-devel@lists.sourceforge.net, linux-afs@lists.infradead.org,
 usb-storage@lists.one-eyed-alien.net, drbd-dev@lists.linbit.com,
 devel@driverdev.osuosl.org, linux-cifs@vger.kernel.org,
 rds-devel@oss.oracle.com, Nick Desaulniers <ndesaulniers@google.com>,
 linux-scsi@vger.kernel.org, linux-rdma@vger.kernel.org,
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

On Sun, Nov 22, 2020 at 7:22 PM James Bottomley
<James.Bottomley@hansenpartnership.com> wrote:
>
> Well, it's a problem in an error leg, sure, but it's not a really
> compelling reason for a 141 patch series, is it?  All that fixing this
> error will do is get the driver to print "oh dear there's a problem"
> under four more conditions than it previously did.
>
> We've been at this for three years now with nearly a thousand patches,
> firstly marking all the fall throughs with /* fall through */ and later
> changing it to fallthrough.  At some point we do have to ask if the
> effort is commensurate with the protection afforded.  Please tell me
> our reward for all this effort isn't a single missing error print.

It isn't that much effort, isn't it? Plus we need to take into account
the future mistakes that it might prevent, too. So even if there were
zero problems found so far, it is still a positive change.

I would agree if these changes were high risk, though; but they are
almost trivial.

Cheers,
Miguel
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
