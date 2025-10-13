Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A57DBED5E3
	for <lists+dri-devel@lfdr.de>; Sat, 18 Oct 2025 19:45:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F3A4710E0A2;
	Sat, 18 Oct 2025 17:45:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="oDRfL0J7";
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="TchclWmw";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5FC9310E0A2
 for <dri-devel@lists.freedesktop.org>; Sat, 18 Oct 2025 17:45:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1760809522; x=1792345522;
 h=resent-from:resent-date:resent-message-id:resent-to:date:
 from:to:cc:subject:message-id:references:mime-version:
 in-reply-to; bh=RJ5KIkMJIdV/yBi8CkjP5HLVKkDZSkWUq8PX0/Pcz0U=;
 b=oDRfL0J71Irsitb9iRnZhqC0xj+EVxZaRG8FDfoN7W3o6WjbWo67XH7K
 baPFJZ1yIKRXjeNXv+b9eSjQ5q55D0AdGfo0Uu5iGmFPPaTyBqvDzbMwy
 1fArnQULc6hpjnO+j3DS9JEj5FBvoINNGUiEFV84VbgmAp/IapEjAgYli
 eEuK5yXz+Je85U0ep0+ucePLdKLJA4QUgw5D6tcZ4ZjCNxp+qn4NHOQit
 OfNkEuE/DdZajEPl7/xaH9x8NMFd9BOPItjSox36pVKHcv5cBIB/eJBNr
 RgA9zL/d60MOZQspG1WEVQCIlrjJruZcfGfAFQ19soTbdutKOxLV1qhUx A==;
X-CSE-ConnectionGUID: NYLK8TyfQkCPqOeyc8scSA==
X-CSE-MsgGUID: cREEEBn/QVilO9tUeisQXQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="50568517"
X-IronPort-AV: E=Sophos;i="6.19,239,1754982000"; d="scan'208";a="50568517"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Oct 2025 10:45:22 -0700
X-CSE-ConnectionGUID: kh1ypyWISyyIdVx0koO0SA==
X-CSE-MsgGUID: tJHPmdTCRn+wlxdNbnbcxw==
X-ExtLoopCount2: 2 from 10.245.244.194
X-IronPort-AV: E=Sophos;i="6.19,239,1754982000"; d="scan'208";a="186995823"
Received: from pgcooper-mobl3.ger.corp.intel.com (HELO ashevche-desk.local)
 ([10.245.244.194])
 by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Oct 2025 10:45:21 -0700
Received: from andy by ashevche-desk.local with local (Exim 4.98.2)
 (envelope-from <andriy.shevchenko@intel.com>)
 id 1vAAzW-00000000sQf-0zQu; Sat, 18 Oct 2025 20:45:18 +0300
Resent-From: Andy Shevchenko <andriy.shevchenko@intel.com>
Resent-Date: Sat, 18 Oct 2025 20:45:17 +0300
Resent-Message-ID: <aPPSLUmd1JZz8CK9@ashevche-desk.local>
Resent-To: DeepanshuPratik <deepanshu.pratik@gmail.com>,
 dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org
X-Original-To: andriy.shevchenko@linux.intel.com
Received: from linux.intel.com [10.54.29.200]
 by ashevche-desk with IMAP (fetchmail-6.5.6)
 for <andy@localhost> (single-drop); Sat, 18 Oct 2025 20:35:24 +0300 (EEST)
Received: from fmviesa004.fm.intel.com (fmviesa004.fm.intel.com
 [10.60.135.144])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by linux.intel.com (Postfix) with ESMTPS id E058820B5713
 for <andriy.shevchenko@linux.intel.com>; Sat, 18 Oct 2025 10:34:18 -0700 (PDT)
X-CSE-ConnectionGUID: oldjhd4ARsSKdc9WNS2/MA==
X-CSE-MsgGUID: VvQ0ZGxxS32gvp4gJfO45w==
X-IronPort-AV: E=Sophos;i="6.19,239,1754982000"; d="scan'208";a="188287876"
Received: from orvoesa107.jf.intel.com ([10.18.183.147])
 by fmviesa004-1.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Oct 2025 10:34:18 -0700
