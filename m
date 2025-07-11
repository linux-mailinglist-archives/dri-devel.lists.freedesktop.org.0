Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 46A58B023D8
	for <lists+dri-devel@lfdr.de>; Fri, 11 Jul 2025 20:37:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B012410EAB4;
	Fri, 11 Jul 2025 18:37:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="MX8wyEDf";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com
 [209.85.208.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9B1D010EAB6
 for <dri-devel@lists.freedesktop.org>; Fri, 11 Jul 2025 18:37:50 +0000 (UTC)
Received: by mail-ed1-f44.google.com with SMTP id
 4fb4d7f45d1cf-60c9d8a16e5so4609728a12.0
 for <dri-devel@lists.freedesktop.org>; Fri, 11 Jul 2025 11:37:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linux-foundation.org; s=google; t=1752259069; x=1752863869;
 darn=lists.freedesktop.org; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=NqSyi099qnjScevbzt/A0T/7PehrNF3qhUlbAV32+2s=;
 b=MX8wyEDfuSYCn0yucY5GFu5wW28XbLlSYL482kVQf+IY6oV3rc4nUfgIdbb37tSmtf
 bczri124FfYgsIMlIsV7b56mDJUHuIzcNewbHtRTtF1GohBlOmY7yaZlBlzzL1CMU7yj
 gXYM9O9z4AhepUdQUSkgAbgtlAFFyhbP5qpRU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1752259069; x=1752863869;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=NqSyi099qnjScevbzt/A0T/7PehrNF3qhUlbAV32+2s=;
 b=eePZ52tsZdaLuoAbifnTk8d8yTob3j5Sxan2EgvrCAUSDpMDuIHn8n5bf5qqBhIEZv
 BW8DyiEjFRIIKqx9l+m8hFMu5P7PE2GoYBKOfJ9zf9I52KJLJ2/g/IlzHmk4HsoLnIpb
 p4zsdXMMTDvCwa0CBinvqTvBEgEYhE4nECz3hlv+ArtAdjEELKufP2FOzY8OomvkCWtT
 WDpWx8b++GM1YBlQz4EfJCb3RqHluWOUzBYmFN6RSk6V/NjXVgrgAoTsNNQ4ARgiVzel
 bIZOprWDYfDSmgMwYxTSxam2AC0wOibYpLrQdgRuxUDyUS+VkN5ouUAuVOuTk7yrmFU6
 7sGA==
X-Forwarded-Encrypted: i=1;
 AJvYcCW/jVJ0k6I+B4dj4YQxIwmZTOPverz2Zd+FA6TeZ2YjA3BfBFq0rEaDI/G3jstev5getEbrVokLo1Q=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yy3C51zTQH3O97q+yuU72LSIR9A+kdBYouHHs+xaxH+CD6nwfCJ
 zK3pWGyZMNti/bVX19Sfadk4a5AoWN65hUbf8KTHrL9LJk4yNWmIZFHxNuYNDXazNBytPEnjlaH
 ot4iAicWHeA==
X-Gm-Gg: ASbGnct7zR53RtvTbdoxWZkOSMzQmI33zIW6YWh/EWxuKuyk+TbLcPTGK98Rtu70/YI
 B5BnO/QDoXgB7Z1++w1Un5HEsQvQCEK0KJCs4i6f+yheifJB6F8j6TLbxLclxTzSfWHW8pzRoMO
 kSqfYziWY83eWH1ya5+da+NKZkxHXev/j48rayGh63haB8Uww2wPY4JD722ctPyOkMb/9s1tz8J
 zYqi5dRe90JDRC1KQPoVDucWC/6/ZbdtA8Wizwki0ssXXSL6C8gAAkR+XHVehU4zMVRu20Rfu27
 SUVKMhbqPGASt4hVvdj39M1Lc4JkIi9+pSFhKdhnyFV3gMoZ9eY4oSq0M63LUOa/m+yIOyU+V0j
 RSO7wdQJdUKn/PlX4AedvoaLA86ANgkV2b2zdH6cLEqs03XbdZe8fIXtFpajW0z7DEM4rYxp2
X-Google-Smtp-Source: AGHT+IGiMVSz/wbepqp+KjvvgJcc3gyc3xav8RjhlBMbvK0GgwBDCEkp7a2E8OqVY6P5xFcDTn/oqQ==
X-Received: by 2002:a05:6402:2401:b0:602:bfc6:f99d with SMTP id
 4fb4d7f45d1cf-611e84c1a9cmr4213707a12.24.1752259068727; 
 Fri, 11 Jul 2025 11:37:48 -0700 (PDT)
Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com.
 [209.85.208.48]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-611db7d59e3sm1799220a12.44.2025.07.11.11.37.47
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 11 Jul 2025 11:37:47 -0700 (PDT)
Received: by mail-ed1-f48.google.com with SMTP id
 4fb4d7f45d1cf-60c01f70092so3865951a12.3
 for <dri-devel@lists.freedesktop.org>; Fri, 11 Jul 2025 11:37:47 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AJvYcCVULCEVDS3hTNX3eOOEa4gxAd/5JgnRrdxNh8Q6ezpKLkVRZE8vhUxa/fk/yDtBqt7umlMxiHErDqU=@lists.freedesktop.org
X-Received: by 2002:a05:6402:1d4e:b0:607:5af9:19b6 with SMTP id
 4fb4d7f45d1cf-611e7c107efmr3549154a12.15.1752259066540; Fri, 11 Jul 2025
 11:37:46 -0700 (PDT)
MIME-Version: 1.0
References: <20250711093744.120962-1-tzimmermann@suse.de>
 <CAHk-=whnUp7M-RZ6yzOyF6bzA4cmbckaH4ii_+6nBm0PqKOaQg@mail.gmail.com>
 <CAHk-=wif6u3C4gk7BtR1M+0SvHruXZ7xycP5oDdg-SF1D=ELqQ@mail.gmail.com>
In-Reply-To: <CAHk-=wif6u3C4gk7BtR1M+0SvHruXZ7xycP5oDdg-SF1D=ELqQ@mail.gmail.com>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Fri, 11 Jul 2025 11:37:30 -0700
X-Gmail-Original-Message-ID: <CAHk-=wi3Fbiii2K9fgmoAgoJYoLuRyWfOZhh57FmREE15RbiUg@mail.gmail.com>
X-Gm-Features: Ac12FXz4IEMNfmtixe8DP0mDcYY7Ge-_C9kKvhQh3DPD6bVXdbf7Bxr8kqE2eLE
Message-ID: <CAHk-=wi3Fbiii2K9fgmoAgoJYoLuRyWfOZhh57FmREE15RbiUg@mail.gmail.com>
Subject: Re: [PATCH 0/9] drm: Revert general use of struct
 drm_gem_object.dma_buf
To: Thomas Zimmermann <tzimmermann@suse.de>
Cc: simona@ffwll.ch, airlied@gmail.com, christian.koenig@amd.com, 
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, l.stach@pengutronix.de, 
 linux+etnaviv@armlinux.org.uk, kraxel@redhat.com, christian.gmeiner@gmail.com, 
 dmitry.osipenko@collabora.com, gurchetansingh@chromium.org, olvaffe@gmail.com, 
 zack.rusin@broadcom.com, bcm-kernel-feedback-list@broadcom.com, 
 dri-devel@lists.freedesktop.org, etnaviv@lists.freedesktop.org, 
 virtualization@lists.linux.dev, intel-gfx@lists.freedesktop.org
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

On Fri, 11 Jul 2025 at 10:35, Linus Torvalds
<torvalds@linux-foundation.org> wrote:
>
> I'm hoping the login time timeout / hang ends up being due to a known
> netlink regression, and it just happened to look like a drm issue
> because it exposes itself as a hang at the first graphical login
>
> A netlink regression *might* fit the pattern, in that it might just
> cause first login dependency issues and resulting timeouts.

Well, considering the random timing behavior of this bug, it's hard to
be really sure, but two boots with the alleged "fix" for the netlink
issue made the behavior worse, so it does look like my problems on
this machine were a combination of the drm refcounting issue and the
netlink thing.

I guess I'll have to do a lot more rebooting to be sure, since the
hangs and timeouts have been so random. But the netlink "fixes" did
give me a hang that was very different from the previous ones I've
seen, so I think the drm code is off the hook on this one.

                 Linus
