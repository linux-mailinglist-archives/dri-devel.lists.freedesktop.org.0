Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6DEE0605761
	for <lists+dri-devel@lfdr.de>; Thu, 20 Oct 2022 08:35:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 15BB010E069;
	Thu, 20 Oct 2022 06:35:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout.gmx.net (mout.gmx.net [212.227.17.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D3D0A10E069
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Oct 2022 06:35:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1666247695;
 bh=vKBOYiiDYu+sfV4JLD93t9oJLcn4956Rbkypp34tJU4=;
 h=X-UI-Sender-Class:Date:Subject:To:Cc:References:From:In-Reply-To;
 b=MjAytoTji6RK32KGrWSd40phvZu23VqTiVuhwxXvdJqYtbW0htWzvO4CXzfiHoMky
 A/ni2xBEBeMEsSTweanADPfVkdN13tQwPiDbxROK2OPt4EU/RzmHfpQmahbAjIYImt
 XDwyzKYJvgzBxLYaxJRiWOX7fsPmiyn0iiAVTpEA=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from [192.168.20.60] ([92.116.164.193]) by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MxUnp-1p0snG0UI5-00xvrF; Thu, 20
 Oct 2022 08:34:55 +0200
Message-ID: <991619f0-516e-bda4-57c5-93cab654d261@gmx.de>
Date: Thu, 20 Oct 2022 08:34:54 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.1
Subject: Re: [PATCH] video: fix repeated words in comments
To: Jilin Yuan <yuanjilin@cdjrlc.com>, thomas@winischhofer.net
References: <20221019125738.54964-1-yuanjilin@cdjrlc.com>
Content-Language: en-US
From: Helge Deller <deller@gmx.de>
In-Reply-To: <20221019125738.54964-1-yuanjilin@cdjrlc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:yuRjDwfr/9QcRKvx5rcMWrZ8MJ9vPAeABZBDX5+WmQ30KtjheYZ
 qkdF9nlstcFghYJ1JFqDHyN9PEVuDVT4UwpDSVMIY1mPOWQ4nwgKai03PeHQsbWXC1Dhfr1
 kHGGLgbLPcVekFebdjRKKLyNv3eYS57MoJeAHzZ7dnrztm8D+zbES5TZmVX0RdnN1XF7kPV
 qGL79GpJco6UB37x+ICmQ==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:IBnwqRaSojc=:28fjBE6I6nlc9bB3Kce5MZ
 m5ANxO1Yt0peIkQBcMPUipNYJJlXIC4nvekJlBSNrxs9EITMV3L+AYvWRP9XV9M1npfOUCs7k
 MbHFZUtO3gGrjS2pXGpsPy20qWTnRizxhUDq1KuTrzaYZtTxqHMVh26ZVhfT/gubtGqoj0208
 2R02mlMoJAPn54/FE3UwEwGxiFwDuT7TWDcZIKXoEI/OktOhLuCH+c/ioz3swrMCbgeAAGcs0
 I0URm3wPf/dhOQ7bLnKUREoeCiafjZV0PNsRJrOeL8NUJEVDOKQcX6al7tTZWLFCOffVVBgbV
 /usBTGZVusb22ol2vhXxRgcNfJ1ka3A3/22wIChWmXPBd8gFrDa9wo9MncW46V0isf0FnQgD8
 yTZM1ad2AM9tdKYakq3uw/sOLxEePAAsT7DgMc6aKSnQ6g8U+zK/uO6IcABXoPP5vQM52/JnW
 XW3+m6QfX/4LJL8SwZCNf/8TYoO/rmjnDXDntBjPHPJb6dykOR0AoQP121FTkKHwzg8Y2Kd2U
 Gt7R+uOL+Xc+okk3wYYqaVAjGuhhMEGMbfwDnaJ0UqG+zBiMHXOPkma3M1nIOT+OWk35P17jy
 hnzmd53xiEjs3EmO94YPn4XN27zbGd/mPQ9ppATwuqL4wmR9ih8lUSOgTg6Xt5WH41JYbspze
 h3qC/AkwAmZZNLIqYa3IT2GsaudDooiE+j0YZKaYUOXaLHL7aHvSrFtrLc7bMy+A92AeEFt+i
 IS97FRaBf5cimVKsOZJgvjDgcePwEXN+f5O47oHVg9Dk50aa0+uz2dhiUvyejIcepA6bALfQT
 Yh5ZfpS/x/fVM1A8CnPG2A8wRJLqUzc4FFS0Hn6/tMwCHhkyeI/riLIFjMdVd/Dr2d92g5wfQ
 pUyNQ+LOOi0MpH6OuUNc2mDQxVJRSsInV8EHZyW7zVeP+/SYuq8m9MKASUCfYwS+NYebmIqDq
 vrCHHmKaajYpY5H9WofaSjwSSycH3PDtSIS63UeJc2M9QYZ35Gz0VqRe2y8IV8xd/w6a7jL9t
 DILSGuRlaJXuY/RfTpgZ5NevVq38eNksnu2MnqoB/QWESVZXpaZdYgPMLLva9ivJO0ZRs4JJm
 Whr2ODxK5ZZWoXAmCybFL8B660h4qaKQhETSxaFm0awcide6yuH7HiBpYLwSVTrv3QVgHaNxz
 vhZlcZH0mKEOCTMzDA8mO/alpG2JMDNM0Rb5RXEKQZMU2A9PQBInnJoiWdE3wL2A2feZqxgS6
 X9wu7X+RQe7vnFa5epLOjFED1eZhXZeFN82xvw23jnSFeqEzG1tzSiEjajYXLZYB4w6NR3Y1A
 pkiJJdCDRpnak2eXF90H277ygsaYvd/jBAW9AtwI87W1i8/1Mg49Q3zIUCRD7tMHQ/MB26nzB
 RCKwJo+zPHF8PxwAPMAuFHlTYSY36UPlep4UAR4hqjzwlK9b9kMxdnA1EEMDr3o5QelGYBxxA
 Gn11s+ab3lpiLuMhSiU/hjEIhBDuh3IteXtGfsu3yKV95HnCPkP4BTFxaUH1tC8eIzQ6XQpUU
 dC6CLTboaiFIYuAKh20VTFHi3n4OthvsdEVUxJ8Mpwaze
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
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 10/19/22 14:57, Jilin Yuan wrote:
> Delete the redundant word 'the'.
>
> Signed-off-by: Jilin Yuan <yuanjilin@cdjrlc.com>

applied.
Thanks!

Helge


> ---
>   drivers/video/fbdev/sis/sis_accel.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/video/fbdev/sis/sis_accel.c b/drivers/video/fbdev/s=
is/sis_accel.c
> index 1914ab5a5a91..5850e4325f07 100644
> --- a/drivers/video/fbdev/sis/sis_accel.c
> +++ b/drivers/video/fbdev/sis/sis_accel.c
> @@ -202,7 +202,7 @@ SiS310SubsequentScreenToScreenCopy(struct sis_video_=
info *ivideo, int src_x, int
>   	 * and destination blitting areas overlap and
>   	 * adapt the bitmap addresses synchronously
>   	 * if the coordinates exceed the valid range.
> -	 * The the areas do not overlap, we do our
> +	 * The areas do not overlap, we do our
>   	 * normal check.
>   	 */
>   	if((mymax - mymin) < height) {

