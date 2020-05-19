Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BAFF61D92A2
	for <lists+dri-devel@lfdr.de>; Tue, 19 May 2020 10:55:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 917526E0D1;
	Tue, 19 May 2020 08:55:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7D0FF6E0D1
 for <dri-devel@lists.freedesktop.org>; Tue, 19 May 2020 08:55:15 +0000 (UTC)
IronPort-SDR: /LyuIJQn5wWYz5e4sLuJr77/fqsuNFYYFaizAOkFZ29VKKHuRqnLtWUbl52VgeGsUVjJi47VdW
 48UMg2d2yK4w==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 May 2020 01:55:14 -0700
IronPort-SDR: ylPGCtoKZYc0WZcfofwSc7yAJ8l9sx9z25BeuIT112O5dcfI/JKKv9F9lDEm+p8oMX6f8ImAqN
 RP+G6CXkYjuQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.73,409,1583222400"; d="scan'208";a="343077006"
Received: from stinkbox.fi.intel.com (HELO stinkbox) ([10.237.72.174])
 by orsmga001.jf.intel.com with SMTP; 19 May 2020 01:55:11 -0700
Received: by stinkbox (sSMTP sendmail emulation);
 Tue, 19 May 2020 11:55:10 +0300
Date: Tue, 19 May 2020 11:55:10 +0300
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: post@hiereth.de
Subject: Re: Graphic card that needs boot parameter 
Message-ID: <20200519085510.GU6112@intel.com>
References: <20200519052256.2E9C7636EA@berlin.abc-admin.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200519052256.2E9C7636EA@berlin.abc-admin.de>
X-Patchwork-Hint: comment
User-Agent: Mutt/1.10.1 (2018-07-13)
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
Cc: dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, May 19, 2020 at 07:22:56AM +0200, post@hiereth.de wrote:
> Hello,
> =

> in
> https://www.kernel.org/doc/html/latest/admin-guide/kernel-parameters.html
> You ask
> to inform about hardware that requires the setting
> i915.invert-brightness=3D1.
> =

> I needed this for an quite old notebook with the following
> specifications
> =

>   lspci -s 00:02 -nn
>   00:02.0 VGA compatible controller [0300]: Intel Corporation Mobile
>   915GM/GMS/910GML Express Graphics Controller [8086:2592] (rev 03)
>   00:02.1 Display controller [0380]: Intel Corporation Mobile
> 915GM/GMS/910GML
>   Express Graphics Controller [8086:2792] (rev 03)
> =

> Feel free to request additional information if need. Thanks for your
> work on the linux
> kernel and the respective documentation

Please file a new bug at
https://gitlab.freedesktop.org/drm/intel/issues/new

boot with drm.debug=3D0xe and attach the resulting dmesg to the bug.

Also include the ouput of these
lspci -vs 0:02.0
lspci -nvs 0:02.0

And I'd like to see a dump of the vbios. Can be done like so:
 echo 1 > /sys/devices/pci0000\:00/0000\:00\:02.0/rom =

 cat /sys/devices/pci0000\:00/0000\:00\:02.0/rom > vbios.dump
Pls attach that to the bug as well.

-- =

Ville Syrj=E4l=E4
Intel
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
