Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 03213A33B34
	for <lists+dri-devel@lfdr.de>; Thu, 13 Feb 2025 10:27:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E124A10EA3C;
	Thu, 13 Feb 2025 09:27:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=3xo.fr header.i=@3xo.fr header.b="Z6A+DlfO";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.3xo.fr (mail.3xo.fr [212.129.21.66])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0043F10EA3C
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Feb 2025 09:27:34 +0000 (UTC)
Received: from localhost (mail.3xo.fr [212.129.21.66])
 by mail.3xo.fr (Postfix) with ESMTP id 9992C8D;
 Thu, 13 Feb 2025 10:27:33 +0100 (CET)
X-Virus-Scanned: Debian amavis at nxo2.3xo.fr
Received: from mail.3xo.fr ([212.129.21.66])
 by localhost (mail.3xo.fr [212.129.21.66]) (amavis, port 10024) with ESMTP
 id 7lvH9Cxf2RSb; Thu, 13 Feb 2025 10:27:30 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 mail.3xo.fr 07D568C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=3xo.fr; s=3xo;
 t=1739438850; bh=SrNHVHOPUBZCuYZ2tBHYPbn2IauTKO7yvN0++//Y0oA=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=Z6A+DlfOiELtaRyW+IkxZJdKlSSQSx7nfUYl/kofJR1n7jGsdGbY2A1ogGLXPnuFc
 V3Qbf7FdbMSzW1xqViDLOijj18ir8gzalIKII5RslIFRA7M1Qsov4uYyQ6kw//WYu9
 r2LqZmc8oPTmgjsu6woenr4f9pGl14qB/2N8Vav3aGzbcpwjqRlxKMzQWdI36moNCp
 nuj3ZLN8XkJwsL20cumh1QJcSUB4GHTEhsKR0ArRKAkuuYzlbjEmkd+TuwbhGEMPW2
 Tl6M6TP8Xl+Q+P0nNHGmpAHzuX818gFhdn5AMi6xhc8a1pF6owDwTpHHeBf9yUmw6T
 mLCiSts3dG0AQ==
Received: from mail.3xo.fr (mail.3xo.fr [212.129.21.66])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
 (No client certificate requested)
 by mail.3xo.fr (Postfix) with ESMTPSA id 07D568C;
 Thu, 13 Feb 2025 10:27:30 +0100 (CET)
MIME-Version: 1.0
Date: Thu, 13 Feb 2025 10:27:29 +0100
From: Nicolas Baranger <nicolas.baranger@3xo.fr>
To: Thomas Zimmermann <tzimmermann@suse.de>
Cc: dri-devel@lists.freedesktop.org, airlied@redhat.com, Jocelyn Falempe
 <jfalempe@redhat.com>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 linux-kernel@vger.kernel.org
Subject: Include ASPEED ast-drm 1.15.1 video driver in kernel tree
In-Reply-To: <b296bfef-1a9c-4452-baeb-09f86758addd@suse.de>
References: <d507f6268ea3158b5af82b6860ca7b71@3xo.fr>
 <194c4656963debcf074d87e89ab1a829@3xo.fr>
 <b296bfef-1a9c-4452-baeb-09f86758addd@suse.de>
Message-ID: <984c317de1027f5886390a65f1f66126@3xo.fr>
X-Sender: nicolas.baranger@3xo.fr
Content-Type: multipart/alternative;
 boundary="=_3e0cbcb59b0719a1c5c1c4ad90ac98b1"
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

--=_3e0cbcb59b0719a1c5c1c4ad90ac98b1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset=UTF-8;
 format=flowed



Dear Thomas

Thanks for answer and help.

