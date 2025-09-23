Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A17FB951BE
	for <lists+dri-devel@lfdr.de>; Tue, 23 Sep 2025 11:02:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1D6B310E5AA;
	Tue, 23 Sep 2025 09:02:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-vk1-f178.google.com (mail-vk1-f178.google.com
 [209.85.221.178])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 77BED10E5AA
 for <dri-devel@lists.freedesktop.org>; Tue, 23 Sep 2025 09:02:39 +0000 (UTC)
Received: by mail-vk1-f178.google.com with SMTP id
 71dfb90a1353d-54a94e39720so1089998e0c.1
 for <dri-devel@lists.freedesktop.org>; Tue, 23 Sep 2025 02:02:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1758618158; x=1759222958;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=HNBYTpqWi/E84xPUQlHNqQtKJX+BSjN7K2AeCYNEx38=;
 b=hTRJoguw7+Oczl27vVElmumHWpbpzgGl2ncOvHOyJJWNm8HurwFFtOKKR8eM5s5yjY
 tevnjvqXH8cwWLp+eLgwN1fNKD1Bam28Mk7jhpBWLzTiHrQE2dKvJ0w4rWLWI8Bon1bj
 jcn9fxvAufP0/DSoRFIgw3nvmMfGskcdmL7Q20oViW5SECEKwEtKh9U0OWHYpGLkSu8Y
 wX9b21RXz9CnB/q/Jfo5vY78e6z0eMtppHXvYyYSA32mWAaOtG5WFt0N471r6id4SqXE
 VtOn6mOYPHrpiXIdkN9W3djaCVlIxAyCTiea5tdrIkfM1LsHl+sHlhnAY6W7tPoc5cDR
 ofzw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVYK+Z2RC0y6OIu3YiBCECznHNcIiA/vHnkbdhZNinRAPo501IcvWwWx2qMG7Ylzw59JdCt0ZzgMcc=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yyp9VSHKKrHOAmccDxjj1M3iuWiDo8MKSKoxzhzohWwQErFtwxN
 xnjv0gWIC6Tf36Gl+YopbRRSmXoqpA2AwMie3Mu2hwSdZOpqpPL16CiKt2XN/uy6
X-Gm-Gg: ASbGncvIm2c2zqbMl0n2rDiw4xOy2vTOZ9AKG9+menPFuxRFnLOeZXCJ6p0tZ/QKqV/
 fhOOePBcVTawyGnHNL7H6ajJOVuy2ZJ2ymFYiuBBAZIBgZOGz03rNG70puAR8PHCLEVzIC7g3H5
 e6/2K/CyQ+l5lnWO7Oj7q8kOoQR9nvE/SifFXNZjbuLsZIVCp1tJoMbHFMHdHivZkSTbCIq6aNa
 0eG9iYNTPObteXeZ5SL7uNCOy+yP7VQ7sk4dRI4obBYEVovHU+VY+nXbgshaByl7K46iXyiPjB5
 vHH5TP0nzVmXHbdshSr/jSa15sXCtrky6XsClQZUkQ0O0JgQSJQMxh/8VXs5rtNGC29vDeeKIqA
 nnnEBYXqoR+G2Z9VBZBWkhYJE2i2hsWDDbKLQta8jYvmwsUOirSH49petah7X
X-Google-Smtp-Source: AGHT+IGfpxIrREP5I5/8u9b19Olfz6cqyjsn9XOAFga6ZeaV3/6LPwi/EXpYr+8ZYYvsDU6mRkqaug==
X-Received: by 2002:a05:6122:30a8:b0:54b:bea6:a226 with SMTP id
 71dfb90a1353d-54bcaf67494mr545100e0c.11.1758618158006; 
 Tue, 23 Sep 2025 02:02:38 -0700 (PDT)
Received: from mail-vs1-f46.google.com (mail-vs1-f46.google.com.
 [209.85.217.46]) by smtp.gmail.com with ESMTPSA id
 71dfb90a1353d-54aa5e14d17sm1311489e0c.20.2025.09.23.02.02.36
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 23 Sep 2025 02:02:36 -0700 (PDT)
Received: by mail-vs1-f46.google.com with SMTP id
 ada2fe7eead31-5a3511312d6so731165137.3
 for <dri-devel@lists.freedesktop.org>; Tue, 23 Sep 2025 02:02:36 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AJvYcCVCOiF281XK+k8ip56gxqRb6brvTQikHczfKPg3K35eQD5ZHRnne6WbQT6TnSvYTlPTlcgByhPgN9k=@lists.freedesktop.org
