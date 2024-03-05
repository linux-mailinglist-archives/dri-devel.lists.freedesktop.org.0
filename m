Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C701872643
	for <lists+dri-devel@lfdr.de>; Tue,  5 Mar 2024 19:08:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DFE52112C1B;
	Tue,  5 Mar 2024 18:08:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=marliere.net header.i=@marliere.net header.b="bs/DfrmL";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com
 [209.85.210.171])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5791A112C1B;
 Tue,  5 Mar 2024 18:08:10 +0000 (UTC)
Received: by mail-pf1-f171.google.com with SMTP id
 d2e1a72fcca58-6e5d7f1f25fso2613721b3a.0; 
 Tue, 05 Mar 2024 10:08:10 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1709662090; x=1710266890;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:dkim-signature:date:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=x5whaAzOMVpJ9oleSNFRgGIgTqWcKl3NhWO0NiuDErg=;
 b=uSe8YEseQNGrAa1Up4uSwj9ShEfvthhQswmvxHt+xrIzm7Wm8aIVt1SmDBezyxyag4
 J70ZpBFrKOZb9g+7lkOllRUaYGzeBHsMciMzqXfmQ3baQ2yMfSEYWHPVox8+xBMBOzg3
 dJwjD/dD9o91dVXU9dJiWSFkrWlz5l7i2fRKlmWCWqpxJU7XZbvJ2m0HEZjzkyo1htsn
 zvjQX/JTMXpj3iqsZzSag3EzNHWhDgOmsZrYOoa66zqZSBc+Ju65ta+hzUfUes69uTnp
 pByGmhLNhmYShgWlGT29XZGbLxppSoCbeU2JgQjVss4apsIHbbPM/ZxQ9JTz6g48l7AJ
 pA2Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCV1+Kiru4wXvbsZP9sBaaPXcb4znQib13PngeEoaqCgSxW1T9XCPOykzki5t0PU7ytb71IgjaHtoTK2ttSsmmeP/M5pDOjAkSOarKKD3PTCxmL/hQ/YYH1o8mXb8e6gd3h7mKiIFiErM0vxSvrOdg==
X-Gm-Message-State: AOJu0Yz1Tf4jN9mQN1O4Qr5IyQ/2jbaxJ09LO5oPZePUAmFG9kq4pF4e
 IcWCe4Bh70+n7AqP/H1VMyfCrjUEM+vF2KvUT84rqo35c3g/pz6Z
X-Google-Smtp-Source: AGHT+IHsBuJZigH06x0TIQSPMWS5CzB5BE8Lix9SJIw0WAHEauJC2Yg3UCxAysG+IWH+PtEQGVWj8w==
X-Received: by 2002:a05:6a00:2d20:b0:6e6:1822:1315 with SMTP id
 fa32-20020a056a002d2000b006e618221315mr7585099pfb.23.1709662088686; 
 Tue, 05 Mar 2024 10:08:08 -0800 (PST)
Received: from mail.marliere.net ([24.199.118.162])
 by smtp.gmail.com with ESMTPSA id
 jw37-20020a056a0092a500b006e621e75cffsm3796044pfb.83.2024.03.05.10.08.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 05 Mar 2024 10:08:08 -0800 (PST)
Date: Tue, 5 Mar 2024 15:08:04 -0300
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=marliere.net;
 s=2024; t=1709662086;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=x5whaAzOMVpJ9oleSNFRgGIgTqWcKl3NhWO0NiuDErg=;
 b=bs/DfrmLdwl2DuC1Sf7HIL2FdGgIdBdssE7oEwpnxFCNWPqZWFMc8sRttKEHufHlYzm4YB
 2b3fWMVo/o8oXzb2YI379S0dHjN8oS1c59yXYUPsFaDlLyOxV/of2TdYt8Kp4+h14D2i/n
 b43Jr7p+64MCbklVwOlgvXYuLYFCb6Ksrtmkk7VDU9voHQntmvLhN6Ji7Mv6Iu3pwOkExm
 tWXDg1iVWP58WAHyBosnvgyxXXRgl1prlryOfoXpwnLQvc1gQsxPuni7zs1KYF809P25Zt
 9qECQfyv8mFvAIuIdTSrNaXokuLjlAUAvOsTqb+oNOd436IRspqk7ACuQTOYSA==
Authentication-Results: ORIGINATING;
 auth=pass smtp.auth=ricardo@marliere.net smtp.mailfrom=ricardo@marliere.net
