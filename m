Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id F2C0025E4A8
	for <lists+dri-devel@lfdr.de>; Sat,  5 Sep 2020 02:35:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 912146ECFF;
	Sat,  5 Sep 2020 00:35:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 514 seconds by postgrey-1.36 at gabe;
 Fri, 04 Sep 2020 22:00:11 UTC
Received: from smtp.domeneshop.no (smtp.domeneshop.no
 [IPv6:2a01:5b40:0:3005::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 143496ECE1
 for <dri-devel@lists.freedesktop.org>; Fri,  4 Sep 2020 22:00:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=skogtun.org
 ; s=ds201912;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=CSV8fgUCyOoK9Ra6R0elSO8AVBPoGfoCDvuZQf1//AU=; b=an3bOoyp13xtDFVZ2xDRuDlVDJ
 Fcz807ZjfcVZRxc+plgUN+sfa4P/haJfMJYhRsxbpf/ubk6Goojdr/YDs5K+j1aRa+1Ko9Cg6Kzgw
 8pbVNOyAdYTNHoiMkbBbRS1uRnrFpRVR+dzvlJy9WpdUDNG/eL6IlAYjMQ/hPr2AzkICa5zwoWVYT
 Rhc9/mRI2kwMkgA6XidX5bYmqAK/ktPfijuEoBpW2SAr68NLKYJnOFFpkrvhTHkUbXacjOlaiOvLJ
 J24jtQfrcG6CHMu8lJ8MWbWZoevNcD2woMHK1aEYXBGke36xps7uy0LKr8b8VnEBAcoJn2CZwHk3s
 CvhrQ8Pg==;
Received: from [2a01:79c:cebf:7fb0:de97:df61:fecc:46bb] (port=53844)
 by smtp.domeneshop.no with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.92) (envelope-from <harald@skogtun.org>)
 id 1kEJcN-0003Ab-LQ; Fri, 04 Sep 2020 23:51:35 +0200
Subject: Re: [git pull] drm fixes for 5.9-rc4
To: Linus Torvalds <torvalds@linux-foundation.org>,
 Dave Airlie <airlied@gmail.com>
References: <CAPM=9tz0whDeamM+k_8Wu8TVzz0TDr+qMNMXo8rKeeNRKxBuiQ@mail.gmail.com>
 <CAHk-=wh2EH9DKRpJQ7+X+NWjjduLPy_Ncv1GzxnXBg-3mTn0Fw@mail.gmail.com>
From: Harald Arnesen <harald@skogtun.org>
Message-ID: <cfcea1be-e02f-b391-ab1f-780888da138d@skogtun.org>
Date: Fri, 4 Sep 2020 23:51:34 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <CAHk-=wh2EH9DKRpJQ7+X+NWjjduLPy_Ncv1GzxnXBg-3mTn0Fw@mail.gmail.com>
Content-Language: en-US
X-Mailman-Approved-At: Sat, 05 Sep 2020 00:35:27 +0000
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

Linus Torvalds [04.09.2020 21:02]:

> On Thu, Sep 3, 2020 at 8:53 PM Dave Airlie <airlied@gmail.com> wrote:
>>
>> Not much going on this week, nouveau has a display hw bug workaround,
>> amdgpu has some PM fixes and CIK regression fixes, one single radeon
>> PLL fix, and a couple of i915 display fixes.
> 
> Any movement on the i915 relocation issue? I've only seen the one
> report for the 64-bit case, but clearly there was more going on than
> just the missing page table flush on 32-bit..

Still doesn't work without the three reverts
(763fedd6a216, 9e0f9464e2ab, 7ac2d2536dfa)...
-- 
Hilsen Harald
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
