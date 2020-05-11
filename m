Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C36C81CD34B
	for <lists+dri-devel@lfdr.de>; Mon, 11 May 2020 09:52:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 781306E110;
	Mon, 11 May 2020 07:52:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.126.133])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8337E6E110
 for <dri-devel@lists.freedesktop.org>; Mon, 11 May 2020 07:52:53 +0000 (UTC)
Received: from mail-qk1-f181.google.com ([209.85.222.181]) by
 mrelayeu.kundenserver.de (mreue009 [212.227.15.129]) with ESMTPSA (Nemesis)
 id 1MNbtD-1jjQHw0zpD-00P48i for <dri-devel@lists.freedesktop.org>; Mon, 11
 May 2020 09:52:51 +0200
Received: by mail-qk1-f181.google.com with SMTP id s9so7913975qkm.6
 for <dri-devel@lists.freedesktop.org>; Mon, 11 May 2020 00:52:49 -0700 (PDT)
X-Gm-Message-State: AGi0PuZsShXFXrYp/d4QMWqrjFkfbFUTphRipnAp6ETGddN7ePNhUGDY
 tOKOgmj8/MVLYdVv436p1snXkICP090ROAfTRd8=
X-Google-Smtp-Source: APiQypLiww9K2vQQyR9/gMZxUya12W1EmcQHsxoRkn4Cxm8H8qPnH1jzICBK99UvxZyleyeClRL49HPOukqw1fr6hCg=
X-Received: by 2002:ac8:2bce:: with SMTP id n14mr14712603qtn.18.1589183567291; 
 Mon, 11 May 2020 00:52:47 -0700 (PDT)
MIME-Version: 1.0
References: <20200508220150.649044-1-arnd@arndb.de>
 <20200511025337.GA1823106@iweiny-DESK2.sc.intel.com>
In-Reply-To: <20200511025337.GA1823106@iweiny-DESK2.sc.intel.com>
From: Arnd Bergmann <arnd@arndb.de>
Date: Mon, 11 May 2020 09:52:30 +0200
X-Gmail-Original-Message-ID: <CAK8P3a0EN=PrHEuDNr__kRkhsaYK0mM5yYa4qhceRSKfCC-MRA@mail.gmail.com>
Message-ID: <CAK8P3a0EN=PrHEuDNr__kRkhsaYK0mM5yYa4qhceRSKfCC-MRA@mail.gmail.com>
Subject: Re: [PATCH] drm: vmwgfx: include linux/highmem.h
To: Ira Weiny <ira.weiny@intel.com>
X-Provags-ID: V03:K1:tbxlceinlEUCtLlRTYeieF8Id3DRcx9MDJTG6sKzdB9oy9PicGW
 WJyLr+YZ0cLnCvJyv65qhJ5g8gavKYAlSTO85dEB4kssJpGACEO+Hoz7TdssQ9K1KAm+5Pd
 s5yhwG0OFObotJe04/kpwaQY3xfc11lNxQFYeX58eG4ms0ZmREdREIxs54LNRe6BpCQljkl
 Jdt4FnEF36BShuADDZU+Q==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:zRUzWgD4Is8=:6uG3V+xWaI2trM/LHqEgTZ
 SGzTlBR/Ue1mLg1OcC3khilm5+MhD6OXOM8k0iAJkxqx6kjnBVQebr3TTLRC7FhF3xMAAQAAI
 Vjys/k+qbXuh54/W+SVBkuugO6RGPeB3zwaEd6PMVUK+WVGksn2tUeC6w3NmRWBs+xkMnql4I
 uR4kwRjwv3r11N3kbelZPtt5i+lwK5gM4+XM1hDMG5RWVIdFOK5vdGFxSO86aV8rKYpXFKTSj
 SHAxfMpEwM5Qb/VsY4BFuCK6rNwXdnXAHMEEX9K+q9eRVoaL5sNK0O0cIefEMFSiXhakCMBUH
 CFlJf+bCfjDecfYf9An/yV5p5LLakJU1aS7VtLI7sd0evb1tL02chYoAtSkbz1pKVQnHUUhbf
 /VRYbRT/67uAKqOFuEaTsn8gtsgueDzpp8MmmbibFUHp66LV8YVV78mV/bXKPjbO9vGzdoAmn
 AlnEuEfhFddjqv2u6v+vpOkXPP2ei1iDNn3B0i44wCrmHC/nL570LZ9FgCkjfs4JLnXlIMNVj
 LopbUwRtxazwc42tfRb0xGDv+yRYApg0s15JzL+c28hhOrJgW7v0AKraEFfWbOyneGLSZad3e
 vNbAoa+JR8icmBU0pioscZlqgOp8a+R445d/bvlTfT1QeDkCTDpUBeZgl6cFFlzY5Y7p4SqAG
 CAQUvI3mS41GdVRQHKzjGZRf9ty0jM9Lwv65QtU35Ihyjv7VQeuoM4mnHp6JMgCRH3xH0xR0x
 CZw/enL+p+eI2qklRvtXFQtyld3j5Uu/GN4eGm0mSFvmwpsd65CxpKs3gSCVqg4VqXPag+L4q
 47IBL2p1Mxq/hJu0BS9NcLP9zjksYj/AOIAY38SOmXQtj8gU9s=
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
 Dave Hansen <dave.hansen@linux.intel.com>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 "James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>,
 Max Filippov <jcmvbkbc@gmail.com>, Huang Rui <ray.huang@amd.com>,
 Paul Mackerras <paulus@samba.org>, "H. Peter Anvin" <hpa@zytor.com>,
 Christoph Hellwig <hch@lst.de>, Stephen Rothwell <sfr@canb.auug.org.au>,
 Thomas Hellstrom <thellstrom@vmware.com>, Helge Deller <deller@gmx.de>,
 Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>,
 VMware Graphics <linux-graphics-maintainer@vmware.com>,
 Borislav Petkov <bp@alien8.de>, Al Viro <viro@zeniv.linux.org.uk>,
 Andy Lutomirski <luto@kernel.org>, Dan Williams <dan.j.williams@intel.com>,
 Chris Zankel <chris@zankel.net>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 Thomas Gleixner <tglx@linutronix.de>,
 Andrew Morton <akpm@linux-foundation.org>,
 "David S. Miller" <davem@davemloft.net>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, May 11, 2020 at 4:53 AM Ira Weiny <ira.weiny@intel.com> wrote:
