Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6AAD85AA31C
	for <lists+dri-devel@lfdr.de>; Fri,  2 Sep 2022 00:33:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1C04510E33B;
	Thu,  1 Sep 2022 22:33:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx1.riseup.net (mx1.riseup.net [198.252.153.129])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9826510E33B
 for <dri-devel@lists.freedesktop.org>; Thu,  1 Sep 2022 22:33:29 +0000 (UTC)
Received: from fews1.riseup.net (fews1-pn.riseup.net [10.0.1.83])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256
 client-signature RSA-PSS (2048 bits) client-digest SHA256)
 (Client CN "mail.riseup.net", Issuer "R3" (not verified))
 by mx1.riseup.net (Postfix) with ESMTPS id 4MJbRX4RfqzDqTD;
 Thu,  1 Sep 2022 22:33:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=riseup.net; s=squak;
 t=1662071609; bh=vFOW28U7e2tmiwu+hjUzu0rmnJAQnKcUXDY+PUL93FA=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=bjL2tfuvdZwU5me4+LwChwaZ4tR3xFknXrbL8wlri/Yu5A4d0tYsX/jLRPRRsWeYL
 +uoiLRPVbiRn5TeD40hxN1K/IQhbYe715525dnHUhz1gSc2HKFCqAepCBa0Kpzgree
 9DvN7ZvPaT2oV58dcBXUKFUO2PhFL8kyeucLyoPg=
X-Riseup-User-ID: 1041B213356A975CFCF07C5A2FA5585F2A3B2C49FBA60EE30A8D0728AC31891F
Received: from [127.0.0.1] (localhost [127.0.0.1])
 by fews1.riseup.net (Postfix) with ESMTPSA id 4MJbRP4PJgz5vXJ;
 Thu,  1 Sep 2022 22:33:20 +0000 (UTC)
Message-ID: <04aeba53-793c-3196-3137-915f0640dc2a@riseup.net>
Date: Thu, 1 Sep 2022 19:33:18 -0300
MIME-Version: 1.0
Subject: Re: [PATCH v2 2/2] drm/tests: Change "igt_" prefix to "test_drm_"
Content-Language: en-US
To: Maxime Ripard <maxime@cerno.tech>
References: <20220901124210.591994-1-mairacanal@riseup.net>
 <20220901124210.591994-2-mairacanal@riseup.net>
 <20220901125530.b56s4zisnkfuigvc@houat>
From: =?UTF-8?Q?Ma=c3=adra_Canal?= <mairacanal@riseup.net>
In-Reply-To: <20220901125530.b56s4zisnkfuigvc@houat>
Content-Type: text/plain; charset=UTF-8
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
Cc: michal.winiarski@intel.com, David Gow <davidgow@google.com>,
 siqueirajordao@riseup.net, magalilemes00@gmail.com,
 David Airlie <airlied@linux.ie>, tales.aparecida@gmail.com,
 Arthur Grillo <arthur.grillo@usp.br>, brendanhiggins@google.com,
 Javier Martinez Canillas <javierm@redhat.com>, linux-kernel@vger.kernel.org,
 mwen@igalia.com, dri-devel@lists.freedesktop.org, kunit-dev@googlegroups.com,
 =?UTF-8?B?Sm9zw6kgRXhww7NzaXRv?= <jose.exposito89@gmail.com>,
 Isabella Basso <isabbasso@riseup.net>, andrealmeid@riseup.net
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Maxime,

On 9/1/22 09:55, Maxime Ripard wrote:
> Hi,
> 
> On Thu, Sep 01, 2022 at 09:42:10AM -0300, Maíra Canal wrote:
>> With the introduction of KUnit, IGT is no longer the only option to run
>> the DRM unit tests, as the tests can be run through kunit-tool or on
>> real hardware with CONFIG_KUNIT.
>>
>> Therefore, remove the "igt_" prefix from the tests and replace it with
>> the "test_drm_" prefix, making the tests' names independent from the tool
>> used.
>>
>> Signed-off-by: Maíra Canal <mairacanal@riseup.net>
>>
>> ---
>> v1 -> v2: https://lore.kernel.org/dri-devel/20220830211603.191734-1-mairacanal@riseup.net/
>> - Change "drm_" prefix to "test_drm_", as "drm_" can be a bit confusing (Jani Nikula).
> 
> I appreciate it's a bit of a bikeshed but I disagree with this. The
> majority of the kunit tests already out there start with the framework
> name, including *all* the examples in the kunit doc. Plus, it's fairly
> obvious that it's a test, kunit is only about running tests in the first
> place.

Would it be better to keep it as "drm_"?

Currently, I don't think it is appropriate to hold the "igt_" prefix, as
the tests are not IGT exclusive, but I don't have a strong opinion on
using the "drm_" or the "test_drm" prefixes.

Best Regards,
- Maíra Canal

> 
> Maxime
> 
