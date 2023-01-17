Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 97C0766E632
	for <lists+dri-devel@lfdr.de>; Tue, 17 Jan 2023 19:41:05 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7E2E210E5AB;
	Tue, 17 Jan 2023 18:41:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7C97B10E5AB
 for <dri-devel@lists.freedesktop.org>; Tue, 17 Jan 2023 18:41:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1673980859;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=iFiAegt8WNgL5MZXxVPS9mQqy9Ss59WQtK/8IB6U8eA=;
 b=CPh7ECQXMg1FIUIGAXLI8fuFQtQEmsmJE1pjZdGiTevBXEWb7VxRD0lYt1n9iiSR3Krm+a
 i6fvMqw5fQTPvhd0EfW28EAyEOIYwYkqQSDgC/Z0ZW8FxvihB16dEhDPzS9+gxCjHBteE3
 IPnkLrlO0gZ91xz72ba1OVC3mII7rzg=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-260-lxBEaWcGM4C8NbHUfeyPBA-1; Tue, 17 Jan 2023 13:40:57 -0500
X-MC-Unique: lxBEaWcGM4C8NbHUfeyPBA-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
 [10.11.54.6])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id B21F2811E6E;
 Tue, 17 Jan 2023 18:40:54 +0000 (UTC)
Received: from [10.18.17.153] (dhcp-17-153.bos.redhat.com [10.18.17.153])
 by smtp.corp.redhat.com (Postfix) with ESMTP id CA68B2166B29;
 Tue, 17 Jan 2023 18:40:51 +0000 (UTC)
Message-ID: <0110b1d1-17c4-49a3-64c0-ad7d7b8cbd29@redhat.com>
Date: Tue, 17 Jan 2023 13:40:51 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.0
Subject: Re: [PATCH RFC v7 00/23] DEPT(Dependency Tracker)
Content-Language: en-US
To: Boqun Feng <boqun.feng@gmail.com>,
 Linus Torvalds <torvalds@linux-foundation.org>
References: <1673235231-30302-1-git-send-email-byungchul.park@lge.com>
 <CAHk-=whpkWbdeZE1zask8YPzVYevJU2xOXqOposBujxZsa2-tQ@mail.gmail.com>
 <Y8bmeffIQ3iXU3Ux@boqun-archlinux>
From: Waiman Long <longman@redhat.com>
In-Reply-To: <Y8bmeffIQ3iXU3Ux@boqun-archlinux>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.6
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
Cc: hamohammed.sa@gmail.com, jack@suse.cz, peterz@infradead.org,
 daniel.vetter@ffwll.ch, amir73il@gmail.com, david@fromorbit.com,
 dri-devel@lists.freedesktop.org, mhocko@kernel.org, linux-mm@kvack.org,
 linux-ide@vger.kernel.org, adilger.kernel@dilger.ca, chris.p.wilson@intel.com,
 joel@joelfernandes.org, 42.hyeyoo@gmail.com, cl@linux.com, will@kernel.org,
 duyuyang@gmail.com, sashal@kernel.org, paolo.valente@linaro.org,
 damien.lemoal@opensource.wdc.com, willy@infradead.org, hch@infradead.org,
 mingo@redhat.com, djwong@kernel.org, vdavydov.dev@gmail.com,
 rientjes@google.com, dennis@kernel.org, linux-ext4@vger.kernel.org,
 ngupta@vflare.org, johannes.berg@intel.com, dan.j.williams@intel.com,
 josef@toxicpanda.com, rostedt@goodmis.org, gwan-gyeong.mun@intel.com,
 Byungchul Park <byungchul.park@lge.com>, linux-fsdevel@vger.kernel.org,
 jglisse@redhat.com, viro@zeniv.linux.org.uk, tglx@linutronix.de,
 vbabka@suse.cz, melissa.srw@gmail.com, linux-block@vger.kernel.org,
 sj@kernel.org, tytso@mit.edu, rodrigosiqueiramelo@gmail.com,
 kernel-team@lge.com, gregkh@linuxfoundation.org, jlayton@kernel.org,
 linux-kernel@vger.kernel.org, penberg@kernel.org, minchan@kernel.org,
 hannes@cmpxchg.org, tj@kernel.org, akpm@linux-foundation.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 1/17/23 13:18, Boqun Feng wrote:
> [Cc Waiman]
>
> On Mon, Jan 16, 2023 at 10:00:52AM -0800, Linus Torvalds wrote:
>> [ Back from travel, so trying to make sense of this series.. ]
>>
>> On Sun, Jan 8, 2023 at 7:33 PM Byungchul Park <byungchul.park@lge.com> wrote:
>>> I've been developing a tool for detecting deadlock possibilities by
>>> tracking wait/event rather than lock(?) acquisition order to try to
>>> cover all synchonization machanisms. It's done on v6.2-rc2.
>> Ugh. I hate how this adds random patterns like
>>
>>          if (timeout == MAX_SCHEDULE_TIMEOUT)
>>                  sdt_might_sleep_strong(NULL);
>>          else
>>                  sdt_might_sleep_strong_timeout(NULL);
>>     ...
>>          sdt_might_sleep_finish();
>>
>> to various places, it seems so very odd and unmaintainable.
>>
>> I also recall this giving a fair amount of false positives, are they all fixed?
>>
>  From the following part in the cover letter, I guess the answer is no?
>
> 	...
>          6. Multiple reports are allowed.
>          7. Deduplication control on multiple reports.
>          8. Withstand false positives thanks to 6.
> 	...
>
> seems to me that the logic is since DEPT allows multiple reports so that
> false positives are fitlerable by users?
>
>> Anyway, I'd really like the lockdep people to comment and be involved.
> I never get Cced, so I'm unware of this for a long time...
>
> A few comments after a quick look:
>
> *	Looks like the DEPT dependency graph doesn't handle the
> 	fair/unfair readers as lockdep current does. Which bring the
> 	next question.
>
> *	Can DEPT pass all the selftests of lockdep in
> 	lib/locking-selftests.c?
>
> *	Instead of introducing a brand new detector/dependency tracker,
> 	could we first improve the lockdep's dependency tracker? I think
> 	Byungchul also agrees that DEPT and lockdep should share the
> 	same dependency tracker and the benefit of improving the
> 	existing one is that we can always use the self test to catch
> 	any regression. Thoughts?
>
> Actually the above sugguest is just to revert revert cross-release
> without exposing any annotation, which I think is more practical to
> review and test.
>
> I'd sugguest we 1) first improve the lockdep dependency tracker with
> wait/event in mind and then 2) introduce wait related annotation so that
> users can use, and then 3) look for practical ways to resolve false
> positives/multi reports with the help of users, if all goes well,
> 4) make it all operation annotated.

I agree with your suggestions. In fact, the lockdep code itself is one 
of major overheads when running a debug kernel. If we have another set 
of parallel dependency tracker, we may slow down a debug kernel even 
more. So I would rather prefer improving the existing lockdep code 
instead creating a completely new one.

I do agree that the lockdep code itself is now rather complex. A 
separate dependency tracker, however, may undergo similar transformation 
over time to become more and more complex due to the needs to meet 
different requirement and constraints.

Cheers,
Longman

