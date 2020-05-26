Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DD3E81E1C39
	for <lists+dri-devel@lfdr.de>; Tue, 26 May 2020 09:27:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DC57A6E063;
	Tue, 26 May 2020 07:26:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bombadil.infradead.org (bombadil.infradead.org
 [IPv6:2607:7c80:54:e::133])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E091E89D2E
 for <dri-devel@lists.freedesktop.org>; Tue, 26 May 2020 04:31:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20170209; h=Content-Transfer-Encoding:
 Content-Type:In-Reply-To:MIME-Version:Date:Message-ID:From:References:Cc:To:
 Subject:Sender:Reply-To:Content-ID:Content-Description;
 bh=vXFd2CE8sJRaDeTwRK+vX0MCpo0iNPmCqKp/WJoBVcE=; b=HAbAmGeaZahNaWDrHfheZtlxGT
 a0D3TPLN4AotQgdwYTr67W4S6qtlyDqYUvVCWhMUhcy93Lw5ippMHmkSOB0ExT0Ff5FlnVvatDn74
 J/YDRIy/U77XNU2DC8KmUQOfbZlZQLu98BODyiUBmkopL9GIWun+bqE4PtaN2rXQOZOpWlE5v6ynU
 JCrxQ7d7pumskkEx01+2fxq38FLhZvoX1Uod6TaVPFqungpjpQWAh2PZycN0yxNiKT3BJuQNZuLcf
 7d7AoW3RXDA2kFRJ9fEnW6pVm02JK/2L1TxKR3mZ+FvKCzzAWvCg/QCys3qSOeYaxK+8vpdwXwgBd
 R/qXC6PA==;
Received: from [2601:1c0:6280:3f0::19c2]
 by bombadil.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jdRFU-00050m-0P; Tue, 26 May 2020 04:31:32 +0000
Subject: Re: mmotm 2020-05-25-16-56 uploaded (drm/nouveau)
To: Dave Airlie <airlied@gmail.com>
References: <20200525235712.VqEFGWfKu%akpm@linux-foundation.org>
 <21b52c28-3ace-cd13-d8ce-f38f2c6b2a96@infradead.org>
 <CAPM=9twdkW83Wd4G1pS7cP2nf3wOmYvKxUfKA9EUkOEf7BuvKg@mail.gmail.com>
From: Randy Dunlap <rdunlap@infradead.org>
Message-ID: <a5bc5156-6f50-7672-6c00-8f8394dc1416@infradead.org>
Date: Mon, 25 May 2020 21:31:29 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <CAPM=9twdkW83Wd4G1pS7cP2nf3wOmYvKxUfKA9EUkOEf7BuvKg@mail.gmail.com>
Content-Language: en-US
X-Mailman-Approved-At: Tue, 26 May 2020 07:26:30 +0000
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
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, mm-commits@vger.kernel.org,
 LKML <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>, Michal Hocko <mhocko@suse.cz>,
 Linux Memory Management List <linux-mm@kvack.org>,
 Mark Brown <broonie@kernel.org>, linux-next <linux-next@vger.kernel.org>,
 linux-fsdevel@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>,
 Ben Skeggs <bskeggs@redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 5/25/20 9:23 PM, Dave Airlie wrote:
> On Tue, 26 May 2020 at 13:50, Randy Dunlap <rdunlap@infradead.org> wrote:
>>
>> On 5/25/20 4:57 PM, Andrew Morton wrote:
>>> The mm-of-the-moment snapshot 2020-05-25-16-56 has been uploaded to
>>>
>>>    http://www.ozlabs.org/~akpm/mmotm/
>>>
>>> mmotm-readme.txt says
>>>
>>> README for mm-of-the-moment:
>>>
>>> http://www.ozlabs.org/~akpm/mmotm/
>>>
>>> This is a snapshot of my -mm patch queue.  Uploaded at random hopefully
>>> more than once a week.
>>>
>>> You will need quilt to apply these patches to the latest Linus release (5.x
>>> or 5.x-rcY).  The series file is in broken-out.tar.gz and is duplicated in
>>> http://ozlabs.org/~akpm/mmotm/series
>>>
>>> The file broken-out.tar.gz contains two datestamp files: .DATE and
>>> .DATE-yyyy-mm-dd-hh-mm-ss.  Both contain the string yyyy-mm-dd-hh-mm-ss,
>>> followed by the base kernel version against which this patch series is to
>>> be applied.
>>>
>>
>> on x86_64:
>>
>> when CONFIG_DRM_NOUVEAU=y and CONFIG_FB=m:
>>
>> ld: drivers/gpu/drm/nouveau/nouveau_drm.o: in function `nouveau_drm_probe':
>> nouveau_drm.c:(.text+0x1d67): undefined reference to `remove_conflicting_pci_framebuffers'
> 
> I've pushed the fix for this to drm-next.
> 
> Ben just used the wrong API.

That patch is
Acked-by: Randy Dunlap <rdunlap@infradead.org> # build-tested

thanks.
-- 
~Randy
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
