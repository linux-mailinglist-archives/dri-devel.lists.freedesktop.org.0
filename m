Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CBD984709BE
	for <lists+dri-devel@lfdr.de>; Fri, 10 Dec 2021 20:05:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F17E610E583;
	Fri, 10 Dec 2021 19:05:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x232.google.com (mail-oi1-x232.google.com
 [IPv6:2607:f8b0:4864:20::232])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3EAC610E582;
 Fri, 10 Dec 2021 19:05:37 +0000 (UTC)
Received: by mail-oi1-x232.google.com with SMTP id t19so14540835oij.1;
 Fri, 10 Dec 2021 11:05:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=eE7LEXLBndGG1htPQ+DXNYXDObvNjAlKpnwTZx768wc=;
 b=eOJZva4Fq1luajmeTCOHeGthRyrZdIKhZ514Ze8syFWhn42iAWp7fHREQ1llf+rnDP
 ZoGAUfQfUQypcyflo52/gGgBIDeJZOKno5WHENWSjVzvVt0KVkBlO8u2JdtlUvojfjKq
 DIuCjPkbyA4Xw/5bIkLz/mYo5me9MEVPZcquO57vWajLufnnl5JnDfqxeqopN/lS5KJY
 z2u9qNDMw7d0dhFLu62zkU89T2qZrO/ie5Ui3gifR6q0YwnuTzPdJsqat0eRbrqQRfbg
 x7pjc6o2jFtWU5qATsl3I/6HW/J3YnO/WKzqe4jr3LVPBk1zBUdlMhIlYkhCv/KhKENu
 4o3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=eE7LEXLBndGG1htPQ+DXNYXDObvNjAlKpnwTZx768wc=;
 b=AwolOoUUid/9uSaU5lF50XifWMQsxvf+8XbMRTuWhEysfMWpOq8maxXDWTFyI/ia41
 ULlyJ6oEXirMw2o0Hj+yJigZzKvnJ4tPSHRFbuGQo4GnDjKecTHomWOfFuEslQxBiSSr
 glY/oUXUwnNiQ4uKTX4cFP+MS9IIKat45c+owDP+4WPMYir8auHJ7UTwo86FKIaKFK52
 0sQUOaFIb0FhUF7gxq2FkHiZPSFzIk1WdDZxuIUgxxqPlKvEvGjwainUY5HJQ3tt3Jpi
 pYXz7i/KWAHVheB4MEebbmI1eYvINN87GidNr/pz/oVcSGqraJBKB7J1QINLcJANpQJ7
 ZglA==
X-Gm-Message-State: AOAM532SFi9F7zQQS/WGfCd2JX2z05CH+pV6jsvpnj+wvGcUDwyZplD7
 PQ7qzB46C+s3r0Rx4CY1LFrAymI1/+CIL6cOmH8=
X-Google-Smtp-Source: ABdhPJwY+3OIlLMQRK831jBALf9pBKI0vv9FSDO/7G8EZuTphIx/zK41Uwd0OUE7wTRPguj3+nvRSAdElVT9nmALC7Y=
X-Received: by 2002:a05:6808:68f:: with SMTP id
 k15mr13685527oig.5.1639163136150; 
 Fri, 10 Dec 2021 11:05:36 -0800 (PST)
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
In-Reply-To: <56dfb915-036b-0584-f0ef-83c786970d6e@igalia.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Fri, 10 Dec 2021 14:05:25 -0500
Message-ID: <CADnq5_NphKQwa=sPWEWPTDbQVHGXQd0Ue8GNJR975jCvka7dQA@mail.gmail.com>
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
 xinhui pan <Xinhui.Pan@amd.com>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>,
 Baoquan He <bhe@redhat.com>,
 =?UTF-8?Q?Samuel_Iglesias_Gons=C3=A1lvez?= <siglesias@igalia.com>,
 kernel@gpiccoli.net, kexec@lists.infradead.org,
 amd-gfx list <amd-gfx@lists.freedesktop.org>, pjones@redhat.com,
 Gerd Hoffmann <kraxel@redhat.com>, Thomas Zimmermann <tzimmermann@suse.de>,
 "Deucher, Alexander" <alexander.deucher@amd.com>,
 Dave Young <dyoung@redhat.com>, Christian Koenig <christian.koenig@amd.com>,
 Vivek Goyal <vgoyal@redhat.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Dec 10, 2021 at 9:25 AM Guilherme G. Piccoli
<gpiccoli@igalia.com> wrote:
>
> On 10/12/2021 11:16, Alex Deucher wrote:> [...]
> > Why not just reload the driver after kexec?
> >
> > Alex
>
> Because the original issue is the kdump case, and we want a very very
> tiny kernel - also, the crash originally could have been caused by
> amdgpu itself, so if it's a GPU issue, we don't want to mess with that
> in kdump. And I confess I tried modprobe amdgpu after a kdump, no
> success - kdump won't call shutdown handlers, so GPU will be in a
> "rogue" state...
>
> My question was about regular kexec because it's much simpler usually,
> we can do whatever we want there. My line of thought was: if I make it
> work in regular kexec with a simple framebuffer, I might be able to get
> it working on kdump heheh
>

Well if the GPU is hung, I'm not sure if you'll be able to get back
the display environment without a GPU reset and once you do that,
you've lost any state you might have been trying to preserve.

Alex
