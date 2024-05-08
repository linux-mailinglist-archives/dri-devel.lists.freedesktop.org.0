Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 209FF8BF8C0
	for <lists+dri-devel@lfdr.de>; Wed,  8 May 2024 10:38:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2389A10F235;
	Wed,  8 May 2024 08:38:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=fooishbar-org.20230601.gappssmtp.com header.i=@fooishbar-org.20230601.gappssmtp.com header.b="UpDe+1YB";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-f169.google.com (mail-qk1-f169.google.com
 [209.85.222.169])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6410210F26B
 for <dri-devel@lists.freedesktop.org>; Wed,  8 May 2024 08:38:46 +0000 (UTC)
Received: by mail-qk1-f169.google.com with SMTP id
 af79cd13be357-7928c5cb63fso44646285a.1
 for <dri-devel@lists.freedesktop.org>; Wed, 08 May 2024 01:38:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=fooishbar-org.20230601.gappssmtp.com; s=20230601; t=1715157525; x=1715762325;
 darn=lists.freedesktop.org; 
 h=to:subject:message-id:date:from:in-reply-to:references:mime-version
 :from:to:cc:subject:date:message-id:reply-to;
 bh=V5spKHAJYycDPIb8qjonfW7CCAIoHcDr+o3JbjTG3F8=;
 b=UpDe+1YBEFYLB75FOTSqRFcD/1W1mOKiVK+NdqYtXzMYqp9hkZqxMGxlWVH3YRqVp3
 x0fIMLZBoqot7+gGO20BGuBUUx0U2zL3061rF2SVRosmcmY7V8K2mPSf10y/8I2zwvKQ
 UpdFp5f8b+klKT7T6tzi3RI8XqtLWVrfOfFI8O92OGiNBeoh4neUrklyxjPrLW9Becsa
 h8fubk+NMjlDt6DCNqrqZsz3/lOczLjMuW2gKGHBvsHXGE7dkgqMLPCfEiEah3vuln8Q
 snvLVBAQS9aHIWGZMmpDuDpZp/Bq+UJtIPe9rWvKAHRkz99dVPXW40okGzLh3NNyJVjt
 UkOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1715157525; x=1715762325;
 h=to:subject:message-id:date:from:in-reply-to:references:mime-version
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=V5spKHAJYycDPIb8qjonfW7CCAIoHcDr+o3JbjTG3F8=;
 b=Qa5kifzgsLlMe3VSzkx1gUEIOCHs5ZgsP2xnjfDXxiCdmqU6NpqKpH+//ixieDkphU
 fyFEWyRONfVqYCEa9KVG7qZolRxh0CQvix39EwhyOXFBDXV//abvw7fB7dilDdsf9/Mt
 FUj5TTDQGkQb1heT6+15IEi3k8Ynxe5mzz0HyQR4nqX37A/USSiLx/Gc8Ly6QbB+2Rf2
 odAoTWARkHDQ8SdYFjToTVDJa+yhHdjfiQ9pM11Rl1zjv693OeJZWUCAsLUW6SQMrJjo
 cZB33HHOZs7e1ZGyJPL3gp7y/1CsLBFoJ72yXY6yPZ01A1HMcHo23TLun7OWKnaGEJ6q
 raog==
X-Forwarded-Encrypted: i=1;
 AJvYcCWDdCk5HcRmnST1C4gfHe0yfMNbqNNsUxnPVbpipOWtfdX0hazqgm7Tc9GSF38xhCJvp0JnKsD/mMq8XwB4QpMvZS5u99N/ddcTXosbYAIF
X-Gm-Message-State: AOJu0YxvRWE79FbZ/oMHAM0/CCdEvetNWW1vDvWBwjGBh2Mo/P8GcXwb
 e0I9iTaaywjqZpeh6OaBVlfe/I+GTSk+B+WYWEQHTF6cNtjOvuArC8mzzEqzhErMjZVlAdqSgdr
 X1RmLjBFUjjx6QSGplsX5kmQSqOTOaJ3VXtQooA==
