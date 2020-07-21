Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C77FB22846A
	for <lists+dri-devel@lfdr.de>; Tue, 21 Jul 2020 18:01:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E654E6E429;
	Tue, 21 Jul 2020 16:00:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [207.211.31.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C08096E427
 for <dri-devel@lists.freedesktop.org>; Tue, 21 Jul 2020 16:00:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1595347254;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=P0UrEz/GvXR1ZZ5iVqJP3qWd7bx+Q5rlrTYnl3WPpZ0=;
 b=i8Qu/OYQZkaq1Irfx0chJjTxyFvUK0hIK32enmue9E2SVCq/O5k2JrNARdI/PTWxPxOmBk
 JOwnJiINoMEWI+1OEJa2oppSvlf7XuwnA3aXmaWht5w3rbTitzc7KD/LQIUojHAfT18L5M
 LL3+Sxodvt46qE5nDhzLHBGW/5ddrso=
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-367-1_1MCy8BNtOpSI2d1VRmvw-1; Tue, 21 Jul 2020 12:00:52 -0400
X-MC-Unique: 1_1MCy8BNtOpSI2d1VRmvw-1
Received: by mail-qk1-f200.google.com with SMTP id s127so1331810qkf.8
 for <dri-devel@lists.freedesktop.org>; Tue, 21 Jul 2020 09:00:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
 :references:organization:user-agent:mime-version
 :content-transfer-encoding;
 bh=P0UrEz/GvXR1ZZ5iVqJP3qWd7bx+Q5rlrTYnl3WPpZ0=;
 b=pBqWxUEcPpGoSgTkVsdY68J8r5pzj71K0krBvJputqJOueuz6HXqTrrXgcRry6j+Q+
 QcSE168omIWUR4O1NYSA+UXbVLjj2rU+rUTj8Mt0ISvy1nRUmf/qlPLa007hRp2/+SYf
 ZBCMw627b8KFfOcv7psC74rWlRqAXoyD/GbDeKnqjloMH5RqTXPSnPRmbFjX7wz9yZrw
 qeqYRmjf6vue8z0zzHrcc52ketTzg7qht7x8po1/UqVMqKCYhl9eevcBg25BxGzOpybf
 qvHC5aM1jr50a6IR4sR3nmvJ59QtXWMRgqwMGx/MkfwgFbt+qaUeGp9HXc0RpM18hHaz
 jQhQ==
X-Gm-Message-State: AOAM531fvDulKPHW2CcvGJcsmAp+Jg6L0BrGN2dUbK87v0L9XDC9Yf/2
 zRUOZIuKs7GWfOellBgPh2hpNPLcnhtdZ6d8/BL42gz7nQTRgxDkgNTEtPiAaoOr2g2/vnCozCo
 mXaq3yzjkwuYoKJ5s8N8E9QR369EL
X-Received: by 2002:ae9:ef43:: with SMTP id d64mr12959438qkg.326.1595347252175; 
 Tue, 21 Jul 2020 09:00:52 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyinIbVabueGMXoafK8P3B2fbzczvS1OyYVVhBZSVm9JqHV5WA7XsG5FVGYoO3j+1QlROT9pw==
X-Received: by 2002:ae9:ef43:: with SMTP id d64mr12959408qkg.326.1595347251931; 
 Tue, 21 Jul 2020 09:00:51 -0700 (PDT)
Received: from Ruby.lyude.net (pool-108-49-102-102.bstnma.fios.verizon.net.
 [108.49.102.102])
 by smtp.gmail.com with ESMTPSA id x29sm21891103qtv.80.2020.07.21.09.00.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 21 Jul 2020 09:00:51 -0700 (PDT)
Message-ID: <dc7a592219f58f9a5df7fa7135fa3fc87d9450f0.camel@redhat.com>
Subject: Re: nouveau regression with 5.7 caused by "PCI/PM: Assume ports
 without DLL Link Active train links in 100 ms"
From: Lyude Paul <lyude@redhat.com>
To: Mika Westerberg <mika.westerberg@linux.intel.com>
Date: Tue, 21 Jul 2020 12:00:49 -0400
In-Reply-To: <20200721152737.GS5180@lahna.fi.intel.com>
References: <CACO55tuA+XMgv=GREf178NzTLTHri4kyD5mJjKuDpKxExauvVg@mail.gmail.com>
 <20200716235440.GA675421@bjorn-Precision-5520>
 <CACO55tuVJHjEbsW657ToczN++_iehXA8pimPAkzc=NOnx4Ztnw@mail.gmail.com>
 <CACO55tso5SVipAR=AZfqhp6GGkKO9angv6f+nd61wvgAJtrOKg@mail.gmail.com>
 <20200721122247.GI5180@lahna.fi.intel.com>
 <f951fba07ca7fa2fdfd590cd5023d1b31f515fa2.camel@redhat.com>
 <20200721152737.GS5180@lahna.fi.intel.com>
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
Cc: Sasha Levin <sashal@kernel.org>, Karol Herbst <kherbst@redhat.com>,
 Patrick Volkerding <volkerdi@gmail.com>, Linux PCI <linux-pci@vger.kernel.org>,
 LKML <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Kai-Heng Feng <kai.heng.feng@canonical.com>,
 Bjorn Helgaas <helgaas@kernel.org>, Ben Skeggs <bskeggs@redhat.com>,
 nouveau <nouveau@lists.freedesktop.org>, Bjorn Helgaas <bhelgaas@google.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, 2020-07-21 at 18:27 +0300, Mika Westerberg wrote:
> On Tue, Jul 21, 2020 at 11:01:55AM -0400, Lyude Paul wrote:
> > Sure thing. Also, feel free to let me know if you'd like access to one of
> > the
> > systems we saw breaking with this patch - I'm fairly sure I've got one of
> > them
> > locally at my apartment and don't mind setting up AMT/KVM/SSH
> 
> Probably no need for remote access (thanks for the offer, though). I
> attached a test patch to the bug report:
> 
>   https://bugzilla.kernel.org/show_bug.cgi?id=208597
> 
> that tries to work it around (based on the ->pm_cap == 0). I wonder if
> anyone would have time to try it out.

Will give it a shot today and let you know the result

> 
-- 
Cheers,
	Lyude Paul (she/her)
	Software Engineer at Red Hat

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
