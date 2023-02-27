Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C51F56A4670
	for <lists+dri-devel@lfdr.de>; Mon, 27 Feb 2023 16:49:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 997F210E42A;
	Mon, 27 Feb 2023 15:49:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sender-of-o50.zoho.in (sender-of-o50.zoho.in [103.117.158.50])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 341C510E42D
 for <dri-devel@lists.freedesktop.org>; Mon, 27 Feb 2023 15:49:15 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1677512945; cv=none; d=zohomail.in; s=zohoarc; 
 b=Vozj8rdackxudhL6CoFfy9qaUxqW5k+9uKSRrA0BZDhwFYscW0FASQ9N/wQK3R9CajHXi1TrknhYyU0B/leFPN7k9/nrFY8A+3gQFF38jIl/JPYK6Dko5cL4jTbooS2IjS1XPjv8nMUe8AuY7QNqmfgsxNSQKpeZ5Fva1Xfbd3U=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.in;
 s=zohoarc; t=1677512945;
 h=Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:To;
 bh=LufG+uGg74qyMm4+3mt3r51M+Qw9SOQD3mty9YaUoo4=; 
 b=Y+2PueQ9mE53Fb3fwyPbPFYbevnf+qXolOlK13ZyVrTLg2saZq60REjcTrFNsr2t2rmwq2002exRieC7AG2XizoLX3F7s6qP7MXR1ykKsJQwGxLkpRK/Qb2y092l9xpt8p4djwo3FftTq21qDZVN0hESTmOjKZ1OHm7GrYncfKg=
ARC-Authentication-Results: i=1; mx.zohomail.in; dkim=pass  header.i=siddh.me;
 spf=pass  smtp.mailfrom=code@siddh.me;
 dmarc=pass header.from=<code@siddh.me>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1677512945; 
 s=zmail; d=siddh.me; i=code@siddh.me;
 h=Date:Date:From:From:To:To:Cc:Cc:Message-ID:In-Reply-To:References:Subject:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
 bh=LufG+uGg74qyMm4+3mt3r51M+Qw9SOQD3mty9YaUoo4=;
 b=tTqxAZaNQ7Mkinn21JCEnoRL5Gc31kMdrKKk81Sdla0eaJVn7dYrWCN9/kIF84c6
 YhYoCyMx8n7+LJ/DF0uQ/axy/R381eKO0/x5KyqOw7qR94ESnd7wYhVUgZdB8g1OC81
 P9saw2rO2MZIcFRTmagH5iK1XnDnpNQy0qJBugqc=
Received: from mail.zoho.in by mx.zoho.in
 with SMTP id 1677512934260114.46478153909891;
 Mon, 27 Feb 2023 21:18:54 +0530 (IST)
Date: Mon, 27 Feb 2023 21:18:54 +0530
From: Siddh Raman Pant <code@siddh.me>
To: "Jani Nikula" <jani.nikula@linux.intel.com>
Message-ID: <18693900367.2ce71ba5548919.6872574648582795181@siddh.me>
In-Reply-To: <87ilfn30li.fsf@intel.com>
References: <cover.1677395403.git.code@siddh.me>
 <89f0aa1f26696846c2303527fe4d133bb4ff4bf6.1677395403.git.code@siddh.me>
 <87ilfn30li.fsf@intel.com>
Subject: Re: [PATCH v7 1/7] drm/print: Fix and add support for NULL as first
 argument in drm_* macros
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Importance: Medium
User-Agent: Zoho Mail
X-Mailer: Zoho Mail
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
Cc: thomas zimmermann <tzimmermann@suse.de>, sam ravnborg <sam@ravnborg.org>,
 linux-kernel <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, 27 Feb 2023 15:13:21 +0530, Jani Nikula wrote:
> First of all, that's two distinct changes in one patch. The subject says
> one thing, but it's really two.

Sorry, my bad.

> But the main question is, do we *really* want to let callers pass either
> struct drm_device * or struct device *? It will be type safe with
> generics, but if it's okay to use either, people *will* use either. The
> call sites will end up being a mixture of both. You can't control it. It
> will be very tedious if you ever want to revert that decision.
> 
> Do we want to promote a style where you can pass either? To me, in C
> context, it seems awfully sloppy and confusing rather than convenient.
> 
> I'd argue the struct mipi_dsi_host stuff should use dev_* calls
> directly, as it's more of a special case, rather than allow struct
> device * in drm_* logging macros.

I agree. I thought direct dev_* calls would not be ideal, as there is a
TODO to move away from that, and also incorrectly expected to have more
such dev ptr problems. But on a second thought, you are correct.

Should I post a new patch, with using __drm_dev_ptr instead and
removing the __get_dev_ptr generic macro, and using dev_* in
drm_mipi_dsi.c as `dev_err(dev, "*ERROR* [drm] <msg>", ...);`?

> BR,
> Jani.

Thanks,
Siddh
