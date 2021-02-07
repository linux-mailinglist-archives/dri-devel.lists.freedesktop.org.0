Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B064B3122F3
	for <lists+dri-devel@lfdr.de>; Sun,  7 Feb 2021 09:59:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2370A6E5A4;
	Sun,  7 Feb 2021 08:59:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from casper.infradead.org (casper.infradead.org
 [IPv6:2001:8b0:10b:1236::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 12BCE6E243
 for <dri-devel@lists.freedesktop.org>; Sun,  7 Feb 2021 02:41:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=N73MTwcssypfrmFlVJ2hO+B9Wsxa4vWw1VGEiG1ORVM=; b=oIoT2gnolHCgX42gEbM4LpAIDI
 QAjHn7JbZRV7px5l14OAo2mlgqqx+C/NwlEEyDWTY4W78rAFairPS3Atbm5dX483pt37lcZBRTe5a
 UOy7jL43EIpXSWiAhiHlsD8/lAnwDPENtSPJQDBEJSscWvv/evD4P6QwPneyQdAuVcPnFgUqKhMED
 An9uezcE+hBQX4vD0VmQokAZOwxzPkPUs+pcTPYVBrFXKRmFjbIuDw3Nktb+8grYN8bh/r245liS4
 Q5+gqqHSMwTzNO9brcyll3qA/2Y74vNwG5nNGYDgJ3f6xWyulO120yH9+zAqYvIUeI4avWFbt3EZ7
 zwrBQFCA==;
Received: from willy by casper.infradead.org with local (Exim 4.94 #2 (Red Hat
 Linux)) id 1l8Zzy-004Izk-K6; Sun, 07 Feb 2021 02:40:40 +0000
Date: Sun, 7 Feb 2021 02:40:30 +0000
From: Matthew Wilcox <willy@infradead.org>
To: Kalesh Singh <kaleshsingh@google.com>
Subject: Re: [PATCH v3 2/2] dmabuf: Add dmabuf inode number to /proc/*/fdinfo
Message-ID: <20210207024030.GK308988@casper.infradead.org>
References: <20210205022328.481524-1-kaleshsingh@google.com>
 <20210205022328.481524-2-kaleshsingh@google.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210205022328.481524-2-kaleshsingh@google.com>
X-Mailman-Approved-At: Sun, 07 Feb 2021 08:59:35 +0000
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
Cc: no To-header on input <>, Michal Hocko <mhocko@suse.com>,
 Anand K Mistry <amistry@google.com>, linux-doc@vger.kernel.org,
 NeilBrown <neilb@suse.de>, dri-devel@lists.freedesktop.org,
 Andrei Vagin <avagin@gmail.com>,
 Christian Brauner <christian.brauner@ubuntu.com>,
 Michel Lespinasse <walken@google.com>, Jonathan Corbet <corbet@lwn.net>,
 Mauro Carvalho Chehab <mchehab+huawei@kernel.org>, jeffv@google.com,
 kernel-team@android.com, Alexey Dobriyan <adobriyan@gmail.com>,
 linux-media@vger.kernel.org, keescook@chromium.org, jannh@google.com,
 linaro-mm-sig@lists.linaro.org, linux-fsdevel@vger.kernel.org,
 Bernd Edlinger <bernd.edlinger@hotmail.de>, surenb@google.com,
 Alexey Gladkov <gladkov.alexey@gmail.com>, linux-kernel@vger.kernel.org,
 minchan@kernel.org, Yafang Shao <laoar.shao@gmail.com>,
 "Eric W. Biederman" <ebiederm@xmission.com>, hridya@google.com,
 Andrew Morton <akpm@linux-foundation.org>,
 Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Feb 05, 2021 at 02:23:20AM +0000, Kalesh Singh wrote:
> +DMA Buffer files
> +~~~~~~~~~~~~~~~~
> +
> +::
> +
> +	pos:	0
> +	flags:	04002
> +	mnt_id:	9
> +	dmabuf_inode_no: 63107

inode_nr would be better than inode_no.
But even better would be to match stat(2) and just call it 'ino'.

> +	size:   32768
> +	count:  2
> +	exp_name:  system-heap
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
