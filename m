Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E15B54E5EC4
	for <lists+dri-devel@lfdr.de>; Thu, 24 Mar 2022 07:38:20 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6E05A10E363;
	Thu, 24 Mar 2022 06:38:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout.gmx.net (mout.gmx.net [212.227.17.22])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1C85510E363
 for <dri-devel@lists.freedesktop.org>; Thu, 24 Mar 2022 06:38:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1648103892;
 bh=eSQq/XcXAU2lYmD2WDC139IVXbDfpofvYA+9iId4Q5I=;
 h=X-UI-Sender-Class:Date:Subject:To:Cc:References:From:In-Reply-To;
 b=XyvlhDz5hIo6BOU0qJ/Vs0MX5Uv1gue06676C6xOtggsFAxOHDpH72iDXTlkdZnrS
 2WZXl5whAUh5D7uUIWRJdOtnD+nd34RS4FayNy7uqfSlEvWUrayXZtAy3JkA3rU9/l
 uaK6ZrZMSjPOJgJtJ8cPkpiPa2o2U5ger6j457W4=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from [192.168.20.60] ([92.116.161.116]) by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MIwz4-1nnIrO1VSE-00KT0S; Thu, 24
 Mar 2022 07:38:12 +0100
Message-ID: <4115b2c5-7f7f-2ef3-e368-b21766774b5c@gmx.de>
Date: Thu, 24 Mar 2022 07:38:08 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.2
Subject: Re: [PATCH] video: of: display_timing: Remove a redundant zeroing of
 memory
Content-Language: en-US
To: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
References: <99f22ad1068fbbbc95acea59871cd408cde2623d.1647981212.git.christophe.jaillet@wanadoo.fr>
From: Helge Deller <deller@gmx.de>
In-Reply-To: <99f22ad1068fbbbc95acea59871cd408cde2623d.1647981212.git.christophe.jaillet@wanadoo.fr>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:CDiv9WbLv+NmReFdAyGNEBUXfh08WS4B6T6bgkSs+Df40MoBKCt
 Uad2SOYmSFYzTh5TyaEI6SHLEN42QkGaLXHXbWFH2ev/HpAQW2PYdcDWK5CjioKp5eKg2Lw
 C1KfZBYwGV5w/nzFHG7DbEQVSiYGhEkDYxcBG5T0h4VVATOWNLW8uTWqrQkeRG61vEibYmo
 QUxCnelQpkjykACYJDhCQ==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:ReJHmqSzpso=:cbmuW9uJdhzyf2ri8d8jsy
 GEswZP+eO0EMizGOirmsSqMkCq41SexPFM10EpFt755q+S7W4gMBnkUefZVXobwBT6zE/hIks
 KPxWKftCmlOafw96s2ukQ1STUldb2aRjdVAMrefInWqUwUmYMCb04yoZRou7mSPrdhq5K33/p
 /GtS2tbtxGpXz29t2kLwIkByTjE+4INgoY6nOAhwTLL1y9lJF33GCZbECl5JCmpBnzr+JMbaX
 EE3hMRD0VNIYRJNe43bbavOVRz893GOUcN6EWIv56AID9ggfSQ1Gv4irk3bsf/tm67zYLAEu2
 sivQ5sjU4yUEP7LlMLOxhVDQVQia4DnW2JXEBtd7xUY/dGRJ6aW365vxbDRrP7LI5yCP5CKxI
 InSMy9gu5Eng7jVaDhzuPMmm7c+WKp0/KxDvj3fiVYdtPPs3zmGE0vFQvXlQEVh6fUjXndcCb
 b7ijcmHdG4H4VydgRH04met58N02f9De+lZW8n+XjDOPiBNvLGbpe1NhfvP+7kzenxK3Yo++y
 eGEKqZdylLopdAAhaXOCSd9f1oqKPeSUzdaZ+nMSwznMsOyCHlHX6aNe28KT18h1yMQYyASUi
 0fQJLMulge1v5hfO95puNvnoruqDPilxHWv7QgktacgA8GDQMHhwwWGnzIikVGTjq3e0zJC2c
 eTDF08Yh17bSPHbCW+82BjzaZkMRMmMeM/MkljjPi7UyABLNqJSBlitO6KeDiew0EXyJyyskJ
 QzBFAqFmzU1IkpbGNRt49Wt1lO24840U0RY23f5Pn81oHEIrmI+XnyZyO8yL+UP2DQze4jLxh
 QjwW8nIFv9fmeNxV3WGfNrEUhp0dmf92YRowm9q/n4DjkykDaFoKEhlZ8aeRy4NNwk9T/mO2m
 PQlnU7QSQCZyK7/7Oiv5sEchaKZUz7BhdcrkgQA1TBoux7eL1XePIxVGrs58FrO2nffIiSrRJ
 o2WwHXJyuk9mSYHKRncj43lWWWyV9mP8jv+50509Np7ai7djeMg0JFiYPLLNKrCJfXjZEJM4L
 //3tgS0n5ziEGSOesSnLOp5ILeH0KYeO/38DxC2yl/TB4JsxJ0rbidlu4QdRSCq8CNRkC9cpf
 nLPzmP1TTKBXjs=
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
Cc: linux-fbdev@vger.kernel.org, kernel-janitors@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 3/22/22 21:33, Christophe JAILLET wrote:
> of_parse_display_timing() already call memset(0) on its 2nd argument, so
> there is no need to clear it explicitly before calling this function.
>
> Use kmalloc() instead of kzalloc() to save a few cycles.
>
> Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>

applied.

Thanks!
Helge

> ---
>  drivers/video/of_display_timing.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/video/of_display_timing.c b/drivers/video/of_displa=
y_timing.c
> index f93b6abbe258..bebd371c6b93 100644
> --- a/drivers/video/of_display_timing.c
> +++ b/drivers/video/of_display_timing.c
> @@ -199,7 +199,7 @@ struct display_timings *of_get_display_timings(const=
 struct device_node *np)
>  		struct display_timing *dt;
>  		int r;
>
> -		dt =3D kzalloc(sizeof(*dt), GFP_KERNEL);
> +		dt =3D kmalloc(sizeof(*dt), GFP_KERNEL);
>  		if (!dt) {
>  			pr_err("%pOF: could not allocate display_timing struct\n",
>  				np);

