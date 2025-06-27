Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 74CECAEACE5
	for <lists+dri-devel@lfdr.de>; Fri, 27 Jun 2025 04:41:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CDEEF10E310;
	Fri, 27 Jun 2025 02:41:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=qq.com header.i=@qq.com header.b="AkWfkly9";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out203-205-221-190.mail.qq.com (out203-205-221-190.mail.qq.com
 [203.205.221.190])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 920AF10E310;
 Fri, 27 Jun 2025 02:41:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qq.com; s=s201512;
 t=1750992046; bh=Pu0jA1GVRoKDx2l6du1YCcmFc4TR2c85F/Sld/qZPu4=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To;
 b=AkWfkly9bG08oWRKdq/HwUbzfNCMDsM0jBLX1JXvztr86CiVmE2NcexcUpGhUke6s
 tQyU7ZHDcYa2nEbef5BQwLZWShiDi0CWTixun0WyNKMCgHGZ/BWsCK5+O95/fV4XyJ
 Q3K/w+1/TUiSHw45h697dfEsUhXMfTTfj8V7Ntk0=
Received: from [172.25.20.158] ([111.202.154.66])
 by newxmesmtplogicsvrszb20-0.qq.com (NewEsmtp) with SMTP
 id A2A3B4EF; Fri, 27 Jun 2025 10:40:42 +0800
X-QQ-mid: xmsmtpt1750992042t5ouc00kx
Message-ID: <tencent_5B902C24516F8FB647C156B41596BF68E70A@qq.com>
X-QQ-XMAILINFO: OIJV+wUmQOUAf2UFzEHsFZTqx+Kq6+t/DjOoALtts+bmxTDYe0aOhXVnuSwlBh
 IKwrkPpmAPshTmKQvzmwkCKcnTChguPERIY3OFEg0UHXTqoUrZRp2DDlAO+zFQL43ghY2PXedN0N
 v8yTrkQcBKQXpry/j0lTZgxTRyMAJ4il5YSrVQ49OOvk7MOOXLV05fMdiFvaAzTH/AyBkC/8onJx
 fGCrWZ6Kc1086A9ImQRn8VYJhRsJ2A0ajoWlmFyH/RMMrgB+du2d3S5ta6e1sIqRWANj6DaSBB/Z
 0H9/sugRPpHBgWCYNx0zR4SZV+D9aVueby9w0rHO8uiZchZTQ55JEiGAU+zYCwUEnpO/WrQquPrS
 xNORxDZhqJvu3bpgFlZuUB2or5Lb138OPPBVk7ISqU7M9BBuVNhOAABrKgy88NMMi3v7RE5NmASd
 bsqw5KWSGbMh07yPp6WqG7AbWmS6f+8NMhKaGFBrzr8G31elIiLR0nBUI5Hq+4hzlmKOb4pJPYl4
 K7dCql/f4y0YBj9NR4/zukyH8EbMDdqBMv5KWHeqTg0br5FOrW3Vf2cgQnlbgpeADTVolKDZCQXU
 YvFE7JYMY6cWF5Lbz2XGMTgX/PuvSTc7+VlaJ0KCKC36LdQIub3IYqgAYHlqka42BjVm+2rQnIcW
 drCOo/tZbyhVd3A9q9ehEgnJ7LRGMQngSn1TiWgra5iFlb6L2UAknqV687ygfwTjMMM6SFmyGzKf
 TJj38y0CFzTSxkhVcKswqdpAyGx5Iyv4ZIue+K43wEjB8Opss/jsbBlrwBU40X9Znabyx/nUnLfy
 6cr3oIyu9m1nQZpc9UuJMwfrSU/V51GolaiyJW1CvRALeD6jxrTKx2ZYlVX/+QW67bN3K7D9FJCx
 Wdpk5o2c9KC/id7uBgDRKQXndyxAXpa2USSSOtHHe1iTSMZvWKw+fPK30Lh5vaJqcMkhQnSUsOFx
 rlUJPhp6v1cO2wygZAmvfIo/alad3u5jx2A2RXxVFTLQaz9X0RlA==
