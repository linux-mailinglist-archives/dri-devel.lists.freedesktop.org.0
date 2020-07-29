Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 174E52319ED
	for <lists+dri-devel@lfdr.de>; Wed, 29 Jul 2020 08:59:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3A59C6E454;
	Wed, 29 Jul 2020 06:59:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from crapouillou.net (crapouillou.net [89.234.176.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7E7B66E34E
 for <dri-devel@lists.freedesktop.org>; Wed, 29 Jul 2020 00:28:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=crapouillou.net;
 s=mail; t=1595982490; h=from:from:sender:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=D7K8xJ2GrVdOEj3CqIL5oCfQGtlYpiueUM/D6mIsibQ=;
 b=EfEwEftYNWn0vlIz9rfuvRDfyKMPGKP7oR0wBEcDXrAmrEdzvrVAdNIOGeHn6Ii6kJ+qJG
 0aJX0ayayjpLoklQNZqW07om2Xd9xB7HaGoGCK/kzo2PBrjG+Spq3tSXkBZgGm3DOXkFOb
 D0J1yqvb7y92aVeZ20BvlA+IgDPgF0k=
Date: Wed, 29 Jul 2020 02:28:01 +0200
From: Paul Cercueil <paul@crapouillou.net>
Subject: Re: [PATCH 0/2] Small cleanups to ingenic-drm driver
To: daniel@ffwll.ch
Message-Id: <PYF7EQ.CC652MXUV2R41@crapouillou.net>
In-Reply-To: <20200728220008.GI6419@phenom.ffwll.local>
References: <20200728151641.26124-1-paul@crapouillou.net>
 <20200728201736.GA1277651@ravnborg.org>
 <20200728220008.GI6419@phenom.ffwll.local>
MIME-Version: 1.0
X-Mailman-Approved-At: Wed, 29 Jul 2020 06:58:35 +0000
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
Cc: David Airlie <airlied@linux.ie>, od@zcrc.me, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="iso-8859-1"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



Le mer. 29 juil. 2020 =E0 0:00, daniel@ffwll.ch a =E9crit :
> On Tue, Jul 28, 2020 at 10:17:36PM +0200, Sam Ravnborg wrote:
>>  Hi Paul.
>> =

>>  On Tue, Jul 28, 2020 at 05:16:39PM +0200, Paul Cercueil wrote:
>>  > Here are a few cleanups to the ingenic-drm driver.
>>  > - some error paths were missing and have been added;
>>  > - the mode validation has been moved to the .mode_valid helper =

>> callback.
>>  >
>>  > Cheers,
>>  > -Paul
>>  >
>>  > Paul Cercueil (2):
>>  >   drm/ingenic: Handle errors of drm_atomic_get_plane_state
>>  >   drm/ingenic: Validate mode in a .mode_valid callback
>> =

>>  Both looks fine, you can add my:
>>  Reviewed-by: Sam Ravnborg <sam@ravnborg.org>
>> =

>>  I assume you will apply the patches.
>>  Maybe wait for Daniel to take a look, he had some feedback on where
>>  to add checks. I assume this is covered by the second patch.
> =

> Yeah changelog for new versions would be great, but aside from that
> bickering patch 2 lgtm now.

This patchset is V1, I'm fixing issues you saw in the ingenic-drm =

driver when reviewing a different patchset.

Thanks for the review, I'll apply now.

-Paul
> =



_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
