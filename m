Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 40F002C3A96
	for <lists+dri-devel@lfdr.de>; Wed, 25 Nov 2020 09:12:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0520B6E858;
	Wed, 25 Nov 2020 08:11:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-x741.google.com (mail-qk1-x741.google.com
 [IPv6:2607:f8b0:4864:20::741])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B749A6E7D5;
 Wed, 25 Nov 2020 00:32:29 +0000 (UTC)
Received: by mail-qk1-x741.google.com with SMTP id v143so1411537qkb.2;
 Tue, 24 Nov 2020 16:32:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=QqqubA90NyDjnD5SH+OxnZbso0TzlLiuZ5gzRUm0zsY=;
 b=DYdo15DH5n4eMCA51W2vXZfybVLPbTpwO6CR+j1CET94cx9FmUQEkAzz4OadVdmrht
 /5QscdfYh1sAKLvu6dkrheNjvEoR4Mdvvl3diWkBzFiGJNP9BCqxLhr4zTkKEaaVMxi5
 qUA6kNkUTJzI9KEPxIujLpbBVVOhJKSQSAf+FeTM6jY84RGcXl9jGks4AfD2ojo1GxQQ
 uEwHm9wuAxdOf70IRL+AXs8sujZOQd+kSEI1eU2QAsFia5W6QaIddZOITngYX9DSKM5R
 mNvBJUTqyzODtQONxErP8O8dRkCcVm25oDOfEuyrse782pSy0gFJjFFgzHOgMIi8mZem
 jSGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=QqqubA90NyDjnD5SH+OxnZbso0TzlLiuZ5gzRUm0zsY=;
 b=mgHk8SvrfadhBKRrt8chAXpftH47X8fBKCH/sQac1l8T2liKrqcwi7rTEy0PF9ALs6
 2mU95zbgB2K2mP4W0oyEMD74hTo7z8rm9Lw3cCYm4iRnVXfoXBdIelmFjtvdIXQo4R7f
 TQDBLYpvNp7ilmcLVPtbLxmUqm20boumJPQKxiP+R79Ygp7YP3a3qZJ/8YI1AptAlVy3
 TArFZAEsWcMBwC3Q+ay1JsV5+1nc+qP/FBw+HuFy1ykfSju++qdScmGFkvXwteITroUD
 9oTMmMfcpSt8bX0HAhorJia7ve1of+tXCGs4PX5GrAOnzxMQP+x+gyTruu1O4W0SKiLz
 nTtA==
X-Gm-Message-State: AOAM533QEr9F9n8DvAjjA+75hLWhD6IT4TTAUCeJNrPqv5FZn7xRDkSE
 O/DBNLvWi/53TfEvImbwvlbK7MGBDVu7iNIC6HQ=
X-Google-Smtp-Source: ABdhPJwwVKQFQuxzNO/2Mi/lJ3RUII3vPq9FIwhq+sZ6y3vyBbFPDKm/uCaEGwo9LU3j1fjBVCpYTO563lD14rGXSok=
X-Received: by 2002:a25:5f0f:: with SMTP id t15mr779915ybb.26.1606264348932;
 Tue, 24 Nov 2020 16:32:28 -0800 (PST)
MIME-Version: 1.0
References: <cover.1605896059.git.gustavoars@kernel.org>
 <20201120105344.4345c14e@kicinski-fedora-pc1c0hjn.dhcp.thefacebook.com>
 <202011201129.B13FDB3C@keescook>
 <20201120115142.292999b2@kicinski-fedora-pc1c0hjn.dhcp.thefacebook.com>
 <202011220816.8B6591A@keescook>
 <9b57fd4914b46f38d54087d75e072d6e947cb56d.camel@HansenPartnership.com>
 <CANiq72nZrHWTA4_Msg6MP9snTyenC6-eGfD27CyfNSu7QoVZbw@mail.gmail.com>
 <1c7d7fde126bc0acf825766de64bf2f9b888f216.camel@HansenPartnership.com>
 <CANiq72m22Jb5_+62NnwX8xds2iUdWDMAqD8PZw9cuxdHd95W0A@mail.gmail.com>
 <fc45750b6d0277c401015b7aa11e16cd15f32ab2.camel@HansenPartnership.com>
 <CANiq72k5tpDoDPmJ0ZWc1DGqm+81Gi-uEENAtvEs9v3SZcx6_Q@mail.gmail.com>
 <4993259d01a0064f8bb22770503490f9252f3659.camel@HansenPartnership.com>
In-Reply-To: <4993259d01a0064f8bb22770503490f9252f3659.camel@HansenPartnership.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Wed, 25 Nov 2020 01:32:17 +0100
Message-ID: <CANiq72kqO=bYMJnFS2uYRpgWATJ=uXxZuNUsTXT+3aLtrpnzvQ@mail.gmail.com>
Subject: Re: [PATCH 000/141] Fix fall-through warnings for Clang
To: James Bottomley <James.Bottomley@hansenpartnership.com>
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

On Mon, Nov 23, 2020 at 9:38 PM James Bottomley
<James.Bottomley@hansenpartnership.com> wrote:
>
> So you think a one line patch should take one minute to produce ... I
> really don't think that's grounded in reality.

No, I have not said that. Please don't put words in my mouth (again).

I have said *authoring* lines of *this* kind takes a minute per line.
Specifically: lines fixing the fallthrough warning mechanically and
repeatedly where the compiler tells you to, and doing so full-time for
a month.

For instance, take the following one from Gustavo. Are you really
saying it takes 12 minutes (your number) to write that `break;`?

diff --git a/drivers/gpu/drm/via/via_irq.c b/drivers/gpu/drm/via/via_irq.c
index 24cc445169e2..a3e0fb5b8671 100644
--- a/drivers/gpu/drm/via/via_irq.c
+++ b/drivers/gpu/drm/via/via_irq.c
@@ -364,6 +364,7 @@ int via_wait_irq(struct drm_device *dev, void
*data, struct drm_file *file_priv)
                irqwait->request.sequence +=
                        atomic_read(&cur_irq->irq_received);
                irqwait->request.type &= ~_DRM_VBLANK_RELATIVE;
+               break;
        case VIA_IRQ_ABSOLUTE:
                break;
        default:

>  I suppose a one line
> patch only takes a minute to merge with b4 if no-one reviews or tests
> it, but that's not really desirable.

I have not said that either. I said reviewing and merging those are
noise compared to any complex patch. Testing should be done by the
author comparing codegen.

> Part of what I'm trying to measure is the "and useful" bit because
> that's not a given.

It is useful since it makes intent clear. It also catches actual bugs,
which is even more valuable.

> Well, you know, subsystems are very different in terms of the amount of
> patches a maintainer has to process per release cycle of the kernel.
> If a maintainer is close to capacity, additional patches, however
> trivial, become a problem.  If a maintainer has spare cycles, trivial
> patches may look easy.

First of all, voluntary maintainers choose their own workload.
Furthermore, we already measure capacity in the `MAINTAINERS` file:
maintainers can state they can only handle a few patches. Finally, if
someone does not have time for a trivial patch, they are very unlikely
to have any time to review big ones.

> You seem to be saying that because you find it easy to merge trivial
> patches, everyone should.

Again, I have not said anything of the sort.

Cheers,
Miguel
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
