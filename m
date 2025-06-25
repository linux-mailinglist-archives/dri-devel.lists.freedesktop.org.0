Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id ED798AE9196
	for <lists+dri-devel@lfdr.de>; Thu, 26 Jun 2025 01:08:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 37C7910E25C;
	Wed, 25 Jun 2025 23:08:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=qq.com header.i=@qq.com header.b="ct8sPGZB";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 2890 seconds by postgrey-1.36 at gabe;
 Wed, 25 Jun 2025 11:54:46 UTC
Received: from xmbghk7.mail.qq.com (xmbghk7.mail.qq.com [43.163.128.47])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1CAD710E6F0;
 Wed, 25 Jun 2025 11:54:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qq.com; s=s201512;
 t=1750852482; bh=fRZQe4nl0zKEUEJnNAJ903ZecOWgKWBEK13lijK2btU=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To;
 b=ct8sPGZBr3WxsoLvi7VPLl9mwDwNkaZa2/zGxoulUCL025PocIGGfUTBoTG35d80e
 PxULzIlntl/22PnwHxmrTweVKUi10tjcMPd7/bX9x6zH3yg0pWTK4A1ppPP38h7xuB
 itlrc8gMx+GGsfb3LTkEgeuVGcwNJZ9TLA/hStvc=
Received: from [172.25.20.158] ([111.202.154.66])
 by newxmesmtplogicsvrszb16-1.qq.com (NewEsmtp) with SMTP
 id B839CC3E; Wed, 25 Jun 2025 18:46:03 +0800
X-QQ-mid: xmsmtpt1750848363tmxew2sy5
Message-ID: <tencent_FB9C854A6AB8D1CF28C88A8642B297A59C07@qq.com>
X-QQ-XMAILINFO: MT46X0n0UCeM4y5W26Ag/ADFG1DHi9F9CHyqbj6DSfeO3dtcmIBOE1oh2UcVZP
 ZMmQ68mcMehwhUbLUnc07Zn9RGz6F2suZwRJOeyiIzICBfgm0V2+5cregthy5C7I8MB6FhVvNcYM
 /VYkFzpfdEChNh1ny0qa/KKLXtV+MtsrADzq4s7xqMxPy7INKe9X7UTI8B30l2IDWVuhCLBivAB/
 KpDHHHEgbPHLOTlKPIWS+VeUSKe0p858cK9CT24Fk/cVWieuHQr8ktv6F80EJcbM+1S/A2ggowY6
 fAb4V4CaUZGL0XfnXbcLYb6LQmmw+A5CVdgTwLZAnVSKd0mwEH7Z7pmaiJiOydAd+niM/H3cdnq1
 rOkrq8lQR55XrWjPx6gZ/EFejSqH8DoRxc5WJMO4+TBv4qGCLjkGxCLhfzpfNWMA8RomFYbRvWrD
 6xwkMLEpPnGJXjxpwo0483KUAhbHlVgxJPUoWax2HkTNHkIBqD2j7ccHzxxGpye4OildalBIIxay
 J8znfIlVeLvpwBSMKx5L/dMMyldBbPzxX+CEr1l9/weUIrqiRVImt6MOFUDOlunpBV7QPxUklf6e
 CQvXxLC5C5gBdKfW7Amei+h97GCDgKpfJBIpvH0s06O9iBzMr5JOBv8vnfdC9scfGJIYymZ3iHWM
 8a+CKbZBw8NCA+65oAHoE15MX1UdBCdnXi39kjjEPdDJxqNl0vUWfCKAdnGACYxu7dc3IA8WzeYG
 t83PPzmGaZZysMJnUHhsday1qRc0X4xe1rkKegzSK3hnBQgHu9LTEGpy19ILw0Uo5i+dLyw22WC+
 o60brkozWdLySFo0VMzrZoSZxjebVnDOYd46LeGlXEI3ApHoWbtH5gX9qdOmXHpDuXY0YRuqAi1i
 YyETv+GdRIAh7F7kT9T8xtYBssGRzq52KheHTFTcSRV6Y2jZHXfqJkiLRTtyNhFI5Jhet2ohBjyw
 xJIvTnxoRcyK6Hsx4wo61Ymi6SJV4FfufqOKeFAABoMNiHKEgteeWdTwi/nC9lwdKRit1VdVs=
X-QQ-XMRINFO: NS+P29fieYNw95Bth2bWPxk=
X-OQ-MSGID: <a9c446ff-d51a-40bf-a243-350de1e6e613@qq.com>
Date: Wed, 25 Jun 2025 18:46:03 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 5/5] ext4: declare support for FOP_DONTCACHE
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
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
References: <20250624121149.2927-1-chentaotao@didiglobal.com>
 <20250624121149.2927-6-chentaotao@didiglobal.com>
 <aFqfwHofm_eXb5zw@casper.infradead.org>
From: Chen Taotao <chentao325@qq.com>
In-Reply-To: <aFqfwHofm_eXb5zw@casper.infradead.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Wed, 25 Jun 2025 23:08:15 +0000
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


在 2025/6/24 20:53, Matthew Wilcox 写道:
> On Tue, Jun 24, 2025 at 12:12:10PM +0000, 陈涛涛 Taotao Chen wrote:
>> From: Taotao Chen<chentaotao@didiglobal.com>
>>
>> Set the FOP_DONTCACHE flag in ext4_file_operations to indicate that
>> ext4 supports IOCB_DONTCACHE handling in buffered write paths.
> I think this patch should be combined with the previous patch so we
> see all the change needed to support DONTCACHE in one patch.

I’ll merge the patches to keep the DONTCACHE support self-contained. Thanks!