X-QQ-XMRINFO: MSVp+SPm3vtS1Vd6Y4Mggwc=
X-OQ-MSGID: <3753a0b7-fed3-4391-9fc4-fade83c89a34@qq.com>
Date: Fri, 27 Jun 2025 10:40:41 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/5] fs: change write_begin/write_end interface to take
 struct kiocb *
To: Christian Brauner <brauner@kernel.org>,
 Matthew Wilcox <willy@infradead.org>
Cc: =?UTF-8?B?6ZmI5rab5rabIFRhb3RhbyBDaGVu?= <chentaotao@didiglobal.com>,
 "tytso@mit.edu" <tytso@mit.edu>, "hch@infradead.org" <hch@infradead.org>,
 "adilger.kernel@dilger.ca" <adilger.kernel@dilger.ca>,
 "jani.nikula@linux.intel.com" <jani.nikula@linux.intel.com>,
 "rodrigo.vivi@intel.com" <rodrigo.vivi@intel.com>,
 "tursulin@ursulin.net" <tursulin@ursulin.net>,
 "airlied@gmail.com" <airlied@gmail.com>,
 "linux-fsdevel@vger.kernel.org" <linux-fsdevel@vger.kernel.org>,
 "linux-ext4@vger.kernel.org" <linux-ext4@vger.kernel.org>,
 "linux-block@vger.kernel.org" <linux-block@vger.kernel.org>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linux-mm@kvack.org" <linux-mm@kvack.org>,
 "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
References: <20250624121149.2927-1-chentaotao@didiglobal.com>
 <20250624121149.2927-4-chentaotao@didiglobal.com>
 <aFqfZ9hiiW4qnYtO@casper.infradead.org>
 <20250625-erstklassig-stilvoll-273282f0dd1b@brauner>
From: Chen Taotao <chentao325@qq.com>
In-Reply-To: <20250625-erstklassig-stilvoll-273282f0dd1b@brauner>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


在 2025/6/25 16:04, Christian Brauner 写道:
> On Tue, Jun 24, 2025 at 01:51:51PM +0100, Matthew Wilcox wrote:
>> On Tue, Jun 24, 2025 at 12:12:08PM +0000, 陈涛涛 Taotao Chen wrote:
>>> -static int blkdev_write_end(struct file *file, struct address_space *mapping,
>>> +static int blkdev_write_end(struct kiocb *iocb, struct address_space *mapping,
>>>   		loff_t pos, unsigned len, unsigned copied, struct folio *folio,
>>>   		void *fsdata)
>>>   {
>>>   	int ret;
>>> -	ret = block_write_end(file, mapping, pos, len, copied, folio, fsdata);
>>> +	ret = block_write_end(iocb->ki_filp, mapping, pos, len, copied, folio, fsdata);
>> ... huh.  I thought block_write_end() had to have the same prototype as
>> ->write_end because it was used by some filesystems as the ->write_end.
>> I see that's not true (any more?).  Maybe I was confused with
>> generic_write_end().  Anyway, block_write_end() doesn't use it's file
>> argument, and never will, so we can just remove it.
>>
>>> +++ b/include/linux/fs.h
>>> @@ -446,10 +446,10 @@ struct address_space_operations {
>>>   
>>>   	void (*readahead)(struct readahead_control *);
>>>   
>>> -	int (*write_begin)(struct file *, struct address_space *mapping,
>>> +	int (*write_begin)(struct kiocb *, struct address_space *mapping,
>>>   				loff_t pos, unsigned len,
>>>   				struct folio **foliop, void **fsdata);
>>> -	int (*write_end)(struct file *, struct address_space *mapping,
>>> +	int (*write_end)(struct kiocb *, struct address_space *mapping,
>>>   				loff_t pos, unsigned len, unsigned copied,
>>>   				struct folio *folio, void *fsdata);
>> Should we make this a 'const struct kiocb *'?  I don't see a need for
>> filesystems to be allowed to modify the kiocb in future, but perhaps
>> other people have different opinions.
> Given I picked up Willy's change I'll wait for a resubmit of this series
> on top of vfs-6.17.misc unless I hear otherwise?
Sure, I’ll update the series on top of vfs-6.17.misc and resend it as 
soon as possible.

Best regards,
Taotao Chen

