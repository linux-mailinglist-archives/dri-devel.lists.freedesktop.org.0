Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4553A6EE055
	for <lists+dri-devel@lfdr.de>; Tue, 25 Apr 2023 12:27:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CC4D810E6EF;
	Tue, 25 Apr 2023 10:27:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 68432 seconds by postgrey-1.36 at gabe;
 Tue, 25 Apr 2023 10:27:43 UTC
Received: from mout-p-102.mailbox.org (mout-p-102.mailbox.org [80.241.56.152])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DABF810E25F;
 Tue, 25 Apr 2023 10:27:43 +0000 (UTC)
Received: from smtp202.mailbox.org (smtp202.mailbox.org [10.196.197.202])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-384) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mout-p-102.mailbox.org (Postfix) with ESMTPS id 4Q5J966X28z9sjC;
 Tue, 25 Apr 2023 12:27:38 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org;
 s=mail20150812; t=1682418458;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=AzoOwKMdJiLKK3BSiCIwb6001/mIm7hyJsaLnt4CuOY=;
 b=gcckeR9ypTnpx8tyY5QCL0wq+wig31N845d0UcpgHbiaBysK4rFUe7QTKjgoOtzw1yVQ9q
 olCCPx4pt5kj2OjdDr++5kP2lbKTA+FYGmlnG2iKIMxCqG35wvvyZpq5phrD6Cxl4yocRY
 LmCfwgcbto4PAo+Y+Le1GYzh8f/3BiYcoljJjTFHOIw/d5tZ6vpsMPwwSdi1gEJa/Ib3On
 CPHZY0jOb8D5GDUaneWnMb1ZBU8kDWZ6mMsjAEKHYV6EmaCNAdtDJ4qXGIo0GkrKn0qiiW
 mdhcfwqZbywi1z+Q6+4ZrmVSsXBerBKQ4d6jj+FwVX+LmTuyvY/gfLCH8tpCbw==
Message-ID: <784561bb-0937-befc-3774-892d6f6a4318@mailbox.org>
Date: Tue, 25 Apr 2023 12:27:37 +0200
MIME-Version: 1.0
Subject: Re: [PATCH] drm/amdgpu: Mark contexts guilty for any reset type
Content-Language: de-CH-frami, en-CA
To: =?UTF-8?B?TWFyZWsgT2zFocOhaw==?= <maraeo@gmail.com>,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
References: <20230424014324.218531-1-andrealmeid@igalia.com>
 <d7264c5a-29b4-0fb3-153b-673a8a73d635@amd.com>
 <CAAxE2A6Soq28ACV-m1OzG8CA-_VWp+N2wapsABzm2Nda=Qe+yA@mail.gmail.com>
From: =?UTF-8?Q?Michel_D=c3=a4nzer?= <michel.daenzer@mailbox.org>
In-Reply-To: <CAAxE2A6Soq28ACV-m1OzG8CA-_VWp+N2wapsABzm2Nda=Qe+yA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-MBO-RS-ID: e4acb3074d567e8fc3c
X-MBO-RS-META: qakb7pkk8zexswyiqwxbcthy4cfcgjgp
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
Cc: Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>,
 =?UTF-8?Q?Andr=c3=a9_Almeida?= <andrealmeid@igalia.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>, "Tuikov,
 Luben" <Luben.Tuikov@amd.com>,
 amd-gfx mailing list <amd-gfx@lists.freedesktop.org>, kernel-dev@igalia.com,
 "Deucher, Alexander" <alexander.deucher@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 4/24/23 18:45, Marek Olšák wrote:
> Soft resets are fatal just as hard resets, but no reset is "always fatal". There are cases when apps keep working depending on which features are being used. It's still unsafe.

Agreed, in theory.

In practice, from a user PoV, right now there's pretty much 0 chance of the user session surviving if the GPU context in certain critical processes (e.g. the Wayland compositor or Xwayland) hits a fatal reset. There's a > 0 chance of it surviving after a soft reset. There's ongoing work towards making user-space components more robust against fatal resets, but it's taking time. Meanwhile, I suspect most users would take the > 0 chance.


-- 
Earthling Michel Dänzer            |                  https://redhat.com
Libre software enthusiast          |         Mesa and Xwayland developer

