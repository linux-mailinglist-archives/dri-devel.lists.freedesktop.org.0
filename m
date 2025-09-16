Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 74DBBB59552
	for <lists+dri-devel@lfdr.de>; Tue, 16 Sep 2025 13:36:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D74BD10E766;
	Tue, 16 Sep 2025 11:36:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=fooishbar.org header.i=@fooishbar.org header.b="kSCdUh1P";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-f172.google.com (mail-qk1-f172.google.com
 [209.85.222.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 84C9E10E766
 for <dri-devel@lists.freedesktop.org>; Tue, 16 Sep 2025 11:36:03 +0000 (UTC)
Received: by mail-qk1-f172.google.com with SMTP id
 af79cd13be357-82946485d12so214794685a.2
 for <dri-devel@lists.freedesktop.org>; Tue, 16 Sep 2025 04:36:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=fooishbar.org; s=google; t=1758022562; x=1758627362;
 darn=lists.freedesktop.org; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=SH1YrISjUjfcGMPFMzttfXX1gkszwXYBjRRB0syXDNY=;
 b=kSCdUh1P1XyHAXpgGb77ePzywGuF25FVkpyKjG00TBxoyymlZ3euB3KKepm30ihJxO
 yZlJQeQJ2Vs5DQJGiApv5aLI7mGFSKeaubxoRWYkInt0aMqld9py3X61Vih6e8EC2EUl
 peoCUzrJkSNNb/8RG4Hjb/6tXxhFITpTVQtmx6C0C1ZHLxq8ZEjyzocQh2LQOz7pcfwi
 f77Wk5rJwJv3DO0+MhwGasRihHSWsCcnx87s8euiCNsEgR0cVuj3Wcvrjurd56HO39/Z
 tXayb0EtDuGp0QxCfiE1v8A/T/Ds9rCRtSpklXmclP/0xt/ZkNOc3tb0cOP7NV2HjS27
 brPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1758022562; x=1758627362;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=SH1YrISjUjfcGMPFMzttfXX1gkszwXYBjRRB0syXDNY=;
 b=t9UdNfTRbfPvSygreGrKmq8wgi8D73fsdGacgqsgK9/C5/eXaEBwzjoW32x8//dyVm
 gYQ5zeOTLKvT3GBxKlzzuC+2CfT+40ON2RgKCmqw1mpZTLZlHa5m26iokuDokuGJHbM7
 r305LGGJjmrFh2C+hnDduHqQWsDIEsomz4YgbJYNIc1vCZPtN+DDH5Tiz6BEsNc3HJA2
 mj/Qu+VTZac/UkgAhntqpAhIUJ9nX7g5ahFuVS/zkCd4X2SOWZ2+Fg/Kjl5Bu1LGOSFu
 vx9uk7cxnVdMvi0/UNXCrl5fVIDS7H9tmSsLjFs3839lulJ6J3132MAWiDDtlJpg4HlE
 BL0A==
X-Forwarded-Encrypted: i=1;
 AJvYcCVkay0e7reGObKhxseIk9wnoyXwH0csY7bNsr87a4eBcQaZbfCKPFuxAxFzV+kuRab2XCF/nwI9xzI=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxVmXgFMq3V8gmw2nKmjt9MJMainMDwiH9YtkMjd8I+G3LLrfGc
 uMrhuMp9BURVTinxSkzz95hAAxk7hlabX+hlrHVdJPWqO9XiPL2SB4vFBymoPY2ZjxjQ6pbyZUr
 NQ3WZv1Vnp0j/MXyxGZl6q99222/AKbXtHwuJ78vA4w==
X-Gm-Gg: ASbGncupHPZQPfCe7QlKR/EtqyouE1FnncmkiFduOpz+LE9X+Cx94dViD1OHpK+XmKx
 xMxoqjlgcT7Dzw8a612t7TWKE3fU0Qcby5t3kqj+xUWjUqDKGtvH9MM7mpBDI5+SD8mJ56XfeUM
 oA+MYsjkqpD7rLmPo/iq2HTPCMouxO/lm9I70YY5KSAxCnOlLvZN8vlevYODUZB0Ao7so61yEH9
 5m4U1ly1Mlx8iyhCZ5BvWdeyjl81bAphRAJl7fgeQ==
X-Google-Smtp-Source: AGHT+IFDD4VMRXRKwzrPg72e7djdb9KhAzDUYuw6mqpdWLtGAOTHu1kBFdZyS6itWK6zw+E1yypC1Hay6Lr91uCi4d0=
X-Received: by 2002:a05:620a:3916:b0:81d:4345:6e9a with SMTP id
 af79cd13be357-824032afedemr1685902585a.56.1758022562189; Tue, 16 Sep 2025
 04:36:02 -0700 (PDT)
MIME-Version: 1.0
References: <20250911130739.4936-1-marius.vlad@collabora.com>
 <20250911130739.4936-4-marius.vlad@collabora.com>
 <ssvxorsrhum2eo2uiieradrrmytemivr6m5c3mskalehzaj4ci@nc74epxgjq5w>
 <aMMDxIWN9TadgVyw@xpredator>
 <6zmp2dzpvcb4hi4kaa66q5o4rlcpdkor75ci4rnvalt2a37f26@lbmvc4t2ow4z>
 <CAPj87rNxGfroKTf1i5UtmmnZ9wDQTdZFDMKw-MLdbCfjTCD=Uw@mail.gmail.com>
 <20250916-piquant-jerboa-of-completion-87b80d@houat>
 <CAPj87rMuwvir_aDReT1ou-BNs3w9coUG6MPmCnGAeg5rQ97rCQ@mail.gmail.com>
 <CAPj87rPRG=7qPp3QMXf_6FP82-gWdgWpXdHmwZjHKrnU-PdQ0g@mail.gmail.com>
 <b6sosuofgvanq7hjj6lfev4ifu7muhhd45lncdu3m3r42rqwaq@tgxtumlxhtkx>
 <CAPj87rOUgY+WEP73hL8kWhgbXHG7krvraQb6n__tC=vr5y0=Cg@mail.gmail.com>
 <CAO9ioeXb0qcJsfjZMG=1MMUL7RWuge4h2zK7Q1y_u-FS+syGTA@mail.gmail.com>
In-Reply-To: <CAO9ioeXb0qcJsfjZMG=1MMUL7RWuge4h2zK7Q1y_u-FS+syGTA@mail.gmail.com>
From: Daniel Stone <daniel@fooishbar.org>
Date: Tue, 16 Sep 2025 12:35:50 +0100
X-Gm-Features: AS18NWAI4kAXvV7v4n2w2TTUWoAfvIU7NxZpxOE4KpRqp__syxifIP0bR--uDAI
Message-ID: <CAPj87rNeMd87XZJQscLZVhrPtW+8y79kLFy1ZXUq9eOWrOwMFQ@mail.gmail.com>
Subject: Re: [PATCH 3/8] drm: Add new general DRM property "color format"
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Maxime Ripard <mripard@kernel.org>, Marius Vlad <marius.vlad@collabora.com>,
 dri-devel@lists.freedesktop.org, wse@tuxedocomputers.com, andri@yngvason.is, 
 sebastian.wick@redhat.com, daniel.stone@collabora.com, 
 jani.nikula@linux.intel.com, tzimmermann@suse.de, simona.vetter@ffwll.ch, 
 harry.wentland@amd.com, christian.koenig@amd.com, derek.foreman@collabora.com
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

Hi,

On Tue, 16 Sept 2025 at 12:15, Dmitry Baryshkov
<dmitry.baryshkov@oss.qualcomm.com> wrote:
> On Tue, 16 Sept 2025 at 14:11, Daniel Stone <daniel@fooishbar.org> wrote:
> > I'm slightly confused as to what you're saying here. Are you saying
> > that it's OK for the kernel to expose connector properties for
> > userspace to see which colour properties
> > (model/range/depth/subsampling) are OK and control what is actually
> > used, but your hard line is that the kernel must do an intersection
> > between the sink EDID and the encoder/connector capabilities to filter
> > the list to what it believes to be achievable?
>
> Yes. I'm sorry if I was not explicit enough. I'm fine with the idea of
> the color format property (not just for HDMI, DP will need it too).
> But I think the kernel should not be exposing 4:2:0 there if it
> detects that the monitor can't support 4:2:0 at all. Likewise we
> should be failing to enable 4:2:0 for a particular mode if the display
> didn't list it in Y420CMDB (and we don't have e.g. a quirk of 'the
> display lies, 420 is supported for this mode).

No problem at all, I think I was just being dense and not quite
parsing it properly. :)

I can see where you're going. There's definitely quite a bit of sense
in it - I'm just not sure about the value tradeoff, since I would
expect any userspace which is sophisticated enough to want
fine-grained control (as opposed to 'just get the splash screen up so
the user can enter their LUKS passphrase'), to be sophisticated enough
to also be parsing the EDID.

So I would still lean towards it not being worth the complexity in the
kernel to implement validation for userspace which really should know
better - and which already needs to have fallback handling for silent
as well as explicit failure, given part of the usecase is to be able
to deal with marginal signal propagation. But I'm not really against
it, so if you really want to see it then that should be fine.

Cheers,
Daniel
