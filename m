Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F116E585E92
	for <lists+dri-devel@lfdr.de>; Sun, 31 Jul 2022 12:55:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CF26E18BA48;
	Sun, 31 Jul 2022 10:55:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout.gmx.net (mout.gmx.net [212.227.17.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8E3FFBCC14
 for <dri-devel@lists.freedesktop.org>; Sun, 31 Jul 2022 10:54:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1659264890;
 bh=Uo/gJr9tPg/YDbLtn7ykCucdpVgwogtNjjvJCLlDUyM=;
 h=X-UI-Sender-Class:Date:From:To:Cc:Subject:References:In-Reply-To;
 b=aIcIDt5vkRrTwKfCKUxBb4siwhGIBwkxoXiQOQu5SRgcH9ZOseJWzmCioww64kQQR
 Sdnm0lRIOgXU2Q+3s0vPzXk3sh50CzqzMcBA/qE7kMqdcEibMHaZvOHD23RalNphCi
 wL+AkvMOJaCL0L17mxlHxjIqqDGkPGQu5d4wHDNk=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from p100 ([92.116.152.171]) by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MbAci-1nlEkT3PoW-00bf1V; Sun, 31
 Jul 2022 12:54:49 +0200
Date: Sun, 31 Jul 2022 12:54:48 +0200
From: Helge Deller <deller@gmx.de>
To: Khalid Masum <khalid.masum.92@gmail.com>
Subject: Re: [syzbot] KASAN: vmalloc-out-of-bounds Write in imageblit (2)
Message-ID: <YuZfeJm59UNrw6qE@p100>
References: <000000000000bbdd0405d120c155@google.com>
 <20220729065139.6529-1-khalid.masum.92@gmail.com>
 <eb4a26aa-da30-ceee-7d27-c1e902dd4218@gmx.de>
 <7c318150-a10e-e7d9-162f-cd5aaa49e616@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <7c318150-a10e-e7d9-162f-cd5aaa49e616@gmail.com>
X-Provags-ID: V03:K1:D9kG7E9X/gVkcc3chDvJXC4opQ0eIxj3WKG9z+YAdOsqCdKJF3j
 28X42T5Zp+gYgev8w2PRphdV9fj9kTmLm3Fa5kvbHwIElAS7psgn+7WUtbpTorl6Md5fnjp
 mQ/vKDU17L5oacJwN8G/iyep1JWY3FRYOjdtCbRDk9muozvS/yzaLFtPzgBTN2K0/OcbW/P
 /k/8xfSkGO52GkCuNJtaA==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:9yWgXvzMg/M=:5PfxS0EMhg+rG5ZjmLdzST
 j8lLgA3ruVj9NpH7SkZWWZEgItO2bMYeYB5mwT3QMi536smTEiUbq9QBaKggi3TNXNLQSDaXI
 u57rEyzOtxESa1hCxjuPAzWhr5rBs6VGqiz4UhY7159+dUzz7gyjBjsummWRtGlF17ZXPginR
 ih9y4xhmtnz9vDZMTugsKqLogDLAptFjR6wBbR6IsMUtkK14GdPyqzc9q9j8+Ao5NtvmmQvYS
 tFTBvYfiUApcfqEM5axMyM8c921Oz/k4YHubWOXUso6LS1OYgoZ+Gztzmq4eksfY5ilnIBtSF
 OIjh6Aihlqzvf4+umnmwI3ItxzwV7ZGGYweKfqgMvHlOb1l/m3+D9qpY+cZFWBar51WsmobTE
 OSnB+zAvIuWUPo9Gn6X57y/r3At0ejOLPPOMiBH5Lto56Pmp3FKxWzR+Ye7au3VRLtEuT1/Mv
 zxRMa3PmJYdwwAI9y0GN8giOPKbOLso6m5T8Qu+KSh+S4t7i7o4lqhsl3YyEbt3I0i7HZGLHa
 irQ6XSgAJRN5ARdsoDfQs88vuhNtLDiXmO/zr9SWXeIguJ3G2mfmchcLW5pVlUW8gjlVyv7Rs
 D+Mg2GvPnK+m1YXnh0sPYVJblEf7NvO2z346tvojm1VWsl3Ht2pmDJ8w78BdVH/vPkehi460/
 e9+CilzyVoKHoPoxWS0VOvrUBLZVN3lcZCBTA2vP0olHflyc6IjQw+7x2HxCptk3ZAqdHB9u6
 iBUllL4aud6Bbwcxopwy2fbwPwXO808Bhp4Y8ADd27QdGnTwemUD0xNmFfxSpJDxp6w1cNc1j
 zUB/4dRIEJYuCIGAPtSNQDEeT5OTLdlhY97ta0/U1+ldZ9BElTV4tBMc4wTzbIquguNSg5pKl
 0Ns8svRCBs8SH30ubSprhc4AxbOugrzHFBlH2pkS10eAC+lQhh/vVsGT5ck1DsFwJePOezzsP
 814nG9B4/bpNg5AVu2T3V3rjFdNpjCKjMiY68ykWjukqP8dcEJaK56khYxetCIs+CAj7rsgIP
 IFw4h8s/rIOfLcV7mp+ktzAN2tAaEJNyILvdRmCGopIC4yGjYbwD1KXwfLWaJYM5jBVhIRoe5
 c0k+B+RmX/JpjKZH91aj2CRCjHd5/2Fbi16OFXj/M83GjNvsps7HjxKLQ==
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
Cc: linux-fbdev@vger.kernel.org,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Helge Deller <deller@gmx.de>,
 syzkaller-bugs@googlegroups.com, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org,
 syzbot <syzbot+14b0e8f3fd1612e35350@syzkaller.appspotmail.com>,
 Jiri Slaby <jirislaby@kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

* Khalid Masum <khalid.masum.92@gmail.com>:
> On 7/30/22 23:25, Helge Deller wrote:
> > On 7/29/22 08:51, Khalid Masum wrote:
> > > Here is a simplified reproducer for the issue:
> > >
> > > https://gist.githubusercontent.com/Labnann/923d6b9b3a19848fc129637b8=
39b8a55/raw/a68271fcc724569735fe27f80817e561b3ff629a/reproducer.c
> >
> > The reproducer does this:
>
> Thanks for Looking into this. Being to this, so I have some questions.
> > ioctl(3, TIOCLINUX, TIOCL_SETSEL, selection: xs:3  ys:0  xe:0 ye:0 mod=
e:0)  =3D 0
>
> How did you find out the selection values? From strace and man pages I k=
now
> the third argument is an address.

Right. It's a pointer into userspace.
I simply added printk debug code to see what's happening.
I've attached that patch below.


> > -> sets the text selection area
> > ioctl(4, KDFONTOP)  with op=3D0 (con_font_set), charcount=3D512  width=
=3D8  height=3D32, 0x20000000) =3D 0
>
> Same here, It would be very helpful if you could tell me how.

See patch below.

> > -> changes the font size.
> >
> > It does not crash with current Linus' head (v5.19-rc8).
>
> I tested in 5.19-rc8 in Qemu x86_64 and it crashed for me.

That's strange, since I tested the same. Maybe I did something wrong.
Anyway, the patches I sent applies to all kernel versions.

> > Kernel v5.16, which was used by this KASAN report, hasn't received bac=
kports
> > since months, so I tried stable kernel v5.15.58 instead, and this
> > kernel crashed with the reproducer.
> >
> > The reproducer brings up two issues with current code:
> > 1. The reproducer uses ioctl(TIOCLINUX, TIOCL_SETSEL) and hands over (=
invalid)
> > zero-values for ys and ye for the starting lines.
> > This is wrong, since the API seems to expect a "1" as the very first l=
ine for the selection.
> > This can be easily fixed by adding checks for zero-values and return -=
EINVAL if found.
> >
> > But this bug isn't critical itself and is not the reason for the kerne=
l crash.
> > Without the checks, the ioctl handler simply wraps the coordinate valu=
es and converts them
> > from:
> > input selection: xs:3  ys:0  xe:0   ye:0  mode:0    to the new:
> > vc_selection =3D   xs:2  ys:23 xe:127 ye:23 mode:0
> > which is the current maximum coordinates for the screen.
> >
> > Those higher values now trigger issue #2:
> > After the TIOCL_SETSEL the last line on the screen is now selected. Th=
e KDFONTOP ioctl
> > then sets a 8x32 console font, and replaces the former 8x16 console fo=
nt.
> > With the bigger font the current screen selection is now outside the v=
isible screen
> > and this finally triggeres this backtrace, because vc_do_resize() call=
s clear_selection()
> > to unhighlight the selection (which starts to render chars outside of =
the screen):
>
> That makes sense.
>
> >   drm_fb_helper_sys_imageblit drivers/gpu/drm/drm_fb_helper.c:794 [inl=
ine]
> >   drm_fbdev_fb_imageblit+0x15c/0x350 drivers/gpu/drm/drm_fb_helper.c:2=
288
> >   bit_putcs_unaligned drivers/video/fbdev/core/bitblit.c:124 [inline]
> >   bit_putcs+0x6e1/0xd20 drivers/video/fbdev/core/bitblit.c:173
> >   fbcon_putcs+0x353/0x440 drivers/video/fbdev/core/fbcon.c:1277
> >   do_update_region+0x399/0x630 drivers/tty/vt/vt.c:676
> >   invert_screen+0x1d4/0x600 drivers/tty/vt/vt.c:800
> >   highlight drivers/tty/vt/selection.c:57 [inline]
> >   clear_selection drivers/tty/vt/selection.c:84 [inline]
> >   clear_selection+0x55/0x70 drivers/tty/vt/selection.c:80
> >   vc_do_resize+0xe6e/0x1180 drivers/tty/vt/vt.c:1257
> >
> > IMHO the easiest way to prevent this crash is to simply clear the
> > selection before the various con_font_set() console handlers are calle=
d.
> > Otherwise every console driver needs to add checks and verify if the c=
urrent
> > selection still fits with the selected font, which gets tricky because=
 some
> > of those drivers fiddle with the screen width&height before calling vc=
_do_resize().
> >
> > I'll follow up to this mail with patches for both issues shortly.
>
> I tested the patches. The crash no longer occurs with the reproducer.

Thanks for testing!
Maybe you want to reply to the patches with a Tested-by: tag?

Below is my debug code.

Helge


diff --git a/drivers/tty/vt/selection.c b/drivers/tty/vt/selection.c
index 58692a9b4097..0167b368a70f 100644
=2D-- a/drivers/tty/vt/selection.c
+++ b/drivers/tty/vt/selection.c
@@ -333,6 +333,7 @@ static int vc_selection(struct vc_data *vc, struct tio=
cl_selection *v,
 	v->ys =3D min_t(u16, v->ys - 1, vc->vc_rows - 1);
 	v->xe =3D min_t(u16, v->xe - 1, vc->vc_cols - 1);
 	v->ye =3D min_t(u16, v->ye - 1, vc->vc_rows - 1);
+	printk("vc_selection =3D   xs:%u  ys:%u  xe:%u ye:%u mode:%u\n", v->xs, =
v->ys, v->xe, v->ye, v->sel_mode);

 	if (mouse_reporting() && (v->sel_mode & TIOCL_SELMOUSEREPORT)) {
 		mouse_report(tty, v->sel_mode & TIOCL_SELBUTTONMASK, v->xs,
@@ -357,6 +358,7 @@ int set_selection_kernel(struct tiocl_selection *v, st=
ruct tty_struct *tty)
 {
 	int ret;

+	printk("tiocl_selection =3D   xs:%u  ys:%u  xe:%u ye:%u mode:%u\n", v->x=
s, v->ys, v->xe, v->ye, v->sel_mode);
 	mutex_lock(&vc_sel.lock);
 	console_lock();
 	ret =3D vc_selection(vc_cons[fg_console].d, v, tty);
diff --git a/drivers/tty/vt/vt.c b/drivers/tty/vt/vt.c
index 3f09205185a4..a0b4570c959a 100644
=2D-- a/drivers/tty/vt/vt.c
+++ b/drivers/tty/vt/vt.c
@@ -3194,6 +3194,8 @@ int tioclinux(struct tty_struct *tty, unsigned long =
arg)
 		return -EFAULT;
 	ret =3D 0;

+	printk("tioclinux: type =3D %d\n", type);  // TIOCL_SETSEL
+
 	switch (type)
 	{
 		case TIOCL_SETSEL:
@@ -4655,6 +4657,8 @@ static int con_font_set(struct vc_data *vc, struct c=
onsole_font_op *op)
 	if (IS_ERR(font.data))
 		return PTR_ERR(font.data);

+	pr_err("con_font_set   charcount %d   w:%d  h:%d\n", op->charcount, op->=
width, op->height);
+
 	font.charcount =3D op->charcount;
 	font.width =3D op->width;
 	font.height =3D op->height;
@@ -4709,6 +4713,7 @@ static int con_font_default(struct vc_data *vc, stru=
ct console_font_op *op)

 int con_font_op(struct vc_data *vc, struct console_font_op *op)
 {
+	pr_warn("con_font_op  op =3D %d\n", op->op);
 	switch (op->op) {
 	case KD_FONT_OP_SET:
 		return con_font_set(vc, op);
