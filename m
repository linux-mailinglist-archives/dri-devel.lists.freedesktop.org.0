Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A4C986741E
	for <lists+dri-devel@lfdr.de>; Mon, 26 Feb 2024 13:00:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 45EB610E702;
	Mon, 26 Feb 2024 12:00:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=fooishbar-org.20230601.gappssmtp.com header.i=@fooishbar-org.20230601.gappssmtp.com header.b="0KUrUHGx";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-vs1-f43.google.com (mail-vs1-f43.google.com
 [209.85.217.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B425310E6F4
 for <dri-devel@lists.freedesktop.org>; Mon, 26 Feb 2024 12:00:28 +0000 (UTC)
Received: by mail-vs1-f43.google.com with SMTP id
 ada2fe7eead31-47048ea1b17so311790137.0
 for <dri-devel@lists.freedesktop.org>; Mon, 26 Feb 2024 04:00:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=fooishbar-org.20230601.gappssmtp.com; s=20230601; t=1708948827; x=1709553627;
 darn=lists.freedesktop.org; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=wJF96OMPIuiihsGaYkG3LLW4znZ7XGF6VivtYj8lTQw=;
 b=0KUrUHGxDboU9tdTXnYkZIJsFUQHg+2+bzg7tNLdo3QpxOQPfHzxZkSQfXkKcx/jiY
 bz7vJJuNBHW8xU76oEkVEqecWOjI3mxFh3HcunFiBR+ZL3xN3sXNcDPmo/MkmhrTC9M+
 FkdJ6M0c1588dgxHxgQ4KHv0JNaZJfcPmYZK2nAl59N606H+r0klZhfFq8VbcYQmyw4F
 8pJxVGHsAD2Fa+EF+vCzJW99z/1k1Y2wRYCCvLXT9pcRunVBjH/uu7pLxDZmA3Bsy7E2
 nZIvAkuci7oKekIGWaiaE6b9o+pyznAlL/GXXqcn8B1QgzNpLqkzLBLfGK3MQ6ECJh7r
 lhhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1708948827; x=1709553627;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=wJF96OMPIuiihsGaYkG3LLW4znZ7XGF6VivtYj8lTQw=;
 b=oDviIEZkORkMMwt9jIDorGBS6IehdqTYU4nxwrmBgetrkc5GcIUQRe1gw9tIdkFnMe
 E82fBZzNtzYne2Wr72DbTLRfe9WVaP21PY2nkzRpAHbBLcODojWMvZtaIB3hBACNnjHo
 SXUfh31fpijjhN3RM/Haa9hab373wB54MyjIMzDX9pyKjVV+VG08QmAH/5DdSgKtuIgq
 j5vT0E9tHpCppjE5wZwt2yRTLwRLWPooKWk7K7v4yf1SYFmGkTXeBgq6y4WCiXYdKvIb
 TjcvljESppYv5pBX2o8lk8dGBBg2ZHPBS9QIUChzE05INjs2ZmBV2TYlvL8I/PRFPIVS
 kzjw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVqMMbhB4wpnFiat/SVVX0x+XW2/uIM5bJC8bRyUcUcb0bgoYx/Wo/xvQLcJOnSlVVe5Nh37mBOp2ndBsBLftWpHqKjlixjfuSKlKPbyrVG
X-Gm-Message-State: AOJu0Yz/0+Dc9l0dA3MwAighpf4NQm+4V6pm8OmkNMoe+vqz6a4tu+YH
 UKucY+x+6Esauvpupk4cdbvVwVJBj1UefMXSPX11SxL1ySNg4UGcacxew89QnMBKKNTFuHdJPQW
 ejgKSqmpE2toWkV61yP+SmsQRsPgbTEJ4R8ADew==
X-Google-Smtp-Source: AGHT+IFeyblWKjMB7+JkcDjslD65fdKYPYKnlA79ivQidYhLb48BJCUS9QrxxQNna8j4IY0qVIv8nqViPm+DOKtWz7M=
X-Received: by 2002:a05:6102:117c:b0:470:390d:41d8 with SMTP id
 k28-20020a056102117c00b00470390d41d8mr4802913vsg.27.1708948827486; Mon, 26
 Feb 2024 04:00:27 -0800 (PST)
MIME-Version: 1.0
References: <gnthy5o42kiyj63d2bkkxsc5krzf3wrwt23chh2kthkmlyjwbg@ybynvjvqdka7>
 <87bk83o3y3.fsf@intel.com>
 <oazstrooilko4tfmead3b4l32tmz3szqpwgzy3kyga3xahjjfw@cbosrrwaul77>
 <871q8zo2tn.fsf@intel.com>
In-Reply-To: <871q8zo2tn.fsf@intel.com>
From: Daniel Stone <daniel@fooishbar.org>
Date: Mon, 26 Feb 2024 12:00:15 +0000
Message-ID: <CAPj87rPB9+o1g8gJyZk3m2DLhW=FC+3m5Nrm=Mxq3SwqxX3KCg@mail.gmail.com>
Subject: Re: drm-misc migration to Gitlab server
To: Jani Nikula <jani.nikula@linux.intel.com>
Cc: Maxime Ripard <mripard@kernel.org>, dri-devel@lists.freedesktop.org, 
 Daniel Vetter <daniel@ffwll.ch>, David Airlie <airlied@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, 
 Daniel Stone <daniels@collabora.com>
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

On Mon, 26 Feb 2024 at 11:57, Jani Nikula <jani.nikula@linux.intel.com> wrote:
> On Mon, 26 Feb 2024, Maxime Ripard <mripard@kernel.org> wrote:
> > For the recent-ish subscriptions, it's possible since we've required to
> > open a Gitlab issue for a while, so we have the association between the
> > Gitlab account and the SSH account already.
> >
> > During the Gitlab setup, the groups were also created already with the
> > people that had an SSH account at the time, and Gitlab account.
> >
> > But for the rest, yeah, I had to ping Daniel S. about it. He could find
> > a few matches, but there's some where we just don't know if or what the
> > Gitlab account is.
> >
> > Generally speaking, we've been conservative about it, and only added
> > accounts we were sure of.
>
> Ah, I didn't make myself clear. I'm more interested in the process going
> forward, for new access requests. Anyone can create an account and
> request access; how does a maintainer verify the request? For our
> purposes it's basically just matching againt the email addresses in
> existing commits in the repo.

It's a fair question. If you want to verify that someone is
@intel.com, maybe get them to email you out-of-band to check it. If
you want to check something else, just ask an admin I suppose.

Cheers,
Daniel