Yes, due to .date total removal in linux 6.14 
(https://github.com/torvalds/linux/commit/cb2e1c2136f71618142557ceca3a8802e87a44cd) 
the last DKMS sources are :
https://xba.soartist.net/ast-drm_nba_20250211/nba-dkms/nba_last_src_20250212/src/

You can also find this sources in directory drivers/gpu/drm/ast_new of 
the tarball 
https://xba.soartist.net/ast-drm_nba_20250211/nba-kernel/linux-6.14.0.1-ast1.15.1-rc2_nba0_20250212.tar.gz

I'm surprised by the fact the in-kernel driver 0.1.0 is more advanced 
than Aspeed version 1.15.1 because on my system it has very poor 
rendering and is very slow, twinkle is high and had poor colors.
The screen flickering is high and it's like if I was using a very old 
cathode ray tube monitor (In fact I'm using a SAMSUNG LCD monitor which 
is perfectly functionnal and which display a nice and eyes confortable 
picture when using ast 1.15.1 driver or the video output of the Nvidia 
GPU ).

My testing system is a test Xeon server with an AST2400 BMC with its AST 
VGA card as the main video output (to be able to have a screen on the 
BMC KVM) +a discrete NVIDIA GPU I'm using for GPGPU and 3D rendering 
with Nvidia prime render offload.
What I constat with embed kernel driver 0.1.0 is that the Xeon processor 
is doing the video job for example when watching a video, and it's not 
the case with version 1.15.1 even when displaying on the AST VGA card a 
vulkan rotating cube (compute by nvidia GPU with nvidia prime but 
display by the AST VGA card of the AST2400).
Note that with in-kernel version 0.1.0 it's nearly impossible to make 
round the vulkan cube at more than half a round by  second where it's 
working (very) fine for a 32MB video memory card with version 1.15.1 as 
you can see in the video present in the online directory

I'm not developer or kernel developer so be sure that I wouldn't have 
done all this work if the in-kernel ast version 0.1.0 was usable 
out-of-the-box

Sure you can give me a patch I will test on this server (building 
mainline+ast_new yesterday tooks 19 minutes on this server)

PS:
here is a 'git diff linux-6.14.0.1-ast-rc2/drivers/gpu/drm/ast 
linux-6.14.0.1-ast-rc2/drivers/gpu/drm/ast_new'
https://xba.soartist.net/ast-drm_nba_20250211/nba-dump/ast-fullpatch.patch
Diff is about 250+ kb so the 2 drivers seems to have nothing to do with 
each others...

Thanks again for help

Kind regards
Nicolas

Le 2025-02-13 08:57, Thomas Zimmermann a écrit :

> Hi Nicolas
> 
> Am 12.02.25 um 19:58 schrieb Nicolas Baranger:
> 
>> Dear maintener
> 
> That's mostly me and Jocelyn.
> 
>> I did include ast-drm driver version 1.15.1 (in replacement of version 
>> 0.1.0) on the new mainline kernel too (6.14.0-rc2) and I issue a new 
>> dkms patch
>> 
>> Last DKMS patch had been sucessfully tested on mainline.
>> And last ast.ko version 1.15.1 included in linux tree had also been 
>> sucessfully tested
>> 
>> Online directory is updated with :
>> - new DKMS patch
>> - new DKMS srouces
>> - new DKMS debian package
>> - new tarball of mainline included ast_new ported in kernel tree
>> - new kernel debian package (mainline with ast_new)
>> 
>> NB: online directory is here: 
>> https://xba.soartist.net/ast-drm_nba_20250211/
>> 
>> Please let me know what I should do to see this change in linux-next
> 
> I'm having a little trouble with figuring out which of the many driver 
> sources is the relevant one. Am I correct to assume it's the one at
> 
> https://xba.soartist.net/ast-drm_nba_20250211/nba-dkms/nba_last_src_20250212/src/
> 
> About that driver: Although the official driver reports an ancient 
> version number, it is an up-to-date driver. It is actually more 
> up-to-date than Aspeed's package. Both drivers share source code and a 
> few years ago there was an effort to bring the kernel's driver up to 
> the same feature set. Since then, the kernel's driver has been updated, 
> reworked and improved.
> 
> About the performance: From what I can tell, the only significant 
> difference in these drivers is memory management. Your ast_new driver 
> uses an older algorithm that we replaced quite a few releases ago. The 
> old version was unreliable on systems with little video memory, so we 
> had to replace it.  I don't know why the new code should be slower 
> though.
> 
> If I give you a patch against a recent Linux kernel, are you capable of 
> building the patched kernel and testing that change on your system?
> 
> Best regards
> Thomas
> 
> Thanks for help
> 
> Kind regards
> Nicolas Baranger
> 
> Le 2025-02-11 19:15, Nicolas Baranger a écrit :
> 
> Dear maintener
> 
> For my own usage, I did make work the ASPEED ast-drm 1.15.1 video 
> driver on mainline kernel (6.13.0 + 6.13.1).
> 
> ASPEED video driver is availiable here:
> https://www.aspeedtech.com/file/support/Linux_DRM_1.15.1_4.tar.gz
> 
> But it only work for LTS kernel
> So I modify the DKMS package and I build a new Debian DKMS package with 
> the adapted  source.
> My patch can be find here :
> https://xba.soartist.net/ast-drm_nba_20250211/nba-dkms/astdiff.patch
> See the README:
> https://xba.soartist.net/ast-drm_nba_20250211/nba-dkms/README
> 
> Using this new 'ast 1.15.1' driver, performance are amazing compared to 
> the 'ast' driver include in kernel tree, specially when using a 
> discrete GPU and offloading VULKAN / 3D on it but using AST VGA card as 
> the main video card and as the main and only video output (the discrete 
> GPU is used only for offloading 3D or for cuda/opencl)
> 
> So to make things easier, I include the new 'ast 1.15.1' driver in 
> kernel tree as AST_NEW : linux-6.13.1-ast/drivers/gpu/drm/ast_new'
> It's working fine as you can see on this video :
> https://xba.soartist.net/ast-drm_nba_20250211/vulcan_nvidia_prime_render_offload_on_ast_vga_card.webm 
> I upload all the work I've done here :
> https://xba.soartist.net/ast-drm_nba_20250211/
> 
> See the global README :
> https://xba.soartist.net/ast-drm_nba_20250211/README
> 
> and the README in nba-kernel sub-directory :
> https://xba.soartist.net/ast-drm_nba_20250211/nba-kernel/README
> 
> I'm not a developer so please let me know if I made the things the 
> right way and if this new 'ast 1.15.1' driver can be ported to 
> linux-next or linux-? ?
> If you need more explanations, do not hesitate to contact me, I would 
> be happy to help
> 
> Kind regards
> Nicolas Baranger
--=_3e0cbcb59b0719a1c5c1c4ad90ac98b1
Content-Transfer-Encoding: quoted-printable
Content-Type: text/html; charset=UTF-8

<html><head><meta http-equiv=3D"Content-Type" content=3D"text/html; charset=
=3DUTF-8" /></head><body style=3D'font-size: 10pt; font-family: Verdana,Gen=
eva,sans-serif'>
<p>Dear Thomas<br /><br /></p>
<p>Thanks for answer and help.<br /><br />Yes, due to .date total removal i=
n linux 6.14 (<a href=3D"https://github.com/torvalds/linux/commit/cb2e1c213=
6f71618142557ceca3a8802e87a44cd">https://github.com/torvalds/linux/commit/c=
b2e1c2136f71618142557ceca3a8802e87a44cd</a>) the last DKMS sources are :&nb=
sp;<br /><span style=3D"white-space: nowrap;"><a href=3D"https://xba.soarti=
st.net/ast-drm_nba_20250211/nba-dkms/nba_last_src_20250212/src/" target=3D"=
_blank" rel=3D"noopener noreferrer">https://xba.soartist.net/ast-drm_nba_20=
250211/nba-dkms/nba_last_src_20250212/src/</a></span><br /><br /></p>
<p>You can also find this sources in directory drivers/gpu/drm/ast_new of t=
he tarball <a href=3D"https://xba.soartist.net/ast-drm_nba_20250211/nba-ker=
nel/linux-6.14.0.1-ast1.15.1-rc2_nba0_20250212.tar.gz">https://xba.soartist=
=2Enet/ast-drm_nba_20250211/nba-kernel/linux-6.14.0.1-ast1.15.1-rc2_nba0_20=
250212.tar.gz</a><br /><br /></p>
<p>I'm surprised by the fact the in-kernel driver 0.1.0 is more advanced th=
an Aspeed version 1.15.1 because on my system it has very poor rendering an=
d is very slow, twinkle is high and had poor colors.<br />The screen flicke=
ring is high and it's like if I was using a very old cathode ray tube monit=
or (In fact I'm using a SAMSUNG LCD monitor which is perfectly functionnal =
and which display a nice and eyes confortable picture when using ast 1.15.1=
 driver or the video output of the Nvidia GPU ).&nbsp;<br /><br /><br />My =
testing system is a test Xeon server with an AST2400 BMC with its AST VGA c=
ard as the main video output (to be able to have a screen on the BMC KVM) +=
a discrete NVIDIA GPU I'm using for GPGPU and 3D rendering with Nvidia prim=
e render offload.<br />What I constat with embed kernel driver 0.1.0 is tha=
t the Xeon processor is doing the video job for example when watching a vid=
eo, and it's not the case with version 1.15.1 even when displaying on the A=
ST VGA card a vulkan rotating cube (compute by nvidia GPU with nvidia prime=
 but display by the AST VGA card of the AST2400). <br />Note that with in-k=
ernel version 0.1.0 it's nearly impossible to make round the vulkan cube at=
 more than half a round by&nbsp; second where it's working (very) fine for =
a 32MB video memory card with version 1.15.1 as you can see in the video pr=
esent in the online directory&nbsp;<br /><br />I'm not developer or kernel =
developer so be sure that I wouldn't have done all this work if the in-kern=
el ast version 0.1.0 was usable out-of-the-box</p>
<p>Sure you can give me a patch I will test on this server (building mainli=
ne+ast_new yesterday tooks 19 minutes on this server)&nbsp;</p>
<p>PS:&nbsp;<br />here is a 'git diff linux-6.14.0.1-ast-rc2/drivers/gpu/dr=
m/ast linux-6.14.0.1-ast-rc2/drivers/gpu/drm/ast_new'<br /><a href=3D"https=
://xba.soartist.net/ast-drm_nba_20250211/nba-dump/ast-fullpatch.patch">http=
s://xba.soartist.net/ast-drm_nba_20250211/nba-dump/ast-fullpatch.patch</a><=
br />Diff is about 250+ kb so the 2 drivers seems to have nothing to do wit=
h each others...<br /><br /></p>
<p><span style=3D"font-size: 10pt;">Thanks again for help<br /><br />Kind r=
egards<br />Nicolas&nbsp;</span></p>
<p><br /></p>
<p id=3D"reply-intro">Le 2025-02-13 08:57, Thomas Zimmermann a &eacute;crit=
&nbsp;:</p>
<blockquote type=3D"cite" style=3D"padding: 0 0.4em; border-left: #1010ff 2=
px solid; margin: 0">
<div class=3D"pre" style=3D"margin: 0; padding: 0; font-family: monospace">=
<span style=3D"white-space: nowrap;">Hi&nbsp;Nicolas</span><br /><br /><spa=
n style=3D"white-space: nowrap;">Am&nbsp;12.02.25&nbsp;um&nbsp;19:58&nbsp;s=
chrieb&nbsp;Nicolas&nbsp;Baranger:</span>
<blockquote type=3D"cite" style=3D"padding: 0 0.4em; border-left: #1010ff 2=
px solid; margin: 0"><span style=3D"white-space: nowrap;">Dear&nbsp;mainten=
er</span></blockquote>
<br /><span style=3D"white-space: nowrap;">That's&nbsp;mostly&nbsp;me&nbsp;=
and&nbsp;Jocelyn.</span><br /><br />
<blockquote type=3D"cite" style=3D"padding: 0 0.4em; border-left: #1010ff 2=
px solid; margin: 0"><br />I did include ast-drm driver version 1.15.1 (in =
replacement of version 0.1.0) on the new mainline kernel too (6.14.0-rc2) a=
nd I issue a new dkms patch<br /><br /><span style=3D"white-space: nowrap;"=
>Last&nbsp;DKMS&nbsp;patch&nbsp;had&nbsp;been&nbsp;sucessfully&nbsp;tested&=
nbsp;on&nbsp;mainline.</span><br />And last ast.ko version&nbsp;1.15.1 incl=
uded in linux tree had also been sucessfully tested<br /><br /><span style=
=3D"white-space: nowrap;">Online&nbsp;directory&nbsp;is&nbsp;updated&nbsp;w=
ith&nbsp;:</span><br /><span style=3D"white-space: nowrap;">-&nbsp;new&nbsp=
;DKMS&nbsp;patch</span><br /><span style=3D"white-space: nowrap;">-&nbsp;ne=
w&nbsp;DKMS&nbsp;srouces</span><br /><span style=3D"white-space: nowrap;">-=
&nbsp;new&nbsp;DKMS&nbsp;debian&nbsp;package</span><br /><span style=3D"whi=
te-space: nowrap;">-&nbsp;new&nbsp;tarball&nbsp;of&nbsp;mainline&nbsp;inclu=
ded&nbsp;ast_new&nbsp;ported&nbsp;in&nbsp;kernel&nbsp;tree</span><br /><spa=
n style=3D"white-space: nowrap;">-&nbsp;new&nbsp;kernel&nbsp;debian&nbsp;pa=
ckage&nbsp;(mainline&nbsp;with&nbsp;ast_new)</span><br /><br /><br />NB: on=
line directory is here: <a href=3D"https://xba.soartist.net/ast-drm_nba_202=
50211/" target=3D"_blank" rel=3D"noopener noreferrer">https://xba.soartist.=
net/ast-drm_nba_20250211/</a><br /><br /><span style=3D"white-space: nowrap=
;">Please&nbsp;let&nbsp;me&nbsp;know&nbsp;what&nbsp;I&nbsp;should&nbsp;do&n=
bsp;to&nbsp;see&nbsp;this&nbsp;change&nbsp;in&nbsp;linux-next</span></block=
quote>
<br />I'm having a little trouble with figuring out which of the many drive=
r sources is the relevant one. Am I correct to assume it's the one at<br />=
<br /><span style=3D"white-space: nowrap;"><a href=3D"https://xba.soartist.=
net/ast-drm_nba_20250211/nba-dkms/nba_last_src_20250212/src/" target=3D"_bl=
ank" rel=3D"noopener noreferrer">https://xba.soartist.net/ast-drm_nba_20250=
211/nba-dkms/nba_last_src_20250212/src/</a></span><br /><br /><br />About t=
hat driver: Although the official driver reports an ancient version number,=
 it is an up-to-date driver. It is actually more up-to-date than Aspeed's p=
