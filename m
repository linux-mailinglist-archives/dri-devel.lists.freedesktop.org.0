Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A52B46F2BE
	for <lists+dri-devel@lfdr.de>; Thu,  9 Dec 2021 19:06:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 713C110E143;
	Thu,  9 Dec 2021 18:06:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x331.google.com (mail-ot1-x331.google.com
 [IPv6:2607:f8b0:4864:20::331])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8089810E143;
 Thu,  9 Dec 2021 18:06:43 +0000 (UTC)
Received: by mail-ot1-x331.google.com with SMTP id
 x3-20020a05683000c300b0057a5318c517so6996590oto.13; 
 Thu, 09 Dec 2021 10:06:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=GVu5cc9bTD6vf22XXmPr/TIBYXrD+gTouz5yZ1xCKFU=;
 b=Xf/yTmEHMqg3WBvvWp7JeHPcAbwglbi73Ndqgu4jkx6O/nW1EQQEfD+kVPcXCNgdc2
 ch0xRU5cTdQdnLf4b6np9zbhXJQMLcwo8SDbaq25SGReFw3ZSso69BYgmUywbrZ32d8T
 LaY073GbVX8vbg+DRLxJ5R6HOazKLyLuYq/w0vqoV2EIKI2sP3dhf751sjTXaW+x0C0D
 yrBm/37MR4VsFA/iHLb18Q1PY2CT+IV4QTMv54pTkhFNymH7ItVZssRtoBS8Xb2ZSw/H
 /A6mmCtjIuD7O+4S5LfDbrwRrwkcAaJc8cDs3RW3miczuhq80AgDirUVVhF8EKCIjfFj
 1jYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=GVu5cc9bTD6vf22XXmPr/TIBYXrD+gTouz5yZ1xCKFU=;
 b=3DDqY3XeaGh7Gd6JTVGEkHR6yOtgbRaQ6f7Xd2k3TrUNF+XAo5o3SdN3cOTxcE3Zah
 HXTxfk8CRK8F/sJP4vjso9DOtLRUiaklsjnI0xFR+pI3atmkmc+R046jWAvOPOOLFZ8r
 noTicNp1uh7YnypJoLerQ/TYEG5a5rgFLELA3n6C72AMD0WxDK+Knd2qU2K/BCzi+arp
 04F2vWt8aUwo9fCeRdFn5C9BEfnYXmzuahE499BgMT1hnnngdLtze4TsYxfWpMa0O9R8
 curDzEgIaGf5XOfCZ2IIfTpYxq6lM89gKZCnTPTKUhpBklMQh3opWbXcmxAkEf17o999
 3IoA==
X-Gm-Message-State: AOAM531vAO7B/dljcdV6TI7FnZa9XNaXAff14AEnPhMbMF+9M7fCmDBY
 8S4ASHVBJC3RaMsOf6B+8aZa77p3dLNYB0EXvsA=
X-Google-Smtp-Source: ABdhPJzODhY9yg2B/H0YvUtQi1UpyUrWst1qCagatbL8h3sVtVrWHhxikW3ibeZARthXGbUpDT25ejOrazxGsyBff2w=
X-Received: by 2002:a05:6830:1bcf:: with SMTP id
 v15mr6999009ota.200.1639073202803; 
 Thu, 09 Dec 2021 10:06:42 -0800 (PST)
MIME-Version: 1.0
References: <62aab616-53cb-ff9f-c5f3-169c547bd1ee@igalia.com>
 <CADnq5_O8x3_8f7GZ=tme55-QW+nqMJ2YoqvROjDPg2YZP2catQ@mail.gmail.com>
 <a1f4d263-b3d2-4ceb-8a89-948c8129500f@igalia.com>
In-Reply-To: <a1f4d263-b3d2-4ceb-8a89-948c8129500f@igalia.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Thu, 9 Dec 2021 13:06:31 -0500
Message-ID: <CADnq5_N9ptK4c86LO77YcrF5_M==hket+L7eYjsGCaKbORO=ug@mail.gmail.com>
Subject: Re: Reuse framebuffer after a kexec (amdgpu / efifb)
To: "Guilherme G. Piccoli" <gpiccoli@igalia.com>
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
Cc: "open list:EFIFB FRAMEBUFFER DRIVER" <linux-fbdev@vger.kernel.org>,
 xinhui pan <Xinhui.Pan@amd.com>, kasong@redhat.com,
 Baoquan He <bhe@redhat.com>,
 =?UTF-8?Q?Samuel_Iglesias_Gons=C3=A1lvez?= <siglesias@igalia.com>,
 kernel@gpiccoli.net, kexec@lists.infradead.org,
 amd-gfx list <amd-gfx@lists.freedesktop.org>, pjones@redhat.com,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>, "Deucher,
 Alexander" <alexander.deucher@amd.com>, Dave Young <dyoung@redhat.com>,
 Christian Koenig <christian.koenig@amd.com>, Vivek Goyal <vgoyal@redhat.com>,
 Gerd Hoffmann <kraxel@redhat.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Dec 9, 2021 at 1:00 PM Guilherme G. Piccoli <gpiccoli@igalia.com> wrote:
>
> On 09/12/2021 14:31, Alex Deucher wrote:
> > [...]
> > Once the driver takes over, none of the pre-driver state is retained.
> > You'll need to load the driver in the new kernel to initialize the
> > displays.  Note the efifb doesn't actually have the ability to program
> > any hardware, it just takes over the memory region that was used for
> > the pre-OS framebuffer and whatever display timing was set up by the
> > GOP driver prior to the OS loading.  Once that OS driver has loaded
> > the area is gone and the display configuration may have changed.
> >
>
> Hi Christian and Alex, thanks for the clarifications!
>
> Is there any way to save/retain this state before amdgpu takes over?

Not really in a generic way.  It's asic and platform specific.  In
addition most modern displays require link training to bring up the
display, so you can't just save and restore registers.

> Would simpledrm be able to program the device again, to a working state?

No.  You need an asic specific driver that knows how to program the
specific hardware.  It's also platform specific in that you need to
determine platform specific details such as the number and type of
display connectors and encoders that are present on the system.

>
> Finally, do you have any example of such a GOP driver (open source) so I
> can take a look? I tried to find something like that in Tianocore
> project, but didn't find anything that seemed useful for my issue.

The drivers are asic and platform specific.  E.g., the driver for
vangogh is different from renoir is different from skylake, etc.  The
display programming interfaces are asic specific.

Alex
