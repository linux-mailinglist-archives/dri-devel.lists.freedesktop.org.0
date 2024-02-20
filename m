Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 161E985BA77
	for <lists+dri-devel@lfdr.de>; Tue, 20 Feb 2024 12:25:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2C27A10E023;
	Tue, 20 Feb 2024 11:25:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=fooishbar-org.20230601.gappssmtp.com header.i=@fooishbar-org.20230601.gappssmtp.com header.b="dyNmK+vY";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-f47.google.com (mail-ot1-f47.google.com
 [209.85.210.47])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A093010E32D
 for <dri-devel@lists.freedesktop.org>; Tue, 20 Feb 2024 11:25:17 +0000 (UTC)
Received: by mail-ot1-f47.google.com with SMTP id
 46e09a7af769-6e457006fe5so609856a34.3
 for <dri-devel@lists.freedesktop.org>; Tue, 20 Feb 2024 03:25:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=fooishbar-org.20230601.gappssmtp.com; s=20230601; t=1708428316; x=1709033116;
 darn=lists.freedesktop.org; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=qWIPe+wcHVAvrbixk7nlxuPeXFilNRwvQXoY6tEzAUM=;
 b=dyNmK+vYBXKdJlFelB/B9zIYlaM/hbx0B5mvNg9TRDlY3MDFQ2O8UwhcrHn73fZIHk
 v1yiu4fcV5Wm8Ij1/deipv6vqcW/CCcvUth84X/tM6a2jbiTqSoYpIb3qi3RfpOjUh1K
 HY7o+JQbQfzX1/FhH+nCCa+0RaUu05GH9qByF+nanTmqlecIHj9xp3dKBrW7TrnXwsnV
 +r7f0klUIzT7EpcvRbpJVayjFUNFhz8sT8avmDPK4Kf2RONZBxD3GuRocuZB90D9FRGZ
 G+O9U2lGw3YEWfjdDIqn0Iweg89MRPfR5M1SmVaMYcHj0IHEqKPKgvWCHjzmvi2kM+z1
 K7Xw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1708428316; x=1709033116;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=qWIPe+wcHVAvrbixk7nlxuPeXFilNRwvQXoY6tEzAUM=;
 b=qpPMgQQ1JyFaImJYI5I077d7sxVCEAl6IA05K7BqouAb8ldKtiCPU9kGeTNARjzKHg
 UI9bnAaBlW1dfx3Zc40JTnWze8MyKxJJrIV7r/9CkhrUUdyyM1JEjMCV4XlMbQTv+R2s
 A21cMvvMDhifRfPZSNF0GHagI36Ph3JQpxKNJeI9k84Q/q9Ta5K926+0YG05i+YuaGUe
 gyddV+fitFK5XsGkCZPeLtozZh7v/sIb+kATkHhB4HpACKoC4+eErYL4ccuSKnnytE8U
 ccqmecMBUyQtVtFjZqX0PNUuif6wLgGZIXRg91japXawg0YUJbWn+Q7btntPuvJtNiRO
 jxYg==
X-Gm-Message-State: AOJu0YwJlBabNE5NLYM+W/eajkd0ZN91nkh6EIkFvG9lm7CmpEVWZZOt
 5TSovIWubXiBPlZJa0Vd9lNRZfS8+G2j8rB0BuC6atJqUhvDP4hdBRfRJ8mbFzhb4eqMqMwUf3J
 cfLzWBTf1xYjjZP2wAqoUw2fZtUEBpP/1WXt1Pw==
X-Google-Smtp-Source: AGHT+IGwoJsaSbKbi5QPKKE9I7MPAOfWPBTAB5tTV7Xa3jFI4KMMzK7MEg9tQ2yxsPon6lVcOCyiK7mFueDpygboPcc=
X-Received: by 2002:a05:6830:1315:b0:6e2:faa8:6f04 with SMTP id
 p21-20020a056830131500b006e2faa86f04mr13401874otq.35.1708428316624; Tue, 20
 Feb 2024 03:25:16 -0800 (PST)
MIME-Version: 1.0
References: <gnthy5o42kiyj63d2bkkxsc5krzf3wrwt23chh2kthkmlyjwbg@ybynvjvqdka7>
 <akb3fluuli75vh5due5ll7t5igg7oo5vqwkal645hkjkhyqz6w@qu62f5l6joy6>
In-Reply-To: <akb3fluuli75vh5due5ll7t5igg7oo5vqwkal645hkjkhyqz6w@qu62f5l6joy6>
From: Daniel Stone <daniel@fooishbar.org>
Date: Tue, 20 Feb 2024 11:25:05 +0000
Message-ID: <CAPj87rMYC3D-PYtMcTXD3=HqNSpyyVj9jp0nodO+2PebP1guAA@mail.gmail.com>
Subject: Re: drm-misc migration to Gitlab server
To: Maxime Ripard <mripard@kernel.org>
Cc: dri-devel@lists.freedesktop.org, Daniel Vetter <daniel@ffwll.ch>, 
 David Airlie <airlied@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Thomas Zimmermann <tzimmermann@suse.de>, Daniel Stone <daniels@collabora.com>, 
 Stephen Rothwell <sfr@canb.auug.org.au>
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

On Tue, 20 Feb 2024 at 09:05, Maxime Ripard <mripard@kernel.org> wrote:
> On Tue, Feb 20, 2024 at 09:49:25AM +0100, Maxime Ripard wrote:
> > This will be mostly transparent to current committers and users: we'll
> > still use dim, in the exact same way, the only change will be the URL of
> > the repo. This will also be transparent to linux-next, since the
> > linux-next branch lives in its own repo and is pushed by dim when
> > pushing a branch.
>
> Actually, I double-checked and linux-next pulls our branches directly,
> so once the transition is over we'll have to notify them too.

cc sfr - once we move the DRM repos to a different location, what's
the best way to update linux-next?

That being said, we could set up read-only pull mirrors in the old
location ... something I want to do in March (because what else are
you going to do on holiday?) is to kill the write repos on kemper
(git.fd.o), move them to being on molly (cgit/anongit.fd.o) only, and
just have a cronjob that regularly pulls from all the gl.fd.o repos,
rather than pushing from GitLab.

Cheers,
Daniel