X-CSE-ConnectionGUID: 17FiWFNXSG6Em8fsUwesDQ==
X-CSE-MsgGUID: 5Ay5ZfYcR5KHHN79JxGUQw==
IronPort-SDR: 68f3cf99_kgjm+AJPFdd1GTGDmkIRQ/3maipK0sq0Oihf1Yly4GwNcED
 Y89GK/2zArC49IUhbhnHomCyDxQ/lYIicDXllqQ==
X-ThreatScanner-Verdict: Negative
X-IPAS-Result: =?us-ascii?q?A0ELAADpzvNohR/86qxRCRoBAQEBAQEBAQEBAwEBAQESA?=
 =?us-ascii?q?QEBAQICAQEBAUAbgSQCAQEBAQsBgj+BAl9BSYgkhSyGV4IEIJ9aPREBAQEBA?=
 =?us-ascii?q?QEBAQEJMR4CBAEBAwEDkU4CJjcGDQEBAgQBAQEBAwIBAgEBAQEBAQEBAQEBC?=
 =?us-ascii?q?wEBAQICAQEBAgEBBgMBAQEBAhABAQEBQEmGTw2CWztxXgcJNwEBAQEBAQEBA?=
 =?us-ascii?q?QEBAQEBAQEBAQEBAQEBAQERAg1eAQEdAQEBAQIBOgYBAR4ZAQQLCxguEEYGg?=
 =?us-ascii?q?xUBgiIBBiMnAwWuQniBNIEBggwBAQYEBX/bHYFkCYFKAYhQAYlqeieCKIQ/P?=
 =?us-ascii?q?oQXhnCBEoEUgQ6GMIsHhiZSeBwDWSwBVRMXCwcFgSBDA4ELI0sFLR2BJyIfH?=
 =?us-ascii?q?AgLYFRAgkMCgQQbBmgPBoETGUkCAgIFAkI6gWkGHAYfEgIDAQICOlcNgXcCA?=
 =?us-ascii?q?gSCMYEQgikPhkEDC209NxQbk3yDdl8CfqZ6oRQHhB+MHpVTM4NxE4FXizyGO?=
 =?us-ascii?q?5MZmQapQYF+JIFccIM3CUYcD44hhACFQb8dQTQ8AgcLAQEDCYVIgQCLVoFLA?=
 =?us-ascii?q?QE?=
