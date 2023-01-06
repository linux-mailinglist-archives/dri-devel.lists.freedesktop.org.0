Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8169865FBF9
	for <lists+dri-devel@lfdr.de>; Fri,  6 Jan 2023 08:32:51 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4DB4210E4A8;
	Fri,  6 Jan 2023 07:32:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sender-of-o50.zoho.in (sender-of-o50.zoho.in [103.117.158.50])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0A0B210E4A8
 for <dri-devel@lists.freedesktop.org>; Fri,  6 Jan 2023 07:32:43 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1672990355; cv=none; d=zohomail.in; s=zohoarc; 
 b=GoX6sahFvLaj/pKTGxEYSA/SV0Z8iTxRNlPOTF/TMgPVoBVhOMiVjl5APinTt+nvQKg3O2M3UONNmbF0d8l3FPSNA0kHAsFuJ74fz5yui0PdoLY7ZMaLvAs5u/TeTYOghl+PLsccgAoffUBXBhLEavCbT/N+bTqz/CVSS/adp+M=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.in;
 s=zohoarc; t=1672990355;
 h=Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:To;
 bh=WS/hdy01N0Juv3Ttgo1sNOBbMRgD6F4OxFx94LvmrTs=; 
 b=J36Khy8nncWCKdpXmKPRNy9KmSlXMPR48kT/5veYaDWuS++cdJ64SqXpMmRds0/+dYaa85xDiBl2dE3j0r/0U65GauaWpB+1U0oUU+dxnj3UG9UtYAVtbiFe1D+QZfCv2uLpZwl63eH/IAibsCQXmvcf8xhyC7W45BzG7rCUN7g=
ARC-Authentication-Results: i=1; mx.zohomail.in; dkim=pass  header.i=siddh.me;
 spf=pass  smtp.mailfrom=code@siddh.me;
 dmarc=pass header.from=<code@siddh.me>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1672990355; 
 s=zmail; d=siddh.me; i=code@siddh.me;
 h=Date:Date:From:From:To:To:Cc:Cc:Message-ID:In-Reply-To:References:Subject:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
 bh=WS/hdy01N0Juv3Ttgo1sNOBbMRgD6F4OxFx94LvmrTs=;
 b=e0fnq40I7zFWKG5ueLuqjBd5HB8GrJgqxKQ/59ff1YuASWMDhJ09QP37lHvRBfE6
 3oHPJXDp8p3MW/1qIQC0zoXZVZup+ZQwto+PHYBuTC/PxTSd7jsk+qLZKl9ySkWkTNm
 Q1hV2pm10rPvmLe60m6GHFtRUuADW/Co7CF6F8no=
Received: from mail.zoho.in by mx.zoho.in
 with SMTP id 1672990345371256.09667059009894;
 Fri, 6 Jan 2023 13:02:25 +0530 (IST)
Date: Fri, 06 Jan 2023 13:02:25 +0530
From: Siddh Raman Pant <code@siddh.me>
To: "kernel test robot" <lkp@intel.com>
Message-ID: <18585fec891.52e321753098.6078461646055436084@siddh.me>
In-Reply-To: <202301060832.V0LzL1Hg-lkp@intel.com>
References: <7acc7401b5ad0aec973948822bfa906a9615c43e.1672957022.git.code@siddh.me>
 <202301060832.V0LzL1Hg-lkp@intel.com>
Subject: Re: [PATCH v4 01/10] drm/print: Fix and add support for NULL as
 first argument in drm_* macros
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
Cc: thomas zimmermann <tzimmermann@suse.de>,
 linux-kernel <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 oe-kbuild-all <oe-kbuild-all@lists.linux.dev>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, 06 Jan 2023 06:43:35 +0530, kernel test robot wrote
> Hi Siddh,
> 
> Thank you for the patch! Perhaps something to improve:

Yes, I sent the rectification as a reply to this patch. [1]
Reviewers may please take note.

Thanks,
Siddh

[1] https://lore.kernel.org/all/20230105224018.132302-1-code@siddh.me/
