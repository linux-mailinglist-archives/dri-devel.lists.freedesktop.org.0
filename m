Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 62D91AF9B7E
	for <lists+dri-devel@lfdr.de>; Fri,  4 Jul 2025 22:11:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4BE5910EA71;
	Fri,  4 Jul 2025 20:11:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=zohomail.com header.i=safinaskar@zohomail.com header.b="aA1Tf5hE";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sender4-pp-o94.zoho.com (sender4-pp-o94.zoho.com
 [136.143.188.94])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 46A3D10EA71;
 Fri,  4 Jul 2025 20:11:27 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1751659886; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=CiuPrGCxm9Vh++d47K22nTz4RfdB3w4mCpeU8bSaxyNusDFL0hMRh5VnFRpreAe12ISo2f0s2bJX1bl1NBIdVZ6ehaoYyNNMqaWIPee7p0kmYknlPC3spUVzGDDBjppTicBTIXBuEXipVZ5O70GRKX/Y0gmSRX+hDDSvPyiMTBI=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1751659886;
 h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To;
 bh=TS8ZTkfMUMynjI4o3xDUHXwFY9c3gzxNKeP+4/m0WhY=; 
 b=GhkZzEojlPUustFtaNRrZzmw0Nm3gWf4iNKZFYdiRkc4SM+DpwH0kDkFKCOwK6P5NyXjSlft1gIXmBuf2wWicyEbqPI5u2myyGaQYFA3wrNAre8kKM2loR7FY7M+/oNm7zv0AB/Ye5/Clur/OTi5NRczt+5SXzKXK6OzNK8ivq4=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 dkim=pass  header.i=zohomail.com;
 spf=pass  smtp.mailfrom=safinaskar@zohomail.com;
 dmarc=pass header.from=<safinaskar@zohomail.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1751659886; 
 s=zm2022; d=zohomail.com; i=safinaskar@zohomail.com;
 h=Date:Date:From:From:To:To:Cc:Cc:Message-ID:In-Reply-To:References:Subject:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:Feedback-ID:Message-Id:Reply-To;
 bh=TS8ZTkfMUMynjI4o3xDUHXwFY9c3gzxNKeP+4/m0WhY=;
 b=aA1Tf5hE9yIqTf+z8pF0tuqMt27dbViTC9CVHAM3LmqTufEGbjcqDiKBKvwt5PfI
 kPTDGPYdlMxsofuIIofLH02E9VzvYP0/MaOeRwGfJxGHUtWYGrPemldovjbqCqz2mPb
 AXdtU5VmmDkeTG6byxbWF5M92WHbOvX+e3hWvbBk=
Received: from mail.zoho.com by mx.zohomail.com
 with SMTP id 1751659883598268.00403358374285;
 Fri, 4 Jul 2025 13:11:23 -0700 (PDT)
Received: from  [212.73.77.104] by mail.zoho.com
 with HTTP;Fri, 4 Jul 2025 13:11:23 -0700 (PDT)
Date: Sat, 05 Jul 2025 00:11:23 +0400
From: Askar Safin <safinaskar@zohomail.com>
To: "Jani Nikula" <jani.nikula@linux.intel.com>
Cc: "regressions" <regressions@lists.linux.dev>,
 "intel-gfx" <intel-gfx@lists.freedesktop.org>,
 "kexec" <kexec@lists.infradead.org>,
 "dri-devel" <dri-devel@lists.freedesktop.org>,
 "iommu" <iommu@lists.linux.dev>, "Ben Hutchings" <benh@debian.org>,
 "joonaslahtinen" <joonas.lahtinen@linux.intel.com>,
 "josesouza" <jose.souza@intel.com>,
 "davehansen" <dave.hansen@linux.intel.com>
Message-ID: <197d710ac39.10e2c241536088.2706332519040181850@zohomail.com>
In-Reply-To: <cd3ca680ac5751368941713c1071e04d69544d47@intel.com>
References: <197d1dc3bff.c01ddb9024897.1898328361232711826@zohomail.com>
 <cd3ca680ac5751368941713c1071e04d69544d47@intel.com>
Subject: Re: Second kexec_file_load (but not kexec_load) fails on i915 if
 CONFIG_INTEL_IOMMU_DEFAULT_ON=n
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Importance: Medium
User-Agent: Zoho Mail
X-Mailer: Zoho Mail
Feedback-ID: rr080112272253fe969a23595c85f91a500000523677c6bdb1982768f926de5e850d1de0b95032a6f4e2403a:zu080112275608904759347c1a8aa6344e00004b892033285efa420125ce24acd53f46b26bce7a66f1b1c3af:rf0801122bdab4c8b6ba9c8fd2fda7bf3c000084e058e1ee92c3f3e119dc5a80b99351bae666e7813a8f88542aa41c26:ZohoMail
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

 ---- On Fri, 04 Jul 2025 12:29:01 +0400  Jani Nikula <jani.nikula@linux.intel.com> wrote --- 
 > Thanks for the detailed debug info. I'm afraid all I can say at this
 > point is, please file all of this in a bug report as described in
 > [1]. Please add the drm.debug related options, and attach the dmesgs and
 > configs in the bug instead of pointing at external sites.

Okay, now let me speculate how to fix this bug. :) I think someone with moderate kexec understanding
and with Intel GPU should do this: reproduce the bug and then slowly modify kexec_file_load code until it
becomes kexec_load code. (Or vice versa.) In the middle of this modification the bug stops to reproduce,
and so we will know what exactly causes it.

kexec_file_load and kexec_load should behave the same. If they do not, then we should
understand, why. We should closely review their code.

Also, in case of kexec_load kernel uncompressing and parsing performed by "kexec" userspace
tool, and in case of kexec_file_load by kernel. So we should closely review this two uncompressing/parsing code fragments.
I think that this bug is related to kexec, not to i915. And thus it should be fixed by kexec people, not by i915 people. (But I may be wrong.)

But okay, I reported it to that bug tracker anyway: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14598

Maybe there is separate kexec bug tracker?

Also, your bug tracker is cool. One can attach files in the middle of report. Why not whole kernel uses it? :)

--
Askar Safin
https://types.pl/@safinaskar

