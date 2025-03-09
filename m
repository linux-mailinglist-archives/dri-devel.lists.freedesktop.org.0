Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D56B2A587E4
	for <lists+dri-devel@lfdr.de>; Sun,  9 Mar 2025 20:43:16 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C336110E25F;
	Sun,  9 Mar 2025 19:43:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=gmx.de header.i=deller@gmx.de header.b="mKgPp9dG";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout.gmx.net (mout.gmx.net [212.227.17.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A67A310E1B4
 for <dri-devel@lists.freedesktop.org>; Sun,  9 Mar 2025 19:43:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
 s=s31663417; t=1741549369; x=1742154169; i=deller@gmx.de;
 bh=UXfwqVzh+kdj7oJHScsByow/u5h/HWf/HAGnPCLphFA=;
 h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
 References:From:In-Reply-To:Content-Type:
 Content-Transfer-Encoding:cc:content-transfer-encoding:
 content-type:date:from:message-id:mime-version:reply-to:subject:
 to;
 b=mKgPp9dG6o+AJZwafbyHJko/eb1JBUdOORDnr+vSEaNEqE3dAGm7j9UHUAZ2QMcJ
 9eiSKKxacIT/qvKXDioGVxis3yvdNSE9cznDBlf3rfdD0p+FO5waYbjXwNDfx8krD
 JdIg93ISTh580tLzOsh4lYlOXzYOFA6CVV2kK2/WB2h5UmnHgq8FuOzLftgC3xvGw
 7WP7IvR1zN3JyQM4nHHIpaSJipLGSIn2Pq4aKMX42FzgEVEoUww1di3B2sbVGrU62
 mWRICciiLXaewFcaFrrcrpJdCOHvITh5WTpuyHk6KZoeds8fpuYl93skHadhoc+uf
 pq0ovPH2OnszM1166Q==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.20.173] ([109.250.63.121]) by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1M26vB-1tosVM1SyP-000pZq; Sun, 09
 Mar 2025 20:42:49 +0100
Message-ID: <0a15e04f-bd6d-4c2b-a8e1-708880fa433c@gmx.de>
Date: Sun, 9 Mar 2025 20:42:46 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] fbdev: fsl-diu-fb: add missing device_remove_file()
To: Shixiong Ou <oushixiong1025@163.com>, Timur Tabi <timur@kernel.org>
Cc: linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Shixiong Ou <oushixiong@kylinos.cn>
References: <20250309081607.27784-1-oushixiong1025@163.com>
Content-Language: en-US
From: Helge Deller <deller@gmx.de>
Autocrypt: addr=deller@gmx.de; keydata=
 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
