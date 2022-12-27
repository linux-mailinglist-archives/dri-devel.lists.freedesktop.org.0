Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E0176656B78
	for <lists+dri-devel@lfdr.de>; Tue, 27 Dec 2022 14:55:50 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7BB3010E049;
	Tue, 27 Dec 2022 13:55:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A14E110E049
 for <dri-devel@lists.freedesktop.org>; Tue, 27 Dec 2022 13:55:44 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 182EA60F04
 for <dri-devel@lists.freedesktop.org>; Tue, 27 Dec 2022 13:55:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7E6B8C433D2
 for <dri-devel@lists.freedesktop.org>; Tue, 27 Dec 2022 13:55:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1672149313;
 bh=DDSWpfv09+HzenodYoAbMWDWPA14dRQ0e065Dr40gCo=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=rwTAeHyGxVOW5Dbcm6SEzvoUweAGydSGHcaSDNq5XOfq1cIWubh016o1qkm+pg0g3
 Yo7kq17LAvdq+Z4gF2owDpEY8Tzewf3n7VVC8Sck3GFti+r5BnIWzhdLllzePF1fTq
 jqb9KTvLZerE2SyaBEG0gRB0LQXZSqYDZsJoETEwF5h/hKt7/5ghVaN09ZoOin6+xT
 FxriluxnQfD4udARHwt6MR0S/d27GE0xo50ADfRHRDx/SFe2/k4zBG1dHiIYRiwPyi
 Uj4GjhY3AlQ6+iB4haOGASndul90VITz0JAHcBq3VzqeOP6oGuPbquJfW1XxXzlPgt
 59S0pwE9LpsYg==
Received: by mail-yb1-f179.google.com with SMTP id g4so14449670ybg.7
 for <dri-devel@lists.freedesktop.org>; Tue, 27 Dec 2022 05:55:13 -0800 (PST)
X-Gm-Message-State: AFqh2koY93ulm3Yfjc2gI73Il3+uYrx0Puu4dOCQ7zpNelWPZN5+k51I
 GbUzPV6PO4B5aXobTuBEcPZ7Wbe0xyi7//Uml8o=
X-Google-Smtp-Source: AMrXdXtdhMPJgR+G704Hr2Qm57p/sc0zMlYZL15NgWmByup1yCbXBVypXpi4wi0qKGkE5pCgl3yne0C8YcuGJZC+YyE=
X-Received: by 2002:a25:bec3:0:b0:6ee:f3dc:b8d0 with SMTP id
 k3-20020a25bec3000000b006eef3dcb8d0mr2470667ybm.642.1672149312572; Tue, 27
 Dec 2022 05:55:12 -0800 (PST)
MIME-Version: 1.0
References: <20221226213227.26953-1-ogabbay@kernel.org>
 <Y6qeDQY+X6ZRn3bi@kroah.com>
 <CAFCwf11GO4n-nOhyLDAG9k9MSJ1xfjj6_1nH=X9vKgdbvY62yw@mail.gmail.com>
 <Y6r3I5M6IQdSb5LE@kroah.com>
In-Reply-To: <Y6r3I5M6IQdSb5LE@kroah.com>
From: Oded Gabbay <ogabbay@kernel.org>
Date: Tue, 27 Dec 2022 15:54:46 +0200
X-Gmail-Original-Message-ID: <CAFCwf10j9O20fO15-7gOAGqKAYQ8n3fh-bU56EkXT+rNF5fkxA@mail.gmail.com>
Message-ID: <CAFCwf10j9O20fO15-7gOAGqKAYQ8n3fh-bU56EkXT+rNF5fkxA@mail.gmail.com>
Subject: Re: [PATCH 1/2] habanalabs/uapi: move uapi file to drm
To: Greg KH <gregkh@linuxfoundation.org>
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
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Dec 27, 2022 at 3:46 PM Greg KH <gregkh@linuxfoundation.org> wrote:
>
> On Tue, Dec 27, 2022 at 02:04:14PM +0200, Oded Gabbay wrote:
> > On Tue, Dec 27, 2022 at 9:26 AM Greg KH <gregkh@linuxfoundation.org> wrote:
> > >
> > > On Mon, Dec 26, 2022 at 11:32:26PM +0200, Oded Gabbay wrote:
> > > > Move the habanalabs.h uapi file from include/uapi/misc to
> > > > include/uapi/drm, and rename it to habanalabs_accel.h.
> > > >
> > > > This is required before moving the actual driver to the accel
> > > > subsystem.
> > >
> > > What requires this?  Isn't this going to break userspace code?
> > Yes, most definitely it will break userspace code. Moreover, the
> > patches I'll send in 1-2 weeks to change the device char files will
> > also break it.
> > Having said that, I'm not worried because I don't believe anyone is
> > working with the upstream version because there is no NIC support
> > (yet).
>
> Ok, if you are sure that no one will complain about broken builds,
> that's fine to move, but be aware that if they do complain, you'll have
> to back these changes out.
Of course, I completely understand that.
Thanks,
Oded
>
> thanks,
>
> greg k-h