IronPort-PHdr: A9a23:gLQRoRBpN8HXjo4BaHkHUyQUV0UY04WdBeb1wqQuh78GSKm/5ZOqZ
 BWZua42ygeVFtyAsawYw6qO6ua8AjdGuc3A+Fk5M7VyFDY9wf0MmAIhBMPXQWbaF9XNKwEcI
 oFpeWQhwUuGN1NIEt31fVzYry76xzcTHhLiKVg9fbytScbdgMutyu+95YDYbRlWizqhe7NyK
 wi9oRnMusUMjoZvJKg8xgHVrnZHdOha2G1lKUySkhvz+8y8+IJv/zlKt/8u+cNNX7/2c7g2Q
 LBdET8rL3076Mr3uBbMSgeC+mESWXgMnBpSBAjF4hD6XpPvvSb/q+FwxiqUM9DoQL4tQTis4
 L9lRxDxhCoZODA37XnbhcNsgq1VphKhvAF/zJXPYI6JLvp+f7jScs0cSGFcQ8teTS1BAoe7b
 4sSE+oMOPtToofhq1cSqxa1GA+hD/7txDBVnH/7xaM03eQ/HwzYwQIuHNwOv3vIo9roNqgSV
 vu4zLXUwTjZc/9axSvx5JbOfxs8of+MR7Vwcc/JxEQzEQPKk1WRopH4MTOVyOsNrXSU7+p+W
 uKpiG4nrBx6rz+1yccql4bJnIMVy1De+SViwIY6O8O4R1J7YdG6FptQtCaaOpB3QsMkX2Fnp
 iI6xqcatp68eSgH0ZIqzAPQZPKbaYaH+A7jVPqPLjdignJoYLGyigi9/EWvyeDxSte53VdKo
 ydEnNTAqG4B2gDS58SaS/Zw4Fqt1DmN2g3N6exJIE85mKTGJ5MlzLA9l4Qev0vFEyTrm0v2l
 Lebelgm9+S28ejrfLvrq5CGO4NqigzyLL4il8KiDeggLwQDW3aX9f6h2LDn/kD1WqhGg/w4n
 6XDrZzWOcIWrbOjDQBPyIYs8RO/Ai+m0NsGmXkHK0pIeAmZgIfzIV3OO/f4Deqlg1uwjjhn3
 fPGMaP7ApXLMHfDlK3tfbFn605T0AYzzNZf6IxICrwZPf7+WFH9uMbGAhI3PAG42fjrBdVj2
 o8EV2+DH7eVMKbIvl+J4uIvLfOMZIgQuDvlNvYr++PggWMhlFEdfKeo0p4ZZWi3E/loO0iZY
 HzsgssfHmcOpAYxUOvqiFiaXDFJYXa9Qrg85jA7CY68FofDRp6igKKd0ye7AJJWYGNGCleXH
 HfraYqEQfEMZzyWIsN7lTwET7ehR5c71R6yrA/616ZnLu3M9yICs5LsycJ15+zTlB0o7jx0D
 9qS03+RQGF0gGwIQTw23KdkrEx5y1eD17V4gvNCGdxS4fNJThk1NZrGw+NmDNDyXxrNftGSR
 1m+WNWpHSkxTs4tw98Je0txBs2ujh/d0CqtALEbjaSGC5Ip/K7ExXj+Odh9xXXc2qQ5lFkpX
 NFAOXe9hq546gjTHZLGnFuDm6apa6scxijN+3mHzWaUu0FYSgFwXb3YUnAcZ0vWqMz06FvNQ
 bCgF7opLhdMx8iaJqRXb93ml09GS+v7NdrGemy/g2i+CQ6TxrOUYornY30T0jzFBkYLiwwT5
 m6GNQYmCSehvW3eCDtuGEr3bU316edwpyDzckhh4wyHd0RnzLqowgQcmf2fA6cf078csSE6q
 ygyBEy0w9PVI9WFrgtlOq5bZIVuzk1A0DfwsQBsdqegIr5phlMYcAM/60ro2w92G8NbkcU0p
 3Mnygl1AaOezF5FMTif2MajafXsNmDu8UX3OObt0VbE3YPOkk9HwO89t02lvwyzEEcmtXJ93
 Iod336V/J6fFAMJStqxShMx8B53773beXw74IXZlDVsPKC4vyWE1cguAb4kzAqte5FUN6bs/
 EfaCMgGH46tJfYsllzvaQgLb6hJ7KBhJ8q9bLOd3bKzeuNpnTaol2NCtYF7zk+IsSF7T4b1
IronPort-Data: A9a23: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
 A==
IronPort-HdrOrdr: A9a23:Bw8+yKGfXxxtGCagpLqEC8eALOsnbusQ8zAXPiBKJ31omwKj5r
 GTddAgpGjJYVcqKQUdcLW7WJVpoB7nmqKdjrNhQYtKNjOKhILFFvAc0WKm+UyXJ8SczJ8p6U
 4DSdkMNDQhNykysS+S2mDReLxNsb73itHUuQ6d9QYecegAUdAR0+4WMHfkLmRGACN9Kd4SEp
 2a6sBbpzymV0g2Q62Adxp1OdTrlpngrr6jRQQJKSIGxWC1/FHYkYISVCLopiv2VQk/pMZHgB
 P4rzA=
