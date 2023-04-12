Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 493136DFD6B
	for <lists+dri-devel@lfdr.de>; Wed, 12 Apr 2023 20:24:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2DAF010E2EF;
	Wed, 12 Apr 2023 18:24:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A3C7E10E2EF
 for <dri-devel@lists.freedesktop.org>; Wed, 12 Apr 2023 18:24:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1681323881;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=CyeR5RuvAdcpT8sCaq1Ccw1gPj5ByFBqx39UJ21e/KI=;
 b=IXU4uvirc4G6b7686X1FtV4hHccHnqznbWZSON/b+1R9G7l52C8VDXoewI6bWDU26g37E3
 SikgbJGzbETZFvwY0rS1/Akwi8HZ/543HzCtped41WrFDiLJxEDRDLFFJYB1GtpKnIX9Vp
 zh22jgLGOERVpIvle0oeuIfB6h0ez/A=
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com
 [209.85.218.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-182-KglyZihiMeC7EEy3B6YSYA-1; Wed, 12 Apr 2023 14:24:40 -0400
X-MC-Unique: KglyZihiMeC7EEy3B6YSYA-1
Received: by mail-ej1-f70.google.com with SMTP id
 vt6-20020a170907a60600b009217998c8e3so4377910ejc.14
 for <dri-devel@lists.freedesktop.org>; Wed, 12 Apr 2023 11:24:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1681323879; x=1683915879;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=CyeR5RuvAdcpT8sCaq1Ccw1gPj5ByFBqx39UJ21e/KI=;
 b=Vc6el9OYGj8wvp0xQZQVCDah9o9haavD3vlQeEhzrlcYdNFBm8yhC8THN34lwZSKCH
 RJQlZdjq8prprETyV5NCqxAlfanA8V9hcgkC0Kw8TKZwOUqVUQJ7uNMzzBQgO9F1T774
 5a98Ej0nAjXFe1cHr3OntcoVcYVzM7X7vCPF/DFEXX5f38fGIYtiDR6j0/tJvjqLZE+g
 oa7/m8gnHq1WsJi1SXQEYGcNfMfPf2wfZOvfxl1C0TT79eH5YzWF9c2SDab1Z4AECjic
 TeXEMpV2rmYYJQt23/JsLUcweCF9wQMW/GOOD9T9Dz8PO84On1aSE4+LoMxRGPoc/Hax
 n3XA==
X-Gm-Message-State: AAQBX9cKh8ncFimAhmeP1wFgCg1C0sqZb/ArecU2cSFW5Lci1CKw5tWY
 RDsFa9TuLU2IpteJKQLXCWz/91LyQkUWMqp62xvR1w5a/x2sDKxZ6UqLDG2vFiX42b7Xovj69rW
 xUvLFpdt92UAOeiOamoN6oomNjincanSAZVlGFNnxsZsR
X-Received: by 2002:a17:906:65d7:b0:94a:469e:3558 with SMTP id
 z23-20020a17090665d700b0094a469e3558mr1746621ejn.13.1681323878894; 
 Wed, 12 Apr 2023 11:24:38 -0700 (PDT)
X-Google-Smtp-Source: AKy350YtycYXdsARuwibYKrLFJGATPqceVAlVOPYbZUKIRIWpL/xOi+w1ggZ81zpJrWnJCnwqM5MCAdGI1JA4J52kKk=
X-Received: by 2002:a17:906:65d7:b0:94a:469e:3558 with SMTP id
 z23-20020a17090665d700b0094a469e3558mr1746607ejn.13.1681323878636; Wed, 12
 Apr 2023 11:24:38 -0700 (PDT)
MIME-Version: 1.0
References: <20230412150225.3757223-1-javierm@redhat.com>
 <2e07f818ccdff7023a060e732d7c4ef6.squirrel@mail.panix.com>
 <87jzyhror0.fsf@minerva.mail-host-address-is-not-set>
 <beeff0335ab4cc244d214a7baadba371.squirrel@mail.panix.com>
In-Reply-To: <beeff0335ab4cc244d214a7baadba371.squirrel@mail.panix.com>
From: Javier Martinez Canillas <javierm@redhat.com>
Date: Wed, 12 Apr 2023 20:24:27 +0200
Message-ID: <CAFOAJEdKBUg91pDmNYYw5xigUxjifBgOLz2YgD+xQ+WyEy=V2w@mail.gmail.com>
Subject: Re: [PATCH] firmware/sysfb: Fix wrong stride when bits-per-pixel is
 calculated
To: Pierre Asselin <pa@panix.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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
Cc: Jocelyn Falempe <jfalempe@redhat.com>,
 Daniel Vetter <daniel.vetter@ffwll.ch>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Hans de Goede <hdegoede@redhat.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Ard Biesheuvel <ardb@kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Apr 12, 2023 at 8:12=E2=80=AFPM Pierre Asselin <pa@panix.com> wrote=
:
>
>
> > Interesting. So you don't have the simplefb output that you had before =
?
>
> I do now, after a 'make clean' and "make bzImage'.
>
> In between, I had tried CONFIG_SYSFB_SIMPLEFB=3Dn .  That "works", by
> falling back to vesafb in every case.  I restored the .config before
> testing the patch, but there must have been leftover dregs in the
> build tree.  1024x768x32 is garbled, others are good whether simplefb

And can you share the "linelength=3D" print out from simplefb ?

--=20
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