ackage. Both drivers share source code and a few years ago there was an eff=
ort to bring the kernel's driver up to the same feature set. Since then, th=
e kernel's driver has been updated, reworked and improved.<br /><br />About=
 the performance: From what I can tell, the only significant difference in =
these drivers is memory management. Your ast_new driver uses an older algor=
ithm that we replaced quite a few releases ago. The old version was unrelia=
ble on systems with little video memory, so we had to replace it.&nbsp; I d=
on't know why the new code should be slower though.<br /><br />If I give yo=
u a patch against a recent Linux kernel, are you capable of building the pa=
tched kernel and testing that change on your system?<br /><br /><span style=
=3D"white-space: nowrap;">Best&nbsp;regards</span><br />Thomas<br /><br /><=
br />
<blockquote type=3D"cite" style=3D"padding: 0 0.4em; border-left: #1010ff 2=
px solid; margin: 0"><br /><span style=3D"white-space: nowrap;">Thanks&nbsp=
;for&nbsp;help</span><br /><br /><span style=3D"white-space: nowrap;">Kind&=
nbsp;regards</span><br /><span style=3D"white-space: nowrap;">Nicolas&nbsp;=
Baranger</span><br /><br /><br /><span style=3D"white-space: nowrap;">Le&nb=
sp;2025-02-11&nbsp;19:15,&nbsp;Nicolas&nbsp;Baranger&nbsp;a&nbsp;&eacute;cr=
it&nbsp;:</span><br /><br />
<blockquote type=3D"cite" style=3D"padding: 0 0.4em; border-left: #1010ff 2=
px solid; margin: 0"><span style=3D"white-space: nowrap;">Dear&nbsp;mainten=
er</span><br /><br />For my own usage, I did make work the ASPEED ast-drm 1=
=2E15.1 video driver on mainline kernel (6.13.0 + 6.13.1).<br /><br /><span=
 style=3D"white-space: nowrap;">ASPEED&nbsp;video&nbsp;driver&nbsp;is&nbsp;=
