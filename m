Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 365EF228303
	for <lists+dri-devel@lfdr.de>; Tue, 21 Jul 2020 17:02:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 019636E591;
	Tue, 21 Jul 2020 15:02:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [205.139.110.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 201BD6E591
 for <dri-devel@lists.freedesktop.org>; Tue, 21 Jul 2020 15:02:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1595343722;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=mSIJqWa6gC/bRdgGTlEg6I1iiFHrJPO8X4/n8B0VJ9k=;
 b=e6KVtLvTLOXVzTKe+GL8MqJOlvMHL1nKyOar7wWKtfQAn2mN9I+OqEqQuGtXgw5Ajrmxhr
 duV0AfRoIOptqB8u4x1vocgtm+LHYIveIB5e3qLQ1g+Z70HXcMUxAwzlkIfewMqetvsNO7
 XWn5SNOLKjc6B/Wlq2tRQDsw9RYuEls=
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-226-IxUp9Fp2OGG1QQxWD_TNKg-1; Tue, 21 Jul 2020 11:01:58 -0400
X-MC-Unique: IxUp9Fp2OGG1QQxWD_TNKg-1
Received: by mail-qk1-f200.google.com with SMTP id v16so13936545qka.18
 for <dri-devel@lists.freedesktop.org>; Tue, 21 Jul 2020 08:01:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
 :references:organization:user-agent:mime-version
 :content-transfer-encoding;
 bh=mSIJqWa6gC/bRdgGTlEg6I1iiFHrJPO8X4/n8B0VJ9k=;
 b=dRAr5qdQVgLBHsp3wCI7bWHX4i98myVLXbixkOIi3jQ0P8ZRdqZp+cXnzdiNwlFx/I
 lC3GuQ/+3saGAzGuvysOvuN5vKhHBaRWLsb6tC1u4zuJGttPgXJ8NkTNwsLWUDrMgzn2
 2Obl+llGycP+2Zsiq6Ty8G6W4LSI4wVmncVVw1zD/Ovs2Ot3LaicCy1JugVmRpBI22OC
 AMmSEFEHSVGFl/6JGkKOXs5ijhyq8oJjs4nFRSeNm2wTyZk1Jq+LLD9BF3MRF54RuFyZ
 tjI5bjZOeol2je/DM+BxR1bep4iBA/st1d1TSBoNmVJVixUL1tOawlQ99QIZXIrRQw7x
 Xuag==
X-Gm-Message-State: AOAM5326VCs4p/CGtVSW3vb05pCKCyHAA+xzNt5hUuOVL3zH3c3M6oxs
 y7F0E5/tG94lWaAIZD4xgxwMZE30eyhHyuGwEUIBTatjKTOMCI5783T9OAb1KfAuLO1EfJCuBW5
 2BRHOOJq10FGhAAXvvA7jMRqRtgxk
X-Received: by 2002:a37:a51:: with SMTP id 78mr16530735qkk.121.1595343717898; 
 Tue, 21 Jul 2020 08:01:57 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxJH5IxpTv0tqc1DLQ+iSUR4KYz9tNO0jJWsz8BvtZ9Y/QpYN7MJ20Jq9ljgK+EQmQWXFPL4g==
X-Received: by 2002:a37:a51:: with SMTP id 78mr16530715qkk.121.1595343717650; 
 Tue, 21 Jul 2020 08:01:57 -0700 (PDT)
Received: from Ruby.lyude.net (pool-108-49-102-102.bstnma.fios.verizon.net.
 [108.49.102.102])
 by smtp.gmail.com with ESMTPSA id f4sm22024521qtp.38.2020.07.21.08.01.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 21 Jul 2020 08:01:57 -0700 (PDT)
Message-ID: <f951fba07ca7fa2fdfd590cd5023d1b31f515fa2.camel@redhat.com>
Subject: Re: nouveau regression with 5.7 caused by "PCI/PM: Assume ports
 without DLL Link Active train links in 100 ms"
From: Lyude Paul <lyude@redhat.com>
To: Mika Westerberg <mika.westerberg@linux.intel.com>, Karol Herbst
 <kherbst@redhat.com>
Date: Tue, 21 Jul 2020 11:01:55 -0400
In-Reply-To: <20200721122247.GI5180@lahna.fi.intel.com>
References: <CACO55tuA+XMgv=GREf178NzTLTHri4kyD5mJjKuDpKxExauvVg@mail.gmail.com>
 <20200716235440.GA675421@bjorn-Precision-5520>
 <CACO55tuVJHjEbsW657ToczN++_iehXA8pimPAkzc=NOnx4Ztnw@mail.gmail.com>
 <CACO55tso5SVipAR=AZfqhp6GGkKO9angv6f+nd61wvgAJtrOKg@mail.gmail.com>
 <20200721122247.GI5180@lahna.fi.intel.com>
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
Cc: Sasha Levin <sashal@kernel.org>, Patrick Volkerding <volkerdi@gmail.com>,
 Linux PCI <linux-pci@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Kai-Heng Feng <kai.heng.feng@canonical.com>,
 Bjorn Helgaas <helgaas@kernel.org>, Ben Skeggs <bskeggs@redhat.com>,
 nouveau <nouveau@lists.freedesktop.org>, Bjorn Helgaas <bhelgaas@google.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Sure thing. Also, feel free to let me know if you'd like access to one of the
systems we saw breaking with this patch - I'm fairly sure I've got one of them
locally at my apartment and don't mind setting up AMT/KVM/SSH

On Tue, 2020-07-21 at 15:22 +0300, Mika Westerberg wrote:
> Hi,
> 
> [Sorry for the delay, I was on vacation]
> 
> On Fri, Jul 17, 2020 at 01:32:10PM +0200, Karol Herbst wrote:
> > Filed at https://bugzilla.kernel.org/show_bug.cgi?id=208597
> 
> Thanks for reporting.
> 
> I'll check your logs and try to figure if there is something we can do
> to make both nouveau and TBT working at the same time.
> 
> > oddly enough I wasn't able to reproduce it on my XPS 9560, will ping
> > once something breaks.
-- 
Cheers,
	Lyude Paul (she/her)
	Software Engineer at Red Hat

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
