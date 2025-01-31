Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C514A23E18
	for <lists+dri-devel@lfdr.de>; Fri, 31 Jan 2025 14:02:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F34AC10EAAA;
	Fri, 31 Jan 2025 13:02:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="Y4KKhUGL";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net
 [217.70.183.198])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 60F9410EAA7
 for <dri-devel@lists.freedesktop.org>; Fri, 31 Jan 2025 13:02:19 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id B82E14426E;
 Fri, 31 Jan 2025 13:02:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1738328538;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=+kwLBBAKHwJScVqX5D1od3kUCloHeVAnZHLlm04sT2g=;
 b=Y4KKhUGLCwXU0ABQLBZThvOq6BCwbcDbX4a0O/V4To90dJCzQgQ9SaGSSeEGjx39cyM9xu
 PWRi/uehJD9C7NzKqBMLblppKa1Dvge82TN4RUHzQcLeHkWChKHM/DSvrQ8ey8tuw0jK6j
 fuXXgqtE73uIsQRK8gSWkjyPJcAQUtgGjoEjfWNthklzS3mxp5B5ADzEB/Lmhi43hARbnE
 Jk/vsYSl+h2khKTWeJLOPxkC29Kuqz/AwdsZdX+D2hDKue1r25W4BX8quLyLoB1MPUYPqx
 hpHR4iQEtmuiHJ1h9scyWtXKFhXie2uDqMzu+fjir1LLIBV2CZ/C76/QTEMgZA==
Date: Fri, 31 Jan 2025 14:02:14 +0100
From: Louis Chauvet <louis.chauvet@bootlin.com>
To: =?iso-8859-1?Q?Jos=E9_Exp=F3sito?= <jose.exposito89@gmail.com>
Cc: airlied@gmail.com, arthurgrillo@riseup.net, corbet@lwn.net,
 dri-devel@lists.freedesktop.org, hamohammed.sa@gmail.com,
 jeremie.dautheribes@bootlin.com, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, maarten.lankhorst@linux.intel.com,
 mairacanal@riseup.net, marcheu@google.com, melissa.srw@gmail.com,
 miquel.raynal@bootlin.com, mripard@kernel.org,
 nicolejadeyee@google.com, pekka.paalanen@haloniitty.fi,
 rdunlap@infradead.org, rodrigosiqueiramelo@gmail.com,
 seanpaul@google.com, simona.vetter@ffwll.ch, simona@ffwll.ch,
 thomas.petazzoni@bootlin.com, tzimmermann@suse.de
Subject: Re: [PATCH v16 3/7] drm/vkms: Drop YUV formats TODO
Message-ID: <Z5zJ1h91AINbQRVF@louis-chauvet-laptop>
Mail-Followup-To: =?iso-8859-1?Q?Jos=E9_Exp=F3sito?=
 <jose.exposito89@gmail.com>, 
 airlied@gmail.com, arthurgrillo@riseup.net, corbet@lwn.net,
 dri-devel@lists.freedesktop.org, hamohammed.sa@gmail.com,
 jeremie.dautheribes@bootlin.com, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, maarten.lankhorst@linux.intel.com,
 mairacanal@riseup.net, marcheu@google.com, melissa.srw@gmail.com,
 miquel.raynal@bootlin.com, mripard@kernel.org,
 nicolejadeyee@google.com, pekka.paalanen@haloniitty.fi,
 rdunlap@infradead.org, rodrigosiqueiramelo@gmail.com,
 seanpaul@google.com, simona.vetter@ffwll.ch, simona@ffwll.ch,
 thomas.petazzoni@bootlin.com, tzimmermann@suse.de
