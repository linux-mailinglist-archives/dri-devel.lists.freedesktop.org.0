Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (unknown [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C49955E9E2A
	for <lists+dri-devel@lfdr.de>; Mon, 26 Sep 2022 11:46:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B46CF10E660;
	Mon, 26 Sep 2022 09:46:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5232410E3EA;
 Mon, 26 Sep 2022 09:46:00 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id C6AADB8076E;
 Mon, 26 Sep 2022 09:45:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 57CABC433D6;
 Mon, 26 Sep 2022 09:45:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1664185557;
 bh=gxYxJeqw8iHajAVcJs1sjmAAqdM5EGg9KztCBRa7Tnw=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=EFFqUc54lm7u3cFrjkIYpJ1KmkJgqW50bEreKGqfhgumScGctF44fOp1uPZt7gCsW
 wkResKpdZYp129c8W18qqaiBLNF8LloqzXQX2suzDzOOaLY6xOk73H5/1lHSevoaNy
 5VaZ0hroF3Y9Av5Cv2SrYcxqyDgf4FBki5RE7F3RjBeVnCkoDn1h4zOraE92K8BaCM
 fQGomP6pYetH7MgiAMfkWgUkHg7vK3bRIEbwol9yTPgRsWiUWS+/zfEhxGRO5OP9x4
 0c3DcsM7053oc3ChcSkzVyp9Yj9j9yu9nVSiyiT6QucGZcWJ1IA1y0MXZIVr14tgV2
 Tc7aU2ajQZc3A==
Date: Mon, 26 Sep 2022 11:45:52 +0200
From: Mauro Carvalho Chehab <mchehab@kernel.org>
To: Rodrigo Vivi <rodrigo.vivi@intel.com>
Subject: Re: [Intel-gfx] [PATCH v3 27/37] docs: gpu: i915.rst: gt: add more
 kernel-doc markups
Message-ID: <20220926114552.5e00242a@coco.lan>
In-Reply-To: <YxsCJjdN0eJncD1a@intel.com>
References: <cover.1662708705.git.mchehab@kernel.org>
 <6d31414391976615b5c1818cafba066132c24e85.1662708705.git.mchehab@kernel.org>
 <YxsCJjdN0eJncD1a@intel.com>
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.34; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
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
Cc: Thomas Zimmermann <tzimmermann@suse.de>, Jonathan Corbet <corbet@lwn.net>,
 David Airlie <airlied@linux.ie>, intel-gfx@lists.freedesktop.org,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Em Fri, 9 Sep 2022 05:06:46 -0400
Rodrigo Vivi <rodrigo.vivi@intel.com> escreveu:

> On Fri, Sep 09, 2022 at 09:34:34AM +0200, Mauro Carvalho Chehab wrote:
> > There are several documented GT kAPI that aren't currently part
> > of the docs. Add them, as this allows identifying issues with
> > badly-formatted tags.
> >  
> 
> In i915's commits we usually add a version history here
> to indicate what changed from the previous submission,
> something like
> 
> v2: re-organizing the blocks to group gtt stuff.

Placing patch versioning at the email's detailed explanation is
actually a violation of the Kernel coding style. See:

	https://www.kernel.org/doc/html/latest/process/submitting-patches.html#the-canonical-patch-format

	"The explanation body will be committed to the permanent source changelog, 
	 so should make sense to a competent reader who has long since forgotten 
	 the immediate details of the discussion that might have led to this patch."

Such versions should either go at the cover letter - which is the usual
convention on big series, or after "---", as explained at the same
document:

	"The --- marker line serves the essential purpose of marking for patch
	 handling tools where the changelog message ends.

	 ...

	Other comments relevant only to the moment or the maintainer, not suitable
	for the permanent changelog, should also go here. A good example of such 
	comments might be patch changelogs which describe what has changed between
	the v1 and v2 version of the patch."


> 
> that helps reviewers to know if their change requested was
> addressed or not.

True. Next time, I'll add a version at the cover letter.

> 
> but anyways:
> 
> Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>

Thank you!
Mauro
