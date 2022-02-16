Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A89164B8378
	for <lists+dri-devel@lfdr.de>; Wed, 16 Feb 2022 10:01:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6434E10E97C;
	Wed, 16 Feb 2022 09:01:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk
 [IPv6:2a00:1098:0:82:1000:25:2eeb:e3e3])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C3AA610E95A
 for <dri-devel@lists.freedesktop.org>; Wed, 16 Feb 2022 09:01:19 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: kholk11) with ESMTPSA id F30441F44EFC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1645002078;
 bh=X2RSF8nlGHgZC/av+xkMAvK6BU0k3B8IvR+gExmjA4I=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=C8Q1KBKzMbRAJstRnuuwEE6GSKnqrpORZb5qs3v0VsCcnVy3RmpQG6Mc5qWV/PzaA
 ANU3BbLYPooCRGhOelA/037Mij+ojH6F+mK+0QWYj03FoiXvL/nkwSmVIRjz6XJDJ+
 RQOSW4wPfP3UGMzz2SgGetDBdVb0SPfp202guea3GbS9952gSZ7okSVwoy51DK2vdP
 DDoHSWK2lpLRD9vHOX835RDSqO/e9DA2ATt7lDbeU/O1zHAGWY1WgXeTogUZxDqkCy
 2erbLZ6t2Ad1cwgN/CnmmKgsk6rnDCGVU0IIuMY22/9NFWc7oj3T5aMRq09dgtVZYT
 pZ9Lv7cjIOnKg==
Message-ID: <2cb4a1b6-1028-a1df-b7ff-9be7a57dd141@collabora.com>
Date: Wed, 16 Feb 2022 10:01:15 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.1
Subject: Re: [PATCH] drm/panfrost: Dynamically allocate pm_domains
Content-Language: en-US
To: Alyssa Rosenzweig <alyssa@collabora.com>, Rob Herring <robh@kernel.org>
References: <20220214203132.4722-1-alyssa.rosenzweig@collabora.com>
 <CAL_JsqKdb0_N252hR=iv3Lpi6T9+iCRBwzBQhS7UQGFNhM5k=A@mail.gmail.com>
 <Ygwp+LDliCnbkMZQ@maud>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <Ygwp+LDliCnbkMZQ@maud>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
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
Cc: Tomeu Vizoso <tomeu.vizoso@collabora.com>, David Airlie <airlied@linux.ie>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Steven Price <steven.price@arm.com>,
 Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Il 15/02/22 23:32, Alyssa Rosenzweig ha scritto:
>> I'd do the oneliner changing it to 5 and be done with it. That being
>> said, we have plenty of examples of doing this both ways, so whatever
>> makes people happy.
> 
> Excellent, that's the patch I wrote originally :-)
> 
> Dropping this patch, unless Angelo (or someone else) strongly objects.


Concretely measuring would be great, but I have no strong objections about
perhaps delaying this research to another (near or far) moment.
Let's drop this for now.
