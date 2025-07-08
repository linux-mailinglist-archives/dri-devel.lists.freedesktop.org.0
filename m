Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1378FAFC0F1
	for <lists+dri-devel@lfdr.de>; Tue,  8 Jul 2025 04:41:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F1A2110E0FF;
	Tue,  8 Jul 2025 02:41:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=qq.com header.i=@qq.com header.b="RoJkTC6Z";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out203-205-221-164.mail.qq.com (out203-205-221-164.mail.qq.com
 [203.205.221.164])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C2B9210E0FF;
 Tue,  8 Jul 2025 02:41:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qq.com; s=s201512;
 t=1751942456; bh=kvzF1+p5zL61FS2tiZH6CM11U4IQ8gp2XDypmzE3OA4=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To;
 b=RoJkTC6Zt/jiPjT7kGDo1mdPrG0IiVqc+b/ptrrbvnPUJ/WqoXBMKVjl728GvVsUg
 qh9M2PqwAWiVB8VTLiWnFash9zw9SAInfjytQlETwrOu8VFPLDDyqDRdHPiIZylX3j
 WITJHeV9SAzlHumuy2CIG3RL4QBaJ1D79YruDeUM=
Received: from [172.25.28.139] ([210.12.148.147])
 by newxmesmtplogicsvrszc16-0.qq.com (NewEsmtp) with SMTP
 id A34B4E63; Tue, 08 Jul 2025 10:40:52 +0800
X-QQ-mid: xmsmtpt1751942452tqb7p6kqb
Message-ID: <tencent_28C38B580EFE8219F5D7E850944CC55A2106@qq.com>
X-QQ-XMAILINFO: OdIVOfqOaVcrB8J1/3pY4XbUjodfVtvPJYY8MEIntC/Qk0T7VCsqouThYi3dUz
 nBB+HWRWUrC/DjWaMIe3fDKXL+/1yL0ONPwSf6VzAi9s+e53grwuKj0NrQxQfDB/tvErjLQT6kN+
 ku8eDgRQ2ZJks+cyE6nUh2pt+o3LhMMpdTbK4oHplFtkSFGZrcvGgOsZ8iRSuF3JWM+VTBJ6/zs8
 ELuPCcaem7SCKvoIQ+LGmhscZdTrg+SX+8O+82yQWsfR3GzYefu6z/uqvB+9+MfattdYmOk319DS
 i3L+xjwYpRyws77ucRGqvnAiZTclJvNdvW5Do35M3N/EIDqb55mbXU/mZyehhaKEjZOJ/CJCXtBV
 I1yVo9hxMcnZji1oHD2QmHiurcR21qkFJ48nUrE5bgKQHEs0NtHEUk2OgOI8e3UHB98GapKPZEvq
 J2H/qWdMeLiDnQOOikfFUpYXv0d5J5xBMhOh2S06+Wy1vvATxmpH7knEDr9Pk1rIhFOclUXQ4z2S
 6Tm0+J3brxOwAa6HklGaUpXatvdWB77/jDpyae1VhaJFS144yMZXQi4xwZvd5MmOTSqDkf+Z6Byf
 U67miPCw/wdH+aeKBdmaFlAFZ8TvAKPgrP9yB0GOMn+Sbq+fYXl5kyBMA/tuI0jGAYtqf9B7EUbl
 5noJVRcbZQtSROy6bdSLFIW4bKRDmmpIcC1Ako6Wei97QHe5E16b5+Z16k3QUZ4FLEC45fwNHB8o
 ACB8jBz9fsfYwsIHRrBtBPctVuDEoXwr8hkqUUd+9Pe+h6S0P8WDHc2zKDUEj1hrzy7yhqT2WOBM
 0Gbj+Ajmjfj+YVEpDCWs5akjrfVRsOiXTi6mr9zJ2szYtAyWOjshuTybaVqNyzlqOoW+I8UVBng3
 mQJyqxNfJsPJ0PQXKAgN09aGyzNEOOmpvp0Q5ZrgBz/bbuBIvnOpYZa15Fe0HNTZbF36qh61wzN2
 JrQJ6uYekSONwhYqbUGREsMuMnQ6/KpP+y7u/MmU0FGWNV07kXgKgmjJ9G9dO3VXhNeqZGyag=
X-QQ-XMRINFO: Nq+8W0+stu50PRdwbJxPCL0=
X-OQ-MSGID: <321af03f-1f7d-4ea5-81f4-28938410a7fe@qq.com>
Date: Tue, 8 Jul 2025 10:40:52 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 4/5] mm/filemap: add write_begin_get_folio() helper
 function
To: Matthew Wilcox <willy@infradead.org>,
 =?UTF-8?B?6ZmI5rab5rabIFRhb3RhbyBDaGVu?= <chentaotao@didiglobal.com>
Cc: "tytso@mit.edu" <tytso@mit.edu>, "hch@infradead.org" <hch@infradead.org>, 
 "adilger.kernel@dilger.ca" <adilger.kernel@dilger.ca>,
 "brauner@kernel.org" <brauner@kernel.org>,
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
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "frank.li@vivo.com" <frank.li@vivo.com>
References: <20250707070023.206725-1-chentaotao@didiglobal.com>
 <20250707070023.206725-5-chentaotao@didiglobal.com>
 <aGvfr_rLUAHaUQkY@casper.infradead.org>
From: Taotao Chen <chentao325@qq.com>
In-Reply-To: <aGvfr_rLUAHaUQkY@casper.infradead.org>
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


在 2025/7/7 22:54, Matthew Wilcox 写道:
> On Mon, Jul 07, 2025 at 07:00:33AM +0000, 陈涛涛 Taotao Chen wrote:
>> +++ b/mm/filemap.c
> I think this should be a static inline function.  I don't think it's
> worth moving out of line.  Of course if you have measurements that show
> differently, you can change my mind.
>
>> +/**
>> + * write_begin_get_folio - Get folio for write_begin with flags
>> + * @iocb: kiocb passed from write_begin (may be NULL)
>> + * @mapping: the address space to search in
>> + * @index: page cache index
>> + * @len: length of data being written
>> + *
>> + * This is a helper for filesystem write_begin() implementations.
>> + * It wraps __filemap_get_folio(), setting appropriate flags in
>> + * the write begin context.
>> + *
>> + * Returns a folio or an ERR_PTR.
> We prefer:
>
>   * Return: A folio or an ERR_PTR
>
> as this gets its own section in the kernel-doc output.

Hi,

I’ll update both in the next version. Thanks for your review!

--Taotao



