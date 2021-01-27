Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AD126307131
	for <lists+dri-devel@lfdr.de>; Thu, 28 Jan 2021 09:19:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C140C6E908;
	Thu, 28 Jan 2021 08:19:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DD30088E9B
 for <dri-devel@lists.freedesktop.org>; Wed, 27 Jan 2021 11:27:08 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
 t=1611746827; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=99b/OdLEJ9KjwcEyxGPTzdQW144ByhF4k4uosoq51RU=;
 b=diYSQP3S6Y8kEMtpEhcN88lTl4rBuzcA+btJgHGJDVBXzl72W3kHlLkTjxKO+qVGumgP8Z
 2M0wNjlEMq0IvjdTNK97lM2TffBqN1kVD/ly9x52X8I2b8F6AKHJLN41TUiidqhl9j+fHw
 rIMQHVxH352Xlqa6vEh93MvXViYxRz8=
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 5B698AC9B;
 Wed, 27 Jan 2021 11:27:07 +0000 (UTC)
Date: Wed, 27 Jan 2021 12:27:03 +0100
From: Michal Hocko <mhocko@suse.com>
To: Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>
Subject: Re: [PATCH] procfs/dmabuf: Add /proc/<pid>/task/<tid>/dmabuf_fds
Message-ID: <YBFOB9YJkWk0jK+f@dhcp22.suse.cz>
References: <20210126225138.1823266-1-kaleshsingh@google.com>
 <CAG48ez2tc_GSPYdgGqTRotUp6NqFoUKdoN_p978+BOLoD_Fdjw@mail.gmail.com>
 <YBFG/zBxgnapqLAK@dhcp22.suse.cz>
 <ea04b552-7345-b7d5-60fe-7a22515ea63a@amd.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <ea04b552-7345-b7d5-60fe-7a22515ea63a@amd.com>
X-Mailman-Approved-At: Thu, 28 Jan 2021 08:15:36 +0000
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
Cc: "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>,
 Szabolcs Nagy <szabolcs.nagy@arm.com>, dri-devel@lists.freedesktop.org,
 Yafang Shao <laoar.shao@gmail.com>, Kalesh Singh <kaleshsingh@google.com>,
 Hui Su <sh_def@163.com>, Michel Lespinasse <walken@google.com>,
 Jonathan Corbet <corbet@lwn.net>,
 Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
 Jeffrey Vander Stoep <jeffv@google.com>,
 Daniel Jordan <daniel.m.jordan@oracle.com>,
 kernel-team <kernel-team@android.com>, Alexey Dobriyan <adobriyan@gmail.com>,
 Linux Media Mailing List <linux-media@vger.kernel.org>,
 Kees Cook <keescook@chromium.org>, Jann Horn <jannh@google.com>,
 linaro-mm-sig@lists.linaro.org, linux-fsdevel <linux-fsdevel@vger.kernel.org>,
 Bernd Edlinger <bernd.edlinger@hotmail.de>,
 Suren Baghdasaryan <surenb@google.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 kernel list <linux-kernel@vger.kernel.org>, Minchan Kim <minchan@kernel.org>,
 Andrei Vagin <avagin@gmail.com>, "Eric W. Biederman" <ebiederm@xmission.com>,
 Alexey Gladkov <gladkov.alexey@gmail.com>,
 Hridya Valsaraju <hridya@google.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 Linux API <linux-api@vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed 27-01-21 12:01:55, Christian K=F6nig wrote:
[...]
> Some years ago I've proposed an change to improve the OOM killer to take
> into account how much memory is reference through special file descriptors
> like device drivers or DMA-buf.
> =

> But that never want anywhere because of concerns that this would add to m=
uch
> overhead to the OOM killer.

I have to admit I do not remember such a discussion. There were many on
the related topic, concerns were mostly about a proper accounting of
shared resources or locking required to gain the information. I do not
remember overhead as being the main concern as oom is a real cold path.

Anyway, if you want to revamp those patches then feel free to CC me and
we can discuss further. I do not want to hijack this thread by an
unrelated topic.
-- =

Michal Hocko
SUSE Labs
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
