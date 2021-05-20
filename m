Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B79D738BA8C
	for <lists+dri-devel@lfdr.de>; Fri, 21 May 2021 01:49:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BC22C6F591;
	Thu, 20 May 2021 23:49:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E8DA46F58B
 for <dri-devel@lists.freedesktop.org>; Thu, 20 May 2021 23:49:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1621554569;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:mime-version:mime-version:
 content-type:content-type: content-transfer-encoding:content-transfer-encoding;
 bh=EUMR2mJInT32zhzw1a2j/85ySDjB992qqYrM0knAx5k=;
 b=BIYMn/JiEVcMhkeG4FF6JvaegkOXpdLjg0vkVuzwJ/0sJ/2oG//Y1cBXVnZyIP3L+J5Edr
 Vw+Nks3fH/pTn8ZhOkbuR8lQNHvnggqgbLUZaU14XyfJik7oEwU1uHmVyuKd2cbBU5QLYk
 7Y22lw9cbdmPA4k4+jZVtnPNxN0Kuco=
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-574-2FfEG-38MhuUeF_GGY_yrQ-1; Thu, 20 May 2021 19:49:24 -0400
X-MC-Unique: 2FfEG-38MhuUeF_GGY_yrQ-1
Received: by mail-qk1-f197.google.com with SMTP id
 a198-20020a3766cf0000b0290320e7711ebdso14066668qkc.22
 for <dri-devel@lists.freedesktop.org>; Thu, 20 May 2021 16:49:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:message-id:subject:from:reply-to:to:date
 :organization:user-agent:mime-version:content-transfer-encoding;
 bh=EUMR2mJInT32zhzw1a2j/85ySDjB992qqYrM0knAx5k=;
 b=R9WlhFNt9HVbSqx2yaP1P5LAEP8OWX2fhZ876Qqi4OTEVbJ5cVpffAW+gJgeeG7qFD
 hlJuZn07uEXI4vCwi0l53u28VP2fbuwNngsjZ4SLJMr9JeId2Ce1WWQ29RMqOnqRYL+R
 uVIERZf34IQd/S5CwEB3AW+tOpTC9qb2znp7DS1VaNpeYOhp+wX6J/6IIH/qOxuRa/oQ
 TsnIZXGA8T3/6rWcLUKX2hSSmwE0gnMeyJ86ojn+Xp2r3BN9EJw21iZ8fVuODlAKN4VV
 DTrz7k7EiKmR9TJMCdWuJzBxAYifLpeu2nclOU3c9S/T5YGUaLC4vOT5Di8gRV7mHU2Q
 ehOA==
X-Gm-Message-State: AOAM531IxmWphhCwDDvHS0a0aePnK+CM6rTfud+xhi5VxC+iZjVNLcWB
 /Pgy+9GBNlx22u3FItFagW443IlSIVrIk3r3REvYcrWf62cCslfeAGd2WNKUJANFxze6uu5syoo
 QHL22/gckBr0Qsnlpb4CS49WTF/eI
X-Received: by 2002:ac8:5710:: with SMTP id 16mr8111489qtw.180.1621554564341; 
 Thu, 20 May 2021 16:49:24 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyRqfEpNryBvdKpfQA6S10stkGig5mH2tTcYhMc5qIpLIC2d8UYkV29zxJRDOJul7LuS+DT8A==
X-Received: by 2002:ac8:5710:: with SMTP id 16mr8111468qtw.180.1621554564069; 
 Thu, 20 May 2021 16:49:24 -0700 (PDT)
Received: from Whitewolf.lyude.net
 (pool-108-49-102-102.bstnma.fios.verizon.net. [108.49.102.102])
 by smtp.gmail.com with ESMTPSA id n194sm1922877qka.66.2021.05.20.16.49.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 20 May 2021 16:49:23 -0700 (PDT)
Message-ID: <143980f8802d0f7de8b106037acce649e219f575.camel@redhat.com>
Subject: Freenode fallout
From: Lyude Paul <lyude@redhat.com>
To: members@x.org, "board@x.org" <board@x.org>, 
 "mesa-dev@lists.freedesktop.org" <mesa-dev@lists.freedesktop.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,  xorg-devel
 <xorg-devel@lists.x.org>
Date: Thu, 20 May 2021 19:49:22 -0400
Organization: Red Hat
User-Agent: Evolution 3.38.4 (3.38.4-1.fc33)
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=lyude@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi everyone! As I'm sure most of you heard by now, Freenode's staff has
had a falling out and it's been recommended by their staff that projects
consider the network a hostile entity. I won't go into the details here,
but those who are interested can read up here:

https://lwn.net/Articles/856543/

At the moment, the vast majority of IRC channels for various Freedesktop
and X.org projects currently reside on Freenode. While the X.org
foundation doesn't have any official policies on IRC hosting, because of
how frequently IRC is used by various projects in our community we on
the board decided to make a non-binding recommendation on an IRC network
we think would be good to move to. We're also looking at ways to provide
some resources to help channels move en masse. We hope this will enable
interested projects to migrate to the same new IRC network in order to
ensure they're all in the same place.

After considering Libera and OFTC as options, the board settled on
recommending OFTC. The primary reason for this is because OFTC is
associated with our parent foundation SPI, and has a long and well known
history of involvement with the open source community. As well, the
board believes OFTC's current Governance model is a lot more clear then
Libera's.

-- 
Sincerely,
   Lyude Paul (she/her)
   Software Engineer at Red Hat
   
Note: I deal with a lot of emails and have a lot of bugs on my plate. If you've
asked me a question, are waiting for a review/merge on a patch, etc. and I
haven't responded in a while, please feel free to send me another email to check
on my status. I don't bite!

