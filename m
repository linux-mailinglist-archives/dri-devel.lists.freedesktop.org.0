Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B694A4FE949
	for <lists+dri-devel@lfdr.de>; Tue, 12 Apr 2022 22:07:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 24EB710E2D9;
	Tue, 12 Apr 2022 20:07:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout.gmx.net (mout.gmx.net [212.227.15.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E3A0E10E2D9
 for <dri-devel@lists.freedesktop.org>; Tue, 12 Apr 2022 20:07:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1649794020;
 bh=IrspqYP8ymy9ueHzSGHCQmZBice+jhJrZO+S5bPpMWk=;
 h=X-UI-Sender-Class:Date:Subject:To:Cc:References:From:In-Reply-To;
 b=kxEQCw4copMgldWkQPVRswxuM9A47lhzo/+tKUY26Tla0Zo0xyws0zxTIZNyC7Ao9
 xF72hRMhOSfd2IymGO+yZ1fsMd+8ZMUc6cXDahbkn2L4HCnG074WBXZtF/HpbtUpgo
 b3Vl+DrBm4KVPGS7IwwS9kCMqUU0QJsgiYs+5xC8=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from [192.168.20.60] ([92.116.135.215]) by mail.gmx.net (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1M5fMe-1ncglq2Hak-007B7f; Tue, 12
 Apr 2022 22:07:00 +0200
Message-ID: <d90f37a3-e91a-c2a2-e349-5f835b048e5b@gmx.de>
Date: Tue, 12 Apr 2022 22:06:59 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH] video: fbdev-MMP: replace usage of found with dedicated
 list iterator variable
Content-Language: en-US
To: Jakob Koschel <jakobkoschel@gmail.com>
References: <20220331223503.902142-1-jakobkoschel@gmail.com>
From: Helge Deller <deller@gmx.de>
In-Reply-To: <20220331223503.902142-1-jakobkoschel@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:v3JE1ZICfMfPrsfvy8/eg3kgYv0qoPZEH4uA47/8+QfPmHfZC8F
 wuCWQdxmVwbOna7Nhk3SfJlsWB4Hrx7jlmLOstCstC04FFWEM+kq9gUooAqQO6LHsLXtK0X
 sNFkMEqV7A5+DltONIy/a2vCxkJ/HHMYane6dasVaYOz5ckKOdJnajhBWeUMhzpjVk3Hcgs
 EQCeR0mI9DgaAtz8MihpA==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:dSfPpBjVZ64=:ma4lt2nnKB6cQJPH1tOhsS
 UUA6LwysMiKBpk4suET90CSRWOJw4iJK+cT/VJq9In7QuyCij53A0jD4RFv005mAsZd8dJmyP
 O9fkRFLJB7qYvFCsviOEQ1PDFY35unPAjHcOsGay+9/h0hVhmE1IcvVQ+QcleHrx3E6lGvZcR
 Qz81wIutoIxqRXEPjR7+uoRPMrMzwXZ6Nhk2NMgZ5gh6xiVY0q/rycS+LhqyK5EPdaaXXa8/5
 0Qj7SKbfcFNJCniUa1sCcRQIhiYV0jGJcgkFKw4YDaO1IomNL+9SV+HNVu8/BA5ja8qmS9m1g
 eRTU/7TxodMcDx+QM4anjAYtGIFFlYoRqtNNGJq30jQWvhPNygEzrUx5HQDDgla4AOSxiV0pk
 91+Allo3F1OHGVFu9nKsbsa/uCoWGhIjr3G7xChp+z2JC8M74R9d/NTGxVvN/NfHGGHRjA8Pc
 AErphzvy7Jfd5UbovPmskiuQ8dS65v23eVJw4GYPl1I9Xw0vEdBRh4H4zjnIF7vV7FSN4Lhux
 o/9wkExI3IdEOhFo0ZhS3buNzXwsDYnZyviSS7APaqk32/2kC0BnH7kplpaosSwAJsQAcl/Pr
 9Y0G1cTwgptEEds8TdCIgCZcHsvLbRJ2hu8A12QBPhSrUq2G4CVn6C2vy0VIugf1IHweKY6vI
 MwN3rh5yrZvciZJblmpuKRR2yVJqCRzINIMunfFzFp27ZFLkGM+QkYrISju0kq+pOaUBook2X
 7EUDah45KVs4nFaY/lOiW2YAktpxvAsG9PqaibJenVySZszrNng+Uaj2YK3wINKdXusqrpKND
 uUqw2quQnRj7ftsN0JZ1/zosCwlIyYspb9vcxGwLrlt2ElfZQbZyNr5qT0pfkFoSrawXiXAs8
 lUdGzO7qI9lryxUIcf19mO1aKaDZraZT/uLXtZ6XcubE5RBWARQ/8UEBThOqDyepd6ePaDOsN
 YvAY62sYcb7GrN1Da3w1MCGj1p0YWA7Y5CmrSzM72AJaB+NFW13HJGlvJakXzig3zfje9Olgl
 p8vTIKiVETfLx4c/LIba0cSOUZJ2QJR3HvgMrZxsQVbcZCefPl1t08jwty64yjUFpKifZODwY
 z8m3cNNELsU3yY=
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
Cc: linux-fbdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org,
 Brian Johannesmeyer <bjohannesmeyer@gmail.com>,
 Cristiano Giuffrida <c.giuffrida@vu.nl>, "Bos, H.J." <h.j.bos@vu.nl>,
 Mike Rapoport <rppt@kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 4/1/22 00:35, Jakob Koschel wrote:
> To move the list iterator variable into the list_for_each_entry_*()
> macro in the future it should be avoided to use the list iterator
> variable after the loop body.
>
> To *never* use the list iterator variable after the loop it was
> concluded to use a separate iterator variable instead of a
> found boolean [1].
>
> This removes the need to use a found variable and simply checking if
> the variable was set, can determine if the break/goto was hit.
>
> Link: https://lore.kernel.org/all/CAHk-=3DwgRr_D8CB-D9Kg-c=3DEHreAsk5SqX=
Pwr9Y7k9sA6cWXJ6w@mail.gmail.com/ [1]
> Signed-off-by: Jakob Koschel <jakobkoschel@gmail.com>

applied.

Thanks!
Helge

> ---
>  drivers/video/fbdev/mmp/core.c | 11 +++++------
>  1 file changed, 5 insertions(+), 6 deletions(-)
>
> diff --git a/drivers/video/fbdev/mmp/core.c b/drivers/video/fbdev/mmp/co=
re.c
> index 154127256a2c..03707461eced 100644
> --- a/drivers/video/fbdev/mmp/core.c
> +++ b/drivers/video/fbdev/mmp/core.c
> @@ -127,19 +127,18 @@ EXPORT_SYMBOL_GPL(mmp_unregister_panel);
>   */
>  struct mmp_path *mmp_get_path(const char *name)
>  {
> -	struct mmp_path *path;
> -	int found =3D 0;
> +	struct mmp_path *path =3D NULL, *iter;
>
>  	mutex_lock(&disp_lock);
> -	list_for_each_entry(path, &path_list, node) {
> -		if (!strcmp(name, path->name)) {
> -			found =3D 1;
> +	list_for_each_entry(iter, &path_list, node) {
> +		if (!strcmp(name, iter->name)) {
> +			path =3D iter;
>  			break;
>  		}
>  	}
>  	mutex_unlock(&disp_lock);
>
> -	return found ? path : NULL;
> +	return path;
>  }
>  EXPORT_SYMBOL_GPL(mmp_get_path);
>
>
> base-commit: f82da161ea75dc4db21b2499e4b1facd36dab275

