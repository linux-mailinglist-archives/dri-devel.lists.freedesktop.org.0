Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D278172DFD
	for <lists+dri-devel@lfdr.de>; Fri, 28 Feb 2020 02:08:40 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 24BEE6EDBA;
	Fri, 28 Feb 2020 01:08:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [205.139.110.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B5B0F6EDAD
 for <dri-devel@lists.freedesktop.org>; Fri, 28 Feb 2020 01:08:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1582852110;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=lSctEBFAjWKteFBOZ/k8cyJsERG3/nGaUYCOpzKW0rk=;
 b=TPsI4JApjT+pVVvvW6qQ4gSseI3KG1QYqXOu6OItJ+yxlD8WCCdbVNn8C3MVem8fEx4/Eg
 N5aLvol6ljoPw8KXkrWAiKWoaTCBVaKm3Xbe79SY56mT2RrkBTt4tjvo/4toHx8JEFodU4
 meisfD7QJMlYe/Btc4ywCCWdVyMdIRo=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-436-BoaEJfi8NAuk_P60hqvunw-1; Thu, 27 Feb 2020 20:08:23 -0500
X-MC-Unique: BoaEJfi8NAuk_P60hqvunw-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 435C3100550E;
 Fri, 28 Feb 2020 01:08:21 +0000 (UTC)
Received: from tstellar.remote.csb (ovpn-117-123.phx2.redhat.com
 [10.3.117.123])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 259A7101D48A;
 Fri, 28 Feb 2020 01:08:20 +0000 (UTC)
Subject: Re: [Mesa-dev] gitlab.fd.o financial situation and impact on services
From: Tom Stellard <tstellar@redhat.com>
To: Daniel Vetter <daniel.vetter@ffwll.ch>,
 gstreamer-devel@lists.freedesktop.org, Xorg Members List <members@x.org>,
 Mesa Dev <mesa-dev@lists.freedesktop.org>,
 "X.Org development" <xorg-devel@lists.x.org>,
 wayland <wayland-devel@lists.freedesktop.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>,
 intel-gfx <intel-gfx@lists.freedesktop.org>
References: <CAKMK7uHHK2SsCfpmZwEUyTJJHsoccKoadoko3cEBOoYDFkmeAw@mail.gmail.com>
 <662b8d0c-d96b-13cd-d3a1-718550f84e4d@redhat.com>
Organization: Red Hat
Message-ID: <d008dba6-6b26-1dae-c4bb-790d526506e4@redhat.com>
Date: Thu, 27 Feb 2020 17:08:19 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.2.0
MIME-Version: 1.0
In-Reply-To: <662b8d0c-d96b-13cd-d3a1-718550f84e4d@redhat.com>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
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
Reply-To: tstellar@redhat.com
Cc: "X.Org Foundation Board" <board@foundation.x.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 02/27/2020 05:00 PM, Tom Stellard wrote:
> On 02/27/2020 01:27 PM, Daniel Vetter wrote:
>> Hi all,
>>
>> You might have read the short take in the X.org board meeting minutes
>> already, here's the long version.
>>
>> The good news: gitlab.fd.o has become very popular with our
>> communities, and is used extensively. This especially includes all the
>> CI integration. Modern development process and tooling, yay!
>>
>> The bad news: The cost in growth has also been tremendous, and it's
>> breaking our bank account. With reasonable estimates for continued
>> growth we're expecting hosting expenses totalling 75k USD this year,
>> and 90k USD next year. With the current sponsors we've set up we can't
>> sustain that. We estimate that hosting expenses for gitlab.fd.o
>> without any of the CI features enabled would total 30k USD, which is
>> within X.org's ability to support through various sponsorships, mostly
>> through XDC.
>>
> 
> Have you looked into applying for free credits from amazon:
> 
> https://aws.amazon.com/blogs/opensource/aws-promotional-credits-open-source-projects/
> 

Also fastly provides free CDN services to some Open Source projects:

https://www.fastly.com/open-source?utm_medium=social&utm_source=t.co&utm_campaign=FY17Q4_WebPage_OpenSource

It might also be worth looking into if the main costs are
coming from data transfers.

-Tom

> -Tom
> 
>> Note that X.org does no longer sponsor any CI runners themselves,
>> we've stopped that. The huge additional expenses are all just in
>> storing and serving build artifacts and images to outside CI runners
>> sponsored by various companies. A related topic is that with the
>> growth in fd.o it's becoming infeasible to maintain it all on
>> volunteer admin time. X.org is therefore also looking for admin
>> sponsorship, at least medium term.
>>
>> Assuming that we want cash flow reserves for one year of gitlab.fd.o
>> (without CI support) and a trimmed XDC and assuming no sponsor payment
>> meanwhile, we'd have to cut CI services somewhere between May and June
>> this year. The board is of course working on acquiring sponsors, but
>> filling a shortfall of this magnitude is neither easy nor quick work,
>> and we therefore decided to give an early warning as soon as possible.
>> Any help in finding sponsors for fd.o is very much appreciated.
>>
>> Thanks, Daniel
>>
> 
> _______________________________________________
> mesa-dev mailing list
> mesa-dev@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/mesa-dev
> 

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
