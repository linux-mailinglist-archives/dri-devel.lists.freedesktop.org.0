Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 85737AE2A39
	for <lists+dri-devel@lfdr.de>; Sat, 21 Jun 2025 18:15:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B321210E2DD;
	Sat, 21 Jun 2025 16:15:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="aJn2oadT";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com
 [209.85.218.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0F9D110E2DD
 for <dri-devel@lists.freedesktop.org>; Sat, 21 Jun 2025 16:15:41 +0000 (UTC)
Received: by mail-ej1-f44.google.com with SMTP id
 a640c23a62f3a-ade30256175so497043566b.1
 for <dri-devel@lists.freedesktop.org>; Sat, 21 Jun 2025 09:15:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1750522540; x=1751127340; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=9MerQjCeoB/tfauO+gxNkhr//t2Y54VYSS0pmA0OG84=;
 b=aJn2oadTjupVcMwKWhOQZ5YCbexTfryBvn4CRne88CmfcAWaGELqunsFkAG68yEIMC
 AcyI7qSoAGfcBZAYlIMR/sQGmkpp4KNUuSe1U1OUK+O+MLzE+I+dcw1bxWTu7CW5Iyjv
 14aMcRxwME++lFI0lTBEE7CgUtxfYJ8fg4WSyMQsrGi7GHDgIRmPR9MA8m4jWzZYrrCW
 8rwBaO4gWamhdJ2Cj1cgcl5mf9A57HMZACFJBdmTnAk8aWeKJOFeggD1ixno4oNAPMPr
 SQ3qJgYCcvuIiCIv+G+tDjvh1HHdXWTjy8mAcSM/u3o2cTwd3RisnVWkAEyCnOgU0lVZ
 SAbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1750522540; x=1751127340;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=9MerQjCeoB/tfauO+gxNkhr//t2Y54VYSS0pmA0OG84=;
 b=xSw5BcBkInrbPPvttgTWSU1+Xpkgx+L5cE4GgNsGNWHr1yPB0Zs1yDejjSD1yNQVr/
 cqpV5iF0tpiuIYhSLSyWHL09X22upcW6+kIxIjnfi6UEymg4eD4VbEQkuL0QlrDfJYOR
 jm91SHURk3XB50G+/Z7cdIR/jOsmTSbj7vKl7mric/rWU3+JQZutXQ80IvFt4Sj4TCsb
 qBRNGBLzZBRmlyJoOJKPgHxSLImoH4AqUpKhXjHU/WfXSeYA0lI73ARoMagj0lUyY4zk
 zPVHBq+pI5ZLsyslfBk7lIKB/Mmh1LUmrSi3/o62nLGdmpdy0FiQGKvQGoDzV78p9vED
 vrRw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUNdHkJyisxpFIabGaq1MHY5dUfrNSTgkw5bmmE6urkENorQODFNrNMsamzNAFEB/apMfIQNBTsYpc=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yy1p7o+YflSexMn8bo04ElOLXfUC/NjNZcEKkYdHM8d6PplYquY
 1WSKmbkmbDRjYn5+uaXluY9J4JiQn7V9fkFKJUDVxHYBk7drJNxyhUq3
X-Gm-Gg: ASbGncuru5MKra6WIDUdH6HK51Evik1xMaWvxz2oFORkTS9dOyFk1mkTshqQK4qepbK
 XTkAiCl9YJhAJmguQGZIQu3fqXuXkwb7hExBzdPCrTbXAXNTgg9PeqYqzcCZGMHjQMmmzkFoG8M
 mLTMgC0+iUQsfvDJqkVI5CLR5vTEktmtY2Dz0J1etb7tGRysbJsBT2WucFBX5gvL8gZBOxoI5R8
 IiYzKF/LLn/OcjslLdS9/jYIhCBl/9eOcx0IRME4mRoR01ipSTQ6hwUKBV0MKXQGESly5f5bkoD
 p7RkowRBjEqoYnKtI/FAacnhkly1UpLd7XCOAW+9o1JU1dtxhb3LgusJ
X-Google-Smtp-Source: AGHT+IEV3zNBZRAZaL6Ty9ZazSqmnCQisegd5org4xX7GQNi4SF20RwV+ACtN3Sv9ZZx5uzjTUvwkA==
X-Received: by 2002:a17:907:6088:b0:ad8:8529:4f9b with SMTP id
 a640c23a62f3a-ae057bc4354mr695132566b.38.1750522539633; 
 Sat, 21 Jun 2025 09:15:39 -0700 (PDT)
Received: from localhost ([185.246.188.73])
 by smtp.gmail.com with UTF8SMTPSA id
 4fb4d7f45d1cf-60a18cba458sm3425202a12.59.2025.06.21.09.15.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 21 Jun 2025 09:15:39 -0700 (PDT)
Date: Sat, 21 Jun 2025 19:15:31 +0300
From: Ahmed Salem <x0rw3ll@gmail.com>
To: Lukas Wunner <lukas@wunner.de>
Cc: airlied@redhat.com, dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org, linux-kernel-mentees@lists.linux.dev
Subject: Re: [RFC PATCH] amd64-agp: do not bind to pci driver if probing fails
Message-ID: <7rv3j2it6wbv4gu7jgsews3niste5y52h67scwwjpblhy2royh@hqfmpbjzdj77>
References: <c5kqcudzrcafm24nr5ixgalhxdkxl3uoueerjlp6tbksj3hzy7@klytjugpkvdm>
 <aFZ_YJH30f1WDneD@wunner.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aFZ_YJH30f1WDneD@wunner.de>
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

Hi Lukas,

On 25/06/21 11:46AM, Lukas Wunner wrote:
> On Sat, Jun 21, 2025 at 04:55:52AM +0300, Ahmed Salem wrote:
> > --- a/drivers/char/agp/amd64-agp.c
> > +++ b/drivers/char/agp/amd64-agp.c
> > @@ -768,10 +768,15 @@ int __init agp_amd64_init(void)
> >  
> >  		/* Look for any AGP bridge */
> >  		agp_amd64_pci_driver.id_table = agp_amd64_pci_promisc_table;
> > -		err = driver_attach(&agp_amd64_pci_driver.driver);
> > -		if (err == 0 && agp_bridges_found == 0) {
> > +		if ((int *)agp_amd64_pci_driver.probe != 0) {
> >  			pci_unregister_driver(&agp_amd64_pci_driver);
> >  			err = -ENODEV;
> > +		} else {
> > +			err = driver_attach(&agp_amd64_pci_driver.driver);
> > +			if (err == 0 && agp_bridges_found == 0) {
> > +				pci_unregister_driver(&agp_amd64_pci_driver);
> > +				err = -ENODEV;
> > +			}
> 
> Is the "probe" member in agp_amd64_pci_driver overwritten with a
> zero pointer anywhere?  I don't see that it is, so it seems the
> else-branch is never entered.
> 

That is a great question. I thought since pci_register_driver calls the
probe function, it would return with or without a zero, saving that
value in the .probe member. (I find my lack of C
experience...disturbing)

> I had already prepared a fix for this, but waited for 0-day to
> crunch through it.  I've just submitted it, so that's what I had
> in mind:
> 
> https://lore.kernel.org/r/f8ff40f35a9a5836d1371f60e85c09c5735e3c5e.1750497201.git.lukas@wunner.de/
> 

That one I've seen even prior to catching this one, and this is
originally what I had in mind based on what commit 6fd024893911
("amd64-agp: Probe unknown AGP devices the right way") removed (i.e.
!pci_find_capability) when you suggested checking for caps beforehand,
but I figured "why make other calls when .probe already does it right
off the bat?" Clearly, I was in the wrong there.

Nonetheless, thank you so much for the review, and Ccing me in the above
patch. Ultimately, what matters to me is getting the right fix in order,
and learning not only what I'd missed here (i.e. Reported-by trailer;
just wasn't quite certain how to approach the situation with SDN in
mind, as well as the original Cced developers), but also fundamental C
knowledge I've been trying to acquire. I appreciate you!

--
Best regards,
Ahmed Salem <x0rw3ll@gmail.com>

> Thanks,
> 
> Lukas
