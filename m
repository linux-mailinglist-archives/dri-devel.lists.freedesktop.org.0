Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E02FD30897E
	for <lists+dri-devel@lfdr.de>; Fri, 29 Jan 2021 15:18:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 117DE6EB47;
	Fri, 29 Jan 2021 14:18:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-40136.protonmail.ch (mail-40136.protonmail.ch
 [185.70.40.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1165F6EB47
 for <dri-devel@lists.freedesktop.org>; Fri, 29 Jan 2021 14:18:04 +0000 (UTC)
Date: Fri, 29 Jan 2021 14:17:53 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=emersion.fr;
 s=protonmail3; t=1611929881;
 bh=q6T79gzdER5fOfCvcAfgFdFtnjXGEC7F7SBPl13t0Hc=;
 h=Date:To:From:Cc:Reply-To:Subject:In-Reply-To:References:From;
 b=NCPl/K5g1hfp/MPGEipF2lZP+rg2QnyO06jMvaM/XcEzkvkBtgcPZDgbEGmsvqSoM
 TUrKh4eg6mq5vGqRqx9L1sV+TrJhmGK111aYHPAcEk4VOJk1pTjUDl+0rtZTJB6nit
 iSfCe36/ihdlQc9deR7fEVnQAp0ucsAGA67t5cZFkcU8xGCYdWui8OQCAM/ppiddfr
 Rr7SaevcoYVzkCkxlznFXE5iNMzM3gkIisebCqa+r1KsVlJGWJY18ZgEkg1tAHCTeU
 YjMwLu1matrBxdI+Z41FxziHNzd7U1MoYfbixonwFBEu38yUV/A5miexoAx7gn+t36
 CjjD+qSXdXcHw==
To: Pekka Paalanen <ppaalanen@gmail.com>
From: Simon Ser <contact@emersion.fr>
Subject: Re: [PATCH] procfs/dmabuf: Add /proc/<pid>/task/<tid>/dmabuf_fds
Message-ID: <wgUb8smQArgjbRFYMPYVDmukBT-_BrqG2M6XIOkWdBcW_x-m4ORnl3VOvH3J4wrsNGMoOXqMAro0UmkdVXFNso9PEiNCFGEeruibhWsmU34=@emersion.fr>
In-Reply-To: <20210129161334.788b8fd0@eldfell>
References: <20210126225138.1823266-1-kaleshsingh@google.com>
 <CAG48ez2tc_GSPYdgGqTRotUp6NqFoUKdoN_p978+BOLoD_Fdjw@mail.gmail.com>
 <YBFG/zBxgnapqLAK@dhcp22.suse.cz>
 <ea04b552-7345-b7d5-60fe-7a22515ea63a@amd.com>
 <20210128120130.50aa9a74@eldfell>
 <c95af15d-8ff4-aea0-fa1b-3157845deae1@amd.com>
 <20210129161334.788b8fd0@eldfell>
MIME-Version: 1.0
X-Spam-Status: No, score=-1.2 required=10.0 tests=ALL_TRUSTED,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF shortcircuit=no
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on
 mailout.protonmail.ch
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
Reply-To: Simon Ser <contact@emersion.fr>
Cc: Michal Hocko <mhocko@suse.com>,
 "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>,
 Szabolcs Nagy <szabolcs.nagy@arm.com>, dri-devel@lists.freedesktop.org,
 Andrei Vagin <avagin@gmail.com>, Kalesh Singh <kaleshsingh@google.com>,
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
 Alexey Gladkov <gladkov.alexey@gmail.com>,
 kernel list <linux-kernel@vger.kernel.org>, Minchan Kim <minchan@kernel.org>,
 Yafang Shao <laoar.shao@gmail.com>,
 "Eric W. Biederman" <ebiederm@xmission.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Hridya Valsaraju <hridya@google.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 Linux API <linux-api@vger.kernel.org>,
 =?utf-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Friday, January 29th, 2021 at 3:13 PM, Pekka Paalanen <ppaalanen@gmail.com> wrote:

> > Re-importing it adds quite a huge CPU overhead to both userspace as well
> > as the kernel.
>
> Perhaps, but so far it seems no-one has noticed the overhead, with Mesa
> at least.
>
> I happily stand corrected.

Note, all of this doesn't mean that compositors will stop keeping
DMA-BUF FDs around. They may want to keep them open for other purposes
like importing them into KMS or other EGL displays as needed.
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
