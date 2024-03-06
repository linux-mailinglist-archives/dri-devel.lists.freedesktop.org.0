Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D3DE2873C96
	for <lists+dri-devel@lfdr.de>; Wed,  6 Mar 2024 17:50:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 35A88113344;
	Wed,  6 Mar 2024 16:50:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="ZU2eJ/4B";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7880E113344
 for <dri-devel@lists.freedesktop.org>; Wed,  6 Mar 2024 16:50:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1709743816;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=CFwqTj8WPf3w+Wcwvpf0C+CURfpIxKA1IeNu1cFxTn0=;
 b=ZU2eJ/4BR67Ddku7ar308OJpYfIGsb0N4s23SefvB7S7T7XxWpkTI7olkDAOJPRDXYE1SI
 avyJV+tO8g5biSQ7//dVMXeXAg60levlsyLZXU6EGuYE8TsiseaVaJUF8MXvq83LtH7HOu
 8+2Hy33fwoMrcDuwxM0uTOtcxvYppDY=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-142-MpQ0tNNkNhGfn0t4_I9YeA-1; Wed, 06 Mar 2024 11:50:12 -0500
X-MC-Unique: MpQ0tNNkNhGfn0t4_I9YeA-1
Received: by mail-wm1-f70.google.com with SMTP id
 5b1f17b1804b1-412e51c20fdso20240315e9.2
 for <dri-devel@lists.freedesktop.org>; Wed, 06 Mar 2024 08:50:12 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1709743811; x=1710348611;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=CFwqTj8WPf3w+Wcwvpf0C+CURfpIxKA1IeNu1cFxTn0=;
 b=AnAElMdpUVnh0FtDO2XO20+BcsKbrBnTx9+FREfK2UctPyVQvJWaE1owbr98PrQwqe
 lTDidm5+oI7pMBLRjNbdEXm9yiG6FoiXUFYfcyWeepufcOEOlwDCD76VEn3JytVDXTZj
 ImAvA5GJ858Yt8JZ9E1qNqetO40TGqKYhay7vOqE4pianLnYXPPLeKSud5PXA7VGogpa
 dQDpqmUWkItzSLBcaX8iv69GFNZjrel/4F2ISHbD4tKLTe6F5j4iv+qOGN3lPsy//U8d
 Oz6XdDxtR9cRd2vmZ4yrjcO7j1o0KYYqI8f2l4YNnhEPfXInK9m9OZX2j8u1K37Yn7DG
 ztEA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVTAbdDYRFbOizx2VrfG+w22zBk+S9iA1dwZ2f7gqu5ROuTVnotSUkymyOT7TXeBt85HQ5AWW59x2mmPTY9+57AINXZN7IGSGuNFH5SpJn/
X-Gm-Message-State: AOJu0YzcTj/bvcqjLgmcHQnlioawLdz8TAjWHvWX+YdJZFqxhnHwi3Or
 kCkw+ENUdO/xK8mNrcgFo+nl9HS+szKROOQAriP6xrrV0vlrAGSkKA78wY6aX7fk8+2ytfqxAQK
 oWQUee0jmdSEXioP5REUjvH6wt4C/Na/bahJRTz4ggWU1a60HRH+Z6qpHnJ+DTxO0GQ==
X-Received: by 2002:adf:f546:0:b0:33e:2993:7c81 with SMTP id
 j6-20020adff546000000b0033e29937c81mr8781289wrp.64.1709743811340; 
 Wed, 06 Mar 2024 08:50:11 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEdRUULTIbhrSNIe6MOucamjK8vl5VfdtAixAYikSlurVuxcc5MEnxymSBjgvP5vUB6/jsmGw==
X-Received: by 2002:adf:f546:0:b0:33e:2993:7c81 with SMTP id
 j6-20020adff546000000b0033e29937c81mr8781277wrp.64.1709743811003; 
 Wed, 06 Mar 2024 08:50:11 -0800 (PST)
Received: from toolbox ([2001:9e8:89a4:b300:8654:3fb5:7140:1e06])
 by smtp.gmail.com with ESMTPSA id
 u11-20020a056000038b00b0033e456848f4sm6522396wrf.82.2024.03.06.08.50.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 06 Mar 2024 08:50:10 -0800 (PST)
Date: Wed, 6 Mar 2024 17:50:09 +0100
From: Sebastian Wick <sebastian.wick@redhat.com>
To: Maxime Ripard <mripard@kernel.org>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Jonathan Corbet <corbet@lwn.net>, dri-devel@lists.freedesktop.org,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] drm: Document requirements for driver-specific KMS props
 in new drivers
Message-ID: <20240306165009.GB11561@toolbox>
References: <20240229202833.198691-1-sebastian.wick@redhat.com>
 <20240306-hulking-funky-fox-b9581b@houat>
MIME-Version: 1.0
In-Reply-To: <20240306-hulking-funky-fox-b9581b@houat>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
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

On Wed, Mar 06, 2024 at 03:14:15PM +0100, Maxime Ripard wrote:
> Hi,
> 
> On Thu, Feb 29, 2024 at 09:28:31PM +0100, Sebastian Wick wrote:
> > When extending support for a driver-specific KMS property to additional
> > drivers, we should apply all the requirements for new properties and
> > make sure the semantics are the same and documented.
> > 
> > Signed-off-by: Sebastian Wick <sebastian.wick@redhat.com>
> > ---
> >  Documentation/gpu/drm-kms.rst | 5 +++++
> >  1 file changed, 5 insertions(+)
> > 
> > diff --git a/Documentation/gpu/drm-kms.rst b/Documentation/gpu/drm-kms.rst
> > index 13d3627d8bc0..afa10a28035f 100644
> > --- a/Documentation/gpu/drm-kms.rst
> > +++ b/Documentation/gpu/drm-kms.rst
> > @@ -496,6 +496,11 @@ addition to the one mentioned above:
> >  
> >  * An IGT test must be submitted where reasonable.
> >  
> > +For historical reasons, non-standard, driver-specific properties exist. If a KMS
> > +driver wants to add support for one of those properties, the requirements for
> > +new properties apply where possible. Additionally, the documented behavior must
> > +match the de facto semantics of the existing property to ensure compatibility.
> > +
> 
> I'm conflicted about this one, really.
> 
> On one hand, yeah, it's definitely reasonable and something we would
> want on the long run.
> 
> But on the other hand, a driver getting its technical debt worked on for
> free by anyone but its developpers doesn't seem fair to me.

Most of the work would have to be done for a new property as well. The
only additional work is then documenting the de-facto semantics and
moving the existing driver-specific code to the core.

Would it help if we spell out that the developers of the driver-specific
property shall help with both tasks?

> Also, I assume this is in reaction to the discussion we had on the
> Broadcast RGB property. We used in vc4 precisely because there was some
> userspace code to deal with it and we could just reuse it, and it was
> documented. So the requirements were met already.

It was not in drm core and the behavior was not documented properly at
least.

Either way, with Broadcast RGB we were already in a bad situation
because it was implemented by 2 drivers independently. This is what I
want to avoid in the first place. The cleanup afterwards (thank you!)
just exposed the problem.

> Maxime


