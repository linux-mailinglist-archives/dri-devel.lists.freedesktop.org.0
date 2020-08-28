Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F9D3256649
	for <lists+dri-devel@lfdr.de>; Sat, 29 Aug 2020 11:21:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8405F6EBFE;
	Sat, 29 Aug 2020 09:21:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from merlin.infradead.org (merlin.infradead.org
 [IPv6:2001:8b0:10b:1231::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8A71E6E405
 for <dri-devel@lists.freedesktop.org>; Fri, 28 Aug 2020 14:01:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=merlin.20170209; h=Content-Transfer-Encoding:Content-Type:
 In-Reply-To:MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender
 :Reply-To:Content-ID:Content-Description;
 bh=csZbeMn1T/DNqs11oUqU+A7IfqcuBZdTwU0OBfY6gno=; b=RFC4tUf8vrM5z1mHzdR7m6mymD
 VfXWe6eKfp8u1K0I3EJEzPNYjK4mFZ/6EKVQ93lQHP/9ZKW2vakpwz5apwHmRZryeay+s/utf8egh
 o1pG/T/MsXm2RFB5sPDMntxlKIo8Bxw+pxK5aHXnWYHUw1CMEgPbyRuAFpq/z4ErNw8rBInl/JoqD
 Q7tWzUL0YmgmTBLkvy2WFVT/xJ6Rznz9Zo5EvjcjhFmBDZ6MSqzJhnskOmiwnpIRlq7wOMmOBlvmo
 ZnylxBT+AfKUlbuWlPsQwQTkxVhs3p6Tcr+9BduKW0ZXKqomKK7sUPHwu/65bmp0J2vHGZAY6C3Yc
 UaKdcAaw==;
Received: from [2601:1c0:6280:3f0::19c2]
 by merlin.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kBeww-000514-C8; Fri, 28 Aug 2020 14:01:50 +0000
Subject: Re: [PATCH] drm: virtio: fix kconfig dependency warning
To: Gerd Hoffmann <kraxel@redhat.com>
References: <d3643dcf-87f4-ff45-fb90-9945458438f9@infradead.org>
 <20200828112535.yn75nbjtjepsq7w6@sirius.home.kraxel.org>
From: Randy Dunlap <rdunlap@infradead.org>
Message-ID: <ec31910c-b05b-f87b-6332-6ceac931154a@infradead.org>
Date: Fri, 28 Aug 2020 07:01:45 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <20200828112535.yn75nbjtjepsq7w6@sirius.home.kraxel.org>
Content-Language: en-US
X-Mailman-Approved-At: Sat, 29 Aug 2020 09:21:18 +0000
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
Cc: David Airlie <airlied@linux.ie>,
 "linux-next@vger.kernel.org" <linux-next@vger.kernel.org>,
 LKML <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 8/28/20 4:25 AM, Gerd Hoffmann wrote:
>   Hi,
> 
>>  config DRM_VIRTIO_GPU
>>  	tristate "Virtio GPU driver"
>> -	depends on DRM && VIRTIO && MMU
>> +	depends on DRM && VIRTIO_MENU && MMU
> 
> Shouldn't this depend on both VIRTIO and VIRTIO_MENU, simliar to the
> other virtio drivers?

OK, I'll send a v2.

thanks.
-- 
~Randy

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
