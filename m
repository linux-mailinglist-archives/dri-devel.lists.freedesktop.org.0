Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5663DA4FE5D
	for <lists+dri-devel@lfdr.de>; Wed,  5 Mar 2025 13:15:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6AB2F10E253;
	Wed,  5 Mar 2025 12:15:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=web.de header.i=markus.elfring@web.de header.b="qVwJPx/y";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout.web.de (mout.web.de [217.72.192.78])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5597B10E253
 for <dri-devel@lists.freedesktop.org>; Wed,  5 Mar 2025 12:14:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=web.de;
 s=s29768273; t=1741176875; x=1741781675; i=markus.elfring@web.de;
 bh=vN9RsOM9w1Ta2OcodrGTCSnu8bj52DWvF1ogcLjUyJM=;
 h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
 References:From:In-Reply-To:Content-Type:
 Content-Transfer-Encoding:cc:content-transfer-encoding:
 content-type:date:from:message-id:mime-version:reply-to:subject:
 to;
 b=qVwJPx/y4WCQsTW5x9jGetYyVflxE8dsDy1VFIlVZCLlNM2xXX/BSXqg/LwMt3Cy
 nxwR0GtcxRhljx5e/DmXH4ErVg5D4LzqfbYp4dVQGlqdaG49x2hQH0IIgzkpEKPbN
 0ucGZqbExRMcMxdvEdoFCSrB4Z+MvthP0C+WVk0QS3xAwqqS6RbpA9BuPDagJhpvo
 srIKnZV3HX1XsFqpMEJwZRWLC+1HpDxPbgF8HUXbia4ISXOZ55shnxUSqYJVxATZK
 5jwoCDVvOO3lJSiQsPx5r/ab1WOIIRvjqFvW/sP3v88rgWnNsYYjBLEOa+yqc7U7R
 njq4LhSB6ZMWWcobdA==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from [192.168.178.29] ([94.31.70.10]) by smtp.web.de (mrweb105
 [213.165.67.124]) with ESMTPSA (Nemesis) id 1MNOQy-1tauUT2X3i-00Q3r9; Wed, 05
 Mar 2025 13:14:35 +0100
Message-ID: <9d042e6a-6d93-4ae4-8373-28b9dec21867@web.de>
Date: Wed, 5 Mar 2025 13:14:34 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: video: au1100fb: Move a variable assignment behind a null pointer
 check in au1100fb_setmode()
To: Dan Carpenter <dan.carpenter@linaro.org>,
 =?UTF-8?Q?Uwe_Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>,
 kernel-janitors@vger.kernel.org, linux-fbdev@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Cc: Antonino Daplas <adaplas@pol.net>, Helge Deller <deller@gmx.de>,
 Thomas Zimmermann <tzimmermann@suse.de>, Yihao Han <hanyihao@vivo.com>,
 cocci@inria.fr, LKML <linux-kernel@vger.kernel.org>
References: <40c60719-4bfe-b1a4-ead7-724b84637f55@web.de>
 <1a11455f-ab57-dce0-1677-6beb8492a257@web.de>
 <86551e6f-d529-1ff6-6ce6-b9669d10e6cb@web.de>
 <3f1e7aaa-501a-44f1-8122-28e9efa0a33c@web.de>
 <ugymllbkcsg22ffgyofvkquh5afbvoyv2nna5udmy3xfhv2rjz@jhgghzldzm4u>
 <eebf8c0c-7a6a-405f-aaab-2a8a8c2bd91f@stanley.mountain>
 <hwk2nf62owdo3olxrwt5tu7nwfpjkrr3yawizfpb3xn6ydeekx@xwz7nh5ece2c>
 <47c37d1a-5740-4f48-ac0f-635d8b6f51b2@stanley.mountain>
