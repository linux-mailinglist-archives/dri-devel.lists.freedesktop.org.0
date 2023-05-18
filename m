Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B576708830
	for <lists+dri-devel@lfdr.de>; Thu, 18 May 2023 21:06:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3E08A10E066;
	Thu, 18 May 2023 19:06:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout.gmx.net (mout.gmx.net [212.227.17.22])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B913210E066
 for <dri-devel@lists.freedesktop.org>; Thu, 18 May 2023 19:06:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.de; s=s31663417;
 t=1684436774; i=deller@gmx.de;
 bh=pBy6GELUpzGIiCShn/8+5zqDsJlsfeiFiD+3uO8JbY4=;
 h=X-UI-Sender-Class:Date:From:To:Cc:Subject:References:In-Reply-To;
 b=GW3ynz/DbLLzEQGUdqVylIi+hc3P+CxSdGHqGnRDPIU7MUlCu/VYRt2psVDzp7v3c
 EIknENG18my1GD9v4SzuuZnfDmmijFT4QR9k5SkfFqWEuWhpk9YR9xuo13dlDDKAVn
 Jx6V9JdZxNAhmhw6eL2zL/REpW3MT4D3dVbLraqoiqKDCqbursJ+/Tgi/6KiwNtgBv
 +Nw3c8FozrBE1ql2uybHnSzCHIBgEEb1PY4QBWFl1cbJCgbnuLDB7AdDjBkyrip8tC
 W3G8wJcIzwVwgcbHkWv0HHG756lTimjCJ8oJ2fUo+EbC/2xSubh+wvD296U4hlGT2x
 OllpUAsKCYchw==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from ls3530 ([94.134.154.30]) by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1N0XD2-1qKfeU2SEG-00wZAK; Thu, 18
 May 2023 21:06:14 +0200
Date: Thu, 18 May 2023 21:06:12 +0200
From: Helge Deller <deller@gmx.de>
To: Alan Stern <stern@rowland.harvard.edu>, linux-kernel@vger.kernel.org,
 linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org
Subject: Re: [syzbot] [fbdev?] [usb?] WARNING in
 dlfb_submit_urb/usb_submit_urb (2)
Message-ID: <ZGZ3JPLqxCxA2UB6@ls3530>
References: <0000000000004a222005fbf00461@google.com> <ZGXVANMhn5j/jObU@ls3530>
 <4cd17511-2b60-4c37-baf3-c477cf6d1761@rowland.harvard.edu>
 <be824fbc-cde4-9a2a-8fb4-1ca23f498dca@gmx.de>
 <2905a85f-4a3b-4a4f-b8fb-a4d037d6c591@rowland.harvard.edu>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2905a85f-4a3b-4a4f-b8fb-a4d037d6c591@rowland.harvard.edu>
