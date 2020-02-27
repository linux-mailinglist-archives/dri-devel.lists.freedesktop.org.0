Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 19B031727CA
	for <lists+dri-devel@lfdr.de>; Thu, 27 Feb 2020 19:41:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 343136E04B;
	Thu, 27 Feb 2020 18:41:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [205.139.110.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E2DC16E04B
 for <dri-devel@lists.freedesktop.org>; Thu, 27 Feb 2020 18:41:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1582828880;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Pf4TB8w3Z+jg5ZcPG6oreLqe5mNXEkWdlFZINTXvLg0=;
 b=UOX93s71+2zGFSnTE8CoZB10PBIX1UOJm3Hg5m/4KkHI6x5uQpw94mYgPij3Nj1HmhX3gQ
 iAuyEGNcrHsGKWZUkEuJfnDDsuV23MJ8VnlbCOfWQXW10IOV3aI5kJKHqCo2RHksx18Awy
 6S8lf//R4Agf4DqS3AqwTm674vXLgNQ=
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-382-jiyBlINBOumubWZE_H9ITQ-1; Thu, 27 Feb 2020 13:41:09 -0500
X-MC-Unique: jiyBlINBOumubWZE_H9ITQ-1
Received: by mail-qk1-f198.google.com with SMTP id x19so179347qkh.2
 for <dri-devel@lists.freedesktop.org>; Thu, 27 Feb 2020 10:41:09 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
 :references:organization:user-agent:mime-version
 :content-transfer-encoding;
 bh=Pf4TB8w3Z+jg5ZcPG6oreLqe5mNXEkWdlFZINTXvLg0=;
 b=e5mrFdKyM57WLCOx8he9RzZj7KwWWVZDQgpcAp63lcPn6lbp6C+RS19jz8BMiB8T0k
 ISjRUSkJVSW3Lyz/GvcIIbWfAD5SVjIrC4FzIBIMZyJKUxnTKXLzhOkYMCu6L4yvvF1s
 4Ab6fg2lJaHmWcOpTvZDQ/0J1x/CPBx6Oyw9PhyavGqQSUjcjXfLR8uBziPVwArWvqhG
 qCNTyN4IQCGPxuqVb6DcV53vSNJK+DOsDcpYMR0ZwOXMUk7B2TEp9sJKqTdUirHEZDJ1
 q8Z92n/LJUJVIvYWNdlCch0jHsXgIpkWFL+OtR64Xtj9KTVV1QXk60LDboQrmaaIYLMJ
 cwdw==
X-Gm-Message-State: APjAAAUnyDKpSWqg0tVipNq1voGFAeLifYXwFWcwFDr7vsk8SBbXPbdm
 1BhHHnyN4OtvGl4w0xZnZP4JU/TnS77+f3FIvS7LKzTBN8VZHdhYcVf74orU1F5LVBPs3tUGtpT
 7zpPF7eGVj4ONppO492KEIASQCC5i
X-Received: by 2002:ae9:e40e:: with SMTP id q14mr666019qkc.419.1582828869360; 
 Thu, 27 Feb 2020 10:41:09 -0800 (PST)
X-Google-Smtp-Source: APXvYqzWm7FH0FqAJWftq5uTTLXkvkQ438hikCYPwQu2Qsp4785muxMC5eb0y9XsO29lkoPkxU+7lQ==
X-Received: by 2002:ae9:e40e:: with SMTP id q14mr665995qkc.419.1582828869068; 
 Thu, 27 Feb 2020 10:41:09 -0800 (PST)
Received: from dhcp-10-20-1-196.bss.redhat.com ([144.121.20.162])
 by smtp.gmail.com with ESMTPSA id m200sm3675073qke.135.2020.02.27.10.41.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 27 Feb 2020 10:41:08 -0800 (PST)
Message-ID: <cd775055fc4450bba045cfbde66d45502e16162c.camel@redhat.com>
Subject: Re: 5.6 DP-MST regression: 1 of 2 monitors on TB3 (DP-MST) dock no
 longer light up
From: Lyude Paul <lyude@redhat.com>
To: Hans de Goede <hdegoede@redhat.com>
Date: Thu, 27 Feb 2020 13:41:07 -0500
In-Reply-To: <99213368-5025-8435-502b-3d23b875ca60@redhat.com>
References: <99213368-5025-8435-502b-3d23b875ca60@redhat.com>
Organization: Red Hat
User-Agent: Evolution 3.34.4 (3.34.4-1.fc31)
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
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
Cc: intel-gfx <intel-gfx@lists.freedesktop.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

hi - I almost certainly know the solution to this, the patches that we got
from amd to do bandwidth checking in the DP MST helpers don't actually work
correctly in a lot of cases and I need to fix them. I've just been busy on PTO
and only just got back today, and have been busy with fixing a lot of RHEL
stuff at the same time. I'll take a closer look at this soonb

On Wed, 2020-02-26 at 16:15 +0100, Hans de Goede wrote:
> Hi Lyude and everyone else,
> 
> Lyude I'm mailing you about this because you have done a lot of
> work on DP MST, but if this rings a bell to anyone else feel
> free to weigh in on this.
> 
> I'm currently using a Lenovo X1 7th gen + a Lenovo TB3 gen 2 dock
> as my daily rider for testing purposes. When 5.6-rc1 came out I
> noticed that only 1 of the 2 1920x1080@60 monitors on the dock
> lights up.
> 
> There are no kernel errors in the logs, but mutter/gnome-shell says:
> 
> gnome-shell[1316]: Failed to post KMS update: Page flip of 93 failed
> 
> With 93 being the crtc-id of the crtc used for the monitor which is
> displaying black. Since then I've waited for 5.6-rc3 hoping that a
> fix was already queued up, but 5.6-rc3 still has this problem.
> 
> gnome-shell does behave as if all monitors are connected, so the
> monitor is seen, but we are failing to actually send any frames
> to it.
> 
> I've put a log collected with drm.debug=0x104 here:
> https://fedorapeople.org/~jwrdegoede/drm-debug.log
> 
> This message stands out as pointing to the likely cause of this problem:
> 
> [    3.309061] [drm:intel_dump_pipe_config [i915]] MST master transcoder:
> <invalid>
> 
> Regards,
> 
> Hans
> 
-- 
Cheers,
	Lyude Paul (she/her)
	Associate Software Engineer at Red Hat

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
