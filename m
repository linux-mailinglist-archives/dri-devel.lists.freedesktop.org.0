Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BC5454709F0
	for <lists+dri-devel@lfdr.de>; Fri, 10 Dec 2021 20:11:47 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6332B10EC88;
	Fri, 10 Dec 2021 19:11:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x233.google.com (mail-oi1-x233.google.com
 [IPv6:2607:f8b0:4864:20::233])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5AB5F10EC82;
 Fri, 10 Dec 2021 19:11:34 +0000 (UTC)
Received: by mail-oi1-x233.google.com with SMTP id u74so14475903oie.8;
 Fri, 10 Dec 2021 11:11:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=MCCCrMsD80PYsXI80yfhET4AB8VSWOdySeInd6qTHiw=;
 b=aBi0zyo1vOOvZtbVw1z0ewL0DB+wpsdif/9QhdpeVGrtx2FKxCx3PyanvopaVMam18
 LsNaYYxK9MWHESlmYlzj5cuePZb3rxr2ICfSp9IssOwMeQ/AGLJOBjnH9IEiTb7qbMJl
 1wLr74UaWxYx2aKRsmS0I+Cag6qTY8rx3+0de9BOEZDbaavQytFuUAl4ikacxrHA5uL+
 jsSYwgX9JiANWLyqTpVbV5DknVCz5LH436HwOZEhqmvHiyMkDtkFCRPHRdh++AczBz0q
 6c9hflbFHrmt2+yzUIQ0AQpMXZgwHFaGc8/siXhoKQcoWxbHqsoyxBXqy/DYVu80SdzS
 Ny0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=MCCCrMsD80PYsXI80yfhET4AB8VSWOdySeInd6qTHiw=;
 b=ssWILijMgWRHdRF/iLP3suXaQgS6QXBCrxscBRJfCAREptAGdSbHQnUvrosiSZxrkl
 TvvPkK0OZWAKSWTEwCm02INXWpmU4XGIHMBoTWv0bHPgHVc43ZCrexZpr1CVVjnyD79G
 0qYb2Z4PsZbkapBeE9NNlznHmpXBOGtI6vZbtL5gz6hYygIR2jKBPVngfDyKTL06+wbr
 hGL3wSUZnk67J8wklm8LWScWPdUrNOsyeIIMWb5L3Cxeq87cIIIU7uQgMghZ2SZyUgMX
 VwwlEgHCUO3moJfMMYTf8+BNX8Bm6MAbXj4XFZ01xLIjmF0zeUR37ZBXY7a2q53pSJRD
 mw5w==
X-Gm-Message-State: AOAM531j6+dE7f79w5DeAcJ7t2X3bXD58J8h2tjvhIWC5NjG83NtzyG0
 mbtuWp/je0olshYwVdYVRRZD8/gvkBNQTBLgRi4=
X-Google-Smtp-Source: ABdhPJznkZHc+/04noUEWFMaObXDPF6FRikbNCHRD5le/cb77UpNIAdmSFl/MsYmSVixh4A3WQ7/OGpzRzZw/YTh/js=
X-Received: by 2002:a05:6808:300b:: with SMTP id
 ay11mr14026975oib.120.1639163493704; 
 Fri, 10 Dec 2021 11:11:33 -0800 (PST)
MIME-Version: 1.0
References: <62aab616-53cb-ff9f-c5f3-169c547bd1ee@igalia.com>
 <CADnq5_O8x3_8f7GZ=tme55-QW+nqMJ2YoqvROjDPg2YZP2catQ@mail.gmail.com>
 <a1f4d263-b3d2-4ceb-8a89-948c8129500f@igalia.com>
 <CADnq5_N9ptK4c86LO77YcrF5_M==hket+L7eYjsGCaKbORO=ug@mail.gmail.com>
 <eaea0143-a961-b83c-3c6c-4d612cd003bc@igalia.com>
 <6d3c7acf-a23f-3073-56ed-375ccb8cc815@suse.de>
 <99b38881-8c63-de04-50f8-aa4119b52b25@igalia.com>
 <CADnq5_NqPEY6vPSsBQSst5Gsw-VpJ-sp-5DHMeB+EGA2t7KoAQ@mail.gmail.com>
 <56dfb915-036b-0584-f0ef-83c786970d6e@igalia.com>
 <d1de6ca3-11ae-af9e-a2fb-7bcb6fae01d6@amd.com>
 <0847ff12-8b1c-a046-eb05-f0011f81e172@igalia.com>
In-Reply-To: <0847ff12-8b1c-a046-eb05-f0011f81e172@igalia.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Fri, 10 Dec 2021 14:11:22 -0500
Message-ID: <CADnq5_O4+8r_NKCK3JBtHPf03hniR9Q53r-A2PFFFBR9X1nFMQ@mail.gmail.com>
Subject: Re: Reuse framebuffer after a kexec (amdgpu / efifb)
To: "Guilherme G. Piccoli" <gpiccoli@igalia.com>
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
Cc: "open list:EFIFB FRAMEBUFFER DRIVER" <linux-fbdev@vger.kernel.org>,
 xinhui pan <Xinhui.Pan@amd.com>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>,
 Baoquan He <bhe@redhat.com>,
 =?UTF-8?Q?Samuel_Iglesias_Gons=C3=A1lvez?= <siglesias@igalia.com>,
 kernel@gpiccoli.net, kexec@lists.infradead.org,
 amd-gfx list <amd-gfx@lists.freedesktop.org>, pjones@redhat.com,
 Gerd Hoffmann <kraxel@redhat.com>, Thomas Zimmermann <tzimmermann@suse.de>,
 "Deucher, Alexander" <alexander.deucher@amd.com>,
 Dave Young <dyoung@redhat.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 Vivek Goyal <vgoyal@redhat.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Dec 10, 2021 at 10:24 AM Guilherme G. Piccoli
<gpiccoli@igalia.com> wrote:
>
> On 10/12/2021 12:13, Christian K=C3=B6nig wrote:
> > [...]
> > How about issuing a PCIe reset and re-initializing the ASIC with just
> > the VBIOS?
> >
> > That should be pretty straightforward I think.
> >
> > Christian.
>
>
> Thanks Christian, that'd be perfect! Is it feasible? Per Alex comment,
> we'd need to run atombios commands to reprogram the timings, display
> info, etc...like a small driver would do, a full init.
>

You need the equivalent of a GOP driver or a full GPU driver.  I think
it would be less effort to just fix up any problems amdgpu has when
trying to load after the crash than to write a new mini driver.  By
the time you add everything you'd need, you'd be pretty close to a
full GPU driver.

> Also, what kind of PCIe reset is recommended for this adapter? Like a
> hot reset, powering-off/re-power, FLR or that MODE2 reset present in
> amdgpu code? Remembering this is an APU device.

You'd need to issue the relevant device specific reset sequence.  It
would be a mode2 reset on vangogh, but varies on other asics.  It
would probably be easiest to just fix up the logic in amdgpu to detect
bad GPU state on driver load and do a GPU reset before driver init.
We already have the logic in place for some dGPUs, but APUs only
recently got full GPU reset support due to architectural limitations
and hardware bugs.

Alex
