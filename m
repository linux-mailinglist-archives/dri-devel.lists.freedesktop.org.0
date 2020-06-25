Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E6C520A62E
	for <lists+dri-devel@lfdr.de>; Thu, 25 Jun 2020 21:54:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9E9986EC15;
	Thu, 25 Jun 2020 19:54:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x341.google.com (mail-ot1-x341.google.com
 [IPv6:2607:f8b0:4864:20::341])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D9DA06EC14
 for <dri-devel@lists.freedesktop.org>; Thu, 25 Jun 2020 19:54:27 +0000 (UTC)
Received: by mail-ot1-x341.google.com with SMTP id 18so6447834otv.6
 for <dri-devel@lists.freedesktop.org>; Thu, 25 Jun 2020 12:54:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=FD3S0mujguCO2/ntfwJg4sQdi7RD7F/io2ojMsUoIEg=;
 b=JmWv7kPvAW8MjnRbG7Ubh3ViNBZuM6MNB+F9e1HN6nDfZbMcuMR6PI4SnXfQeNo4rP
 bJtw48YIzVCKnGgpSRmlFK4V+9gJuJCaOjuRxjR3GuooX3tR/dXGYCPg7eZ3UCGY5f7t
 7GlwFGjWobpbmyU8dd+pRBQ+kGB55qcvvErYY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=FD3S0mujguCO2/ntfwJg4sQdi7RD7F/io2ojMsUoIEg=;
 b=mns9uYZLwy5YRu/PCKGowqcZcsVRQNUkMLaic40xEc5rK3s05EUQtmSSmO6Yinq80z
 QcoX78JTR+HdNkbwmOt0w9CwORGultJw+5p7KgGJJyScn0RSGsAzObqAzMmmIqtKZucc
 tFo0qRt/e0f8OBLmZ19rEsfDLBUCvfWavYcpAIUU0Wf16nKVIMVrZR5GgVugg5d6hTEs
 3NRFvlt5FJ5BeENUUSYEUvWsXZctCvwkxWy5eaoFJtpz8UAr3CoqQl/rFqnfHFJNy+kt
 gT1efdY5GMRub/99+SR8D2XdQdOGuXOyCt2PeX+C7OkjgpSk9pHtUHPAfY63A7rJQ1iS
 b+mQ==
X-Gm-Message-State: AOAM531Z+AsZhgXT/2w55yMVOv8YpgGGtcreFmOrx+VELykE6bw+Bz1f
 lx0SQ9y/9n6Nw2FAJHAGYgZCbzw4jP3fO5E2vuldNA==
X-Google-Smtp-Source: ABdhPJxHoxhDeLyYnrDS3vEDkWYTGA/6BTDazv5uQpebZN+Pff2vzygqd/xgIq4hOON4xDa3q5djioyZAay29yde+2s=
X-Received: by 2002:a9d:4cd:: with SMTP id 71mr30268405otm.188.1593114867192; 
 Thu, 25 Jun 2020 12:54:27 -0700 (PDT)
MIME-Version: 1.0
References: <20200625123443.19680-1-lionel.g.landwerlin@intel.com>
 <51e00eed-c8f1-aabf-ec2c-07be0453ab3b@amd.com>
 <CAPM=9txhX5TVUdWibRFc1C+ip5a8-c07jZawds=k5T5pBTPASA@mail.gmail.com>
 <874kqzndxj.fsf@intel.com>
In-Reply-To: <874kqzndxj.fsf@intel.com>
From: Daniel Vetter <daniel@ffwll.ch>
Date: Thu, 25 Jun 2020 21:54:16 +0200
Message-ID: <CAKMK7uErpxoFrT_K==7-PMGyg_eqF07T50eYfh5BFQLzra7TbQ@mail.gmail.com>
Subject: Re: [Intel-gfx] [PATCH 1/2] Revert "dma-buf: Report signaled links
 inside dma-fence-chain"
To: Jani Nikula <jani.nikula@linux.intel.com>
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
Cc: Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Chris Wilson <chris@chris-wilson.co.uk>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Ignoring everything else ...

On Thu, Jun 25, 2020 at 9:28 PM Jani Nikula <jani.nikula@linux.intel.com> wrote:
> As a side note, there seem to be extra checks in place for acks when
> applying non-i915 patches to drm-intel; there are no such checks for
> drm-misc.

One option to generalize that that I pondered is to consult
get_maintainers.pl asking for git repo link, and if that returns
something else, then insist that there's an ack from a relevant
maintainer. It's a bit of typing, but I think the bigger problem is
that there's a ton of false positives.

But maybe that's a good thing, would give some motivation to keep
MAINTAINERS updated.

The other issue is though that drm-misc is plenty used to merge
patches even when the respective maintainers are absent for weeks, or
unresponsive. If we just blindly implement that rule, then the only
possible Ack for these would be Dave&me as subsystem maintainers, and
I don't want to be in the business of stamping approvals for all this
stuff. Much better if people just collaborate.

So I think an ack check would be nice, but probably not practical.

Plus in this situation here drm-misc.git actually is the main repo,
and we wont ever be able to teach a script to make a judgement call of
whether that patch has the right amount of review on it.
-Daniel
-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
