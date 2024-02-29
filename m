Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1849586CC7D
	for <lists+dri-devel@lfdr.de>; Thu, 29 Feb 2024 16:12:08 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0FAD510E47B;
	Thu, 29 Feb 2024 15:12:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gtucker.io header.i=@gtucker.io header.b="lvMq4XJf";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mslow1.mail.gandi.net (mslow1.mail.gandi.net [217.70.178.240])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0820210E15B
 for <dri-devel@lists.freedesktop.org>; Thu, 29 Feb 2024 12:00:21 +0000 (UTC)
Received: from relay9-d.mail.gandi.net (unknown [217.70.183.199])
 by mslow1.mail.gandi.net (Postfix) with ESMTP id 39708C21E9
 for <dri-devel@lists.freedesktop.org>; Thu, 29 Feb 2024 11:53:46 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 66A0AFF802;
 Thu, 29 Feb 2024 11:53:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gtucker.io; s=gm1;
 t=1709207622;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=BaToIPDzXPunSHPMARHyvDeuyEwDr1/ZO+a/4iNtt4U=;
 b=lvMq4XJfkUm+hqYjnbZC8YybN52tAczd6MyvYXAmNWe1H+cCDijJ8iweHc9mMYwqRAp6pQ
 cVpAJS4mvNq9CbaMQClD5F+VPienkcvhhOr68EsSyt+KDmeO5ZPxnkSur7yYCQP1aVRo8J
 Hb5CtEBdDjHtmAJ9mMiY0X0ifSqaWRmnQl8ufw2zNFRSjGZ5INDE8810qo5lj1Jrb9Z2l2
 2j7+nMAAAp91ewPsVQmsQPnjyl9KYun0eDa0XPPh6lM+BBGUBjZLTcQJBdMeVqZMyZVe6R
 V7dFk74JbD1pcEUT1zA+IHVojyGc65UdG7/s7rJJ1/fHGE57DtHP/K64S9lr1A==
Message-ID: <b3fb89aa-56b4-4b3c-88f6-c6320bf5c489@gtucker.io>
Date: Thu, 29 Feb 2024 12:53:38 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/3] kci-gitlab: Introducing GitLab-CI Pipeline for Kernel
 Testing
To: Mark Brown <broonie@kernel.org>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Nikolai Kondrashov <spbnick@gmail.com>,
 Helen Koike <helen.koike@collabora.com>, linuxtv-ci@linuxtv.org,
 dave.pigott@collabora.com, mripard@kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-kselftest@vger.kernel.org,
 gustavo.padovan@collabora.com, pawiecz@collabora.com,
 tales.aparecida@gmail.com, workflows@vger.kernel.org,
 kernelci@lists.linux.dev, skhan@linuxfoundation.org,
 kunit-dev@googlegroups.com, nfraprado@collabora.com, davidgow@google.com,
 cocci@inria.fr, Julia.Lawall@inria.fr, laura.nao@collabora.com,
 ricardo.canuelo@collabora.com, kernel@collabora.com,
 torvalds@linuxfoundation.org, gregkh@linuxfoundation.org
References: <20240228225527.1052240-1-helen.koike@collabora.com>
 <20240228230725.GF1659@pendragon.ideasonboard.com>
 <0a5bf7d1-0a7e-4071-877a-a3d312d80084@gmail.com>
 <20240229093402.GA30889@pendragon.ideasonboard.com>
 <655f89fa-6ccb-4b54-adcd-69024b4a1e28@gmail.com>
 <20240229111919.GF30889@pendragon.ideasonboard.com>
 <a4fc23e1-5689-4f86-beb7-5b63a0d13359@sirena.org.uk>
Content-Language: en-GB
From: Guillaume Tucker <gtucker@gtucker.io>
Organization: gtucker.io
In-Reply-To: <a4fc23e1-5689-4f86-beb7-5b63a0d13359@sirena.org.uk>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-GND-Sasl: gtucker@gtucker.io
X-Mailman-Approved-At: Thu, 29 Feb 2024 15:12:01 +0000
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

On 29/02/2024 12:41, Mark Brown wrote:
> On Thu, Feb 29, 2024 at 01:19:19PM +0200, Laurent Pinchart wrote:
>> On Thu, Feb 29, 2024 at 01:10:16PM +0200, Nikolai Kondrashov wrote:
> 
>>> Of course. You're also welcome to join the #kernelci channel on libera.chat.
> 
>> Isn't that a bit pointless if it's no the main IM channel ?
> 
> It *was* the original channel and still gets some usage (mostly started
> by me admittedly since I've never joined slack for a bunch of reasons
> that make it hassle), IIRC the Slack was started because there were some
> interns who had trouble figuring out IRC and intermittent connectivity
> but people seem to have migrated.

In fact it was initially created for the members of the Linux
Foundation project only, which is why registration is moderated
for emails that don't have a domain linked to a member (BTW not
any Google account will just work e.g. @gmail.com is moderated,
only @google.com for Google employees isn't).

And yes IRC is the "least common denominator" chat platform.
Maybe having a bridge between the main Slack channel and IRC
would help.

Guillaume