References: <20250121-yuv-v16-3-a61f95a99432@bootlin.com>
 <20250131084045.2874-1-jose.exposito89@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250131084045.2874-1-jose.exposito89@gmail.com>
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgdekkeegucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpeffhffvvefukfhfgggtugfgjgesthekredttddtjeenucfhrhhomhepnfhouhhishcuvehhrghuvhgvthcuoehlohhuihhsrdgthhgruhhvvghtsegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpedufeehgfefieeileeukeetfeduvdeiffeuhfdvleevfeefveelueduleeftdejteenucffohhmrghinhepkhgvrhhnvghlrdhorhhgnecukfhppeeltddrkeelrdduieefrdduvdejnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepledtrdekledrudeifedruddvjedphhgvlhhopehlohhuihhsqdgthhgruhhvvghtqdhlrghpthhophdpmhgrihhlfhhrohhmpehlohhuihhsrdgthhgruhhvvghtsegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopedvgedprhgtphhtthhopehjohhsvgdrvgigphhoshhithhokeelsehgmhgrihhlrdgtohhmpdhrtghpthhtoheprghirhhlihgvugesghhmrghilhdrtghomhdprhgtphhtthhopegrrhhthhhurhhgrhhilhhlohesrhhishgvuhhprdhnvghtpdhrtghpthhtoheptghorhgsvghtsehlfihnrdhnvghtpdhrtghpthhtohepughri
 hdquggvvhgvlheslhhishhtshdrfhhrvggvuggvshhkthhophdrohhrghdprhgtphhtthhopehhrghmohhhrghmmhgvugdrshgrsehgmhgrihhlrdgtohhmpdhrtghpthhtohepjhgvrhgvmhhivgdruggruhhthhgvrhhisggvshessghoohhtlhhinhdrtghomhdprhgtphhtthhopehlihhnuhigqdguohgtsehvghgvrhdrkhgvrhhnvghlrdhorhhg
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

On 31/01/25 - 09:40, José Expósito wrote:
> Hi Louis,
> 
> Thanks a lot for the patches.
> 
> I'm not well versed in YUV color formats, so I did my best reading the kernel
> documentation before reviewing this series... But I'll most likely ask some
> basic/dump questions.
> 
> > From: Arthur Grillo <arthurgrillo@riseup.net>
> > 
> > VKMS has support for YUV formats now. Remove the task from the TODO
> > list.
> > 
> > Signed-off-by: Arthur Grillo <arthurgrillo@riseup.net>
> > Signed-off-by: Louis Chauvet <louis.chauvet@bootlin.com>
> > ---
> >  Documentation/gpu/vkms.rst | 3 +--
> >  1 file changed, 1 insertion(+), 2 deletions(-)
> > 
> > diff --git a/Documentation/gpu/vkms.rst b/Documentation/gpu/vkms.rst
> > index ba04ac7c2167a9d484c54c69a09a2fb8f2d9c0aa..13b866c3617cd44043406252d3caa912c931772f 100644
> > --- a/Documentation/gpu/vkms.rst
> > +++ b/Documentation/gpu/vkms.rst
> > @@ -122,8 +122,7 @@ There's lots of plane features we could add support for:
> >  
> >  - Scaling.
> >  
> > -- Additional buffer formats, especially YUV formats for video like NV12.
> > -  Low/high bpp RGB formats would also be interesting.
> > +- Additional buffer formats. Low/high bpp RGB formats would be interesting.
> 
> I see that you implemented support for 6 DRM_FORMAT_NV* formats, but
> DRM_FORMAT_NV15, DRM_FORMAT_NV20 and DRM_FORMAT_NV30 are not implemented.
> 
> The same applies to DRM_FORMAT_Y210 or DRM_FORMAT_YUV410 among others.
> 
> Could it be useful to implement all of them in the future? If so, should we add
> it to the ToDo list?

I don't think we need "all of them" (there are ≈100 + all the modifiers), 
but definitly all the commonly used ones (I have some of the "common" one 
ready here [1], I just wait for the YUV series to be accepted to avoid 
conflicts).

> It might be a great task to get started in kernel development, as there are
> already similar examples and tests.

I don't think we need to specify which format are missing, the point 
"Additionnal buffer formats. [...]" seems sufficient. If you think this is 
relevant, I can add "Easy task" so beginners will find it easier?
 
[1]:https://lore.kernel.org/all/20241122-b4-new-color-formats-v3-0-23f7776197c9@bootlin.com/

> >  
> >  - Async updates (currently only possible on cursor plane using the legacy
> >    cursor api).
> > 