X-Provags-ID: V03:K1:Q3nIu3LTT7sasw5uCAZngX5+JzZttsCCWf+9S/T/gP2tfMnOCUW
 BwpHjk/fKNMPjT4KWgBwNKfV0NExzypTNjj+eQqR5yhxduihabVfHEmzpPKMJD+9M7HP9bi
 24WyALeLnxpLreLUBFlgueLDTY8G6MG7pjNLF0t1Cgwx7NFBMxOsWY4xuVJL2WFELj3bQ4g
 DKf10N5q0OIoLLX8Fnnkw==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:y4zdltgRDIg=;hT62BpYCTxJ9wnrrSwFQrUxLRMP
 KNuz5bykn4UaZIUngZnebcjA296bIc/zRl5RwesJytwxfwDe+fjBddoN401UjPTQhKx8I4qSk
 /3ego8neUmYfVMvspZo4F2EgTnHpOjR4UA8SdcrFa/aLk/z31UfrYaFZobhFcPXbq00ZoovQc
 Sl48QUY8soF3JantHxXEJmxvkq8iJXirhxrZ/O4d+bV1nU9KhCfs8yUMwWEtQ97egyj3rXBy+
 KseszST5rP2rKiAgMQbVOu/XOaT4MkFGOE+KT7OiTdm6q/1d0d5tlCbCfst0Ihv4Eho7oezXh
 94rBavAPPbr1HtpdsLZGOqUE+7m52M9dHmxQSsdey4xaL2UM/kMgsQ/+xE8xsvQJx409a8VBu
 oHi6h2rIoDsMVm9Ynxc6QE5N+nuxggbaUuhBt4Ow/PTtaRWkK7MH7yCwpfOrawBLW/CTCIJAK
 BG+ytBpZCLVMCk0zbLypuHD2wqgyJ8udAoignq42MwIKJmdmBoO2kaLFMTe/WGr6BNwgDhIEM
 20lW14NRAvIcrq/bmIeLeyT9eGe8GORW4SVtuqFYyXue8ismouoPXyAx7ewdeZhKvhPlC97gw
 SoO49j0sRR+ojtFJPUdtopQ01V4r7vIiKDsHBcc6DBeyQqI515/VxVl0n2gTEM6iqDrhErjYh
 igP1sELoTYPWQhREddoszTq60/0YeSgaWJr7yNPfx3QVSRAha5hZdIreOKv+TDIZOkm0homed
 Ks0bxp9joXqwzav4ryAOyTRoTr/nwVMvrJDeAM7A8N6xpzzxQ8+q39tzdZ0ywvGYhKEzhaZf0
 i3GCLVqony8LJ3fgHdPYf3gDsytTukVp59dUepehu1W3Qf6F5PCFRM+obMC/+E7c4aOnQY72I
 r1nQ1XFoPVsuQaESOIXn46IOfbu8oB1Z1QNmuDF3ZRRRQ9ZWmtKmiCoDvfk4LRj+SR5Qn4wIJ
 WJNz/xyp7ysdprpKDGXkPz4pgSw=
Content-Transfer-Encoding: quoted-printable
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
Cc: linux-usb@vger.kernel.org, syzkaller-bugs@googlegroups.com,
 bernie@plugable.com,
 syzbot <syzbot+0e22d63dcebb802b9bc8@syzkaller.appspotmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

* Alan Stern <stern@rowland.harvard.edu>:
> On Thu, May 18, 2023 at 04:16:33PM +0200, Helge Deller wrote:
> > On 5/18/23 15:54, Alan Stern wrote:
> > > On Thu, May 18, 2023 at 09:34:24AM +0200, Helge Deller wrote:
> > > > I think this is an informational warning from the USB stack,
> > >
> > > It is not informational.  It is a warning that the caller has a bug.
> >
> > I'm not a USB expert, so I searched for such bug reports, and it seems
> > people sometimes faced this warning with different USB devices.
>
> Yes.
>
> > > You can't fix a bug by changing the line that reports it from dev_WA=
RN
> > > to printk!
> >
> > Of course this patch wasn't intended as "fix".
> > It was intended to see how the udlfb driver behaves in this situation,=
 e.g.
> > if the driver then crashes afterwards.
> >
> > Furthermore, why does usb_submit_urb() prints this WARNING and then co=
ntinues?
> > If it's a real bug, why doesn't it returns an error instead?
> > So, in principle I still think this warning is kind of informational,
> > which of course points to some kind of problem which should be fixed.
>
> Depending on the situation, the bug may or may not lead to an error.  At
> the time the dev_WARN was added, we were less careful about these sorts
> of checks; I did not want to cause previously working devices to stop
> working by failing the URB submission.

Fair enough.

> > > In this case it looks like dlfb_usb_probe() or one of the routines i=
t
> > > calls is wrong; it assumes that an endpoint has the expected type
> > > without checking.  More precisely, it thinks an endpoint is BULK whe=
n
> > > actually it is INTERRUPT.  That's what needs to be fixed.
> >
> > Maybe usb_submit_urb() should return an error so that drivers can
> > react on it, instead of adding the same kind of checks to all drivers?
>
> Feel free to submit a patch doing this.

