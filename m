Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3AECF8D53FC
	for <lists+dri-devel@lfdr.de>; Thu, 30 May 2024 22:44:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EFB1610E42D;
	Thu, 30 May 2024 20:44:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="ZU3WJDGJ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com
 [209.85.210.182])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9878810EBD4;
 Thu, 30 May 2024 20:44:11 +0000 (UTC)
Received: by mail-pf1-f182.google.com with SMTP id
 d2e1a72fcca58-70244776719so78479b3a.2; 
 Thu, 30 May 2024 13:44:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1717101851; x=1717706651; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=X1/q38ajc2cigpnUWtYXKrDTQJnogN5TA72dnoPxc4w=;
 b=ZU3WJDGJ1ixKKkVGarg8q6F3YDYIFJU50dpDWgDkC2pWE85C82IkJwH7AUrW7lMYMm
 835AoBq8vCQTF9t9ihMDPDYpUDxfJ610+TPHLkkgyRE4suwD9xDk+SIw0b1OWPapZ5wK
 +e+IX0BX93ZGMz5Tn/0tq/3/CbzrVET6RWWeun9DFAW1t53oTdqVozxFNOUJEUfGkUVX
 4wFenzowrGFj9OXwM0SoDDS/UduHv9LGShVAvapwXC8BFHkqJMnqMxnLbsWlNTgHFBk1
 nx/wvrY0OYVY9Fao+swGxDRl5+DyCkSmm1Z9Fwl3MHEbNZwLOfmwXfQBtXh83E8Plmtx
 K0WQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1717101851; x=1717706651;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=X1/q38ajc2cigpnUWtYXKrDTQJnogN5TA72dnoPxc4w=;
 b=HJAB/zGXaZ2n3KNPCc7NijxgZJMNj8oYx457jRE48vDAhH5ioGjcSC1XXjdNjBRX4z
 GKNUFaD1kRvxUwuTUyM9bSS9Y4xuGelcJX86/CKBRbKBIh6CP/7seNhaiW3X9M2cIKk6
 2BqyJiTPJbeLtKwypwIHIS3P6Vc9Mxw0qmketVEkMxYjtmssVVIWCgXIQhU9yoURSMrb
 TPPYmdzsV0ZR/2wigML3R43O2J3FPxhR/WpB8HOWTBYrJfDonaN4jaechMRi+lXn4qt/
 XPBX97fZVQ7VhveDcSXMpUhB/Gj40iYWS0fvLyLNBVFUrzZGVdQKyDw5KfKX0UGDIbOx
 spuw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWn0WSsl+OcfE/OySlptfOFgZKwLn/PBJpPzSv5w4z3bghY6xss4www+e8WTlJsLsd/8OFolu2VFveduX7Rg3lTIZDpqCQ+F0zk2IpUQqqUuT8A5z9Q+05/8OUvSsgv7RRfGZ4zhmBM82RNN9KSRw==
X-Gm-Message-State: AOJu0YxgKlBdMIW/ZualPCa8oqUIiA6z5dJvFoYuMvJHysVCFGvwdJQT
 5uZyLuhuzCl1qSyYqx2TnrEkqCJ9x1v+3/lqTnWyq2GPifafYJvQMVP0iw==
X-Google-Smtp-Source: AGHT+IHj8j/zqaOBcjIT/XxOQNe1B+xo2dkm5mX/TzMHOSAr352c3GTLXoqD+H9hb7VWqXR5OoAM0g==
X-Received: by 2002:a05:6a20:3206:b0:1af:dae8:5eac with SMTP id
 adf61e73a8af0-1b26f23d501mr82943637.46.1717101850942; 
 Thu, 30 May 2024 13:44:10 -0700 (PDT)
Received: from google.com ([2620:15c:9d:2:509f:4b2e:3586:eb1])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-702423cb359sm146595b3a.5.2024.05.30.13.44.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 30 May 2024 13:44:10 -0700 (PDT)
Date: Thu, 30 May 2024 13:44:07 -0700
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: "Limonciello, Mario" <mario.limonciello@amd.com>,
 Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>,
 dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 linux-kernel@vger.kernel.org,
 Chris Bainbridge <chris.bainbridge@gmail.com>, hughsient@gmail.com,
 linux-input@vger.kernel.org
Subject: Re: [PATCH v2] drm/client: Detect when ACPI lid is closed during
 initialization
Message-ID: <ZljlF1fE5ypKWoGk@google.com>
References: <20240528210319.1242-1-mario.limonciello@amd.com>
 <Zlc4V1goFvU2antl@intel.com>
 <197d195f-9206-41dd-8ff1-f4bb4988fb9b@amd.com>
 <ZldMKZ1MzSDXOheJ@intel.com>
 <g34f3sdk22grheq2vaaonkl543dtk7nb5sffqgmkl5ywtj5skk@p5ht5ug33q4z>
 <873b7a7b-139d-498e-89da-098cb3d7599d@amd.com>
 <CAA8EJpqODpGX-RthQ8qu3oU80qXp8a-N1Chz-dcQXjKYoDfEgw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAA8EJpqODpGX-RthQ8qu3oU80qXp8a-N1Chz-dcQXjKYoDfEgw@mail.gmail.com>
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

On Thu, May 30, 2024 at 11:07:53AM +0300, Dmitry Baryshkov wrote:
> On Thu, 30 May 2024 at 07:41, Limonciello, Mario
> <mario.limonciello@amd.com> wrote:
> >
> >
> > >> Also a direct acpi_lid_open() call seems a bit iffy. But I guess if
> > >> someone needs this to work on non-ACPI system they get to figure out
> > >> how to abstract it better. acpi_lid_open() does seem to return != 0
> > >> when ACPI is not supported, so at least it would err on the side
> > >> of enabling everything.
> > >
> > > Thanks. I was going to comment, but you got it first. I think a proper
> > > implementation should check for SW_LID input device instead of simply
> > > using acpi_lid_open(). This will handle the issue for other,
> > > non-ACPI-based laptops.
> > >
> >
> > Can you suggest how this would actually work?  AFAICT the only way to
> > discover if input devices support SW_LID would be to iterate all the
> > input devices in the kernel and look for whether ->swbit has SW_LID set.
> >
> > This then turns into a dependency problem of whether any myriad of
> > drivers have started to report SW_LID.  It's also a state machine
> > problem because other drivers can be unloaded at will.
> >
> > And then what do you if more than one sets SW_LID?
> 
> It might be easier to handle this in the input subsystem. For example
> by using a refcount-like variable which handles all the LIDs and
> counts if all of them are closed. Or if any of the LIDs is closed.

Yes, install an input handler matching on EV_SW/SW_LID so you will get
notified when input devices capable of reporting SW_LID appear and
disappear and also when SW_LID event is being generated, and handle as
you wish. Something like

https://chromium.googlesource.com/chromiumos/third_party/kernel/+/40e9f6a991856ee7d504ac1ccd587e435775cfc4%5E%21/#F0

In practice I think it is pretty safe to assume only 1 lid for a
laptop/device.

Thanks.

-- 
Dmitry
