Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DFDBA70952E
	for <lists+dri-devel@lfdr.de>; Fri, 19 May 2023 12:38:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9A6EA10E0A9;
	Fri, 19 May 2023 10:38:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout.gmx.net (mout.gmx.net [212.227.15.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0E70110E080
 for <dri-devel@lists.freedesktop.org>; Fri, 19 May 2023 10:38:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.de; s=s31663417;
 t=1684492696; i=deller@gmx.de;
 bh=ms3RDIelSxdWVnz+v+z9XPddozX1qPFluv8VIGAgkDE=;
 h=X-UI-Sender-Class:Date:Subject:To:Cc:References:From:In-Reply-To;
 b=T02R7bIGOTjrA0+bwrttwkuIhtYTzk0tJZNRAXFCIz+zOaqee8vviwJSA95WJs7qc
 xNxYASFkiRIf8V6K1R439W0HsdShTw4Tt3L7JgQ5/gCSro9OfW1rS7KCykCXmhudt2
 by3Q/pwiHvN/faSpC0j6lT8pOSRG11vi7rIT0XD6U/QjZmKH6CRKS7xzowreF9KG3y
 2PvYYHR/DOS3pqT7La7ok4tNegNa3iRduGEwQPewcF93UeM3eiLPQrXjp1HxY+DPNb
 X3OqUUPmyOtUajxkkhJeIFDyW9hVBu0iwx9S3hKzXPLGHAgcf7HMlLWPsRC4LOj52E
 cLOWRHqKIRA5w==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.20.60] ([94.134.152.232]) by mail.gmx.net (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1N0XCw-1qKuey0oT6-00wT8I; Fri, 19
 May 2023 12:38:16 +0200
Message-ID: <6e93305a-2d70-d411-3e36-c536449295dd@gmx.de>
Date: Fri, 19 May 2023 12:38:15 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [syzbot] [fbdev?] [usb?] WARNING in
 dlfb_submit_urb/usb_submit_urb (2)
Content-Language: en-US
To: Alan Stern <stern@rowland.harvard.edu>
References: <0000000000004a222005fbf00461@google.com> <ZGXVANMhn5j/jObU@ls3530>
 <4cd17511-2b60-4c37-baf3-c477cf6d1761@rowland.harvard.edu>
 <be824fbc-cde4-9a2a-8fb4-1ca23f498dca@gmx.de>
 <2905a85f-4a3b-4a4f-b8fb-a4d037d6c591@rowland.harvard.edu>
 <ZGZ3JPLqxCxA2UB6@ls3530>
 <c7b8e69a-cabe-4e17-a511-66179259d1d7@rowland.harvard.edu>
From: Helge Deller <deller@gmx.de>
In-Reply-To: <c7b8e69a-cabe-4e17-a511-66179259d1d7@rowland.harvard.edu>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:ZXXu5QJebCOL1y2vAej2hv25kqaBHNpllfPqeQk61VVfGfN0uxj
 rDbNuPXhmZwoO8Bh77jibdYml7o85GpkNC7HYIrxf/4FEbTPQVnh1opEZf98chq3X+aR6ev
 LkejgSggZvP+FjMllSTwWbL8ZouKcGtCaN/sWsDCnzz/Yp1NXMqrBrpSPVwidXHKOHdCBiS
 8+iqe/D/ZWJug/U5YVTNQ==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:uqAs2hR1cdI=;axiGn9AtPsyxX55BDtk41QN+dea
 aio/2fcCaOf+DcmhcJkyiQ7+En7Aq3W1TAU2aqDa/wrP+J+JpisZwaqQdi44sstBvclOwdbi2
 zb4vKVdGG15AZktv2D1hv2Zw/ouNMD71FMYhyUsXXrMta409xPlNvaE0pIN5npEfnB01rkhmL
 4ixo1Gcz0242fgSwcj7KQlGEMr/TBnWdlDc9H57rAfK6jFEy+IiHa9yDUtySZ2LvyP8VyywRu
 dFsiMAgapHiKB90cPBTXUPVJboVMnr11qtHxmb6Ku7NZk1pYbExcMUOG5BvY6U481sruYSZDJ
 WBOiRRA5MJtcNmahBpSOnzZePkABldMJ8LPBVhl7RX1Zwn/LKRqy+pdKs+Qevivjz3d8hqpsG
 nj1PlPXZLT09NEuUks9eCGhVJEHciuszQL+NJ5h9E0IL1l6j8ceYby2XnS48YTp2MNlr99GnH
 zcx9WFG9cu5OAv5PvHggwg+1YnktKRvyKAbOwQFsgSSBE6gqh8wPAnaFZiu1ltII9QPKskHqn
 Nb7Rf4Wm22JRCEb5w/FP77CmvrEKAkUmXdAmM5YXwhPtAZbK2XcUoy83WNKTbNv+nwDUpYnvY
 42Zw/A4aGCw75ea2kNfVN8XvSuvKhh72SxwGvFI4e2bs6QEl7G8U93JRqXzIywyMpyne/kjxs
 QoSXyNK8RMwxQWdv626drSD3A5pGfyvsS29i9MxoKRhhszX1bANb58P4WsrI+YZoxXVHx/inU
 Zu6YB6LVTKZstsPyC6F0eTUtKiolPMwXqjpLhZN2DQ4HQWNa5tKJ31x/gVUSmQTRr7ge+mI76
 y66ip4z5emYhIaJ7iVKkxPuKd59KfjzYM1sZTEmu0AP0fjZi5baPCC+ciNQJjZEdTAEw+88R/
 bpMsCjIv5pKW0IbkcX7obAGJz7WOds8IG8Os1lSVsZNG3yyLI+PYFcDna6uBtPXW6fBFCrDo+
 ioeVbg==
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
Cc: linux-fbdev@vger.kernel.org,
 syzbot <syzbot+0e22d63dcebb802b9bc8@syzkaller.appspotmail.com>,
 linux-usb@vger.kernel.org, syzkaller-bugs@googlegroups.com,
 bernie@plugable.com, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 5/18/23 22:35, Alan Stern wrote:
> On Thu, May 18, 2023 at 09:06:12PM +0200, Helge Deller wrote:
>> * Alan Stern <stern@rowland.harvard.edu>:
>>> On Thu, May 18, 2023 at 04:16:33PM +0200, Helge Deller wrote:
>>>> On 5/18/23 15:54, Alan Stern wrote:
>>>>> In this case it looks like dlfb_usb_probe() or one of the routines i=
t
>>>>> calls is wrong; it assumes that an endpoint has the expected type
>>>>> without checking.  More precisely, it thinks an endpoint is BULK whe=
n
>>>>> actually it is INTERRUPT.  That's what needs to be fixed.
>>>>
>>>> Maybe usb_submit_urb() should return an error so that drivers can
>>>> react on it, instead of adding the same kind of checks to all drivers=
?
>>>
>>> Feel free to submit a patch doing this.
>>
>> As you wrote above, this may break other drivers too, so I'd leave that
>> discussion & decision to the USB maintainers (like you).
>>
>>> But the checks should be added
>>> in any case; without them the drivers are simply wrong.
>>
>> I pushed the hackish patch below through the syz tests which gives this=
 log:
>> (see https://syzkaller.appspot.com/text?tag=3DCrashLog&x=3D160b75092800=
00)
>> [   77.559566][    T9] usb 1-1: Unable to get valid EDID from device/di=
splay
>> [   77.587021][    T9] WARNING: BOGUS urb xfer, pipe 3 !=3D type 1 (fix=
 driver to choose correct endpoint)
>> [   77.596448][    T9] usb 1-1: dlfb_urb_completion - nonzero write bul=
k status received: -115
>> [   77.605308][    T9] usb 1-1: submit urb error: -22
>> [   77.613225][    T9] udlfb: probe of 1-1:0.52 failed with error -22
>>
>> So, basically there is no urgent fix needed for the dlfb fbdev driver,
>> as it will gracefully fail as is (which is correct).
>>
>> What do you suggest we should do with this syzkaller-bug ?
>> I'd rate it as false-alarm, but it will continue to complain because of
>> the dev_WARN() in urb.c
>
> Let's try this patch instead.  It might contain a stupid error because I
> haven't even tried to compile it, but it ought to fix the real problem.

Patch looks good and survived the test.

Will you send a proper patch to the fbdev mailing list, so that I can
include it?

Helge

>
> #syz test: https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.gi=
t a4422ff22142
>
> Index: usb-devel/drivers/video/fbdev/udlfb.c
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> --- usb-devel.orig/drivers/video/fbdev/udlfb.c
> +++ usb-devel/drivers/video/fbdev/udlfb.c
> @@ -1652,7 +1652,7 @@ static int dlfb_usb_probe(struct usb_int
>   	struct fb_info *info;
>   	int retval;
>   	struct usb_device *usbdev =3D interface_to_usbdev(intf);
> -	struct usb_endpoint_descriptor *out;
> +	static u8 out_ep[] =3D {1 + USB_DIR_OUT, 0};
>
>   	/* usb initialization */
>   	dlfb =3D kzalloc(sizeof(*dlfb), GFP_KERNEL);
> @@ -1666,9 +1666,9 @@ static int dlfb_usb_probe(struct usb_int
>   	dlfb->udev =3D usb_get_dev(usbdev);
>   	usb_set_intfdata(intf, dlfb);
>
> -	retval =3D usb_find_common_endpoints(intf->cur_altsetting, NULL, &out,=
 NULL, NULL);
> -	if (retval) {
> -		dev_err(&intf->dev, "Device should have at lease 1 bulk endpoint!\n")=
;
> +	if (!usb_check_bulk_endpoints(intf, out_ep)) {
> +		dev_err(&intf->dev, "Invalid DisplayLink device!\n");
> +		retval =3D -EINVAL;
>   		goto error;
>   	}
>