>
> On Sat, May 09, 2020 at 12:01:31AM +0200, Arnd Bergmann wrote:
> > In order to call kmap_atomic() etc, we need to include linux/highmem.h:
> >
> > drivers/gpu/drm/vmwgfx/vmwgfx_blit.c: In function 'vmw_bo_cpu_blit_line':
> > drivers/gpu/drm/vmwgfx/vmwgfx_blit.c:377:4: error: implicit declaration of function 'kunmap_atomic'; did you mean 'in_atomic'? [-Werror=implicit-function-declaration]
> >   377 |    kunmap_atomic(d->src_addr);
> >       |    ^~~~~~~~~~~~~
> >       |    in_atomic
> > drivers/gpu/drm/vmwgfx/vmwgfx_blit.c:391:5: error: implicit declaration of function 'kmap_atomic_prot' [-Werror=implicit-function-declaration]
> >   391 |     kmap_atomic_prot(d->dst_pages[dst_page],
> >       |     ^~~~~~~~~~~~~~~~
> > drivers/gpu/drm/vmwgfx/vmwgfx_blit.c:390:16: warning: assignment to 'u8 *' {aka 'unsigned char *'} from 'int' makes pointer from integer without a cast [-Wint-conversion]
> >   390 |    d->dst_addr =
> >       |                ^
> > drivers/gpu/drm/vmwgfx/vmwgfx_blit.c:403:16: warning: assignment to 'u8 *' {aka 'unsigned char *'} from 'int' makes pointer from integer without a cast [-Wint-conversion]
> >   403 |    d->src_addr =
> >       |                ^
> >
> > Fixes: 46385a895322 ("drm: remove drm specific kmap_atomic code")
> > Signed-off-by: Arnd Bergmann <arnd@arndb.de>
>
> I'm curious about the config which failed...  Because this compiled for me.
> Regardless it was stupid of me to not include this.
>
> Thanks,
>
> Reviewed-by: Ira Weiny <ira.weiny@intel.com>

I do a lot of randconfig build tests and only one of them had this problem.

See https://pastebin.com/LmX0Jfbg for reference, I did not check further
which of the options caused this.

      Arnd
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