availiable&nbsp;here:</span><br /><span style=3D"white-space: nowrap;"><a h=
ref=3D"https://www.aspeedtech.com/file/support/Linux_DRM_1.15.1_4.tar.gz" t=
arget=3D"_blank" rel=3D"noopener noreferrer">https://www.aspeedtech.com/fil=
e/support/Linux_DRM_1.15.1_4.tar.gz</a></span><br /><br /><span style=3D"wh=
ite-space: nowrap;">But&nbsp;it&nbsp;only&nbsp;work&nbsp;for&nbsp;LTS&nbsp;=
kernel</span><br />So I modify the DKMS package and I build a new Debian DK=
MS package with the adapted&nbsp; source.<br /><span style=3D"white-space: =
nowrap;">My&nbsp;patch&nbsp;can&nbsp;be&nbsp;find&nbsp;here&nbsp;:</span><b=
r /><span style=3D"white-space: nowrap;"><a href=3D"https://xba.soartist.ne=
t/ast-drm_nba_20250211/nba-dkms/astdiff.patch" target=3D"_blank" rel=3D"noo=
pener noreferrer">https://xba.soartist.net/ast-drm_nba_20250211/nba-dkms/as=
tdiff.patch</a></span><br /><span style=3D"white-space: nowrap;">See&nbsp;t=
he&nbsp;README:</span><br /><span style=3D"white-space: nowrap;"><a href=3D=
"https://xba.soartist.net/ast-drm_nba_20250211/nba-dkms/README" target=3D"_=
blank" rel=3D"noopener noreferrer">https://xba.soartist.net/ast-drm_nba_202=
50211/nba-dkms/README</a></span><br /><br />Using this new 'ast 1.15.1' dri=
ver, performance are amazing compared to the 'ast' driver include in kernel=
 tree, specially when using a discrete GPU and offloading VULKAN / 3D on it=
 but using AST VGA card as the main video card and as the main and only vid=
