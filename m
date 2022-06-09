Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CC722544DD2
	for <lists+dri-devel@lfdr.de>; Thu,  9 Jun 2022 15:37:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BD9FA11A469;
	Thu,  9 Jun 2022 13:37:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mr3.vodafonemail.de (mr3.vodafonemail.de [145.253.228.163])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 298DC11A471
 for <dri-devel@lists.freedesktop.org>; Thu,  9 Jun 2022 13:37:16 +0000 (UTC)
Received: from smtp.vodafone.de (unknown [10.0.0.2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by mr3.vodafonemail.de (Postfix) with ESMTPS id 4LJlWZ5XS3z21gc
 for <dri-devel@lists.freedesktop.org>; Thu,  9 Jun 2022 13:37:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arcor.de;
 s=vfde-mb-mr2-21dec; t=1654781834;
 bh=CVLPrl/xomwkRCtDLdakQc1i8o7YEc0ysYoVaK6Q1DA=;
 h=Message-ID:Date:User-Agent:Subject:Content-Language:To:References:
 From:In-Reply-To:Content-Type:From;
 b=S3VLl1LEGgNPIQvZGY/lmOSsV6tyra5cAlVD0sOHJEVjAjrvEoOhcMqxutP7OSN2n
 ZKMUUYvEF+TvqN1v6MIzQUPxxKBP1h3tNoeF/61xF/8S90aVs8s68EdjRiMrnbsqr2
 2cBiJkg1hx7m3w0dGcuBloUaWF/LtviwwGh0XseM=
Received: from schreibtisch (p2e579e8f.dip0.t-ipconnect.de [46.87.158.143])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp.vodafone.de (Postfix) with ESMTPSA id 4LJlWY3Q1fz9vqG
 for <dri-devel@lists.freedesktop.org>; Thu,  9 Jun 2022 13:37:10 +0000 (UTC)
Message-ID: <a65f93bd-e45b-c074-b7b8-390df0b02a4b@arcor.de>
Date: Thu, 9 Jun 2022 15:37:09 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: drm/vc4: module dysfunctional on Raspberry Pi 3B as of 5.18.0
Content-Language: en-US
To: dri-devel@lists.freedesktop.org
References: <75eec8af-66fd-bbaa-9aea-4cdf634bf2c8@arcor.de>
 <CALeDE9MzaG0vGfwMrZVArCWpNT94=vTakoM71qykBkVbeL1QmQ@mail.gmail.com>
 <20220608143605.x4arwudst3nqeg7b@houat>
 <CALeDE9OyJtvRGnN80JNW3AwwgAa_h_bs8GTLJzo06WK-o+_7Ng@mail.gmail.com>
 <20220608153608.ntgyokt67f3m7pn6@houat>
 <20220609092351.t2muybqjnqaqzemz@houat>
From: Peter Mattern <pmattern@arcor.de>
In-Reply-To: <20220609092351.t2muybqjnqaqzemz@houat>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-purgate-type: clean
X-purgate: clean
X-purgate-size: 848
X-purgate-ID: 155817::1654781833-EA3593BB-63FA0E5F/0/0
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

 > Could you start a bisection maybe?

I for one am having two issues here.

The harmless one is that I'm lacking a cooler for the RPi and my cross 
compiling skills have become a bit rusty.
Both could be fixed quickly, of course.

The not so harmless one is that kernel 5.18.x is completely unusable due 
to an other regression: the SD card is slow to a degree that makes it 
rather unusable, rather simple tasks are tainting the kernel because of 
this. E. g. a simple kernel update takes half an hour on 5.18.x.
Neither sure what's the culprit here nor how to deal with it.

Nonetheless:
Could the module be installed without updating the kernel as a whole, e. 
g.by DKMS?
Is there a way to narrow down the commits in question, e. g. something 
like 'git log ./drivers/gpu/drm/vc4/' in a Git checkout of the kernel 
sources?