From: "Ricardo B. Marliere" <ricardo@marliere.net>
To: Felix Kuehling <felix.kuehling@amd.com>
Cc: Alex Deucher <alexander.deucher@amd.com>, 
 Christian =?utf-8?B?S8O2bmln?= <christian.koenig@amd.com>,
 David Airlie <airlied@gmail.com>, 
 Daniel Vetter <daniel@ffwll.ch>, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org, Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: Re: [PATCH] drm/amdkfd: make kfd_class constant
Message-ID: <iiyzek47iwn4av7bohszmhbgwkjpk3ytqkuwq7sk2qpoqdzrvg@msh5rt5bp3iy>
References: <20240305-class_cleanup-drm-amd-v1-1-ea99b37f26c7@marliere.net>
 <0f572801-8dcb-4124-94fa-cb219f60730d@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <0f572801-8dcb-4124-94fa-cb219f60730d@amd.com>
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

On  5 Mar 12:38, Felix Kuehling wrote:
> On 2024-03-05 7:15, Ricardo B. Marliere wrote:
> > Since commit 43a7206b0963 ("driver core: class: make class_register() take
> > a const *"), the driver core allows for struct class to be in read-only
> > memory, so move the kfd_class structure to be declared at build time
> > placing it into read-only memory, instead of having to be dynamically
> > allocated at boot time.
> >
> > Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> > Suggested-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> > Signed-off-by: Ricardo B. Marliere <ricardo@marliere.net>
> 
> The patch looks good to me. Do you want me to apply this to Alex's 
> amd-staging-drm-next?
> 
> Reviewed-by: Felix Kuehling <felix.kuehling@amd.com>

Hi Felix!

Thanks for reviewing. The patch was based in agd5f/linux/drm-next. But I
think amd-staging-drm-next would be fine, too.

Best regards,
-	Ricardo.


> 
> 
> > ---
> >   drivers/gpu/drm/amd/amdkfd/kfd_chardev.c | 21 +++++++++++----------
> >   1 file changed, 11 insertions(+), 10 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_chardev.c b/drivers/gpu/drm/amd/amdkfd/kfd_chardev.c
> > index f030cafc5a0a..dfa8c69532d4 100644
> > --- a/drivers/gpu/drm/amd/amdkfd/kfd_chardev.c
> > +++ b/drivers/gpu/drm/amd/amdkfd/kfd_chardev.c
> > @@ -63,8 +63,10 @@ static const struct file_operations kfd_fops = {
> >   };
> >   
> >   static int kfd_char_dev_major = -1;
> > -static struct class *kfd_class;
> >   struct device *kfd_device;
> > +static const struct class kfd_class = {
> > +	.name = kfd_dev_name,
> > +};
> >   
> >   static inline struct kfd_process_device *kfd_lock_pdd_by_id(struct kfd_process *p, __u32 gpu_id)
> >   {
> > @@ -94,14 +96,13 @@ int kfd_chardev_init(void)
> >   	if (err < 0)
> >   		goto err_register_chrdev;
> >   
> > -	kfd_class = class_create(kfd_dev_name);
> > -	err = PTR_ERR(kfd_class);
> > -	if (IS_ERR(kfd_class))
> > +	err = class_register(&kfd_class);
> > +	if (err)
> >   		goto err_class_create;
> >   
> > -	kfd_device = device_create(kfd_class, NULL,
> > -					MKDEV(kfd_char_dev_major, 0),
> > -					NULL, kfd_dev_name);
> > +	kfd_device = device_create(&kfd_class, NULL,
> > +				   MKDEV(kfd_char_dev_major, 0),
> > +				   NULL, kfd_dev_name);
> >   	err = PTR_ERR(kfd_device);
> >   	if (IS_ERR(kfd_device))
> >   		goto err_device_create;
> > @@ -109,7 +110,7 @@ int kfd_chardev_init(void)
> >   	return 0;
> >   
> >   err_device_create:
> > -	class_destroy(kfd_class);
> > +	class_unregister(&kfd_class);
> >   err_class_create:
> >   	unregister_chrdev(kfd_char_dev_major, kfd_dev_name);
> >   err_register_chrdev:
> > @@ -118,8 +119,8 @@ int kfd_chardev_init(void)
> >   
> >   void kfd_chardev_exit(void)
> >   {
> > -	device_destroy(kfd_class, MKDEV(kfd_char_dev_major, 0));
> > -	class_destroy(kfd_class);
> > +	device_destroy(&kfd_class, MKDEV(kfd_char_dev_major, 0));
> > +	class_unregister(&kfd_class);
> >   	unregister_chrdev(kfd_char_dev_major, kfd_dev_name);
> >   	kfd_device = NULL;
> >   }
> >
> > ---
> > base-commit: 8bc75586ea01f1c645063d3472c115ecab03e76c
> > change-id: 20240305-class_cleanup-drm-amd-bdc7255b7540
> >
> > Best regards,
