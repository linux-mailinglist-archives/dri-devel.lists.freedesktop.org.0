Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E525749682
	for <lists+dri-devel@lfdr.de>; Thu,  6 Jul 2023 09:37:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C733D10E456;
	Thu,  6 Jul 2023 07:37:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from unicorn.mansr.com (unicorn.mansr.com [81.2.72.234])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B1B0B10E37D
 for <dri-devel@lists.freedesktop.org>; Wed,  5 Jul 2023 14:51:06 +0000 (UTC)
Received: from raven.mansr.com (raven.mansr.com [81.2.72.235])
 by unicorn.mansr.com (Postfix) with ESMTPS id 639AE15360;
 Wed,  5 Jul 2023 15:51:05 +0100 (BST)
Received: by raven.mansr.com (Postfix, from userid 51770)
 id 4E1D1219FC1; Wed,  5 Jul 2023 15:51:05 +0100 (BST)
From: =?iso-8859-1?Q?M=E5ns_Rullg=E5rd?= <mans@mansr.com>
To: Daniel Thompson <daniel.thompson@linaro.org>
Subject: Re: [PATCH] backlight: led_bl: fix initial power state
References: <20230705142447.15546-1-mans@mansr.com>
 <20230705143320.GE6265@aspen.lan> <yw1xjzvezapt.fsf@mansr.com>
 <20230705144406.GA9021@aspen.lan>
Date: Wed, 05 Jul 2023 15:51:05 +0100
In-Reply-To: <20230705144406.GA9021@aspen.lan> (Daniel Thompson's message of
 "Wed, 5 Jul 2023 15:44:06 +0100")
Message-ID: <yw1xfs62za1y.fsf@mansr.com>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: quoted-printable
X-Mailman-Approved-At: Thu, 06 Jul 2023 07:37:10 +0000
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
Cc: linux-fbdev@vger.kernel.org, Jingoo Han <jingoohan1@gmail.com>,
 Helge Deller <deller@gmx.de>, Lee Jones <lee@kernel.org>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Daniel Thompson <daniel.thompson@linaro.org> writes:

> On Wed, Jul 05, 2023 at 03:36:46PM +0100, M=E5ns Rullg=E5rd wrote:
>> Daniel Thompson <daniel.thompson@linaro.org> writes:
>>
>> > On Wed, Jul 05, 2023 at 03:24:14PM +0100, Mans Rullgard wrote:
>> >> The condition for the initial power state based on the default
>> >> brightness value is reversed.  Fix it.
>> >>
>> >> Furthermore, use the actual state of the LEDs rather than the default
>> >> brightness specified in the devicetree as the latter should not cause
>> >> the backlight to be automatically turned on.
>> >>
>> >> If the backlight device is not linked to any display, set the initial
>> >> power to on unconditionally.
>> >>
>> >> Fixes: ae232e45acf9 ("backlight: add led-backlight driver")
>> >> Signed-off-by: Mans Rullgard <mans@mansr.com>
>> >> ---
>> >> Changes in v3:
>> >> - Add comment
>> >
>> > This mismatches the subject line ;-) but I can live with that if Lee
>> > and Jingoo can!
>>
>> Does it not fix it?  If you think the subject is misleading, feel free
>> to change it.
>
> The bit that goes into version control is fine!
>
> However without '[PATCH v3]' on the subject line for the initial patch
> there is a risk this thread will get overlooked and not queued[1].

Oh, I see now I forgot to add the v3 tag.  Sorry about that.

--=20
M=E5ns Rullg=E5rd