X-Received: by 2002:a05:6102:2c85:b0:523:d987:2170 with SMTP id
 ada2fe7eead31-5a577ff90c1mr582185137.21.1758618156219; Tue, 23 Sep 2025
 02:02:36 -0700 (PDT)
MIME-Version: 1.0
References: <20250922185740.153759-1-marek.vasut+renesas@mailbox.org>
 <20250922185740.153759-3-marek.vasut+renesas@mailbox.org>
 <CAMuHMdUqzfGb0ehdXjdmbZfZ9XVoHMjL8y0hoJ-BYLEkLepP3w@mail.gmail.com>
 <241530bb-7c06-4055-b95b-83a89f27895b@mailbox.org>
 <20250923085712.GB20765@pendragon.ideasonboard.com>
In-Reply-To: <20250923085712.GB20765@pendragon.ideasonboard.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 23 Sep 2025 11:02:24 +0200
X-Gmail-Original-Message-ID: <CAMuHMdWb70kgf6EMZuqfbW2+Pw5fjmYSzDwHOzaPJUAqbbU4jw@mail.gmail.com>
X-Gm-Features: AS18NWCQnjp4Gw0SnVg36PQ_Ax26g3WaJZQDOF8461nVJTCkiD8fvdqoe-5LgZA
Message-ID: <CAMuHMdWb70kgf6EMZuqfbW2+Pw5fjmYSzDwHOzaPJUAqbbU4jw@mail.gmail.com>
Subject: Re: [PATCH 2/9] drm/rcar-du: dsi: Deduplicate
 mipi_dsi_pixel_format_to_bpp() usage
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Marek Vasut <marek.vasut@mailbox.org>,
 Marek Vasut <marek.vasut+renesas@mailbox.org>, 
 dri-devel@lists.freedesktop.org, David Airlie <airlied@gmail.com>, 
 Geert Uytterhoeven <geert+renesas@glider.be>, 
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Magnus Damm <magnus.damm@gmail.com>, 
 Maxime Ripard <mripard@kernel.org>, Simona Vetter <simona@ffwll.ch>, 
 Thomas Zimmermann <tzimmermann@suse.de>, 
 Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>,
 linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
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

On Tue, 23 Sept 2025 at 10:57, Laurent Pinchart
<laurent.pinchart@ideasonboard.com> wrote:
> On Tue, Sep 23, 2025 at 10:55:20AM +0200, Marek Vasut wrote:
> > On 9/23/25 8:47 AM, Geert Uytterhoeven wrote:
> > >> @@ -457,11 +458,11 @@ static void rcar_mipi_dsi_set_display_timing(struct rcar_mipi_dsi *dsi,
> > >>          u32 vprmset4r;
> > >>
> > >>          /* Configuration for Pixel Stream and Packet Header */
> > >> -       if (mipi_dsi_pixel_format_to_bpp(dsi->format) == 24)
> > >> +       if (dsibpp == 24)
> > >>                  rcar_mipi_dsi_write(dsi, TXVMPSPHSETR, TXVMPSPHSETR_DT_RGB24);
> > >> -       else if (mipi_dsi_pixel_format_to_bpp(dsi->format) == 18)
> > >> +       else if (dsibpp == 18)
> > >>                  rcar_mipi_dsi_write(dsi, TXVMPSPHSETR, TXVMPSPHSETR_DT_RGB18);
> > >> -       else if (mipi_dsi_pixel_format_to_bpp(dsi->format) == 16)
> > >> +       else if (dsibpp == 16)
> > >
> > > What about using the switch() statement instead?
> >
> > Not for single-line bodies in the conditionals. The switch {} statement
> > would require additional break; in each case and that's not worth it
> > here, it would only add noise into the code.
>
> I'm a bit surprised. I don't mind much as I don't work on this driver
> myself, but for what it's worth I would find a switch statement to be
> more readable too. Coding style is of course a matter of personal
> preference in many cases.

Exactly.
And you would no longer need the dsibpp local variable.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
