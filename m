Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 061B13587EA
	for <lists+dri-devel@lfdr.de>; Thu,  8 Apr 2021 17:11:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DADDA6EB2B;
	Thu,  8 Apr 2021 15:10:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-40131.protonmail.ch (mail-40131.protonmail.ch
 [185.70.40.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0AA8B6EB22;
 Thu,  8 Apr 2021 15:10:54 +0000 (UTC)
Date: Thu, 08 Apr 2021 15:10:39 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=emersion.fr;
 s=protonmail3; t=1617894651;
 bh=w9Ll73lXc4jbHSDyvX8yN7Cj0kZoc2l9DiDSA0gWKfQ=;
 h=Date:To:From:Cc:Reply-To:Subject:In-Reply-To:References:From;
 b=m/35YXydKWQ01MVvB+QD/EZYy50RPVsltK4AvFbWTJPBAXsnwxxfJ+//d7QKk3RVn
 kSU5zsVMY6rmPVV0gVQn5q+kb0f0cG3cx8pMXN9mTVO5wXXgs99y3fokQ0Q6S8W865
 /5FWMbyUhkdOn39pkXAM1C3Wa+C90RM+HByHGL5kvN42oZyJjZW4CeVXhwGuNu1HGN
 fDvSP7kUiST/acmJ2W6qONFD/aPJTo4yAvGZ2E1VxDs22laX/iSJZ2y6QB4YuuQvzs
 qZgiof0stInYmoOI5IK/PqqTpXpa6TpKeFzHelslsaLkc2ksNn9YtYQoEW1I1eNk2T
 LQKPoOF50grzw==
To: Jani Nikula <jani.nikula@linux.intel.com>
From: Simon Ser <contact@emersion.fr>
Subject: Re: Call for an EDID parsing library
Message-ID: <BIyXHmd9St1ss-z2I5n6mdZZFRRBj2zhTq4eMGjlN-mmPpp_7VC2HjUyF22htq84SlVwil4LBddopV6slVnJIKWd6VcFmzVZOxSTzTpt0BY=@emersion.fr>
In-Reply-To: <87o8eoj01m.fsf@intel.com>
References: <20210407114404.13b41822@eldfell>
 <7d8dc3ea-a935-5145-482c-42ea43dfd782@xs4all.nl> <87mtuajshc.fsf@intel.com>
 <33467672-b66a-7658-de04-7bc37153613f@xs4all.nl> <87r1jkj37y.fsf@intel.com>
 <20210408171311.61f433bd@eldfell> <87o8eoj01m.fsf@intel.com>
MIME-Version: 1.0
X-Spam-Status: No, score=-1.2 required=10.0 tests=ALL_TRUSTED,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF shortcircuit=no
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on
 mailout.protonmail.ch
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
Reply-To: Simon Ser <contact@emersion.fr>
Cc: xorg-devel@lists.x.org, dri-devel@lists.freedesktop.org,
 wayland-devel@lists.freedesktop.org, Hans Verkuil <hverkuil@xs4all.nl>,
 linux-media@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thursday, April 8th, 2021 at 4:58 PM, Jani Nikula <jani.nikula@linux.intel.com> wrote:

> Perhaps that should be the takeaway; try to minimize parsed data
> where the consumer needs to know whether it originated from DisplayID or
> EDID?

So an EDID/DisplayID abstraction layer?

It sounds like only an EDID and DisplayID expert could come up with a
sane API for that. Also some metadata will only be available in one
format and not the other.
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
