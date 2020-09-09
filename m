Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7AB9F263EA0
	for <lists+dri-devel@lfdr.de>; Thu, 10 Sep 2020 09:23:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 137A06E293;
	Thu, 10 Sep 2020 07:23:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp.domeneshop.no (smtp.domeneshop.no
 [IPv6:2a01:5b40:0:3005::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B511D6EB33
 for <dri-devel@lists.freedesktop.org>; Wed,  9 Sep 2020 11:02:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=skogtun.org
 ; s=ds201912;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=no7k1Y3k9JdhUDQ1XN9MbhKJqVbexKH3abcl8LEljAc=; b=LOMf+n/0EvE5t0zXMU5aOe370K
 BPRVe4f8DXve+0EkUHQIwq7rEdNn+dYXttY3NrZ0lkEc9oW4BDsQooky8Urt1I6sKYnB5q1lwqt3K
 ZYCOOaQHUvxCsfdQmcLa0WCSL1DGhwPWlXssdr8tYD3z5j1hDRsUwwOzbtDzoSCTlCUk1mGIGmskB
 DLCi4PGPF4az/cNZISyH/nxH/DzzYD3BK7cX03wJVC+YH7oP95lewyXhZxU8bgbYCKFSJ0ERjopNh
 iWiQFQEUEyHYiYmtR+p6mC8jN+AUPknLY7EHCfsGGDCg/4GWu1LzH9PNxXXIiKpJZoRNFKg9A0bu5
 eMdxRyKg==;
Received: from [2a01:79c:cebf:7fb0:de97:df61:fecc:46bb] (port=48632)
 by smtp.domeneshop.no with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.92) (envelope-from <harald@skogtun.org>)
 id 1kFxrq-0007p9-No; Wed, 09 Sep 2020 13:02:22 +0200
Subject: Re: [git pull] drm fixes for 5.9-rc4
To: Linus Torvalds <torvalds@linux-foundation.org>
References: <CAPM=9tz0whDeamM+k_8Wu8TVzz0TDr+qMNMXo8rKeeNRKxBuiQ@mail.gmail.com>
 <CAHk-=wh2EH9DKRpJQ7+X+NWjjduLPy_Ncv1GzxnXBg-3mTn0Fw@mail.gmail.com>
 <cfcea1be-e02f-b391-ab1f-780888da138d@skogtun.org>
 <CAHk-=wjRLmayxnChONeb24pFPv=o733ptzpAyuAebrxWzhPYtw@mail.gmail.com>
From: Harald Arnesen <harald@skogtun.org>
Message-ID: <ec952f8e-52c5-6474-42a4-5e3b3091bb6f@skogtun.org>
Date: Wed, 9 Sep 2020 13:02:21 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <CAHk-=wjRLmayxnChONeb24pFPv=o733ptzpAyuAebrxWzhPYtw@mail.gmail.com>
Content-Language: en-US
X-Mailman-Approved-At: Thu, 10 Sep 2020 07:22:25 +0000
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
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>, LKML <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Linus Torvalds [08.09.2020 20:19]:

> On Fri, Sep 4, 2020 at 2:51 PM Harald Arnesen <harald@skogtun.org> wrote:
>>
>> Still doesn't work without the three reverts
>> (763fedd6a216, 9e0f9464e2ab, 7ac2d2536dfa)...
> 
> So this didn't make rc4, but it's in my tree now.
> 
> Harald, I'm assuming things work for you again now with the current
> git tree, but it is always good to double-check in case something else
> interacted with the reverts...

I can confirm that everything works as expected now.
Thanks to all!
-- 
Hilsen Harald
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
