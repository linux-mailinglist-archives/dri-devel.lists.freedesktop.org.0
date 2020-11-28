Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 755DA2C7C3A
	for <lists+dri-devel@lfdr.de>; Mon, 30 Nov 2020 02:03:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F39696E409;
	Mon, 30 Nov 2020 01:03:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from aposti.net (aposti.net [89.234.176.197])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1F8F36E06D
 for <dri-devel@lists.freedesktop.org>; Sat, 28 Nov 2020 20:03:54 +0000 (UTC)
Date: Sat, 28 Nov 2020 20:03:40 +0000
From: Paul Cercueil <paul@crapouillou.net>
Subject: Re: [PATCH] drm/ingenic: Add basic PM support
To: Sam Ravnborg <sam@ravnborg.org>
Message-Id: <4QVIKQ.W7K2XGO9R8N22@crapouillou.net>
In-Reply-To: <20201128185820.GA1001988@ravnborg.org>
References: <20201128171606.132830-1-paul@crapouillou.net>
 <20201128185820.GA1001988@ravnborg.org>
MIME-Version: 1.0
X-Mailman-Approved-At: Mon, 30 Nov 2020 01:02:59 +0000
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
Cc: David Airlie <airlied@linux.ie>, od@zcrc.me,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="iso-8859-1"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



Le sam. 28 nov. 2020 =E0 19:58, Sam Ravnborg <sam@ravnborg.org> a =E9crit =

:
> Hi Paul.
> =

> On Sat, Nov 28, 2020 at 05:16:06PM +0000, Paul Cercueil wrote:
>>  Call drm_mode_config_helper_suspend() and
>>  drm_mode_config_helper_resume() on suspend and resume, respectively.
>> =

>>  This makes sure that the display stack is properly disabled when the
>>  hardware is put to sleep.
>> =

>>  Signed-off-by: Paul Cercueil <paul@crapouillou.net>
> =

> As discussed on irc, with resume fixed to return the result of the
> drm_mode_config_helper_resume() call.
> =

> Reviewed-by: Sam Ravnborg <sam@ravnborg.org>

Applied with the fix, thanks.

Cheers,
-Paul


_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
