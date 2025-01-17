Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6AA48A152E1
	for <lists+dri-devel@lfdr.de>; Fri, 17 Jan 2025 16:30:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AEAA610EB1A;
	Fri, 17 Jan 2025 15:30:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; secure) header.d=ffwll.ch header.i=@ffwll.ch header.b="Qc293F7C";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com
 [IPv6:2a00:1450:4864:20::436])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3931110EB1A
 for <dri-devel@lists.freedesktop.org>; Fri, 17 Jan 2025 15:30:07 +0000 (UTC)
Received: by mail-wr1-x436.google.com with SMTP id
 ffacd0b85a97d-38a88ba968aso2079036f8f.3
 for <dri-devel@lists.freedesktop.org>; Fri, 17 Jan 2025 07:30:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google; t=1737127805; x=1737732605; darn=lists.freedesktop.org; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=PMN0xxHnTn7/r6lyp4MJCux5tDpWjt3j/fmoD58AMqk=;
 b=Qc293F7C+dYSpps3B21p37tsIGY9VA0yDi2Am0ASLEuwJQBJ1hH5H64GCEcENyFhqL
 iuSBr0dWsERODiERrOK2hRmoAbBM96tk3gqoHBmHawKLOee+88DLcYNGhTccKrHPUixm
 23iV4Ij+pbdICaMgKApp5+nqFkxFDlxjf4TGs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1737127805; x=1737732605;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=PMN0xxHnTn7/r6lyp4MJCux5tDpWjt3j/fmoD58AMqk=;
 b=g+OhGDFzBtP2ZJWjS460UqPhii9dMtHe4wgqZSXbRPPAL151g1F1IeKfTgQCZCaIKS
 CbkxcLiyUK9ysqyxsN2p+bziUZRRd83uc5B4D592w8vheRaQglrSoPhaACiHYvGEf641
 sw0B/cPNzrXM9lqwTImLoxqrv8yahGPe0jwMG6O1z2NPSdiMCQBE6CiRIOPL/T1DvWhH
 g01TANn+1Spereg+QxazihBtNqVAW414ALk2MrWU2S18G1PONa4ENC4AHJ+PAz7DIcrA
 3mcenApRsw735v7ZcYW32+g3QwlE4RlMq6GYcE0GbdvOXzy9QXG7biY9pfwWz1EQaaP9
 oZsw==
X-Forwarded-Encrypted: i=1;
 AJvYcCV+6RiaDaLX4tKmdc5xE4uIWrXO5X0YUd6EP91l6wmtikJ7dDWA9l8wf9UUmxj+G9eIVBtacbPXqRo=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yxsfm45OhGl8AZHOFlsacv5MwZfXECVDZITCRFKJJW8UumYMBnb
 /18TQU2SUcenscuyXdsEryX1SJpqNAGss2JN29RP2yOvDvotpskaI5Rq5tlZ5cY=
X-Gm-Gg: ASbGncth3Nuxi452jGJ27OWIxaMfK2gH7EllSM5MClOmuJty0HHsPXFUd7mqQv6mgk6
 Kq38eyhV7tOnZ85KQnfQPa3ZY6fTXr2hB2DCscC3xPjfxmgHs2ptgwh5cg3AuLikA+eT0CfFGPk
 R4OD0T0MWK+kTgEMSWFIQTiHwQY8xl7DCStiFR8A/5jEc/xUl2yTD1pXmkYw0jWRffsq5RwKw0B
 F1Vt9afLQT+d38BvS7nOILqeB57CwqlVGauU5I030EsTUm5c9/dTncwrC9vUKZwIZNK
X-Google-Smtp-Source: AGHT+IERWF8sIS1dMqT5AGGWertem30EsWZljTh6nQHb58gskcBklmaUmoaA8cvAXYwGl9KdHnRWXA==
X-Received: by 2002:a05:6000:1f8d:b0:385:d7f9:f157 with SMTP id
 ffacd0b85a97d-38bf57a749dmr3470574f8f.36.1737127805618; 
 Fri, 17 Jan 2025 07:30:05 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:5485:d4b2:c087:b497])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-38bf3221b7fsm2764368f8f.27.2025.01.17.07.30.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 17 Jan 2025 07:30:05 -0800 (PST)
