Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E95346F3D8
	for <lists+dri-devel@lfdr.de>; Thu,  9 Dec 2021 20:21:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D688B10E25B;
	Thu,  9 Dec 2021 19:20:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x22d.google.com (mail-oi1-x22d.google.com
 [IPv6:2607:f8b0:4864:20::22d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A767410E251;
 Thu,  9 Dec 2021 19:20:56 +0000 (UTC)
Received: by mail-oi1-x22d.google.com with SMTP id r26so10081738oiw.5;
 Thu, 09 Dec 2021 11:20:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=1ZruaxW8L8OX9fgPYZgSgXNy2q463+9DO5ICSEYbDKQ=;
 b=N5tZh16fD1ANTvVPiBC20CwgGsc6/G5thWhdbHIjDVfF3kjmqFrMEGeemOh0NUz55r
 T7HSSqVz8FTFdGYKmRFJKlsuNFvd/DuTJjX5ppySrk66OuO+XTQektMUkyMwOQMqzQsn
 PDtBFk2aGCQZMRGrCUIrEQZ1PQX0LeoKy40X1VNZDG2KHrz6Smd1v5EW7YhxZidbmueY
 ylnoSnwlgJVI5cADit6x6G9Mcjbz6T7oyfcnexaLMiMLZbl3cNoOterQV1DkDFAlA5RM
 Zkf86+tx85LOQ8p5BxrMEZM+6tZl4LrMp+r/srfMMzq25DIB7TtdvOWkbU1no2y5UjKw
 TNew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=1ZruaxW8L8OX9fgPYZgSgXNy2q463+9DO5ICSEYbDKQ=;
 b=bdhhCVkX1P85I2cWxY+qHvdnxaQ8quWJ94emhfN4XzNbWj/H7N2fB3rAalZPgMu6BJ
 Iddma7i7PWpGcVxuV2WNs6YRtC4HdnXKBGaZrtYbf4uqOg8adVDNJ3g1jGZ51C8d7AQv
 YaeDLdHaXGWhSBiyY81RFTqGp/kcuXpluB8PnwTEnJzIh042J2Q/MnP+TUN9rwUVeMWU
 fA8JPwjFGbWXfRsjLALEbDsxs/Dfo/UTKT0avSIFn/0ZWTN03C3buppB5X+Wf1zG3hfu
 XW4/2d+3olp3HR2u9E0goMDsjH1XREuPBQVwrrHIgAVAf4fdPp1EPMLgII+2r8SMbCSC
 nv6A==
X-Gm-Message-State: AOAM532G/B2E4sqVUKnsQ4OHNdugf0zHhoOHinkZrwWq1rhA4mk1lEEI
 rAIbfurQ47otrXgvfPmbLh903EBE1OyhPZUmMmw=
X-Google-Smtp-Source: ABdhPJxCMzUslRm7FidnI2hciOCsoX6UY9Zg/OGwr/RHaqiQjQWNzl83PTeK5eoLmny8OS3z8e7aSMDIS+YzrGYC86Y=
X-Received: by 2002:a05:6808:68f:: with SMTP id
 k15mr7667479oig.5.1639077655957; 
 Thu, 09 Dec 2021 11:20:55 -0800 (PST)
MIME-Version: 1.0
References: <62aab616-53cb-ff9f-c5f3-169c547bd1ee@igalia.com>
 <CADnq5_O8x3_8f7GZ=tme55-QW+nqMJ2YoqvROjDPg2YZP2catQ@mail.gmail.com>
 <a1f4d263-b3d2-4ceb-8a89-948c8129500f@igalia.com>
 <CADnq5_N9ptK4c86LO77YcrF5_M==hket+L7eYjsGCaKbORO=ug@mail.gmail.com>
 <eaea0143-a961-b83c-3c6c-4d612cd003bc@igalia.com>
In-Reply-To: <eaea0143-a961-b83c-3c6c-4d612cd003bc@igalia.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Thu, 9 Dec 2021 14:20:44 -0500
Message-ID: <CADnq5_P+J_xxJ62zmTPGY0NfQR05Vnp51M_bYGXmdY1cXARfLA@mail.gmail.com>
Subject: Re: Reuse framebuffer after a kexec (amdgpu / efifb)
To: "Guilherme G. Piccoli" <gpiccoli@igalia.com>
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
Cc: "open list:EFIFB FRAMEBUFFER DRIVER" <linux-fbdev@vger.kernel.org>,
 xinhui pan <Xinhui.Pan@amd.com>, Baoquan He <bhe@redhat.com>,
 =?UTF-8?Q?Samuel_Iglesias_Gons=C3=A1lvez?= <siglesias@igalia.com>,
 kernel@gpiccoli.net, kexec@lists.infradead.org,
 amd-gfx list <amd-gfx@lists.freedesktop.org>, pjones@redhat.com,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>, "Deucher,
 Alexander" <alexander.deucher@amd.com>, Dave Young <dyoung@redhat.com>,
 Christian Koenig <christian.koenig@amd.com>, Vivek Goyal <vgoyal@redhat.com>,
 Gerd Hoffmann <kraxel@redhat.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Dec 9, 2021 at 1:18 PM Guilherme G. Piccoli <gpiccoli@igalia.com> wrote:
>
> Thanks again Alex! Some comments inlined below:
>
> On 09/12/2021 15:06, Alex Deucher wrote:
> > Not really in a generic way.  It's asic and platform specific.  In
> > addition most modern displays require link training to bring up the
> > display, so you can't just save and restore registers.
>
> Oh sure, I understand that. My question is more like: is there a way,
> inside amdgpu driver, to save this state before taking
> over/overwriting/reprogramming the device? So we could (again, from
> inside the amdgpu driver) dump this pre-saved state in the shutdown
> handler, for example, having the device in a "pre-OS" state when the new
> kexec'ed kernel starts.

Sure, it could be done, it's just a fair amount of work.  Things like
legacy vga text mode is a bit more of a challenge, but that tends to
be less relevant as non-legacy UEFI becomes more pervasive.

>
> >
> > The drivers are asic and platform specific.  E.g., the driver for
> > vangogh is different from renoir is different from skylake, etc.  The
> > display programming interfaces are asic specific.
>
> Cool, that makes sense! But if you (or anybody here) know some of these
> GOP drivers, e.g. for the qemu/qxl device, I'm just curious to
> see/understand how complex is the FW driver to just put the
> device/screen in a usable state.

Most of the asic init and display setup on AMD GPUs is handled via
atombios command tables (basically little scripted stored in the
vbios) which are shared by the driver and the GOP driver for most
programming sequences.  In our case, the GOP driver is pretty simple.
Take a look at the pre-DC display code in amdgpu to see what a basic
display driver would look like (e.g., dce_v11_0.c).  The GOP driver
would call the atombios asic_init table to make sure the chip itself
is initialized (e.g., memory controller, etc.), then walk the display
data tables in the vbios to determine the display configuration
specific to this board, then probe the displays and use the atombios
display command tables to light them up.

Alex
