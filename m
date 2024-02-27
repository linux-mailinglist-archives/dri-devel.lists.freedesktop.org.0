Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4BA8A8699AB
	for <lists+dri-devel@lfdr.de>; Tue, 27 Feb 2024 16:02:34 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0AFE810E905;
	Tue, 27 Feb 2024 15:02:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="RrfO2EL7";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net
 [217.70.183.199])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0EC9510E7E0
 for <dri-devel@lists.freedesktop.org>; Tue, 27 Feb 2024 15:02:15 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 76F63FF80E;
 Tue, 27 Feb 2024 15:02:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1709046134;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=JNtXj8btr6ZXcKUJn2VlnNEyAxe3orLsIqZIYppH3/k=;
 b=RrfO2EL76ErJEz4mcELQOUW9PBv8nvs2QhLqMC5NU3tH8ikZcoaDNfmei8rmLfJDqFR2c7
 lkuM5n5CABHegTvPTs+hvgUyk6H8wKSylR6ZBv3AV/a5DYpqBKDozmnmP1SnBavr2DG7xJ
 3fHCcNYPVUeXzjfn5OAEKYTqGQzbG3l94+TLIaRKY3q9OSn5ND3piP882T/V1nzK8qUA+4
 Czx6J5yH3xg+L2GHC+MtpogwUPScm9qhpJ8biQr/DnhbnsE1YA9mtKPTjehLfDSCuFDUC+
 CXFnB6lKA6pfgpFqk+qbKYpy022Aiwy1jZNnr2pUkQPB/f07NbCNFtdHJfLkaA==
Date: Tue, 27 Feb 2024 16:02:11 +0100
From: Louis Chauvet <louis.chauvet@bootlin.com>
To: Pekka Paalanen <pekka.paalanen@collabora.com>
Cc: Arthur Grillo <arthurgrillo@riseup.net>,
 Rodrigo Siqueira <rodrigosiqueiramelo@gmail.com>,
 Melissa Wen <melissa.srw@gmail.com>,
 =?iso-8859-1?Q?Ma=EDra?= Canal <mairacanal@riseup.net>,
 Haneen Mohammed <hamohammed.sa@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Jonathan Corbet <corbet@lwn.net>,
 dri-devel@lists.freedesktop.org, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH] drm/vkms: Add information on how to benchmark
Message-ID: <Zd35c5TLS6ygc_Pr@localhost.localdomain>
Mail-Followup-To: Pekka Paalanen <pekka.paalanen@collabora.com>,
 Arthur Grillo <arthurgrillo@riseup.net>,
 Rodrigo Siqueira <rodrigosiqueiramelo@gmail.com>,
 Melissa Wen <melissa.srw@gmail.com>,
 =?iso-8859-1?Q?Ma=EDra?= Canal <mairacanal@riseup.net>,
 Haneen Mohammed <hamohammed.sa@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Jonathan Corbet <corbet@lwn.net>,
 dri-devel@lists.freedesktop.org, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20240226-bench-vkms-v1-1-515ef91b11c8@riseup.net>
 <20240227111941.061a2892.pekka.paalanen@collabora.com>
 <8ac7bf91-fbce-4403-a801-9dfee39ea802@riseup.net>
 <20240227135545.62dd5f57.pekka.paalanen@collabora.com>
 <0892593d-0fd9-4381-b2bd-843627bd2723@riseup.net>
 <20240227152639.6426c401.pekka.paalanen@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240227152639.6426c401.pekka.paalanen@collabora.com>
X-GND-Sasl: louis.chauvet@bootlin.com
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

