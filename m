Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B97D228824
	for <lists+dri-devel@lfdr.de>; Tue, 21 Jul 2020 20:24:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0284C6E427;
	Tue, 21 Jul 2020 18:24:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [205.139.110.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6884B6E422
 for <dri-devel@lists.freedesktop.org>; Tue, 21 Jul 2020 18:24:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1595355864;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ealMEOrHFYO0kZ1pKFx9efUp2/FF6Eq+swSNcBoDaSA=;
 b=Y5gUTrSb7ROYKIDqYBCitJ3ygTc4RhrNj/HU9qtGrfpR4n4/PNehZq560WlD/7xPaGuM1K
 DLyo60JjxtFlqbJHlEW610cDeCUgWMc0OhS7BpzAkPDRSAeTzN1kbhUl0Ls+Yup1WfFbdb
 8DFAdLP9Rj4ukA0z1Pq/uLySqxdCEkY=
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com
 [209.85.160.200]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-14-rcY55pqPMTWnsgECDYO8RQ-1; Tue, 21 Jul 2020 14:24:22 -0400
X-MC-Unique: rcY55pqPMTWnsgECDYO8RQ-1
Received: by mail-qt1-f200.google.com with SMTP id t36so14854480qtc.16
 for <dri-devel@lists.freedesktop.org>; Tue, 21 Jul 2020 11:24:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
 :references:organization:user-agent:mime-version
 :content-transfer-encoding;
 bh=ealMEOrHFYO0kZ1pKFx9efUp2/FF6Eq+swSNcBoDaSA=;
 b=HZYYbkps5CFKKozswOwlZmHkEmIJwZZp2XOnDWQMMX9UO++Ue3pKQ4qdp6VTwQUkre
 x8BfTgGMHULSaM6htL08ZyTlcm5ZrIhHrmnwuEoZGtRWgKdIeYYgUOXWek2u6o3Sa1gG
 xsmaOipifSxZ9abnPlRD+6CssXlMo0AIFTAw/ziWNXpyy+GQuodulnV0JYJf8GGNi3X8
 Qt598fhXdOCYJLmkeSqap2Ao4hE08UyynsAmwvPGpsq4e13uwXR/v5uvbFFOuw7jr4Ka
 T6/fSaDIM6u6qZLuQ8RakP/YgyiAYSFqtqHgnOzfJzv62l2r50a2O0s04U8Tvgo6ZtXx
 rKRw==
X-Gm-Message-State: AOAM530G4M8NhUbcOCXOBVQCg5Vyf7MIaL5PxgkWO8yuDkv6onheV4sf
 Po2lJynStX1vyWD6yGxnmQTdXKTKg1doSHCH8M4OTQxJy3RKRQ5J8HWifOQxRsU/JNIqjKwNd8I
 ylUas6KOQs1aRmacj0ylRs3SqsIob
X-Received: by 2002:ac8:c7:: with SMTP id d7mr30400197qtg.235.1595355861660;
 Tue, 21 Jul 2020 11:24:21 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJw5OPDtOL+vQse+EIZ+qb5SVhRfGv2p/Vv3U6BZWjtbTj7sJmsbB+3Na09bYDi+UjZ28Uz31A==
X-Received: by 2002:ac8:c7:: with SMTP id d7mr30400169qtg.235.1595355861423;
 Tue, 21 Jul 2020 11:24:21 -0700 (PDT)
Received: from Ruby.lyude.net (pool-108-49-102-102.bstnma.fios.verizon.net.
 [108.49.102.102])
 by smtp.gmail.com with ESMTPSA id x12sm510481qta.67.2020.07.21.11.24.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 21 Jul 2020 11:24:20 -0700 (PDT)
Message-ID: <a80a591ce61b632503c9ed52adc7c40faad8b068.camel@redhat.com>
Subject: Re: nouveau regression with 5.7 caused by "PCI/PM: Assume ports
 without DLL Link Active train links in 100 ms"
From: Lyude Paul <lyude@redhat.com>
To: Mika Westerberg <mika.westerberg@linux.intel.com>
Date: Tue, 21 Jul 2020 14:24:19 -0400
In-Reply-To: <dc7a592219f58f9a5df7fa7135fa3fc87d9450f0.camel@redhat.com>
References: <CACO55tuA+XMgv=GREf178NzTLTHri4kyD5mJjKuDpKxExauvVg@mail.gmail.com>
 <20200716235440.GA675421@bjorn-Precision-5520>
 <CACO55tuVJHjEbsW657ToczN++_iehXA8pimPAkzc=NOnx4Ztnw@mail.gmail.com>
 <CACO55tso5SVipAR=AZfqhp6GGkKO9angv6f+nd61wvgAJtrOKg@mail.gmail.com>
 <20200721122247.GI5180@lahna.fi.intel.com>
 <f951fba07ca7fa2fdfd590cd5023d1b31f515fa2.camel@redhat.com>
 <20200721152737.GS5180@lahna.fi.intel.com>
 <dc7a592219f58f9a5df7fa7135fa3fc87d9450f0.camel@redhat.com>
Organization: Red Hat
User-Agent: Evolution 3.36.3 (3.36.3-1.fc32)
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=lyude@redhat.com
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

On Tue, 2020-07-21 at 12:00 -0400, Lyude Paul wrote:
> On Tue, 2020-07-21 at 18:27 +0300, Mika Westerberg wrote:
> > On Tue, Jul 21, 2020 at 11:01:55AM -0400, Lyude Paul wrote:
> > > Sure thing. Also, feel free to let me know if you'd like access to one
> > > of
> > > the
> > > systems we saw breaking with this patch - I'm fairly sure I've got one
> > > of
> > > them
> > > locally at my apartment and don't mind setting up AMT/KVM/SSH
> > 
> > Probably no need for remote access (thanks for the offer, though). I
> > attached a test patch to the bug report:
> > 
> >   https://bugzilla.kernel.org/show_bug.cgi?id=208597
> > 
> > that tries to work it around (based on the ->pm_cap == 0). I wonder if
> > anyone would have time to try it out.
> 
> Will give it a shot today and let you know the result

Ahh-actually, I thought the laptop I had locally could reproduce this bug but
that doesn't appear to be the case whoops. Karol Herbst still has access to a
machine that can test this though, so they'll likely get to trying the patch
today or tommorrow

> 
-- 
Cheers,
	Lyude Paul (she/her)
	Software Engineer at Red Hat

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
