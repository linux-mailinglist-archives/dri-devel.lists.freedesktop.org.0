Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 20341315809
	for <lists+dri-devel@lfdr.de>; Tue,  9 Feb 2021 21:53:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E6A9E6E0CB;
	Tue,  9 Feb 2021 20:53:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from hqnvemgate25.nvidia.com (hqnvemgate25.nvidia.com
 [216.228.121.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0FD8B6E0CB
 for <dri-devel@lists.freedesktop.org>; Tue,  9 Feb 2021 20:53:29 +0000 (UTC)
Received: from hqmail.nvidia.com (Not Verified[216.228.121.13]) by
 hqnvemgate25.nvidia.com (using TLS: TLSv1.2, AES256-SHA)
 id <B6022f6480001>; Tue, 09 Feb 2021 12:53:28 -0800
Received: from DRHQMAIL107.nvidia.com (10.27.9.16) by HQMAIL105.nvidia.com
 (172.20.187.12) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Tue, 9 Feb
 2021 20:53:28 +0000
Received: from [10.2.50.67] (172.20.145.6) by DRHQMAIL107.nvidia.com
 (10.27.9.16) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Tue, 9 Feb 2021
 20:53:28 +0000
Subject: Re: [PATCH 0/9] Add support for SVM atomics in Nouveau
To: Daniel Vetter <daniel@ffwll.ch>, Alistair Popple <apopple@nvidia.com>
References: <20210209010722.13839-1-apopple@nvidia.com>
 <CAKMK7uGwg2-DTU7Zrco=TSkcR4yTqN1AF0hvVYEAbuj4BUYi5Q@mail.gmail.com>
 <3426910.QXTomnrpqD@nvdebian>
 <CAKMK7uHp+BzHF1=JhKjv5HYm_j0SVqsGdRqjUxVFYx4GSEPucg@mail.gmail.com>
From: John Hubbard <jhubbard@nvidia.com>
Message-ID: <57fe0deb-8bf6-d3ee-3545-11109e946528@nvidia.com>
Date: Tue, 9 Feb 2021 12:53:27 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:85.0) Gecko/20100101
 Thunderbird/85.0
MIME-Version: 1.0
In-Reply-To: <CAKMK7uHp+BzHF1=JhKjv5HYm_j0SVqsGdRqjUxVFYx4GSEPucg@mail.gmail.com>
Content-Language: en-US
X-Originating-IP: [172.20.145.6]
X-ClientProxiedBy: HQMAIL111.nvidia.com (172.20.187.18) To
 DRHQMAIL107.nvidia.com (10.27.9.16)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
 t=1612904008; bh=efTFNdu9GY93fBrYgfGo5YB09FPO44DdmrDbf3NcmA8=;
 h=Subject:To:CC:References:From:Message-ID:Date:User-Agent:
 MIME-Version:In-Reply-To:Content-Type:Content-Language:
 Content-Transfer-Encoding:X-Originating-IP:X-ClientProxiedBy;
 b=oOacMjOb06MbLt3MklBlfJmol0WiXwI5VrJQzUPy3VIRUABA721mwmtEk5laRaFdL
 1TgYD7us6SRaillAdI1lcgGlIdyJek1dOTFVhDnyE2O3I+0OWr72QO1zqGgtsAlgZM
 XoXWC6bFgcqLN4YfI9Hq+NhihJS47c+q+V0qXeOTEgQtEwB92yoJZn89seCqJe43ky
 ex8WisDf0I2J97YumwelfGCA2keVVdcX0KJL5u61SZMitqoPN5SG/CCVlP3I7iPS1w
 ghlzljcQ2bKvx+UVLYtlzqvILA3AlyDKepX5K4+iznmkld1sNDTuw0sGpBLV8p9rc5
 18FHL1oWI+WFA==
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
Cc: Jason Gunthorpe <jgg@ziepe.ca>, Ralph Campbell <rcampbell@nvidia.com>,
 Linux Doc Mailing List <linux-doc@vger.kernel.org>,
 Nouveau Dev <nouveau@lists.freedesktop.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 kvm-ppc@vger.kernel.org, Linux MM <linux-mm@kvack.org>,
 Jerome Glisse <jglisse@redhat.com>, Ben Skeggs <bskeggs@redhat.com>, Andrew
 Morton <akpm@linux-foundation.org>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 2/9/21 5:37 AM, Daniel Vetter wrote:
> On Tue, Feb 9, 2021 at 1:57 PM Alistair Popple <apopple@nvidia.com> wrote:
>>
>> On Tuesday, 9 February 2021 9:27:05 PM AEDT Daniel Vetter wrote:
>>>>
>>>> Recent changes to pin_user_pages() prevent the creation of pinned pages in
>>>> ZONE_MOVABLE. This series allows pinned pages to be created in
>> ZONE_MOVABLE
>>>> as attempts to migrate may fail which would be fatal to userspace.
>>>>
>>>> In this case migration of the pinned page is unnecessary as the page can
>> be
>>>> unpinned at anytime by having the driver revoke atomic permission as it
>>>> does for the migrate_to_ram() callback. However a method of calling this
>>>> when memory needs to be moved has yet to be resolved so any discussion is
>>>> welcome.
>>>
>>> Why do we need to pin for gpu atomics? You still have the callback for
>>> cpu faults, so you
>>> can move the page as needed, and hence a long-term pin sounds like the
>>> wrong approach.
>>
>> Technically a real long term unmoveable pin isn't required, because as you say
>> the page can be moved as needed at any time. However I needed some way of
>> stopping the CPU page from being freed once the userspace mappings for it had
>> been removed. Obviously I could have just used get_page() but from the
>> perspective of page migration the result is much the same as a pin - a page
>> which can't be moved because of the extra refcount.
> 
> long term pin vs short term page reference aren't fully fleshed out.
> But the rule more or less is:
> - short term page reference: _must_ get released in finite time for
> migration and other things, either because you have a callback, or
> because it's just for direct I/O, which will complete. This means
> short term pins will delay migration, but not foul it complete


GPU atomic operations to sysmem are hard to categorize, because because application
programmers could easily write programs that do a long series of atomic operations.
Such a program would be a little weird, but it's hard to rule out.


> 
> - long term pin: the page cannot be moved, all migration must fail.
> Also this will have an impact on COW behaviour for fork (but not sure
> where those patches are, John Hubbard will know).


That would be Jason's commit 57efa1fe59576 ("mm/gup: prevent gup_fast from racing
with COW during fork"), which is in linux-next 20201216.


> 
> So I think for your use case here you want a) short term page
> reference to make sure it doesn't disappear plus b) callback to make
> sure migrate isn't blocked.
> 
> Breaking ZONE_MOVEABLE with either allowing long term pins or failing
> migrations because you don't release your short term page reference
> isn't good.
> 
>> The normal solution of registering an MMU notifier to unpin the page when it
>> needs to be moved also doesn't work as the CPU page tables now point to the
>> device-private page and hence the migration code won't call any invalidate
>> notifiers for the CPU page.
> 
> Yeah you need some other callback for migration on the page directly.
> it's a bit awkward since there is one already for struct
> address_space, but that's own by the address_space/page cache, not
> HMM. So I think we need something else, maybe something for each
> ZONE_DEVICE?
> 

This direction sounds at least...possible. Using MMU notifiers instead of pins
is definitely appealing. I'm not quite clear on the callback idea above, but
overall it seems like taking advantage of the ZONE_DEVICE tracking of pages
(without having to put anything additional in each struct page), could work.

Additional notes or ideas here are definitely welcome.



thanks,
-- 
John Hubbard
NVIDIA
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