eo output (the discrete GPU is used only for offloading 3D or for cuda/open=
cl)<br /><br />So to make things easier, I include the new 'ast 1.15.1' dri=
ver in kernel tree as AST_NEW : linux-6.13.1-ast/drivers/gpu/drm/ast_new'<b=
r /><span style=3D"white-space: nowrap;">It's&nbsp;working&nbsp;fine&nbsp;a=
s&nbsp;you&nbsp;can&nbsp;see&nbsp;on&nbsp;this&nbsp;video&nbsp;:</span><br =
/><a href=3D"https://xba.soartist.net/ast-drm_nba_20250211/vulcan_nvidia_pr=
ime_render_offload_on_ast_vga_card.webm" target=3D"_blank" rel=3D"noopener =
noreferrer">https://xba.soartist.net/ast-drm_nba_20250211/vulcan_nvidia_pri=
me_render_offload_on_ast_vga_card.webm</a> I upload all the work I've done =
here :<br /><span style=3D"white-space: nowrap;"><a href=3D"https://xba.soa=
rtist.net/ast-drm_nba_20250211/" target=3D"_blank" rel=3D"noopener noreferr=
er">https://xba.soartist.net/ast-drm_nba_20250211/</a></span><br /><br /><s=
pan style=3D"white-space: nowrap;">See&nbsp;the&nbsp;global&nbsp;README&nbs=
p;:</span><br /><span style=3D"white-space: nowrap;"><a href=3D"https://xba=
=2Esoartist.net/ast-drm_nba_20250211/README" target=3D"_blank" rel=3D"noope=
ner noreferrer">https://xba.soartist.net/ast-drm_nba_20250211/README</a></s=
pan><br /><br /><span style=3D"white-space: nowrap;">and&nbsp;the&nbsp;READ=
ME&nbsp;in&nbsp;nba-kernel&nbsp;sub-directory&nbsp;:</span><br /><span styl=
e=3D"white-space: nowrap;"><a href=3D"https://xba.soartist.net/ast-drm_nba_=
20250211/nba-kernel/README" target=3D"_blank" rel=3D"noopener noreferrer">h=
ttps://xba.soartist.net/ast-drm_nba_20250211/nba-kernel/README</a></span><b=
r /><br />I'm not a developer so please let me know if I made the things th=
e right way and if this new 'ast 1.15.1' driver can be ported to linux-next=
 or linux-? ?<br />If you need more explanations, do not hesitate to contac=
t me, I would be happy to help<br /><br /><span style=3D"white-space: nowra=
p;">Kind&nbsp;regards</span><br /><span style=3D"white-space: nowrap;">Nico=
las&nbsp;Baranger</span></blockquote>
</blockquote>
</div>
</blockquote>
</body></html>

--=_3e0cbcb59b0719a1c5c1c4ad90ac98b1--
