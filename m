Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C88F551AFF0
	for <lists+dri-devel@lfdr.de>; Wed,  4 May 2022 22:59:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7650510E9D5;
	Wed,  4 May 2022 20:59:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ssl.serverraum.org (ssl.serverraum.org [176.9.125.105])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3A72A10E9D5
 for <dri-devel@lists.freedesktop.org>; Wed,  4 May 2022 20:59:02 +0000 (UTC)
Received: from ssl.serverraum.org (web.serverraum.org [172.16.0.2])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ssl.serverraum.org (Postfix) with ESMTPSA id 68A4D22238;
 Wed,  4 May 2022 22:58:57 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=walle.cc;
 s=mail2016061301; t=1651697937;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=2uyjWuWPaA0HXIEpUNAXhgRe5n36fZ5ISLxZv5KSzhw=;
 b=IQdTFNexi3ATwWjK5rg2O3FQmu9BIsqAzl06CIPK8HRMRMqXpB8Sf0909N3vGn3h1/Jm7/
 0AXAct87WNkR02doNbX7ccTVFPAnU7rfDC0a3aS7qzzyiTuEPCba2B3ETJlJwfiIYTyXCn
 1KctVoCRLTLx9vNXgHRdAUxuO5NzF6w=
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date: Wed, 04 May 2022 22:58:57 +0200
From: Michael Walle <michael@walle.cc>
To: Lucas Stach <l.stach@pengutronix.de>
Subject: Re: [PATCH v2] drm/etnaviv: avoid cleaning up sched_job when submit
 succeeded
In-Reply-To: <20220504090229.2506560-1-l.stach@pengutronix.de>
References: <20220504090229.2506560-1-l.stach@pengutronix.de>
User-Agent: Roundcube Webmail/1.4.13
Message-ID: <eb6f2f8d4ba4b34c1dcbe6f4e16449a1@walle.cc>
X-Sender: michael@walle.cc
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
Cc: etnaviv@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 kernel@pengutronix.de, Russell King <linux+etnaviv@armlinux.org.uk>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 2022-05-04 11:02, schrieb Lucas Stach:
> While the labels may mislead the casual reader, the tail of the 
> function
> etnaviv_ioctl_gem_submit is always executed, as a lot of the structures
> set up in this function need to be cleaned up regardless of whether the
> submit succeeded or failed.
> 
> An exception is the newly added drm_sched_job_cleanup, which must only
> be called when the submit failed before handing the job to the
> scheduler.
> 
> Fixes: b827c84f5e84 ("drm/etnaviv: Use scheduler dependency handling")
> Reported-by: Michael Walle <michael@walle.cc>
> Signed-off-by: Lucas Stach <l.stach@pengutronix.de>

FWIW (because it's already picked up)

Tested-by: Michael Walle <michael@walle.cc>

Thanks!
-michael
