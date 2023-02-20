Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F84269D105
	for <lists+dri-devel@lfdr.de>; Mon, 20 Feb 2023 16:57:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EC8CE10E6CD;
	Mon, 20 Feb 2023 15:57:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-4323.proton.ch (mail-4323.proton.ch [185.70.43.23])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E10CA10E6CD
 for <dri-devel@lists.freedesktop.org>; Mon, 20 Feb 2023 15:57:25 +0000 (UTC)
Date: Mon, 20 Feb 2023 15:57:08 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=emersion.fr;
 s=protonmail; t=1676908643; x=1677167843;
 bh=0Cay01SQtsvO2fYSb/yZcyjkUkDT/3v+blRxRewOhRs=;
 h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
 Message-ID:BIMI-Selector;
 b=HWYg1oHFIWZE3FBpCpeZkaDp7yjPoaWxFggrZGR/1xBSfdnvxMqaNCgtDY8f55T6+
 6WEWvoYx5jAMijHA9mbTK5ZtLM2qfY/logxKFIi+o46YiHKmh1P+BrCNiseHLe136N
 hD7gdKmsig/WdY1d9DvOJQ9b8REv5F7KQnlMQPYIFyv1gyWrtIURZX9Bq7UntCfqav
 zoaoUK+RM96JqVScEecrnByKb4xCvkzOJS3S8a9XWBJPArz52oLdl3losLOjv3mMkD
 SaK5rh+K/PUC8GtxCffoRJIy5sIClMymMjGazCjJJcw6l4EObioeu3v03jL4hwPWON
 XfMGYNTTZC/gQ==
To: Dave Stevenson <dave.stevenson@raspberrypi.com>
From: Simon Ser <contact@emersion.fr>
Subject: Re: [PATCH 1/2] drm: document DRM_IOCTL_PRIME_HANDLE_TO_FD and
 PRIME_FD_TO_HANDLE
Message-ID: <EGf3SwlCai-KQHKYsrE0eaRVmSbbPyFQby1v29Cdpt9OYJdcipDQTF_WCl3F_PFvnno4zia_ObMH6pAnxZqCBlqFQapbpc7jxTlAYKzqiFU=@emersion.fr>
In-Reply-To: <CAPY8ntBxsKgoaExW8BhbK8Z1VPY=BPGYdJ_r-K5gYhUwWr32Cw@mail.gmail.com>
References: <20230216130934.156541-1-contact@emersion.fr>
 <CAPY8ntBxsKgoaExW8BhbK8Z1VPY=BPGYdJ_r-K5gYhUwWr32Cw@mail.gmail.com>
Feedback-ID: 1358184:user:proton
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
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
Cc: Pekka Paalanen <ppaalanen@gmail.com>, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Monday, February 20th, 2023 at 16:49, Dave Stevenson <dave.stevenson@ras=
pberrypi.com> wrote:

> > + * User-space sets &drm_prime_handle.fd with a DMA-BUF file descriptor=
 to
> > + * import, and gets back a GEM handle in &drm_prime_handle.handle.
> > + * &drm_prime_handle.flags is unused.
>=20
> Is it worth explicitly stating that the handle would be released via
> DRM_IOCTL_GEM_CLOSE? I've had userspace developers query how to
> release imported handles in the past.

v2 spells this out I think.
