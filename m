Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B9B5E86CC85
	for <lists+dri-devel@lfdr.de>; Thu, 29 Feb 2024 16:12:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 50BD910E484;
	Thu, 29 Feb 2024 15:12:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=iki.fi header.i=@iki.fi header.b="MEywyQSQ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 396 seconds by postgrey-1.36 at gabe;
 Thu, 29 Feb 2024 09:45:44 UTC
Received: from lahtoruutu.iki.fi (lahtoruutu.iki.fi [185.185.170.37])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AA9B910E030
 for <dri-devel@lists.freedesktop.org>; Thu, 29 Feb 2024 09:45:44 +0000 (UTC)
Received: from hillosipuli.retiisi.eu
 (2a00-1190-d1dd-0-c641-1eff-feae-163c.v6.cust.suomicom.net
 [IPv6:2a00:1190:d1dd:0:c641:1eff:feae:163c])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: sailus)
 by lahtoruutu.iki.fi (Postfix) with ESMTPSA id 4TlmQ15ZNhz49Psp;
 Thu, 29 Feb 2024 11:39:05 +0200 (EET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi; s=lahtoruutu; 
 t=1709199546;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=5ic0/mePXAYuU+/P4n2i1okUocpeoe9yjMTVvtpQYzc=;
 b=MEywyQSQpTvayFHEm7VgF6Q1jPzYfVwpJgHnhQ+80aICMwiMz+SAdJOxHJPc48VbCl2YzT
 JHgrBdJ5dZM3iTic5JqcfOk6Tcu3NiSbgctscZBbJ5c7kgrKbzquDdZjZ0S9jF2DLiF9wY
 Js348BJNeApoECHr2bT4+epOU8M+sTbw3CL19cVfDJEAW2bWOQFc35VlcXRrXgEzSubmx3
 LX6mR8zaHjq1eVrN8aDcUdzPhJKa+zjoX1BtAH42I8yzfAGLxAJ8nCaKNOTWxGSrWJELmp
 GbRivb8swqUtUL0TebrJb7RbiOCMAEA3LOGL36OnaNWFNoQTZJNmoJSWrrjmQg==
ARC-Seal: i=1; s=lahtoruutu; d=iki.fi; t=1709199546; a=rsa-sha256; cv=none;
 b=TVYxk91G1WaoAMdK0TdxrWgj1YetMo7Erde/nOKQV89+0slr+l/ksLnZvuqaNVzEoVsIs3
 nA7nY9Zz5S4yblu4lkjJxrIUIZbsU6MpgNydshq3zDTOWaBJUD6ac+cXtla7YhPnxCMfUW
 sVdC4hEIPes7vFolsZVkPj/SM0LRrLocsMuJrL8yTSXdb55lO/efar5zVxaq/JKzjF2AcG
 xV30PX6q3y+yQjiqVf++q1L1DnTulOhvukKnyMtMgRcbKvKYQ6UaKY0Z8qoQDLzfGfcZXL
 IQHdDFSd3fgyBG/hEfUCPY+Hrd8p2ERDWCgpQ87Kug8NNBwNfVJjKWnMRVYjpw==
ARC-Authentication-Results: i=1; ORIGINATING;
 auth=pass smtp.auth=sailus smtp.mailfrom=sakari.ailus@iki.fi
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi;
 s=lahtoruutu; t=1709199546;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=5ic0/mePXAYuU+/P4n2i1okUocpeoe9yjMTVvtpQYzc=;
 b=i86L8G/Ci+lh3Zo4pzgDGBtqpV3TNPFa+APkSAP8nVqFwm1TMoQJK5vBqNNIn+NEXj4TF4
 H2SvxhnwtxS+Ivr+gKVEF0iYs5XtMB/CPrfcF5LS+po4Y80HJqYPfua/VNwJ2eZS495zXt
 NupFiKKo/xxemAcHllC55t2Md5F478gJwaj1Ld6pmekoqdOZw3sXrnNK7yZU9J6yJgdKJP
 KfmucmHIXvzOu9x/UOk6bd5cWtBzJNQgaElhfMoh+8uib+U3YURJ8t6wtoH2Jfmdk5Ukof
 /Nlt1BmUOkiy2LgBLEw3Hyv7EueEHJ+coYfLgMTB5q7sTmOWlSMBKBBdZxPiew==
Received: from valkosipuli.retiisi.eu (valkosipuli.localdomain [192.168.4.2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits)
 server-digest SHA256) (No client certificate requested)
 by hillosipuli.retiisi.eu (Postfix) with ESMTPS id 30FEC634C93;
 Thu, 29 Feb 2024 11:39:02 +0200 (EET)
Date: Thu, 29 Feb 2024 09:39:01 +0000
From: Sakari Ailus <sakari.ailus@iki.fi>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Helen Koike <helen.koike@collabora.com>, linuxtv-ci@linuxtv.org,
 dave.pigott@collabora.com, mripard@kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-kselftest@vger.kernel.org, pawiecz@collabora.com,
 tales.aparecida@gmail.com, workflows@vger.kernel.org,
 kernelci@lists.linux.dev, kunit-dev@googlegroups.com,
 nfraprado@collabora.com, davidgow@google.com, cocci@inria.fr,
 Julia.Lawall@inria.fr, kernel@collabora.com,
 torvalds@linuxfoundation.org, gregkh@linuxfoundation.org
Subject: Re: [PATCH 0/3] kci-gitlab: Introducing GitLab-CI Pipeline for
 Kernel Testing
Message-ID: <ZeBQtfY8FG_qtoEJ@valkosipuli.retiisi.eu>
References: <20240228225527.1052240-1-helen.koike@collabora.com>
 <20240228230725.GF1659@pendragon.ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240228230725.GF1659@pendragon.ideasonboard.com>
X-Mailman-Approved-At: Thu, 29 Feb 2024 15:12:01 +0000
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

Hi Laurent, Helen,

On Thu, Feb 29, 2024 at 01:07:25AM +0200, Laurent Pinchart wrote:
> > **Join Our Slack Channel:**
> > We have a Slack channel, #gitlab-ci, on the KernelCI Slack instance https://kernelci.slack.com/ .
> > Feel free to join and contribute to the conversation. The KernelCI team has
> > weekly calls where we also discuss the GitLab-CI pipeline.
> 
> Could we communicate using free software please ? Furthermore, it's not
> possible to create an account on that slack instance unless you have an
> e-mail address affiliated with a small number of companies
> (https://kernelci.slack.com/signup#/domain-signup). That's a big no-go
> for me.

I agree. There is no shortage of good alternatives either: we have IRC,
Matrix and XMPP for instance. Just pick one of them.

-- 
Regards,

Sakari Ailus
