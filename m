Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6041F3106BE
	for <lists+dri-devel@lfdr.de>; Fri,  5 Feb 2021 09:33:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CDC8A6E3DF;
	Fri,  5 Feb 2021 08:33:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from merlin.infradead.org (merlin.infradead.org
 [IPv6:2001:8b0:10b:1231::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CB54D6F3A9
 for <dri-devel@lists.freedesktop.org>; Fri,  5 Feb 2021 02:36:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=merlin.20170209; h=Content-Transfer-Encoding:Content-Type:
 In-Reply-To:MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender
 :Reply-To:Content-ID:Content-Description;
 bh=ciHjs+jRrxK7UOBz+1nbSJbYdNtvt9f7zqlIzJkiFvs=; b=hnpcq40Tto7xSO201H6yoUJZQW
 7+k0d0rFKmVmR4ELTYvU2IVB/Jo/q0YQ81rwoDxA31OcpKEMQq4r3XNUjDJ8NkiFsecwwmLbqLB2S
 nNUjI2aLKw1aYyjpkFt5uLbCZ26ynXK0n17tqcq5T0DEvT859URB4Tgp5f63PBdQhyEqINdMxjVqi
 gjtzh660wsK2aprk5pKQ8XPMRwuhnNGxlivsyXAJfdlY9yxLNaEwJMic8bpcq5K6K+KlTGH+l8ChV
 vZ1+x0mMOmMRGJ+mbOTVFIFT8jm7O3SR4Z3h651a4pLq+EoO1+xjgakzxTOBul4M79Ii9m0H+30n2
 G89HxS0A==;
Received: from [2601:1c0:6280:3f0::aec2]
 by merlin.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l7qzN-0008VE-Go; Fri, 05 Feb 2021 02:36:53 +0000
Subject: Re: [PATCH v3 2/2] dmabuf: Add dmabuf inode number to /proc/*/fdinfo
To: Kalesh Singh <kaleshsingh@google.com>
References: <20210205022328.481524-1-kaleshsingh@google.com>
 <20210205022328.481524-2-kaleshsingh@google.com>
From: Randy Dunlap <rdunlap@infradead.org>
Message-ID: <b2d08c27-ae9b-16ed-3500-a4a724d563ef@infradead.org>
Date: Thu, 4 Feb 2021 18:36:43 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <20210205022328.481524-2-kaleshsingh@google.com>
Content-Language: en-US
X-Mailman-Approved-At: Fri, 05 Feb 2021 08:33:33 +0000
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
Cc: Michal Hocko <mhocko@suse.com>, Anand K Mistry <amistry@google.com>,
 linux-doc@vger.kernel.org, NeilBrown <neilb@suse.de>,
 dri-devel@lists.freedesktop.org, Andrei Vagin <avagin@gmail.com>,
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
 =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 2/4/21 6:23 PM, Kalesh Singh wrote:
> If a FD refers to a DMA buffer add the DMA buffer inode number to
> /proc/<pid>/fdinfo/<FD> and /proc/<pid>/task/<tid>/fdindo/<FD>.
> 
> The dmabuf inode number allows userspace to uniquely identify the buffer
> and avoids a dependency on /proc/<pid>/fd/* when accounting per-process
> DMA buffer sizes.
> 
> Signed-off-by: Kalesh Singh <kaleshsingh@google.com>
> ---
> Changes in v3:
>   - Add documentation in proc.rst

Hi,
Thanks for the doc update.

> Changes in v2:
>   - Update patch description
> 
>  Documentation/filesystems/proc.rst | 17 +++++++++++++++++
>  drivers/dma-buf/dma-buf.c          |  1 +
>  2 files changed, 18 insertions(+)
> 

Acked-by: Randy Dunlap <rdunlap@infradead.org> # for Documentation/filesystems/proc.rst


-- 
~Randy

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
