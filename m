Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 63D823DF174
	for <lists+dri-devel@lfdr.de>; Tue,  3 Aug 2021 17:30:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5E7D56E1A8;
	Tue,  3 Aug 2021 15:30:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 570 seconds by postgrey-1.36 at gabe;
 Tue, 03 Aug 2021 15:30:02 UTC
Received: from smtp-relay-canonical-0.canonical.com
 (smtp-relay-canonical-0.canonical.com [185.125.188.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AB7706E1A8
 for <dri-devel@lists.freedesktop.org>; Tue,  3 Aug 2021 15:30:02 +0000 (UTC)
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-relay-canonical-0.canonical.com (Postfix) with ESMTPS id BFEA53F356
 for <dri-devel@lists.freedesktop.org>; Tue,  3 Aug 2021 15:20:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
 s=20210705; t=1628004030;
 bh=HaHeoSpc0/w45l3bVizKObUtZFG4/fyFOXwhQ5XDWl8=;
 h=Date:From:To:Cc:Message-ID:In-Reply-To:References:Subject:
 MIME-Version:Content-Type;
 b=SleQ2M9HASkOwKeWRJta7iwZATA0OSbLb7hZUsODPiE+cbc115+wy5TWfEMG7uc7q
 lQTlWHnqUjeF+YKNaWyXEdG0DfLtxylcmDWLJCS7IR1+WKKh1mAvCka5RJeBa8HKyT
 O4axDJf3WIYpTT3vCW6xK6kYtRTp3FaE8wo6EtD0kHYoz3iVQl0hKma2zmuSs/ly1R
 v4NWXcu4e4tdQWQBm4G4YVoTiWM7+1hgM7NXJFJZZU8R6EmmUQMwy/Fbpp2DWHfSyh
 F7vjzxmp9aioA3eSNH4LLPJdIpBcVnifup66rMNGgFe5mypJugoDWBPzAf8E1Juhx3
 WgfQ+Y5wKzGbQ==
Received: by mail-wr1-f69.google.com with SMTP id
 q13-20020a05600000cdb02901545f1bdac1so3950020wrx.4
 for <dri-devel@lists.freedesktop.org>; Tue, 03 Aug 2021 08:20:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:message-id:in-reply-to
 :references:subject:mime-version:content-transfer-encoding
 :content-disposition;
 bh=HaHeoSpc0/w45l3bVizKObUtZFG4/fyFOXwhQ5XDWl8=;
 b=G7+awe8h0m6ZfoxrwVhEHigB9dWLgawDxCs3jFpp/3Fzr0hHxWhhvNUwwmyiisZBEh
 CApzabcwiOH3et55mRV9WpAQmmzgG969ZfWQyvca8xir8tcPKi7sqAn7Xps+YsUzfvT5
 jx1hrwjL7zaEKz4u7YP6c2y1ACNdM+3ABmnahqxIfe0YPUu3yGAtjZTw6DMDFy8mwnaH
 Hx2yTW75hmPzRvCVrnrkwgWImcbaEYSUKe2i81FvY7EFcKqxECWU9RAuoVbT7e+hKlwk
 VzPZvOu9mXOHv8sgvx88ngpvxy3fbVQkIw8FxGJghaqsJ9ZcUv7FH2npKachudk19cxz
 8L9A==
X-Gm-Message-State: AOAM5316TQweQvcixjwWMvWbt+3dPuKhPBJ8bWIShzgwhLGcGImwYCQq
 i34YQZtURjog3lYVAVlmZng8WudnBzg4M7DdTP7dwMK/U2CPeN7HuLxE810jIBmJ0Jl1u+Z2c2Z
 EBJ0bbqS3f6lygQRBu21W3Tc9n6ITAct5BHT7hehww5pNGA==
X-Received: by 2002:a1c:7e85:: with SMTP id z127mr22444738wmc.11.1628004029954; 
 Tue, 03 Aug 2021 08:20:29 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwEzjC+/pW0C1Sqw4ydhWVDqpDLVx+zCm1JU0utSrWeKobmQxeo9gpJI0BDCGIcWIUMPwlMxA==
X-Received: by 2002:a1c:7e85:: with SMTP id z127mr22444711wmc.11.1628004029751; 
 Tue, 03 Aug 2021 08:20:29 -0700 (PDT)
Received: from tricky (net-93-71-200-33.cust.vodafonedsl.it. [93.71.200.33])
 by smtp.gmail.com with ESMTPSA id d16sm14876581wrx.76.2021.08.03.08.20.28
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Tue, 03 Aug 2021 08:20:29 -0700 (PDT)
Date: Tue, 3 Aug 2021 17:20:33 +0200
From: Marco Trevisan <marco.trevisan@canonical.com>
To: Rajat Jain <rajatja@google.com>
Cc: Hans de Goede <hdegoede@redhat.com>, Simon Ser
 <contact@emersion.fr>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard
 <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, Daniel
 Vetter <daniel@ffwll.ch>, David Airlie <airlied@linux.ie>, Jani Nikula
 <jani.nikula@linux.intel.com>, Joonas Lahtinen
 <joonas.lahtinen@linux.intel.com>, Rodrigo Vivi
 <rodrigo.vivi@intel.com>, Mark Gross <mgross@linux.intel.com>, Andy
 Shevchenko <andy@infradead.org>, Pekka Paalanen
 <pekka.paalanen@collabora.com>, Sebastien Bacher <seb128@ubuntu.com>, 
 intel-gfx <intel-gfx@lists.freedesktop.org>, 
 "=?utf-8?Q?dri-devel=40lists.freedesktop.org?="
 <dri-devel@lists.freedesktop.org>, 
 "=?utf-8?Q?platform-driver-x86=40vger.kernel.org?="
 <platform-driver-x86@vger.kernel.org>, Mark Pearson
 <markpearson@lenovo.com>, Mario Limonciello <mario.limonciello@outlook.com>
Message-ID: <78260D21-AD73-4EBC-8E69-A5B16F1A72D5@getmailspring.com>
In-Reply-To: <CACK8Z6FPsywe49fP=5pVc5DFm--4xt0daYLDzpbujA1_qoK7Dg@mail.gmail.com>
References: <CACK8Z6FPsywe49fP=5pVc5DFm--4xt0daYLDzpbujA1_qoK7Dg@mail.gmail.com>
Subject: Re: [PATCH v2 0/9] drm: Add privacy-screen class and connector
 properties
X-Mailer: Mailspring
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
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

Hi Rajat,

The merge proposals are now in place after discussing a bit more with upstream:

 - https://gitlab.gnome.org/GNOME/gsettings-desktop-schemas/-/merge_requests/49
 - https://gitlab.gnome.org/GNOME/mutter/-/merge_requests/1952
 - https://gitlab.gnome.org/GNOME/gnome-control-center/-/merge_requests/1032

This is all implemented and working for the wayland backend, for X11 I'm
looking at it right now, even though it seems that we don't get any
RRScreenChangeNotify on hotkey changes, and monitoring udev directly
seems overkill. Anything should be adjusted at lower levels?

Cheers

On lug 13 2021, at 9:25 pm, Rajat Jain <rajatja@google.com> wrote:

> Hello Hans, Marco, et al,
> 
> On Tue, Apr 27, 2021 at 10:03 AM Marco Trevisan
> <marco.trevisan@canonical.com> wrote:
>> 
>> Hi,
>> 
>> >>> There now is GNOME userspace code using the new properties:
>> >>> https://hackmd.io/@3v1n0/rkyIy3BOw
>> >>
>> >> Thanks for working on this.
>> >>
>> >> Can these patches be submitted as merge requests against the upstream
>> >> projects? It would be nice to get some feedback from the maintainers,
>> >> and be able to easily leave some comments there as well.
>> 
>> FYI, I've discussed with other uptream developers about these while
>> doing them, and afterwards on how to improve them.
>> 
>> > I guess Marco was waiting for the kernel bits too land before
>> > submitting these,
>> > but I agree that it would probably be good to have these submitted
>> > now, we
>> > can mark them as WIP to avoid them getting merged before the kernel side
>> > is finalized.
>> 
>> I'll submit them in the next days once I'm done with the refactor I've
>> in mind, and will notify the list.
> 
> Any updates on the privacy-screen patchset? Can Hans' patchset be
> accepted upstream now?
> 
> Thanks,
> 
> Rajat
> 
>> 
>> And for sure we can keep them in WIP till the final bits aren't completed.
>> 
>> Cheers
> 
