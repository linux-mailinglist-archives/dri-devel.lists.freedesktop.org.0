Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 90F59843197
	for <lists+dri-devel@lfdr.de>; Wed, 31 Jan 2024 00:52:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7F6E210EBFF;
	Tue, 30 Jan 2024 23:52:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-f169.google.com (mail-yw1-f169.google.com
 [209.85.128.169])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D7D3910EBFF
 for <dri-devel@lists.freedesktop.org>; Tue, 30 Jan 2024 23:51:55 +0000 (UTC)
Received: by mail-yw1-f169.google.com with SMTP id
 00721157ae682-603dc95b8f3so29185577b3.2
 for <dri-devel@lists.freedesktop.org>; Tue, 30 Jan 2024 15:51:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=fooishbar-org.20230601.gappssmtp.com; s=20230601; t=1706658654; x=1707263454;
 darn=lists.freedesktop.org; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=+Loz5WY1FBuRmc2MP9O0V9IXLhLAMsjyW+ysSkOJ3NU=;
 b=nf6Zff/FBn9g+SxhP9YXaoz+fe4ZkaB8X4CIieEUzxnPPjJ6sGXbVMwmSc9QzVIGds
 K7NPKZMs4f3LMp/lcwQsW/Xv03U/plhERL8PAHXva4XEpTmw4BujlFff2Z+ML3/+tzg7
 NVgEwLQSAKtIxfpunGM/iRSIHURIGtzDGAZtKsZaLzaJ52FF17Fy0e4i8/A+vQNSFfh+
 jCWYkmzBegZzvj9jybCn2X6nMbF4npCkZitKNSOWlFSN8KEql/MMkHNCIuZdSgdLzwL5
 IXM7W9V59LKEKbIKelqY9iv6t/ag86SdVvOrPKkxvEltq0aXgYhyaJ0euhtfgp5DcW7k
 SEDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1706658654; x=1707263454;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=+Loz5WY1FBuRmc2MP9O0V9IXLhLAMsjyW+ysSkOJ3NU=;
 b=hi89SktJdqVZ1PS82kAsnRkaPRuuqtoqBwrtx8Y8/Fzy+knCs9QERJyhreO1lQCDac
 yW+ccRYAcLV/xxRDroaVSD4e2aGV/TMXvGTfJoDIYjBbtfxbl5YaObdBl493y16Da49O
 GXSFdpILBqcx4oCvjT1I/0Xl6hseDQCMmehEsjvQXnKOIfhs29rCRBd8xU60cgjwvUH4
 HjKpz6pr0kqGyjMCL2Pr31zRDHxZISlZGcPojfojhjZqZSHGELAhUA58CdgA8Djritq7
 Mv0iSN8Nj8qZputaXER2SR9qXrJeJ/7t7zbWiN2/kxrSMtGphjjUqAIfVeXvLdatUTF0
 bExg==
X-Gm-Message-State: AOJu0YybmlFJEUyt0o/q66fRK5jmdUyHfBct8qe59TqC5YMkNZOxXLRS
 bIBI9Fk7wvgFtzyGYw4qnvdnf5JTbNK2l4P98tVVlzRFQBckVNAFPtnsLvD4qiLCxQikBPVgr2A
 KblXFUebwXLNhki7Kqe/Xi6dAhnBTRpW7S798+Q==
X-Google-Smtp-Source: AGHT+IFwGrsAy5u8s6ltX3OV8suiJlJdOjJFY2Y97aJi5/K9jqLcDJ/otXHocyfcS7Yf9B5jl/2zpaNXS3/+O2W44bE=
X-Received: by 2002:a0d:e8c1:0:b0:5ff:5bee:ac90 with SMTP id
 r184-20020a0de8c1000000b005ff5beeac90mr8466987ywe.74.1706658654332; Tue, 30
 Jan 2024 15:50:54 -0800 (PST)
