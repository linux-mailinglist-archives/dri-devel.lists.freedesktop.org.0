Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D19F11F244
	for <lists+dri-devel@lfdr.de>; Sat, 14 Dec 2019 15:44:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B1E5B6E3F4;
	Sat, 14 Dec 2019 14:43:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp.smtpout.orange.fr (smtp08.smtpout.orange.fr
 [80.12.242.130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 063A089CE1
 for <dri-devel@lists.freedesktop.org>; Fri, 13 Dec 2019 17:30:11 +0000 (UTC)
Received: from belgarion ([90.55.212.38]) by mwinf5d31 with ME
 id dVW52100L0qFw6q03VW5BQ; Fri, 13 Dec 2019 18:30:10 +0100
X-ME-Helo: belgarion
X-ME-Auth: amFyem1pay5yb2JlcnRAb3JhbmdlLmZy
X-ME-Date: Fri, 13 Dec 2019 18:30:10 +0100
X-ME-IP: 90.55.212.38
From: Robert Jarzmik <robert.jarzmik@free.fr>
To: Daniel Thompson <daniel.thompson@linaro.org>
Subject: Re: [PATCH] backlight: pwm_bl: Switch to full GPIO descriptor
References: <20191205081116.5254-1-linus.walleij@linaro.org>
 <20191205131525.tf4n3kfnkrf6eksl@holly.lan>
X-URL: http://belgarath.falguerolles.org/
Date: Fri, 13 Dec 2019 18:30:05 +0100
In-Reply-To: <20191205131525.tf4n3kfnkrf6eksl@holly.lan> (Daniel Thompson's
 message of "Thu, 5 Dec 2019 13:15:25 +0000")
Message-ID: <87immkxheq.fsf@belgarion.home>
User-Agent: Gnus/5.130008 (Ma Gnus v0.8) Emacs/26 (gnu/linux)
MIME-Version: 1.0
X-Mailman-Approved-At: Sat, 14 Dec 2019 14:42:54 +0000
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
Cc: Jingoo Han <jingoohan1@gmail.com>, Krzysztof Kozlowski <krzk@kernel.org>,
 Bartosz Golaszewski <bgolaszewski@baylibre.com>,
 dri-devel@lists.freedesktop.org, Lee Jones <lee.jones@linaro.org>,
 Guan Xuetao <gxt@pku.edu.cn>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Daniel Thompson <daniel.thompson@linaro.org> writes:

>
> ... I worry that palmtc.c is no longer compilable for some configs.
I you're right, there is a very simple way to test it :
make pxa_defconfig && make -j

It should scream if the compilation is broken, and the kernel CI should
certainly protect us.

Cheers.

-- 
Robert
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
