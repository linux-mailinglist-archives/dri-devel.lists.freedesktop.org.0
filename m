Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 72EB9180C75
	for <lists+dri-devel@lfdr.de>; Wed, 11 Mar 2020 00:36:47 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5B5A66E8FB;
	Tue, 10 Mar 2020 23:36:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 365 seconds by postgrey-1.36 at gabe;
 Tue, 10 Mar 2020 18:18:48 UTC
Received: from alexa-out-sd-02.qualcomm.com (alexa-out-sd-02.qualcomm.com
 [199.106.114.39])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 43B516E379
 for <dri-devel@lists.freedesktop.org>; Tue, 10 Mar 2020 18:18:48 +0000 (UTC)
Received: from unknown (HELO ironmsg05-sd.qualcomm.com) ([10.53.140.145])
 by alexa-out-sd-02.qualcomm.com with ESMTP; 10 Mar 2020 11:12:43 -0700
Received: from gurus-linux.qualcomm.com ([10.46.162.81])
 by ironmsg05-sd.qualcomm.com with ESMTP; 10 Mar 2020 11:12:42 -0700
Received: by gurus-linux.qualcomm.com (Postfix, from userid 383780)
 id DE2854AAD; Tue, 10 Mar 2020 11:12:42 -0700 (PDT)
Date: Tue, 10 Mar 2020 11:12:42 -0700
From: Guru Das Srinagesh <gurus@codeaurora.org>
To: Daniel Thompson <daniel.thompson@linaro.org>
Subject: Re: [PATCH v7 12/13] backlight: pwm_bl: Use 64-bit division macros
 for period and duty cycle
Message-ID: <20200310181242.GA31738@codeaurora.org>
References: <cover.1583782035.git.gurus@codeaurora.org>
 <bf6d8f6190d266f8992bd5451b12c9f3962fd18e.1583782035.git.gurus@codeaurora.org>
 <20200310143432.cfjlqac5x6oinshj@holly.lan>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200310143432.cfjlqac5x6oinshj@holly.lan>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-Mailman-Approved-At: Tue, 10 Mar 2020 23:36:13 +0000
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
Cc: linux-pwm@vger.kernel.org, linux-fbdev@vger.kernel.org,
 Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <uwe@kleine-koenig.org>,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 Jingoo Han <jingoohan1@gmail.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Thierry Reding <thierry.reding@gmail.com>,
 Subbaraman Narayanamurthy <subbaram@codeaurora.org>,
 Lee Jones <lee.jones@linaro.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Mar 10, 2020 at 02:34:32PM +0000, Daniel Thompson wrote:
> This patch looks like it is a tiny change to get the pwm_backlight to
> perform 64-bit division. Most of the above text is completely irrelevant
> to the change contained in this patch. No need to justify the change in
> the PWM structures here since that can go in the patch that changes
> those structures.  Just describe what this patch does, perhaps something
> like the following:
> 
>     The PWM API will shortly switch the state.period and
>     state.duty_cycle fields to 64-bit values. Make pwm_bl
>     ready for this transition by adopting 64-bit division
>     macros.

Will update the commit text accordingly.

> Also please copy the backlight maintainers into the covering letter. It
> is useful to place patches like this into context.

Will do.

Thank you.

Guru Das.
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
