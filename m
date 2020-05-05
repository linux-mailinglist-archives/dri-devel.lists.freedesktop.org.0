Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 033D51C60A9
	for <lists+dri-devel@lfdr.de>; Tue,  5 May 2020 21:03:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B14DD6E479;
	Tue,  5 May 2020 19:03:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from asavdk4.altibox.net (asavdk4.altibox.net [109.247.116.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 524B26E479
 for <dri-devel@lists.freedesktop.org>; Tue,  5 May 2020 19:03:41 +0000 (UTC)
Received: from ravnborg.org (unknown [158.248.194.18])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by asavdk4.altibox.net (Postfix) with ESMTPS id 31D8C80441;
 Tue,  5 May 2020 21:03:38 +0200 (CEST)
Date: Tue, 5 May 2020 21:03:36 +0200
From: Sam Ravnborg <sam@ravnborg.org>
To: Artem Mygaiev <joculator@gmail.com>, Phong LE <ple@baylibre.com>
Subject: Re: Question about sRGB framebuffer support
Message-ID: <20200505190336.GA12664@ravnborg.org>
References: <CAJwc6KtGT4+Y2jT1fxzYrkcqvkxgs9GGqxT-zZtj6ktRf-67jQ@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAJwc6KtGT4+Y2jT1fxzYrkcqvkxgs9GGqxT-zZtj6ktRf-67jQ@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.3 cv=MOBOZvRl c=1 sm=1 tr=0
 a=UWs3HLbX/2nnQ3s7vZ42gw==:117 a=UWs3HLbX/2nnQ3s7vZ42gw==:17
 a=kj9zAlcOel0A:10 a=jta1ecBkAAAA:8 a=vsRjAEWcAAAA:20 a=IpJZQVW2AAAA:8
 a=VwQbUJbxAAAA:8 a=m7yZuxv1mVnD7CP__70A:9 a=CjuIK1q_8ugA:10
 a=GL3GKE0QfFW_AYR4f9um:22 a=IawgGOuG5U0WyFbmm1f5:22
 a=AjGcO6oz07-iQ99wixmX:22
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
Cc: dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Artem.

On Tue, May 05, 2020 at 01:24:16PM +0300, Artem Mygaiev wrote:
> Hello all
> 
> I am currently working on DRM/KMS driver for Fresco Logic FL2000 USB display
> controller [1]. I have already implemented a POC driver [2] which is working for
> me, although there are still plenty of things to improve or fix, of course.
> 
> So far I have one thing that I somehow cannot find in DRM/KMS documentation or
> existing drivers: how to tell the system that HW expects sRGB (i.e. non-linear)
> color encoding in framebuffers? This is a HW limitation that I cannot influence
> by configuration.
> 
> Any pointers are greatly appreciated.
No clue, I hope others can help you.

> 
> [1] www.frescologic.com/product/single/fl2000

> [2] https://github.com/klogg/fl2000_drm
I just visited your github site - and noticed you are using the
it66121 bridge.

Phong LE <ple@baylibre.com> have recently submitted a patch to
add this bridge to the kernel:
https://lore.kernel.org/dri-devel/20200311125135.30832-1-ple@baylibre.com/

I did not really looks at your code, awaits that you feel ready to submit
it.
	Sam
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