Date: Fri, 17 Jan 2025 16:30:03 +0100
From: Simona Vetter <simona.vetter@ffwll.ch>
To: "Deucher, Alexander" <Alexander.Deucher@amd.com>
Cc: "stable@vger.kernel.org" <stable@vger.kernel.org>,
 "stable-commits@vger.kernel.org" <stable-commits@vger.kernel.org>,
 "oushixiong@kylinos.cn" <oushixiong@kylinos.cn>,
 "Koenig, Christian" <Christian.Koenig@amd.com>,
 "Pan, Xinhui" <Xinhui.Pan@amd.com>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 DRI Development <dri-devel@lists.freedesktop.org>
Subject: Re: Patch "drm/radeon: Delay Connector detecting when HPD singals is
 unstable" has been added to the 6.6-stable tree
Message-ID: <Z4p3e44qS7uP2Y_Q@phenom.ffwll.local>
References: <20250103004210.471570-1-sashal@kernel.org>
 <BL1PR12MB5144226AD0D6697DBF25ED56F7122@BL1PR12MB5144.namprd12.prod.outlook.com>
 <Z4pzIzRg2xpYv2mJ@phenom.ffwll.local>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Z4pzIzRg2xpYv2mJ@phenom.ffwll.local>
X-Operating-System: Linux phenom 6.12.3-amd64 
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

On Fri, Jan 17, 2025 at 04:11:31PM +0100, Simona Vetter wrote:
> On Wed, Jan 08, 2025 at 12:02:03AM +0000, Deucher, Alexander wrote:
> > [Public]
> > 
> > > -----Original Message-----
> > > From: Sasha Levin <sashal@kernel.org>
> > > Sent: Thursday, January 2, 2025 7:42 PM
> > > To: stable-commits@vger.kernel.org; oushixiong@kylinos.cn
> > > Cc: Deucher, Alexander <Alexander.Deucher@amd.com>; Koenig, Christian
> > > <Christian.Koenig@amd.com>; Pan, Xinhui <Xinhui.Pan@amd.com>; David Airlie
> > > <airlied@gmail.com>; Simona Vetter <simona@ffwll.ch>
> > > Subject: Patch "drm/radeon: Delay Connector detecting when HPD singals is
> > > unstable" has been added to the 6.6-stable tree
> > >
> > > This is a note to let you know that I've just added the patch titled
> > >
> > >     drm/radeon: Delay Connector detecting when HPD singals is unstable
> > >
> > > to the 6.6-stable tree which can be found at:
> > >     http://www.kernel.org/git/?p=linux/kernel/git/stable/stable-queue.git;a=summary
> > >
> > > The filename of the patch is:
> > >      drm-radeon-delay-connector-detecting-when-hpd-singal.patch
> > > and it can be found in the queue-6.6 subdirectory.
> > >
> > > If you, or anyone else, feels it should not be added to the stable tree, please let
> > > <stable@vger.kernel.org> know about it.
> > >
> > >
> > >
> > > commit 20430c3e75a06c4736598de02404f768653d953a
> > > Author: Shixiong Ou <oushixiong@kylinos.cn>
> > > Date:   Thu May 9 16:57:58 2024 +0800
> > >
> > >     drm/radeon: Delay Connector detecting when HPD singals is unstable
> > >
> > >     [ Upstream commit 949658cb9b69ab9d22a42a662b2fdc7085689ed8 ]
> > >
> > >     In some causes, HPD signals will jitter when plugging in
> > >     or unplugging HDMI.
> > >
> > >     Rescheduling the hotplug work for a second when EDID may still be
> > >     readable but HDP is disconnected, and fixes this issue.
> > >
> > >     Signed-off-by: Shixiong Ou <oushixiong@kylinos.cn>
> > >     Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
> > >     Stable-dep-of: 979bfe291b5b ("Revert "drm/radeon: Delay Connector detecting
> > > when HPD singals is unstable"")
> > 
> > 
> > Please drop both of these patches.  There is no need to pull back a
> > patch just so that you can apply the revert.
> 
> Since we've just been discussing stable backports at length, how did this
> one happen?
> 
> 949658cb9b69ab9d22a42a662b2fdc7085689ed8 is in v6.11 and 979bfe291b5b in
> v6.13-rc1, so there's definitely a need to backport the latter to v6.11.y
> and v6.12.y. And maybe there was a cherry-pick of 949658cb9b69ab9d22a42a66
> to older stable releases already, but that doesn't seem to be the case. So
> what happened here?

Some other examples people brought up:

https://lore.kernel.org/stable/a31d3d49-1861-19a2-2bb4-8793c8eabee9@mailbox.org/

https://lore.kernel.org/stable/a31d3d49-1861-19a2-2bb4-8793c8eabee9@mailbox.org/

-Sima
-- 
Simona Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