In-Reply-To: <20250309081607.27784-1-oushixiong1025@163.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:D7fGuBp8cJ0wUshZgQSWt3vgrCfTuK0biq/pBNWOOGrfpZm/G3n
 RrcTFpInKIQPaCExlvV1tWXTUblBMoSymbEtAR+5jSDqYKMIAMwwuNrDQQ410P55wJcBITo
 /3CK2UA6/gtWDrAccfYR2nBpcssbJWBdQB/t9PyXqIul7OGs6AXWUoYGbTtWk9wHe2/3jNy
 na6P+oU/rkJL191ZrAj3g==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:ccEv3COVVx4=;f+7gJ6DQA02p/CKE1MxM2wvtsGC
 zhptwHZ169f7ub6f1Rl6SHfpin/CSw/LrekG4NKCz4l93iu7mAB1tXjqh8Oms/7zQOsU9aeD0
 a/Q9T/K5PXZjY4WV65JrpxeqSkF/DpccjvtjP1l7mONw4/bIsesyhmRPy4PjUlT8/g5z66tSu
 WouJlddlde7wfk9umDkdO3sYyp/uZk/R8OxpbZxpiOJlKPSE1uymGpXf3bs3RmaAV//SXbxme
 eqy4OAwILAloOZO7QqpeG3/Hp0gArKz+Lm5ssjj5dBZWPJODM+v33GIOs4hdjfnr9gY6blDQv
 J2ceGcEqgYUj++KK8Xh+nJCF/GrKFeyTalf5MY6x7dnGuOpTMXKLdydFu8pGX87fbuTTim9MW
 CGFFIzwGKctEExMLFtPnnVUlNGUXK1ZaCM7m01qwZ+8CTtu6HRjNbrDib5uomWnXaXekHeiXO
 NBebKAMDaNTXWw4Op/sP6FmiRGLaXLiaHQOkkEvMR1l8uHfYc9k/r0Mk+Ods+TF6tooblGURh
 KlTqN9lS6eVwW+tlqE6V5sOehVhAXFRx/kiGeXvqqNEjyYW3f65dJ9Ls9gJ3FgCM7tk5ZrrSu
 kLD+INx1xLm/rsLwJVvOtvBL0/AKGE2zGXcxuFcwCFc2EBuTuj5U5ZvlBH3pML/CRA57GK3vb
 7qogNHal5rnyIzG/Jj6K7Psq+xO9en6qrf6CtH2LPdUr+uKIvz3h7wcGIddYXwkr3CcZWRtHg
 Z9brWYehqaVXSq+oj1MWbELHm7Gh1YM59Rz8tT3thwkwyAfW/b+/o+YdNefvG6VTmkPWJ23Ow
 wMKAHjmIFKspYtd4QjbhY3TRTvyNrZqDVOBV/dY2HKAcckNHni7z5R3wDAzthjSPkzig1gJ6R
 e33bPqnog6j9ZG7Dc6ogLlkB+R9/X8CGuNw2a7ZZfyHhpKWUqm2SiJ+ljOReAcKlSIOV/cLi6
 0JXsuLso5gWQaxNi+lPQekrJc+flRiHHv3VpOeo6zc6Gp1uP3biBRurI2AjkjvOusxjlZa+w+
 pSbUnJXDG5JMNQ3VUwUKixxN3mT6bBTnJpwwUycuzeP66YoL5J9vp2ZDXIrvjcxHxbmVjdiK/
 yEVfUJvtJqML+Lms/Zatfro3fWLDTgDhhurgQO1p7a7jeVbKlr/hQ1Lis3LJ2vAJDg7wc3kU6
 k+N5UW1UdOF3jeimULti12zXWKhfO14BJVrQ+GioPFlW6U1kgWbeJsczIX3B2AQi2k5buJX5z
 +9V2sV9JZPU7CbQGdIAgBVem0FWkCmfoOMzVDuvlyglB3bFXbTfaILko/D57PGtxp4zqq0jXD
 /N31PijMtPXNbpWS41yX5hKhq1Q6xuJv4Jn+larPqv5Ic2EyHWcBSKIFMlIGTNgNY5Bj/UnWN
 0NCd76k6lhCzQ260gAYaHdBbyeFyRtTtT38rMdiNBr/WJK+d9pUgLSlv36
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

On 3/9/25 09:16, Shixiong Ou wrote:
> From: Shixiong Ou <oushixiong@kylinos.cn>
>
> Call device_remove_file() when driver remove.
>
> Signed-off-by: Shixiong Ou <oushixiong@kylinos.cn>
> ---
> v1->v2:
> 	add has_sysfs_attrs flag.
>
>   drivers/video/fbdev/fsl-diu-fb.c | 6 ++++++
>   1 file changed, 6 insertions(+)
>
> diff --git a/drivers/video/fbdev/fsl-diu-fb.c b/drivers/video/fbdev/fsl-=
diu-fb.c
> index 5ac8201c3533..57f7fe6a4c76 100644
> --- a/drivers/video/fbdev/fsl-diu-fb.c
> +++ b/drivers/video/fbdev/fsl-diu-fb.c
> @@ -384,6 +384,7 @@ struct fsl_diu_data {
>   	__le16 next_cursor[MAX_CURS * MAX_CURS] __aligned(32);
>   	uint8_t edid_data[EDID_LENGTH];
>   	bool has_edid;
> +	bool has_dev_attr;
>   } __aligned(32);
>
>   /* Determine the DMA address of a member of the fsl_diu_data structure=
 */
> @@ -1809,6 +1810,7 @@ static int fsl_diu_probe(struct platform_device *p=
dev)
>   			data->dev_attr.attr.name);
>   	}
>
> +	data->has_dev_attr =3D true;
>   	dev_set_drvdata(&pdev->dev, data);
>   	return 0;
>
> @@ -1827,6 +1829,10 @@ static void fsl_diu_remove(struct platform_device=
 *pdev)
>   	int i;
>
>   	data =3D dev_get_drvdata(&pdev->dev);
> +
> +	if (data->has_dev_attr)

Looking at other drivers (e.g. drivers/net/can/usb/esd_usb.c) it seems
that device_remove_file() is ok even if it's not fully initialized...

I think you can drop those extra checks.

Helge


> +		device_remove_file(&pdev->dev, &data->dev_attr);
> +
>   	disable_lcdc(&data->fsl_diu_info[0]);
>
>   	free_irq(data->irq, data->diu_reg);