X-Google-Smtp-Source: AGHT+IGBmSz6eFLsDLHd1HFg7kcp7kmSokUNcM7b494MpO41SWF9RR8A0fpKHutyvvQMYFPwHGwiGt9z4eDnQ5YljZw=
X-Received: by 2002:a05:620a:4593:b0:790:b14b:21b9 with SMTP id
 af79cd13be357-792a6481401mr809884385a.18.1715157525012; Wed, 08 May 2024
 01:38:45 -0700 (PDT)
MIME-Version: 1.0
References: <bb372250-e8b8-4458-bc99-dd8365b06991@redhat.com>
 <20240506-dazzling-nippy-rhino-eabccd@houat>
 <ZjjdUBYYKXJ1EPr5@phenom.ffwll.local>
 <cbe5a743-d8be-4b0e-99c4-e804fbadc099@redhat.com>
 <ZjoNTw-TkPnnWLTG@phenom.ffwll.local>
 <CAPj87rN3uSZoHpWLSQqz1SW9YMZNj9fkoA_EDEE_bzv-Tw8tSw@mail.gmail.com>
 <Zjs42PGvilLlF0Cg@phenom.ffwll.local>
In-Reply-To: <Zjs42PGvilLlF0Cg@phenom.ffwll.local>
From: Daniel Stone <daniel@fooishbar.org>
Date: Wed, 8 May 2024 09:38:33 +0100
Message-ID: <CAPj87rN-wSbGSAoB8y3MXCS20_MAQvfpWSeUKYR6XzQ+Oh0FZA@mail.gmail.com>
Subject: Re: Safety of opening up /dev/dma_heap/* to physically present users
 (udev uaccess tag) ?
To: Daniel Stone <daniel@fooishbar.org>, Hans de Goede <hdegoede@redhat.com>, 
 Maxime Ripard <mripard@redhat.com>, Sumit Semwal <sumit.semwal@linaro.org>,
 Benjamin Gaignard <benjamin.gaignard@collabora.com>,
 Brian Starkey <Brian.Starkey@arm.com>, 
 John Stultz <jstultz@google.com>, "T.J. Mercier" <tjmercier@google.com>, 
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
 Lennart Poettering <mzxreary@0pointer.de>,
 Robert Mader <robert.mader@collabora.com>, 
 Sebastien Bacher <sebastien.bacher@canonical.com>, 
 Linux Media Mailing List <linux-media@vger.kernel.org>, 
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 linaro-mm-sig@lists.linaro.org, 
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
 "Bryan O'Donoghue" <bryan.odonoghue@linaro.org>,
 Milan Zamazal <mzamazal@redhat.com>, 
 Andrey Konovalov <andrey.konovalov.ynk@gmail.com>
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

On Wed, 8 May 2024 at 09:33, Daniel Vetter <daniel@ffwll.ch> wrote:
> On Wed, May 08, 2024 at 06:46:53AM +0100, Daniel Stone wrote:
> > That would have the unfortunate side effect of making sandboxed apps
> > less efficient on some platforms, since they wouldn't be able to do
> > direct scanout anymore ...
>
> I was assuming that everyone goes through pipewire, and ideally that is
> the only one that can even get at these special chardev.
>
> If pipewire is only for sandboxed apps then yeah this aint great :-/

No, PipeWire is fine, I mean graphical apps.

Right now, if your platform requires CMA for display, then the app
needs access to the GPU render node and the display node too, in order
to allocate buffers which the compositor can scan out directly. If it
only has access to the render nodes and not the display node, it won't
be able to allocate correctly, so its content will need a composition
pass, i.e. performance penalty for sandboxing. But if it can allocate
correctly, then hey, it can exhaust CMA just like heaps can.

Personally I think we'd be better off just allowing access and
figuring out cgroups later. It's not like the OOM story is great
generally, and hey, you can get there with just render nodes ...

Cheers,
Daniel
