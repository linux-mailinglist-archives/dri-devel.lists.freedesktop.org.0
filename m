Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C7FBCB57389
	for <lists+dri-devel@lfdr.de>; Mon, 15 Sep 2025 10:51:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6506A10E2C5;
	Mon, 15 Sep 2025 08:51:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="I97hN2jm";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8878010E2C5
 for <dri-devel@lists.freedesktop.org>; Mon, 15 Sep 2025 08:51:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1757926285; x=1789462285;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version:content-transfer-encoding;
 bh=TVxNlf7sbTkndI79nSiQZ3QYbhRxOrgs72TgGHNuVBw=;
 b=I97hN2jmbfDfCZ5zZUGJ1t+bUhhBnYUMoXQYkPZeCWkVrErj4CYpWCdf
 9FTYxUvo7iJafDWolMb54uyBP5Yd7u1zmeULSk11+Cdgn6lYlRqGFQ0Ya
 rAYHj54YIR7w64vkE9EhEqbKbvPVuy0XHn20o9z7Q39ePVG3aSRaBxJq5
 TSLL0QmNx2wLkdeCzU3rweob1dmg+F/O86AsYJ88jIQQEtsiwIxTzBlfN
 Rgu/s1mg8bSai7BbOFHBir/H4UsnQ7bBNEI1nKTKYyE6lxxkcJ8+fs09F
 WdELNKYEA4Zk6CK/Vb5XCAicdDRr37PHsyX8BaPfJVQaQ84cPtZrHyqdh w==;
X-CSE-ConnectionGUID: YDIrn9gcTjCDcfW8RSrQMQ==
X-CSE-MsgGUID: Vn6dnpy8QP+2XaDk+3wE9Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11553"; a="60316303"
X-IronPort-AV: E=Sophos;i="6.18,265,1751266800"; d="scan'208";a="60316303"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Sep 2025 01:51:25 -0700
X-CSE-ConnectionGUID: PA2lS0NHQwKLWOc9NwmOxQ==
X-CSE-MsgGUID: 9fB/F/qhSIieBNM6n3mBVQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,265,1751266800"; d="scan'208";a="211715387"
Received: from carterle-desk.ger.corp.intel.com (HELO localhost)
 ([10.245.246.17])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Sep 2025 01:51:23 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Tiago Martins =?utf-8?Q?Ara=C3=BAjo?= <tiago.martins.araujo@gmail.com>,
 dri-devel@lists.freedesktop.org
Cc: airlied@gmail.com, simona@ffwll.ch
Subject: Re: DisplayID checksum validation blocking hardware capabilities -
 CSO T3 panel
In-Reply-To: <CACRbrPGvLP5LANXuFi6z0S7XMbAG4X5y2YOLBDxfOVtfGGqiKQ@mail.gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <CACRbrPGvLP5LANXuFi6z0S7XMbAG4X5y2YOLBDxfOVtfGGqiKQ@mail.gmail.com>
Date: Mon, 15 Sep 2025 11:51:19 +0300
Message-ID: <2da1034168eecf015640f84e6e1180b3ae1d3b94@intel.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sun, 14 Sep 2025, Tiago Martins Ara=C3=BAjo <tiago.martins.araujo@gmail.=
com> wrote:
> Complete EDID Data:
>
> 00000000  00 ff ff ff ff ff ff 00  36 74 5a 09 00 00 00 00
>  |........6tZ.....|
> 00000010  00 21 01 04 b5 22 16 78  03 ee 95 a3 54 4c 99 26
>  |.!...".x....TL.&|
> 00000020  0f 50 54 00 00 00 01 01  01 01 01 01 01 01 01 01
>  |.PT.............|
> 00000030  01 01 01 01 01 01 40 e7  00 6a a0 a0 67 50 08 98
>  |......@..j..gP..|
> 00000040  08 00 58 d7 10 00 00 18  00 00 00 fd 00 30 78 87
>  |..X..........0x.|
> 00000050  87 3c 01 0a 20 20 20 20  20 20 00 00 00 fe 00 43  |.<..
>  .....C|
> 00000060  53 4f 54 33 0a 20 20 20  20 20 20 20 00 00 00 fe  |SOT3.
> ....|
> 00000070  00 4d 4e 45 30 30 37 5a  41 31 2d 35 0a 20 01 98  |.MNE007ZA1-5.
> ..|
> 00000080  70 13 79 00 00 03 01 14  9a 0f 01 05 3f 0b 9f 00
>  |p.y.........?...|
> 00000090  2f 00 1f 00 07 07 69 00  02 00 05 00 00 00 00 00
>  |/.....i.........|
> 00000100  00 00 00 00 00 00 00 00  00 00 00 00 00 00 00 00
>  |................|
> 00000110  00 00 00 00 00 00 00 00  00 00 00 00 00 00 00 00
>  |................|
> 00000120  00 00 00 00 00 00 00 00  00 00 00 00 00 00 00 00
>  |................|
> 00000130  00 00 00 00 00 00 00 00  00 00 00 00 00 00 00 00
>  |................|
> 00000140  00 00 00 00 00 00 00 00  00 00 00 00 00 00 00 00
>  |................|
> 00000150  00 00 00 00 00 00 00 00  00 00 00 00 00 00 00 00
>  |................|
> 00000160  00 00 00 00 00 00 00 00  00 00 00 00 00 00 00 00
>  |................|
> 00000170  00 00 00 00 00 00 00 00  00 00 00 00 00 00 f0 98
>  |................|

That's not the complete EDID data, though. It's missing 6*16 bytes. If
you go by the hex offsets, 0x100 does not follow 0x090.

> As an experiment to understand the failure, I commented out the checksum
> validation code. Results with validation bypassed:

Running that, please grab the EDID from sysfs. edid-decode does a good
job of decoding, but also includes the hex in case we want to run it on
a newer or modified edid-decode.

BR,
Jani.

--=20
Jani Nikula, Intel
