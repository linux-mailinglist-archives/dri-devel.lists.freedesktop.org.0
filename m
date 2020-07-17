Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 513C62243B2
	for <lists+dri-devel@lfdr.de>; Fri, 17 Jul 2020 21:04:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 659606E39B;
	Fri, 17 Jul 2020 19:04:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [207.211.31.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 884D96E39B
 for <dri-devel@lists.freedesktop.org>; Fri, 17 Jul 2020 19:04:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1595012656;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=VKQ3UPhST3OvzdKUW3dae3IGuD+EOft4yvMH2GzGai4=;
 b=DP9EFJPvOPlwsY2lYZsv0SYVVE/OZqr/tFhuYE9XdvsIrpvb6SOLpkALhIIuMW7CQXDEpe
 4Wpy6cHLFlebFlRF5aQYw232pQg4aabNnCnQ952IJvuCxGGDIpOq92unbv8TlcP+AzNHLz
 ictCV+bwqDZie+XHoLuTGQJu6+b4AOg=
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-341-FWB2HbHrPgmHhXEHvc47pw-1; Fri, 17 Jul 2020 15:04:12 -0400
X-MC-Unique: FWB2HbHrPgmHhXEHvc47pw-1
Received: by mail-qk1-f198.google.com with SMTP id p126so6640049qkf.15
 for <dri-devel@lists.freedesktop.org>; Fri, 17 Jul 2020 12:04:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:message-id:subject:from:reply-to:to:cc:date
 :in-reply-to:references:organization:user-agent:mime-version
 :content-transfer-encoding;
 bh=VKQ3UPhST3OvzdKUW3dae3IGuD+EOft4yvMH2GzGai4=;
 b=twj1CkmskOxeSBdVbTz6Nht5uMm2uPl2CI2bqftisR0LuwaUzHTeW0ieZU4Tr0BgN1
 lprwAOV2URXMBQr8nW1W3ecTTyH2e0MWB83GDaSAcHi0/yn4uwcf7MxGeUWHLgWF5OlK
 RgWsQ3bo9wzB4NccPfecTGAx8G6Tn6DBAtRfAyPNMCA7SdKS82Tzmq3ktAxMkybzoF58
 AIEyF7vZfjqC6aLZ1HE9Uy9RK3zpxfOBlOr9RkheuGTOBWN5uMZTV/9Oeok7JUXy0VvH
 aa9ZqGGLFcLHgT5esk4wIhzn6O+r6JasHdsHFDBt2HMvyLs9ZKlkNoAq+1fJUKTPemuP
 1UxQ==
X-Gm-Message-State: AOAM533ahxEof+1ipJP8umSWkfLSzj+Id6h4KkE1Xx4NVy3ywoyKBLK6
 RMiCYWHwh6CbsnEBqUuqs6l0fLUCazngD3myf7mRqcKTGL4hKSj2+l52zdBiQtdAcjIKS7SNwIK
 DXFLY/Ut7+VGrY8hRrouFiS13Vm+Y
X-Received: by 2002:a37:a046:: with SMTP id j67mr9892602qke.395.1595012652217; 
 Fri, 17 Jul 2020 12:04:12 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwgtOiKIUn5ao5bCnaTTskTcrkgF6EP4gHfCCcCRRv0vg7ItdvSMNS0FlNgUH04ZXSmho073g==
X-Received: by 2002:a37:a046:: with SMTP id j67mr9892576qke.395.1595012651933; 
 Fri, 17 Jul 2020 12:04:11 -0700 (PDT)
Received: from Whitewolf.lyude.net
 (pool-108-49-102-102.bstnma.fios.verizon.net. [108.49.102.102])
 by smtp.gmail.com with ESMTPSA id e9sm11311764qtq.70.2020.07.17.12.04.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 17 Jul 2020 12:04:11 -0700 (PDT)
Message-ID: <ec6623032131fc3e656713b8ec644cdff89a8066.camel@redhat.com>
Subject: Re: nouveau regression with 5.7 caused by "PCI/PM: Assume ports
 without DLL Link Active train links in 100 ms"
From: Lyude Paul <lyude@redhat.com>
To: Bjorn Helgaas <helgaas@kernel.org>, Karol Herbst <kherbst@redhat.com>
Date: Fri, 17 Jul 2020 15:04:10 -0400
In-Reply-To: <20200716235440.GA675421@bjorn-Precision-5520>
References: <20200716235440.GA675421@bjorn-Precision-5520>
Organization: Red Hat
User-Agent: Evolution 3.36.3 (3.36.3-1.fc32)
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
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
Reply-To: lyude@redhat.com
Cc: Sasha Levin <sashal@kernel.org>, Patrick Volkerding <volkerdi@gmail.com>,
 Linux PCI <linux-pci@vger.kernel.org>, linux-kernel@vger.kernel.org,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Kai-Heng Feng <kai.heng.feng@canonical.com>, Ben Skeggs <bskeggs@redhat.com>,
 nouveau <nouveau@lists.freedesktop.org>, Bjorn Helgaas <bhelgaas@google.com>,
 Mika Westerberg <mika.westerberg@linux.intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, 2020-07-16 at 18:54 -0500, Bjorn Helgaas wrote:
> [+cc Sasha -- stable kernel regression]
> [+cc Patrick, Kai-Heng, LKML]
> 
> On Fri, Jul 17, 2020 at 12:10:39AM +0200, Karol Herbst wrote:
> > On Tue, Jul 7, 2020 at 9:30 PM Karol Herbst <kherbst@redhat.com> wrote:
> > > Hi everybody,
> > > 
> > > with the mentioned commit Nouveau isn't able to load firmware onto the
> > > GPU on one of my systems here. Even though the issue doesn't always
> > > happen I am quite confident this is the commit breaking it.
> > > 
> > > I am still digging into the issue and trying to figure out what
> > > exactly breaks, but it shows up in different ways. Either we are not
> > > able to boot the engines on the GPU or the GPU becomes unresponsive.
> > > Btw, this is also a system where our runtime power management issue
> > > shows up, so maybe there is indeed something funky with the bridge
> > > controller.
> > > 
> > > Just pinging you in case you have an idea on how this could break Nouveau
> > > 
> > > most of the times it shows up like this:
> > > nouveau 0000:01:00.0: acr: AHESASC binary failed
> > > 
> > > Sometimes it works at boot and fails at runtime resuming with random
> > > faults. So I will be investigating a bit more, but yeah... I am super
> > > sure the commit triggered this issue, no idea if it actually causes
> > > it.
> > 
> > so yeah.. I reverted that locally and never ran into issues again.
> > Still valid on latest 5.7. So can we get this reverted or properly
> > fixed? This breaks runtime pm for us on at least some hardware.
> 
> Yeah, that stinks.  We had another similar report from Patrick:
> 
>   
> https://lore.kernel.org/r/CAErSpo5sTeK_my1dEhWp7aHD0xOp87+oHYWkTjbL7ALgDbXo-Q@mail.gmail.com
> 
> Apparently the problem is ec411e02b7a2 ("PCI/PM: Assume ports without
> DLL Link Active train links in 100 ms"), which Patrick found was
> backported to v5.4.49 as 828b192c57e8, and you found was backported to
> v5.7.6 as afaff825e3a4.
> 
> Oddly, Patrick reported that v5.7.7 worked correctly, even though it
> still contains afaff825e3a4.
> 
> I guess in the absence of any other clues we'll have to revert it.
> I hate to do that because that means we'll have slow resume of
> Thunderbolt-connected devices again, but that's better than having
> GPUs completely broken.
> 
> Could you and Patrick open bugzilla.kernel.org reports, attach dmesg
> logs and "sudo lspci -vv" output, and add the URLs to Kai-Heng's
> original report at https://bugzilla.kernel.org/show_bug.cgi?id=206837
> and to this thread?
> 
> There must be a way to fix the slow resume problem without breaking
> the GPUs.

Isn't it possible to tell whether a PCI device is connected through thunderbolt
or not? We could probably get away with just defaulting to 100ms for thunderbolt
devices without DLL Link Active specified, and then default to the old delay
value for non-thunderbolt devices.

> 
> Bjorn
> 

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