MIME-Version: 1.0
References: <20240112203803.6421-1-ian.forbes@broadcom.com>
 <3d7f835a-eed8-4d98-9539-68061779f285@suse.de>
 <CABQX2QMUfZMNRN-RfVhvZzkGhn4zRY-B51Ph_KYzXWmZ_8tfAQ@mail.gmail.com>
 <613cf732-fc95-4f61-b64d-772206460535@suse.de>
 <CABQX2QP8nLpM6e3D3qQASvbxr1DDON1dq=s+iNBcczhSJu8Ggg@mail.gmail.com>
In-Reply-To: <CABQX2QP8nLpM6e3D3qQASvbxr1DDON1dq=s+iNBcczhSJu8Ggg@mail.gmail.com>
From: Daniel Stone <daniel@fooishbar.org>
Date: Tue, 30 Jan 2024 23:50:42 +0000
Message-ID: <CAPj87rOhA6jwq3A5kgQg1w+y-ms2=gF4bZ+Obp3ELq+3f-jemg@mail.gmail.com>
Subject: Re: [PATCH] drm/vmwgfx: Filter modes which exceed 3/4 of graphics
 memory.
To: Zack Rusin <zack.rusin@broadcom.com>
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
Cc: dri-devel@lists.freedesktop.org, Ian Forbes <ian.forbes@broadcom.com>,
 maaz.mombasawala@broadcom.com, bcm-kernel-feedback-list@broadcom.com,
 Thomas Zimmermann <tzimmermann@suse.de>, martin.krastev@broadcom.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On Tue, 30 Jan 2024 at 18:39, Zack Rusin <zack.rusin@broadcom.com> wrote:
> In general, yes. Of course it's a little more convoluted because we'll
> act like OpenGL runtime here (i.e. glXSwapBuffers), i.e. our driver
> will fake page-flips because the only memory we'll have is a single
> buffer as the actual page-flipping happens in the presentation code on
> the host. So the guest is not aware of the actual presentation (it's
> also why we don't have any sort of vblank signaling in vmwgfx, the
> concept just doesn't exist for us). i.e. on para-virtualized drivers
> the actual page-flips will be property of the presentation code that's
> outside of the guest. It's definitely one those things that I wanted
> to have a good solution for in a while, in particular to have a better
> story behind vblank handling, but it's difficult because
> "presentation" on vm's is in general difficult to define - it might be
> some vnc connected host on the other continent. Having said that
> that's basically a wonky VRR display so we should be able to handle
> our presentation as VRR and give more control of updates to the guest,
> but we haven't done it yet.

Please don't.

Photon time is _a_ useful metric, but only backwards-informational.
It's nice to give userspace a good forward estimate of when pixels
will hit retinas, but as it's not fully reliable, the main part is
being able to let it know when it did happen so it can adjust. Given
that it's not reliable, we can't use it as a basis for preparing
submissions though, so we don't, even on bare-metal drivers.

As you've noted though, it really falls apart on non-bare-metal cases,
especially where latency vastly exceeds throughput, or when either is
hugely variable. So we don't ever use it as a basis.

VRR is worse though. The FRR model is 'you can display new content
every $period, and here's your basis so you can calibrate phase'. The
VRR model is 'you can display new content so rapidly it's not worth
trying to quantise, just fire it as rapidly as possible'. That's a
world away from 'errrr ... might be 16ms, might be 500? dunno really'.

The entire model we have is that basis timing flows backwards. The
'hardware' gives us a deadline, KMS angles to meet that with a small
margin, the compositor angles to meet that with a margin again, and it
lines up client repaints to hit that window too. Everything works on
that model, so it's not super surprising that using svga is - to quote
one of Weston's DRM-backend people who uses ESXi - 'a juddery mess'.

Given that the entire ecosystem is based on this model, I don't think
there's an easy way out where svga just does something wildly
different. The best way to fix it is to probably work on predictable
quantisation with updates: pick 5/12/47/60Hz to quantise to based on
your current throughput, with something similar to hotplug/LINK_STATUS
and faked EDID to let userspace know when the period changes. If you
have variability within the cycle, e.g. dropped frames, then just suck
it up and keep the illusion alive to userspace that it's presenting to
a fixed period, and if/when you calculate there's a better
quantisation then let userspace know what it is so it can adjust.

But there's really no future in just doing random presentation rates,
because that's not the API anyone has written for.

Cheers,
Daniel
