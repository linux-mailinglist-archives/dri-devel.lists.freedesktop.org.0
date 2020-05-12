Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 111CC1D0B92
	for <lists+dri-devel@lfdr.de>; Wed, 13 May 2020 11:10:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5099E6E9C6;
	Wed, 13 May 2020 09:09:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bombadil.infradead.org (bombadil.infradead.org
 [IPv6:2607:7c80:54:e::133])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E54936E133
 for <dri-devel@lists.freedesktop.org>; Tue, 12 May 2020 17:29:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20170209; h=Content-Transfer-Encoding:
 Content-Type:In-Reply-To:MIME-Version:Date:Message-ID:From:References:Cc:To:
 Subject:Sender:Reply-To:Content-ID:Content-Description;
 bh=hV4BDdW+iFVPmUkxPoN7ZR0971mJPrSTzPY2RD+WQVs=; b=EcH7WTMK6MGNVVbLI8orxTjYLd
 bOPL4TbPTU+kuyf05NAc+x0XosCEPquLD9Pb7P7srgyyZpAJXVkIgcrFtZUkMEPvqato+AiZwgTci
 yhuynginxhTo9OhW18ZWGkkF2kYr/BZATQLN0fk6mIl3qW3s7hYf0yXHJdlJpCzjAqp11pwlLYXQf
 SAuPzEocMTp4F93kOSGbmglOAya4nrq+uzNkwJMpQ8M1BEUlTIRzXTOk7lC2u5DX7ji/jb5C0GoNA
 r6ONsm5c4eoLsa4zKirmpcGjvfmtxFIaOB/8LFPkin4PcGglJFjtLZjJFfHnlPzi5xN7YSKHz0c7C
 ThRBaqXg==;
Received: from [2601:1c0:6280:3f0:897c:6038:c71d:ecac]
 by bombadil.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jYYiZ-0001PE-OP; Tue, 12 May 2020 17:29:23 +0000
Subject: Re: [PATCH] drm: vmwgfx: include linux/highmem.h
To: Stephen Rothwell <sfr@canb.auug.org.au>, Arnd Bergmann <arnd@arndb.de>
References: <20200508220150.649044-1-arnd@arndb.de>
 <20200509131434.27ddccb9@canb.auug.org.au>
From: Randy Dunlap <rdunlap@infradead.org>
Message-ID: <9c694077-1a65-3883-d082-017586098aaf@infradead.org>
Date: Tue, 12 May 2020 10:29:20 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <20200509131434.27ddccb9@canb.auug.org.au>
Content-Language: en-US
X-Mailman-Approved-At: Wed, 13 May 2020 09:09:29 +0000
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
Cc: David Airlie <airlied@linux.ie>, Daniel Vetter <daniel.vetter@ffwll.ch>,
 Dave Hansen <dave.hansen@linux.intel.com>, dri-devel@lists.freedesktop.org,
 "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>,
 Max Filippov <jcmvbkbc@gmail.com>, Huang Rui <ray.huang@amd.com>,
 Paul Mackerras <paulus@samba.org>, "H. Peter Anvin" <hpa@zytor.com>,
 Ira Weiny <ira.weiny@intel.com>, Christoph Hellwig <hch@lst.de>,
 Thomas Hellstrom <thellstrom@vmware.com>, Helge Deller <deller@gmx.de>,
 Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>,
 VMware Graphics <linux-graphics-maintainer@vmware.com>,
 Borislav Petkov <bp@alien8.de>, Al Viro <viro@zeniv.linux.org.uk>,
 Andy Lutomirski <luto@kernel.org>, Dan Williams <dan.j.williams@intel.com>,
 Chris Zankel <chris@zankel.net>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>, linux-kernel@vger.kernel.org,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
 Thomas Gleixner <tglx@linutronix.de>,
 Andrew Morton <akpm@linux-foundation.org>,
 "David S. Miller" <davem@davemloft.net>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 5/8/20 8:14 PM, Stephen Rothwell wrote:
> Hi Arnd,
> 
> On Sat,  9 May 2020 00:01:31 +0200 Arnd Bergmann <arnd@arndb.de> wrote:
>>
>> In order to call kmap_atomic() etc, we need to include linux/highmem.h:
>>
>> drivers/gpu/drm/vmwgfx/vmwgfx_blit.c: In function 'vmw_bo_cpu_blit_line':
>> drivers/gpu/drm/vmwgfx/vmwgfx_blit.c:377:4: error: implicit declaration of function 'kunmap_atomic'; did you mean 'in_atomic'? [-Werror=implicit-function-declaration]
>>   377 |    kunmap_atomic(d->src_addr);
>>       |    ^~~~~~~~~~~~~
>>       |    in_atomic
>> drivers/gpu/drm/vmwgfx/vmwgfx_blit.c:391:5: error: implicit declaration of function 'kmap_atomic_prot' [-Werror=implicit-function-declaration]
>>   391 |     kmap_atomic_prot(d->dst_pages[dst_page],
>>       |     ^~~~~~~~~~~~~~~~
>> drivers/gpu/drm/vmwgfx/vmwgfx_blit.c:390:16: warning: assignment to 'u8 *' {aka 'unsigned char *'} from 'int' makes pointer from integer without a cast [-Wint-conversion]
>>   390 |    d->dst_addr =
>>       |                ^
>> drivers/gpu/drm/vmwgfx/vmwgfx_blit.c:403:16: warning: assignment to 'u8 *' {aka 'unsigned char *'} from 'int' makes pointer from integer without a cast [-Wint-conversion]
>>   403 |    d->src_addr =
>>       |                ^
>>
>> Fixes: 46385a895322 ("drm: remove drm specific kmap_atomic code")
>> Signed-off-by: Arnd Bergmann <arnd@arndb.de>
>> ---
>>  drivers/gpu/drm/vmwgfx/vmwgfx_blit.c | 1 +
>>  1 file changed, 1 insertion(+)
>>
>> diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_blit.c b/drivers/gpu/drm/vmwgfx/vmwgfx_blit.c
>> index 94d456a1d1a9..1629427d5734 100644
>> --- a/drivers/gpu/drm/vmwgfx/vmwgfx_blit.c
>> +++ b/drivers/gpu/drm/vmwgfx/vmwgfx_blit.c
>> @@ -27,6 +27,7 @@
>>   **************************************************************************/
>>  
>>  #include "vmwgfx_drv.h"
>> +#include <linux/highmem.h>
>>  
>>  /*
>>   * Template that implements find_first_diff() for a generic
>> -- 
>> 2.26.0
>>
> 
> Added to linux-next for Monday (in case Andrew doesn't get around to it).
> 

Hi,

What happened with this patch?
I am seeing the same build problems in linux-next of 20200512.

Acked-by: Randy Dunlap <rdunlap@infradead.org> # build-tested


thanks.
-- 
~Randy

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
