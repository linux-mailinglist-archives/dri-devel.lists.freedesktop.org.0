Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F01CB50391
	for <lists+dri-devel@lfdr.de>; Tue,  9 Sep 2025 19:00:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 45E7110E7BF;
	Tue,  9 Sep 2025 17:00:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=mailbox.org header.i=@mailbox.org header.b="M7PQYC0K";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout-p-202.mailbox.org (mout-p-202.mailbox.org [80.241.56.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6AF1B10E263;
 Tue,  9 Sep 2025 17:00:12 +0000 (UTC)
Received: from smtp2.mailbox.org (smtp2.mailbox.org
 [IPv6:2001:67c:2050:b231:465::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mout-p-202.mailbox.org (Postfix) with ESMTPS id 4cLqnP0cD7z9sqy;
 Tue,  9 Sep 2025 19:00:09 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org;
 s=mail20150812; t=1757437209;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=8C0W0SKWXcWn5s8zylmFoekpERTUlNapTG1su6iUWPE=;
 b=M7PQYC0KJ7ZTpsiCivEMtqWEYpZzwIu6qRgTil1nq6k2JZiuEJwhHQcrpfxtKnMsGEs/qv
 CuAOJ0YGCRXXuDy3Fwa29l+Dz1ClbvbDzgvV1tyqrz13mWEhn3c/xfEvjkrRCHzNxJO0s/
 J1pajVOoI+b6D2WlDyeqa+Fm9dLq8XXnozAhtThdMz+xBgx/N8EJzmzLAh54eOGMPh8iz3
 LHRe2Hbdwb30NHgHgg3ljHAzwRff95n3UQ27IjEjOAqJ47Z41Dl839SNzX19nUP43NqtD5
 nvW906emnD3uGZAbvkaWeGIpHz80vYygxZwc9JGhkUTFcVdG8AcOzATZTXJNgw==
Message-ID: <fc135a6e-fe79-4fc0-b3aa-c110cc3676eb@mailbox.org>
Date: Tue, 9 Sep 2025 19:00:04 +0200
MIME-Version: 1.0
Subject: Re: evergreen_packet3_check:... radeon 0000:1d:00.0: vbo resource
 seems too big for the bo
To: Alex Deucher <alexdeucher@gmail.com>, Borislav Petkov <bp@alien8.de>
Cc: amd-gfx@lists.freedesktop.org, Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <CADnq5_Oqonrth+5T-83dnFBZ67GvykkPt-9aUepJd+fUMwnupw@mail.gmail.com>
 <20250829194044.GCaLICPKJcGJRYdSfO@fat_crate.local>
 <20250829204840.GEaLISKGTwuScnDF8Y@fat_crate.local>
 <CADnq5_MbpYmC2PSyOr0gQk7F8mVz0-LG3dZtUZS2HhV8LTgDww@mail.gmail.com>
 <20250830174810.GAaLM5WkiFc2BtQ6kW@fat_crate.local>
 <51ae551b-6708-4fcd-84f9-fc1400f02427@mailbox.org>
 <20250901101011.GAaLVxA_Ax0R-Wy2IX@fat_crate.local>
 <2764782f-d411-4142-aa56-f1af0968ecd5@mailbox.org>
 <20250908180022.GHaL8Zto-PsVsPa0e0@fat_crate.local>
 <63b7c020-e589-4644-887e-3922af939009@mailbox.org>
 <20250909161648.GAaMBS8ERsvv3NbJoF@fat_crate.local>
 <CADnq5_MOazXJ4tUNa5uMdkWY7ZCu70M49yG00JsNHB-FO7XNvA@mail.gmail.com>
From: =?UTF-8?Q?Michel_D=C3=A4nzer?= <michel.daenzer@mailbox.org>
Content-Language: en-CA
In-Reply-To: <CADnq5_MOazXJ4tUNa5uMdkWY7ZCu70M49yG00JsNHB-FO7XNvA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-MBO-RS-ID: f727388cebe6545a786
X-MBO-RS-META: aibpfeh4fjwqfimh8zxpqmezdjpfjagx
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

On 09.09.25 18:21, Alex Deucher wrote:
> On Tue, Sep 9, 2025 at 12:17 PM Borislav Petkov <bp@alien8.de> wrote:
>> On Tue, Sep 09, 2025 at 10:43:47AM +0200, Michel Dänzer wrote:
>>> Then the developer needs to tell the user how to enable the debugging output
>>> and get it to them. That's pretty standard.
>>
>> *IF* the user even notices anything. As said earlier, it didn't cause any
>> anomalies on my machine besides flooding dmesg. Which I look at for obvious
>> reasons but users probably don't.
> 
> Right.  I think there needs to be something otherwise no one will notice at all.

I concede that in this specific case, dev_warn_once might be the best compromise.

(More to come in a follow-up to Alex's corresponding patch for the other similar log messages in this file)


-- 
Earthling Michel Dänzer       \        GNOME / Xwayland / Mesa developer
https://redhat.com             \               Libre software enthusiast
