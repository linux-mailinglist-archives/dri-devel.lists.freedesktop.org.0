Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 13A77175E89
	for <lists+dri-devel@lfdr.de>; Mon,  2 Mar 2020 16:42:50 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2F2FD6E516;
	Mon,  2 Mar 2020 15:42:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailout2.w1.samsung.com (mailout2.w1.samsung.com
 [210.118.77.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3D4DD6E516
 for <dri-devel@lists.freedesktop.org>; Mon,  2 Mar 2020 15:42:47 +0000 (UTC)
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
 by mailout2.w1.samsung.com (KnoxPortal) with ESMTP id
 20200302154246euoutp0233d503b26df4744cb12055772bac02f7~4hw6nCnZi1381413814euoutp02W
 for <dri-devel@lists.freedesktop.org>; Mon,  2 Mar 2020 15:42:46 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.w1.samsung.com
 20200302154246euoutp0233d503b26df4744cb12055772bac02f7~4hw6nCnZi1381413814euoutp02W
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1583163766;
 bh=vGWws7E3WLNj7XKDBC0zIxCfLImiZpsQGYppu7/x/Po=;
 h=From:Subject:To:Cc:Date:In-Reply-To:References:From;
 b=cYUXYZHHfzLCQEqJSDI+umnIhjVWJYA/POfbufP/2Y53Xsd55gVLlGfdcDpb9yboO
 ZvQikvcr+WYoGp8fK4H78kcLoCWRApP6wYhv/09pDIu6Vze8Q0tDUO6k3cYaXYwv12
 TBzrbqNaCWw+kM84uSOwxrye7ZlLOXJQNeD1jUXg=
Received: from eusmges2new.samsung.com (unknown [203.254.199.244]) by
 eucas1p1.samsung.com (KnoxPortal) with ESMTP id
 20200302154245eucas1p11aa3241ff2ed4f022f0eac400e74d479~4hw6h1Av31688016880eucas1p1U;
 Mon,  2 Mar 2020 15:42:45 +0000 (GMT)
Received: from eucas1p1.samsung.com ( [182.198.249.206]) by
 eusmges2new.samsung.com (EUCPMTA) with SMTP id CE.20.60679.5792D5E5; Mon,  2
 Mar 2020 15:42:45 +0000 (GMT)
Received: from eusmtrp1.samsung.com (unknown [182.198.249.138]) by
 eucas1p2.samsung.com (KnoxPortal) with ESMTPA id
 20200302154245eucas1p2e7d7d14b23b26d081c3754c4379e8e9d~4hw6KGsAz2400924009eucas1p2U;
 Mon,  2 Mar 2020 15:42:45 +0000 (GMT)
Received: from eusmgms2.samsung.com (unknown [182.198.249.180]) by
 eusmtrp1.samsung.com (KnoxPortal) with ESMTP id
 20200302154245eusmtrp120fb74551a4640d8b50cf35ec7ece730~4hw6JjdHO2922329223eusmtrp1w;
 Mon,  2 Mar 2020 15:42:45 +0000 (GMT)
X-AuditID: cbfec7f4-0e5ff7000001ed07-47-5e5d29752718
Received: from eusmtip1.samsung.com ( [203.254.199.221]) by
 eusmgms2.samsung.com (EUCPMTA) with SMTP id 89.00.07950.5792D5E5; Mon,  2
 Mar 2020 15:42:45 +0000 (GMT)
Received: from [106.120.51.71] (unknown [106.120.51.71]) by
 eusmtip1.samsung.com (KnoxPortal) with ESMTPA id
 20200302154245eusmtip118645d1efc09ad546c8976bdecfcc21d~4hw541ymk2008820088eusmtip1g;
 Mon,  2 Mar 2020 15:42:45 +0000 (GMT)
From: Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
Subject: Re: [PATCH] matroxfb: add Matrox MGA-G200eW board support
To: Rich Felker <dalias@libc.org>
Message-ID: <18f1f164-f1aa-af61-791e-217f847f2333@samsung.com>
Date: Mon, 2 Mar 2020 16:42:44 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20200125195506.GA16638@brightrain.aerifal.cx>
Content-Language: en-US
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrAKsWRmVeSWpSXmKPExsWy7djPc7qlmrFxBvO+mVss/PmL1eLK1/ds
 Fs2L17NZnOj7wGqxedNUZgdWj3OzP7B4vDt3jt1j/9w17B73u48zeXzeJBfAGsVlk5Kak1mW
 WqRvl8CV8apzJVvBfoGKdy/VGhg38XYxcnJICJhI7F16mLmLkYtDSGAFo8SzhfOYIJwvjBLL
 Pj9igXA+M0rs/LYKqIwDrGXezBSI+HJGiXcz21hBRgkJvGWUmHNJGMRmE7CSmNi+ihHEFhZw
 Apq6nx3EFhFQlOg9vQVsHbPAbEaJjut/mUASvAJ2Eg9ae8FsFgEViRnbF4ENFRWIkPj04DAr
 RI2gxMmZT1hAbE4Ba4knSyAWMAuIS9x6Mp8JwpaX2P52DtgCCYFl7BLX/65mhHjUReLH3s3s
 ELawxKvjW6BsGYnTk3tYIBrWMUr87XgB1b2dUWL55H9sEFXWEnfO/WID+Z9ZQFNi/S59iLCj
 xIKz35kgwcInceOtIMQRfBKTtk2HhhavREebEES1msSGZRvYYNZ27VzJPIFRaRaS12YheWcW
 kndmIexdwMiyilE8tbQ4Nz212CgvtVyvODG3uDQvXS85P3cTIzDdnP53/MsOxl1/kg4xCnAw
 KvHwBjDHxgmxJpYVV+YeYpTgYFYS4fXljI4T4k1JrKxKLcqPLyrNSS0+xCjNwaIkzmu86GWs
 kEB6YklqdmpqQWoRTJaJg1OqgVHj2tSdEyQcV4ax79Bhf2GXL7cj/+5qvUOqlYs4ziS5v917
 z1Hoe9v/PecaY354vjIIKt64MUzjxqVqVqaSVu6Wm0d35KmcuVR0KSJyjbHsmwNmc9hie3zj
 Zt79fDlJSfLYjJTjZdW1K668f6s9SZ+RWXSqXvw+w/lXjOq0I/+z5r2I1j+aUKzEUpyRaKjF
 XFScCABfZ/K8MwMAAA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrIIsWRmVeSWpSXmKPExsVy+t/xu7qlmrFxBk+myFss/PmL1eLK1/ds
 Fs2L17NZnOj7wGqxedNUZgdWj3OzP7B4vDt3jt1j/9w17B73u48zeXzeJBfAGqVnU5RfWpKq
 kJFfXGKrFG1oYaRnaGmhZ2RiqWdobB5rZWSqpG9nk5Kak1mWWqRvl6CX8apzJVvBfoGKdy/V
 Ghg38XYxcnBICJhIzJuZ0sXIxSEksJRRomF5GxNEXEbi+PqyLkZOIFNY4s+1LjaImteMEhv3
 /GYBSbAJWElMbF/FCGILCzhJPFu4nx3EFhFQlOg9vYUZxGYWmM0ocXy5CURzH6PEkntPWEES
 vAJ2Eg9ae5lAbBYBFYkZ2xeBxUUFIiQO75jFCFEjKHFy5hOwZZwC1hJPlkAsYxZQl/gz7xLU
 AnGJW0/mM0HY8hLb385hnsAoNAtJ+ywkLbOQtMxC0rKAkWUVo0hqaXFuem6xkV5xYm5xaV66
 XnJ+7iZGYHRtO/Zzyw7GrnfBhxgFOBiVeHh/MMTGCbEmlhVX5h5ilOBgVhLh9eWMjhPiTUms
 rEotyo8vKs1JLT7EaAr03ERmKdHkfGDk55XEG5oamltYGpobmxubWSiJ83YIHIwREkhPLEnN
 Tk0tSC2C6WPi4JRqYKx4sCY39c23ed/fP/l+5ubTrJ1ns1+/dkqe9NR1knPmC7E773kW8Jxb
 vM9q8VStXJvqVQIaXz7xzzwYnPe+Nl+jrLSPof3S5H37ilP5cj11z/nLta+fkrylO/rdhcMf
 P/SvM/q3oaIr/pzLgrx8z7x7lW1Tz8nnec1u2HOi7P9vDz7fM1qipdeVWIozEg21mIuKEwGq
 vEFrxAIAAA==
X-CMS-MailID: 20200302154245eucas1p2e7d7d14b23b26d081c3754c4379e8e9d
X-Msg-Generator: CA
X-RootMTR: 20200125195511eucas1p1d8326b54a4775038cb8b804078afcc19
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20200125195511eucas1p1d8326b54a4775038cb8b804078afcc19
References: <CGME20200125195511eucas1p1d8326b54a4775038cb8b804078afcc19@eucas1p1.samsung.com>
 <20200125195506.GA16638@brightrain.aerifal.cx>
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
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 linux-fbdev@vger.kernel.org, Thomas Gleixner <tglx@linutronix.de>,
 dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On 1/25/20 8:55 PM, Rich Felker wrote:
> Signed-off-by: Rich Felker <dalias@libc.org>

Patch queued for v5.7, thanks.

Best regards,
--
Bartlomiej Zolnierkiewicz
Samsung R&D Institute Poland
Samsung Electronics

> --
> I've had this lying around a while and figure I should send it
> upsteam; it's needed to support the onboard video on my Spectre-free
> Atom S1260 server board.
> 
> ---
>  drivers/video/fbdev/matrox/matroxfb_base.c | 15 +++++++++++++++
>  1 file changed, 15 insertions(+)
> 
> diff --git a/drivers/video/fbdev/matrox/matroxfb_base.c b/drivers/video/fbdev/matrox/matroxfb_base.c
> index 1a555f70923a..ff344313860c 100644
> --- a/drivers/video/fbdev/matrox/matroxfb_base.c
> +++ b/drivers/video/fbdev/matrox/matroxfb_base.c
> @@ -1376,6 +1376,12 @@ static struct video_board vbG200 = {
>  	.accelID = FB_ACCEL_MATROX_MGAG200,
>  	.lowlevel = &matrox_G100
>  };
> +static struct video_board vbG200eW = {
> +	.maxvram = 0x800000,
> +	.maxdisplayable = 0x800000,
> +	.accelID = FB_ACCEL_MATROX_MGAG200,
> +	.lowlevel = &matrox_G100
> +};
>  /* from doc it looks like that accelerator can draw only to low 16MB :-( Direct accesses & displaying are OK for
>     whole 32MB */
>  static struct video_board vbG400 = {
> @@ -1494,6 +1500,13 @@ static struct board {
>  		MGA_G200,
>  		&vbG200,
>  		"MGA-G200 (PCI)"},
> +	{PCI_VENDOR_ID_MATROX,	0x0532,	0xFF,
> +		0,			0,
> +		DEVF_G200,
> +		250000,
> +		MGA_G200,
> +		&vbG200eW,
> +		"MGA-G200eW (PCI)"},
>  	{PCI_VENDOR_ID_MATROX,	PCI_DEVICE_ID_MATROX_G200_AGP,	0xFF,
>  		PCI_SS_VENDOR_ID_MATROX,	PCI_SS_ID_MATROX_GENERIC,
>  		DEVF_G200,
> @@ -2136,6 +2149,8 @@ static const struct pci_device_id matroxfb_devices[] = {
>  		PCI_ANY_ID,	PCI_ANY_ID,	0, 0, 0},
>  	{PCI_VENDOR_ID_MATROX,	PCI_DEVICE_ID_MATROX_G200_PCI,
>  		PCI_ANY_ID,	PCI_ANY_ID,	0, 0, 0},
> +	{PCI_VENDOR_ID_MATROX,	0x0532,
> +		PCI_ANY_ID,	PCI_ANY_ID,	0, 0, 0},
>  	{PCI_VENDOR_ID_MATROX,	PCI_DEVICE_ID_MATROX_G200_AGP,
>  		PCI_ANY_ID,	PCI_ANY_ID,	0, 0, 0},
>  	{PCI_VENDOR_ID_MATROX,	PCI_DEVICE_ID_MATROX_G400,
> 
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
