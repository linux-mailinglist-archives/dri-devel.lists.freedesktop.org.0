Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A87870FC92
	for <lists+dri-devel@lfdr.de>; Wed, 24 May 2023 19:21:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 64C0B10E4DE;
	Wed, 24 May 2023 17:21:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from 189.cn (ptr.189.cn [183.61.185.104])
 by gabe.freedesktop.org (Postfix) with ESMTP id E396C10E540
 for <dri-devel@lists.freedesktop.org>; Wed, 24 May 2023 17:21:47 +0000 (UTC)
HMM_SOURCE_IP: 10.64.8.43:37472.148761530
HMM_ATTACHE_NUM: 0000
HMM_SOURCE_TYPE: SMTP
Received: from clientip-114.242.206.180 (unknown [10.64.8.43])
 by 189.cn (HERMES) with SMTP id 9365E100180;
 Thu, 25 May 2023 01:21:43 +0800 (CST)
Received: from  ([114.242.206.180])
 by gateway-151646-dep-75648544bd-7vx9t with ESMTP id
 5a9ae2e60db24aa0a8261d6355b6b8ad for geert@linux-m68k.org; 
 Thu, 25 May 2023 01:21:44 CST
X-Transaction-ID: 5a9ae2e60db24aa0a8261d6355b6b8ad
X-Real-From: 15330273260@189.cn
X-Receive-IP: 114.242.206.180
X-MEDUSA-Status: 0
Message-ID: <636694db-a769-8b57-1c0c-f419dec740f0@189.cn>
Date: Thu, 25 May 2023 01:21:42 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: Convert existing KMS drivers to atomic modesetting?
To: Geert Uytterhoeven <geert@linux-m68k.org>, Daniel Vetter <daniel@ffwll.ch>
References: <CAMuHMdXN7_bEodiW4M33JPhN0ZQPZ+Yj66qQk-OOK9ugqhhWtA@mail.gmail.com>
 <CAMuHMdVHUGm2yES-EL5Rk2mSdCgcmHi4k9BO37qxXQXhqEWuDw@mail.gmail.com>
Content-Language: en-US
From: Sui Jingfeng <15330273260@189.cn>
In-Reply-To: <CAMuHMdVHUGm2yES-EL5Rk2mSdCgcmHi4k9BO37qxXQXhqEWuDw@mail.gmail.com>
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
Cc: DRI Development <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On 2023/5/24 23:55, Geert Uytterhoeven wrote:
> On Mon, May 22, 2023 at 4:53 PM Geert Uytterhoeven <geert@linux-m68k.org> wrote:
>> According to [1], there is a conversion guide for atomic.
>> Unfortunately the document does not have a link to this guide.
>> Where can I find it?
> I found https://blog.ffwll.ch/2014/11/atomic-modeset-support-for-kms-drivers.html
>
> Obviously it's a bit outdated, as the helpers pointed to in the first
> step were removed in commit 21ebe615c16994f3 ("drm: Remove transitional
> helpers") in v5.0...
>
> Gr{oetje,eeting}s,
>
>                          Geert
>

Yeah, I think, that is still deserve to read, for a concrete examples 
see [1].

[2] may also be helpful.


[1] 
https://lists.freedesktop.org/archives/dri-devel/2019-October/241874.html

[2] https://lwn.net/Articles/653071/