Content-Language: en-GB
From: Markus Elfring <Markus.Elfring@web.de>
In-Reply-To: <47c37d1a-5740-4f48-ac0f-635d8b6f51b2@stanley.mountain>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:xz927XuN+dy2MzwEWFmWxNyf3scK2QK3WwvGUP6+iFc0rGUk62+
 4cBG06YgVkrsQSP7oz2GxkjorzrbEe/+yD99qrKbbrN6r4/IGiNzM2c5QFhdv+Ly1HpAoFV
 o8rtyc4teA7X4Je6sy9ECjv9ObROXAcJv55ghu0oB33hD2tbtVundyy1MzNHWooMwFEFZu5
 CmnGqxkaNfAKVHRpzUZuw==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:Oy7sG1MKKpI=;JNu2zC9KnC1wTlorr60/eeRODji
 Twvn6Tjrl4ER+r2013vtqMYFWVlvLZXzO0mFQHQfyjI9f6lVP6Gkb0dLwr61wUah9a+fRo6KF
 CQH9f+WuwktSsLCezC9KSIWt74cIqVMecpXzmTKQwf/HAspIHRV67TvuuE8jN0uZbKAeej/+z
 k4vozN3jP6fBUz+KgntPvDueV642U0/djQnAPKVUxRPWpMHdK+iS4L72u9HelQbvCxPZGduYS
 DMiJm+a4CIayWj6kwQEhCWadgxOZdll4RinYa27znlaEcYEZhNvl8oOC1V5Q517Jw/bKLphRd
 +iT9jjowUhXdNe1gpaW9LU7bqar9wue49Ds9Sw5OKluJ/tYI9SaYKU81NHmY3gTNw9Hii6wyM
 uHWLZezEF7LLauwnwW2fiDGMbOZVs7AWkXI3eKgEzUmjPQiMFoFGMAxrJ8LgonMePMEFcvimL
 BMD1Lr5JU76qouQy+9tvXN0+36/YUfuV64mBzT/9eSXhTyovsnKWwkLKZ7pLlVM8xO7W7eWMP
 SZAe5k1CjHH1KvCkOa0aq+P3inEo8GOAYh6Z6KbdKIL5UAu+CIMV7Qt/cjMhfYY0rvttdZtn8
 yeTlgCEntMkGug43gsgV88lWouf3iUhKA+wZssgGAqT5yiVhkgtslUVpE7PtNRTnXuRv0g0rM
 9UH6blSj67Wgh20slE8jaiZ4ozl3VWHwsEZTWyk3c8W+8gFvHwEmjdNMgVFcTPUtPuz3tu057
 +5tw+5H9JRqiXJeakXtbLCJz3opmeQUVgrMz+z+rsnf3jcHsob+HvlJaED1oQJWmRIHPrtldJ
 fQpHfNld4/1kM768BP6JxshhNTUuzTyH26YvOsq3JACnjh18PIJ3hgJokME8yKdO0uy0ydRDZ
 iedtvaJbEHRvGO0k/ga/jzyvKYLF3VOi8U1jhdFHNW47e6v7MCZriGhwXBDKYDs2q7diyist2
 DaP2oQT7wTnUjfbVM6sS4dLuwe5c85UEGEIfAUkaqb5OeDfiaKN/jjtvEsDqUSdSdm2i67jrZ
 emCa0gwpvqExfAQCAGwzEcI/vKhxwRHKW9wITHzXDovhJ1afLYCrKJL/gY/F0qwXpUeL06uCp
 jBRSfztoSNVtpM/ZxewybtJ+BJLELgDrcoVKEUc6s0Gh+sG2kOQVGIGrJpBhvS7i71OkoSwmm
 w2Mj2QTs7Y0r+eeSgAG3z5gU0ADZ4FK1GtsYOfYPsq+l0JbdSGB3V7YX46ohLp/iZ/Wmc5yjC
 ioOqMs9hXgm54NBaTOhHJLsdfQv47MIeeggCLQhAksjnD+cdktcyyuxsihlgQojf5WVDA8t8p
 9y3ySv28w/BgaIcb3Lk9AjaaOS2WfPOPncDshEqdi8aGl0mkGlMEZPOQt89zDDKoem1d8pPmw
 hha8NFd33dxZva4qDJ89SwxdbrRz7LCZ4GNmUvBeVUoCbjzMLtw2VdQRPcstdxL6r7GtUoSLr
 t4QRoLg==
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

> Anyway, none of that applies here, because this is just pointer math.
Which data processing do you expect to be generally supported at the discu=
ssed
source code place (according to the rules of the programming language =E2=
=80=9CC=E2=80=9D)?
https://en.cppreference.com/w/c/language/behavior

Regards,
Markus