As you wrote above, this may break other drivers too, so I'd leave that
discussion & decision to the USB maintainers (like you).

> But the checks should be added
> in any case; without them the drivers are simply wrong.

I pushed the hackish patch below through the syz tests which gives this lo=
g:
(see https://syzkaller.appspot.com/text?tag=3DCrashLog&x=3D160b7509280000)
[   77.559566][    T9] usb 1-1: Unable to get valid EDID from device/displ=
ay
[   77.587021][    T9] WARNING: BOGUS urb xfer, pipe 3 !=3D type 1 (fix dr=
iver to choose correct endpoint)
[   77.596448][    T9] usb 1-1: dlfb_urb_completion - nonzero write bulk s=
tatus received: -115
[   77.605308][    T9] usb 1-1: submit urb error: -22
[   77.613225][    T9] udlfb: probe of 1-1:0.52 failed with error -22

So, basically there is no urgent fix needed for the dlfb fbdev driver,
as it will gracefully fail as is (which is correct).

What do you suggest we should do with this syzkaller-bug ?
I'd rate it as false-alarm, but it will continue to complain because of
the dev_WARN() in urb.c

Helge
=2D--

From: Helge Deller <deller@gmx.de>
Date: Thu, 18 May 2023 19:03:56 +0200
Subject: [PATCH] fbdev: udlfb: check endpoint type, again

Temporary patch to anaylze syzbot regression:
https://syzkaller.appspot.com/bug?extid=3D0e22d63dcebb802b9bc8
It's not planned to apply as-is!

Fixes: aaf7dbe07385 ("video: fbdev: udlfb: properly check endpoint type")
Signed-off-by: Helge Deller <deller@gmx.de>

diff --git a/drivers/usb/core/urb.c b/drivers/usb/core/urb.c
index 9f3c54032556..bb889a1da3ef 100644
=2D-- a/drivers/usb/core/urb.c
+++ b/drivers/usb/core/urb.c
@@ -500,9 +500,12 @@ int usb_submit_urb(struct urb *urb, gfp_t mem_flags)
 	 */

 	/* Check that the pipe's type matches the endpoint's type */
-	if (usb_pipe_type_check(urb->dev, urb->pipe))
-		dev_WARN(&dev->dev, "BOGUS urb xfer, pipe %x !=3D type %x\n",
+	if (usb_pipe_type_check(urb->dev, urb->pipe)) {
+		/* temporarily use printk() instead of WARN() to fix bug in udlfb drive=
r */
+		printk("WARNING: BOGUS urb xfer, pipe %x !=3D type %x (fix driver to ch=
oose correct endpoint)\n",
 			usb_pipetype(urb->pipe), pipetypes[xfertype]);
+		return -EINVAL;
+	}

 	/* Check against a simple/standard policy */
 	allowed =3D (URB_NO_TRANSFER_DMA_MAP | URB_NO_INTERRUPT | URB_DIR_MASK |
diff --git a/drivers/video/fbdev/udlfb.c b/drivers/video/fbdev/udlfb.c
index 216d49c9d47e..5e56b2889c8c 100644
=2D-- a/drivers/video/fbdev/udlfb.c
+++ b/drivers/video/fbdev/udlfb.c
@@ -1667,8 +1667,9 @@ static int dlfb_usb_probe(struct usb_interface *intf=
,
 	usb_set_intfdata(intf, dlfb);

 	retval =3D usb_find_common_endpoints(intf->cur_altsetting, NULL, &out, N=
ULL, NULL);
-	if (retval) {
-		dev_err(&intf->dev, "Device should have at lease 1 bulk endpoint!\n");
+	if (retval || out =3D=3D NULL) {
+		retval =3D -ENODEV;
+		dev_err(&intf->dev, "Device should have at least one bulk endpoint!\n")=
;
 		goto error;
 	}

