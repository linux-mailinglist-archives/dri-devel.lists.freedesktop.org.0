Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id EBE9LuH2pmmgawAAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Tue, 03 Mar 2026 15:57:37 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 731291F1E22
	for <lists+dri-devel@lfdr.de>; Tue, 03 Mar 2026 15:57:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0050D10E82A;
	Tue,  3 Mar 2026 14:57:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=gmx.de header.i=deller@gmx.de header.b="pm2XfXon";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout.gmx.net (mout.gmx.net [212.227.17.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2CCF310E829
 for <dri-devel@lists.freedesktop.org>; Tue,  3 Mar 2026 14:57:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
 s=s31663417; t=1772549839; x=1773154639; i=deller@gmx.de;
 bh=Vw/jv/r/uMKMknHhvM67zIUGhvNNB/ewziz6oXAzbLo=;
 h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
 References:From:In-Reply-To:Content-Type:
 Content-Transfer-Encoding:cc:content-transfer-encoding:
 content-type:date:from:message-id:mime-version:reply-to:subject:
 to;
 b=pm2XfXon1Q1wt8s7U86i/tPBuba5kUEPwvXpdYrzWsxec4C6tFZD/Myr//KSjBS7
 pdKS3LibxEpVZWzjXAiZrFApQ3i4ss1IsHyLzVAor/GGNvr47uthj1coqBa/018ng
 R5L6YgpBoQI1dZ0tA69f8CfdugSdJiv7lRJC+oEyJhAYN+djmEfxHTkqE/2TrhGBK
 WHQyLcJnCFeOXlIQixW+2LjHb6mtG6ZIIGyib/PpXEfZ+sUXbno0S2Y9fSpAVao6e
 thMZ3f9no/TOeJ93DO3sLjdwT0OJN51vQe+6ctcHIU5TtpEKqy/UofxXBYPjDVp14
 x9689PZgfbOvKWJRYQ==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from client.hidden.invalid by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MxUrx-1vmUyc2BJZ-013NUH; Tue, 03
 Mar 2026 15:57:19 +0100
Message-ID: <b0a688dc-c613-4cb0-9858-56d8720487c2@gmx.de>
Date: Tue, 3 Mar 2026 15:57:18 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 07/13] lib/fonts: Store font data as font_data_t;
 update consoles
To: Thomas Zimmermann <tzimmermann@suse.de>, gregkh@linuxfoundation.org,
 sam@ravnborg.org
Cc: linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
References: <20260302141255.518657-1-tzimmermann@suse.de>
 <20260302141255.518657-8-tzimmermann@suse.de>
Content-Language: en-US
From: Helge Deller <deller@gmx.de>
Autocrypt: addr=deller@gmx.de; keydata=
 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
In-Reply-To: <20260302141255.518657-8-tzimmermann@suse.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:ZBgVXoL5ZMzaTxa57+jQsJDrKa4xfQpxaJX0FQhFRCkZM9NoJdv
 ufkliwgxk6S3bLxd15yrCOXCytjMONmMr4JNZMrCz/vXi9oETMZKhDBloSo+vW/TaQ9lXdw
 SVPLquht+3kmG/xbDHr0pi2JdemmYIIYEScqMGZgvAUDTw3p27kfzAuRAOBdPebrMIBkJmq
 HqQQoj5wssJnZugOuujQg==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:ZDAnJQr9aRc=;e4/ZCd4HLfEJ26s6MZ2pusAuan2
 mFWzsm6QpkE24RW8gj7c1mGnXm4LNP7mnXsg23ijuivxt8JLeyTgA2D/C9H6ogeoAGB14UgCs
 TW+NBH2RKCtIuwSZSvRFlfYdpT3lgd8ezEDjzao9krYSxBS0rRMg6G2UjqD39SivFRbn5rKn1
 SnbA4f5H9h5ZVRn8G//9OHNJZhXIGhagM6EFuhVsRZKjmqzBazSWH2wKOKkVWeFXXlG3oRPW3
 BlwdP/x+5p7MFvXB394p//g9SOZKAYoAoOffjRdY+P2asHrRGEWM1iJY9Qq/qD/Emexq9haPG
 +iXZttr+zFCCShEheLau9l+2jBK94H//ArnF08U4gMoSzmT0dnaFmuMVgXialtig8xUpH1uqv
 Sq5RTL1wf3apyxm7v+aPDNuwkpMuZJWYsJlCZN/N+157NyGynKixH1xEhPCFBb/GkExYZ4f1F
 RsgBDSR1/uwy/BQuGzjgnnbuuZGd32dVWwCclI+X/kFtv5EWGCJCNErJ3gq/Rl+cnxYhIQxlo
 rzMwxAwzOh166fJ/6Pal7CBx1u4X961QCokb9b3MLSPVJIo8dqtF2KM/joMVrDzrdukSZl/9v
 khAlyuqLODYxHSnt5m+YMdaZyUTN1l2R+20VAoCx6RkWN9B6NbTjMwCDHyXTgDzlwyftzT667
 cpe8FmvFoeGSw3ekchEDdg1/i7xBB8pfgO+jgcnJa2hgbf8yXn0wQCRkvdYpB8iO+4++Kgyxp
 msQbkQIC/D4Kl5LJoPF3B+YVdtXVz23yhG9FSAuRFS+w3hWGlf2ssTx9X3p1EdB8Q7uM1pN9f
 ecxUffWFR7+sC6hZJUDX6m5uzKN2RBb+3GKjc/z2mWFts+uXU6ea5d/y2rC2yfCjHCJakImVM
 urCQY9nG9uSFEj+SvDwIfealNFv6wJfIoxfS193n10meAivxbhFovakfJPH3avQbZOv+y4yHW
 +w/3oRCaERfmmZ/ABFMm0yu1MiRjjPaWrW2fQO7yZiAIEMYU4no9xFT3pK3h5teo/OB6Ok5KA
 mzJPed47lVQHX1hRld9QTNvrzDhUVNdO6G1UiBcQEdkFRPaNLlBZDhXqJV64DgxQzwNDswTwd
 GWCROxi+9wlpKfE/xyQ2/03rC2xpijUcaIQM372jz7D4vr1iE8uquH41HARYJFVc9bsHZXEpM
 sPnsKF1SKWtO9ljSwTxbM4XqQpG4XKcMkDdGS4WwePF2LqU03E0XCDVzNbu2DEZvrLq/WNY4c
 CiNH2yEGVAgs6EuXvg1JiV7sqDqfvavkjEFJi3wadUM564Z+Zj7RumwjXIxvKO+bIEq0J31lm
 lCkicI7L7YLu5BmBcpTffUO5WJS0cmuStniH1lBy7RR8NGvWD91wbhs69yoaONGez50JSgLl1
 P2wtfGPnjb/qwKe4hsIxi6vMVSLwnPWGIjeBqIx0KttKfMiI9ARAAlHUt7XAvCPP5E+JtqJao
 TITTltUcJLVWYhUoE2T8+UEp3idPOqtTRdBK8MUbxXPSUrFI2YNYlHeoeqlXCB5QdmeQAlsBl
 MSG/G8cYMnKMaV5D+osLDh34DBrlA2V7jC9sVqu4QvDrasFhWVaJ98OPqJCRJBNuixV0EdS/m
 wGsSIw6hw91vLU9Ls6zwweYn6SoPAKBn4LlvvyaFQ87bQp4dU1FIKd3ThfocYKpVESomxFA7v
 GdN8k8A2HL36oA+0tUpwnXowU7agyfhP7bgjUv4qpBln5u4mpdJctaBZ66AiyS0mtupT4grOZ
 KRXwp/sVNTRr4zPJ1n0lzZa3kLLyEsQ7clFQbKhXYHs8StbXDcB1YdC3d2NlZ3yZlB9BzP3Zn
 zWIdxj2WVsVGvlBhM3qAUwea2hu3utbIS/OWFAyGOun6tno1pNjsZ9ZBsjc74CTjjXeuQa1RM
 EgIzwJeIH/aCc22PyIdqEMYyj6Vh1P/eGnHAru/70ZWIlB2WrwEwMsTytJCmcYNIJ+YpwjNj/
 D/6D0Q5PgTCkS40+Xz4775sCv8GO+JCFP/hu2e8gedk2/yvsKO3a9H0EtMhswwqFrvtO7Zza6
 XUqAPQ/+Jm48jaa2A33SjqaolcAlRZ6aG9N2Y0jWdvPl4FDMA/lmNxmLEqXe7/mcHeEcNi+cu
 hGrAoUMWGU5zfIPGtAUNA/QnMqzOX3LdSvko+DIKJYKCMk8VD71fmnyea/U8V7/rUKDW/gddT
 Wy7snbLETvaElBsvynKBtiOU05asvo2Bm6WRkuMztOfkfyAN1oTgymEhpjkhRj99y+vDHuFxq
 AMZrkzOY9VPZ/EjaAHfVEisVjrBtxbJ0vdSlEfAyyEzSJXkTwN1ZV/zmrETbk8i1+gmvt/RRn
 M8+L6Tc9RxUGH5iRvyG0K5PsjfdCV1j65LVtqEPFQXEGRMkrruKRADGkd26X+9raFv1XZR0TR
 3eEyjCYwuSYnCfbVcDqSAtGM2TDVHq2FyB0IvBAK/i5Ik0BWbT+k6vax8VKzfH082gP1f6IKC
 N5gSwPkf4QIvMbfcje7WgOe7t0F8zpeoQFe+eDChIt+Ylbr6G7soCj+StlbRPjMN3Fhp4njG7
 4H+VVNr5MkEHu9SAEjLvgvD1s7xewflZIdzbsN3xNqzf3zGhznS787BKCznyeVuFrpZK69Py4
 sBjZyORAGQQdeWJiZb6tL1EHSBCLKMsKKYKHXw15NDsiJJokQnHt+X+4P8GGzPhMhti/3OD7b
 u84U5swa5mj4rlGB8NH/FBhjHDVWqxN0BTUVeqXrSoeh3HFqMOCKzQ8ndhp99FhREPb0Wfi6c
 zOPENtSWsBLPeVbXIPkBBvZfwG7gIdUdC4rwaIbm04wfK9ur2y3A/pEEis2C278vcBEpE1SSu
 YfoPkGbW0t9B8kGy7JzoIkXnPtYTuILgjjms/eI/UKUnptNRM7DRfB1PHby1B7RAOzfD6P9zE
 XVWGYH1n0UXFnsCDgz+mSu21P4aHQ6XuVyyxdud2onrhigtEmFq33d69Oh96d+BbAZF6hMsuM
 NL5b/kLmcljHS6BqegjnD9Ujh9EItjBvxoH/hZzAfw37DPeapTvwp6H+CA71eHHfMPCRbVc1e
 xdQCKO2+t7N31OCswvSEcwe0bH52+xYLgKqSh0phhpxzLpKo/GXR6JsKWoBnvI4wIM9mSJfZL
 L6nExoozhDvjTIUbBLMk48OIfg8+vIeiHrf4gU7BZurf1nx3o1JjL4kdhozOIJiShIlZ/F1Q3
 PuvXYLY4wQvgAFtuNm9va/+L5gVQHg/Zj6RTa3o8E46anJaF04U3h3jlaIjadNSmOtxB0Y7je
 axF0DM+kqrJh33S72fXrbfeMWnYnSnakFSsanjD3H9ALxpDNNHrQx2XMdGkvI1fgcEovOfaj0
 LENMfuCtUXFmSmjnFuYOulEHBuUqzCBIDjWvugsv3kd4iGpRJkhyJY3RLEuyQPjcW3ip9xFUM
 sSx1OBZKznH9tT2RRciNr51t5YDj3vQg37471wXKRBMTv0h262CunaHAoU4T/OuFd4toBywhL
 eI94gG0kBmmFRzwnF2Xl8SmFCuvipYM8+PLZ4VqMwPB4MxcmREI07byvImieozS5mZSjco9W/
 Hpw1Nxs0AKFTT9dFoVnJrdEAFUjdDz2mNfhcYqXLT8b3owcUFevAuGG2e/cCFXTgcFFZxXILA
 Dg1BWJFtnjN8n5QjB22dv0uLuYnToaIdBqyaTsuX6aGrEFzXemRp5KymP+jzBUP+WYKf5w2B/
 OqY2EPKRIvU19f1JMI90Tetkir992Yj84siunDIGFjkoO6R84BagpvtxSm9LPz3k++Fpz485Z
 uXFflPZN8Fb35nRh7cjhNU2vfJqYYN1vcgpoXROHXFaRHy/yn9kWrs6lXI2iF40WQZROSeJxC
 6C5760d1FjdY59TQ8vDi+sM70qr3p37FVW7ZeIWNf74yzVmZUStwxGJwtaCuJ623ghiE7jMvh
 0hazrgJqpP9i2tLdWWn3zH7JkBhy3lIbSHOYElZojO4h55KCgS7sD/ivqMbNxGpsWAjJ0vCJl
 /lcatUXhRDaGjBsDoIeyn/9H7tbjUo1RbEXtWulHynhsfYtmd7Bo3QzuBfaWXedE4EucM4ksE
 ocq5527Mpw4fcaut27gJXYnNz49WJMlUiTMgotFTbNBOiAxjM75KU/SB1ssjPZFcF8Ppxp5ai
 IXIKXPIW4TrlCHMiiV9v8nVz3ZeP/u74731QnCdBuVyXNqCPYWFbhy+0XHD8AmEPpWyI+zgBI
 X2dZSP/7nf66xLZtF/783mmRdvb1qV1sqNA2Y+LxCNsOnjWut5Xei71eKyRvQfHvRYFkFX9T+
 n1ycpsHk3BZBRe6Y2UexjSarMbXkNY7ygEjTMkau9IdnibXVhfZ9VA/8RPegrVjP2lEwMJ2pX
 74eBgzs1wgDZ8OGQHyqLVAseiXtrePc/w8TVNOTfuH0/HamfGz/eLgjud60yuAJTw92di0Lma
 CNWduwNDnLZKJz6Thwx567X4f3sCkdSFmPRsNAY/TWqUjDY0P/1Im89Eb0rkstaGkxp4i1fp1
 NMAtvv6COM2cV2zS7sslAtUZ6HjNNNzoTlg7scMspBjpg3ArGu1pJyLs0zcSLlo721HePtu87
 +KutcX12iky0nnh3iTYVJKYvLU+U5UsmULo1znWyt6RbYWE7Lvuvrw35rjH2nWjyDzchagNHD
 3/2meh3VQLtvVdYlbzxLnDrJaxxvl9U/BGfWk0bGPBuENCmLK51erBmo0h4/MmWFDAzC0DCMN
 dvOU8I5q7b3T3Zmy91OaVWdeRS2y/OMJNrhxJQ/DSFtBGG6+l+pBTBzJJ29qwNWF57p8CRXka
 PzC6ed5Uitbo5riaa2PMiybH2qmG52rGavxcer4in2HAgyBuQX3DWjBTOEXm/n6lJNC6QY/2O
 hcNh0AD1FztACB6TW7GFDRKOKRikAo807QRTN9fcmeuPROAzW6SiD0jaWY9A52xnTyS+nvMkP
 cdpuyC5DzB6qIpZVUU1vrmlxaZmKWvO95+ap8N8ITIiupks+gWZ/sqZB1yFj+gpy9aM6aR6rA
 LYKzgsxBkVeZBMW3NEIM4QfD1TYwosXIZTDszSPLLHfUD0HFeGfMz8Q52Kex9XtCOd5HajwUp
 nCAhaQU6tUFWWrnp6csQp3dObbSsA8y5mYIcTMmOgnQmixKJQ3Qq+6Rf+bN0cowCSCckwkiEK
 u4ii+1VMxUQHgjf4p32enD8AxraDviZam1oDFF/HCQEwpOISrSkBCOmopLBlf6bkA5gq0H9SK
 5fAKuimwsJBhE9u4qCgjb+xZfmU4Qlc7y86fVU97nMH8GY1UlzIBjXxF/gyUz7yzBR6TB8WQ=
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
X-Rspamd-Queue-Id: 731291F1E22
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.31 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[gmx.de,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[gmx.de:s=s31663417];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[3];
	FORGED_RECIPIENTS(0.00)[m:tzimmermann@suse.de,m:gregkh@linuxfoundation.org,m:sam@ravnborg.org,m:linux-fbdev@vger.kernel.org,m:linux-kernel@vger.kernel.org,s:lists@lfdr.de];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[deller@gmx.de,dri-devel-bounces@lists.freedesktop.org];
	FREEMAIL_FROM(0.00)[gmx.de];
	TO_DN_SOME(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[gmx.de:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[deller@gmx.de,dri-devel-bounces@lists.freedesktop.org];
	RCPT_COUNT_FIVE(0.00)[6];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:email,font_vga_8x16.data:url,vc_font.data:url,gmx.de:dkim,gmx.de:mid,gabe.freedesktop.org:rdns,gabe.freedesktop.org:helo]
X-Rspamd-Action: no action

On 3/2/26 15:08, Thomas Zimmermann wrote:
> Store font data as pointer to font_data_t instead of unsigned char.
> Update consoles.
>=20
> Pointers to font data refer to the raw data. There is a hidden header
> before the data that contains additional state. Document the existing
> layout and semantics of font_data_t.
>=20
> The data field in struct vc_font can be used by any console. Therefore
> it still points to plain data without the additional header. Fbcon sets
> its value from struct fbcon_display.fontdata. Hence, update the size
> test in fbcon_resize() to use struct fbcon_display.fontdata instead of
> struct vc_font.data.
>=20
> v2:
> - 'Font lookup' -> 'Font description' in <linux/font.h>
>=20
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> ---
>   drivers/video/console/newport_con.c | 17 ++++++-----
>   drivers/video/fbdev/core/fbcon.c    | 44 ++++++++++++++++-----------
>   drivers/video/fbdev/core/fbcon.h    |  3 +-
>   include/linux/font.h                | 47 ++++++++++++++++++++++++++++-
>   4 files changed, 84 insertions(+), 27 deletions(-)
>=20
> diff --git a/drivers/video/console/newport_con.c b/drivers/video/console=
/newport_con.c
> index e2922caa8685..9b9ed1940404 100644
> --- a/drivers/video/console/newport_con.c
> +++ b/drivers/video/console/newport_con.c
> @@ -33,9 +33,9 @@
>  =20
>   #define NEWPORT_LEN	0x10000
>  =20
> -#define FONT_DATA ((unsigned char *)font_vga_8x16.data)
> +#define FONT_DATA font_vga_8x16.data
>  =20
> -static unsigned char *font_data[MAX_NR_CONSOLES];
> +static font_data_t *font_data[MAX_NR_CONSOLES];
>  =20
>   static struct newport_regs *npregs;
>   static unsigned long newport_addr;
> @@ -370,9 +370,9 @@ static void newport_clear(struct vc_data *vc, unsign=
ed int sy, unsigned int sx,
>   static void newport_putc(struct vc_data *vc, u16 charattr, unsigned in=
t ypos,
>   			 unsigned int xpos)
>   {
> -	unsigned char *p;
> +	const unsigned char *p;
>  =20
> -	p =3D &font_data[vc->vc_num][(charattr & 0xff) << 4];
> +	p =3D &font_data_buf(font_data[vc->vc_num])[(charattr & 0xff) << 4];
>   	charattr =3D (charattr >> 8) & 0xff;
>   	xpos <<=3D 3;
>   	ypos <<=3D 4;
> @@ -400,7 +400,7 @@ static void newport_putcs(struct vc_data *vc, const =
u16 *s,
>   			  unsigned int count, unsigned int ypos,
>   			  unsigned int xpos)
>   {
> -	unsigned char *p;
> +	const unsigned char *p;
>   	unsigned int i;
>   	u16 charattr;
>  =20
> @@ -424,7 +424,7 @@ static void newport_putcs(struct vc_data *vc, const =
u16 *s,
>   				 NPORT_DMODE0_L32);
>  =20
>   	for (i =3D 0; i < count; i++, xpos +=3D 8) {
> -		p =3D &font_data[vc->vc_num][(scr_readw(s++) & 0xff) << 4];
> +		p =3D &font_data_buf(font_data[vc->vc_num])[(scr_readw(s++) & 0xff) <=
< 4];
>  =20
>   		newport_wait(npregs);
>  =20
> @@ -503,7 +503,8 @@ static int newport_set_font(int unit, const struct c=
onsole_font *op,
>   	int h =3D op->height;
>   	int size =3D h * op->charcount;
>   	int i;
> -	unsigned char *new_data, *data =3D op->data, *p;
> +	font_data_t *new_data;
> +	unsigned char *data =3D op->data, *p;
>  =20
>   	/* ladis: when I grow up, there will be a day... and more sizes will
>   	 * be supported ;-) */
> @@ -519,7 +520,7 @@ static int newport_set_font(int unit, const struct c=
onsole_font *op,
>   	REFCOUNT(new_data) =3D 0;	/* usage counter */
>   	FNTSUM(new_data) =3D 0;
>  =20
> -	p =3D new_data;
> +	p =3D (unsigned char *)font_data_buf(new_data);
>   	for (i =3D 0; i < op->charcount; i++) {
>   		memcpy(p, data, h);
>   		data +=3D 32;
> diff --git a/drivers/video/fbdev/core/fbcon.c b/drivers/video/fbdev/core=
/fbcon.c
> index 103e91c8d874..8d7840b9ebad 100644
> --- a/drivers/video/fbdev/core/fbcon.c
> +++ b/drivers/video/fbdev/core/fbcon.c
> @@ -1019,8 +1019,10 @@ static const char *fbcon_startup(void)
>   						info->pixmap.blit_y);
>   		vc->vc_font.width =3D font->width;
>   		vc->vc_font.height =3D font->height;
> -		vc->vc_font.data =3D (void *)(p->fontdata =3D font->data);
> +		vc->vc_font.data =3D font_data_buf(font->data);
>   		vc->vc_font.charcount =3D font->charcount;
> +
> +		p->fontdata =3D font->data;
>   	}
>  =20
>   	cols =3D FBCON_SWAP(par->rotate, info->var.xres, info->var.yres);
> @@ -1078,11 +1080,12 @@ static void fbcon_init(struct vc_data *vc, bool =
init)
>   		if (t->fontdata) {
>   			struct vc_data *fvc =3D vc_cons[fg_console].d;
>  =20
> -			vc->vc_font.data =3D (void *)(p->fontdata =3D
> -						    fvc->vc_font.data);
> +			vc->vc_font.data =3D fvc->vc_font.data;
>   			vc->vc_font.width =3D fvc->vc_font.width;
>   			vc->vc_font.height =3D fvc->vc_font.height;
>   			vc->vc_font.charcount =3D fvc->vc_font.charcount;
> +
> +			p->fontdata =3D t->fontdata;
>   			p->userfont =3D t->userfont;
>  =20
>   			if (p->userfont)
> @@ -1097,8 +1100,10 @@ static void fbcon_init(struct vc_data *vc, bool i=
nit)
>   							info->pixmap.blit_y);
>   			vc->vc_font.width =3D font->width;
>   			vc->vc_font.height =3D font->height;
> -			vc->vc_font.data =3D (void *)(p->fontdata =3D font->data);
> +			vc->vc_font.data =3D font_data_buf(font->data);
>   			vc->vc_font.charcount =3D font->charcount;
> +
> +			p->fontdata =3D font->data;
>   		}
>   	}
>  =20
> @@ -1409,11 +1414,12 @@ static void fbcon_set_disp(struct fb_info *info,=
 struct fb_var_screeninfo *var,
>   	svc =3D *default_mode;
>   	t =3D &fb_display[svc->vc_num];
>  =20
> -	if (!vc->vc_font.data) {
> -		vc->vc_font.data =3D (void *)(p->fontdata =3D t->fontdata);
> +	if (!p->fontdata) {
> +		vc->vc_font.data =3D font_data_buf(t->fontdata);
>   		vc->vc_font.width =3D (*default_mode)->vc_font.width;
>   		vc->vc_font.height =3D (*default_mode)->vc_font.height;
>   		vc->vc_font.charcount =3D (*default_mode)->vc_font.charcount;
> +		p->fontdata =3D t->fontdata;
>   		p->userfont =3D t->userfont;
>   		if (p->userfont)
>   			REFCOUNT(p->fontdata)++;
> @@ -2047,7 +2053,7 @@ static int fbcon_resize(struct vc_data *vc, unsign=
ed int width,
>   	struct fb_var_screeninfo var =3D info->var;
>   	int x_diff, y_diff, virt_w, virt_h, virt_fw, virt_fh;
>  =20
> -	if (p->userfont && FNTSIZE(vc->vc_font.data)) {
> +	if (p->userfont && FNTSIZE(p->fontdata)) {
>   		unsigned int size =3D vc_font_size(&vc->vc_font);
>  =20
>   		/*
> @@ -2057,7 +2063,7 @@ static int fbcon_resize(struct vc_data *vc, unsign=
ed int width,
>   		 * charcount can change and cannot be used to determine the
>   		 * font data allocated size.
>   		 */
> -		if (!size || size > FNTSIZE(vc->vc_font.data))
> +		if (!size || size > FNTSIZE(p->fontdata))
>   			return -EINVAL;
>   	}
>  =20
> @@ -2281,7 +2287,8 @@ static bool fbcon_blank(struct vc_data *vc, enum v=
esa_blank_mode blank,
>  =20
>   static int fbcon_get_font(struct vc_data *vc, struct console_font *fon=
t, unsigned int vpitch)
>   {
> -	const u8 *fontdata =3D vc->vc_font.data;
> +	struct fbcon_display *p =3D &fb_display[vc->vc_num];
> +	font_data_t *fontdata =3D p->fontdata;
>   	u8 *data =3D font->data;
>   	int i, j;
>  =20
> @@ -2406,16 +2413,18 @@ static void set_vc_hi_font(struct vc_data *vc, b=
ool set)
>   }
>  =20
>   static int fbcon_do_set_font(struct vc_data *vc, int w, int h, int cha=
rcount,
> -			     const u8 * data, int userfont)
> +			     font_data_t *data, int userfont)
>   {
>   	struct fb_info *info =3D fbcon_info_from_console(vc->vc_num);
>   	struct fbcon_par *par =3D info->fbcon_par;
>   	struct fbcon_display *p =3D &fb_display[vc->vc_num];
>   	int resize, ret, old_userfont, old_width, old_height, old_charcount;
> +	font_data_t *old_fontdata =3D p->fontdata;
>   	const u8 *old_data =3D vc->vc_font.data;
>  =20
>   	resize =3D (w !=3D vc->vc_font.width) || (h !=3D vc->vc_font.height);
> -	vc->vc_font.data =3D (void *)(p->fontdata =3D data);
> +	p->fontdata =3D data;
> +	vc->vc_font.data =3D font_data_buf(p->fontdata);
>   	old_userfont =3D p->userfont;
>   	if ((p->userfont =3D userfont))
>   		REFCOUNT(data)++;
> @@ -2448,12 +2457,12 @@ static int fbcon_do_set_font(struct vc_data *vc,=
 int w, int h, int charcount,
>   		update_screen(vc);
>   	}
>  =20
> -	if (old_userfont && (--REFCOUNT(old_data) =3D=3D 0))
> -		kfree(old_data - FONT_EXTRA_WORDS * sizeof(int));
> +	if (old_userfont && (--REFCOUNT(old_fontdata) =3D=3D 0))
> +		kfree(old_fontdata - FONT_EXTRA_WORDS * sizeof(int));
>   	return 0;
>  =20
>   err_out:
> -	p->fontdata =3D old_data;
> +	p->fontdata =3D old_fontdata;
>   	vc->vc_font.data =3D old_data;
>  =20
>   	if (userfont) {
> @@ -2483,7 +2492,8 @@ static int fbcon_set_font(struct vc_data *vc, cons=
t struct console_font *font,
>   	int h =3D font->height;
>   	int size, alloc_size;
>   	int i, csum;
> -	u8 *new_data, *data =3D font->data;
> +	font_data_t *new_data;
> +	u8 *data =3D font->data;
>   	int pitch =3D PITCH(font->width);
>  =20
>   	/* Is there a reason why fbconsole couldn't handle any charcount >256=
?
> @@ -2522,13 +2532,13 @@ static int fbcon_set_font(struct vc_data *vc, co=
nst struct console_font *font,
>   	if (!new_data)
>   		return -ENOMEM;
>  =20
> -	memset(new_data, 0, FONT_EXTRA_WORDS * sizeof(int));
> +	memset((u8 *)new_data, 0, FONT_EXTRA_WORDS * sizeof(int));
>  =20
>   	new_data +=3D FONT_EXTRA_WORDS * sizeof(int);
>   	FNTSIZE(new_data) =3D size;
>   	REFCOUNT(new_data) =3D 0;	/* usage counter */
>   	for (i=3D0; i< charcount; i++) {
> -		memcpy(new_data + i*h*pitch, data +  i*vpitch*pitch, h*pitch);
> +		memcpy((u8 *)new_data + i * h * pitch, data + i * vpitch * pitch, h *=
 pitch);
>   	}
>  =20
>   	/* Since linux has a nice crc32 function use it for counting font
> diff --git a/drivers/video/fbdev/core/fbcon.h b/drivers/video/fbdev/core=
/fbcon.h
> index 3f4386a40237..d26ee7860cf5 100644
> --- a/drivers/video/fbdev/core/fbcon.h
> +++ b/drivers/video/fbdev/core/fbcon.h
> @@ -11,6 +11,7 @@
>   #ifndef _VIDEO_FBCON_H
>   #define _VIDEO_FBCON_H
>  =20
> +#include <linux/font.h>
>   #include <linux/types.h>
>   #include <linux/vt_buffer.h>
>   #include <linux/vt_kern.h>
> @@ -25,7 +26,7 @@
>  =20
>   struct fbcon_display {
>       /* Filled in by the low-level console driver */
> -    const u_char *fontdata;
> +    font_data_t *fontdata;
>       int userfont;                   /* !=3D 0 if fontdata kmalloc()ed =
*/
>   #ifdef CONFIG_FRAMEBUFFER_CONSOLE_LEGACY_ACCELERATION
>       u_short scrollmode;             /* Scroll Method, use fb_scrollmod=
e() */
> diff --git a/include/linux/font.h b/include/linux/font.h
> index d929c5fa32ca..f19abd112c18 100644
> --- a/include/linux/font.h
> +++ b/include/linux/font.h
> @@ -13,12 +13,57 @@
>  =20
>   #include <linux/types.h>
>  =20
> +/*
> + * font_data_t and helpers
> + */
> +
> +/**
> + * font_data_t - Raw font data
> + *
> + * Values of type font_data_t store a pointer to raw font data. The for=
mat
> + * is monochrome. Each bit sets a pixel of a stored glyph. Font data do=
es
> + * not store geometry information for the individual glyphs. Users of t=
he
> + * font have to store glyph size, pitch and characer count separately.
> + *
> + * Font data in font_data_t is not equivalent to raw u8. Each pointer s=
tores
> + * an additional hidden header before the fotn data. The layout is

typo: fotn -> font


>   struct font_desc {
>       int idx;
>       const char *name;
>       unsigned int width, height;
>       unsigned int charcount;

FYI - maybe type of width, height, charcount would need update here if it'=
s
changed as I proposed in the other patch?

Helge
