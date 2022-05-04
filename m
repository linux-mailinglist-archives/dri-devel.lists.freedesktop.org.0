Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8FD5E51ACAA
	for <lists+dri-devel@lfdr.de>; Wed,  4 May 2022 20:23:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3C45010E733;
	Wed,  4 May 2022 18:23:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x131.google.com (mail-lf1-x131.google.com
 [IPv6:2a00:1450:4864:20::131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3E98410E733
 for <dri-devel@lists.freedesktop.org>; Wed,  4 May 2022 18:23:40 +0000 (UTC)
Received: by mail-lf1-x131.google.com with SMTP id j4so3757420lfh.8
 for <dri-devel@lists.freedesktop.org>; Wed, 04 May 2022 11:23:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linux-foundation.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=azQ8sWCnz/WIz9gx757KP54kS0UJB42kEHdJ90hMQlI=;
 b=TGN9imabgriFl447VR+LtalCql2Ru1FM30YxNTrRXmNp2/aqSQe997eejilXBWN//u
 GLL7PEuW6j459zsXmON4fgRMpLVmy4AeFXc6ipyOPPq4NZahAq6TXZNADjmVrlQQdnt5
 DczkC/efB8FuKeTl9T9HqInWj7/2oPQ1dOleE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=azQ8sWCnz/WIz9gx757KP54kS0UJB42kEHdJ90hMQlI=;
 b=cgZKzUT4Lz33nptiL4Du21RVSRalzfxVcSDg5mxJVbp75E32CipPu/92LSWhVdpcfH
 SfO7A3EjwPAuVk6ksXyrP820yJ5ltW6aZkeQKdx+1QDttS/1ToVVS0fWEwUxkQKKCj/+
 fp1vlmd6Pf4433WdPNBrgzDnM0nujQzuFie+TVgA86tIpLV8oRR8oqOlj/iW6mJRveuE
 aCXIhRe8vOlJHfHOc/YXUKj+5G6rX9WcLRJMY010D8wjeJVVhQDD2JxOhh8RMaf3/V8k
 2b/VCrx/FKMAaVtZnZPCbzq/413ZOCx7amjPE3ipO2yX80lEdu8dMN0BcgwnGrt3MHek
 xQ/g==
X-Gm-Message-State: AOAM530+51W97glNlmZH+rLqC1AgLoNniclnDr1FKHRdmgLxX8I5fbfk
 +HqrlGzM5+fds3SzG9gIpbZEICnz42tw623Lcgo=
X-Google-Smtp-Source: ABdhPJw1eIXxAQOdVJNuZ7a00mGEBsMLGN1TXH4DFUnh7QoMjaDYi33eDGpSQRRYq+9SMhKJITPsSg==
X-Received: by 2002:a19:8c4a:0:b0:46b:abba:2409 with SMTP id
 i10-20020a198c4a000000b0046babba2409mr15208220lfj.88.1651688618312; 
 Wed, 04 May 2022 11:23:38 -0700 (PDT)
Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com.
 [209.85.167.44]) by smtp.gmail.com with ESMTPSA id
 v6-20020ac25926000000b0047255d210e1sm1271362lfi.16.2022.05.04.11.23.37
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 04 May 2022 11:23:38 -0700 (PDT)
Received: by mail-lf1-f44.google.com with SMTP id y32so3771306lfa.6
 for <dri-devel@lists.freedesktop.org>; Wed, 04 May 2022 11:23:37 -0700 (PDT)
X-Received: by 2002:a05:6512:b12:b0:44a:ba81:f874 with SMTP id
 w18-20020a0565120b1200b0044aba81f874mr15410699lfu.449.1651688238925; Wed, 04
 May 2022 11:17:18 -0700 (PDT)
MIME-Version: 1.0
References: <1651652269-15342-1-git-send-email-byungchul.park@lge.com>
In-Reply-To: <1651652269-15342-1-git-send-email-byungchul.park@lge.com>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Wed, 4 May 2022 11:17:02 -0700
X-Gmail-Original-Message-ID: <CAHk-=whnPePcffsNQM+YSHMGttLXvpf8LbBQ8P7HEdqFXaV7Lg@mail.gmail.com>
Message-ID: <CAHk-=whnPePcffsNQM+YSHMGttLXvpf8LbBQ8P7HEdqFXaV7Lg@mail.gmail.com>
Subject: Re: [PATCH RFC v6 00/21] DEPT(Dependency Tracker)
To: Byungchul Park <byungchul.park@lge.com>
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
Cc: hamohammed.sa@gmail.com, Jan Kara <jack@suse.cz>,
 Peter Zijlstra <peterz@infradead.org>, Daniel Vetter <daniel.vetter@ffwll.ch>,
 Amir Goldstein <amir73il@gmail.com>, Dave Chinner <david@fromorbit.com>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Chris Wilson <chris@chris-wilson.co.uk>,
 "J. Bruce Fields" <bfields@fieldses.org>, linux-ide@vger.kernel.org,
 Andreas Dilger <adilger.kernel@dilger.ca>,
 Joel Fernandes <joel@joelfernandes.org>, 42.hyeyoo@gmail.com,
 Christoph Lameter <cl@linux.com>, Will Deacon <will@kernel.org>,
 duyuyang@gmail.com, Sasha Levin <sashal@kernel.org>, paolo.valente@linaro.org,
 Damien Le Moal <damien.lemoal@opensource.wdc.com>,
 Matthew Wilcox <willy@infradead.org>, Christoph Hellwig <hch@infradead.org>,
 Dave Airlie <airlied@linux.ie>, Ingo Molnar <mingo@redhat.com>,
 "Darrick J. Wong" <djwong@kernel.org>,
 Vladimir Davydov <vdavydov.dev@gmail.com>,
 David Rientjes <rientjes@google.com>, Dennis Zhou <dennis@kernel.org>,
 Ext4 Developers List <linux-ext4@vger.kernel.org>,
 Linux-MM <linux-mm@kvack.org>, ngupta@vflare.org, johannes.berg@intel.com,
 jack@suse.com, Dan Williams <dan.j.williams@intel.com>,
 Josef Bacik <josef@toxicpanda.com>, Steven Rostedt <rostedt@goodmis.org>,
 linux-block <linux-block@vger.kernel.org>,
 linux-fsdevel <linux-fsdevel@vger.kernel.org>,
 Jerome Glisse <jglisse@redhat.com>, Al Viro <viro@zeniv.linux.org.uk>,
 Thomas Gleixner <tglx@linutronix.de>, Michal Hocko <mhocko@kernel.org>,
 Vlastimil Babka <vbabka@suse.cz>, melissa.srw@gmail.com, sj@kernel.org,
 Theodore Ts'o <tytso@mit.edu>, rodrigosiqueiramelo@gmail.com,
 kernel-team@lge.com, Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Jeff Layton <jlayton@kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Pekka Enberg <penberg@kernel.org>, Minchan Kim <minchan@kernel.org>,
 Johannes Weiner <hannes@cmpxchg.org>, Tejun Heo <tj@kernel.org>,
 Andrew Morton <akpm@linux-foundation.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, May 4, 2022 at 1:19 AM Byungchul Park <byungchul.park@lge.com> wrote:
>
> Hi Linus and folks,
>
> I've been developing a tool for detecting deadlock possibilities by
> tracking wait/event rather than lock(?) acquisition order to try to
> cover all synchonization machanisms.

So what is the actual status of reports these days?

Last time I looked at some reports, it gave a lot of false positives
due to mis-understanding prepare_to_sleep().

For this all to make sense, it would need to not have false positives
(or at least a very small number of them together with a way to sanely
get rid of them), and also have a track record of finding things that
lockdep doesn't.

Maybe such reports have been sent out with the current situation, and
I haven't seen them.

                 Linus
