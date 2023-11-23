Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 644187F6140
	for <lists+dri-devel@lfdr.de>; Thu, 23 Nov 2023 15:18:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F2C5810E756;
	Thu, 23 Nov 2023 14:18:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx3.molgen.mpg.de (mx3.molgen.mpg.de [141.14.17.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2782210E756
 for <dri-devel@lists.freedesktop.org>; Thu, 23 Nov 2023 14:18:04 +0000 (UTC)
Received: from [10.0.3.168] (unknown [93.240.169.83])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: pmenzel)
 by mx.molgen.mpg.de (Postfix) with ESMTPSA id 38C2A61E5FE03;
 Thu, 23 Nov 2023 15:17:34 +0100 (CET)
Message-ID: <ac27ba40-0f44-4503-a167-25e4f1211900@molgen.mpg.de>
Date: Thu, 23 Nov 2023 15:17:33 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Powered off Philips TV sends corrupt EDID causing flickering
To: Jani Nikula <jani.nikula@linux.intel.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>
References: <c9e3a8f1-d053-4203-a364-0d0703fafd19@molgen.mpg.de>
 <87leaqm5sl.fsf@intel.com>
Content-Language: en-US
From: Paul Menzel <pmenzel@molgen.mpg.de>
In-Reply-To: <87leaqm5sl.fsf@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
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
Cc: LKML <linux-kernel@vger.kernel.org>, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Dear Jani,


Thank you for your reply.

Am 22.11.23 um 11:38 schrieb Jani Nikula:
> On Tue, 21 Nov 2023, Paul Menzel wrote:

>> Connecting a USB Type-C port replicator [1] to the only USB Type-C port
>> of the Dell XPS 13 9360 with Debian sid/unstable and Debian’s Linux
>> kernel 6.10.5, and then connecting a Philips 40PFL5206H/12 TV device,
>> that is powered off or in standby, to the HDMI port, Linux logs:

[…]

> Depending on how the port replicator works, this may not come from the
> TV at all.
> 
> And all of this probably depends on GPU and driver, which are not
> mentioned.

Sorry for just mentioning the laptop model. It uses the device below:

     00:02.0 VGA compatible controller [0300]: Intel Corporation HD 
Graphics 620 [8086:5916] (rev 02) (prog-if 00 [VGA controller])

> If it's i915, please see [1] on how to file a bug.

Thank you for taking the time to tell me the proper forum. I created the 
two issues below:

1.  EDID has corrupt header [2]
2.  No image on Philips TV when turning on while connected over 
HDMI/USB-C port replicator (`[drm] *ERROR* Link Training Unsuccessful`) [3]


Kind regards,

Paul


> [1] https://drm.pages.freedesktop.org/intel-docs/how-to-file-i915-bugs.html
[2]: https://gitlab.freedesktop.org/drm/intel/-/issues/9705
[3]: https://gitlab.freedesktop.org/drm/intel/-/issues/9707
