Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1511EAE9197
	for <lists+dri-devel@lfdr.de>; Thu, 26 Jun 2025 01:08:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 62AB510E241;
	Wed, 25 Jun 2025 23:08:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=qq.com header.i=@qq.com header.b="h1qpCfis";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 596 seconds by postgrey-1.36 at gabe;
 Wed, 25 Jun 2025 11:04:28 UTC
Received: from out203-205-221-233.mail.qq.com (out203-205-221-233.mail.qq.com
 [203.205.221.233])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2E8DB10E0D3;
 Wed, 25 Jun 2025 11:04:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qq.com; s=s201512;
 t=1750849165; bh=tgd2pHPm2RnMeqq7Vwih1WR3E04pB2uiTC5jxE+M+kQ=;
 h=Date:From:Subject:To:Cc:References:In-Reply-To;
 b=h1qpCfiszC1UIVArhV/6ZaGD7/8baE6nlPY+T84BLurJajkL+OOLp66KhoEU10veO
 ZOEK9quvvQ61+2oDywLHjNXzW4tVJOD3PhSdGYw35sj+mj2aToFEZkPup95GNfpqIP
 XoVl68yz1+7HydFo6QAi9NXZSwh8bN5YdY4NS03o=
Received: from [172.25.20.158] ([111.202.154.66])
 by newxmesmtplogicsvrszgpuc5-0.qq.com (NewEsmtp) with SMTP
 id A7A2CCF1; Wed, 25 Jun 2025 18:41:58 +0800
X-QQ-mid: xmsmtpt1750848118tykbxfohr
Message-ID: <tencent_E8315EB273FA16ECA8DD46FDA3FC2A320A09@qq.com>
X-QQ-XMAILINFO: N2/jAoEINgTTVmeFMsiQejiordXzU686AwuiVeg+WQ4hfHy1G68V9KJ6U8soDk
 FjqFfgCWPLze8PgyLk7XU3TyBnoQfb/6XHBeUMmHQrBEmBgnDoi3RLdIL7DFy1Tbc73yQn54bT9d
 e8FPcpQMT9NBuMMSNx8DJ/c2ds9Ja9LgEiomZK+KbGDaSgYXcZwkCDF6fI3zu0XkWRiU7oyPz1b4
 s1+99sUHA4eDOQpG0p32kSjphMvpHz6fsEm17ecmsTkj5r2l5sIYZ5/GrJYVK6nlRRfGw1V4palu
 BKxljpr2g3ZkATbXVN6Lsq92oxwdWEyRNI043fQtWEk0N9eXhdsRX1xz8T7c6IoWd1m06XwwIz3B
 hzNhUAy/jwdqsIdYaVvkekGTlZRK/EEUWBL1Chvck7J8MPv2iQ92tNfRoC72L+0kkkbdo6Cn4NyO
 jsA6SdPiD4STfr+cAUcUD6hDZSMkasYyQpGswLVN0Cpy3f3AlFWhlj+FEWWjmXAeULfxW3J+lpCQ
 v9ssZMsa8xz+JaI46jlkFCYR/vwCC9b/fx/FcX3bSHOEdKqzxCSe8oZQ0hvXrPsa/bxxLsb9h/E5
 ap+HjwZX3us+AfQIDtSNaps7EJLOXF/eOBJFsoVV58OX7Ay4Pj1UAtNaWefhruNwV8MJgqjKyQLv
 fv0rst6CtxHchFxqL5yfSwW7bHY1W/B3jixOXQx0JTRjZHQjRIEXus7+pS5a1TB4qZOrDJe3Atzp
 lK2qjRb0O27krp6uyzhBMCt71AHe0Y99+fT8jxrKe6aMgYUpSWgX4bCMJFbUZFqoUMA9NOPuDYgV
 JNYVsqTtnrhHE5C7zy92bEFT9guuboAFnk2cldlPo2tVG/diO3McJd8V0dboAwpu+NpMbb0wiR/v
 4lPYdscRlzPfyanf4I7w0nZ+gGbB0mxnWt0yOuTAr9auSf4qV1jB4EEsvxO/ym9FjO32VllWG2+t
 KnTXNqOhT0D1Oj+2/IPYgB3xm/FKr2JjU/7Vyy3X+Lwlmvd0XTWw==
X-QQ-XMRINFO: NyFYKkN4Ny6FSmKK/uo/jdU=
X-OQ-MSGID: <dedbc70d-36f6-43bb-b6bf-a87103b6bb24@qq.com>
Date: Wed, 25 Jun 2025 18:41:58 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Chentaotao <chentao325@qq.com>
Subject: Re: [PATCH v2 1/5] drm/i915: Use kernel_write() in shmem object create
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
 <20250624121149.2927-2-chentaotao@didiglobal.com>
 <aFqYq-tLtjZjU0Ko@casper.infradead.org>
In-Reply-To: <aFqYq-tLtjZjU0Ko@casper.infradead.org>
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


在 2025/6/24 20:23, Matthew Wilcox 写道:
> On Tue, Jun 24, 2025 at 12:12:04PM +0000, 陈涛涛 Taotao Chen wrote:
>> +++ b/drivers/gpu/drm/i915/gem/i915_gem_shmem.c
>> @@ -637,8 +637,7 @@ i915_gem_object_create_shmem_from_data(struct drm_i915_private *i915,
>>   {
>>   	struct drm_i915_gem_object *obj;
>>   	struct file *file;
>> -	const struct address_space_operations *aops;
>> -	loff_t pos;
>> +	loff_t pos = 0;
>>   	int err;
> I think 'err' needs to become ssize_t to avoid writes larger than 2GB
> from being misinterpreted as errors.

Thanks for the great catch! I’ve changed int err; to ssize_t err; as you 
suggested.