X-Talos-CUID: 9a23:lqA0zWDCkn314K/6E3A42k8rNOYVSVKD4XKALVSFFmtyZITAHA==
X-Talos-MUID: =?us-ascii?q?9a23=3ArI62gA4tGyatZpcRuLBG2ZMjxow1yrXzOk48mq9?=
 =?us-ascii?q?bmOmkE3MhGSeysQ2oF9o=3D?=
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="66637568"
X-IronPort-AV: E=Sophos;i="6.19,239,1754982000"; d="scan'208";a="66637568"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from sea.source.kernel.org ([172.234.252.31])
 by mtab.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Oct 2025 10:34:18 -0700
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 6BA9B46214;
 Sat, 18 Oct 2025 17:34:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
 id 614C5C113D0; Sat, 18 Oct 2025 17:34:17 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by smtp.kernel.org (Postfix) with ESMTPS id 9BF0DC4CEF8
 for <andy@kernel.org>; Sat, 18 Oct 2025 17:34:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 9BF0DC4CEF8
Authentication-Results: smtp.kernel.org;
 dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1760808856; x=1792344856;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=RJ5KIkMJIdV/yBi8CkjP5HLVKkDZSkWUq8PX0/Pcz0U=;
 b=TchclWmwk/Fci/uLSrFiFMkBQ+TaqemYsY+8GFYpVLKtYCwmLzaW9lQm
 gAikMsiq36sKGtkovNxVWix05cf5EcjSPHLzFdjx0TqfjOWlllJRPs7Zg
 x/QoUMEXTmjAcKHKp/RXe8xMf7cGKuRZ92JQ8nHduOW4pSoaCjQlgRKNm
 QaKAZB+7++aLSwUUh9R998jWbO61aBB931y70GGxBkserIveZDeV1KELa
 +v7vISaFWzg4AjIxNQbAF9SXLknRq6ToIcOZ18L5q3xUxoaw/HKa1G7dk
 RMXivgsGJY3gZ90wjuPHQQViMInz9C+asZHqRMSnGrxGXBediXVOM9pzV Q==;
X-CSE-ConnectionGUID: 0ry4sZjKTK+6w2++q+OG+g==
X-CSE-MsgGUID: gnqd2XoISnSUSsbdHy4yaQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="74340898"
X-IronPort-AV: E=Sophos;i="6.19,239,1754982000"; d="scan'208";a="74340898"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Oct 2025 10:34:16 -0700
X-CSE-ConnectionGUID: WHdI2lB5T8SS9QNrPq6EOw==
X-CSE-MsgGUID: RnMIvm3yRVacyah8szT1/g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,239,1754982000"; d="scan'208";a="183749980"
Received: from pgcooper-mobl3.ger.corp.intel.com (HELO ashevche-desk.local)
 ([10.245.244.194])
 by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Oct 2025 10:34:15 -0700
Received: from andy by ashevche-desk with local (Exim 4.98.2)
 (envelope-from <andriy.shevchenko@intel.com>)
 id 1v8PVf-000000002rj-2iH5; Mon, 13 Oct 2025 23:51:11 +0300
Date: Mon, 13 Oct 2025 23:51:11 +0300
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: DeepanshuPratik <deepanshu.pratik@gmail.com>
Cc: andy@kernel.org, gregkh@linuxfoundation.org,
 dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org
Subject: Re: [PATCH] staging: fbtft: fix macro usage and style warnings
Message-ID: <aO1mPzy6vjg3tnrh@smile.fi.intel.com>
References: <20250919212938.822374-1-deepanshu.pratik@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250919212938.822374-1-deepanshu.pratik@gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo
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

On Sat, Sep 20, 2025 at 02:59:38AM +0530, DeepanshuPratik wrote:
> This patch fixes the trailing comma issue in the
> define_fbtft_write_reg() macro calls, which caused
> checkpatch.pl to complain with:
> 
>   ERROR: space prohibited before that close parenthesis ')'

Please. go and fix checkpatch instead.

> The affected macro invocations were updated to pass an
> identity modifier instead of leaving the argument empty.
> This resolves build errors while ensuring compliance
> with kernel coding style.
> 
> No functional changes are introduced; this patch only
> addresses build and style issues.

-- 
With Best Regards,
Andy Shevchenko