Le 27/02/24 - 15:26, Pekka Paalanen a écrit :
> On Tue, 27 Feb 2024 09:29:58 -0300
> Arthur Grillo <arthurgrillo@riseup.net> wrote:
> 
> > On 27/02/24 08:55, Pekka Paalanen wrote:
> > > On Tue, 27 Feb 2024 08:44:52 -0300
> > > Arthur Grillo <arthurgrillo@riseup.net> wrote:
> > >   
> > >> On 27/02/24 06:19, Pekka Paalanen wrote:  
> > >>> On Mon, 26 Feb 2024 17:42:11 -0300
> > >>> Arthur Grillo <arthurgrillo@riseup.net> wrote:
> > >>>     
> > >>>> Now that we have a defined benchmark for testing the driver, add
> > >>>> documentation on how to run it.
> > >>>>
> > >>>> Signed-off-by: Arthur Grillo <arthurgrillo@riseup.net>
> > >>>> ---
> > >>>>  Documentation/gpu/vkms.rst | 6 ++++++
> > >>>>  1 file changed, 6 insertions(+)
> > >>>>
> > >>>> diff --git a/Documentation/gpu/vkms.rst b/Documentation/gpu/vkms.rst
> > >>>> index ba04ac7c2167..6d07f79f77ff 100644
> > >>>> --- a/Documentation/gpu/vkms.rst
> > >>>> +++ b/Documentation/gpu/vkms.rst
> > >>>> @@ -89,6 +89,12 @@ You can also run subtests if you do not want to run the entire test::
> > >>>>    sudo ./build/tests/kms_flip --run-subtest basic-plain-flip --device "sys:/sys/devices/platform/vkms"
> > >>>>    sudo IGT_DEVICE="sys:/sys/devices/platform/vkms" ./build/tests/kms_flip --run-subtest basic-plain-flip
> > >>>>  
> > >>>> +If you are developing features that may affect performance, you can run the kms_fb_stress    
> > >>>
> > >>> s/can/must/
> > >>>     
> > >>>> +benchmark::    
> > >>>
> > >>> before and after, and report the numbers.    
> > >>
> > >> Did you mean to write the benchmarks logs here?  
> > > 
> > > I mean people should be required tell their before and after numbers in
> > > either commit message (my preference) or in series cover letter (if
> > > benchmarking commits is not useful).
> > > 
> > > With the addition of YUV support in VKMS, maybe the benchmark needs to  
> > 
> > With the upcoming addition, I've sent a patch to arbitrarily change the
> > formats on the benchmark via command-line options. It's not adding a new
> > case, but maybe just this could already help.
> > 
> > https://lore.kernel.org/all/20240226-kms_fb_stress-dev-v1-0-1c14942b1244@riseup.net/
> 
> In that case you would need to document exactly what command line
> options to use, and ask people to report the numbers of each test
> case.
> 
> That works. Alternatively or additionally, the test cases could be
> built in to the benchmark, and it just reports numbers for all of them
> in a single invocation. Then people running the standard benchmark do
> not need to worry about getting the command line options right, or
> running multiple cases. And reviewers do not need to ask to re-run with
> the correct options.
> 
> I suppose rotations might get added, too.
> 
> Or maybe you'd provide a script that covers all the standard
> performance test cases?

I agree with Pekka, it would be nice to have a simple "bench everything" 
tool. Like kms_rotation is a test for all rotations, kms_plane for color 
conversions... kms_fb_test can run a few combinations (rgb+norotation, 
rgb+yuv, rgb+rotation...) and report a "global result" (this way it's easy 
to spot a regression not related directly to your changes).

I don't know the IGT benchmark API, but I think there is a way to create 
"sub-benchmarks" so you can run a specific benchmark when developping and 
the whole thing before pushing your series.

Kind regards,
Louis Chauvet

> 
> Thanks,
> pq
> 
> > > start printing YUV numbers separately as a new case.
> > > 
> > > 
> > > Thanks,
> > > pq
> > >   
> > >>  
> > >>>     
> > >>>> +
> > >>>> +  sudo ./build/benchmarks/kms_fb_stress --device "sys:/sys/devices/platform/vkms"
> > >>>> +  sudo IGT_DEVICE="sys:/sys/devices/platform/vkms" ./build/benchmarks/kms_fb_stress    
> > >>>
> > >>> Do people need to run both commands?    
> > >>
> > >> No, they don't, just two options.
> > >>
> > >> Best Regards,
> > >> ~Arthur Grillo
> > >>  
> > >>>
> > >>> Anyway, a good idea.
> > >>>
> > >>> Acked-by: Pekka Paalanen <pekka.paalanen@collabora.com>
> > >>>
> > >>>
> > >>> Thanks,
> > >>> pq
> > >>>     
> > >>>> +
> > >>>>  TODO
> > >>>>  ====
> > >>>>  
> > >>>>
> > >>>> ---
> > >>>> base-commit: eeb8e8d9f124f279e80ae679f4ba6e822ce4f95f
> > >>>> change-id: 20240226-bench-vkms-5b8b7aab255e
> > >>>>
> > >>>> Best regards,    
> > >>>     
> > >   
> 



-- 
Louis Chauvet, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
